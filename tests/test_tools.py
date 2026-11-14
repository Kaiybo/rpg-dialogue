"""Tests for the out-of-game tools that change files: the zone scaffolder and the capture
importer. Each test runs against a scratch copy of the repo (RPGD_ROOT), never the real one.

    python3 -m unittest discover -s tests -p "test_*.py"

The NPC and quest IDs below are fake (900000+) test data, not content.
Python 3, standard library only.
"""

import os
import shutil
import subprocess
import sys
import tempfile
import unittest

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
TOOLS = os.path.join(REPO, "tools")

CAPTURE = """
RPGDialogueDB = {
  ["capture"] = {
    ["npcs"] = {
      [900001] = { ["name"] = "Gryan Stoutmantle", ["subtitle"] = "", ["zone"] = "Westfall", ["subzone"] = "Sentinel Hill", ["gossip"] = true, ["reaction"] = 5, ["n"] = 4 },
      [900002] = { ["name"] = "Farmer Saldean", ["zone"] = "Westfall", ["subzone"] = "Saldean's Farm", ["gossip"] = true, ["reaction"] = 5, ["n"] = 2 },
      [900003] = { ["name"] = "Innkeeper Heather", ["subtitle"] = "Innkeeper", ["zone"] = "Westfall", ["subzone"] = "Sentinel Hill", ["gossip"] = true, ["reaction"] = 5 },
      [900004] = { ["name"] = "Westfall Guard", ["zone"] = "Westfall", ["subzone"] = "Sentinel Hill", ["reaction"] = 5 },
      [900005] = { ["name"] = "Defias Trapper", ["zone"] = "Westfall", ["subzone"] = "Jangolode Mine", ["reaction"] = 2, ["level"] = 14 },
      [900006] = { ["name"] = "Marshal Dughan", ["zone"] = "Elwynn Forest", ["subzone"] = "Goldshire", ["gossip"] = true, ["reaction"] = 5 },
    },
    ["quests"] = {
      [910001] = { ["title"] = "The People's Militia", ["giver"] = 900001, ["turnin"] = 900001, ["zone"] = "Westfall", ["minLevel"] = 14, ["factions"] = { ["Alliance"] = true } },
      [910002] = { ["title"] = "The Defias Brotherhood", ["giver"] = 900001, ["zone"] = "Westfall", ["minLevel"] = 15 },
      [910003] = { ["title"] = "Westfall Stew", ["giver"] = 900002, ["turnin"] = 900002, ["zone"] = "Westfall", ["minLevel"] = 12 },
      [910004] = { ["title"] = "Red Leather Bandanas", ["giver"] = 900001, ["turnin"] = 900001, ["zone"] = "Westfall" },
      [910005] = { ["title"] = "Patrolling Westfall", ["giver"] = 900001, ["turnin"] = 900001, ["zone"] = "Westfall" },
    },
    ["gossip"] = {}, ["questText"] = {},
  },
}
"""


def read(path):
    with open(path, encoding="utf-8") as fh:
        return fh.read()


def write(path, text, mode="w"):
    with open(path, mode, encoding="utf-8") as fh:
        fh.write(text)


def run(args, root, check=True):
    env = dict(os.environ, RPGD_ROOT=root)
    p = subprocess.run([sys.executable] + args, cwd=root, env=env, capture_output=True, text=True)
    if check and p.returncode != 0:
        raise AssertionError(f"{' '.join(args)} failed ({p.returncode}):\n{p.stdout}\n{p.stderr}")
    return p


