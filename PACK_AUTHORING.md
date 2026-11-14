# Making a content pack

For anyone adding dialogue to RPG Dialogue: community authors, and future AI sessions. A content pack is a small separate addon that holds dialogue as data. The core addon holds no dialogue at all; our own packs (`RPGDialogue_World`, `RPGDialogue_Elwynn`) use exactly the API described here, so a community pack works just as well as an official one.

Read these first:
- **`CONTENT_GUIDE.md`**: how to write. Characters come from their lore and their quests; voice bibles before dialogue; no AI voice; Year 1 only; hyper-specific beats generic. The rules there are not optional.
- **`DESIGN.md` §2**: the full data schema (every NPC, line, node, choice, condition and effect field), and §3 for how lines are scored.
- **`LORE_NOTES.md`**: the Forever setting and the lore sheet for each zone written so far.

## 1. What a pack looks like

```
RPGDialogue_Westfall/
├─ RPGDialogue_Westfall.toc
├─ pack.lua              registration (id, version, format, requires)
├─ CHANGELOG.md          this pack's own changelog (not shipped in the zip)
├─ pools.lua             unnamed NPCs by role and town
├─ npcs/<key>.lua        one file per NPC with their own content
└─ bibles/<key>.md       one voice bible per NPC (not shipped)
```

**TOC.** The `X-RPGD-*` fields are how the core finds a pack without loading it:

```toc
## Interface: 16001, 16002
## Title: RPG Dialogue: Westfall
## Notes: Dialogue for Westfall.
## Author: Your name
## Version: @project-version@
## Dependencies: RPGDialogue
## LoadOnDemand: 1
## X-RPGD-Pack: yourname.westfall
## X-RPGD-Format: 1
## X-RPGD-Load: zone
## X-RPGD-Zones: Westfall

pack.lua
pools.lua
npcs\saldean.lua
```

| Field | Meaning |
|---|---|
| `X-RPGD-Pack` | the pack id, the same string as in `pack.lua`. Community packs: prefix it with your name (`yourname.westfall`) |
| `X-RPGD-Format` | the data format the pack is written for. The core refuses a pack whose format is newer than it reads, with a clear message |
| `X-RPGD-Load` | `zone`: loaded the first time you enter one of its zones. `login`: loaded at login (only for material several zones share: threads, claims, topics, towns, origins) |
| `X-RPGD-Zones` | zone names as the game shows them, spaces as underscores (`Elwynn_Forest`, `Dun_Morogh`), or uiMapIDs, comma-separated |

**`pack.lua`:**

```lua
RPGDialogueAPI:RegisterPack {
  id = "yourname.westfall",
  name = "Westfall",
  author = "Your name",
  version = "0.1.0",            -- this pack's own version: bump it with CHANGELOG.md
  format = 1,
  priority = 0,                 -- who wins when two packs define the same node
  requires = { "rpgd.world" },  -- other packs this one refers to
}
```

**Data files.** Every other file is data in a strict subset of Lua: one header, then only `P:Kind { ... }` statements. Strings, numbers, booleans, nested tables and the `TODO_*` placeholders are allowed; variables, functions, concatenation and arithmetic are not. The validator rejects anything else, and the game never runs pack code beyond these tables.

```lua
-- Farmer Saldean, Saldean's Farm. Voice: bibles/saldean.md
local P = RPGDialogueAPI:Pack("yourname.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "saldean", id = TODO_NPC("Farmer Saldean"), name = "Farmer Saldean",
  bible = "bibles/saldean.md", role = "questgiver", tier = "quest", communities = { "saldeans_farm" },
  ...
}
```

## 2. The kinds of data

| Kind | What it holds | Example in this repo |
|---|---|---|
| `P:NPC` | one named NPC: greetings, noticing moments, live reactions, conversation nodes, topic answers, barks | `RPGDialogue_Elwynn/npcs/dughan.lua` |
| `P:Pool` | lines for a role (`guard`, `innkeeper`, `child`, ...), optionally for one town (`community`), one faction or zone, or one kind of that role by the NPC's title (`subtitle = "paladin trainer"`, or a list); the most specific wins (town 200, title 150, zone or faction 120, role 100); a pool with `nodes` is one shared character | `RPGDialogue_Elwynn/pools.lua`, `RPGDialogue_World/pools_roles.lua`, the spirit healers in `RPGDialogue_World/pools.lua` |
| `P:Generic` | the last fallback, so no NPC is ever silent | `RPGDialogue_World/generic.lua` |
| `P:Thread` | a throughline: theme, states, endings, beats keyed by NPC | `RPGDialogue_World/threads.lua` |
| `P:Claim` | something an NPC says, whether it's true, and what can expose it | `RPGDialogue_World/claims.lua` |
| `P:Topic` | an "Ask about..." topic: name, category, how it's learned | `RPGDialogue_World/topics.lua` |
| `P:Town` | town standing: subzones, related towns, tier names, quests that move it | `RPGDialogue_World/towns.lua` |
| `P:Origin` | the origin list for a race (always ending in "other") | `RPGDialogue_World/origins/human.lua` |
| `P:Rumors` | innkeeper rumors for roles and zones | `RPGDialogue_World/rumors/elwynn.lua` |
| `P:Book` | a readable book the addon recognizes, and the topics it teaches | `RPGDialogue_World/books.lua` |
| `P:Errand` | a small addon-side task (visit a place, carry items, kill N), verified by the addon, rewarded only with things the addon owns | `RPGDialogue_Elwynn/errands.lua` |

