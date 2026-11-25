# RPG Dialogue: Elwynn Forest (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

## 1.47.1 (2026-11-25): Mending the Seams
- Bug pass: lines and replies that never showed (wrong condition keys or values, unremembered "heard" lines, duplicate line ids, NPCs sharing one key) fixed; stance replies phrased as statements.

## 1.47.0 (2026-11-25): Friends, Foes and Fools
- Major characters answer the new friendly topics and grievances in their own voice.

## 1.46.0 (2026-11-25): More to Say
- Thin conversations deepened: more topics, a longer thread, and a reply only some characters get.

## 1.45.0 (2026-11-24): Fewer Words, Same Voice
- NPC speeches over 60 words were trimmed so they fit the dialogue box; nothing they say was lost.

## 1.44.0 (2026-11-24): Old Grudges
- Major NPCs answer for a grudge you hold against them (or they against you), and let things slip when angry.
- Overlong speeches tightened.

## 1.43.0 (2026-11-23)
- Lore fixes; NPCs that had no dialogue now talk (new file npcs/unwritten.lua: full game restart).

## 1.42.0 (2026-11-23): Truths from the Old Books
- Lore fixes and deeper quest-givers (core 0.101.0).

## 1.41.0 (2026-11-19)
- Mage patch: mage trainers, portal trainers and wizards here have mage-only branches and more depth; clipped lines rewritten; doubled NPCs removed where found.

## 1.40.0 (2026-11-19)
- Human patch: human players get their own branches with human NPCs, and other races here say what they think of humans (some can be talked round with Persuade).

## 1.39.0 (2026-11-19)
- Josephine Carson and Tordrin Sternblade deepened for hunters.

## 1.38.0 (2026-11-19)
- Llane Beshere, Lyria Du Lac and Marshal Haggard rewritten for warriors.

## 1.37.0 (2026-11-19)
- Warlocks: NPCs react to the demon at your side, your Demon Armor, soul shards, soulstones and Fel Taint. Where warlockry is banned, warlocks speak in hints and people sense rather than name it; some NPCs openly dislike warlocks. Warlock trainers and quest-givers rewritten and deepened.

## 1.36.0 (2026-11-18)
- More named NPCs the earlier passes missed now have conversations, and thin ones have more to say. New files: restart the game fully.
- Major NPCs answer Admire, Taunt and Intimidate in their own voice, and turn you down in their own words when they won't talk.

## 1.35.0 (2026-11-18)
- Journal: the note about each person is one short sentence (12 words or fewer) and shows on the People page only, not in the diary.

## 1.34.0 (2026-11-18)
- "Where is...?" directions for Goldshire (`directions.lua`, new file: restart the game fully).
- Marshal McBride, Marshal Dughan and Innkeeper Farley have polite and blunt versions of your replies, and react to your tone. McBride's lines have narration.

## 1.33.0 (2026-11-18)
- NPCs notice what you have done: quests for their neighbours, notable kills, your deaths, rank and reputation.
- Writing pass: stance replies end on something concrete, fewer echoes and stock phrases.
- Druid greetings that assume a night elf or tauren no longer fire for other druid races.

## 1.32.0 (2026-11-18)
- Writing pass: repeated phrases cut and replaced with concrete detail.
- Clarity pass: answers answer the question, names are introduced, quest lines stand alone, fewer contradictions.
- Some NPCs of the opposite sex flirt with you, and remember how you answered (needs core 0.83.0).
- NPCs who had only a few lines now have full conversations.
- NPCs answer each stance reply before the talk moves on.

## 1.31.0 (2026-11-18)
- The Lion's Pride cellar (Darkheart, Crowe, Marcot) answers every stance before the talk moves on, including being reported to the law (needs core 0.82.0).

## 1.30.0 (2026-11-17)
- Named NPCs answer many more "Ask about" topics (3 to 6 each, more for leaders), mostly the new world topics added in World 1.36.0.
- Prejudices (0.80.0): Supervisor Raelen (Westfall farmhands). They let it show, you can push back or win them round, and it fades as they warm to you. No new files: a /reload is enough.
- People here notice your other characters: kin, look-alikes, faces they remember (needs core 0.80.0).
- New Forever-only characters (new files: full game restart): Blixie Fitzwink, Josephine Carson, Nordun Steadysight, Kelsey Fargo, Nancy Songflower, Riley Peltskinner, Tordrin Sternblade and Ormin Pelford.
- Origin nods (core 0.81.0): people here now notice the newer backgrounds from 0.70.0.

## 1.29.1 (2026-11-17)
- Fix: Sergeant De Vries's "you look done in" remark used a condition that doesn't exist and never showed. It now comes up when your gear is badly worn.

