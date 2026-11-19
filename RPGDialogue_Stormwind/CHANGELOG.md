# RPG Dialogue: Stormwind (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

## 1.34.0 (2026-11-19)
- Warlocks: NPCs react to the demon at your side, your Demon Armor, soul shards, soulstones and Fel Taint. Where warlockry is banned, warlocks speak in hints and people sense rather than name it; some NPCs openly dislike warlocks. Warlock trainers and quest-givers rewritten and deepened.

## 1.33.0 (2026-11-18)
- More named NPCs the earlier passes missed now have conversations, and thin ones have more to say. New files: restart the game fully.
- Major NPCs answer Admire, Taunt and Intimidate in their own voice, and turn you down in their own words when they won't talk.

## 1.32.0 (2026-11-18)
- Journal: the note about each person is one short sentence (12 words or fewer) and shows on the People page only, not in the diary.

## 1.31.0 (2026-11-18)
- "Where is...?" directions for Stormwind (`directions.lua`, new file: restart the game fully).
- Bolvar's lines have narration.

## 1.30.0 (2026-11-18)
- New NPCs from the Classic-era roster (`npcs/more_folk.lua`). New files: restart the game fully.
- NPCs notice what you have done: quests for their neighbours, notable kills, your deaths, rank and reputation.
- Writing pass: stance replies end on something concrete, fewer echoes and stock phrases.
- Druid greetings that assume a night elf or tauren no longer fire for other druid races.

## 1.29.0 (2026-11-18)
- Writing pass: repeated phrases cut and replaced with concrete detail.
- Clarity pass: answers answer the question, names are introduced, quest lines stand alone, fewer contradictions.
- Some NPCs of the opposite sex flirt with you, and remember how you answered (needs core 0.83.0).
- NPCs answer each stance reply before the talk moves on.

## 1.28.0 (2026-11-18)
- 14 new people in `npcs/stormwind_more.lua` and the park folk in `npcs/park_folk.lua` (new files: restart the game fully), and deeper conversations for Jarel Moor, Brother Joshua, Angus Stern, Brohann Caskbelly, Collin Mauren, the cathedral and the Old Town and Trade District regulars.

