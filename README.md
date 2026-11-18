# RPG Dialogue

Talk to the people of Azeroth. RPG Dialogue for World of Warcraft: Forever turns NPC interactions into short, reactive, CRPG-style conversations. NPCs notice who you are (race, class, level, what you're wearing, what you've done), remember you between visits, talk about each other, and sometimes lie to you.

Everything is pre-written and ships with the addon. Nothing is sent anywhere, and nothing you do shows up for anyone else.

## Install

Download the latest zip from the [Releases page](https://github.com/Kaiybo/rpg-dialogue/releases) and unzip it into `World of Warcraft/<your Forever folder>/Interface/AddOns/`. Restart the game fully (not `/reload`) the first time and after any update that adds new folders.

Or, from a copy of this repository, copy these folders into `World of Warcraft/<your Forever folder>/Interface/AddOns/`:

- `RPGDialogue`: the addon itself
- `RPGDialogue_World`: shared dialogue (role pools, spirit healers, towns, topics, rumors, origins)
- `RPGDialogue_Elwynn`: Elwynn Forest (Northshire Valley, Goldshire, the farms, Eastvale)
- `RPGDialogue_Westfall`: Sentinel Hill and the farms of Westfall
- `RPGDialogue_Stormwind`: the Keep, the Cathedral, City Hall, the Library, SI:7, Old Town, the Stockade
- `RPGDialogue_Zephras`: Zephras Isle, home of the Skyborne
- `RPGDialogue_Redridge`: Lakeshire and the Redridge Mountains
- `RPGDialogue_Duskwood`: Darkshire, Raven Hill and the woods
- `RPGDialogue_BurningSteppes`: Morgan's Vigil (Alliance), Flame Crest (neutral, with the Horde's wind riders) and a dragonspawn at Slither Rock
- `RPGDialogue_BlastedLands`: Nethergarde Keep and the watch on the Dark Portal
- `RPGDialogue_Azshara`: the ruins of the Highborne, Archmage Xylem's tower and the Bay of Storms
- `RPGDialogue_Silithus`: Cenarion Hold and Valor's Rest, the silithid and the Twilight's Hammer
- `RPGDialogue_WesternPlaguelands`: Chillwind Camp (Alliance), the Bulwark (Horde, on the Tirisfal border) and the ghosts of the farms
- `RPGDialogue_EasternPlaguelands`: Light's Hope Chapel (both factions), Tirion Fordring, the Marris Stead (Horde)
- `RPGDialogue_SearingGorge`: Thorium Point (both factions)
- `RPGDialogue_Riverglades`: Farholde Keep and the Brotherhood of the Horse (Alliance), Powderfuse Port (neutral)
- `RPGDialogue_Felwood`: Emerald Sanctuary (both factions), Bloodvenom Post (Horde), Talonbranch Glade (Alliance)
- `RPGDialogue_Winterspring`: Everlook (both factions) and the hot springs
- `RPGDialogue_UnGoro`: Marshal's Refuge (both factions)
- `RPGDialogue_Badlands`: Kargath (Horde), plus the Explorers' League dig and Lotwil's camp
- `RPGDialogue_Hinterlands`: Aerie Peak (Alliance)
- `RPGDialogue_Arathi`: Refuge Pointe (Alliance) and Hammerfall (Horde)
- `RPGDialogue_SwampOfSorrows`: Stonard (Horde)
- `RPGDialogue_Feralas`: Feathermoon Stronghold (Alliance) and Camp Mojache (Horde)
- `RPGDialogue_Dustwallow`: Theramore (Alliance) and Brackenwall Village (Horde)
- `RPGDialogue_Tanaris`: Gadgetzan and Steamwheedle Port (both factions)
- `RPGDialogue_Desolace`: Nijel's Point (Alliance) and Ghost Walker Post (Horde)
- `RPGDialogue_Silverpine`: the Sepulcher (Horde)
- `RPGDialogue_Teldrassil`: Shadowglen and Dolanaar
- `RPGDialogue_Tirisfal`: Deathknell and Brill (Horde)
- `RPGDialogue_Mulgore`: Camp Narache, Bloodhoof Village and Camp Gev'rek (Horde)
- `RPGDialogue_Durotar`: the Valley of Trials, Razor Hill and Sen'jin Village (Horde)
- `RPGDialogue_ThousandNeedles`: Freewind Post (Horde) and the Mirage Raceway (neutral)
- `RPGDialogue_Stranglethorn`: Booty Bay (neutral), Grom'gol Base Camp (Horde) and the Rebel Camp (Alliance)
- `RPGDialogue_Stonetalon`: Sun Rock Retreat, Malaka'jin and Stonetalon Peak (both factions)
- `RPGDialogue_LochModan`: Thelsamar, Ironband's dig and the Stonewrought Dam
- `RPGDialogue_Undercity`: the Dark Lady, Varimathras, the Apothecarium and the Magic Quarter (Horde)
- `RPGDialogue_Orgrimmar`: Thrall, the Broken Tusk and the Cleft of Shadow (Horde)
- `RPGDialogue_Darkshore`: Auberdine, the Fel Moss and Cerellean on the dock
- `RPGDialogue_Hillsbrad`: Southshore and Tarren Mill (both factions)
- `RPGDialogue_Ashenvale`: Astranaar, Maestra's Post and Splintertree Post (both factions)
- `RPGDialogue_Barrens`: the Crossroads: Thork, Sergra, Mankrik, Tonga and the poisoned oases (Horde)
- `RPGDialogue_ThunderBluff`: Cairne Bloodhoof, Hamuul Runetotem, Magatha Grimtotem and Elder Rise (Horde)
- `RPGDialogue_Darnassus`: Tyrande, Fandral Staghelm, the Temple of the Moon and the Cenarion Enclave
- `RPGDialogue_Moonglade`: Nighthaven, Keeper Remulos and the druids' trials (neutral: Alliance and Horde)
- `RPGDialogue_Wetlands`: Menethil Harbor, the Dragonmaw in the hills and the drowned fleet in the bay
- `RPGDialogue_Ironforge`: King Magni, Tinker Town, the Hall of Explorers, the High Seat, the Commons, the gates and Gol'Bolar Quarry
- `RPGDialogue_Dalaran`: Dalaran and the Alterac Mountains (Forever's rebuilt city)
- `RPGDialogue_Hyjal`: Mount Hyjal
- `RPGDialogue_Shendralas`: Shen'dralas

Content packs load by zone, so only the dialogue for where you are is in memory.

**Back up your `WTF` folder now and then.** RPG Dialogue keeps everything NPCs remember about each character in SavedVariables there. `/rpgd export` also gives you a copyable backup of one character's story.

## Using it

- Right-click NPCs as usual. The conversation box opens in front of the normal window, with the NPC's line and your replies, then the NPC's own quests ("Quest: ...", "Hand in: ...") and services (vendor, training, flights...). Picking one of those hands you straight to the normal window for it. **"Get on with it"** (or Escape) always takes you to the normal window.
- People with no menu of their own (Melika Isenstrider at the Lion's Pride Inn, for one) open the box when you right-click them, if RPG Dialogue has something for them to say.
- Prefer less? Settings > "When you talk to someone": a short line with the box only when there's news, or straight to business.
- **Ask about...** lets you ask people about topics you've picked up. You pick topics up by hearing them: names of people, places and troubles are highlighted in what people say, and clicking one asks about it. Anyone can be asked about their story, their work, for a little advice, or for the latest rumors. **The journal** (`/rpgd journal`, or its keybinding) keeps your chronicle, the people you've met, your character sheet and origin, topics, deeds and your own notes.
- Keybindings (Key Bindings > AddOns): **Talk to Target** talks to an NPC who has no gossip; **Open Journal**; **Ask About...** during a conversation.
- **The journal**: click the book on your screen (drag it anywhere; it can be hidden in settings), or `/rpgd journal`. Four pages: your diary by day and place, the people you've met, where you stand (alignment, beliefs, what you've heard and done), and your own notes.
- `/rpgd` lists every command. `/rpgd settings` opens the settings.

### Keyboard and gamepad

| | Keyboard | Gamepad (client gamepad mode) |
|---|---|---|
| Pick a reply | 1–9, or Up/Down/Tab then Enter | D-pad, then A |
| Finish the text | Space or Enter | A |
| Get on with it | Escape | B |
| Ask about... | the Ask About keybinding (set it in Key Bindings), then Up/Down/Enter | X, then D-pad and A |
| Journal tabs | Left/Right, Escape closes | D-pad left/right, B closes |

### Accessibility

**Text size and fonts**: the **Aa** button in the conversation box's title bar changes text size, line spacing, the font for what people say and the font for names while you read; Settings > Look and text has the same, plus the window style (the game's own, or parchment and dark wood). Fonts: the game's own, three bundled ones under the SIL Open Font License (Atkinson Hyperlegible, the most readable; Crimson Pro; Cinzel), and any your other addons share through SharedMedia.

