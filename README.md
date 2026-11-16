# Sorcerer's Bane — wood1.0

C rebuild of *Sorcerer's Bane* plus the original DOS game files.

## What's in this repo

| Path | What |
|------|------|
| `play/` | **C source** (`sbplay.c`), **Windows release build** (`sbplay.exe`), and the `.DAT` resources needed to run it |
| `dos/` | **Original DOS** game (`SB.EXE`, `SB.DOC`) and the same shared `.DAT` resources |
| `RELEASE_NOTES.md` | Build notes and hard rules |

Both `play/` and `dos/` are virgin: no save games, no `USER.SBS` / `SYSTEM.SBS`. First run creates those.

## Run the C release (Windows)

```powershell
cd play
.\sbplay.exe
```

Or from the repo root: `play.bat`

### Rebuild from source

```powershell
cd play
# needs MinGW gcc on PATH
gcc -O2 -Wall -Wextra -o sbplay.exe sbplay.c
```

## Run the original DOS version

Point DOSBox (or DOSBox-X) at the `dos/` folder and run `SB.EXE`.

## Shared data files

These must sit next to the executable you run:

- `ITEMFILE.DAT`
- `MONSTER.DAT`
- `SPELLS.DAT`
- `SB.DAT`
