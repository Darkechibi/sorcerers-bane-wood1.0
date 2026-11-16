"""Validate extracted JSON data for Sorcerer's Bane reconstruction."""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


def validate_monsters(monsters: list[dict]) -> list[str]:
    errors: list[str] = []
    if not monsters:
        errors.append("monsters list is empty")
        return errors

    for i, row in enumerate(monsters):
        name = str(row.get("name", "")).strip()
        if not name:
            errors.append(f"row {i}: empty monster name")
        tier = row.get("tier_offset_20")
        if not isinstance(tier, int) or tier < 0 or tier > 999:
            errors.append(f"row {i}: invalid tier_offset_20={tier!r}")
        disposition = row.get("disposition_offset_22")
        if not isinstance(disposition, int) or disposition < -32768 or disposition > 32767:
            errors.append(f"row {i}: invalid disposition_offset_22={disposition!r}")

    return errors


def main() -> None:
    p = argparse.ArgumentParser(description="Validate exported reconstruction JSON data")
    p.add_argument(
        "monsters_json",
        nargs="?",
        type=Path,
        default=Path(__file__).resolve().parent.parent / "monsters.json",
        help="path to monsters JSON export",
    )
    args = p.parse_args()
    path = args.monsters_json
    if not path.is_file():
        print(f"error: not found: {path}", file=sys.stderr)
        sys.exit(1)

    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        print(f"error: invalid JSON in {path}: {exc}", file=sys.stderr)
        sys.exit(1)

    if not isinstance(data, list):
        print(f"error: expected list at top-level in {path}", file=sys.stderr)
        sys.exit(1)

    errors = validate_monsters(data)
    if errors:
        print("validation failed:", file=sys.stderr)
        for err in errors:
            print(f"- {err}", file=sys.stderr)
        sys.exit(1)

    print(f"validation ok: {len(data)} monster rows in {path}")


if __name__ == "__main__":
    main()
