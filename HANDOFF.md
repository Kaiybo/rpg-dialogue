# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long version of this file, with every per-release test list back to 0.78.0, is `git show 171f6b69:HANDOFF.md`).

## The user
- Wants content for both factions and every class, race and gender, with relevant replies for each.
- Wants conversations with real depth (many replies, deep branches) and people who talk like people (whole sentences, Warcraft's register, never clipped one-liners). Everything stays inside one box (ours or DialogueUI's) and never bounces to the game's window.
- Wants quick, efficient sessions: no constant re-validation; follow `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.84.0)
- 0.84.0 (user: "build a release in a single pull"): open PRs #116-#126 merged into one release; core 0.84.0, every content pack a minor bump. NEW FILES (full restart): World `demons.lua`, `npcs/more_folk.lua` + `bibles/more_folk.md` in 31 packs (Ironforge, Stormwind also `more_folk2.lua`). Conflicts: CHANGELOG/HANDOFF rewritten by hand; deeds pass (#122) vs writing pass (#120) kept the writing-pass wording plus the deeds lines; Skyborne-druid fix (#126) applied on top of both. Only `luac -p` run.
- Unreleased on this branch (user: not in a release yet): Admire/Taunt/Intimidate persuasion and disposition gates on topics (DESIGN §3.16). NEW FILES (full restart): `RPGDialogue/Systems/Persuasion.lua`, `RPGDialogue_World/persuade.lua`. Only `luac -p` run; nothing tested in game.
- TTS (0.83.1 work, never released alone): status names from a fallback table; when every way fails, one hint message and the bad list resets.
- Calls to check from the NPC gap scan (#125): Silithus Torrig/Bloodfist and five Grom'gol NPCs reverse earlier "skip" decisions; many 1.x placements are inferred. Leftover names: Stormwind Champions' Hall, Thunder Bluff (Atepa, Krumn, Sheza Wildmane), Teldrassil (Nhemai, Janna Brightmoon), Darkshire Watchers, Undercity (Randolph Montague, Lexington Mortaim), Ironforge/Loch Modan vendors.
- Open: Hemet Nesingwary mixes a burr and plain English (voice decision). Valor's Rest is placed two ways (Zannok: southeast Silithus; `desert.lua`: top of the Un'Goro road).

- Unreleased: gut feelings (DESIGN §3.15; new files `Systems/Insight.lua`, World `gut.lua`, so a full restart). Only `luac -p` run.

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- With DialogueUI, "auto" renders our conversations inside its window. With Immersion, we step back.

## Not verified in game
- TTS (0.82.1): which speak call works, and the real status values.
- Flirt lines (0.83.0): opposite-gender NPCs, the `flirting` setting, innkeepers and vendors.
- Right-click on untitled townsfolk opening the box. The citizen role comes from `UnitCreatureType`, which is localized, so non-English clients may treat beasts as citizens.
- The journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list.
- Whether the boss names in `DUNGEON_BOSSES` match Forever's combat log, and whether `UNIT_DIED` fires for bosses. After a run, the boss should appear under `kills.byName` in SavedVariables.
- Whether the Forever NPCs added in 0.78.0-0.81.0 open our box. If one doesn't, capture the in-game name.

## Next step
1. The user's in-game test of 0.84.0, and their `/rpgd tts` output.
2. Spot checks: a friendly imp or voidwalker (and a felhunter); "Teach me." at a trainer in DialogueUI; `/rpgd letters` away from and at a mailbox, then walk off; a Skyborne druid at an innkeeper; an innkeeper after dying a lot; a new `more_folk` NPC in Ironforge or Orgrimmar; a quest turned in inside a town (standing +3).
3. Natural next work: the leftover NPC names above; split the over-long lines; World views/asks/threads/letters weren't covered by the writing pass.
