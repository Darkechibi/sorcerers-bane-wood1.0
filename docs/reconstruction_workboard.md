# Sorcerer's Bane Reconstruction Workboard

## Play slice todo

- [x] Rare chest item. The find names the kind, and yes puts it in the pack unidentified.
- [x] Chest trap (enter_04E23): the trap ward and worn effect 8 block it. Damage is checked at once ("TRAPPED CHEST"), then a hold.
- [x] Effect 34 (sickness): worn effect 46 blocks it with "It doesn't seem to affect you".
- [x] Reveal 147F8: sight range (effect 5), blindness and its recovery roll, filtering (41), trap generation (28); doors and features stop a run.
- [x] show_roll prints the "=== === ..." rule under the stat header.
- [x] Live console (stdin and stdout both a console): color_25283 with the mono mapping, LOCATE, QB-style scrolling text windows, row 25 status (proc_2311E), the dungeon screen with the stay_12801 grid, the fight screen (proc_1C494), maintenance, character and create layouts. Piped output is unchanged.
- [x] Music mnt120_24D5C (PLAY phrases while the key reader waits), mouse (proc_243D9 moves and buttons, row 24 description), field editor 23200 "Invalid key was hit", user defaults applied after login.
- [x] Inventory screen (05F8E) live: title 1,30, the 1 on 7 bar rows 2-4, items two to a row from row 6, staff line 23,1 in 12; the shop's IDENTIFY/RECHARGE pickers use it.
- [x] Live layouts: choice menu (05BB4), experience (0D47B), attributes (0F9E0), cleric and shop in the town frame (014BF, 090AD), wish (19049), and the cast, spell, sing and M menus in the right panel (096A0, 09A0F, 108A6, 16F5D).
- [ ] Light-bar menu_choice for the remaining menus (they still take a typed line).
- [x] Dragons and Lodi: extra attacks, breath, staffs, the gold dragon's wish, and the ending.
- [x] Bright-light trap blanks the map. Sight returns on a 1-in-20 redraw, with "You can see again".
- [x] Stair bytes 13 and 14. Stub only: same stairs as 24 and 25. See Stubs.
- [x] Down stairs build the next floor, up to floor 30. Floor 29 gets the four dragons. Floor 30 gets Lodi's lair instead of a down stair.
- [x] Spell casting: the menu, the fighter rejection, and concentration.
- [x] Air Shield: +2 withstand and +2 avoid, then a roll drops it.
- [x] Invisibility: +2 to hit and +2 avoid, then a roll drops it.
- [x] Haste: extra attacks, and it wears off on a 1-in-20 roll.
- [x] Dispel: magic aimed at you fizzles for that fight. Your own buffs stay.
- [x] Remove Cursed Item: takes the item off, even when the curse would hold it.
- [x] Dream Wolf: it takes the swing. A phasing monster sees through it.
- [x] Sleep: a hit puts the monster to sleep. It skips turns until it wakes.
- [x] Tame: a success puts that creature in the fight as a pet.
- [x] Damage spells: magic resist, the staff's conscience, and the ability-26 fizzle.
- [x] Speed ticks: you, the monster, and the pet each act when their speed adds up. Dragons are speed 4, not 4 swings.
- [x] Monster specials every tick: staff bolt, scream, sickness, paralyze, ice, charm, lightning, fire, stone.
- [x] Monster casters (ability 27), K auto-fight, paralysis, and the Staff of Power bolt and melee conscience.
- [x] On-hit effects (4B3C): disease, drain, gold and item theft, corrode, drown, sleep and sickness poison, possession, lycanthropy, and the monster teleporting away.
- [x] Pet attack (595D): phase roll, block roll, damage, phase / magic-weapon / hit / miss / glance messages.
- [x] Run (28CA): run rating against the monster's guard, boots, friendly monsters, and the speech lines.
- [x] Regeneration and the step routine: +1 hp per hero turn in a fight, walking heal every INT(150/CON) steps, the damaging item, and spells back every INT(400/spell power) steps.
- [x] Level up and down (9D5:9F8B) after each fight, with the hitpoint rolls and the experience-drain death.
- [x] Pet healing while walking: 1 hp every INT(150 / pet armor [0x23E]) steps up to [0x23A]. The pet is saved at record bytes 108..145; tame sets max to the larger of minimum hp and the foe's hp left.
- [x] Bard songs (sing_a_song_108A6): songs known INT(level/3) plus worn instrument bonus, song kept at record word 96. Any song -1 run; healing walk heals level hp; ferocity +1 hit/damage/withstand/avoid and speed; soothing +4 charm; dispelling is anti-magic. Re-rating stops a song past the known count.
- [x] Fight menu extras: (M) Monster info (character_monster_match_up_1A696).
- [x] Inventory (wield_0684E): W wear, U use, T take off, D drop, I item info, item menu; worn slots per kind (proc_00A98), floating weapon/flute slots, cursed items stay on, wearing reveals the real name. Using an item ends the screen. Also in the fight menu.
- [x] Lodi's SORCERERSLAIR state ([0x208] = 2, record word 80): the staffs vanish, staff powers (==1 checks) stop; without it SORCERERNOSTAFF (not in SB.DAT) and Lodi keeps his staff. DRAGONSLAIR text before dragons.
- [x] BAZERKER curse (worn effect 35, [0xBE]): forced fighting each round unless Gilcrest ([0x208] = 1) blocks it.
- [x] Main/town (F) experience table (0D47B), main (K) kill character (0E905: killer "player", file name at +20), invalid-key message, WAND OF TRAP CREATION (37) is a silent no-op like the original.
- [x] Hall of Fame: writer 10E6E (town Q, death, K), viewer 0BE69 + HALLFAME.TXT on quit, number formatter 25D94. Death keeps the save.
- [x] (P) registration form (0EAE8 + doshareware_25421 printer branch) appended to LPRINT.TXT; quit screen 0D2B8 (DOSHAREWARE + order screen).
- [x] (D) defaults (17F3F/212EF): USER.SBS +78 color, +80 sound, +82 mouse, +84 mouse description, +86 alarm CHR$(7). Saved, no console effect; no mouse, so mouse words save as 0.
- [x] USER.SBS login: SYSTEM.SBS single/multi mode, getuser, createuser, encoded passwords and master password, proc_245DD file names, party file from +70, character files from +20.
- [x] Lock files (party .SBL held for the session, HALLLOCK.SBL, KILLLOCK.SBL) with the 0x9D9F error handler (count, SLEEP 1, RESUME NEXT, 11th error ends), SYSTEM.SBS blocked hours (HOURSBLOCKED), time limit (proc_25CF7, TIMESUP) and max live characters (NOMORECHARS).
- [x] SYSTEM.SBS setup when the file is missing or empty: setup_0F632 (single/multi/leave) and the SYSTEM SCREEN form (maximum_users_allowed_186AA) with its ranges and encoded administrator password.
- [x] Illusions (ability 15) fade and animated monsters (16) turn to dust under dispel or a worn effect-24 item, at the top of every tick.
- [x] Kill routine (1C96): experience is the 16-bit (hp left * tier) plus the record's life; the spore cloud (28) explodes for INT(RND*10)+1.
- [x] Spending a wish (19049): statistic, magic item, hitpoints, experience, gold, pet and dreamwolf, and the djinni kill in a fight. Town, walking menu and fight.
- [x] Ring of identify (effect 3) names a chest item when you pick it up.
- [x] Floor 30 maze (15774): wall rows, short walls, one secret door per wall run, then the usual stocking.
- [x] Help screens from SB.DAT (main, town, shop, cleric, walking, fight, character creation), with the SB.DAT line codes.
- [x] Run mode ([0x1F2], record offset 58): R or 0 toggles it, and a step repeats over plain floor and doors. The M menu while walking.
- [x] Secret doors: tile 11/12 is passable until found, then shows as a door.
- [x] Resurrection (16562) on every hitpoint death: 100 gold, the CON roll, then CON-1 and max hp scaled. A failed try still keeps the save (no character deletion).

