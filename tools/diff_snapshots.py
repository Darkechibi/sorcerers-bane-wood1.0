"""Compare two capture folders and report binary/text differences.

This script is designed for reverse engineering workflow:
you capture `before` and `after` game sessions, then run this tool to see
which files changed and where bytes moved.

The output intentionally includes both:
- Human-readable summary (Markdown)
- Machine-friendly structured data (JSON)
"""
from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import dataclass
from pathlib import Path


@dataclass(slots=True)
class FileDigest:
    """Lightweight per-file metadata used to detect changed files quickly."""

    name: str
    size: int
    sha1: str


def digest_file(path: Path) -> FileDigest:
    """Compute deterministic digest metadata for a file."""
    data = path.read_bytes()
    return FileDigest(name=path.name, size=len(data), sha1=hashlib.sha1(data).hexdigest())


def list_files(directory: Path) -> dict[str, Path]:
    """Return a dictionary mapping file name -> absolute path for one folder."""
    return {p.name: p for p in sorted(directory.iterdir()) if p.is_file()}


def byte_diff(a: bytes, b: bytes) -> dict:
    """Compute byte-level differences between two byte sequences.

    Returns a small summary that is readable while still preserving raw detail.
    """
    min_len = min(len(a), len(b))
    changed_offsets = [i for i in range(min_len) if a[i] != b[i]]
    return {
        "changed_count": len(changed_offsets),
        "first_offsets": changed_offsets[:64],  # limit for readability
        "size_before": len(a),
        "size_after": len(b),
        "appended_bytes": max(0, len(b) - len(a)),
        "truncated_bytes": max(0, len(a) - len(b)),
    }


def text_preview(path: Path) -> list[str]:
    """Return short preview lines if file appears to be text; otherwise empty."""
    data = path.read_bytes()
    if not data:
        return []
    printable = sum(32 <= x <= 126 or x in (9, 10, 13) for x in data)
    if printable / len(data) < 0.9:
        return []
    # decode leniently; if this fails we just skip preview
    try:
        text = data.decode("utf-8", errors="replace")
    except Exception:
        return []
    return text.splitlines()[:12]


def build_report(before_dir: Path, after_dir: Path) -> dict:
    """Build complete diff report between capture folders."""
    before_files = list_files(before_dir)
    after_files = list_files(after_dir)

    names = sorted(set(before_files) | set(after_files))
    report_rows = []

    for name in names:
        before = before_files.get(name)
        after = after_files.get(name)
        if before is None:
            report_rows.append({"name": name, "status": "added", "size_after": after.stat().st_size})
            continue
        if after is None:
            report_rows.append({"name": name, "status": "removed", "size_before": before.stat().st_size})
            continue

        d_before = digest_file(before)
        d_after = digest_file(after)
        if d_before.sha1 == d_after.sha1:
            report_rows.append(
                {
                    "name": name,
                    "status": "unchanged",
                    "size_before": d_before.size,
                    "size_after": d_after.size,
                }
            )
            continue

        a = before.read_bytes()
        b = after.read_bytes()
        row = {
            "name": name,
            "status": "modified",
            "sha1_before": d_before.sha1,
            "sha1_after": d_after.sha1,
            "byte_diff": byte_diff(a, b),
            "text_preview_before": text_preview(before),
            "text_preview_after": text_preview(after),
        }
        report_rows.append(row)

    return {"before": str(before_dir), "after": str(after_dir), "files": report_rows}


def write_markdown(report: dict, out_md: Path) -> None:
    """Write concise Markdown summary for quick human review."""
    lines = [
        "# Snapshot Diff Report",
        "",
        f"- before: `{report['before']}`",
        f"- after: `{report['after']}`",
        "",
    ]

    for row in report["files"]:
        lines.append(f"## {row['name']}")
        lines.append(f"- status: `{row['status']}`")
        if row["status"] == "modified":
            diff = row["byte_diff"]
            lines.append(
                "- byte changes: "
                f"{diff['changed_count']} "
                f"(appended={diff['appended_bytes']}, truncated={diff['truncated_bytes']})"
            )
            if diff["first_offsets"]:
                lines.append(f"- first changed offsets: `{diff['first_offsets']}`")
            if row["text_preview_before"] or row["text_preview_after"]:
                lines.append("- text preview available in JSON report")
        elif row["status"] == "added":
            lines.append(f"- size_after: {row['size_after']}")
        elif row["status"] == "removed":
            lines.append(f"- size_before: {row['size_before']}")
        else:
            lines.append(f"- size: {row['size_before']}")
        lines.append("")

    out_md.parent.mkdir(parents=True, exist_ok=True)
    out_md.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    """Command-line entry point."""
    root = Path(__file__).resolve().parent.parent
    p = argparse.ArgumentParser(description="Compare before/after capture folders")
    p.add_argument("before", nargs="?", type=Path, default=root / "before change")
    p.add_argument("after", nargs="?", type=Path, default=root / "after change")
    p.add_argument("--json-out", type=Path, default=root / "docs" / "snapshot_diff_report.json")
    p.add_argument("--md-out", type=Path, default=root / "docs" / "snapshot_diff_report.md")
    args = p.parse_args()

    if not args.before.is_dir():
        raise SystemExit(f"error: before folder not found: {args.before}")
    if not args.after.is_dir():
        raise SystemExit(f"error: after folder not found: {args.after}")

    report = build_report(args.before, args.after)

    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(report, indent=2), encoding="utf-8")
    write_markdown(report, args.md_out)

    changed = [f for f in report["files"] if f["status"] != "unchanged"]
    print(f"compared {len(report['files'])} files; changed entries: {len(changed)}")
    print(f"json: {args.json_out}")
    print(f"markdown: {args.md_out}")


if __name__ == "__main__":
    main()
