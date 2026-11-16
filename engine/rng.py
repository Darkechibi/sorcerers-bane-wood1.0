"""Deterministic RNG wrapper for repeatable parity tests."""
from __future__ import annotations

import random


class GameRng:
    def __init__(self, seed: int = 0) -> None:
        self._rng = random.Random(seed)

    def roll(self, low: int, high: int) -> int:
        return self._rng.randint(low, high)

    def chance(self, percent: int) -> bool:
        if percent <= 0:
            return False
        if percent >= 100:
            return True
        return self.roll(1, 100) <= percent

