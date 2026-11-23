# RPG Dialogue: Eastern Plaguelands (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

## 1.30.0 (2026-11-23)
- Lore fixes; NPCs that had no dialogue now talk (new file npcs/unwritten.lua: full game restart).

## 1.29.1 (2026-11-21)
- Fixed a load error (a missing quest reference) that dropped the NPCs after it in one file to generic lines.

## 1.29.0 (2026-11-19)
- Human patch: human players get their own branches with human NPCs, and other races here say what they think of humans (some can be talked round with Persuade).

## 1.28.0 (2026-11-19)
- Warlocks: NPCs react to the demon at your side, your Demon Armor, soul shards, soulstones and Fel Taint. Where warlockry is banned, warlocks speak in hints and people sense rather than name it; some NPCs openly dislike warlocks. Warlock trainers and quest-givers rewritten and deepened.

## 1.27.0 (2026-11-18)
- More named NPCs the earlier passes missed now have conversations, and thin ones have more to say. New files: restart the game fully.
- Major NPCs answer Admire, Taunt and Intimidate in their own voice, and turn you down in their own words when they won't talk.

## 1.26.0 (2026-11-18)
- Thin NPCs deepened with more to say, and NPCs that were missed added.
- Journal: the note about each person is one short sentence (12 words or fewer) and shows on the People page only, not in the diary.

## 1.25.0 (2026-11-18)
- New NPCs from the Classic-era roster (`npcs/more_folk.lua`). New files: restart the game fully.
- NPCs notice what you have done: quests for their neighbours, notable kills, your deaths, rank and reputation.
- Writing pass: stance replies end on something concrete, fewer echoes and stock phrases.
- Druid greetings that assume a night elf or tauren no longer fire for other druid races.

## 1.24.0 (2026-11-18)
- Writing pass: repeated phrases cut and replaced with concrete detail.
- Clarity pass: answers answer the question, names are introduced, quest lines stand alone, fewer contradictions.
- NPCs answer each stance reply before the talk moves on.

## 1.23.0 (2026-11-17)
- Named NPCs answer many more "Ask about" topics (3 to 6 each, more for leaders), mostly the new world topics added in World 1.36.0.
- New people to talk to: Joseph Redpath at Darrowshire, Augustus the Touched at Terrordale, Eris Havenfire at Light's Hope. Egan and Zverenhoff have more to say. New files: restart the game fully (a /reload won't load them).
- Prejudices (0.80.0): Nathanos Blightcaller (trolls) and Duke Nicholas Zverenhoff (the Forsaken). They let it show, you can push back or win them round, and it fades as they warm to you. No new files: a /reload is enough.
- New people to talk to: Augustus the Touched, Eris Havenfire, Joseph Redpath, Davil Lightfire, Quartermaster Miranda Breechlock. New files: restart the game fully (a /reload won't load them).
- New people to talk to: Augustus the Touched, Quartermaster Miranda Breechlock.
- New files: restart the game fully (a /reload won't load them).

## 1.22.1 (2026-11-17)
- Writing pass on the characters added in 0.74.0: stock phrases ("fair enough", "truly", "worth more than") rewritten.

## 1.22.0 (2026-11-17)
- New people to talk to (see the main changelog for 0.74.0). New files: restart the game fully (a /reload won't load them).

## 1.21.0 (2026-11-17)
- Writing pass: stock phrases ("Fair enough", "I won't pretend", "truly", neat little morals) rewritten in each speaker's own voice, and more grit and humour in the everyday lines.

## 1.20.0 (2026-11-17)
- People here now and then recognise where you come from (your origin) and react to it.

## 1.19.0 (2026-11-17)
- The town's leading people greet you differently when you come back after a fortnight or more, notice how far you've come since they last saw you, and have heard what you did with their neighbours. Needs RPG Dialogue 0.67.0.

## 1.18.0 (2026-11-17)
- Some people here notice who you travel with: a greeting about your companions, a reply to bring them up, and a conversation with stances to take. Needs RPG Dialogue 0.59.0.

## 1.17.0 (2026-11-17)
- People with a stake in a nearby dungeon or raid react once you've cleared it: a greeting, a reply to bring it up, and a conversation about what it means to them, with stances to take. Needs RPG Dialogue 0.58.0.

## 1.16.0 (2026-11-17)
- Every class this place could plausibly meet now gets a greeting and its own conversation, including this server's Forsaken paladins and dwarf shamans where they'd be welcome. Some people here also notice when you've been thinning out the local trouble.

## 1.15.0 (2026-11-17)
- Warriors and hunters are noticed: 12 people greet a warrior or hunter as one, and have a question to ask and something to argue about; hunters with a beast at their side hear it named. No new files. Needs RPG Dialogue 0.49.0.

## 1.14.0 (2026-11-16)
- Priests and paladins are noticed: 5 people greet an Alliance priest or paladin as one, and have something to ask and argue about.

## 1.13.0 (2026-11-16)
- Rogues, mages and warlocks are noticed: named people here greet them as such, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.43.0.

## 1.12.0 (2026-11-16)
- Druids are noticed: nine people at Light's Hope, the Eastwall and on the roads greet a druid as one and have something to ask and argue about.

## 1.11.0 (2026-11-16)
- New people with no quests, who had nothing to say until now: Khaelyn Steelwing, Georgia, Jessica Chambers, Jase Farlane.
- New files: exit the game fully and restart.

## 1.10.0 (2026-11-16)
- New people: Carlin and Pamela Redpath, Betina Bigglezink and Smokey LaRue.
- New files: exit the game fully and restart.

## 1.9.0 (2026-11-15)
- Replies for the classes and races these people would really react to (warriors, hunters, rogues, mages, warlocks, druids, shamans, paladins; every race of the faction, and the Skyborne), each leading somewhere.

## 1.8.0 (2026-11-15)
- Every person here writes a first impression in your diary after you first talk (the journal's People page shows it too).

## 1.7.0 (2026-11-15)
- Persuade, Intimidate and Deceive checks on the major people here, each with its own success and failure; lines and replies that depend on how warmly they regard you (disposition); a lead-in for "What do you know?".

## 1.6.0 (2026-11-15)
- Alignment now comes only from statements, never questions, and every reply that shifts alignment has an opposing one beside it. Taking one stance with someone closes the others for good.

## 1.5.0 (2026-11-15)
- Tirion Fordring, once the spirit healer has told you about the missing the Scourge takes first.

## 1.4.0 (unreleased)
- Voice pass: Tyrosus, Leonid, Tirion, Nathanos and the Light's Hope guards now talk in whole sentences instead of clipped fragments, each in their own voice; what they say is unchanged.

## 1.3.0 (unreleased)
- Tyrosus carries the Scarlet Path's last beat: some left the Hand before it became the Crusade, some after.

## 1.2.0 (unreleased)
- For a priest: what the Dawn needs from a healer (Tyrosus). Tyrosus and Leonid notice Shadowform.

## 1.1.0 (unreleased)
- Depth: Tyrosus (replies for paladins and Silver Hand squires), Leonid (a reply for the Forsaken) and Tirion (his son, Mirador, Eitrigg).

## 1.0.0 (first release, unreleased)
- Light's Hope Chapel (both factions): Lord Maxwell Tyrosus, Leonid Barthalomew the Revered; the Argent Guards.
- By the Thondroril River: Tirion Fordring and his horse Mirador.
- The Marris Stead (Horde): Nathanos Blightcaller.
