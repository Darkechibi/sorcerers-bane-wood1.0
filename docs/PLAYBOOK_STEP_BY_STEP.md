# Step-by-step playbook (DOSBox-X + captures)

Use **DOSBox-X** (not old DOSBox 0.74). You already have it at  
`D:\bin\D-Fend\dosbox-x\dosbox-x.exe`.

**What actually works for reconstruction:** game **save files** (automated) + short **notes**.  
**What usually does NOT work reliably:** INT21 “stack traces” in `sb_trace.log`.  
**Memory:** DOSBox **save states** = full RAM snapshot (optional copy via config).

---

## Part A — One-time setup (15 minutes, do once)

### A1. Confirm game files are in this folder

Folder: the repo root (this project directory)

You should see at least: `SB.EXE`, `MONSTER.DAT`, `SB.DOC`, `USER.SBS`.

### A2. (Optional) DOSBox save-state folder

If you use **Save state** in DOSBox-X:

1. In DOSBox-X, save a state once (any slot).
2. Search your PC for a new `.sav` file (or check `D:\bin\D-Fend\dosbox-x\save`).
3. Edit `tools/capture_config.json` and set:

```json
"optional_dosbox_save_dir": "PASTE_FULL_PATH_HERE"
```

Then `capture_begin` / `capture_end` also copy those `.sav` files.

### A3. (Optional) Procmon — one afternoon only

Download Process Monitor (Sysinternals).  
You only need **one** 2-minute run ever to see which `.DAT` files matter.  
See `docs/re_tools.md`. **Skip if overwhelmed.**

---

## Part B — Every time you play (exact order)

### B0. Before opening DOSBox

| Step | Action | How often |
|------|--------|-----------|
| 1 | Decide **one** thing you will test (e.g. “5 steps north”, “one goblin fight”) | Every session |
| 2 | Double-click **`capture_begin.bat`** OR run `capture_begin.bat walk_5` | **Once per test** |
| 3 | (Optional) Type a note: `capture_note.bat Starting HP 16/16 XP 250` | Recommended |

**Do not** open DOSBox until step 2 is done.

---

### B1. Start the game

| Step | Action |
|------|--------|
| 1 | Double-click **`play_sb.bat`** in the repo folder |
| 2 | If Windows asks **allow access to folder** → **Yes** (only this game folder, not whole drive) |
| 3 | Game should start on **D:** (your project folder) |

**Do not use D-Fend for this playbook** unless you already know its paths; `play_sb.bat` is simpler.

---

### B2. Logging (automatic when using `play_sb.bat`)

`play_sb.bat` passes (from `tools/dosbox_launch.json`):

- `-log-int21` — INT 21h calls  
- `-log-fileio` — file open/read/write via DOS  
- `-console` — log window on Windows  
- log file: `sb_trace.log` in the repo  

**Do NOT** click **Debug → Start DOSBox-X Debugger** (freezes the game).

You do **not** need to turn on INT21/file I/O in the Debug menu anymore.

---

### B3. Play exactly ONE test action

Examples (pick **one** per capture pair):

| Label idea | What you do in-game |
|------------|---------------------|
| `walk_5` | Enter dungeon, walk 5 moves, stop |
| `fight_goblin` | One fight, **Fight** only,  until dead or run |
| `kill_goblin` | One fight, use **Kill** until dead |
| `loot_cloak` | Kill, open pouch, take item |
| `equip_cloak` | Inventory, wear item |
| `exit_dungeon` | Stairs up, escape message |
| `shop_buy` | Town shop, buy one item |

**While playing, write down or screenshot:**

- HP before / after  
- XP, gold  
- Monster name  
- Combat text (“hit for 3”, “miss”, etc.)

---

### B4. Optional: DOSBox save state (memory snapshot)

| Step | Action | How often |
|------|--------|-----------|
| 1 | At a **pause** (menu, combat menu, town menu), use DOSBox-X **Save state** (slot 1) | Optional |
| 2 | On Windows desktop, double-click **`capture_snap.bat after_dosbox_save`** | Right after save state |

