"""Lift SB.EXE into readable pseudo-BASIC.

Sorcerer's Bane is a compiled Microsoft BASIC executable. This does not
recover the original source. It decodes each compiled procedure, resolves
string literals, and rewrites file operations into OPEN/GET/CLOSE lines.
"""
from __future__ import annotations

import re
import struct
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path

DGROUP = 0x32DA0
FRAME_CALL = bytes.fromhex("9ab3673227")
OPEN_RT = (0x2732, 0x1826)
GET_RT = (0x2732, 0x02C4)
CLOSE_RT = (0x2732, 0x196D)
FILE_AH4_RT = (0x2732, 0x023F)
PROC_EXIT_RT = (0x2732, 0x6788)

RUNTIME_NAMES = {
    OPEN_RT: "open_random",
    GET_RT: "get_record",
    CLOSE_RT: "close_files",
    FILE_AH4_RT: "file_ah4",
    PROC_EXIT_RT: "proc_exit",
    (0x2732, 0x67B3): "frame_enter",
    (0x2732, 0x64E2): "free_string",
    (0x2732, 0x2592): "array_element",
    (0x2732, 0x2650): "erase_array",
}

# Image addresses of procedures whose job is now known.
PROC_ALIAS = {
    0x21DEA: "locate_print",
    0x21DB9: "print_more",
    0x25283: "color",
    0x225B8: "menu_choice",
}

ASSIGN_CALLS = ("near_09D83", "near_00033", "near_127A3", "near_1A683")
CONCAT_CALLS = ("near_09D91", "near_0003B", "near_127AB", "near_1A68B")

PREFIXES = {0xF0, 0xF2, 0xF3, 0x2E, 0x36, 0x3E, 0x26, 0x64, 0x65}


class DecodeError(Exception):
    pass


def repo_root() -> Path:
    return Path(__file__).resolve().parent.parent


def load_image(path: Path | None = None) -> bytes:
    exe = path or (repo_root() / "SB.EXE")
    data = exe.read_bytes()
    fields = struct.unpack_from("<2sHHHHHHHHHHHH", data, 0)
    if fields[0] != b"MZ":
        raise ValueError(f"{exe} is not an MZ executable")
    header = fields[4] * 16
    return data[header:]


def extract_descriptors(image: bytes) -> dict[int, str]:
    """QB string descriptors stored as length, near pointer, then characters."""
    descs: dict[int, str] = {}
    end = len(image)
    i = DGROUP
    while i + 6 <= end:
        length, ptr = struct.unpack_from("<HH", image, i)
        if 2 <= length <= 120 and DGROUP + ptr == i + 4:
            raw = image[i + 4 : i + 4 + length]
            if all(32 <= b < 127 for b in raw):
                descs[i - DGROUP] = raw.decode("ascii")
                i += 4 + length
                continue
        i += 1
    return descs


def find_procedures(image: bytes) -> list[tuple[int, int]]:
    """Return (address, local_bytes) for every compiled procedure prologue."""
    found: list[tuple[int, int]] = []
    start = 0
    while True:
        at = image.find(FRAME_CALL, start)
        if at < 0:
            break
        if at >= 3 and image[at - 3] == 0xB9:
            locals_n = struct.unpack_from("<H", image, at - 2)[0]
            found.append((at - 3, locals_n))
        start = at + 1
    return found


def _modrm_disp(modrm: int) -> int:
    mod = modrm >> 6
    rm = modrm & 7
    if mod == 1:
        return 1
    if mod == 2 or (mod == 0 and rm == 6):
        return 2
    return 0


def _fpu_len(code: bytes, ip: int) -> int:
    """Length of one real 8087 instruction starting at opcode D8-DF."""
    op = code[ip]
    if not 0xD8 <= op <= 0xDF:
        raise DecodeError(f"expected 8087 opcode at {ip:#x}, got {op:#x}")
    modrm = code[ip + 1]
    return 2 + _modrm_disp(modrm)


