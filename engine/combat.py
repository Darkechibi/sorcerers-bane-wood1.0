"""Minimal combat loop placeholder while formulas are reverse engineered.

The formulas here are intentionally simple and AD&D-inspired, not final parity.
They are easy to tune against live gameplay traces.
"""
from __future__ import annotations

from dataclasses import dataclass

from .models import Combatant
from .rng import GameRng


@dataclass(slots=True)
class CombatEvent:
    """Single attack result.

    We keep this event object very explicit because it becomes test data and can
    also drive future combat logs or UI replay output.
    """

    attacker: str
    defender: str
    hit: bool
    damage: int
    defender_hp_after: int


def _combat_stats(entity: Combatant) -> tuple[int, int, int]:
    """Return (attack, defense, agility) for combat formulas.

    `Player` has an `effective_stats()` helper (item bonuses included),
    while `Monster` currently uses base stats directly.
    """
    if hasattr(entity, "effective_stats"):
        stats = entity.effective_stats()  # Player path
    else:
        stats = entity.stats
    return stats.attack, stats.defense, stats.agility


def _hit_chance(attacker: Combatant, defender: Combatant) -> int:
    """Compute percentage chance to hit.

    Current model:
    - baseline 65%
    - agility delta scales by 2
    - hard-clamped to avoid impossible or guaranteed outcomes
    """
    _, _, attacker_agi = _combat_stats(attacker)
    _, _, defender_agi = _combat_stats(defender)
    base = 65 + (attacker_agi - defender_agi) * 2
    return max(10, min(95, base))


def resolve_attack_turn(attacker: Combatant, defender: Combatant, rng: GameRng) -> CombatEvent:
    """Resolve one attack using temporary, testable placeholder formulas."""
    hit = rng.chance(_hit_chance(attacker, defender))
    damage = 0
    if hit:
        attacker_attack, _, _ = _combat_stats(attacker)
        _, defender_defense, _ = _combat_stats(defender)
        roll = rng.roll(1, max(1, attacker_attack))
        # Soft mitigation model. Easy to calibrate as traces grow.
        damage = max(1, roll - defender_defense // 3)
        defender.hp = max(0, defender.hp - damage)
    return CombatEvent(
        attacker=attacker.name,
        defender=defender.name,
        hit=hit,
        damage=damage,
        defender_hp_after=defender.hp,
    )

