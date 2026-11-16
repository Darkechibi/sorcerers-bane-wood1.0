"""Parse Sorcerer's Bane inventory files (.INV) into JSON.

This module is intentionally written with extra commentary so it can double as
learning material while the reconstruction project evolves.

What we know so far:
- `.INV` files are fixed-size records.
- Example file `TERIA.INV` is 952 bytes.
- 952 / 68 = 14 records, and each record starts with a readable item name.

What is still unknown:
- Exact meaning of every numeric field after the item name.
- Exact semantics of "magical", "cursed", "equipped", etc. bit flags.

So this parser exposes raw offsets and values instead of pretending certainty.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

# A single inventory entry appears to be exactly 68 bytes.
RECORD_SIZE = 68

# The first 28 bytes look like the item name region in all observed samples.
NAME_SIZE = 28


def repo_root() -> Path:
    """Return repository root based on this script location."""
    return Path(__file__).resolve().parent.parent


def _safe_ascii(text: str) -> str:
    """Return a terminal-safe ASCII version of text.

    DOS-era files often include CP437 symbols that may not print correctly in a
    modern terminal. This helper replaces unsupported glyphs with '?' so output
    remains robust everywhere.
    """
    return text.encode("ascii", "replace").decode("ascii")


def decode_name(raw_name: bytes) -> tuple[str, str]:
    """Decode item name in two forms.

    Returns:
        (display_name, raw_name_cp437)

    - `display_name`: terminal-safe value for logs/JSON.
    - `raw_name_cp437`: exact decoded CP437 string for forensic work.
    """
    cp437_name = raw_name.decode("cp437", errors="replace")
    # Strip trailing spaces and nulls from fixed-length field.
    cleaned = cp437_name.rstrip(" \x00")
    return _safe_ascii(cleaned), cp437_name


def parse_record(record: bytes, index: int) -> dict:
    """Parse one 68-byte inventory record into a structured dictionary."""
    if len(record) != RECORD_SIZE:
        raise ValueError(f"record {index}: expected {RECORD_SIZE} bytes, got {len(record)}")

    name_display, name_cp437 = decode_name(record[:NAME_SIZE])
    tail = record[NAME_SIZE:]

    # Expose both signed and unsigned 16-bit views for reverse engineering.
    u16_fields = [
        int.from_bytes(tail[i : i + 2], "little", signed=False)
        for i in range(0, len(tail), 2)
    ]
    s16_fields = [
        int.from_bytes(tail[i : i + 2], "little", signed=True)
        for i in range(0, len(tail), 2)
    ]

    # Convenience guesses: these are hypotheses, not confirmed facts.
    # We keep them clearly marked so nobody mistakes them for certainty.
    guessed = {
        "likely_type_or_slot": u16_fields[12],  # observed low-range values in samples
        "likely_worn_or_flag": u16_fields[16],
        "likely_magic_or_flag": u16_fields[17],
        "likely_bonus_or_power": s16_fields[19],
    }

    return {
        "index": index,
        "name": name_display,
        "name_cp437_raw": _safe_ascii(name_cp437),
        "record_hex": record.hex(),
        "u16_tail_fields": u16_fields,
        "s16_tail_fields": s16_fields,
        "guessed_fields": guessed,
    }


def parse_inventory(path: Path) -> list[dict]:
    """Parse full `.INV` file into a list of records."""
    data = path.read_bytes()
    if not data:
        return []
    if len(data) % RECORD_SIZE != 0:
        raise ValueError(
            f"{path} size {len(data)} is not divisible by {RECORD_SIZE}; "
            "file may be truncated or different format"
        )
    return [parse_record(data[i : i + RECORD_SIZE], i // RECORD_SIZE) for i in range(0, len(data), RECORD_SIZE)]


def main() -> None:
    """CLI entry point."""
    root = repo_root()
    p = argparse.ArgumentParser(description="Parse Sorcerer's Bane .INV file")
    p.add_argument("inv", nargs="?", type=Path, default=root / "TERIA.INV", help="path to .INV file")
    p.add_argument(
        "-o",
        "--output",
        type=Path,
        default=root / "docs" / "inventory_parsed.json",
        help="path to JSON output",
    )
    args = p.parse_args()

    if not args.inv.is_file():
        raise SystemExit(f"error: not found: {args.inv}")

    rows = parse_inventory(args.inv)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(rows, indent=2) + "\n", encoding="utf-8")
    print(f"parsed {len(rows)} inventory records from {args.inv} -> {args.output}")


if __name__ == "__main__":
    main()