def insn_len(code: bytes, ip: int) -> tuple[int, str | None]:
    """Return (length, note). Note is set for emulator/event opcodes."""
    if ip >= len(code):
        raise DecodeError("truncated")
    b0 = code[ip]
    if b0 == 0xCD and ip + 1 < len(code):
        which = code[ip + 1]
        if 0x34 <= which <= 0x3B:
            modrm = code[ip + 2]
            return 3 + _modrm_disp(modrm), f"float_{which - 0x34 + 0xD8:02X}"
        if which == 0x3D:
            return 2, "event_check"
        if which == 0x3C:
            return 2 + _fpu_len(code, ip + 2), "float_hw"

    start = ip
    while code[ip] in PREFIXES:
        ip += 1
        if ip >= len(code):
            raise DecodeError("truncated prefix")
    if code[ip] in (0x66, 0x67):
        raise DecodeError(f"operand-size prefix at {start:#x}")

    op = code[ip]
    ip += 1

    def need(n: int) -> None:
        if ip + n > len(code):
            raise DecodeError(f"truncated opcode {op:#x} at {start:#x}")

    def modrm_end() -> int:
        need(1)
        modrm = code[ip]
        return ip + 1 + _modrm_disp(modrm)

    # 8086 immediates with no ModRM.
    imm8 = {0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x6A, 0xA8, 0xCD, 0xE4, 0xE5, 0xE6, 0xE7, 0xEB, 0xD4, 0xD5}
    imm8 |= set(range(0x70, 0x80)) | set(range(0xE0, 0xE4)) | set(range(0xB0, 0xB8))
    imm16 = {0x05, 0x0D, 0x15, 0x1D, 0x25, 0x2D, 0x35, 0x3D, 0x68, 0xA0, 0xA1, 0xA2, 0xA3, 0xA9, 0xC2, 0xCA, 0xE8, 0xE9}
    imm16 |= set(range(0xB8, 0xC0))
    one = {
        0x06, 0x07, 0x0E, 0x16, 0x17, 0x1E, 0x1F, 0x27, 0x2F, 0x37, 0x3F, 0x90, 0x98, 0x99, 0x9B, 0x9C, 0x9D, 0x9E, 0x9F,
        0xA4, 0xA5, 0xA6, 0xA7, 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF, 0xC3, 0xC9, 0xCB, 0xCC, 0xCE, 0xCF, 0xD7, 0xEC, 0xED,
        0xEE, 0xEF, 0xF4, 0xF5, 0xF8, 0xF9, 0xFA, 0xFB, 0xFC, 0xFD, 0xF0,
    }
    one |= set(range(0x40, 0x60)) | set(range(0x91, 0x98)) | {0x60, 0x61}

    if op == 0x0F:
        need(1)
        op2 = code[ip]
        if 0x80 <= op2 <= 0x8F:
            return (ip + 3) - start, None
        raise DecodeError(f"unknown 0F {op2:#x} at {start:#x}")
    if op in one:
        return ip - start, None
    if op in imm8:
        return ip + 1 - start, None
    if op in imm16:
        return ip + 2 - start, None
    if op in (0x9A, 0xEA):
        return ip + 4 - start, None
    if op == 0xC8:
        return ip + 3 - start, None

    modrm_ops = set(range(0x00, 0x04)) | set(range(0x08, 0x0C)) | set(range(0x10, 0x14))
    modrm_ops |= set(range(0x18, 0x1C)) | set(range(0x20, 0x24)) | set(range(0x28, 0x2C))
    modrm_ops |= set(range(0x30, 0x34)) | set(range(0x38, 0x3C))
    modrm_ops |= {0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E, 0x8F, 0xC4, 0xC5}
    modrm_ops |= {0xD0, 0xD1, 0xD2, 0xD3, 0xFE, 0xFF, 0x8F}
    if op in modrm_ops:
        return modrm_end() - start, None
    if op in (0x80, 0x82, 0x83, 0xC0, 0xC1, 0xC6, 0x6B):
        end_m = modrm_end()
        return end_m + 1 - start, None
    if op in (0x81, 0xC7, 0x69):
        end_m = modrm_end()
        return end_m + 2 - start, None
    if op in (0xF6, 0xF7):
        need(1)
        modrm = code[ip]
        end_m = modrm_end()
        reg = (modrm >> 3) & 7
        extra = 0
        if reg in (0, 1):
            extra = 1 if op == 0xF6 else 2
        return end_m + extra - start, None
    raise DecodeError(f"unknown opcode {op:#x} at {start:#x}")


