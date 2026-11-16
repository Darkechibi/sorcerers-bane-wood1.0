# Reverse-engineering tools for Sorcerer's Bane

This project rebuilds **Sorcerer's Bane** (1992, Wood Software, QuickBASIC) without
original source. No single tool recovers `.BAS` from `SB.EXE`. Use **data files +
manual + structured play** first; use disassemblers only for specific questions.

---

## What "success" means here

| Goal | Realistic? |
|------|------------|
| ~99% same behavior (stats, combat, saves) | Yes, with time + golden tests |
| Recover original QuickBASIC source | Very unlikely (30+ years, no reg disk found) |
| Pretty decompiled C from Ghidra | Sometimes; treat as hints only |

---

## Tool categories

### 1. Data & documentation (highest value for SB)

| Asset | Location | Use |
|-------|----------|-----|
| User manual v1.1 | `SB.DOC` | Rules, menus, map symbols, races/classes |
| Monsters | `MONSTER.DAT` → `monsters.json` | `python tools/parse_monster_dat.py` |
| Inventory layout | `TERIA.INV` | `python tools/parse_inventory_file.py` |
| Dungeon saves | `*.DUN` | `python tools/decode_dun.py` |
| Save diffs | `before change` / `after change` | `python tools/diff_snapshots.py` |
| Playthrough notes | [CRPG Addict SB (1992)](http://crpgaddict.blogspot.com/2019/02/game-317-sorcerers-bane-1992.html) | 12×76 levels, 1 XP/step, mechanics |

### 2. Live file access (Windows, no DOSBox menus)

**Process Monitor (Procmon)** — Sysinternals  
https://learn.microsoft.com/en-us/sysinternals/downloads/procmon

- Filter: **Process Name** `dosbox-x.exe` **Include**
- Filter: **Path** contains `sorcebanedecompile` **Include**
- Play 1–2 minutes → **File → Save** (CSV or PML)
- Shows **open/read/write** on `MONSTER.DAT`, `USER.SBS`, `*.DUN`, etc.

DOSBox **Debug → Log INT21h** is optional; often does not land in `sb_trace.log`.

### 3. Disassemblers (use for *one question at a time*)

| Tool | Link | Notes |
|------|------|--------|
| Ghidra | https://ghidra-sre.org/ | Free; import `SB.EXE`, analyze, **Strings → References** |
| IDA Free | https://hex-rays.com/ida-free/ | Alternative UI for same job |
| Cutter | https://cutter.re/ | Radare2 GUI, scriptable |
| Binary Ninja | https://binary.ninja/ | Paid; strong decompiler |

**Workflow:** find string (e.g. `MONSTER.DAT`) → xref → rename function → read decompiler → note constants (e.g. `196` record size).

### 4. QuickBASIC-specific reading

| Resource | Link |
|----------|------|
| QBasic reversing notes | https://github.com/maurom/qbasic-reversing-notes |
| QB disassembly notes | https://github.com/tcaudilllg/QB-Disassembly |

Many QB EXEs use **EXEPACK**; unpack before deep analysis if strings/code look wrong.

### 5. DOS debugging (memory, not "stack traces")

| Approach | When |
|----------|------|
| DOSBox-X **save states** | Freeze before/after one action; compare RAM later |
| DOSBox-X debugger (**Run normal** only) | Search memory for HP/XP values; find writers |
| Compare to minimal QB compile | Separate tiny QB program → diff EXE to spot runtime vs game code |

Avoid **Start DOSBox-X Debugger** during play—it pauses the game and can crash on exit.

### 6. Python reconstruction (this repo)

| Path | Role |
|------|------|
| `engine/` | Models, RNG, placeholder combat |
| `tools/` | Parsers, validators, diff, dungeon decode |
| `tests/` | Smoke / parity tests (expand over time) |
| `docs/reconstruction_workboard.md` | Status checklist |

---

## When to use which tool

```
Question: "Which files does the game touch?"
  → Procmon

Question: "What byte is XP in a save?"
  → before/after folder copy + diff_snapshots.py

Question: "What does offset 36 in a monster record mean?"
  → monsters.json + correlate tier/power + optional Ghidra xref

Question: "What instruction writes HP?"
  → save diff narrows file first; then DOSBox memory search + Ghidra

Question: "Give me the whole game as BASIC"
  → stop; rebuild behavior in Python instead
```

---

## Registration / source (long shot)

Original offer (see `SB.DOC` and in-game shareware screen):

- **$19.95:** Game Master tools (edit monsters/items/stats)
- **$99.95:** SB + GM **source**, BASWOOD library (QuickBASIC)

Worth occasional archive searches; **do not block** the project on finding it.

---

## Related docs

- **Next actions:** `docs/NEXT_FIVE_STEPS.md`
- **Status:** `docs/reconstruction_workboard.md`
- **Monster format:** `DECOMPILE_LOG.md`