Settings > Readability and accessibility: auto-advance with a delay, window scale, a high-contrast theme, gamepad controls, sounds on/off, and one **reduce motion** switch that turns off every screen effect. Text always appears in full at once. Nothing relies on color alone: selections are marked with ">", locked replies say "(Locked)", standing and alignment are shown in words.

## Other addons

- **DialogueUI**: the conversation happens inside DialogueUI's own window: the NPC's lines and your replies are its options, with its number keys and camera. Picking a quest or service, or "Get on with it", carries on with DialogueUI's own pages. (Built on how DialogueUI's window works inside, since it has no API for this; if a DialogueUI update changes that, RPG Dialogue's own box takes over.) Settings can switch to RPG Dialogue's box first instead.
- **Immersion**: RPG Dialogue steps back by default. It shows only its short line, and the full conversation is available through the Talk keybinding.
- Both: settings → "Other dialogue addons" (automatic, RPG Dialogue first, step back, or off).
- **Questie and other quest or vendor addons**: unaffected. RPG Dialogue never closes, hides or re-opens Blizzard's windows; it only fades them while its own window covers them, so "Get on with it" leaves them exactly as those addons expect.
- **Total RP 3** (optional): when it's loaded, NPCs call you by your roleplay name and title (two settings, both on by default). RPG Dialogue only reads your current profile, never changes it, and works the same without it.

