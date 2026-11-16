# Sorcerer’s Bane — reverse-engineering log

## Goal

Recover understanding of the DOS game **Sorcerer’s Bane** (believed written in **QuickBASIC 5**) after source and executable are unavailable. Data files are the practical entry point; **`MONSTER.DAT`** was suggested as a good first file.

## What we have

| Asset | Status |
|--------|--------|
| `MONSTER.DAT` | Present; fully parsed at container level |
| Main `.EXE` | Not in this folder yet — needed to confirm field meanings and game logic |
| Other `.DAT` / resources | Not catalogued here |

## Done so far — `MONSTER.DAT` container

- **Record count:** **86** monsters.
- **Record size:** **196 bytes** per monster (file size 16856 ÷ 196 = 86).
- **Layout (offsets relative to start of each 196-byte record):**

| Offset | Size | Content |
|--------|------|---------|
| 0–19 | 20 | Name, ASCII, space-padded (e.g. `GOBLIN` + spaces). |
| 20–21 | 2 | Unsigned **tier / dungeon band** (QB `INTEGER` / `WORD`): values **1–30** across the file; **not** 1 byte — high byte is 0, low byte is the tier. |
| 22–23 | 2 | Signed **disposition** (`INTEGER`): **-1** (59 monsters, hostile), **0** (17), **1** (10, likely non-hostile / special). |
| 24–35 | 12 | Three **LONG**s (little-endian). Often `1, 0, 0`; varies for special cases (e.g. Floating Eye injects extra values — see below). |
| 36–39 | 4 | **LONG** — scales with difficulty: commonly **100** on weak monsters, **200**, **300**, **400**… up to large values on late entries. **Strong candidate for max HP (or hit dice / life pool)** — needs EXE to confirm. |
| 40–63 | 24 | **Mixed `INTEGER` fields** (pairs of bytes, little-endian): damage bands, AC, to-hit, spell flags, etc. (exact map TBD). |
| 64–195 | 132 | **Flavor text**: printable ASCII description; ends with **NUL**; padded with **NUL**s to fill the field (fixed **128** character slots + terminator/padding ≈ **132** bytes total for this block). |

- **Important:** Bytes **after** the description are **not** HP/XP — they are the **start of the next record** (next 20-byte name). All numeric combat fields seen so far sit **before** offset 64.

- **“Bytes after each description” (user / Gemini question):** In this format, the only consistent bytes after the text are **padding `0x00`** and then the **next monster name**. There is **no** second little footer of HP/XP after the string; those values are **earlier** in the same record (notably the **LONG at offset 36** and the **`INTEGER` block** after it).

## Quick observations (examples)

- **GOBLIN:** tier 1, disposition -1, LONG at 36 = **100**; following `INTEGER`s include **5, 5, 5, 5, 3, 5, 1, 16** (likely stats / level cap — **16** appears often as a cap-like value on early monsters).
- **FLOATING EYE:** same tier/disposition pattern; at the position where many monsters have a single **LONG 100**, this entry uses **two `INTEGER`s (7, 28)** in that window — suggests **variant encoding** for special abilities (paralysis, etc.) before the common stat block.
- **Tier field (offset 20):** increases with monster power (roughly aligned with dungeon depth in many RPGs); exact mapping to “dungeon level” needs code.

## Tools added in repo

- `tools/parse_monster_dat.py` — exports all records to **`monsters.json`** (default path: repo root). Run: `python tools/parse_monster_dat.py` (optional: `-o path`, `DAT` path, `--hex` for the legacy first-record dump).
- **`monsters.json`** — **86** objects; fields include `tier_offset_20`, `disposition_offset_22`, `long_offset_24` … `long_offset_36`, then **`stat_offset_40` through `stat_offset_62`** (16-bit little-endian each), plus `description_offset_64`. Names encode the **byte offset within each 196-byte record** for unknown combat fields.

### 2026-04-17 — JSON export

- Generated `monsters.json` from `MONSTER.DAT` via `tools/parse_monster_dat.py`; mystery words in the 40–63 byte window are labeled `stat_offset_*` for collaborative mapping once the EXE is available.

## Next steps (when EXE or more files appear)

1. Obtain **`SORCERER.EXE`** (or actual filename) and match **read offsets** to variable names (`HP`, `DAMAGE`, `EXPERIENCE`, etc.).
2. Dump other data files (items, spells, maps) using the same approach: **record size**, **strings**, then **numeric fields**.
3. Optional: export a **CSV** of all 86 rows with hex of bytes 20–63 for collaborative labeling.

## References

- Internal note: Gemini suggested inspecting post-description bytes for HP/XP; for **`MONSTER.DAT`**, that pattern does **not** apply — stats are **before** the description block.

---

*Last updated: 2026-04-17 — `MONSTER.DAT` structure, `monsters.json` export, project log.*
