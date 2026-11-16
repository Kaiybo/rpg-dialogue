# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.40.0)
- 0.40.0 (user: "proceed with release 0.40.0, focus on areas you believe are necessary"): closed the handoff's thin spots. Druid hello line + `druid_q`/`druid_talk` node for ~68 EK NPCs (Ironforge, Loch Modan, Wetlands, Elwynn, south packs); Horde warrior/hunter choice + `xhwar`/`xhhunt` node for 35 EK Horde NPCs (no `pet` condition used yet). No new files. Core 0.40.0 (0.39.0 was never released).
- 0.38.0 (user: "Get people that are between towns and NPCs that were skipped"): ~141 named NPCs in 40 packs, mostly roadside camps, huts, escorts and outposts, plus skipped town vendors/trainers; files named `npcs/roads.lua`, `between.lua`, `wilds.lua` etc. Written from memory; uncertain lore listed below. Core 0.38.0.
- 0.37.0 (user: "Move onto the 0.37.0 release"; picked from the next steps): ~75 new named NPCs: Revantusk Village (new file, new town `revantusk`), Hammerfall and Refuge Pointe, Tarren Mill, Kargath, Stonard, Grom'gol, Goldshire, Sentinel Hill, Auberdine, Astranaar, Theramore, Booty Bay, Gadgetzan, Everlook. Unvalidated by the user's choice (only `luac -p`).
- Core 0.36.0; every pack's version: `python3 tools/version.py`. 47 folders.
- 0.36.0 (user: "more dialogue specific to every race and class, not just priest... another big content push"): every class trainer pool is a full conversation (`pools_roles.lua`, test `tests/classes_spec.lua`); Stormwind's warrior trainers (`npcs/warriors.lua`); ~450 named NPCs gained class/race-gated branches (no new priest content); guard/innkeeper/child/stable/smith/flight pools and all 48 town citizen pools notice classes and races; class advice in `asks.lua`; 39 new origins (`origins/orc.lua`, `troll.lua`, `tauren.lua`, `forsaken.lua`, plus class origins for every Alliance race and Skyborne), used in lines across packs.
- 0.35.0 recap: citizens, ~100 named NPCs, Blasted Lands/Azshara/Silithus, journal pages, self-writing diary, three 45-60 throughlines.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).
- Known thin spots after 0.40.0: Horde hunter lines don't use the pet condition; Karakul (Stonard), Renee/Norman/Bates (Tirisfal/Undercity) skipped for Horde classes.

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Right-click on untitled townsfolk opening the box (citizen role via `UnitCreatureType`, which is localized: non-English clients may treat beasts as citizens); the journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list in the real addon.

## Next step
1. User installs 0.40.0 (/reload is enough; 0.38.0 needed a full restart). Ask whether druid and Horde warrior/hunter lines land.
1a. Lore to confirm (0.40.0): Wetlands druid lines (Dark Irons and orcs north of Dun Algaz, Karl Boran's raptor/sheep trouble, kaldorei in the Second War, Valstag shakiest).
1b. From 0.38.0: Ask how the roadside people feel in play, and whether 0.36.0/0.37.0's class and town content landed.
2. Lore to confirm (0.38.0 writers unsure): quest names "Sunken Treasure", "Dawn's Gambit", "Smokey's Special Compound", "Homeward Bound", "Muigin and Larion", Margoz's, Sputtervalve's, Dizzywig's, Stormpike's and Rigglefuzz's; Rane Yorick's gender; Rin'ji's escort faction; Curgle and Jabbey's races; where Kanati Greycloud, Motega Firemane, Kimberly Hiett, Henry Chapal, Shaina Fuller, Frederick Stover and Felicia Gump stand. Invented details are marked "authored, not canon" in the bibles. Plus 0.37.0's list: Gringer, Storm Shadowhoof, six Gadgetzan/Everlook service NPCs, Tor'gan.
3. Skipped for lack of sources: Truk Wildbeard, Agnar Beastamer, Rhapsody Shindigger, Theldurin the Lost, Lucien Tosselwrench, Gorzeeki Wildeyes, Nessa Shadowsong, Rellian Greenspyre, Lorekeeper Raintotem, Skorn Whitecloud, Seer Ravenfeather, Takrin Pathseeker, Larion. Then Alterac/Dalaran (Forever) once documented, and lines the user flags.
