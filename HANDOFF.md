# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long version of this file, with every per-release test list back to 0.78.0, is `git show 171f6b69:HANDOFF.md`).

## The user
- Wants content for both factions and every class, race and gender, with relevant replies for each.
- Wants conversations with real depth (many replies, deep branches) and people who talk like people (whole sentences, Warcraft's register, never clipped one-liners). Everything stays inside one box (ours or DialogueUI's) and never bounces to the game's window.
- Wants quick, efficient sessions: no constant re-validation; follow `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.86.0)
- 0.86.0 (user: the journal is "too much writing... the player character would only mark down brief and impactful things, rather than just yapping"): the Diary keeps events only (no entry per person met, no copied story-beat quotes); `impression.first` is one sentence of 12 words or fewer in every pack (People page only); arrivals and built-in diary lines are one short sentence; People shows one status line and no "last said" quote. Char schema 7 strips the old entries from saved diaries (a heuristic: the last entry of the first conversation with each person, and `X told me: "..."` lines). CONTENT_GUIDE "The journal is brief", DESIGN §3.13. Not shortened: Stories page text (`story`, beats quoted), Heard of (quotes per topic), thread `reflection`s, the 60 authored `journal` lines (about 19 words each). Only `luac -p` run; nothing seen in game.
- 0.85.0: PRs #128-#133 in one release (gut feelings, narration, "Where is...?", Admire/Taunt/Intimidate, tone, letters fix). Not seen in game either.
- TTS (0.83.1 work, never released alone): status names from a fallback table; when every way fails, one hint message and the bad list resets.
- Calls to check from the NPC gap scan (#125): Silithus Torrig/Bloodfist and five Grom'gol NPCs reverse earlier "skip" decisions; many 1.x placements are inferred. Leftover names: Stormwind Champions' Hall, Thunder Bluff (Atepa, Krumn, Sheza Wildmane), Teldrassil (Nhemai, Janna Brightmoon), Darkshire Watchers, Undercity (Randolph Montague, Lexington Mortaim), Ironforge/Loch Modan vendors.
- Open: Hemet Nesingwary mixes a burr and plain English (voice decision). Valor's Rest is placed two ways (Zannok: southeast Silithus; `desert.lua`: top of the Un'Goro road).


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
1. The user's in-game look at the 0.86.0 journal (Diary after login on an old character, People notes; whether Stories and Heard of also want trimming), and their test of 0.85.0 (and of 0.84.0), and their `/rpgd tts` output. Bottom bar crowding with disposition, tone, three persuasion buttons and "Ask about..." in the game look; DialogueUI rows.
2. Spot checks: Admire a vain NPC, Intimidate a coward; a secret topic refused below Warm; tone at Thrall; "Where is...?" in Stormwind (with TomTom); a friendly imp or voidwalker (and a felhunter); "Teach me." at a trainer in DialogueUI; `/rpgd letters` away from and at a mailbox, then walk off; a Skyborne druid at an innkeeper; an innkeeper after dying a lot; a new `more_folk` NPC in Ironforge or Orgrimmar; a quest turned in inside a town (standing +3).
3. Natural next work: the leftover NPC names above; split the over-long lines; World views/asks/threads/letters weren't covered by the writing pass.
