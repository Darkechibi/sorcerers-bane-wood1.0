"""Generate a quick catalog of top-level project assets."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha1_prefix(path: Path, max_bytes: int = 4096) -> str:
    h = hashlib.sha1()
    with path.open("rb") as f:
        h.update(f.read(max_bytes))
    return h.hexdigest()


def inspect_file(path: Path) -> dict:
    raw = path.read_bytes()
    ascii_ratio = 0.0
    if raw:
        printable = sum(32 <= b <= 126 or b in (9, 10, 13) for b in raw)
        ascii_ratio = printable / len(raw)
    return {
        "name": path.name,
        "size": path.stat().st_size,
        "sha1_prefix_4k": sha1_prefix(path),
        "ascii_ratio": round(ascii_ratio, 4),
        "starts_with_hex": raw[:16].hex(),
    }


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    p = argparse.ArgumentParser(description="Catalog top-level Sorcerer's Bane assets")
    p.add_argument("-o", "--output", type=Path, default=root / "docs" / "asset_catalog.json")
    args = p.parse_args()

    rows = []
    for path in sorted(root.iterdir()):
        if path.is_file() and path.name != args.output.name:
            rows.append(inspect_file(path))

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(rows, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {len(rows)} entries to {args.output}")


if __name__ == "__main__":
    main()
