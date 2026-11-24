# RPG Dialogue: Darnassus (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

## 1.35.0 (2026-11-24): Fewer Words, Same Voice
- NPC speeches over 60 words were trimmed so they fit the dialogue box; nothing they say was lost.

## 1.34.0 (2026-11-24): Old Grudges
- Major NPCs answer for a grudge you hold against them (or they against you), and let things slip when angry.
- Overlong speeches tightened.

## 1.33.0 (2026-11-23): The Overlooked
- Characters who had no conversation now have one (core 0.105.0).

## 1.32.0 (2026-11-23)
- Lore fixes; NPCs that had no dialogue now talk (new file npcs/unwritten.lua: full game restart).

## 1.31.2 (2026-11-23): Ghosts Set Right
- Lore fix: Fandral now speaks of Valstann as his son, a warrior slain by the qiraji in Silithus.

## 1.31.1 (2026-11-20)
- The Darnassian Protector treants have their own conversation instead of the Sentinel guard tree.

## 1.31.0 (2026-11-20)
- Mathrengyl Bearwalker walks druids down the whole road to 60; Fandral Staghelm, Denatharion and Fylerian Nightwing deepened for druids.

## 1.30.0 (2026-11-19)
- Mage patch: mage trainers, portal trainers and wizards here have mage-only branches and more depth; clipped lines rewritten; doubled NPCs removed where found.

## 1.29.0 (2026-11-19)
- Human patch: human players get their own branches with human NPCs, and other races here say what they think of humans (some can be talked round with Persuade).

## 1.28.0 (2026-11-19)
- Tyrande, Fandral, the Enclave, the Temple and the Sentinels deepened with night elf-only branches; hunter trainers Jocaste, Dorion and Jeen'ra follow the hunter's road; Story endings at Dorion and Tyrande; 29 doubled NPCs removed.

## 1.27.0 (2026-11-19)
- Warrior trainers Elanaria, Arias'ta, Darnath and Sildanair rewritten and deepened along the warrior's road.

## 1.26.0 (2026-11-19)
- Warlocks: NPCs react to the demon at your side, your Demon Armor, soul shards, soulstones and Fel Taint. Where warlockry is banned, warlocks speak in hints and people sense rather than name it; some NPCs openly dislike warlocks. Warlock trainers and quest-givers rewritten and deepened.

## 1.25.0 (2026-11-18)
- More named NPCs the earlier passes missed now have conversations, and thin ones have more to say. New files: restart the game fully.
- Major NPCs answer Admire, Taunt and Intimidate in their own voice, and turn you down in their own words when they won't talk.

## 1.24.0 (2026-11-18)
- Thin NPCs deepened with more to say, and NPCs that were missed added.
- Journal: the note about each person is one short sentence (12 words or fewer) and shows on the People page only, not in the diary.

## 1.23.0 (2026-11-18)
- "Where is...?" directions for Darnassus (`directions.lua`, new file: restart the game fully).
- Tyrande's lines have narration.

## 1.22.0 (2026-11-18)
- New NPCs from the Classic-era roster (`npcs/more_folk.lua`). New files: restart the game fully.
- NPCs notice what you have done: quests for their neighbours, notable kills, your deaths, rank and reputation.
- Writing pass: stance replies end on something concrete, fewer echoes and stock phrases.
- Druid greetings that assume a night elf or tauren no longer fire for other druid races.

## 1.21.0 (2026-11-18)
- Writing pass: repeated phrases cut and replaced with concrete detail.
- Clarity pass: answers answer the question, names are introduced, quest lines stand alone, fewer contradictions.
- Some NPCs of the opposite sex flirt with you, and remember how you answered (needs core 0.83.0).
- NPCs who had only a few lines now have full conversations.
- NPCs answer each stance reply before the talk moves on.

