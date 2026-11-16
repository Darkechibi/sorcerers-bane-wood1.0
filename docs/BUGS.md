# Bugs to re-check later

# Later, after the game is fully replicated

- Reseed the random generator before a run starts. Until then every fresh launch begins at seed 0x50000, so the first dungeon monster is always the hobgoblin. Do not change that while the rest of the game is still being matched to the original.

- Shop buy-then-sell profit. A stock dagger costs 37 and sells back for 48 (TERIA, charm 24), so gold goes 20416, then 20379, then 20427. Charge is INT(base * 15 / charm). Payout is INT(base * charm / 30). Both numbers come from the shop procedures. Check the original before changing either one.

- Lycanthropy (ability 30) never takes hold. The on-hit routine (1A65:4B3C) checks the counter plus 1 against 3, but never raises the counter, so it only ever prints "You feel strange". Leave it that way.

- An energy drain (ability 13) sets experience to the current level's floor minus 1000, and does not lower the stored level. At level 1 that leaves -1000 experience. Leave it that way.

- DIFFUSE A TRAP (SPELLS.DAT record 2, effect 8) has no case in the original spell switch. A cast spends the slot, prints the name, and then does nothing. Leave it that way.
