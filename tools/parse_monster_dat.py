"""Parse Sorcerer's Bane monster records into JSON."""
from __future__ import annotations

import argparse
import json
import struct
import sys
from pathlib import Path

RECORD_SIZE = 196
NAME_LEN = 20
DESC_START = 64
DEFAULT_DAT_CANDIDATES = ("MONSTER.DAT", "SB.DAT")


def repo_root() -> Path:
    return Path(__file__).resolve().parent.parent


def resolve_default_dat(root: Path) -> Path:
    for name in DEFAULT_DAT_CANDIDATES:
        candidate = root / name
        if candidate.is_file():
            return candidate
    return root / DEFAULT_DAT_CANDIDATES[0]


def validate_size(data: bytes, strict: bool = True) -> int:
    n = len(data) // RECORD_SIZE
    rem = len(data) % RECORD_SIZE
    if rem:
        msg = f"file length {len(data)} is not a multiple of {RECORD_SIZE} ({rem} trailing bytes)"
        if strict:
            raise ValueError(msg)
        print(f"warning: {msg}", file=sys.stderr)
    return n


def parse_record(data: bytes, index: int) -> dict:
    off = index * RECORD_SIZE
    raw = data[off : off + RECORD_SIZE]
    if len(raw) < RECORD_SIZE:
        raise ValueError(f"short record at index {index}")

    name_field = raw[0:NAME_LEN].decode("ascii", errors="replace")
    name = name_field.rstrip()

    tier = struct.unpack_from("<H", raw, 20)[0]
    disposition = struct.unpack_from("<h", raw, 22)[0]
    long_24 = struct.unpack_from("<i", raw, 24)[0]
    long_28 = struct.unpack_from("<i", raw, 28)[0]
    long_32 = struct.unpack_from("<i", raw, 32)[0]
    long_36 = struct.unpack_from("<i", raw, 36)[0]

    stats: dict[str, int] = {}
    for o in range(40, 64, 2):
        stats[f"stat_offset_{o}"] = struct.unpack_from("<h", raw, o)[0]

    desc_bytes = raw[DESC_START:RECORD_SIZE]
    nul = desc_bytes.find(b"\x00")
    if nul >= 0:
        desc_bytes = desc_bytes[:nul]
    description = desc_bytes.decode("ascii", errors="replace")

    return {
        "index": index,
        "name": name,
        "name_padded": name_field,
        "tier_offset_20": tier,
        "disposition_offset_22": disposition,
        "long_offset_24": long_24,
        "long_offset_28": long_28,
        "long_offset_32": long_32,
        "long_offset_36": long_36,
        **stats,
        "description_offset_64": description,
    }


def export_json(dat_path: Path, out_path: Path) -> int:
    data = dat_path.read_bytes()
    n = validate_size(data, strict=False)
    monsters = [parse_record(data, i) for i in range(n)]
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(monsters, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"wrote {n} monsters to {out_path}")
    return n


def debug_hex(dat_path: Path) -> None:
    data = dat_path.read_bytes()
    if len(data) < RECORD_SIZE:
        raise ValueError(f"{dat_path} is too short for debug dump ({len(data)} bytes)")
    chunk = data[20:70]
    print(" ".join(f"{b:02x}" for b in chunk))
    for i in range(0, 50, 2):
        print(f"{20+i:3d}: i16={struct.unpack_from('<h', data, 20+i)[0]:6d}  u16={struct.unpack_from('<H', data, 20+i)[0]}")
    print("--- i32 ---")
    for i in range(0, 48, 4):
        print(f"{20+i:3d}: i32={struct.unpack_from('<i', data, 20+i)[0]}")


def main() -> None:
    root = repo_root()
    p = argparse.ArgumentParser(description="Parse MONSTER.DAT")
    p.add_argument(
        "dat",
        nargs="?",
        type=Path,
        default=resolve_default_dat(root),
        help="path to monster data file (defaults to MONSTER.DAT, then SB.DAT if present)",
    )
    p.add_argument(
        "-o",
        "--output",
        type=Path,
        default=root / "monsters.json",
        help="JSON output path (default: <repo>/monsters.json)",
    )
    p.add_argument("--hex", action="store_true", help="print legacy hex dump of first record instead of exporting")
    p.add_argument(
        "--strict-size",
        action="store_true",
        help="fail if data size is not an exact multiple of record size",
    )
    args = p.parse_args()

    dat_path = args.dat
    if not dat_path.is_file():
        print(f"error: not found: {dat_path}", file=sys.stderr)
        sys.exit(1)

    if args.hex:
        debug_hex(dat_path)
    else:
        if args.strict_size:
            validate_size(dat_path.read_bytes(), strict=True)
        export_json(dat_path, args.output)


if __name__ == "__main__":
    main()