@dataclass
class Insn:
    addr: int
    mnem: str
    args: str
    text: str


def walk_span(image: bytes, start: int, end: int) -> tuple[dict[int, tuple[int, str]], int, str | None]:
    specials: dict[int, tuple[int, str]] = {}
    ip = start
    try:
        while ip < end:
            length, note = insn_len(image, ip)
            if ip + length > end:
                raise DecodeError(f"instruction runs past {end:#x}")
            if note:
                specials[ip] = (length, note)
            ip += length
    except DecodeError as exc:
        return specials, ip, str(exc)
    return specials, ip, None


def disassemble(blob: bytes, origin: int) -> list[Insn]:
    ndisasm = "ndisasm"
    with tempfile.NamedTemporaryFile(delete=False, suffix=".bin") as handle:
        handle.write(blob)
        temp_name = handle.name
    try:
        result = subprocess.run(
            [ndisasm, "-b", "16", "-o", f"0x{origin:x}", temp_name],
            check=True,
            capture_output=True,
        )
    finally:
        Path(temp_name).unlink(missing_ok=True)
    text = result.stdout.decode("ascii", errors="replace")
    rows: list[Insn] = []
    for line in text.splitlines():
        match = re.match(r"^([0-9A-Fa-f]+)\s+[0-9A-Fa-f]+\s+(\S+)(?:\s+(.*))?$", line.strip())
        if not match:
            continue
        addr = int(match.group(1), 16)
        mnem = match.group(2).lower()
        args = (match.group(3) or "").strip()
        rows.append(Insn(addr, mnem, args, f"{mnem} {args}".strip()))
    return rows


def _basic_string(text: str) -> str:
    return '"' + text.replace('"', '""') + '"'


def fmt_operand(operand: str, descs: dict[int, str]) -> str:
    token = operand.strip()
    token = re.sub(r"^(?:byte|word|dword)\s+", "", token)
    hex_match = re.fullmatch(r"\+?0x([0-9a-fA-F]+)", token)
    if hex_match:
        value = int(hex_match.group(1), 16) & 0xFFFF
        if value in descs:
            return _basic_string(descs[value])
        if value <= 999:
            return str(value)
        return f"&H{value:X}"
    mem = re.fullmatch(r"\[(.+)\]", token)
    if not mem:
        return token
    body = mem.group(1).lower()
    local = re.fullmatch(r"bp-0x([0-9a-f]+)", body)
    if local:
        return f"local_{int(local.group(1), 16):X}"
    arg = re.fullmatch(r"bp\+0x([0-9a-f]+)", body)
    if arg:
        return f"arg_{int(arg.group(1), 16):X}"
    absolute = re.fullmatch(r"0x([0-9a-f]+)", body)
    if absolute:
        value = int(absolute.group(1), 16)
        if value in descs:
            return _basic_string(descs[value])
        return f"var_{value:04X}"
    indexed = re.fullmatch(r"si\+0x([0-9a-f]+)", body)
    if indexed:
        return f"var_{int(indexed.group(1), 16):04X}[si]"
    return token


def parse_far_target(args: str) -> tuple[int, int] | None:
    match = re.search(r"0x([0-9a-fA-F]+):word\s+0x([0-9a-fA-F]+)", args)
    if not match:
        return None
    return int(match.group(1), 16), int(match.group(2), 16)


def retf_bytes(image: bytes, target: tuple[int, int], cache: dict[tuple[int, int], int | None]) -> int | None:
    if target in cache:
        return cache[target]
    seg, off = target
    ip = seg * 16 + off
    if not 0 <= ip < len(image):
        cache[target] = None
        return None
    seen: set[int] = set()
    steps = 0
    found: int | None = None
    while steps < 80 and ip not in seen and 0 <= ip < len(image):
        seen.add(ip)
        steps += 1
        try:
            length, note = insn_len(image, ip)
        except DecodeError:
            break
        if note:
            ip += length
            continue
        op = image[ip]
        if op == 0xCB:
            found = 0
            break
        if op == 0xCA:
            found = struct.unpack_from("<H", image, ip + 1)[0]
            break
        if op == 0xC3:
            found = 0
            break
        if op == 0xEB:
            rel = struct.unpack_from("<b", image, ip + 1)[0]
            ip = ip + 2 + rel
            continue
        if op == 0xE9:
            rel = struct.unpack_from("<h", image, ip + 1)[0]
            ip = ip + 3 + rel
            continue
        ip += length
    cache[target] = found
    return found