class ScratchRepo(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.mkdtemp(prefix="rpgd-test-")
        self.root = os.path.join(self.tmp, "repo")
        shutil.copytree(REPO, self.root, ignore=shutil.ignore_patterns(".git", "__pycache__", "out", "registry", "reference"))
        self.capture = os.path.join(self.tmp, "RPGDialogue.lua")
        with open(self.capture, "w", encoding="utf-8") as fh:
            fh.write(CAPTURE)

    def tearDown(self):
        shutil.rmtree(self.tmp, ignore_errors=True)

    def tool(self, name, *args, check=True):
        return run([os.path.join(self.root, "tools", name)] + list(args), self.root, check)


class NewZoneTest(ScratchRepo):
    def test_plan_then_scaffold(self):
        out = self.tool("new_zone.py", "plan", "Westfall", "--capture", self.capture).stdout
        self.assertIn("RPGDialogue_Westfall/PLAN.md", out)
        plan = read(os.path.join(self.root, "RPGDialogue_Westfall", "PLAN.md"))
        # Gryan gives/takes 4 quests: major. Saldean: quest. Heather: service. The guard: pooled.
        self.assertRegex(plan, r"\| stoutmantle \| Gryan Stoutmantle \| 900001 \|.*\| major \|")
        self.assertRegex(plan, r"\| saldean \| Farmer Saldean \|.*\| quest \|")
        self.assertRegex(plan, r"\| heather \| Innkeeper Heather \|.*\| service \| innkeeper \|")
        self.assertRegex(plan, r"\| Westfall Guard \|.*\| pooled \| guard \|")
        self.assertIn("Defias Trapper (level 14–14)", plan)
        self.assertNotIn("Marshal Dughan", plan)  # another zone
        self.assertIn("| 910003 | Westfall Stew | Farmer Saldean | Farmer Saldean | 12 |", plan)

        # The user approves, but turns Saldean into a pooled NPC.
        path = os.path.join(self.root, "RPGDialogue_Westfall", "PLAN.md")
        plan = plan.replace("| Saldean's Farm | 1/1 | 2 | quest |", "| Saldean's Farm | 1/1 | 2 | pooled |")
        write(path, plan)
        out = self.tool("new_zone.py", "scaffold", "Westfall").stdout
        pack = os.path.join(self.root, "RPGDialogue_Westfall")
        for f in ("RPGDialogue_Westfall.toc", "pack.lua", "CHANGELOG.md", "pools.lua", "npcs/stoutmantle.lua",
                  "npcs/heather.lua", "bibles/stoutmantle.md"):
            self.assertTrue(os.path.exists(os.path.join(pack, f)), f)
        self.assertFalse(os.path.exists(os.path.join(pack, "npcs", "saldean.lua")))
        npc = read(os.path.join(pack, "npcs", "stoutmantle.lua"))
        self.assertIn("id = 900001", npc)
        self.assertIn("scaffold = true", npc)
        self.assertIn("gives: The People's Militia (quest 910001)", npc)
        self.assertIn("## Lore sheet: Westfall", read(os.path.join(self.root, "LORE_NOTES.md")))
        self.assertIn("RPGDialogue/RPGDialogue_Westfall: RPGDialogue_Westfall", read(os.path.join(self.root, ".pkgmeta")))

        # The validator accepts the scaffold (warnings only), and --strict refuses it.
        v = self.tool("validate.py", "--pack", "RPGDialogue_Westfall")
        self.assertIn("scaffold, not written yet", v.stdout)
        self.assertIn("0 error(s)", v.stdout)
        strict = self.tool("validate.py", "--pack", "RPGDialogue_Westfall", "--strict", check=False)
        self.assertEqual(strict.returncode, 1)

        # Re-running scaffold doesn't overwrite anything.
        write(os.path.join(pack, "npcs", "stoutmantle.lua"), "-- edited\n", "a")
        self.tool("new_zone.py", "scaffold", "Westfall")
        self.assertTrue(read(os.path.join(pack, "npcs", "stoutmantle.lua")).endswith("-- edited\n"))

        # The generated Lua is clean (the scaffold NPC being skipped in game is in core_spec.lua).
        if shutil.which("luacheck"):
            lc = subprocess.run(["luacheck", "RPGDialogue_Westfall"], cwd=self.root, capture_output=True, text=True)
            self.assertEqual(lc.returncode, 0, lc.stdout)

    def test_plan_unknown_zone_lists_captured_zones(self):
        p = self.tool("new_zone.py", "plan", "Duskwood", "--capture", self.capture, check=False)
        self.assertNotEqual(p.returncode, 0)
        self.assertIn("Westfall", p.stderr)


class ImpossibleQuestRefsTest(ScratchRepo):
    def test_level_and_faction(self):
        pack = os.path.join(self.root, "RPGDialogue_SimTest")
        os.makedirs(pack)
        write(os.path.join(pack, "RPGDialogue_SimTest.toc"),
              "## X-RPGD-Pack: test.sim\n## X-RPGD-Zones: Westfall\npack.lua\nnpcs.lua\n")
        write(os.path.join(pack, "pack.lua"), 'RPGDialogueAPI:RegisterPack { id = "test.sim", name = "Sim", format = 1 }\n')
        write(os.path.join(pack, "npcs.lua"), "\n".join([
            'local P = RPGDialogueAPI:Pack("test.sim")',
            "local TODO_QUEST = P.TODO_QUEST",
            "P:Pool { id = \"sim\", role = \"citizen\", lines = {",
            '  { id = "too_low", when = { questDone = TODO_QUEST("The People\'s Militia"), maxLevel = 10 }, text = "a" },',
            '  { id = "band_ok", when = { questDone = TODO_QUEST("The People\'s Militia"), band = "Blooded" }, text = "b" },',
            '  { id = "horde", when = { all = { questActive = 910001, race = { "Orc", "Troll" } } }, text = "c" },',
            '  { id = "maybe", when = { any = { { questDone = 910001, maxLevel = 3 } } }, text = "d" },',
            '  { id = "unknown", when = { questDone = TODO_QUEST("Not Captured") }, text = "e" },',
            "}, choices = { { text = \"Bye.\", next = \"END\" } } }", ""]))
        self.tool("import_capture.py", self.capture)
        code = ("import json,sys; sys.path.insert(0,'tools'); import simulate as S; from rpgd import packs as P;"
                "reg=json.load(open('tools/registry/ids.json'));"
                "probs,unchecked=S.impossible_refs([p for p in P.load_all() if p.addon=='RPGDialogue_SimTest'],reg);"
                "print('\\n'.join(probs)); print('UNCHECKED', unchecked)")
        out = run(["-c", code], self.root).stdout
        self.assertIn("pool:sim.too_low: about \"The People's Militia\"", out)
        self.assertIn("level 10 and below; the lowest level it was taken at is 14", out)
        self.assertNotIn("band_ok", out)
        self.assertIn("pool:sim.horde: about '910001', but the line is Horde-only", out)
        self.assertNotIn("maybe", out.split("UNCHECKED")[0])
        self.assertIn("UNCHECKED ['Not Captured']", out)


class VoiceCheckCopyTest(ScratchRepo):
    def test_flags_lines_copied_from_captured_text(self):
        clean = self.tool("voicecheck.py")
        self.assertIn("no copy check", clean.stdout)
        os.makedirs(os.path.join(self.root, "reference"), exist_ok=True)
        # Take a real line from the Elwynn pack and pretend Blizzard wrote it.
        npc = read(os.path.join(self.root, "RPGDialogue_Elwynn", "npcs", "pestle.lua"))
        self.assertIn("Kobold candles burn longer than any wax in Stormwind", npc)
        write(os.path.join(self.root, "reference", "elwynn_forest.md"),
              "## William Pestle\n**Description:** Everyone knows kobold candles burn longer than any wax in Stormwind.\n")
        p = self.tool("voicecheck.py", check=False)
        self.assertEqual(p.returncode, 1)
        self.assertIn("copies Blizzard's wording", p.stdout)
        self.assertIn("in pestle.q_candles", p.stdout)


class FlagReportTest(ScratchRepo):
    def test_report_locates_the_line_and_gives_a_replay(self):
        sv = os.path.join(self.tmp, "Flags.lua")
        write(sv, """RPGDialogueDB = { ["flagged"] = { {
  ["line"] = "pestle.q_candles", ["npc"] = "pestle", ["text"] = "Kobold candles...", ["note"] = "too long",
  ["node"] = "hello", ["pack"] = "rpgd.elwynn", ["seed"] = 77, ["t"] = 1700000000,
  ["ctx"] = { "race = Gnome", "class = MAGE", "level = 6", "zone = Elwynn Forest" },
} } }""")
        out_path = os.path.join(self.tmp, "flagged.md")
        self.tool("flag_report.py", sv, "--out", out_path)
        report = read(out_path)
        self.assertRegex(report, r"Where: RPGDialogue_Elwynn/npcs/pestle\.lua:\d+")
        self.assertIn("`/rpgd spoof race=Gnome class=MAGE level=6  then  /rpgd seed 77`", report)
        self.assertIn("Note: too long", report)


class ReleaseChecksTest(ScratchRepo):
    def release_problems(self):
        code = "import sys; sys.path.insert(0,'tools'); import check_all as K; print('\\n'.join(K.release_checks()))"
        return run(["-c", code], self.root).stdout

    def test_policy_and_pack_versions(self):
        out = self.release_problems()
        self.assertNotIn("SendChatMessage", out)
        self.assertNotIn("doesn't match CHANGELOG", out)
        core = os.path.join(self.root, "RPGDialogue", "Systems", "Barks.lua")
        write(core, "\n-- SendChatMessage(\"hi\", \"SAY\")\n", "a")
        pack = os.path.join(self.root, "RPGDialogue_Elwynn", "pack.lua")
        import re
        write(pack, re.sub(r'version = "[0-9.]+"', 'version = "9.9.9"', read(pack), count=1))
        out = self.release_problems()
        self.assertIn("RPGDialogue/Systems/Barks.lua: 'SendChatMessage' sends chat", out)
        self.assertRegex(out, r"RPGDialogue_Elwynn: pack.lua version '9.9.9' doesn't match CHANGELOG.md \(\d+\.\d+\.\d+\)")


class ImportCaptureTest(ScratchRepo):
    def test_registry_keeps_lowest_level_and_factions(self):
        self.tool("import_capture.py", self.capture)
        import json
        reg = json.loads(read(os.path.join(self.root, "tools", "registry", "ids.json")))
        self.assertEqual(reg["quests"]["910001"]["minLevel"], 14)
        self.assertEqual(reg["quests"]["910001"]["factions"], ["Alliance"])
        # A second capture from a lower-level character lowers it; factions merge.
        lower = CAPTURE.replace('["minLevel"] = 14, ["factions"] = { ["Alliance"] = true }',
                                '["minLevel"] = 11, ["factions"] = { ["Horde"] = true }')
        with open(self.capture, "w", encoding="utf-8") as fh:
            fh.write(lower)
        self.tool("import_capture.py", self.capture)
        reg = json.loads(read(os.path.join(self.root, "tools", "registry", "ids.json")))
        self.assertEqual(reg["quests"]["910001"]["minLevel"], 11)
        self.assertEqual(reg["quests"]["910001"]["factions"], ["Alliance", "Horde"])


if __name__ == "__main__":
    unittest.main()