## Known issues

This is an early (0.x) release, tested by one player on the Alliance side; Horde and other-class content has had less play. See `HANDOFF.md` for features not yet verified in game. Please report problems in [GitHub Issues](https://github.com/Kaiybo/rpg-dialogue/issues), ideally with the flag button on the dialogue window (it saves the line and everything about the moment), or with BugSack + !BugGrabber error text.

## For developers and pack authors

- `PACK_AUTHORING.md`: making a content pack, and the step-by-step zone workflow
- `CONTENT_GUIDE.md`: how to write dialogue (required reading)
- `DESIGN.md`: architecture, data schema, scoring, risks · `HANDOFF.md`: current state and next step
- `CONTRIBUTING.md`: reporting bugs, suggesting lines, sending pull requests
- Every check in one command: `python3 tools/check_all.py` (needs Python 3, Lua 5.1 and luacheck)
- Develop from the repo by linking the addon folders into your AddOns folder: `tools/link_addons.sh "/.../_forever_/Interface/AddOns"` (macOS/Linux) or `tools\link_addons.bat "C:\...\_forever_\Interface\AddOns"` (Windows)
- CurseForge page kit (logo, description, setup steps): `curseforge/README.md`
- Releases: tag `vX.Y.Z` and push; `.github/workflows/release.yml` runs the release checks and the BigWigs packager, which builds one zip with the core and every pack as separate addon folders.

## License and credits

MIT (see `LICENSE`). The bundled fonts are under the SIL Open Font License 1.1, each with its licence file in `RPGDialogue/Media/Fonts/`: Atkinson Hyperlegible (© Braille Institute of America), Crimson Pro and Cinzel.

Lore research draws on [warcraft.wiki.gg](https://warcraft.wiki.gg) (sources are listed in `LORE_NOTES.md` and each pack's `bibles/`). All dialogue is original writing; no Blizzard text ships with the addon.

World of Warcraft and Warcraft are trademarks of Blizzard Entertainment, Inc. RPG Dialogue is a fan-made addon and is not affiliated with or endorsed by Blizzard Entertainment.