def _split_args(args: str) -> list[str]:
    parts: list[str] = []
    buf = []
    depth = 0
    for ch in args:
        if ch == "[":
            depth += 1
        elif ch == "]":
            depth -= 1
        if ch == "," and depth == 0:
            parts.append("".join(buf).strip())
            buf = []
        else:
            buf.append(ch)
    if buf:
        parts.append("".join(buf).strip())
    return [p for p in parts if p]


def _cmp_condition(mnem: str, left: str, right: str) -> str:
    table = {
        "je": "==",
        "jz": "==",
        "jne": "<>",
        "jnz": "<>",
        "jl": "<",
        "jnge": "<",
        "jle": "<=",
        "jng": "<=",
        "jg": ">",
        "jnle": ">",
        "jge": ">=",
        "jnl": ">=",
        "jb": "<",
        "jnae": "<",
        "jbe": "<=",
        "jna": "<=",
        "ja": ">",
        "jnbe": ">",
        "jae": ">=",
        "jnb": ">=",
    }
    op = table.get(mnem)
    if op is None or left is None:
        return mnem
    return f"{left} {op} {right}"


def _is_reg(name: str) -> bool:
    return name.lower() in {"ax", "bx", "cx", "dx", "si", "di", "bp", "sp", "al", "ah", "bl", "bh", "cl", "ch", "dl", "dh", "es", "ds", "cs", "ss"}