## 1.27.0 (2026-11-17)
- Named NPCs answer many more "Ask about" topics (3 to 6 each, more for leaders), mostly the new world topics added in World 1.36.0.
- New: Betty Quin, the enchanting teacher upstairs at Cordell's (see the main changelog for 0.80.0). New file `npcs/betty_quin.lua`: restart the game fully (a /reload won't load it).
- New: Adair Gilroy, Librarian, in the Mage Quarter (see the main changelog for 0.80.0). New file `npcs/gilroy.lua`: restart the game fully (a /reload won't load it).
- New: Mazen Mac'Nadir, caretaker of the Academy's library (see the main changelog for 0.80.0). New file `npcs/mazen.lua`: restart the game fully (a /reload won't load it).
- New: Archmage Malin in the Wizard's Sanctum (see the main changelog for 0.80.0). New file `npcs/malin.lua`: restart the game fully (a /reload won't load it).
- Prejudices (0.80.0): Orphan Matron Nightingale (warlocks), Sheldras Moontree (mages) and Lord Baurles K. Wishock (stonemasons' children). They let it show, you can push back or win them round, and it fades as they warm to you. No new files: a /reload is enough.
- New: Osric Strang of Limited Immunity in Old Town hates orcs after the First War and his years guarding an internment camp, and resents night elves. Night elves get their own branch; a [Persuade] gets the story of the orc who carved him a toy footman.
- New file: needs a full game restart, not /reload.
- People here notice your other characters: kin, look-alikes, faces they remember (needs core 0.80.0).
- New Forever-only characters (new files: full game restart): Abigail Lawson, Gilbert Gray and Idrieth Mossgrove at the harbor, Roy Lewells, Aendaril Brookshot and Fyrenz Vishonar.
- New people to talk to: Shoni the Shilent, Argos Nightwhisper, Mazen Mac'Nadir.
- New files: restart the game fully (a /reload won't load them).
- Origin nods (core 0.81.0): people here now notice the newer backgrounds from 0.70.0.

## 1.26.0 (2026-11-17)
- The Topper McNabb patch: Topper has a conversation of his own now, far deeper than before (see the main changelog for 0.78.0). New file `npcs/topper.lua`: restart the game fully (a /reload won't load it).
- New: Nikova Raskol in Old Town (see the main changelog for 0.78.0). New file: restart the game fully (a /reload won't load it).

## 1.25.0 (2026-11-17)
- Goblins talk like goblins: a voice pass on this pack's goblin speakers (see the main changelog for 0.76.0).

## 1.24.1 (2026-11-17)
- Writing pass on the characters added in 0.74.0: stock phrases ("fair enough", "truly", "worth more than") rewritten.

## 1.24.0 (2026-11-17)
- New people to talk to (see the main changelog for 0.74.0). New files: restart the game fully (a /reload won't load them).

## 1.23.0 (2026-11-17)
- Writing pass: stock phrases ("Fair enough", "I won't pretend", "truly", neat little morals) rewritten in each speaker's own voice, and more grit and humour in the everyday lines.

## 1.22.0 (2026-11-17)
- People here now and then recognise where you come from (your origin) and react to it.

## 1.21.0 (2026-11-17)
- The town's leading people greet you differently when you come back after a fortnight or more, notice how far you've come since they last saw you, and have heard what you did with their neighbours. Needs RPG Dialogue 0.67.0.

## 1.20.1 (2026-11-17)
- Bolvar, the Mage Quarter and the city's scholars now speak of Dalaran rebuilding, not hidden under its dome.

## 1.20.0 (2026-11-17)
- Some people here notice who you travel with: a greeting about your companions, a reply to bring them up, and a conversation with stances to take. Needs RPG Dialogue 0.59.0.

## 1.19.0 (2026-11-17)
- People with a stake in a nearby dungeon or raid react once you've cleared it: a greeting, a reply to bring it up, and a conversation about what it means to them, with stances to take. Needs RPG Dialogue 0.58.0.

## 1.18.0 (2026-11-17)
- Every class this place could plausibly meet now gets a greeting and its own conversation, including this server's Forsaken paladins and dwarf shamans where they'd be welcome. Some people here also notice when you've been thinning out the local trouble.

## 1.17.0 (2026-11-17)
- Lady Prestor and Baros Alexston are rivals: siding with one cools the other, and each greets you accordingly. No new files. Needs RPG Dialogue 0.55.0.

## 1.16.0 (2026-11-17)
- Druids are noticed: 105 people greet a druid as one, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.53.0.

## 1.15.0 (2026-11-17)
- Priests and paladins are noticed: about 110 people greet an Alliance priest or a paladin as one, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.51.0.

## 1.14.0 (2026-11-17)
- Warriors and hunters are noticed: about 203 new warrior and hunter conversations; people greet a warrior or hunter as one, with a question to ask and something to argue about, and hunters with a beast at their side hear it named. No new files. Needs RPG Dialogue 0.50.0.

## 1.13.0 (2026-11-17)
- Rogues, mages and warlocks get a greeting, a question and something to argue about with about 110 people across the city, from the Keep and the Cathedral to the Mage Quarter, Old Town and the Slaughtered Lamb.

## 1.12.0 (2026-11-16)
- New people with no quests, who had nothing to say until now: Lucan Cordell, Jessara Cordell, Catherine Leland, Lisbeth Schneider, Agustus Moulaine, Theresa Moulaine, Jenova Stoneshield, Billibub Cogspinner, Lilyssia Nightbreeze, Eldraeith, Georgio Bolero, Alexandra Bolero, Lawrence Schneider, Ardwyn Cailen, Charys Yserian, Wynne Larson, Gerik Koen, Maris Granger, Jillian Tanner, Alyssa Griffith, Kendor Kabonka, Olivia Burnside, Newton Burnside, John Burnside, Auctioneer Chilton, Auctioneer Fitch, Auctioneer Jaxon, Aldwin Laughlin, Woo Ping, Marda Weller, Keldric Boucher, Kyra Boucher.
- New files: exit the game fully and restart.

## 1.11.0 (2026-11-16)
- New people: Tannysa, Shaina Fuller, Frederick Stover and Felicia Gump.
- New files: exit the game fully and restart.

## 1.10.0 (2026-11-15)
- New: the warrior trainers Wu Shen, Ilsa Corbin and Ander Germaine in Old Town (new files: exit the game fully and restart).
- Bolvar, Katrana, Anduin, Benedictus, Shaw, Marcus Jonathan and Grayson Shadowbreaker answer warriors, rogues, mages, warlocks, hunters, shamans, dwarves, gnomes, night elves and the Skyborne; every trainer has a real conversation about their class; 21 more people answer someone who isn't a priest.

## 1.9.0 (2026-11-15)
- 43 new people: the Trade District (Renato Gallina, Elaine Trias, Thurman Mullby, Gunther Weller, Crier Goodman, Dungar Longdrink, Morgan Pestle, Harlan Bagley), Old Town (Harry Burlguard, Bartleby, Elly Langston, Stephen Ryback, Simon Tanner, Osborne the Night Man, Jasper Fel), the canals and the harbor (Suzetta Gallina, Ol' Emma, Rema Schneider, Arnold Leland, Morris Lawry, Billy, Manifest Clerk Philmor), Cathedral Square (Bishop Farthing, Brother Kristoff, Brother Sarno, Thomas the altar boy, Matron Nightingale, Shellene), the Keep (Bishop DeLavey, Count Ridgewell, Lord Wishock), the Mage Quarter (Maginor Dumas, Elsharin, Larimaine Purdue, Zardeth, Ursula Deline, Spackle Thornberry), the Dwarven District (the Deepforges, Lilliam Sparkspindle, Gelman Stonehand) and the Park (Sheldras Moontree, Shylamiir).
- Archbishop Benedictus: a priest or paladin back from Lordaeron can tell him what the Light said up there.
- Every person writes a first impression in your diary.
- New files: exit the game fully and restart.

## 1.8.0 (2026-11-15)
- Persuade, Intimidate and Deceive checks on the major people here, each with its own success and failure; lines and replies that depend on how warmly they regard you (disposition); a lead-in for "What do you know?".

## 1.7.0 (2026-11-15)
- Alignment now comes only from statements, never questions, and every reply that shifts alignment has an opposing one beside it. Taking one stance with someone closes the others for good.

## 1.6.0 (unreleased)
- Depth rewrite for the rest of the city: every conversation is now a hub with branches to explore, "Something else" brings you back, and each person has their own story and advice under Ask about.
- Mathias Shaw (SI:7): the Defias and the Stonemasons, the boy he trained, the missing King, Lady Prestor, the Lescovar affair from start to finish, rogue work, and a priest's confessions. Lord Grayson Shadowbreaker: the Silver Hand's oath, the charger and its barding, Chillwind Point, King Terenas's statuette (Forever's A Friend of the Family). General Marcus Jonathan: the statues in the Valley of Heroes and Turalyon, Solomon's letter, Westfall, and the Lordaeron insignia (Forever's Bloodied Insignia).
- Duthorian Rall (the test of valor, the Defias script, squires of the fallen Order), Baros Alexston (the riot that killed the queen, his farm and compass, the Lescovar chain), Gazin Tenorm (Heroes' Vigil, Henze), Stephanie Turner, Lil Timmy and his allergic dad.
- The Missing Diplomat and Lescovar chains run through Elling Trias, Dashel Stonefist, Lord Lescovar (who never admits anything) and Warden Thelwater (the riots, Targorr and Dextren Ward, the boy guard Mac). Grimand Elmore and Furen Longbeard (lightforge iron, Furen's notes, the Stormpikes), Milton Sheaf (Alterac's lost books, Brother Kristoff's metallurgy), Jennea, Gakin, Allison, Arthur, Renzik, Samuelson, Topper and Thomas Miller.
- Voice pass over every line in the pack (Bolvar, Prestor, Anduin and the Cathedral included): people talk in whole sentences now instead of clipped fragments, with the same facts and the same voices.
- For a human priest: replies and lines with Shaw, Grayson, Rall, Marcus, Gazin, Stephanie, Milton, Thelwater, Gakin, Jennea, Lescovar, Renzik, Allison, Elling, Arthur and Timmy; origins (Westfall farmhand, minor noble, Lordaeron refugee, paladin squire) where people would care.

## 1.5.0 (unreleased)
- The Cathedral of Light for a priest: Archbishop Benedictus deepened (and, on shadow, a bishop after the First War who went too far into it); High Priestess Laurena, Brother Joshua and Brother Benjamin, the priest trainers; Brother Crowley, the Scarlet Crusade's emissary downstairs.
- Bolvar, Anduin and Katrana: new branches (the Church, Lady Prestor, the refugees, letters), and "Something else" goes back instead of ending the conversation.
- Shadowform noticed by Benedictus, Laurena, Joshua, Benjamin, Crowley and Anduin.

## 1.4.0 (unreleased)
- Depth pass: repeat visits bring personal lines (habits, worries, running jokes), and some NPCs get night-time lines. Arthur the Faithful (the paladin trainer) and his story, Milton, Elling Trias, Grimand Elmore, Major Samuelson, Thomas Miller, Jennea, Lil Timmy.

## 1.3.0 (unreleased)
- General Marcus Jonathan in the Valley of Heroes (Solomon's letters reach him), Renzik "The Shiv" at SI:7, Major Samuelson in the throne room (Farren Orinelle's old mentor), Thomas Miller and his bread.

## 1.2.2 (unreleased)
- Milton Sheaf's opening can be heard about elsewhere (Loremaster Dibbs in Southshore).

## 1.2.1 (unreleased)
- Elling Trias's opening can be heard about elsewhere (Mikhail in Menethil Harbor asks after him).

## 1.2.0 (unreleased)
- Mathias Shaw (SI:7), Jennea Cannon, Gakin the Darkbinder, Innkeeper Allison.
- Lord Grayson Shadowbreaker and Arthur the Faithful in the Cathedral, Grimand Elmore and his student Furen Longbeard in the Dwarven District, Milton Sheaf in the Royal Library, Elling Trias at the cheese shop.
- Lord Gregor Lescovar in the library (he never admits anything), Dashel Stonefist in Old Town, Topper McNabb behind the Auction House, Warden Thelwater of the Stockade.

## 1.1.0 (unreleased)
- The Cathedral: Archbishop Benedictus and Gazin Tenorm. The Trade District: Stephanie Turner of the orphanage, and Lil Timmy and his kitten. Duthorian Rall reacts to your Tome of Divinity progress (Henze, Stephanie). Henze Faulk himself is in the Elwynn pack, by Heroes' Vigil.
- Bolvar, Lady Prestor and Benedictus react to Skyborne; Benedictus notices gnome priests; Rall points paladins to Daphne Stilwell for the Tome of Valor.

## 1.0.1 (unreleased)
- Bolvar answers Solomon's evidence (The True Masters).

## 1.0.0 (first release, unreleased)
- The Keep: Highlord Bolvar Fordragon, Lady Katrana Prestor and young King Anduin Wrynn. The Cathedral: Duthorian Rall, who tests new paladins with the Tome of Divinity. City Hall: Baros Alexston, the architect who didn't follow VanCleef.
