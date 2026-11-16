"""Decode Sorcerer's Bane .DUN save-map blobs into readable previews."""
from __future__ import annotations

import argparse
from pathlib import Path


CP437_TO_ASCII = {
    179: "|",  # vertical
    186: "|",
    196: "-",  # horizontal
    205: "=",
    218: "+",  # corners
    191: "+",
    192: "+",
    217: "+",
    194: "+",
    193: "+",
    195: "+",
    180: "+",
    197: "+",
}


def render_byte(value: int) -> str:
    if value in CP437_TO_ASCII:
        return CP437_TO_ASCII[value]
    if value == 46:  # explored filler in observed saves
        return "."
    if value == 32:
        return " "
    if 33 <= value <= 126:
        return chr(value)
    return "?"


def decode_rows(data: bytes, width: int) -> list[str]:
    if len(data) % width != 0:
        raise ValueError(f"data length {len(data)} is not divisible by width {width}")
    rows = []
    for i in range(0, len(data), width):
        rows.append("".join(render_byte(b) for b in data[i : i + width]))
    return rows


def write_preview(rows: list[str], out_path: Path, rows_per_floor: int) -> None:
    lines: list[str] = []
    floor_count = len(rows) // rows_per_floor if rows_per_floor > 0 else 1
    if rows_per_floor <= 0 or len(rows) % rows_per_floor != 0:
        floor_count = 1
        rows_per_floor = len(rows)
    lines.append(f"# Decoded DUN preview")
    lines.append(f"# floors={floor_count} rows_per_floor={rows_per_floor} width={len(rows[0]) if rows else 0}")
    for floor_idx in range(floor_count):
        start = floor_idx * rows_per_floor
        end = start + rows_per_floor
        lines.append("")
        lines.append(f"## FLOOR {floor_idx + 1}")
        lines.extend(rows[start:end])
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    p = argparse.ArgumentParser(description="Decode .DUN file into readable ASCII preview")
    p.add_argument("dun", nargs="?", type=Path, default=root / "TERIA.DUN")
    p.add_argument("-o", "--output", type=Path, default=root / "docs" / "TERIA_DUN_preview.txt")
    p.add_argument("--width", type=int, default=127, help="row width in bytes")
    p.add_argument(
        "--rows-per-floor",
        type=int,
        default=16,
        help="rows in each floor/page block (default: 16)",
    )
    args = p.parse_args()

    if not args.dun.is_file():
        raise SystemExit(f"error: file not found: {args.dun}")
    data = args.dun.read_bytes()
    rows = decode_rows(data, args.width)
    write_preview(rows, args.output, args.rows_per_floor)
    print(
        f"decoded {args.dun.name}: bytes={len(data)} rows={len(rows)} "
        f"width={args.width} -> {args.output}"
    )


if __name__ == "__main__":
    main()