def render_procedure(
    image: bytes,
    insns: list[Insn],
    specials: dict[int, tuple[int, str]],
    descs: dict[int, str],
    proc_at: dict[int, str],
    ret_cache: dict[tuple[int, int], int | None],
    stopped: str | None,
) -> list[str]:
    lines: list[str] = []
    labels = {insn.addr for insn in insns if insn.mnem.startswith("j") or insn.mnem in {"jmp", "loop", "loope", "loopne"}}
    # ndisasm already resolved jump targets into the operand.
    targets: set[int] = set()
    for insn in insns:
        if insn.mnem.startswith("j") or insn.mnem in {"jmp", "loop", "loope", "loopne"}:
            match = re.search(r"0x([0-9a-fA-F]+)", insn.args)
            if match:
                targets.add(int(match.group(1), 16))

    ax: str | None = None
    last_cmp: tuple[str, str] | None = None
    pushes: list[str] = []
    skip_until = -1

    def flush_pushes() -> None:
        nonlocal pushes
        for item in pushes:
            lines.append(f"    PUSH {item}")
        pushes = []

    def emit_call(target: tuple[int, int] | None, near_addr: int | None, word_argc: int | None) -> None:
        nonlocal pushes
        logical = list(pushes)
        if target == OPEN_RT and len(logical) >= 4:
            use = logical[-4:]
            leftover = logical[:-4]
        elif target == GET_RT and len(logical) >= 4:
            use = logical[-4:]
            leftover = logical[:-4]
        elif target == CLOSE_RT and len(logical) >= 2:
            use = logical[-2:]
            leftover = logical[:-2]
        elif word_argc is not None and word_argc % 2 == 0:
            words = word_argc // 2
            if words == 0:
                use = []
                leftover = logical
            elif len(logical) >= words:
                use = logical[-words:]
                leftover = logical[:-words]
            else:
                use = logical
                leftover = []
        else:
            use = logical
            leftover = []
        for item in leftover:
            lines.append(f"    PUSH {item}")
        pushes = []
        if target == OPEN_RT and len(use) == 4:
            name, number, reclen, _mode = use
            lines.append(f"    OPEN {name} FOR RANDOM AS #{number} LEN = {reclen}")
            return
        if target == GET_RT and len(use) == 4:
            file_n, record, buf, length = use
            lines.append(f"    GET #{file_n}, {record}, {buf} LEN = {length}")
            return
        if target == CLOSE_RT and len(use) >= 2:
            lines.append("    CLOSE " + ", ".join(f"#{n}" for n in use[:-1]))
            return
        if target == PROC_EXIT_RT and not use:
            lines.append("    PROC_EXIT")
            return
        if near_addr is not None and near_addr in proc_at:
            name = proc_at[near_addr]
            lines.append(f"    CALL {name}({', '.join(use)})")
            return
        if target is not None:
            image_at = target[0] * 16 + target[1]
            if image_at in proc_at:
                lines.append(f"    CALL {proc_at[image_at]}({', '.join(use)})")
                return
            rt_name = RUNTIME_NAMES.get(target, f"RT_{target[0]:04X}_{target[1]:04X}")
            lines.append(f"    CALL {rt_name}({', '.join(use)})")
            return
        lines.append(f"    CALL near_{near_addr:05X}({', '.join(use)})" if near_addr is not None else "    CALL ?()")

    i = 0
    while i < len(insns):
        insn = insns[i]
        if insn.addr < skip_until:
            i += 1
            continue
        if insn.addr in targets:
            flush_pushes()
            lines.append(f"  label_{insn.addr:05X}:")
        spec = specials.get(insn.addr)
        if spec and insn.mnem == "nop":
            _length, note = spec
            if note != "event_check":
                lines.append(f"    ' {note}")
            skip_until = insn.addr + spec[0]
            i += 1
            continue

        parts = _split_args(insn.args)
        mnem = insn.mnem

        # mov bx, imm / push ds / pop es / push es / push bx  → one buffer pointer
        if (
            mnem == "mov"
            and len(parts) == 2
            and parts[0].lower() == "bx"
            and i + 4 < len(insns)
            and insns[i + 1].text == "push ds"
            and insns[i + 2].text == "pop es"
            and insns[i + 3].text == "push es"
            and insns[i + 4].text == "push bx"
        ):
            pushes.append(f"buffer({fmt_operand(parts[1], descs)})")
            i += 5
            continue

        if mnem == "mov" and len(parts) == 2 and parts[0].lower() == "ax":
            nxt = insns[i + 1] if i + 1 < len(insns) else None
            if nxt and nxt.mnem == "push" and nxt.args.lower() == "ax":
                ax = fmt_operand(parts[1], descs)
                pushes.append(ax)
                i += 2
                continue
            if (
                nxt
                and nxt.mnem == "cwd"
                and i + 3 < len(insns)
                and insns[i + 2].text == "push dx"
                and insns[i + 3].text == "push ax"
            ):
                ax = fmt_operand(parts[1], descs)
                pushes.append(f"long({ax})")
                i += 4
                continue
            ax = fmt_operand(parts[1], descs)
            lines.append(f"    ax = {ax}")
            i += 1
            continue

        if mnem == "lea" and len(parts) == 2:
            rendered = f"addr({fmt_operand(parts[1], descs)})"
            reg = parts[0].lower()
            nxt = insns[i + 1] if i + 1 < len(insns) else None
            if reg == "ax" and nxt and nxt.mnem == "push" and nxt.args.lower() == "ax":
                pushes.append(rendered)
                ax = rendered
                i += 2
                continue
            if reg == "ax":
                ax = rendered
            lines.append(f"    {reg} = {rendered}")
            i += 1
            continue

        if mnem == "push":
            src = parts[0].lower() if parts else insn.args.lower()
            if src == "ax" and ax is not None:
                pushes.append(ax)
            elif src in {"ds", "es", "cs", "ss", "dx", "bx", "cx", "si", "di"}:
                pushes.append(src.upper())
            else:
                pushes.append(fmt_operand(insn.args, descs))
            i += 1
            continue

        if mnem == "pop":
            flush_pushes()
            i += 1
            continue

        if mnem == "cmp" and len(parts) == 2:
            last_cmp = (fmt_operand(parts[0], descs), fmt_operand(parts[1], descs))
            i += 1
            continue

        if mnem in {"jmp", "je", "jz", "jne", "jnz", "jl", "jle", "jg", "jge", "jb", "jbe", "ja", "jae", "jnge", "jng", "jnle", "jnl", "jnae", "jna", "jnbe", "jnb", "js", "jns", "jo", "jno", "loop"}:
            flush_pushes()
            match = re.search(r"0x([0-9a-fA-F]+)", insn.args)
            dest = f"label_{int(match.group(1), 16):05X}" if match else insn.args
            if mnem == "jmp":
                lines.append(f"    GOTO {dest}")
            else:
                left, right = last_cmp if last_cmp else ("?", "?")
                lines.append(f"    IF {_cmp_condition(mnem, left, right)} THEN GOTO {dest}")
            i += 1
            continue

        if mnem == "call":
            far = parse_far_target(insn.args)
            near = None
            if far is None:
                match = re.search(r"0x([0-9a-fA-F]+)", insn.args)
                if match:
                    near = int(match.group(1), 16)
            words = None
            if far is not None:
                popped = retf_bytes(image, far, ret_cache)
                words = None if popped is None else popped // 2
            emit_call(far, near, None if words is None else words * 2)
            i += 1
            continue

        if mnem in {"ret", "retf"}:
            flush_pushes()
            lines.append("    RETURN")
            i += 1
            continue

        if mnem in {"inc", "dec", "add", "sub", "shl", "shr", "neg", "not"} and parts:
            dest = fmt_operand(parts[0], descs)
            if mnem == "inc":
                lines.append(f"    {dest} = {dest} + 1")
            elif mnem == "dec":
                lines.append(f"    {dest} = {dest} - 1")
            elif mnem == "add" and len(parts) == 2:
                lines.append(f"    {dest} = {dest} + {fmt_operand(parts[1], descs)}")
            elif mnem == "sub" and len(parts) == 2:
                lines.append(f"    {dest} = {dest} - {fmt_operand(parts[1], descs)}")
            elif mnem == "shl":
                lines.append(f"    {dest} = {dest} * 2")
            elif mnem == "neg":
                lines.append(f"    {dest} = -{dest}")
            else:
                lines.append(f"    ' {insn.text}")
            if parts[0].lower() == "ax":
                ax = dest
            i += 1
            continue

        if mnem == "mov" and len(parts) == 2:
            dest = fmt_operand(parts[0], descs)
            src = fmt_operand(parts[1], descs)
            if _is_reg(parts[0]):
                if parts[0].lower() == "ax":
                    ax = src
                lines.append(f"    {parts[0].lower()} = {src}")
            else:
                lines.append(f"    {dest} = {src}")
            i += 1
            continue

        if mnem == "nop":
            i += 1
            continue

        flush_pushes()
        lines.append(f"    ' {insn.text}")
        i += 1

    flush_pushes()
    if stopped:
        lines.append(f"    ' decode stopped: {stopped}")
    return _fold_string_ops(lines)


