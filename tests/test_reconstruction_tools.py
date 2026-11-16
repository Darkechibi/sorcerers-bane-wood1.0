"""Tests for newly added reconstruction helpers.

These tests are intentionally simple smoke tests:
- they verify tools can parse real project artifacts
- they avoid overfitting to assumptions that may change during RE
"""
from __future__ import annotations

from pathlib import Path
import unittest

from engine.models import Item, ItemModifier, Player, Stats
from engine.state import load_inventory_json
from tools.parse_inventory_file import parse_inventory


class ReconstructionToolsTests(unittest.TestCase):
    def test_parse_known_inventory_file(self) -> None:
        root = Path(__file__).resolve().parent.parent
        rows = parse_inventory(root / "TERIA.INV")
        self.assertGreater(len(rows), 0)
        self.assertTrue(rows[0]["name"])

    def test_player_effective_stats_from_equipment(self) -> None:
        player = Player(name="Learner", hp=10, max_hp=10, stats=Stats(attack=5, defense=5, agility=5, luck=5))
        cloak = Item(name="FIRECLOAK", slot="armor", is_magical=True, modifiers=ItemModifier(defense_bonus=2))
        player.equip_item(cloak)
        final_stats = player.effective_stats()
        self.assertEqual(final_stats.defense, 7)

    def test_load_inventory_json_output(self) -> None:
        root = Path(__file__).resolve().parent.parent
        # Ensure this function can load parser output from docs path once generated.
        sample_path = root / "docs" / "inventory_parsed.json"
        if not sample_path.is_file():
            self.skipTest("inventory_parsed.json not generated yet")
        items = load_inventory_json(sample_path)
        self.assertGreater(len(items), 0)


if __name__ == "__main__":
    unittest.main()
