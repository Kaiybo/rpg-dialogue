# RPG Dialogue

Talk to the people of Azeroth. RPG Dialogue for World of Warcraft: Forever turns NPC interactions into short, reactive, CRPG-style conversations. NPCs notice who you are (race, class, level, what you're wearing, what you've done), remember you between visits, talk about each other, and sometimes lie to you.

Everything is pre-written and ships with the addon. Nothing is sent anywhere, and nothing you do shows up for anyone else.

## Install

Copy these folders into `World of Warcraft/<your Forever folder>/Interface/AddOns/`:

- `RPGDialogue`: the addon itself
- `RPGDialogue_World`: shared dialogue (role pools, spirit healers, towns, topics, rumors, origins)
- `RPGDialogue_Elwynn`: Elwynn Forest (Northshire Valley, Goldshire, the farms, Eastvale)
- `RPGDialogue_Westfall`: Sentinel Hill and the farms of Westfall
- `RPGDialogue_Stormwind`: the Keep, the Cathedral, City Hall, the Library, SI:7, Old Town, the Stockade
- `RPGDialogue_Zephras`: Zephras Isle, home of the Skyborne
- `RPGDialogue_Redridge`: Lakeshire and the Redridge Mountains
- `RPGDialogue_Duskwood`: Darkshire, Raven Hill and the woods
- `RPGDialogue_Ironforge`: King Magni, Tinker Town, the Hall of Explorers, the High Seat, the Commons, the gates and Gol'Bolar Quarry

Content packs load by zone, so only the dialogue for where you are is in memory.

**Back up your `WTF` folder now and then.** RPG Dialogue keeps everything NPCs remember about each character in SavedVariables there. `/rpgd export` also gives you a copyable backup of one character's story.

## Using it

- Right-click NPCs as usual. The conversation box opens in front of the normal window, with the NPC's line and your replies, then the NPC's own quests ("Quest: ...", "Hand in: ...") and services (vendor, training, flights...). Picking one of those hands you straight to the normal window for it. **"Get on with it"** (or Escape) always takes you to the normal window.
- People with no menu of their own (Melika Isenstrider at the Lion's Pride Inn, for one) open the box when you right-click them, if RPG Dialogue has something for them to say.
- Prefer less? Settings > "When you talk to someone": a short line with the box only when there's news, or straight to business.
- **Ask about...** lets you ask people about topics you've picked up. **The journal** (`/rpgd journal`, or its keybinding) keeps your chronicle, the people you've met, your character sheet and origin, topics, deeds and your own notes.
- Keybindings (Key Bindings > AddOns): **Talk to Target** talks to an NPC who has no gossip; **Open Journal**; **Ask About...** during a conversation.
- `/rpgd` lists every command. `/rpgd settings` opens the settings.

### Keyboard and gamepad

| | Keyboard | Gamepad (client gamepad mode) |
|---|---|---|
| Pick a reply | 1–5, or Up/Down/Tab then Enter | D-pad, then A |
| Finish the text | Space or Enter | A |
| Get on with it | Escape | B |
| Ask about... | the Ask About keybinding (set it in Key Bindings), then Up/Down/Enter | X, then D-pad and A |
| Journal tabs | Left/Right, Escape closes | D-pad left/right, B closes |

### Accessibility

**Text size and fonts**: the **Aa** button in the conversation box's title bar changes text size, line spacing, the font for what people say and the font for names while you read; Settings > Look and text has the same, plus the window style (the game's own, or parchment and dark wood). Fonts: the game's own, three bundled ones under the SIL Open Font License (Atkinson Hyperlegible, the most readable; Crimson Pro; Cinzel), and any your other addons share through SharedMedia.

Settings > Readability and accessibility: text speed, instant text, auto-advance with a delay, window scale, a high-contrast theme, gamepad controls, sounds on/off, and one **reduce motion** switch that turns off the typewriter and every screen effect. Nothing relies on color alone: selections are marked with ">", locked replies say "(Locked)", standing and alignment are shown in words.

## Other addons

- **DialogueUI**: the conversation happens inside DialogueUI's own window: the NPC's lines and your replies are its options, with its number keys and camera. Picking a quest or service, or "Get on with it", carries on with DialogueUI's own pages. (Built on how DialogueUI's window works inside, since it has no API for this; if a DialogueUI update changes that, RPG Dialogue's own box takes over.) Settings can switch to RPG Dialogue's box first instead.
- **Immersion**: RPG Dialogue steps back by default. It shows only its short line, and the full conversation is available through the Talk keybinding.
- Both: settings → "Other dialogue addons" (automatic, RPG Dialogue first, step back, or off).
- **Questie and other quest or vendor addons**: unaffected. RPG Dialogue never closes, hides or re-opens Blizzard's windows; it only fades them while its own window covers them, so "Get on with it" leaves them exactly as those addons expect.
- **Total RP 3** (optional): when it's loaded, NPCs call you by your roleplay name and title (two settings, both on by default). RPG Dialogue only reads your current profile, never changes it, and works the same without it.

## Known issues

Nothing has been tested in the game yet; see `HANDOFF.md` for what needs checking first. Please report problems with the flag button on the dialogue window (it saves the line and everything about the moment), or with BugSack + !BugGrabber error text.

## For developers and pack authors

- `PACK_AUTHORING.md`: making a content pack, and the step-by-step zone workflow
- `CONTENT_GUIDE.md`: how to write dialogue (required reading)
- `DESIGN.md`: architecture, data schema, scoring, risks · `HANDOFF.md`: current state and next step
- Every check in one command: `python3 tools/check_all.py` (needs Python 3, Lua 5.1 and luacheck)
- Develop from the repo by linking the addon folders into your AddOns folder: `tools/link_addons.sh "/.../_forever_/Interface/AddOns"` (macOS/Linux) or `tools\link_addons.bat "C:\...\_forever_\Interface\AddOns"` (Windows)
- Releases: tag `vX.Y.Z` and push; `.github/workflows/release.yml` runs the release checks and the BigWigs packager, which builds one zip with the core and every pack as separate addon folders.

## License

MIT (see `LICENSE`). The bundled fonts are under the SIL Open Font License 1.1, each with its licence file in `RPGDialogue/Media/Fonts/`: Atkinson Hyperlegible (© Braille Institute of America), Crimson Pro and Cinzel.