## Coverage audit gaps

Found by matching each procedure's string literals in `reconstructed/sb_lifted.bas` against `play/sbplay.c`.

- [x] Cleric (enter_00E6E, 01266, lerend_014BF): SB.DAT texts, CINT(VAL) gift, hp + INT(gift/level), sickness - INT(gift/200) under STAYSICK at 200, NOREMOVE under 50*level, remove_08227 takes the item off. A gift of 0 or less adds sickness and ends the visit; no gold keeps the whole gift.
- [x] Shop (enter_08320, 08828, 08D9C, kiera_090AD, 092A2): SB.DAT texts, the offer screen, buy and sell lists that stay up until Q, WEARWIELD after a purchase below level 3.
- [x] Allyn's character menu (03522, lerend_07BA0): the intro and the "mind reader" reply. The battle log, the L floor jump and the T trap series are removed; `extras/sbplay_extras.patch` restores them.
- [x] Wish dialogue (19049): all lines present (the stat lines are composed).
- [x] Talk (208DD) and its success routine (1DD25): the gold dragon's lair (tile 17) gives the gold staff and takes the gold; ability 21 grants a wish on CINT(RND*3)=1 (fail: CINT(RND*50+50) hp and 1 INT); then deck (25), cleric (22), salesperson (23), else HINT1-48. Cleric, shop and deck monsters are only reached by talking.
- [x] Staffs are record flags (+72 gold, +74 red, +76 black, +78 white, +80 power), not items. Assembly (mage_0C4A1) holds twice.
- [x] Fight screen (proc_1C494, name_1C5C5): centered name, rule, NAME/HITPOINTS/MONSTER panel each round. "You feel much better now." after a fight with charm or stone counts (she_1B3FD). "then resurrected!" (1D25D), LOSS OF EXPERIENCE (007A9), sleeping lines (170C7).
- [x] SB.DAT missing key: key + "not found.  Hit any key to continue" (CARD9 and SORCERERNOSTAFF are missing from Wood's SB.DAT). INVALID CLASS in the experience menu.
- [x] Walking STAY menu (12801), with the saved floor (var_01F4, record +60): R resumes on it, and the town blocks the cleric and shop ("cannot visit ... until he/she leaves the dungeon!") while it is above 0.
- [x] Colour (25283) and screen positioning in the live console; shop, cleric, wish, cast/sing panel and the remaining screens still print in order.
- [x] Music (mnt120_24D5C, 37 PLAY strings) and the mouse (24897).
- [x] "Invalid key was hit" (23200) in the live field editor.
- [x] Start-up errors, the Y/N prompt, and no tile fallback.

## Stubs

- `stair_dir` in `play/sbplay.c`. Byte 14 is up stairs and byte 13 is down stairs, the same path as 24 and 25. The floor generator never writes 13 or 14, and the saved floors do not contain them, so this function is a stub for a tile that does not appear in play.

## Current state

- `MONSTER.DAT` parser exists and exports `monsters.json`.
- Asset catalog is generated at `docs/asset_catalog.json`.
- Engine scaffold exists under `engine/` with deterministic RNG and placeholder combat.
- Smoke tests exist in `tests/test_engine_smoke.py`.
- Snapshot diff tool exists: `tools/diff_snapshots.py`.
- Inventory parser exists: `tools/parse_inventory_file.py`.

## Evidence-backed facts

- Monster records are 196 bytes each.
- `monsters.json` currently has 86 rows.
- `SB.EXE` is present and can be used later for deeper RE.

## Known unknowns

- Exact semantics of `stat_offset_40` through `stat_offset_62`.
- True formula for hit chance, damage, armor, and XP.
- Mapping of additional data files (`ITEMFILE.DAT`, `SPELLS.DAT`, `TERIA.DUN`, `SB.DAT`).

## Immediate next tasks (no gameplay tracing required)

1. Build parser for `ITEMFILE.DAT`.
2. Build parser for `SPELLS.DAT`.
3. Add richer inventory semantics (equipped/cursed/magical flags with confidence).
4. Add parity-test harness that ingests manual traces and snapshot diffs.

## Guides

- **Play session (exact steps):** `docs/PLAYBOOK_STEP_BY_STEP.md`
- **Automated captures:** `docs/CAPTURE_AUTOMATION.md`
- **Start here (5 steps):** `docs/NEXT_FIVE_STEPS.md`
- **RE tools (Ghidra alternatives, Procmon, QB notes):** `docs/re_tools.md`

**Launch game:** double-click `play_sb.bat` in repo root.

## Commands

- Export monsters:
  - `python tools/parse_monster_dat.py`
- Validate export:
  - `python tools/validate_data.py monsters.json`
- Regenerate asset catalog:
  - `python tools/catalog_assets.py`
- Engine smoke demo:
  - `python -m engine.demo`
- Parse inventory:
  - `python tools/parse_inventory_file.py TERIA.INV -o docs/inventory_parsed.json`
- Compare capture snapshots:
  - `python tools/diff_snapshots.py "before change" "after change"`
- Run tests:
  - `python -m unittest discover -s tests -p "test_*.py"`
