# Next five steps (Sorcerer's Bane reconstruction)

A practical order of work. Each step builds proof you can use in Python
without Ghidra or registration disks. Budget **one session per step** at first;
repeat steps 2–3 as you add more captures.

---

## Step 1 — Set up your capture habit (30 minutes, once)

**Goal:** Every play session produces comparable evidence.

**Automated (recommended):** see `docs/CAPTURE_AUTOMATION.md`

1. Double-click **`capture_begin.bat`** (or `capture_begin.bat walk_5`)
2. Play **one** action in DOSBox
3. Double-click **`capture_end.bat`** → reads `captures/<timestamp>_label/diff_report.md`

Optional: **`capture_snap.bat`** after a DOSBox save state; **`capture_note.bat`** to log HP/XP.

**Manual fallback:** copy files to `captures/.../before/` and `after/` yourself (same file list in `tools/capture_config.json`).

**You do not need:** debugger, Ghidra, or INT21 logging for this step.

---

## Step 2 — Run three "golden" micro-sessions (1–2 hours total)

**Goal:** Map file changes to actions. One action per session.

| Session | Do only this | Watch on screen |
|---------|----------------|-----------------|
| **A — Move** | Enter dungeon, walk 5 steps, exit/save | XP (manual says +1 per step) |
| **B — Fight** | One encounter, use **Fight** only (not Kill), exit | HP, damage text, XP |
| **C — Loot** | Kill one monster, open pouch, take item, equip, exit | Inventory, stats |

After each session, run (from repo root):

```text
python tools/diff_snapshots.py "captures/.../before" "captures/.../after"
```

Save the report or note which files changed (`TERIA1.DUN`, `.INV`, `.SBC`, etc.).

---

## Step 3 — One Procmon capture (30 minutes, once)

**Goal:** Official list of which data files the game reads/writes.

1. Download **Process Monitor** (Sysinternals).
2. **Filter → Filter:**  
   - Process Name is `dosbox-x.exe` → Include  
   - Path contains `sorcebanedecompile` → Include  
3. Capture **off**, start DOSBox, play through: main menu → load character →
   dungeon → one fight → save/quit.
4. Capture **off**, **File → Save** as `captures/procmon_first_run.csv`.
5. In the CSV, search for `.DAT`, `.SBC`, `.DUN`, `.INV`, `.SBS`.

Use this list to prioritize parsers (`ITEMFILE.DAT`, `SPELLS.DAT`, `SB.DAT` next).

---

## Step 4 — Mine the manual and data you already have (1 hour, no DOS)

**Goal:** Rules and content without the EXE.

1. Read in `SB.DOC`:
   - Rolling stats (page 19), races/classes (20–21)
   - Dungeon options (27), map key (28), monster menu (29)
2. Skim [CRPG Addict playthrough](http://crpgaddict.blogspot.com/2019/02/game-317-sorcerers-bane-1992.html)
   for 12×76 dungeon, 30 levels, 1 XP/step, Fight vs Kill behavior.
3. Re-export and validate monsters:

```text
python tools/parse_monster_dat.py
python tools/validate_data.py monsters.json
```

4. Parse a rich inventory file if you have one:

```text
python tools/parse_inventory_file.py TERIA.INV -o docs/inventory_parsed.json
```

Write down **3 guesses** to test later (e.g. "offset 36 in monster record = HP pool").

---

## Step 5 — Ghidra only for one string (1–2 hours, optional)

**Goal:** Connect *one* data file to *one* code path—not "understand SB.EXE."

1. Import `SB.EXE` into Ghidra; wait for auto-analysis.
2. **Window → Defined Strings** → find `MONSTER.DAT` (or `ITEMFILE.DAT`).
3. **References** to that string → open the referring function.
4. Rename it (e.g. `load_monster_dat`) and add a comment: what you think it does
   (read loop, record size 196, etc.).
5. Stop. Do not try to decompile the whole program.

If stuck, read: https://github.com/maurom/qbasic-reversing-notes

**Parallel path (Agent mode):** ask to extend Python parsers + parity tests from
your Step 2 diffs and `SB.DOC` rules.

---

## After the five steps

You should have:

- [ ] 3+ before/after capture pairs with notes  
- [ ] 1 Procmon CSV  
- [ ] Manual-backed rule list  
- [ ] Optional: one Ghidra function tied to one `.DAT` file  

**Next wave:** more capture types (Run, shop, cleric, stairs), tune `engine/combat.py`
against golden fights, build terminal playable slice.

See also: `docs/re_tools.md`, `docs/reconstruction_workboard.md`.
