# RPG Dialogue

Talk to the people of Azeroth. RPG Dialogue for World of Warcraft: Forever turns NPC interactions into short, reactive, CRPG-style conversations. NPCs notice who you are (race, class, level, what you're wearing, what you've done) and remember you between visits.

Everything is pre-written and ships with the addon. Nothing is sent anywhere, and nothing you do shows up for anyone else.

## Install

Copy these folders into `World of Warcraft/<your Forever folder>/Interface/AddOns/`:

- `RPGDialogue`: the addon itself
- `RPGDialogue_World`: shared dialogue (generic lines, role pools)
- `RPGDialogue_Elwynn`: Northshire Valley and Goldshire

**Back up your `WTF` folder now and then.** RPG Dialogue keeps everything NPCs remember about each character in SavedVariables there.

### Developing from this repo

The repo holds several addons side by side, and WoW only sees top-level folders in `AddOns`. Link them instead of copying:

- Windows: `tools\link_addons.bat "C:\...\_forever_\Interface\AddOns"`
- macOS/Linux: `tools/link_addons.sh "/.../_forever_/Interface/AddOns"`

## Using it

- Talk to NPCs as usual. A conversation window opens in front of the normal one. **"Get on with it"** (or Escape) always takes you straight to the normal vendor, quest or trainer window.
- Vendors, flight masters, trainers and other service NPCs just say a short line on repeat visits and open their normal window right away. Click **Talk** on that bar for a full conversation.
- Keybinding: **Talk to Target** (Key Bindings > AddOns) talks to an NPC who has no gossip.
- `/rpgd` lists every command. `/rpgd settings` opens the settings.

## Known conflicts

- **Immersion, DialogueUI**: when either is loaded, RPG Dialogue steps back by default. It shows only its short line, and the full conversation is available through the Talk keybind. You can change this in settings.
- **Questie and other quest addons**: unaffected. RPG Dialogue never closes, hides or re-opens Blizzard's windows; it only fades them while its own window covers them.

## For developers

- `DESIGN.md`: architecture, data schema, scoring, risks
- `HANDOFF.md`: current state and next step
- `CONTENT_GUIDE.md`: how to write dialogue
- Tests: `lua5.1 tests/run.lua` · Lint: `luacheck .` · Content: `python3 tools/validate.py`

## License

MIT. See `LICENSE`.
