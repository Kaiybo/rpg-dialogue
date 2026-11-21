# RPG Dialogue: Western Plaguelands (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

## 1.25.1 (2026-11-21)
- Fixed a load error (a missing quest reference) that dropped the NPCs after it in one file to generic lines.

## 1.25.0 (2026-11-19)
- Human patch: human players get their own branches with human NPCs, and other races here say what they think of humans (some can be talked round with Persuade).

## 1.24.0 (2026-11-19)
- A doubled Magnus Frostwake removed.

## 1.23.0 (2026-11-19)
- Warlocks: NPCs react to the demon at your side, your Demon Armor, soul shards, soulstones and Fel Taint. Where warlockry is banned, warlocks speak in hints and people sense rather than name it; some NPCs openly dislike warlocks. Warlock trainers and quest-givers rewritten and deepened.

## 1.22.0 (2026-11-18)
- More named NPCs the earlier passes missed now have conversations, and thin ones have more to say. New files: restart the game fully.
- Major NPCs answer Admire, Taunt and Intimidate in their own voice, and turn you down in their own words when they won't talk.

## 1.21.0 (2026-11-18)
- Thin NPCs deepened with more to say, and NPCs that were missed added.
- Journal: the note about each person is one short sentence (12 words or fewer) and shows on the People page only, not in the diary.

## 1.20.0 (2026-11-18)
- New NPCs from the Classic-era roster (`npcs/more_folk.lua`). New files: restart the game fully.
- NPCs notice what you have done: quests for their neighbours, notable kills, your deaths, rank and reputation.
- Writing pass: stance replies end on something concrete, fewer echoes and stock phrases.
- Druid greetings that assume a night elf or tauren no longer fire for other druid races.

## 1.19.0 (2026-11-18)
- Writing pass: repeated phrases cut and replaced with concrete detail.
- Clarity pass: answers answer the question, names are introduced, quest lines stand alone, fewer contradictions.
- NPCs answer each stance reply before the talk moves on.

## 1.18.0 (2026-11-17)
- Named NPCs answer many more "Ask about" topics (3 to 6 each, more for leaders), mostly the new world topics added in World 1.36.0.
- New people to talk to: Flint Shadowmore, Alexia Ironknife, Argent Quartermaster Hasana, Bardu Sharpeye, Werg Thickblade. New files: restart the game fully (a /reload won't load them).
- New people to talk to: Mickey Levine, Argent Quartermaster Hasana.
- New files: restart the game fully (a /reload won't load them).

## 1.17.1 (2026-11-17)
- Writing pass on the characters added in 0.74.0: stock phrases ("fair enough", "truly", "worth more than") rewritten.

## 1.17.0 (2026-11-17)
- New people to talk to (see the main changelog for 0.74.0). New files: restart the game fully (a /reload won't load them).

## 1.16.0 (2026-11-17)
- Writing pass: stock phrases ("Fair enough", "I won't pretend", "truly", neat little morals) rewritten in each speaker's own voice, and more grit and humour in the everyday lines.

## 1.15.0 (2026-11-17)
- People here now and then recognise where you come from (your origin) and react to it.

## 1.14.0 (2026-11-17)
- The town's leading people greet you differently when you come back after a fortnight or more, notice how far you've come since they last saw you, and have heard what you did with their neighbours. Needs RPG Dialogue 0.67.0.

## 1.13.1 (2026-11-17)
- Chillwind Camp now speaks of Dalaran rebuilding, not hidden behind its dome.

## 1.13.0 (2026-11-17)
- Some people here notice who you travel with: a greeting about your companions, a reply to bring them up, and a conversation with stances to take. Needs RPG Dialogue 0.59.0.

## 1.12.0 (2026-11-17)
- People with a stake in a nearby dungeon or raid react once you've cleared it: a greeting, a reply to bring it up, and a conversation about what it means to them, with stances to take. Needs RPG Dialogue 0.58.0.

## 1.11.0 (2026-11-17)
- Every class this place could plausibly meet now gets a greeting and its own conversation, including this server's Forsaken paladins and dwarf shamans where they'd be welcome. Some people here also notice when you've been thinning out the local trouble.

## 1.10.0 (2026-11-17)
- Druid replies for every named person here who had none: a greeting, a question and something to argue about. Night elf and tauren druids are both spoken to where it fits.

## 1.9.0 (2026-11-17)
- Warriors and hunters are noticed: 20 people greet a warrior or hunter as one, and have a question to ask and something to argue about; hunters with a beast at their side hear it named. No new files. Needs RPG Dialogue 0.49.0.

## 1.8.0 (2026-11-16)
- Priests and paladins are noticed: 9 people greet an Alliance priest or paladin as one, and have something to ask and argue about.

## 1.7.0 (2026-11-16)
- Rogues, mages and warlocks are noticed: named people here greet them as such, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.43.0.

## 1.6.0 (2026-11-16)
- New people with no quests, who had nothing to say until now: Argent Quartermaster Lightspark, Leonard Porter.
- New files: exit the game fully and restart.

## 1.5.0 (2026-11-16)
- New people: Myranda the Hag and Chromie in Andorhal.
- New files: exit the game fully and restart.

## 1.4.0 (2026-11-15)
- Replies for the classes and races these people would really react to (warriors, hunters, rogues, mages, warlocks, druids, shamans, paladins; every race of the faction, and the Skyborne), each leading somewhere.

## 1.3.0 (2026-11-15)
- Every person here writes a first impression in your diary after you first talk (the journal's People page shows it too).

## 1.2.0 (2026-11-15)
- Persuade, Intimidate and Deceive checks on the major people here, each with its own success and failure; lines and replies that depend on how warmly they regard you (disposition); a lead-in for "What do you know?".

## 1.1.0 (2026-11-15)
- Alignment now comes only from statements, never questions, and every reply that shifts alignment has an opposing one beside it. Taking one stance with someone closes the others for good.

## 1.0.0 (2026-11-15)
- Written in whole sentences and to the depth standard: every NPC has a hub, branches two or three deep, `again` lines, their own story and advice, and replies only some characters get (priests and paladins, Lordaeron refugees, the Forsaken, alchemists, healers for Kirsta's wound). New quest reference: Good Natured Emma.
- Chillwind Camp (Alliance): Commander Ashlam Valorfist, High Priestess MacDonnell, Alchemist Arbington, Weldon Barov, Argent Officer Pureheart, Nathaniel Dumah, Bibilfaz Featherwhistle; the camp's Argent Defenders.
- The Bulwark (Horde, on the Tirisfal border, so the pack also loads in Tirisfal Glades): High Executor Derrington, Shadow Priestess Vandis, Apothecary Dithers, Alexi Barov, Argent Officer Garush; the Bulwark's defenders.
- Out on the farms and hills: Janice Felstone (Felstone Field), Mulgris Deepriver (the Writhing Haunt), Marlene Redpath (Sorrow Hill), Kirsta Deepshadow (above Northridge), Eva Sarkhoff (Caer Darrow).
- The Barov brothers each tell you the fortune is theirs (claim `barov_heir`, disputed and never settled).
