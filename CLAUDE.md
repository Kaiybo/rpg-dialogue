# RPG Dialogue: working rules

A World of Warcraft: Forever addon (patch 1.60.1, interface 16001) that replaces the NPC
gossip window with a role-playing conversation: named NPCs with their own voices, role pools
for everyone else, Morrowind-style "Ask about" topics, towns that remember you.

**Start every session by reading `HANDOFF.md`** (state, versions, what the user asked for,
what's next). Then `DESIGN.md` for the engine, `CONTENT_GUIDE.md` before writing any
dialogue, `PACK_AUTHORING.md` before adding a zone, and `LORE_NOTES.md` for every fact
already sourced. The original brief lives with the project owner; HANDOFF quotes what matters.

## Hard rules

- **No AI and no network at runtime.** Everything the addon says is written ahead of time.
  Never block gameplay: combat, PvP and the game's own windows always win.
- **Never invent NPC or quest IDs.** Use `TODO_NPC("Exact Name")` and `TODO_QUEST("Exact
  Title")`; real IDs only come from in-game capture data (`tools/import_capture.py`).
- **Lore only from warcraft.wiki.gg or Blizzard's own sites**, and every fact a line relies on
  gets a row in `LORE_NOTES.md` with its source. Skyborne facts come only from the brief's
  §10 (quoted in the Zephras pack's bible). Anything authored (not canon) is listed as such in
  the pack's bible.
- **Year 1 timeline** (Forever's own continuity: after *Forsaken Kingdom*, before Molten Core
  and the Dark Portal reopening). Nothing from The Burning Crusade or later, and no
  foreshadowing of it (Prestor never hints what she is; nobody hints at Cairne's or Varian's fate).
- **Original writing only.** Never copy Blizzard's quest or gossip text; paraphrase. The
  voice checker fails on any 6-word run shared with captured text in `reference/`.
- **Banned phrases** (`banned_phrases.txt`) fail the voice check. Lines are 1–3 short sentences.
- **Captured Blizzard text (`reference/`) never goes into a public repository.** Keep this
  repository private.
- Never put the owner's personal details (email, real name) in commits or files. Commits use
  `RPG Dialogue Dev <rpg-dialogue@users.noreply.localhost>`.
- Downloaded or cloned third-party code (DialogueUI, Blizzard's UI source mirror) is read-only
  reference: never run it, never copy it in.

## Environment

Lua 5.1 and Python 3 (standard library only). In a fresh cloud session:
`command -v lua5.1 || (apt-get update && apt-get install -y lua5.1)`.

## Checks

| Command | What | Time |
|---|---|---|
| `lua5.1 tests/run.lua [filter]` | unit and story tests (mocked WoW API) | ~1 min |
| `python3 tools/validate.py` | pack structure, conditions, references, keywords; 0 errors required | ~10 s |
| `python3 tools/voicecheck.py` | banned phrases, near-duplicates, mad-libs; 0 failures required | ~2 min |
| `python3 tools/check_all.py --quick` | all of the above | ~4 min |
| `python3 tools/check_all.py` | plus the full simulation of every NPC | ~1 hour; run in the background before a release |

## Making a release

1. `python3 tools/version.py set <folder> <x.y.z>` for core and each touched pack; add the
   heading and notes to each pack's `CHANGELOG.md` and the root `CHANGELOG.md`.
2. Update `HANDOFF.md` (versions line, what was done, what's next).
3. Full `python3 tools/check_all.py` must pass.
4. `python3 tools/build_zip.py` builds `tools/out/RPGDialogue-<ver>.zip` (the user installs
   this into `Interface/AddOns`).
5. Commit, and open a pull request for the owner to merge.

## Adding a zone pack

`PACK_AUTHORING.md` has the full list. In short: the folder with TOC (`X-RPGD-Pack`,
`X-RPGD-Load: zone`, `X-RPGD-Zones`), `pack.lua`, `CHANGELOG.md`, `npcs/*.lua`, a bible in
`bibles/*.md` with "## Sources" and "## Their quests"; a line in `.pkgmeta` and the README;
the pack, its towns' subzones and zones in `tests/sim_driver.lua`; a content test in
`tests/content_spec.lua`; towns in `RPGDialogue_World/towns.lua`; rows in `LORE_NOTES.md`.

## Writing "Ask about" answers

Topics live in `RPGDialogue_World/topics.lua` (with `keywords`: words in anyone's speech
that become links and teach the topic). Answers, highest first: the NPC's own `topics`, a
community pool, a role pool, a town `P:Voice`, a zone `P:Voice`, the common knowledge in
`RPGDialogue_World/topics_common.lua` (split by the player's faction). Brush-offs (`_none`)
lose to any real answer. Core topics everyone can be asked: background, my_trade,
little_secret (gate the real secret on `timesTalked` or `affinity`), latest_rumors,
someplace_nearby. DESIGN.md §3.11 has the details.
