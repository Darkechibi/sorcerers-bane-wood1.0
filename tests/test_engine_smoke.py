from __future__ import annotations

from pathlib import Path
import unittest

from engine.combat import resolve_attack_turn
from engine.models import Player, Stats
from engine.rng import GameRng
from engine.state import load_monsters_json


class EngineSmokeTests(unittest.TestCase):
    def test_monsters_load(self) -> None:
        root = Path(__file__).resolve().parent.parent
        monsters = load_monsters_json(root / "monsters.json")
        self.assertGreater(len(monsters), 0)
        self.assertTrue(monsters[0].name)

    def test_deterministic_turn(self) -> None:
        root = Path(__file__).resolve().parent.parent
        monsters = load_monsters_json(root / "monsters.json")
        player = Player(name="Hero", hp=30, max_hp=30, stats=Stats(attack=8, defense=6, agility=6, luck=5))
        enemy = monsters[0]
        rng = GameRng(seed=1337)
        event = resolve_attack_turn(player, enemy, rng)
        self.assertFalse(event.hit)
        self.assertEqual(event.damage, 0)
        self.assertEqual(event.defender_hp_after, enemy.max_hp)


if __name__ == "__main__":
    unittest.main()
