"""Core data models used by the reconstruction engine.

This file is intentionally documented in a tutorial-friendly way.
The project is reverse engineering a 1992 DOS game, so many concepts are
still evolving. We keep models explicit and easy to read so behavior can be
changed safely as new evidence appears.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from typing import Literal


@dataclass(slots=True)
class Stats:
    """Combat-relevant stat bundle.

    These names are modern convenience names for now. They will eventually map
    to exact in-game meaning once we finish decoding formula behavior.
    """

    attack: int = 5
    defense: int = 5
    agility: int = 5
    luck: int = 5


@dataclass(slots=True)
class ItemModifier:
    """Small additive stat modifier applied by an equipped item."""

    attack_bonus: int = 0
    defense_bonus: int = 0
    agility_bonus: int = 0
    luck_bonus: int = 0


@dataclass(slots=True)
class Item:
    """Inventory/equipment item used by the Python reconstruction layer.

    Notes:
    - `is_magical` and `is_cursed` are gameplay-style flags useful for UI and
      decision logic.
    - `slot` is intentionally simple right now (`armor`, `weapon`, `ring`...)
      and can be expanded as we decode more game rules.
    """

    name: str
    slot: Literal["armor", "weapon", "ring", "shield", "misc"] = "misc"
    is_magical: bool = False
    is_cursed: bool = False
    modifiers: ItemModifier = field(default_factory=ItemModifier)


@dataclass(slots=True)
class Combatant:
    """Shared base class for all entities that can participate in combat."""

    name: str
    hp: int
    max_hp: int
    stats: Stats = field(default_factory=Stats)

    @property
    def alive(self) -> bool:
        return self.hp > 0


@dataclass(slots=True)
class Monster(Combatant):
    """Monster loaded from decoded data files."""

    source_index: int = -1
    tier: int = 0
    disposition: int = -1


@dataclass(slots=True)
class Player(Combatant):
    """Playable character data model."""

    level: int = 1
    xp: int = 0
    gold: int = 0
    inventory: list[Item] = field(default_factory=list)
    equipped: dict[str, Item] = field(default_factory=dict)

    def equip_item(self, item: Item) -> None:
        """Equip item into its slot, replacing any existing slot occupant."""
        self.equipped[item.slot] = item

    def effective_stats(self) -> Stats:
        """Return stats after applying equipped item bonuses.

        This gives the combat layer a clean single method to fetch "final"
        numbers while we are still experimenting with formula parity.
        """
        total = Stats(
            attack=self.stats.attack,
            defense=self.stats.defense,
            agility=self.stats.agility,
            luck=self.stats.luck,
        )
        for equipped_item in self.equipped.values():
            total.attack += equipped_item.modifiers.attack_bonus
            total.defense += equipped_item.modifiers.defense_bonus
            total.agility += equipped_item.modifiers.agility_bonus
            total.luck += equipped_item.modifiers.luck_bonus
        return total