def _strip_addr(expr: str) -> str:
    match = re.fullmatch(r"addr\((.+)\)", expr)
    return match.group(1) if match else expr


def _fold_string_ops(lines: list[str]) -> list[str]:
    """Turn the compiler's string helper calls into assignments and concatenation."""
    out: list[str] = []
    i = 0
    while i < len(lines):
        window = lines[i : i + 3]
        if len(window) == 3 and window[0].startswith("    di = ") and window[1].startswith("    si = "):
            di = window[0].split("=", 1)[1].strip()
            si = window[1].split("=", 1)[1].strip()
            if any(name in window[2] for name in ASSIGN_CALLS):
                out.append(f"    {_strip_addr(si)} = {di}")
                i += 3
                continue
            if any(name in window[2] for name in CONCAT_CALLS):
                out.append(f"    ax = {si} + {di}")
                i += 3
                continue
        if (
            len(window) == 3
            and window[0].startswith("    si = ")
            and window[1].startswith("    di = ")
            and any(name in window[2] for name in CONCAT_CALLS)
        ):
            si = window[0].split("=", 1)[1].strip()
            di = window[1].split("=", 1)[1].strip()
            out.append(f"    ax = {si} + {di}")
            i += 3
            continue
        out.append(lines[i])
        i += 1
    return out


def _slug(text: str) -> str:
    slug = re.sub(r"[^A-Za-z0-9]+", "_", text).strip("_").lower()
    return slug[:40] or "text"


def name_procedure(addr: int, strings: list[str]) -> str:
    files = [s for s in strings if ".DAT" in s.upper() or ".DUN" in s.upper() or ".INV" in s.upper()]
    if files:
        return f"{_slug(files[0])}_{addr:05X}"
    short = [s for s in strings if 3 <= len(s) <= 28]
    if short:
        return f"{_slug(short[0])}_{addr:05X}"
    return f"proc_{addr:05X}"


