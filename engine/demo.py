"""Run a single deterministic combat turn for quick smoke testing."""
from __future__ import annotations

from pathlib import Path

from .combat import resolve_attack_turn
from .models import Player, Stats
from .rng import GameRng
from .state import load_monsters_json


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    monsters = load_monsters_json(root / "monsters.json")
    if not monsters:
        raise SystemExit("no monsters found in monsters.json")

    player = Player(name="Hero", hp=30, max_hp=30, stats=Stats(attack=8, defense=6, agility=6, luck=5))
    enemy = monsters[0]
    rng = GameRng(seed=1337)

    event = resolve_attack_turn(player, enemy, rng)
    print(
        f"{event.attacker} attacks {event.defender}: "
        f"{'hit' if event.hit else 'miss'}, "
        f"damage={event.damage}, "
        f"defender_hp={event.defender_hp_after}"
    )


if __name__ == "__main__":
    main()