This does **not** replace `capture_end`; it adds an extra RAM snapshot folder under `snapshots/`.

**We do not parse `.sav` files yet** — they are for future use. **Game `.SBC` / `.DUN` files are more important.**

---

### B5. After the one action — stop and capture

| Step | Action |
|------|--------|
| 1 | Exit to a safe screen (town menu or main menu), or quit game normally |
| 2 | Close DOSBox-X (so `sb_trace.log` flushes) |
| 3 | Double-click **`capture_end.bat`** |
| 4 | Open `captures\<latest folder>\diff_report.md` |
| 5 | Edit `captures\<latest folder>\notes.txt` — paste HP/XP and what happened |

**Optional note:** `capture_note.bat Hobgoblin fight, HP 16 to 8, XP 250 to 280`

---

## Part C — How many sessions you need

Not hundreds of random hours — **typed** captures:

| Phase | Session type | Count (minimum) | Goal |
|-------|----------------|-------------------|------|
| 1 | `walk_5` | 2 | Map / XP per step |
| 2 | `fight_*` / `kill_*` | 5 | Combat bytes in `.SBC` |
| 3 | `loot_*` / `equip_*` | 3 | `.INV` format |
| 4 | `exit_dungeon` | 2 | `.DUN` changes |
| 5 | `shop_*` / cleric | 2 | Town services |

**~14–20 well-labeled capture pairs** beats 100 chaotic screenshots.

Add more only when something still doesn’t match in the Python rebuild.

---

## Part D — What is automated vs manual

| Task | Automated? | How |
|------|------------|-----|
| Copy save files before/after | **Yes** | `capture_begin.bat` / `capture_end.bat` |
| Diff report | **Yes** | `capture_end.bat` → `diff_report.md` |
| Launch DOSBox + SB.EXE | **Yes** | `play_sb.bat` |
| Log to `sb_trace.log` | **Yes** | `play_sb.bat` |
| DOSBox save states copy | **Yes** if path set in `capture_config.json` |
| Your HP/XP/combat text | **Manual** | `notes.txt` or `capture_note.bat` |
| INT21 syscall trace | **Unreliable** | Optional Debug toggles |
| Full memory disassembly | **No** | Not needed for v1 |

---

## Part E — Memory / “buffer log” (honest)

| Method | What you get | Worth it? |
|--------|----------------|-----------|
| **`.SBC` / `.DUN` / `.INV` diffs** | Persistent game state | **Best** — automated |
| **DOSBox save state (`.sav`)** | Full RAM at one instant | Optional archive |
| **`sb_trace.log`** | Emulator log, rarely combat | Low yield |
| **Start Debugger** | CPU registers, memory | Only if paused at menu; expert |
| **Procmon** | Which files opened | Once per project |

There is **no** simple “memory buffer log” like a modern app. Your **save files + capture scripts** are the reliable path.

---

## Part F — Cheat sheet (print this)

```
START TEST:
  capture_begin.bat <label>
  capture_note.bat optional starting stats

PLAY:
  play_sb.bat  → Yes to folder access
  Debug: Run normal + INT21 + file I/O ON (optional)
  Do ONE in-game action
  Optional: DOSBox save state → capture_snap.bat

END TEST:
  Quit DOSBox-X
  capture_end.bat
  Edit notes.txt + read diff_report.md
```

---

## Part G — If something breaks

| Problem | Fix |
|---------|-----|
| Game won’t start | `play_sb.bat`; allow folder access **Yes** |
| `capture_end` says no active session | Run `capture_begin.bat` first |
| Empty diff (0 changes) | You didn’t change game state, or files not in repo folder |
| Game frozen | You opened **Start Debugger** — restart DOSBox, use **Run normal** only |
| Wrong DOSBox path | Edit path inside `play_sb.bat` line with `dosbox-x.exe` |

---

## Related files

- `docs/CAPTURE_AUTOMATION.md` — capture script details  
- `docs/NEXT_FIVE_STEPS.md` — project roadmap  
- `docs/re_tools.md` — Ghidra, Procmon, alternatives  