def strings_in(insns: list[Insn], descs: dict[int, str]) -> list[str]:
    found: list[str] = []
    seen: set[str] = set()
    for insn in insns:
        if insn.mnem not in {"mov", "push", "cmp", "lea"}:
            continue
        for part in _split_args(insn.args):
            match = re.fullmatch(r"(?:byte|word|dword)?\s*\+?0x([0-9a-fA-F]+)", part.strip())
            if not match:
                continue
            text = descs.get(int(match.group(1), 16))
            if text and text not in seen:
                seen.add(text)
                found.append(text)
    return found


def lift(image: bytes | None = None) -> str:
    image = image if image is not None else load_image()
    descs = extract_descriptors(image)
    procs = find_procedures(image)
    proc_addrs = [addr for addr, _locals in procs]
    # Names need a first pass over strings, so decode fully then render.
    decoded: list[dict] = []
    ret_cache: dict[tuple[int, int], int | None] = {}
    for index, (addr, locals_n) in enumerate(procs):
        end = proc_addrs[index + 1] if index + 1 < len(procs) else min(len(image), addr + 0x4000)
        specials, stopped_at, error = walk_span(image, addr, end)
        hard_end = stopped_at if error else end
        blob = bytearray(image[addr:hard_end])
        for at, (length, _note) in specials.items():
            for off in range(length):
                blob[at - addr + off] = 0x90
        insns = disassemble(bytes(blob), addr) if blob else []
        strings = strings_in(insns, descs)
        decoded.append(
            {
                "addr": addr,
                "locals": locals_n,
                "specials": specials,
                "insns": insns,
                "strings": strings,
                "error": None if not error else f"{error} at {stopped_at:#x}",
                "name": "",
            }
        )
    proc_at = {}
    for row in decoded:
        alias = PROC_ALIAS.get(row["addr"])
        row["name"] = f"{alias}_{row['addr']:05X}" if alias else name_procedure(row["addr"], row["strings"])
        proc_at[row["addr"]] = row["name"]

    out: list[str] = []
    out.append("' Sorcerer's Bane")
    out.append("' Lifted from SB.EXE (compiled Microsoft BASIC).")
    out.append("' This is not the original source. Names of procedures are inferred.")
    out.append("' OPEN/GET/CLOSE are translated. Other calls keep the runtime address.")
    out.append("' local_N and arg_N are stack slots. var_NNNN is near data.")
    out.append(f"' Procedures: {len(decoded)}. String literals: {len(descs)}.")
    out.append("")
    out.append("' ---- index ----")
    for row in decoded:
        hint = ""
        if row["strings"]:
            hint = "  ' " + " | ".join(s.replace("'", "")[:40] for s in row["strings"][:3])
        out.append(f"' {row['name']}{hint}")
    out.append("")

    for row in decoded:
        out.append(f"SUB {row['name']}  ' image &H{row['addr']:X}, locals {row['locals']}")
        if row["strings"]:
            preview = " | ".join(row["strings"][:6])
            out.append(f"  ' strings: {preview}")
        body = render_procedure(
            image,
            row["insns"],
            row["specials"],
            descs,
            proc_at,
            ret_cache,
            row["error"],
        )
        out.extend(body)
        out.append("END SUB")
        out.append("")
    return "\n".join(out) + "\n"


def write_listing(path: Path | None = None) -> Path:
    dest = path or (repo_root() / "reconstructed" / "sb_lifted.bas")
    dest.parent.mkdir(parents=True, exist_ok=True)
    text = lift()
    dest.write_text(text, encoding="utf-8")
    strings_path = dest.parent / "strings.txt"
    descs = extract_descriptors(load_image())
    lines = [f"{near:04X}  {text}" for near, text in sorted(descs.items())]
    strings_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return dest


def main() -> None:
    dest = write_listing()
    text = dest.read_text(encoding="utf-8")
    subs = text.count("\nSUB ")
    print(f"wrote {dest} ({subs} procedures, {text.count(chr(10))} lines)")


if __name__ == "__main__":
    main()
