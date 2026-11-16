# wood1.0 — Release Notes

C rebuild of Sorcerer's Bane aiming for near-original live UI/behavior parity with the QB reference in `reconstructed/sb_lifted.bas`.

## Layout

| Path | Contents |
|------|----------|
| `dos/` | Virgin DOS play folder: `SB.EXE` + `SB.DAT`, `ITEMFILE.DAT`, `MONSTER.DAT`, `SPELLS.DAT`, `SB.DOC` |
| `play/` | Virgin C play folder: `sbplay.c`, built `sbplay.exe`, same four `.DAT` resources |
| `tests/fixtures/` | Saved games used only by automated tests (not for release play) |

Neither `dos/` nor `play/` ships with `USER.SBS`, `SYSTEM.SBS`, `*.SBC`, `*.INV`, `*.DUN`, or hall-of-fame files. First run creates settings/characters.

## Build / run (C)

```powershell
cd play
$env:Path = "C:\mingw64\bin;$env:Path"
gcc -O2 -Wall -Wextra -o sbplay.exe sbplay.c
.\sbplay.exe
```

Or from repo root: `play.bat`

## Run (DOS)

Point DOSBox at `dos/` and run `SB.EXE` (or `dos\play_dos.bat` in a DOS environment).

## Tests

```powershell
python -m unittest discover -s tests -p "test_sbplay.py"
```

Tests copy fixtures into `play/` temporarily, then clean them off.

## Hard rules (unchanged)

- Do not reseed RNG (`basic_seed = 0x00050000`).
- Do not change encounter rate, tile 210, or the shop buy-then-sell quirk.
- Do not permanently edit `MONSTER.DAT` / `SB.DAT`.
- Do not regenerate fixture floors under `tests/fixtures/`.

## Known remaining differences

- Level-hop cheat lives only in `extras/` patches if present, not the release binary.
- Console is windowed Win32, not full-screen DOS; spacing/attrs aim to match.
