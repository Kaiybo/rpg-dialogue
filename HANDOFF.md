# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long version of this file, with every per-release test list back to 0.78.0, is `git show 171f6b69:HANDOFF.md`).

## The user
- Wants content for both factions and every class, race and gender, with relevant replies for each.
- Wants conversations with real depth (many replies, deep branches) and people who talk like people (whole sentences, Warcraft's register, never clipped one-liners). Everything stays inside one box (ours or DialogueUI's) and never bounces to the game's window.
- Wants quick, efficient sessions: no constant re-validation; follow `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.89.0)
- After 0.89.0, unreleased (user: "Focus on warlocks. Also improve their writing."): every warlock and demon trainer, the warlock quest-givers (Gakin, Takar, Strahad, Menara, Halgar, Mor'zul...), the World `demons.lua` pools and the `trainer_warlock` pool were rewritten (no stacked fragments, varied go-backs) and deepened with warlock-only branches along the level path (imp, voidwalker 10, succubus 20, felhunter 30, felsteed 40, infernal 50, doomguard/dreadsteed 60). Doubled copies of Nartok, Hraug, Dane Winslow, Briarthorn, Thistleheart and Godrick Farsan removed (deeper copy kept). Lore fixes: Kaal Soulreaper is an orc (bible updated); Doan Karhan human; Godrick's Hearts of the Pure targets; Banehollow's ritual in Dire Maul. Open: Mor'zul's race (packs disagree; wiki says human, left unstated); some NPCs may gate the doomguard ritual at 50 rather than 60. No version bump or changelog yet; only `luac -p` run.
- 0.89.0 (user: "make a release"): open PRs #151 (Galiaan human voice, Westfall 1.27.0) and #152 (flagged lines print in chat + copy window; `/rpgd flagged copy`, `/rpgd flagged N`) merged cleanly. No new files. Only `luac -p` run; nothing seen in game.
- 0.88.0 (user: "go ahead" on releasing the rest of #141): the last two batches of the missed-NPC pass, 47 new NPCs (Orgrimmar 29, Ironforge/Dun Morogh 18). Before merging, 60 entries from those batches that duplicated NPCs already released in 0.87.0 were dropped (the released copies kept), so the duplicate count is unchanged at 336, not worse. Orgrimmar `npcs/more_folk2.lua` is a NEW FILE (full restart). Only `luac -p` run.
- 0.87.0 (user: "build the next release"): open PRs #141 (its later commits; 0.86.0 had only the early part), #143-#147 merged. Conflicts: Wenna Silkbeard dropped from Barrens `unsung.lua` (#141 moved her to Wetlands); #144 was cut from the pre-0.86.0 base, so its changelogs/handoff were dropped (ours kept) and its `.toc` file lists kept both. Every pack bumped one minor. Only `luac -p` run; nothing seen in game.
- **Duplicates:** #141 and #144 both added "missed" NPCs in the same zones, so ~337 TODO_NPC names now exist twice under different keys. Nothing breaks (the last-loaded copy wins `byName`; the other is dead weight), but they should be deduped, keeping the deeper copy. List: `git grep -hoP 'id = TODO_NPC\("\K[^"]+' -- 'RPGDialogue_*/npcs/*.lua' | sort | uniq -d`.
- #143 added `likesTone` to many majors; tone was removed in 0.86.0, so it's unused data.
- 0.86.0 (user: "build a release with all PRs"): open PRs #135-#141 merged. Conflicts: #135 and #137 both built Joke; kept #135's scoring/locale/bar row plus #137's `say` lines (`Engine.PickSay`, World `persuade_say.lua`, NEW FILE). #139's version bumps replaced by one release bump. Only `luac -p` run; nothing seen in game. Joke icon `INV_Misc_Bell_01` may not exist on this client.
- 0.85.0 (user: "build the new release"): open PRs #128-#133 merged into one release: letters walk-away fix, gut feelings (DESIGN §3.15), narration `narr` (§2.5/2.6, CONTENT_GUIDE §2a), "Where is...?" (§3.11), Admire/Taunt/Intimidate + disposition gates (§3.16), tone Polite/Normal/Blunt (§3.17, CONTENT_GUIDE §7b). NEW FILES (full restart): `Systems/Insight.lua`, `Systems/Persuasion.lua`, `Systems/Directions.lua`, World `gut.lua` + `persuade.lua`, `directions.lua` in 9 packs. Conflicts were all keep-both (settings, locale, PackAPI kinds, the bottom bar: tone at left beside disposition, persuasion buttons at right; DialogueUI rows: Persuade..., Get on with it, Tone; Thrall's "For the Horde." keeps its narration and gains tone variants). Only `luac -p` run; nothing seen in game.
- Unreleased (0.90.0 work): options that open when people dislike you (DESIGN §3.16 last bullet): three hostile-only "ask anyone" topics (grievance, amends, spite), condition `grudge`, line/topic `maxDisposition`; hate pays too: Intimidate someone Cold or worse and they're cowed (answer anything, secrets included), angry answers blurt a local rumor or the NPC's own `blurts`, sour-but-true advice. No new files. Only `luac -p` run; nothing seen in game. Natural follow-up: majors' own grievance/spite answers and their own `blurts` lines.
- After 0.85.0, unreleased (no version bump or changelog yet): all 116 `tier = "major"` NPCs in 42 packs have their own `persuade` answers (Admire/Taunt/Intimidate, success and fail) and a `topics._gated` refusal; 20 have `private` topics (e.g. Jaina `arthas`/`stratholme`, Tyrande `malfurion`, Vol'jin `yenniku`, Eitrigg `blackrock`, Varimathras `burning_legion`); many gained `likesTone`, and orc/troll/dwarf majors gained `race`. Only `luac -p` run. Judgement calls: Tyrande and Seahorn blunt, Larksbane polite.
- Unreleased: three warlock Stories in World `threads.lua` (no new files): `lock_surena` (Alliance: Drusilla, Gakin, Ursula, Demisette; ending choice at Gakin), `lock_zelk` (Horde: Nartok or Mirket, Orgnil, Gan'rul, Neeru; ending at Orgnil), `lock_summit` (either faction, 30-60: Strahad, Impsy, Gorzeeki; ending at Mor'zul). Ending greetings on Gakin, Orgnil, Mor'zul. Only `luac -p` run.
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
0. Dedupe the doubled NPCs above.
1. The user's in-game test of 0.85.0 (and of 0.84.0), and their `/rpgd tts` output. Bottom bar crowding with disposition, tone, three persuasion buttons and "Ask about..." in the game look; DialogueUI rows.
2. Spot checks: Admire a vain NPC, Intimidate a coward; a secret topic refused below Warm; tone at Thrall; "Where is...?" in Stormwind (with TomTom); a friendly imp or voidwalker (and a felhunter); "Teach me." at a trainer in DialogueUI; `/rpgd letters` away from and at a mailbox, then walk off; a Skyborne druid at an innkeeper; an innkeeper after dying a lot; a new `more_folk` NPC in Ironforge or Orgrimmar; a quest turned in inside a town (standing +3).
3. Disposition next: put the major-NPC pass in a release when the user says; the same pass for `tier = "minor"` named NPCs if the user likes it in game.
4. Natural next work: the leftover NPC names above; split the over-long lines; World views/asks/threads/letters weren't covered by the writing pass.
