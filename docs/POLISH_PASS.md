# wood1.0 polish pass prep

Coverage check of major gameplay entry points in `play/sbplay.c`.

## login/user
- OK: `create_user`
- OK: `encode_password`
- OK: `apply_defaults`
## maintenance
- OK: `kill_character`
- OK: `list_characters`
- OK: `create_character`
- OK: `experience_menu`
- OK: `defaults_menu`
- OK: `print_registration`
## town
- OK: `town`
- OK: `character_menu`
- OK: `visit_cleric`
- OK: `visit_shop`
- OK: `make_wish`
- OK: `show_attributes`
## dungeon
- OK: `dungeon`
- OK: `dungeon_options`
- OK: `take_stairs`
- OK: `spring_trap`
- OK: `treasure_chest`
- OK: `show_floor`
- OK: `reveal_around`
## combat
- OK: `fight_monster`
- OK: `fight_screen`
- OK: `fight_panel`
- OK: `fight_menu_live`
- OK: `monster_talk`
- OK: `monster_specials`
- OK: `take_pet`
- OK: `staff_bolt`
## magic/songs
- OK: `cast_spell`
- OK: `apply_magic`
- OK: `sing_song`
- OK: `fill_spells`
- OK: `spell_name`
## inventory/shop
- OK: `inventory_menu`
- OK: `buy_stock`
- OK: `sell_stock`
- OK: `pick_inventory`
- OK: `list_inventory`
## ui
- OK: `menu_choice`
- OK: `panel_choose`
- OK: `edit_field`
- OK: `read_key`
- OK: `mouse_buttons`
- OK: `music_thread`
- OK: `scr_status`
## fame/save
- OK: `show_hall`
- OK: `hall_from_hero`
- OK: `save_hero`
- OK: `load_heroes`

## Documented stubs / intentional gaps
- `stair_dir` tiles 13/14: stub only; generator never places them.
- Talk/friendly success does **not** grant a pet; true tame is Cast **TAME** (effect 23) -> `take_pet`.
- Level-hop cheat lives only in `extras/sbplay_extras.patch`, not release binary.
- Narrow console windows wrap `PLAYER SELECTION` / GETUSER text.

## Smoke results (2026-11-15)
- Unit: `test_teria_can_enter_dungeon_and_fight` OK
- Unit: `test_tame_keeps_a_pet_that_swings` OK (new mage, Cast TAME, pet swings)
- Live: created new hero `WOODPET` (HUMAN/MAGE) via CREATE light-bar menus
- Sound: skipped per user request (defaults sound=0)
- Mouse: enabled in USER.SBS (`mouse=1`); move maps to arrows, left click = ENTER

## Polish candidates (next pass)
1. Live mouse smoke on maintenance light-bar (move + click)
2. Live pouch/chest menu at col 42 after a pouch drop
3. Optional console 80x25 sizing so GETUSER does not wrap mid-word
4. Audit remaining live `printf("(X)")` paths that are not behind `menu_choice`/`panel_choose`
5. Keep hard rules: no RNG reseed, no permanent DAT edits, snapshot/restore saves

## Remaining printf '(X)' lines: 28
Most are `!live` / piped-test paths; polish should confirm none are reachable in live without a light-bar alternative.
- L1927: `printf("(So is your life!!!)\n");`
- L2183: `printf("(Hmmm. You also find it odd that such one-sidedness never used to bother you\n");`
- L2361: `printf("(F) Fight\n(K) Kill\n(T) Talk\n(R) Run\n(M) Monster info\n"`
- L3051: `printf("(O) Open it\n(Q) Leave it\n(C) Cast spell\n(I) Inventory management\n");`
- L3179: `if (wears_effect(hero, 46)) printf("(At least you didn't get sick!)\n");`
- L4310: `printf("(S) Strength\n(I) Intelligence\n(C) Constitution\n(D) Dexterity\n(R) Charisma\n(L) Luck\n(Q) Quit\n");`
- L4354: `printf("(Use the arrow keys to select, ENTER to choose, Q to quit.)\n");`
- L4439: `printf("(S) Raise 1 statistic\n(M) Magic items\n(H) More hitpoints and totally healed\n");`
- L4440: `printf("(E) More experience\n(G) Gold\n");`
- L4441: `if (have_wish_pet) printf("(P) A pet %s and a dreamwolf to fight with\n", wish_pet.name);`
- L4442: `else printf("(P) A dreamwolf to fight with\n");`
- L4443: `if (foe) printf("(K) Kill the monster you are fighting now.\n");`
- L4444: `printf("(Q) Quit\n");`
- L5316: `printf("(W) Wear the %s\n", name);`
- L5317: `printf("(U) Use the %s\n", name);`
- L5318: `printf("(T) Take the %s off\n", name);`
- L5319: `printf("(D) Drop the %s\n", name);`
- L5320: `printf("(I) Find out information about the %s\n", name);`
- L5321: `printf("(Q or ESC) Return to the inventory screen\n");`
- L5371: `printf("(Use arrows or mouse to move around, ENTER for menu, or ESC to quit)\n");`
- L5374: `printf("(Use arrows or mouse to move around, ENTER to choose, or ESC to quit)\n");`
- L6004: `printf("(Phone message space is limited, so please be discretionary about calling.)" LF "\n");`
- L6160: `printf("(H) Help \n");`
- L6161: `printf("(Q or ESC) Save and go to the Main or previous Menu\n");`
- L6698: `printf("(Y) YES\n(N) NO\n");`
- L6904: `printf("(S) Single-user (for one computer and no password protection)\n");`
- L6905: `printf("(M) Multi-user (for networks or single systems needing password protection)\n");`
- L6906: `printf("(Q or ESC) Leave SB\n");`


## Polish pass applied (2026-11-15 evening)

- `live_start`: force 80x25 buffer/window and resize console HWND to ~80x25 cells
- Live light-bar conversions:
  - `wish_stat` (col 8, row 15)
  - `make_wish` (col 8, row 15/18)
  - `item_menu` (col 5, row 5)
  - `defaults_menu` (col 20, row 15)
- Chest/pouch already at col 42, row 5 (verified)
- Left as typed (QB-faithful / rare): `yes_no`, system setup S/M/Q
