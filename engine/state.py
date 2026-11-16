"""Game state helpers and data loading utilities."""
from __future__ import annotations

import json
from dataclasses import dataclass, field
from pathlib import Path

from .models import Item, ItemModifier, Monster, Player, Stats


@dataclass(slots=True)
class GameState:
    """Container for runtime game state."""

    player: Player
    monsters: list[Monster] = field(default_factory=list)


def load_monsters_json(path: Path) -> list[Monster]:
    """Load decoded monsters JSON into typed `Monster` objects."""
    data = json.loads(path.read_text(encoding="utf-8"))
    monsters: list[Monster] = []
    for row in data:
        hp_guess = int(row.get("long_offset_36", 1))
        hp_guess = max(1, hp_guess // 10)
        monsters.append(
            Monster(
                name=str(row.get("name", "UNKNOWN")) or "UNKNOWN",
                hp=hp_guess,
                max_hp=hp_guess,
                source_index=int(row.get("index", -1)),
                tier=int(row.get("tier_offset_20", 0)),
                disposition=int(row.get("disposition_offset_22", -1)),
                stats=Stats(
                    attack=max(1, int(row.get("stat_offset_40", 5))),
                    defense=max(1, int(row.get("stat_offset_42", 5))),
                    agility=max(1, int(row.get("stat_offset_44", 5))),
                    luck=max(1, int(row.get("stat_offset_46", 5))),
                ),
            )
        )
    return monsters


def load_inventory_json(path: Path) -> list[Item]:
    """Load parsed inventory JSON into `Item` objects.

    This bridges `tools/parse_inventory_file.py` output into the engine model.
    Because inventory semantics are still partially unknown, this function uses
    conservative guesses for slot and bonuses.
    """
    data = json.loads(path.read_text(encoding="utf-8"))
    items: list[Item] = []
    for row in data:
        name = str(row.get("name", "UNKNOWN"))
        guessed = row.get("guessed_fields", {})
        magic_flag = int(guessed.get("likely_magic_or_flag", 0))
        bonus_guess = int(guessed.get("likely_bonus_or_power", 0))

        upper = name.upper()
        if "RING" in upper:
            slot = "ring"
        elif "SWORD" in upper or "WAND" in upper:
            slot = "weapon"
        elif "SHIELD" in upper:
            slot = "shield"
        elif any(k in upper for k in ("CLOAK", "MAIL", "HELM", "GAUNTLETS", "BOOTS")):
            slot = "armor"
        else:
            slot = "misc"

        # Early reconstruction rule: positive magic/power likely helps defense.
        modifiers = ItemModifier(defense_bonus=max(0, bonus_guess // 100))
        items.append(
            Item(
                name=name,
                slot=slot,
                is_magical=magic_flag > 0,
                modifiers=modifiers,
            )
        )
    return items

