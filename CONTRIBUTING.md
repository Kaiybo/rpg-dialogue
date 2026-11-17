# Contributing to RPG Dialogue

Thanks for helping. Bug reports, flagged lines and new dialogue are all welcome.

## Reporting a bug or a bad line

Open an [issue](https://github.com/Kaiybo/rpg-dialogue/issues) and include:

- the addon version (`/rpgd` prints it) and your client (WoW Forever 1.60.x);
- the NPC, zone, and your character's race, class, level and faction;
- for a Lua error, the full text from BugSack + !BugGrabber;
- for a line that reads wrong, the flag button's report on the dialogue window (it saves the line and the moment) or a screenshot.

## Writing dialogue

Read `CONTENT_GUIDE.md` first (at least §2, voice, and §7a, the depth standard). The rules that always hold:

- Whole sentences in a natural Warcraft voice; player replies are 15 words or fewer.
- Classic-era lore only. Nothing from later expansions is foreshadowed. Facts come from warcraft.wiki.gg or Blizzard's sites and are recorded in `LORE_NOTES.md` or the pack's `bibles/`.
- Alignment shifts only from stance replies (`fx.align`), with at least two opposing stances per node; questions never shift alignment.
- Original writing only: never paste Blizzard's quest or gossip text into dialogue.

A new zone pack starts from `python3 tools/new_zone.py` (see `PACK_AUTHORING.md`). The schema is in `DESIGN.md` §2.

## Pull requests

- Keep each PR to one pack or one feature.
- Run `luac5.1 -p` on every Lua file you change; `python3 tools/check_all.py --quick` runs everything (CI runs it too).
- New files need a full game restart, not `/reload`; mention it in the pack's `CHANGELOG.md`.

By contributing you agree your work is released under the MIT license (`LICENSE`).
