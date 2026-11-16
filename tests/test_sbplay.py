"""Build and run the native playable slice."""
from __future__ import annotations

from pathlib import Path
import subprocess
import threading
import time
import unittest


def walks_until_floor1_fight() -> str:
    """TERIA, level 13, floor 1: INT(RND*200)==1 on step 557. Bounce west/east."""
    return "".join("4\n" if n % 2 else "6\n" for n in range(1, 558))


LOGIN = "Y\n1\nLADY\n"


class SbPlayTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        repo = Path(__file__).resolve().parent.parent
        cls.repo = repo
        # Game cwd is play/ (virgin DAT resources). Saves come from tests/fixtures.
        cls.root = repo / "play"
        cls.fixtures = Path(__file__).resolve().parent / "fixtures"
        cls.exe = cls.root / "sbplay.exe"
        subprocess.check_call(
            ["gcc", "-O2", "-Wall", "-Wextra", "-o", str(cls.exe), str(cls.root / "sbplay.c")],
            cwd=cls.root,
        )

    KEPT = {"HALLFAME.DAT", "HALLFAME.TXT", "USER.SBS", "LPRINT.TXT", "SYSTEM.SBS"}
    SCRATCH = ("LPRINT.TXT", "WRITHALL.SBT", "KILLCHAR.SBC", "HALLLOCK.SBL", "KILLLOCK.SBL", "DARKECHI.SBL")

    def setUp(self) -> None:
        self._saved: dict[str, bytes] = {}
        for path in self.fixtures.iterdir():
            if path.is_file() and (path.suffix.upper() in {".SBC", ".INV", ".DUN"} or path.name.upper() in self.KEPT):
                self._saved[path.name] = path.read_bytes()
        self._real = dict(self._saved)
        party = bytearray(self._saved["DARKECHI.SBC"])
        party[60:62] = bytes(2)
        self._saved["DARKECHI.SBC"] = bytes(party)
        dun = bytearray(self._saved["TERIA.DUN"])
        dun[0:4] = (10).to_bytes(2, "little") + (2).to_bytes(2, "little")
        self._saved["TERIA.DUN"] = bytes(dun)
        self.restore_saves()

    def restore_saves(self) -> None:
        for name in self.SCRATCH:
            if name not in self._saved:
                (self.root / name).unlink(missing_ok=True)
        for name, data in self._saved.items():
            (self.root / name).write_bytes(data)

    def tearDown(self) -> None:
        self.restore_saves()
        for name, data in self._real.items():
            (self.root / name).write_bytes(data)
        # Keep play/ free of fixture/user saves after each test.
        for path in list(self.root.iterdir()):
            if path.is_file() and (
                path.suffix.upper() in {".SBC", ".INV", ".DUN", ".SBL"} or path.name.upper() in self.KEPT
            ):
                path.unlink(missing_ok=True)

    def run_script(self, script: str) -> subprocess.CompletedProcess[str]:
        try:
            return subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + script, capture_output=True, text=True
            )
        finally:
            self.restore_saves()

    def test_maintenance_menu(self) -> None:
        menu = subprocess.run([str(self.exe)], cwd=self.root, input=LOGIN + "U\nQ\n", capture_output=True, text=True)
        self.assertEqual(menu.returncode, 0, menu.stdout + menu.stderr)
        self.assertIn("MAINTENANCE MENU", menu.stdout)
        self.assertIn("CHARACTER CHOICE MENU", menu.stdout)
        self.assertIn("(U) USE AN EXISTING CHARACTER", menu.stdout)

    def test_teria_can_enter_dungeon_and_fight(self) -> None:
        root = self.root
        exe = self.exe
        script = "U\n1\nR\n" + walks_until_floor1_fight() + "F\nQ\nQ\nQ\n"
        result = subprocess.run([str(exe)], cwd=root, input=LOGIN + script, capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("TERIA", result.stdout)
        self.assertIn("RUN IN THE DUNGEON", result.stdout)
        self.assertIn("DUNGEON LEV -  1", result.stdout)
        self.assertIn("@", result.stdout)
        self.assertEqual(result.stdout.count("You encounter a "), 1)
        self.assertIn("You encounter a GOBLIN", result.stdout)
        self.assertTrue(
            "You hit " in result.stdout or "You missed." in result.stdout or "glanced" in result.stdout
        )

    def test_monster_info_takes_no_turn(self) -> None:
        result = self.run_script("U\n1\nR\n" + walks_until_floor1_fight() + "M\n\nQ\nQ\nQ\nQ\n")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        info = result.stdout.split("CHARACTER/MONSTER MATCH UP", 1)[1]
        self.assertIn("Ability to stop your running  5", info)
        self.assertIn("A GOBLIN IS ELVEN SIZE, BUT UGLY!!", info)
        self.assertNotIn("Round 2", info.split("Unknown key was hit.")[0])

    def test_pet_heals_while_walking(self) -> None:
        party = bytearray(self._saved["DARKECHI.SBC"])
        party[132:134] = (50).to_bytes(2, "little")
        (self.root / "DARKECHI.SBC").write_bytes(party)
        steps = "".join("4\n" if n % 2 else "6\n" for n in range(1, 41))
        result = subprocess.run([str(self.exe)], cwd=self.root, input=LOGIN + "U\n1\nR\n" + steps + "Q\nQ\nQ\nQ\n",
                                capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        saved = (self.root / "DARKECHI.SBC").read_bytes()
        self.assertEqual(saved[108:120], b"GRIZZLY BEAR")
        self.assertEqual(int.from_bytes(saved[132:134], "little"), 60)

    def test_staff_spent_at_lodi_stops_its_powers(self) -> None:
        script = "U\n1\nR\n" + walks_until_floor1_fight() + "F\nQ\nQ\nQ\nQ\n"
        for state, glows in ((1, True), (2, False)):
            party = bytearray(self._saved["DARKECHI.SBC"])
            party[80:82] = state.to_bytes(2, "little")
            party[128:130] = bytes(2)
            (self.root / "DARKECHI.SBC").write_bytes(party)
            result = subprocess.run([str(self.exe)], cwd=self.root, input=LOGIN + script, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertEqual("your staff starts to glow" in result.stdout, glows)
            self.assertEqual((self.root / "DARKECHI.SBC").read_bytes()[80], state)
            self.restore_saves()

    def test_bazerker_sword_forces_the_fight_unless_gilcrest(self) -> None:
        script = "U\n1\nR\nI\nT 13\nW 14\nQ\n" + walks_until_floor1_fight() + "Q\nQ\nQ\nQ\nQ\n"
        forced = self.run_script(script)
        self.assertEqual(forced.returncode, 0, forced.stdout + forced.stderr)
        fight = forced.stdout.split("You encounter a GOBLIN", 1)[1]
        self.assertNotIn("(F) Fight\n(K) Kill", fight.split("You've killed it", 1)[0])
        party = bytearray(self._saved["DARKECHI.SBC"])
        party[80:82] = (1).to_bytes(2, "little")
        (self.root / "DARKECHI.SBC").write_bytes(party)
        blocked = self.run_script(script)
        self.assertIn("It appears that Gilcrest is blocking your BAZERKER curse!\n(F) Fight\n(K) Kill", blocked.stdout)

    def test_lodi_lair_spends_the_staff(self) -> None:
        dun = bytearray(self._saved["TERIA.DUN"])
        dun[29 * 2032:29 * 2032 + 4] = (69).to_bytes(2, "little") + (5).to_bytes(2, "little")
        (self.root / "TERIA.DUN").write_bytes(dun)
        party = bytearray(self._saved["DARKECHI.SBC"])
        party[60:62] = (30).to_bytes(2, "little")
        party[80:82] = (1).to_bytes(2, "little")
        (self.root / "DARKECHI.SBC").write_bytes(party)
        result = subprocess.run([str(self.exe)], cwd=self.root, input=LOGIN + "U\n1\nR\n6\n\nQ\nQ\nQ\nQ\nQ\n",
                                capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("THE LAIR OF LODI THE SORCERER", result.stdout)
        self.assertIn("You encounter a LODI THE SORCERER", result.stdout)
        self.assertNotIn("Lightning shoots our from its STAFF!", result.stdout)
        self.assertEqual((self.root / "DARKECHI.SBC").read_bytes()[80], 2)

    def test_attributes_show_save_and_inventory(self) -> None:
        root = self.root
        exe = self.exe
        result = subprocess.run([str(exe)], cwd=root, input=LOGIN + "U\n1\nA\n\n\nQ\nQ\n", capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("CHARACTER ATTRIBUTES", result.stdout)
        self.assertIn("Strength  -  21", result.stdout)
        self.assertIn("Hitting ability  -  32", result.stdout)
        self.assertIn("Ability to damage-  35", result.stdout)
        self.assertIn("Fortitude        -  36", result.stdout)
        self.assertIn("Evading ability  -  42", result.stdout)
        self.assertIn("Currently in town", result.stdout)
        self.assertIn("\nINVENTORY\n", result.stdout)
        self.assertIn("HAPHESTUS-MADE SWORD", result.stdout)
        self.assertIn("Gold       -  20416", result.stdout)
        xp = int.from_bytes(self._saved["DARKECHI.SBC"][100:104], "little", signed=True)
        self.assertIn(f"Experience -  {xp}", result.stdout)

    def test_shop_and_cleric_menus(self) -> None:
        cleric = self.run_script("U\n1\nZ\nC\nC\n13\n\nX\nQ\nA\n\n\nQ\nQ\n")
        self.assertEqual(cleric.returncode, 0, cleric.stdout + cleric.stderr)
        self.assertIn("'My name is Allyn, and I'm the dungeon master around", cleric.stdout)
        self.assertIn("'Look', Allyn says, 'I'm a DM, not a mind reader! Enter a VALID choice!'", cleric.stdout)
        self.assertIn("'My name is Lerend.  I", cleric.stdout)
        self.assertIn("(C) Cure wounds", cleric.stdout)
        self.assertIn("How much would you like to give", cleric.stdout)
        self.assertIn("He thanks you for your donation.", cleric.stdout)
        self.assertIn("Hitpoints    -  138/138", cleric.stdout)
        self.assertIn("Gold       -  20403 ", cleric.stdout)
        self.assertIn("He doesn't understand you.  Please retype.", cleric.stdout)
        shop = self.run_script("U\n1\nS\nS\nQ\nZ\nQ\nQ\nQ\n")
        self.assertEqual(shop.returncode, 0, shop.stdout + shop.stderr)
        self.assertIn("'My name is Kiera.  What can I", shop.stdout)
        self.assertIn("(Q or ESC) Quit shopping\n(R) Recharge a wand", shop.stdout)
        self.assertIn("'Which item do you want to sell?' she asks nicely", shop.stdout)
        self.assertIn("WAND OF FIREBALL - 372", shop.stdout)
        self.assertIn("Kiera smiles and says 'I don't understand. What was that?'", shop.stdout)
        bought = self.run_script("U\n1\nS\nB\n1\nQ\nQ\nA\n\n\nQ\nQ\n")
        self.assertEqual(bought.returncode, 0, bought.stdout + bought.stderr)
        self.assertIn("'Which item would you like?' she asks nicely", bought.stdout)
        self.assertIn("DAGGER - 37", bought.stdout)
        self.assertIn("Gold       -  20379 ", bought.stdout)
        self.assertNotIn("Kiera radiantly beams", bought.stdout)
        poor = self.run_script("U\n2\nS\nB\n1\nQ\nQ\nQ\nQ\n")
        self.assertEqual(poor.returncode, 0, poor.stdout + poor.stderr)
        self.assertIn("Sorry, chum, but you don't have enough gold", poor.stdout)
        self.assertNotIn("Kiera radiantly beams", poor.stdout)
        named = self.run_script("U\n1\nS\nK\nY\n\n1\n\nQ\nA\n\n\nQ\nQ\n")
        self.assertEqual(named.returncode, 0, named.stdout + named.stderr)
        self.assertIn("IDENTIFY AN ITEM", named.stdout)
        self.assertIn("cost 62 in gold to \nidentify an item.  Do you wish to identify an item", named.stdout)
        self.assertIn("She smiles as she takes your money.", named.stdout)
        self.assertIn("Gold       -  20354 ", named.stdout)
        self.assertIn("It was a LARGE CRYSTALLINE SHIELD. Hit any key to continue.", named.stdout)
        broke = self.run_script("U\n2\nS\nK\nY\n\nQ\nQ\nQ\n")
        self.assertEqual(broke.returncode, 0, broke.stdout + broke.stderr)
        self.assertIn("cost 136 in gold to", broke.stdout)
        self.assertIn("you sadly realize that you are a\nlittle short on funds.", broke.stdout)
        self.assertNotIn("It was a", broke.stdout)
        refused = self.run_script("U\n2\nS\nK\nN\n\nQ\nQ\nQ\n")
        self.assertIn("'You can't blame a\ngirl for trying'", refused.stdout)
        charged = self.run_script("U\n1\nS\nR\nY\n\n12\n\nQ\nA\n\n\nQ\nQ\n")
        self.assertEqual(charged.returncode, 0, charged.stdout + charged.stderr)
        self.assertIn("cost 291 in gold to \nrecharge a wand.", charged.stdout)
        self.assertIn("She takes the wand", charged.stdout)
        self.assertIn("Gold       -  20125 ", charged.stdout)
        sick = self.run_script("U\n1\nC\nS\n0\nA\n\n\nC\nS\n200\n\nQ\nA\n\n\nQ\nQ\n")
        self.assertEqual(sick.returncode, 0, sick.stdout + sick.stderr)
        self.assertIn("you have offended him by your", sick.stdout)
        refused, cured = sick.stdout.split("After several minutes of prayer", 1)
        self.assertIn("Sick level   -  1", refused)
        self.assertIn("he sadly states\nthat he can't help you.", sick.stdout)
        self.assertIn("Gold       -  20216 ", cured)
        self.assertIn("Sick level   -  0", cured)
        lifted = self.run_script("U\n1\nC\nR\n100\n\nR\n650\n15\n\n\nQ\nA\n\n\nQ\nQ\n")
        self.assertEqual(lifted.returncode, 0, lifted.stdout + lifted.stderr)
        self.assertIn("nothing was removed.", lifted.stdout)
        self.assertIn("15) CURSED WHATSIT", lifted.stdout)
        self.assertIn("Gold       -  19666 ", lifted.stdout)
        self.assertIn("The item has been removed.  Hit any key to continue.", lifted.stdout)

    def test_low_level_purchase_gets_the_wear_wield_speech(self) -> None:
        party = bytearray(self._saved["DARKECHI.SBC"])
        party[166 + 104:166 + 108] = (1000).to_bytes(4, "little")
        (self.root / "DARKECHI.SBC").write_bytes(party)
        result = self.run_script("U\n2\nS\nB\n1\nQ\n\nQ\nQ\nQ\n")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Kiera radiantly beams as she quickly takes your gold.", result.stdout)
        self.assertIn("Of course you know this already.  Doesn't everyone?", result.stdout)

    def test_create_level1_character(self) -> None:
        save = self.root / "DARKECHI.SBC"
        original = save.read_bytes()
        inv = self.root / "ZEKE.INV"
        dun = self.root / "ZEKE.DUN"
        try:
            result = subprocess.run(
                [str(self.exe)],
                cwd=self.root,
                input=LOGIN + "C\nZEKE\nS\nM\nF\nY\nQ\n",
                capture_output=True,
                text=True,
            )
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertIn("STR INT CON DEX CHR LCK", result.stdout)
            self.assertIn("HUMAN FIGHTER   level 1", result.stdout)
            self.assertEqual(save.stat().st_size, len(original) + 166)
            self.assertFalse(dun.exists())
            self.assertEqual(save.read_bytes()[:166], original[:166])
            rec = save.read_bytes()[-166:]
            self.assertTrue(rec.startswith(b"ZEKE"))
            self.assertEqual(rec[28:35], b"FIGHTER")
            self.assertEqual(rec[35:40], b"HUMAN")
            self.assertEqual(int.from_bytes(rec[40:42], "little"), 1)
            con = int.from_bytes(rec[50:52], "little", signed=True)
            charm = int.from_bytes(rec[54:56], "little", signed=True)
            hp = int.from_bytes(rec[42:44], "little", signed=True)
            gold = int.from_bytes(rec[104:108], "little", signed=True)
            self.assertEqual(hp, int(con * 1.25))
            self.assertEqual(gold, 15 * charm)
            self.assertEqual(inv.stat().st_size, 0)
            subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + f"U\n{len(original) // 166 + 1}\nR\nQ\nQ\nQ\nQ\n",
                capture_output=True, text=True,
            )
            self.assertEqual(dun.stat().st_size, 2032)
            floor = dun.read_bytes()
            self.assertGreater(floor[4:4 + 1014].count(32), 900)
            self.assertGreater(floor[4 + 1014:].count(196), 10)
            self.assertGreater(floor[4 + 1014:].count(36), 0)
        finally:
            save.write_bytes(original)
            inv.unlink(missing_ok=True)
            dun.unlink(missing_ok=True)

    def test_kill_removes_only_that_character(self) -> None:
        save = self.root / "DARKECHI.SBC"
        original = save.read_bytes()
        inv = self.root / "ZEKE.INV"
        dun = self.root / "ZEKE.DUN"
        try:
            made = subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + "C\nZEKE\nS\nM\nF\nY\nQ\n", capture_output=True, text=True
            )
            self.assertIn("HUMAN FIGHTER   level 1", made.stdout)
            result = subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + "K\n6\nQ\n", capture_output=True, text=True
            )
            self.assertIn("Who do you want to kill?", result.stdout)
            self.assertEqual(save.read_bytes(), original)
            self.assertFalse(inv.exists())
            self.assertFalse(dun.exists())
        finally:
            save.write_bytes(original)
            inv.unlink(missing_ok=True)
            dun.unlink(missing_ok=True)

    def test_hall_of_fame_rewrites_the_same_list(self) -> None:
        hall_txt = (self.root / "HALLFAME.TXT").read_bytes()
        hall_dat = (self.root / "HALLFAME.DAT").read_bytes()
        try:
            result = subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + "U\n1\nQ\nQ\n\n\n", capture_output=True, text=True
            )
            self.assertIn("SORCERER'S BANE HALL OF FAME", result.stdout)
            self.assertIn(" 1) TERIA               FIGHTER 13 currently adventuring in town", result.stdout)
            self.assertIn(" 2) REX FALCONBRIDGE    FIGHTER  1 killed on 1 by a SKELETON", result.stdout)
            self.assertIn("Send 19.95 for Standard SB Registration with the Game Master program (GM) or", result.stdout)
            self.assertIn("Thanks for playing SB.  Don't forget to register", result.stdout)
            txt = (self.root / "HALLFAME.TXT").read_bytes().split(b"\r\n")
            self.assertEqual(txt[0], b" 1) TERIA               FIGHTER 13   currently adventuring in town")
            self.assertEqual(txt[1:], hall_txt.split(b"\r\n")[1:])
            dat = (self.root / "HALLFAME.DAT").read_bytes()
            self.assertEqual(len(dat), len(hall_dat))
            self.assertEqual(dat[166:], hall_dat[166:])
        finally:
            self.restore_saves()

    def test_kill_with_experience_goes_to_the_hall(self) -> None:
        save = self.root / "DARKECHI.SBC"
        original = save.read_bytes()
        try:
            subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + "C\nZEKE\nS\nM\nF\nY\nQ\n", capture_output=True, text=True
            )
            data = bytearray(save.read_bytes())
            data[-166 + 100:-166 + 104] = (1000).to_bytes(4, "little")
            save.write_bytes(bytes(data))
            result = subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + "K\n6\nQ\n\n\n", capture_output=True, text=True
            )
            self.assertEqual(save.read_bytes(), original)
            hall = (self.root / "HALLFAME.DAT").read_bytes()
            self.assertEqual(len(hall), len(self._saved["HALLFAME.DAT"]) + 166)
            rec = hall[6 * 166:7 * 166]
            self.assertTrue(rec.startswith(b"ZEKE"))
            self.assertEqual(rec[146:166], b"player".ljust(20))
            self.assertIn(" 7) ZEKE                FIGHTER  1 killed on 0 by a player", result.stdout)
            self.assertIn(" 7) ZEKE                FIGHTER  1   killed on  0 by a player",
                          (self.root / "HALLFAME.TXT").read_text())
        finally:
            save.write_bytes(original)
            (self.root / "ZEKE.INV").unlink(missing_ok=True)
            (self.root / "ZEKE.DUN").unlink(missing_ok=True)
            self.restore_saves()

    def test_defaults_toggle_and_save_to_user_record(self) -> None:
        user = self.root / "USER.SBS"
        before = user.read_bytes()
        try:
            result = subprocess.run(
                [str(self.exe)], cwd=self.root, input=LOGIN + "D\nC\nE\nM\nQ\nQ\n", capture_output=True, text=True
            )
            self.assertIn("DEFAULTS IN SORCERER'S BANE", result.stdout)
            self.assertIn("(C) Turn the color off", result.stdout)
            self.assertIn("(C) Turn the color on ", result.stdout)
            self.assertIn("(E) Turn the error alarm off", result.stdout)
            self.assertIn("An unknown key was hit", result.stdout)
            after = user.read_bytes()
            self.assertEqual(after[87:], before[87:])
            self.assertEqual(after[:78], before[:78])
            self.assertEqual(after[78:87], bytes([0, 0, 0, 0, 0, 0, 0, 0, 7]))
        finally:
            self.restore_saves()

    def test_registration_form_prints(self) -> None:
        printer = self.root / "LPRINT.TXT"
        try:
            self.run_script_keep("P\nQ\n")
            text = printer.read_bytes()
            self.assertTrue(text.startswith(b" " * 34 + b"INVOICE\n\r\n"))
            self.assertIn(b"Remit to:" + b" " * 30 + b"From:\n\n\r\n", text)
            self.assertIn(b"___ Standard SB Registration with GAME MASTER" + b" " * 9 + b"19.95", text)
            self.assertIn(b"GAME MASTER,\r    BASWOOD BASIC tools, source code, and manuals", text)
            self.assertTrue(text.endswith(b"week for delivery.\x0c\r\n"))
        finally:
            self.restore_saves()

    def run_script_keep(self, script: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run([str(self.exe)], cwd=self.root, input=LOGIN + script, capture_output=True, text=True)

    def test_experience_table_and_bad_key(self) -> None:
        result = self.run_script("X\nF\nF\n\nQ\nU\n1\nF\nB\n\nQ\nQ\nQ\n")
        self.assertIn("That was not a valid choice!  Please re-enter!", result.stdout)
        self.assertIn("EXPERIENCE NEEDED FOR EACH LEVEL FOR A FIGHTER", result.stdout)
        self.assertIn("          LEVEL  2 -      2500\n", result.stdout)
        self.assertIn("          LEVEL  3 -      8200\n", result.stdout)
        self.assertIn("EXPERIENCE NEEDED FOR EACH LEVEL FOR A BARD", result.stdout)
        self.assertIn("LEVEL 15 IS THE HIGHEST YOU CAN GO", result.stdout)

    def test_no_keys_beyond_the_original(self) -> None:
        result = self.run_script("B\nU\n1\nB\nR\nB\n\nL\n\nT\n\nQ\nQ\nQ\n")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertNotIn("BATTLE LOG", result.stdout.upper())
        self.assertNotIn("Floor number?", result.stdout)
        self.assertNotIn("Trap 1 of 10.", result.stdout)
        self.assertIn("I'm a DM, not a mind reader! Enter a VALID choice!", result.stdout)
        self.assertEqual(result.stdout.count("UNKNOWN KEY WAS HIT"), 3)

    def test_dungeon_visit_is_saved(self) -> None:
        before = self._saved["TERIA.DUN"]
        x = int.from_bytes(before[0:2], "little", signed=True)
        y = int.from_bytes(before[2:4], "little", signed=True)
        rec = self._saved["DARKECHI.SBC"][:166]
        xp = int.from_bytes(rec[100:104], "little", signed=True)
        result = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + "U\n1\nR\n4\nQ\nC\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertNotIn("You've escaped the dungeon!", result.stdout)
        self.assertIn("TERIA cannot visit the cleric until he/she leaves the dungeon!", result.stdout)
        self.assertIn(" 1) TERIA               FIGHTER 13 currently adventuring on level ", result.stdout)
        self.assertNotIn("There is a wall there.", result.stdout)
        after = (self.root / "TERIA.DUN").read_bytes()
        self.assertEqual(len(after), len(before))
        self.assertEqual(int.from_bytes(after[0:2], "little", signed=True), x - 1)
        self.assertEqual(int.from_bytes(after[2:4], "little", signed=True), y)
        saved = (self.root / "DARKECHI.SBC").read_bytes()
        self.assertEqual(saved[:60], rec[:60])
        self.assertEqual(int.from_bytes(saved[60:62], "little"), 1)
        self.assertEqual(saved[62:100], rec[62:100])
        self.assertEqual(int.from_bytes(saved[100:104], "little", signed=True), xp + 1)
        self.assertEqual(saved[104:166], rec[104:166])
        self.assertEqual((self.root / "TERIA.INV").read_bytes(), self._saved["TERIA.INV"])
        again = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + "U\n1\nA\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        self.assertIn(f"Experience -  {xp + 1}", again.stdout)

    def test_login_picks_the_users_party(self) -> None:
        own = subprocess.run([str(self.exe)], cwd=self.root, input="Y\n3\nPINKU\nU\nQ\n\n\n",
                             capture_output=True, text=True)
        self.assertIn("Who are you?", own.stdout)
        self.assertIn("You are DARKECHIBI (at least according to you!)", own.stdout)
        self.assertIn("CHARACTER CHOICE MENU", own.stdout)
        self.assertNotIn("  1  TERIA", own.stdout)
        wrong = subprocess.run([str(self.exe)], cwd=self.root, input="Y\n1\nNOPE\n\n\n",
                               capture_output=True, text=True)
        self.assertIn("That was an incorrect password! The program is ending.", wrong.stdout)
        self.assertNotIn("MAINTENANCE MENU", wrong.stdout)
        master = subprocess.run([str(self.exe)], cwd=self.root, input="Y\n1\nFOX\nQ\n\n\n",
                                capture_output=True, text=True)
        self.assertIn("MAINTENANCE MENU", master.stdout)

    def test_new_user_gets_a_file_name_of_its_own(self) -> None:
        user = self.root / "USER.SBS"
        before = user.read_bytes()
        made = self.root / "DARKECH2.SBC"
        try:
            result = subprocess.run(
                [str(self.exe)], cwd=self.root,
                input="N\nDark Echi.x\nab\nAB\nY\nQ\n\nQ\n\n\n",
                capture_output=True, text=True,
            )
            self.assertIn("PLAYER NAME: ", result.stdout)
            self.assertIn("DEFAULTS IN SORCERER'S BANE", result.stdout)
            self.assertIn("MAINTENANCE MENU", result.stdout)
            after = user.read_bytes()
            self.assertEqual(after[:len(before)], before)
            rec = after[len(before):]
            self.assertEqual(len(rec), 87)
            self.assertEqual(rec[:60], b"DARK ECHI.X".ljust(60))
            self.assertEqual(rec[60:70], bytes((c + 128 % i + 128) & 255 for i, c in enumerate(b"AB".ljust(10), 1)))
            self.assertEqual(rec[70:78], b"DARKECH2")
            self.assertEqual(rec[78:87], bytes([1, 0, 1, 0, 0, 0, 0, 0, 7]))
            self.assertTrue(made.is_file())
            self.assertEqual(made.stat().st_size, 0)
        finally:
            made.unlink(missing_ok=True)
            self.restore_saves()

    def test_party_lock_is_held_for_the_session(self) -> None:
        lock = self.root / "DARKECHI.SBL"
        proc = subprocess.Popen([str(self.exe)], cwd=self.root, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT, text=True)
        assert proc.stdin is not None
        try:
            proc.stdin.write(LOGIN)
            proc.stdin.flush()
            deadline = time.time() + 15
            while time.time() < deadline and not lock.exists():
                time.sleep(0.05)
            time.sleep(0.3)
            self.assertTrue(lock.exists())
            with self.assertRaises(PermissionError):
                lock.open("r+b")
            out, _ = proc.communicate("Q\n\n\n", timeout=30)
        finally:
            if proc.poll() is None:
                proc.kill()
                proc.wait(timeout=5)
        self.assertIn("MAINTENANCE MENU", out)
        self.assertFalse(lock.exists())
        self.assertFalse((self.root / "HALLLOCK.SBL").exists())

    def test_blocked_hours_end_the_program(self) -> None:
        system = self.root / "SYSTEM.SBS"
        rec = bytearray(system.read_bytes())
        start = 1 if time.localtime().tm_hour == 22 else 23
        rec[5:7] = start.to_bytes(2, "little")
        rec[7:9] = (23).to_bytes(2, "little")
        system.write_bytes(bytes(rec))
        result = subprocess.run([str(self.exe)], cwd=self.root, input="\n\n\n", capture_output=True, text=True)
        self.assertIn("SB has been blocked out by the SB ADMINISTRATOR", result.stdout)
        self.assertNotIn("Who are you?", result.stdout)
        self.assertIn("Thanks for playing SB.", result.stdout)

    def test_setup_single_user_when_system_file_is_missing(self) -> None:
        system = self.root / "SYSTEM.SBS"
        system.unlink()
        result = subprocess.run([str(self.exe)], cwd=self.root, input="\nX\nS\nY\nQ\n\n\n",
                                capture_output=True, text=True)
        self.assertIn("SORCERER'S BANE (v1.1) -- SYSTEM SETUP", result.stdout)
        self.assertIn("B, M, S, Q, or ESC only, please", result.stdout)
        self.assertIn("You have elected to install SB in the single-user mode.", result.stdout)
        self.assertIn("MAINTENANCE MENU", result.stdout)
        self.assertNotIn("Who are you?", result.stdout)
        self.assertEqual(system.read_bytes(), b"S" + bytes(20))

    def test_setup_multi_user_form(self) -> None:
        system = self.root / "SYSTEM.SBS"
        system.write_bytes(b"")
        result = subprocess.run(
            [str(self.exe)], cwd=self.root,
            input="\nM\n\n1000\n5\n2\n\n\n30\nfox\nY\n" + LOGIN + "Q\n\n\n",
            capture_output=True, text=True,
        )
        self.assertIn("MULTI-USER SETUP", result.stdout)
        self.assertIn("SYSTEM SCREEN", result.stdout)
        self.assertIn("NUMBER MUST BE BETWEEN  0 AND  999", result.stdout)
        self.assertIn("Is this the correct system setup?", result.stdout)
        self.assertIn("You are DARKECHILDE", result.stdout)
        self.assertEqual(system.read_bytes(), b"M" + bytes([5, 0, 2, 0, 0, 0, 0, 0, 30, 0])
                         + bytes.fromhex("c6cfdaa0a3a2a2a0a2a8"))

    def test_max_live_characters(self) -> None:
        system = self.root / "SYSTEM.SBS"
        rec = bytearray(system.read_bytes())
        rec[3:5] = (5).to_bytes(2, "little")
        system.write_bytes(bytes(rec))
        result = self.run_script("C\n\nQ\n\n\n")
        self.assertIn("'Now C'MON!'", result.stdout)
        self.assertNotIn("CREATE A CHARACTER", result.stdout)

    def test_item_use_reads_a_wish_book(self) -> None:
        inv = self.root / "TERIA.INV"
        book = bytearray(68)
        book[:15] = b"BOOK OF WISHING"
        book[52] = 12
        book[54] = 19
        inv.write_bytes(self._saved["TERIA.INV"] + bytes(book))
        wishes = int.from_bytes(self._saved["DARKECHI.SBC"][84:86], "little", signed=True)
        result = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + "U\n1\nR\nI\nU13\nU12\n\nI\nU16\n\nQ\nQ\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("INVENTORY MANAGEMENT", result.stdout)
        self.assertIn("W-Wear     U-Use     T-Take off     D-Drop     I-Item Info", result.stdout)
        self.assertIn("That item needs to be Worn, not used.", result.stdout)
        self.assertIn("You CANNOT use a wand while wielding something else!!", result.stdout)
        self.assertIn("You read a BOOK OF WISHING", result.stdout)
        self.assertIn("I am the mighty FLEMBAD!", result.stdout)
        self.assertNotIn("Wishes ", result.stdout)
        saved = (self.root / "DARKECHI.SBC").read_bytes()
        self.assertEqual(int.from_bytes(saved[84:86], "little", signed=True), wishes + 1)
        self.assertNotIn(b"BOOK OF WISHING", (self.root / "TERIA.INV").read_bytes())

    def test_curse_lifts_and_haste_does_not_tick_every_redraw(self) -> None:
        inv = self.root / "TERIA.INV"
        pack = bytearray(self._saved["TERIA.INV"])
        sword = 12 * 68
        pack[sword + 62] = 0xFF
        pack[sword + 63] = 0xFF
        book = bytearray(68)
        book[:12] = b"REMOVE CURSE"
        book[52] = 12
        book[54] = 27
        potion = bytearray(68)
        potion[:15] = b"POTION OF HASTE"
        potion[52] = 11
        potion[54] = 54
        inv.write_bytes(bytes(pack) + bytes(book) + bytes(potion))
        result = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + "U\n1\nR\nI\nU16\n13\nX\n\nI\nU16\n\nQ\nQ\nQ\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("The item has been removed.", result.stdout)
        self.assertIn("You feel yourself speed up!", result.stdout)
        self.assertNotIn("You feel yourself slowing down!", result.stdout)
        saved = (self.root / "TERIA.INV").read_bytes()
        self.assertIn(b"HAPHESTUS-MADE SWORD", saved)
        self.assertEqual(saved[sword + 64], 0)
        self.assertEqual(int.from_bytes(saved[sword + 62:sword + 64], "little", signed=True), -1)
        self.assertNotIn(b"REMOVE CURSE", saved)
        self.assertNotIn(b"POTION OF HASTE", saved)

    def test_tame_keeps_a_pet_that_swings(self) -> None:
        party = self.root / "DARKECHI.SBC"
        rec = bytearray(self._saved["DARKECHI.SBC"][:166])
        rec[:20] = b"TAMER".ljust(20, b" ")
        rec[28:35] = b"MAGE   "
        rec[35:40] = b"HUMAN"
        rec[40:42] = (13).to_bytes(2, "little")
        rec[42:44] = (40).to_bytes(2, "little")
        rec[44:46] = (40).to_bytes(2, "little")
        for off in (46, 48, 50, 52, 54, 56):
            rec[off:off + 2] = (10).to_bytes(2, "little")
        party.write_bytes(self._saved["DARKECHI.SBC"] + bytes(rec))
        dun = self.root / "TAMER.DUN"
        dun.write_bytes(self._saved["TERIA.DUN"])
        dat = self.root / "MONSTER.DAT"
        original = dat.read_bytes()
        patched = bytearray(original)
        patched[22:26] = b"\x00\x00\x00\x00"
        dat.write_bytes(patched)
        heroes = (self.root / "DARKECHI.SBC").stat().st_size // 166
        lines: list[str] = []
        proc = subprocess.Popen(
            [str(self.exe)],
            cwd=self.root,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        )
        assert proc.stdin is not None and proc.stdout is not None

        def pump() -> None:
            assert proc.stdout is not None
            for line in proc.stdout:
                lines.append(line)

        threading.Thread(target=pump, daemon=True).start()
        try:
            proc.stdin.write(LOGIN + f"U\n{heroes}\nR\n" + walks_until_floor1_fight() + "C\n5\n2\n")
            proc.stdin.flush()
            text = ""
            deadline = time.time() + 30
            while time.time() < deadline and "doggie biscuit" not in text:
                time.sleep(0.05)
                text = "".join(lines)
            self.assertIn("doggie biscuit", text)
            self.assertNotIn("snarls", text)
            proc.stdin.write("X\n")
            proc.stdin.flush()
            meet = text.count("You encounter a ")
            deadline = time.time() + 40
            step = 0
            while time.time() < deadline and text.count("You encounter a ") < meet + 1 and step < 4000:
                proc.stdin.write("4\n" if step % 2 else "6\n")
                proc.stdin.flush()
                step += 1
                time.sleep(0.002)
                text = "".join(lines)
            self.assertGreater(text.count("You encounter a "), meet, text[-1500:])
            proc.stdin.write("T\nQ\nQ\nQ\nQ\n")
            proc.stdin.flush()
            deadline = time.time() + 15
            while time.time() < deadline and "Your GOBLIN" not in text:
                time.sleep(0.05)
                text = "".join(lines)
            self.assertIn("Your GOBLIN", text)
            proc.stdin.close()
            proc.wait(timeout=15)
        finally:
            if proc.poll() is None:
                proc.kill()
                proc.wait(timeout=5)
            if proc.stdout is not None:
                proc.stdout.close()
            dat.write_bytes(original)
            dun.unlink(missing_ok=True)
            (self.root / "TAMER.INV").unlink(missing_ok=True)

    def test_sleep_makes_the_goblin_skip_a_turn(self) -> None:
        party = self.root / "DARKECHI.SBC"
        rec = bytearray(self._saved["DARKECHI.SBC"][:166])
        rec[:20] = b"SLEEPY".ljust(20, b" ")
        rec[28:35] = b"MAGE   "
        rec[35:40] = b"HUMAN"
        rec[40:42] = (4).to_bytes(2, "little")
        rec[42:44] = (20).to_bytes(2, "little")
        rec[44:46] = (20).to_bytes(2, "little")
        for off in (46, 48, 50, 52, 54, 56):
            rec[off:off + 2] = (10).to_bytes(2, "little")
        rec[128:130] = bytes(2)
        party.write_bytes(self._saved["DARKECHI.SBC"] + bytes(rec))
        dun = self.root / "SLEEPY.DUN"
        dun.write_bytes(self._saved["TERIA.DUN"])
        heroes = (self.root / "DARKECHI.SBC").stat().st_size // 166
        try:
            result = subprocess.run(
                [str(self.exe)],
                cwd=self.root,
                input=LOGIN + f"U\n{heroes}\nR\n" + walks_until_floor1_fight() + "C\n2\n2\nF\nQ\nQ\nQ\nQ\n",
                capture_output=True,
                text=True,
            )
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertIn("You encounter a GOBLIN", result.stdout)
            self.assertIn("SLEEP", result.stdout)
            self.assertIn("The monster starts dreaming of", result.stdout)
            self.assertNotIn("This creature will sleep for a while!", result.stdout)
            self.assertRegex(result.stdout, r"This creature starts to awaken!\nNAME - SLEEPY +HITPOINTS - +\d+/ *20\n"
                                            r"MONSTER YOU ARE CURRENTLY FIGHTING - GOBLIN\nRound 2\n\(F\) Fight")
            self.assertIn("You've killed it !!", result.stdout)
        finally:
            dun.unlink(missing_ok=True)
            (self.root / "SLEEPY.INV").unlink(missing_ok=True)

    def test_goblin_sees_through_the_dream_wolf(self) -> None:
        inv = self.root / "TERIA.INV"
        potion = bytearray(68)
        potion[:10] = b"DREAM WOLF"
        potion[52] = 11
        potion[54] = 55
        inv.write_bytes(self._saved["TERIA.INV"] + bytes(potion))
        party = bytearray(self._saved["DARKECHI.SBC"])
        party[128:130] = bytes(2)
        (self.root / "DARKECHI.SBC").write_bytes(party)
        result = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + "U\n1\nR\nI\nU16\nQ\n" + walks_until_floor1_fight()[:-2] + "T\nQ\nQ\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("it's only an illusion.", result.stdout)
        self.assertIn("The monster swipes at your DREAMWOLF", result.stdout)
        self.assertIn("No more DREAMWOLF!", result.stdout)
        self.assertNotIn("backs off!", result.stdout)

    def test_air_shield_and_invisibility_change_ratings(self) -> None:
        inv = self.root / "TERIA.INV"
        def potion(name: bytes, effect: int) -> bytes:
            rec = bytearray(68)
            rec[:len(name)] = name
            rec[52] = 11
            rec[54] = effect
            rec[56] = 200
            return bytes(rec)
        inv.write_bytes(self._saved["TERIA.INV"] + potion(b"AIR SHIELD", 51) + potion(b"INVIS POTION", 52))
        result = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + "U\n1\nR\nI\nU16\nQ\nX\nI\nU16\nQ\nX\nQ\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("forming a floating shield", result.stdout)
        shielded, hidden = result.stdout.split("You have turned invisible!", 1)
        shielded = shielded.split("forming a floating shield", 1)[1]
        for text, hit, avoid in ((shielded, 32, 44), (hidden, 34, 46)):
            self.assertIn(f"To hit       - {hit}\n", text)
            self.assertIn("To damage    - 35\n", text)
            self.assertIn(f"To avoid dam - {avoid}\n", text)
            self.assertIn("To withstand - 38\n", text)
        self.assertIn("SHIELD", hidden)
        self.assertIn("INVISIBLE", hidden)
        self.assertNotIn("You air shield drops!", result.stdout)
        self.assertNotIn("You start to turn visible again!", result.stdout)

    def test_mage_can_cast_and_a_fighter_cannot(self) -> None:
        fighter = self.run_script("U\n1\nR\nC\nQ\nQ\nQ\n")
        self.assertEqual(fighter.returncode, 0, fighter.stdout + fighter.stderr)
        self.assertIn("You try to cast a spell, but", fighter.stdout)
        self.assertIn("were a mage!", fighter.stdout)
        self.assertNotIn("Which spell level", fighter.stdout)
        heroes = (self.root / "DARKECHI.SBC").stat().st_size // 166
        made = subprocess.run(
            [str(self.exe)],
            cwd=self.root,
            input=LOGIN + f"C\nZYLA\nS\nM\nM\nY\nU\n{heroes + 1}\nR\nC\n1\n4\nQ\nQ\nQ\nQ\n",
            capture_output=True,
            text=True,
        )
        try:
            self.assertEqual(made.returncode, 0, made.stdout + made.stderr)
            self.assertIn("HUMAN MAGE   level 1", made.stdout)
            self.assertIn("Level 1 - 2/2", made.stdout)
            self.assertIn("AIR SHIELD I", made.stdout)
            self.assertTrue(
                "forming a floating shield" in made.stdout or "spell failed!" in made.stdout
            )
        finally:
            (self.root / "ZYLA.INV").unlink(missing_ok=True)
            (self.root / "ZYLA.DUN").unlink(missing_ok=True)


if __name__ == "__main__":
    unittest.main()
