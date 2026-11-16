# Automated capture while you play

You only need **two clicks** around each small in-game action. The scripts copy
save/data files into `captures/` with clear names and run a diff for you.

---

## Quick start (double-click)

1. **`capture_begin.bat`**  
   - Optional: rename by passing a label on the command line:  
     `capture_begin.bat fight_hobgoblin`  
   - Copies everything to `captures/2026-05-08_143022_fight_hobgoblin/before/`

2. **Play ONE thing in DOSBox**  
   - e.g. five steps, one fight, take one item, exit dungeon  
   - Optional: DOSBox-X save state, then **`capture_snap.bat after_save_state`**

3. **`capture_end.bat`**  
   - Copies to `.../after/`  
   - Writes `diff_report.md` and `diff_report.json` in the same folder  
   - Adds `notes.txt` template if you want to type what happened

4. Open **`captures/<session>/diff_report.md`** to see what changed.

---

## What gets backed up

From `tools/capture_config.json` (game folder = repo root by default):

| Files | Why |
|-------|-----|
| `USER.SBS`, `SYSTEM.SBS` | Account / system |
| `HALLFAME.DAT`, `HALLFAME.TXT` | Hall of fame |
| `*.SBC` | Character sheet |
| `*.INV` | Inventory |
| `*.DUN` | Dungeon map state |
| `*.SBL` | Character list / locks (if present) |

Each `before/` and `after/` folder also gets `_manifest.json` (sizes + SHA1).

---

## Folder layout (one session)

```text
captures/
  2026-05-08_143022_fight_hobgoblin/
    before/          ← files before your action
    after/           ← files after your action
    snapshots/       ← optional mid-session (capture_snap.bat)
    notes.txt        ← your observations
    session.json     ← label, timestamp, purpose
    diff_report.md   ← human-readable diff
    diff_report.json ← machine-readable diff
```

---

## Optional: DOSBox save states

If you use DOSBox-X save slots, set in `tools/capture_config.json`:

```json
"optional_dosbox_save_dir": "D:\\bin\\D-Fend\\dosbox-x\\save"
```

Then each capture also copies `dosbox_saves/` under `before/`, `after/`, or snapshots.

(Find your path: DOSBox-X config or where `.sav` files appear after saving.)

---

## PowerShell (without .bat)

From repo root:

```powershell
.\tools\capture_game_state.ps1 -Action Begin -Label "walk_5"
.\tools\capture_game_state.ps1 -Action Note -Message "HP 16/16, moved N x5, XP 250->255"
.\tools\capture_game_state.ps1 -Action End
.\tools\capture_game_state.ps1 -Action List
.\tools\capture_game_state.ps1 -Action Status
```

---

## Rules (so data stays useful)

- **One action** between begin and end (not a whole evening in one pair).
- Use a **short label**: `walk_5`, `fight_goblin`, `loot_firecloak`, `exit_dungeon`.
- After end, add to `notes.txt`: HP, XP, gold, monster name, menu choices (Fight vs Kill).

---

## See also

- `docs/NEXT_FIVE_STEPS.md` — overall plan  
- `docs/re_tools.md` — Procmon, Ghidra, etc.