## 1.29.0 (2026-11-17)
- New people to talk to: Clara Charles, Daniel, Guard Roberts, Sergeant De Vries. New files: restart the game fully (a /reload won't load them).
- Writing pass: stock phrases ("Fair enough", "I won't pretend", "truly", neat little morals) rewritten in each speaker's own voice, and more grit and humour in the everyday lines.

## 1.28.0 (2026-11-17)
- Marshal Dughan has a great deal more to say: his past, his short-handed guards (a Persuade), McBride and Gryan, and whether farmers should arm themselves.

## 1.27.0 (2026-11-17)
- The town's leading people greet you differently when you come back after a fortnight or more, notice how far you've come since they last saw you, and have heard what you did with their neighbours. Needs RPG Dialogue 0.67.0.

## 1.26.0 (2026-11-17)
- Some people here notice who you travel with: a greeting about your companions, a reply to bring them up, and a conversation with stances to take. Needs RPG Dialogue 0.59.0.

## 1.25.0 (2026-11-17)
- People with a stake in a nearby dungeon or raid react once you've cleared it: a greeting, a reply to bring it up, and a conversation about what it means to them, with stances to take. Needs RPG Dialogue 0.58.0.

## 1.24.0 (2026-11-17)
- Every class this place could plausibly meet now gets a greeting and its own conversation, including this server's Forsaken paladins and dwarf shamans where they'd be welcome. Some people here also notice when you've been thinning out the local trouble.

## 1.23.0 (2026-11-17)
- Druids are noticed: 60 people greet a druid as one, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.53.0.

## 1.22.0 (2026-11-17)
- Priests and paladins are noticed: about 70 people greet an Alliance priest or a paladin as one, with a question to ask and something to argue about. No new files. Needs RPG Dialogue 0.51.0.

## 1.21.0 (2026-11-17)
- Warriors and hunters are noticed: about 135 new warrior and hunter conversations; people greet a warrior or hunter as one, with a question to ask and something to argue about, and hunters with a beast at their side hear it named. No new files. Needs RPG Dialogue 0.50.0.

## 1.20.0 (2026-11-17)
- Rogues, mages and warlocks get a greeting, a question and something to argue about with every named person in the forest, from Northshire to Goldshire and Eastvale.

## 1.19.0 (2026-11-16)
- Druids get their own greeting, question and short conversation with several people here.

## 1.18.0 (2026-11-16)
- New people with no quests, who had nothing to say until now: Dawn Brightstar, Kitta Firewind, Rallic Finn, Drake Lindgren, Terry Palin, Alchemist Mallory, Herbalist Pomeroy.
- New files: exit the game fully and restart.

## 1.17.0 (2026-11-16)
- New people: Northshire's smiths and Brother Paxton; Antonio Perelli on the roads.
- New files: exit the game fully and restart.

## 1.16.0 (2026-11-16)
- Goldshire: Tomas the cook, Kira Songshine the travelling baker, Bo and Matt, and the Maclures (Pa and Joshua).
- New files: exit the game fully and restart.

## 1.15.0 (2026-11-15)
- Dughan, Farley and McBride answer warriors, hunters, rogues, warlocks, mages, shamans and dwarves; every class trainer in Northshire and Goldshire has a real conversation about their class.

## 1.14.0 (2026-11-15)
- Every person here writes a first impression in your diary after you first talk (the journal's People page shows it too).

## 1.13.0 (2026-11-15)
- Persuade, Intimidate and Deceive checks on the major people here, each with its own success and failure; lines and replies that depend on how warmly they regard you (disposition); a lead-in for "What do you know?".

## 1.12.0 (2026-11-15)
- Alignment now comes only from statements, never questions, and every reply that shifts alignment has an opposing one beside it. Taking one stance with someone closes the others for good.

## 1.11.0 (2026-11-15)
- Brother Sammuel can tell when you've been arguing with the spirit healer.

## 1.10.0 (unreleased)
- Depth rewrite for Northshire, Goldshire's named NPCs and seven class trainers: every conversation is now a hub with branches to explore and come back from. Marshal McBride (the garrison, Echo Ridge, who drills the Defias, Dughan), Marshal Dughan (a hub of Elwynn's threats: the mines and the Collector, Westbrook and Westfall, the murlocs and the lost footmen; the Stonemasons' ring after Manhunt) and Innkeeper Farley (his family, his brother Frandis lost on a caravan to Lordaeron, the messenger who fled into the rain) are the deepest.
- Deputy Willem, Eagan Peltskinner (and his wife Helene's pelt orders), Brother Neals (the Abbey's wars, Medivh, the locked library wing), Milly Osworth, Remy, Melika, Brother Wilhelm, Llane Beshere, Brother Danil and Smith Argus (Verner's horseshoes) reach the standard too.
- Khelden, Jorik, Drusilla (Powers of the Void), Lyria, Zaldimar, Keryn and Remen each react to their own class and to others, send their students on, and have a branch or two for everyone else.
- Replies that depend on who you are: priests (a prayer for Farley's brother, words for Dughan's lost footmen, the Light and magic, faith with Neals), abbey novices, Westfall farmhands, minor nobles, Lordaeron refugees, dwarves, gnomes, night elves and Skyborne in Northshire, and veterans coming back at level 20 and up. Every NPC has their own story and advice under Ask about (Argus keeps only advice).
- Voice pass: these NPCs, all nine class trainers and the Eastvale stables now talk in whole sentences, the way people speak, instead of clipped fragments ("Count, don't charge." became "count them, recruit; don't charge them"). Remy still says things twice, inside the sentence.
- Fixes: Keryn's quest is "Seek out SI: 7"; Milly's vineyard was never said to be her mother's, nor Argus Elmore's student, and Faol rebuilt the Abbey rather than founding it.
- Depth rewrite, second half of Elwynn: Falkhaan, Maybell, Tommy Joe, Gramma, Bernice, Ma Stonefield, Billy, Gerard, Pestle, Sam Sarsaparilla, Guard Thomas, Marshal Haggard, Supervisor Raelen, Sara Timberlain, Theocritus, Deputy Rainer, Henze Faulk and Brother Sammuel are now hubs with three to ten branches each, and all fourteen Goldshire townsfolk have two or three branches of their own trade talk. All 32 meet the depth standard.
- Replies only some characters get: priests (blessings for the lovers, prayers for Thomas's footmen and Bernice's husband, Haggard's eyes, Raelen's loggers, Henze), the human origins (Westfall farmhand at Thomas, Rainer, Raelen, Ma, Gerard and Tommy Joe; noble at Gramma, Haggard and Theocritus; Abbey novice at Falkhaan and Sammuel; Lordaeron refugee at Sammuel), warriors, rogues, mages, warlocks, hunters, gnomes and dwarves where those NPCs would care; quest history and echoes between neighbours (Billy's slip reaches Bernice, Billy's gossip reaches Maybell, Raelen and Rainer answer each other, Adele and Helene).
- Classic facts corrected: Princess lives at the Brackwell patch and the Brackwells are gone; Billy did take the necklace; Bernice is a widow; Haggard took Dead-tooth Jack for Dughan; Helene is Eagan's wife; Tharynn trades from a wagon. Invented family histories for Sammuel, Michelle, Helene and Krighton were removed.
- Voice pass: every line in these files now reads as whole spoken sentences, with no stacked fragments (the new house style).

## 1.9.0 (unreleased)
- Priestess Anetta and Priestess Josetta deepened for priests, and both notice Shadowform.

## 1.8.0 (unreleased)
- Depth pass: repeat visits bring personal lines (habits, worries, running jokes), and some NPCs get night-time lines. Elwynn's nine class trainers, Marshal McBride's neighbours (Llane, Neals, Henze), the Stonefields, Sara, Danil, Gerard. Neighbours remark on each other in Goldshire (Corina and Kurran, Toddrick on Dobbins, Adele on Helene).

## 1.7.0 (unreleased)
- Depth pass: repeat visits now bring personal lines (habits, worries, opinions of the neighbours), night-time lines, and a question or two about the person themselves, not only their quests.
- Goldshire: Dobbins, Brog, Toddrick, Tharynn, Krighton, Corina and Kurran Steele, Erma, Michelle Belle, Crowe, Cylina, Lee Brown, Helene, Adele.
- Brother Sammuel tells how he came to the Abbey.

## 1.6.0 (unreleased)
- Sam Sarsaparilla, Forever's camping teacher on the road by Goldshire; Marshal McBride sends you to him (The Adventurer).

## 1.5.0 (unreleased)
- Nine class trainers in Northshire and Goldshire, each with their own voice (the class letters come from McBride).
- Goldshire's everyday people: Dobbins, the shops, Erma's stables, the cellar below the Lion's Pride, the trainers by Crystal Lake (fourteen in all).
- Eagan's and Farley's opening lines can be heard about elsewhere.

## 1.4.0 (unreleased)
- Henze Faulk by Heroes' Vigil (the paladin's Symbol of Life). Theocritus, Dughan, Farley and Remy react to Skyborne.

## 1.3.0 (unreleased)
- Deputy Rainer at Westbrook; the rest of the Stonefield farm (Auntie Bernice, Ma Stonefield) and Billy Maclure; Sara Timberlain at Eastvale; Gerard Tiller in the vines.
- Echoes: Rainer hears that Raelen's been asking after him; Verner's note reaches Argus; Haggard and Smitts remember the old case.

## 1.2.0 (unreleased)
- Brother Wilhelm (Goldshire's paladin trainer, the Tome of Divinity), Falkhaan Isenstrider, Maybell Maclure, Tommy Joe and Gramma Stonefield, and Eastvale: Guard Thomas, Marshal Haggard, Supervisor Raelen, Theocritus. Nine new voice bibles.
- Echoes: Remy hears that Thomas owes him a drink; William Pestle reads Gramma's note.

## 1.1.0 (unreleased)
- Melika Isenstrider, Assistant Innkeeper at the Lion's Pride Inn: her own voice bible and conversation (kitchen, inn news, Falkhaan, a Skyborne greeting), topic answers, noticing moments for druid forms and well-travelled guests. She has no gossip menu, so right-clicking her opens the box.

## 1.0.0 (first release, unreleased)
- Northshire Valley and Goldshire: 13 NPCs with voice bibles (McBride, Willem, Eagan, Milly, Neals, Sammuel, Llane, Danil, Dughan, Farley, Remy, Pestle, Argus), guard pools with barks, and Eagan's Echo Ridge errand.