Field-by-field schemas: `DESIGN.md` §2.4–2.10. The working examples above are the quickest way to learn them.

## 3. Rules that keep packs working together

- **Never invent IDs.** Use `TODO_NPC("Name")` and `TODO_QUEST("Title")`. They match by name and title in game, so you can test before you have real IDs, and `tools/import_capture.py --resolve` replaces them once capture data exists. A release refuses TODO ids (`tools/check_all.py --release`).
- **Keys are global.** NPC keys are unique across every pack, and line references use them (`heardLine = "dughan.d_default"`). Community packs: prefix your keys (`yourname_saldean`).
- **Two packs, one NPC.** By default they merge: greetings, noticing moments, lines and topic answers pool together and are scored normally. If both define a node with the same id, the higher `priority` wins. `override = true` on an NPC replaces lower-priority definitions of that NPC entirely. Prefer adding lines to replacing a character.
- **Shared material lives in a login pack.** Threads, claims, topics, towns and origins referenced from several zones belong in a `login` pack (ours is `RPGDialogue_World`), so they work whichever zone packs are loaded. Say so in `requires`.
- **Format versions.** `format` in `pack.lua` and `X-RPGD-Format` in the TOC say which data format you wrote for. The core reads format 1. A newer format is refused with a message telling the player to update RPG Dialogue.
- **Captured Blizzard text never ships**, and never goes in a public repo. It's for writing voice bibles. The voice checker fails any line that shares six words in a row with it.

## 4. Adding a zone, step by step

This is the brief's "adding a zone" workflow, with the tools that support each step.

1. **Capture.** In game, turn on `/rpgd autocapture on`, walk the zone and talk to everyone. `/rpgd capture zone` shows what's captured and which NPCs you've talked to have no content yet. Then, out of game:
   ```
   python3 tools/import_capture.py "<WoW>/_forever_/WTF/Account/<ACCOUNT>/SavedVariables/RPGDialogue.lua"
   python3 tools/export_reference.py "<same file>" --zone "Westfall"     # reference/westfall.md, local only
   ```
2. **Plan.** `python3 tools/new_zone.py plan "Westfall"` writes `RPGDialogue_Westfall/PLAN.md`: every captured NPC with a proposed tier (major / quest / service / pooled / skip), role and town, the zone's quests, settlements and creatures. **Agree the tiers before writing anything.**
3. **Lore sheet.** Add the zone's sheet to `LORE_NOTES.md`: key NPCs and what they care about (from their quests), the quest storylines, what has and hasn't happened yet in Year 1. Cite every source; mark anything unsure.
4. **Scaffold.** `python3 tools/new_zone.py scaffold "Westfall"` creates the pack, a voice bible stub and an NPC file per approved NPC (marked `scaffold = true`, which the game ignores until you remove it), a lore sheet stub and the `.pkgmeta` line. It never overwrites a file.
5. **Voice bibles first**, sources and quests before anything else (format in `CONTENT_GUIDE.md` §12).
6. **Throughlines.** Look for existing threads that could continue here, and propose one or two new ones rooted in the zone's quests. Agree them before writing.
7. **Write** the NPCs, pools, towns, topics and rumors: before / during / after reactions for the zone's quests, echoes of nearby zones, origin nods where they fit. Remove `scaffold = true` from each NPC as you finish it.
8. **Check.** `python3 tools/check_all.py` runs everything and must pass:

   | Tool | What it catches |
   |---|---|
   | `tools/validate.py [--pack RPGDialogue_Westfall]` | schema, unknown keys and tokens, unreachable or silent nodes, broken references (also across packs), TODO ids, voice bibles without sources or quests, the two-hinge limit |
   | `tools/voicecheck.py` | banned phrases, near-identical lines across NPCs, mad-libs, copied Blizzard wording |
   | `tools/simulate.py` | thousands of random characters: lines and beats that never fire, fallback rates, special options that always pass or fail, lines about quests a character couldn't have taken yet |
   | `tools/coverage.py` | per NPC: races, classes, combos, noticing categories, quest phases, topics, throughline map |
   | `lua5.1 tests/run.lua` | the engine against a mock client |

9. **Test in game.** `/rpgd packs` (is it loaded?), `/rpgd why` (why that line won), `/rpgd spoof race=Gnome class=PRIEST level=8` (pretend to be someone else), `/rpgd threads`, `/rpgd topics`, and the flag button on any line that's wrong (`tools/flag_report.py` turns the flags into a fix list with a replay command).
10. **Bump the pack's version** in `pack.lua` and its `CHANGELOG.md` together.

## 5. Releasing a community pack

- Your pack is an ordinary addon: its own repo, its own CurseForge/Wago project, `## Dependencies: RPGDialogue` in the TOC. Players install it next to RPG Dialogue.
- Keep `bibles/`, `PLAN.md`, `CHANGELOG.md` and anything captured out of the zip (the BigWigs packager's `ignore` list in `.pkgmeta`; see ours).
- The pack must stay free, with readable code, no ads and no donation requests in game (Blizzard's UI add-on policy).
- Run `tools/validate.py --extra <folder holding your pack>` from a checkout of this repo to check it against the official packs.

## 6. For AI sessions

Start every session by reading `HANDOFF.md`, `DESIGN.md` and `CONTENT_GUIDE.md`. Follow the zone workflow above in order, and stop for the user's OK at the two points marked (tiers, throughlines). Never put an ID in a file that didn't come from capture data. Finish with `tools/check_all.py` clean, an in-game test checklist for the user, `HANDOFF.md` updated and a commit.
