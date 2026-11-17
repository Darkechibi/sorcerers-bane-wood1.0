# DOSBox-X command lines (editable)

## Start up again (full flow)

1. `capture_begin.bat walk_5`   (or any label)
2. `play_sb.bat`                (starts DOSBox-X)
3. Play **one** action in-game
4. Close DOSBox-X
5. `capture_end.bat`

---

## Where to add commands

Edit **`tools/dosbox_launch.json`** — no batch escaping needed.

| JSON field | What it does |
|------------|----------------|
| `dosbox_exe` | Path to DOSBox-X |
| `logfile` | e.g. `sb_trace.log` in repo |
| `game_dir` | Folder mounted as drive (`.` = repo root) |
| `drive_letter` | Usually `d` (not Windows C:) |
| `main_program` | Usually `sb.exe` |
| `extra_set_config` | DOSBox `-set` lines (logging, cpu, etc.) |
| `optional_commands` | Extra `-c` DOS commands **before** auto run of `sb.exe` |

After editing, save the file and double-click **`play_sb.bat`** again.

---

## Examples to add in `optional_commands`

```json
"optional_commands": [
  "echo Sorcerer Bane loading...",
  "config -set cpu cycles=10000"
]
```

Each entry is one DOS command (what you would type at `Z:\>` inside DOSBox).

**Do not** put `mount` here — the launcher adds `mount d "your folder"` automatically.

---

## Multiple `-c` on the command line (how it works)

DOSBox-X accepts repeated flags:

```text
dosbox-x.exe -workingdir "..." -set "log logfile=..." -c "mount d \"...\"" -c "d:" -c "sb.exe"
```

`play_sb_launch.ps1` builds this list from JSON.

---

## Debug logging (command line — DOSBox-X 2026.05.02)

From `dosbox-x -helpdebug`, these are set automatically in `tools/dosbox_launch.json`:

```json
"cli_debug_flags": [
  "-log-int21",
  "-log-fileio",
  "-console"
]
```

| Flag | Meaning |
|------|---------|
| `-log-int21` | Log INT 21h calls (debug level) |
| `-log-fileio` | Log file I/O through INT 21h |
| `-console` | Show logging console (Windows) |

Also set in config via launcher:

```json
"extra_set_config": [
  "log logfile=REPLACE_LOGFILE",
  "log debuggerrun=normal"
]
```

**You no longer need** the Debug menu toggles for INT21/file I/O if these flags work on your build.

To disable: set `"cli_debug_flags": []` in JSON.

Other useful flags (add to `cli_debug_flags` if you want):

- `-early-debug` — early init messages (implies `-console`)
- `-nolog` — disable log file (opposite of what we want)

---

## Alternative: `[autoexec]` in dosbox-x.conf

Advanced: edit your `dosbox-x.conf` section `[autoexec]`:

```ini
[autoexec]
@echo off
mount d "C:\path\to\this\repo\dos"
d:
SB.EXE
```

Then start DOSBox-X without `play_sb.bat`. The JSON launcher is easier for this project.

---

## Fix wrong DOSBox path

If `play_sb.bat` fails, set `dosbox_exe` in `tools/dosbox_launch.json` to your real EXE, e.g.:

```json
"dosbox_exe": "C:/path/to/dosbox-x.exe"
```