## 1.20.0 (2026-11-17)
- Named NPCs answer many more "Ask about" topics (3 to 6 each, more for leaders), mostly the new world topics added in World 1.36.0.
- Prejudices (0.80.0): Fandral Staghelm (mages) and Jeen'ra Nightrunner (humans). They let it show, you can push back or win them round, and it fades as they warm to you. No new files: a /reload is enough.
- New: Erion Shadewhisper (rogue trainer) distrusts humans as short-lived oath-breakers, and Firodren Mooncaller (herbalism trainer) resents dwarves for digging up Darkshore. Humans and dwarves get their own conversations, and a [Persuade] can soften each of them for good.
- New file: needs a full game restart, not /reload.
- People here notice your other characters: kin, look-alikes, faces they remember (needs core 0.80.0).
- New Forever-only characters (new files: full game restart): Teuren Vineshade.
- New people to talk to: Darnath Bladesinger, Silvaria, Alassin, Elissa Dumas, Lairn, Landria.
- New files: restart the game fully (a /reload won't load them).
- Origin nods (core 0.81.0): people here now notice the newer backgrounds from 0.70.0.

## 1.19.1 (2026-11-17)
- Small fixes; missing characters added to the file list where needed.

## 1.19.0 (2026-11-17)
- New people to talk to: Chief Archaeologist Greywhisker, Dorion, Raedon Duskstriker, Rellian Greenspyre. New files: restart the game fully (a /reload won't load them).
- Writing pass: stock phrases ("Fair enough", "I won't pretend", "truly", neat little morals) rewritten in each speaker's own voice, and more grit and humour in the everyday lines.

## 1.18.0 (2026-11-17)
- People here now and then recognise where you come from (your origin) and react to it.

## 1.17.0 (2026-11-17)
- The town's leading people greet you differently when you come back after a fortnight or more, notice how far you've come since they last saw you, and have heard what you did with their neighbours. Needs RPG Dialogue 0.67.0.

## 1.16.0 (2026-11-17)
- Some people here notice who you travel with: a greeting about your companions, a reply to bring them up, and a conversation with stances to take. Needs RPG Dialogue 0.59.0.

## 1.15.0 (2026-11-17)
- People with a stake in a nearby dungeon or raid react once you've cleared it: a greeting, a reply to bring it up, and a conversation about what it means to them, with stances to take. Needs RPG Dialogue 0.58.0.

## 1.14.0 (2026-11-17)
- Every class this place could plausibly meet now gets a greeting and its own conversation, including this server's Forsaken paladins and dwarf shamans where they'd be welcome. Some people here also notice when you've been thinning out the local trouble.

## 1.13.0 (2026-11-17)
- Tyrande and Fandral are rivals: siding with one cools the other, and each greets you accordingly. No new files. Needs RPG Dialogue 0.55.0.

## 1.12.0 (2026-11-17)
- Druids are noticed: 27 people greet a druid as one, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.53.0.

## 1.11.0 (2026-11-17)
- Priests and paladins are noticed: 35 people greet an Alliance priest or a paladin as one, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.51.0.

## 1.10.0 (2026-11-17)
- Warriors and hunters are noticed: about 65 new warrior and hunter conversations; people greet a warrior or hunter as one, with a question to ask and something to argue about, and hunters with a beast at their side hear it named. No new files. Needs RPG Dialogue 0.50.0.

## 1.9.0 (2026-11-16)
- All 37 people in Darnassus now notice rogues, mages and warlocks (72 new branches); Tyrande, Fandral and Alathea have all three.
- Fix: Tyrande's warm greeting and Fandral's cold one were tangled into the lines above them and never showed.

## 1.8.0 (2026-11-16)
- New people with no quests, who had nothing to say until now: Garryeth, Sildanair, Ariyell Skyshadow, Lelanai, Jartsam, Lysheana, Shalumon, Jaeana, Dannelor, Ainethil.
- New files: exit the game fully and restart.

## 1.7.0 (2026-11-16)
- New people: Vesprystus at Rut'theran, Ilyenia Moonfire and Jeen'ra Nightrunner.
- New files: exit the game fully and restart.

## 1.6.0 (2026-11-15)
- Replies for the classes and races these people would really react to (warriors, hunters, rogues, mages, warlocks, druids, shamans, paladins; every race of the faction, and the Skyborne), each leading somewhere.

## 1.5.0 (2026-11-15)
- 18 new people: the Temple of the Moon's priestesses (Priestess Alathea, Astarii Starseeker, Jandria, Lariia, Sister Aquinne), Idriana; the Cenarion Enclave (Jenal, Syurna, Jocaste, Denatharion); the Warrior's Terrace (Thyn'tel Bladeweaver, Elanaria, Mathiel, Arias'ta Bladesinger, Mydrannul); Herald Moonstalker, Treshala Fallowbrook, Darianna.
- First impressions in your diary. New files: restart the game.

## 1.4.0 (2026-11-15)
- Persuade, Intimidate and Deceive checks on the major people here, each with its own success and failure; lines and replies that depend on how warmly they regard you (disposition); a lead-in for "What do you know?".

## 1.3.0 (2026-11-15)
- Alignment now comes only from statements, never questions, and every reply that shifts alignment has an opposing one beside it. Taking one stance with someone closes the others for good.

## 1.2.0 (unreleased)
- Depth: Tyrande, Fandral, Mathrengyl, A'moora, Gracina and Saelienne are now conversations to explore, with a hub, branches two or three deep and "Something else" back to the start. Tyrande on Malfurion's barrow, immortality, the Warsong in Ashenvale, the Sentinels and Hyjal; Fandral on the dragons who refused his tree, Remulos, his vision for the kaldorei and Malfurion; Mathrengyl on the Great Bear Spirit and Auberdine's poisoned animals; A'moora on Lady Sathrah and Elune's warrior face; Gracina on the silithid (and on the Archdruid's certainty).
- For a priest of the Light: Tyrande and A'moora greet human, dwarf and gnome priests as the Temple did in Year 1 (Priestess Alathea trained them), and each answers "Is the Light so different?" in their own way, without claiming the two faiths are one. Tyrande asks a priest in Shadowform to set it aside in the Temple.
- Replies for druids (Fandral, Tyrande, Mathrengyl), night elf priests, humans (Tyrande remembers calling them mongrels before Hyjal), the Skyborne, and players who finished Reception from Tyrande, Rise of the Silithid or The Great Cat Spirit (Forever).
- Ask about: every NPC has their own story and advice; Tyrande, Fandral and Gracina answer new topics (Malfurion, Teldrassil, the silithid) once the World pack adds them.
- Year 1 fix: Tyrande calls Malfurion by name, not "husband" (they wed later).
- Voice pass: every line now speaks in whole sentences; night elves sound old, calm and formal.

## 1.1.0 (unreleased)
- Depth pass: repeat visits now bring personal lines (habits, worries, opinions of the neighbours), night-time lines, and a question or two about the person themselves, not only their quests.
- Saelienne, Gracina, A'moora, Mathrengyl.

## 1.0.2 (unreleased)
- Gracina Spiritmight hears that a Gadgetzan alchemist is asking about her insect studies.

## 1.0.1 (unreleased)
- Fandral has an opinion about Corithras and the moonwells of Teldrassil; Tyrande knows Tenaron Stormgrip sent you down from Aldrassil.

## 1.0.0 (first release, unreleased)
- Tyrande Whisperwind and Priestess A'moora in the Temple of the Moon; Archdruid Fandral Staghelm and Mathrengyl Bearwalker in the Cenarion Enclave; Gracina Spiritmight the scholar; Innkeeper Saelienne. Darnassus's Sentinels are in the World pack.
