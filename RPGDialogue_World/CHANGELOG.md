# RPG Dialogue: World (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

## 1.42.0 (2026-11-19)
- The warlock patch: your own demon talks (`my_demons_imp_void.lua`, `my_demons_succ_hunter.lua`), people notice a warlock (`warlock_notice.lua`), and the warlock trainer follows your journey. New files: restart the game fully.

## 1.41.0 (2026-11-18)
- How people answer the new Joke action: everyone, each side, each home city and the common trades.

## 1.40.0 (2026-11-18)
- How people answer Admire, Taunt and Intimidate, by role, town and faction (`persuade.lua`, new file: restart the game fully).
- Gut-feeling notes (`gut.lua`, new file).
- Refusals for topics someone won't discuss yet, and the "Where is...?" topic.

## 1.39.0 (2026-11-18)
- Friendly demons (imps, voidwalkers, succubi, felhunters and more) have their own conversations (`demons.lua`, new file: restart the game fully).
- New "Ask about" topic: Aviana, with views to take.
- More letters at the mailbox: dungeon and raid clears, class letters, and more from people you have met.
- Shared guards, innkeepers and healers notice your deeds and deaths.
- NPCs notice what you have done: quests for their neighbours, notable kills, your deaths, rank and reputation.
- Writing pass: stance replies end on something concrete, fewer echoes and stock phrases.
- Druid greetings that assume a night elf or tauren no longer fire for other druid races.

## 1.38.0 (2026-11-18)
- Writing pass: repeated phrases cut and replaced with concrete detail.
- Clarity pass: answers answer the question, names are introduced, quest lines stand alone, fewer contradictions.
- Some NPCs of the opposite sex flirt with you, and remember how you answered (needs core 0.83.0).
- NPCs who had only a few lines now have full conversations.
- NPCs answer each stance reply before the talk moves on.

## 1.37.0 (2026-11-18)
- Speak your mind: views (things you can say back) for every "Ask about" topic, plus the "ask anyone" topics and a fallback set (`views.lua`, `views_1.lua` to `views_5.lua`). New files: restart the game fully (a /reload won't load them).
- Paladin trainers have a lot more to say:
- Ask what to practise and get a whole lesson: blessings, seals and judgement, auras, the undead, Redemption (level 12+) and the warhorse (level 30+).
- Ask what's left of the Silver Hand: Uther and his tomb, how Arthas fell, the Scarlet Crusade, the Argent Dawn, and (Forsaken) whether the living knights will have you, pointing to Bandarion Keep.
- The trainer asks why you took up the hammer: protection, justice, vengeance or bread, each a stance.
- Replies for each paladin origin (a squire who never took the oath can swear it now), plus branches for priests and for other classes curious about the Light.
- New greetings and notices (a female squire, late at night, fresh from the spirit healer, many deaths, Scarlet blood on your gauntlets) and answers on the Silver Hand, the Scarlets, the Argent Dawn, Stratholme, the Forsaken and the Tome of Divinity.

## 1.36.1 (2026-11-17)
- Pools answer the 52 new "Ask about" topics: role pools for everyone, town pools for local takes, neutral goblin answers in Booty Bay, Gadgetzan, Ratchet and Everlook. Adds the 52 new topics (the Scourge, the Forsaken, Thrall, Sylvanas, Onyxia, Booty Bay, Dalaran, the Holy Light and more).
- Twelve new Stories (journal: Stories page): the Echo Isles, Zul'Gurub, the Hinterlands, Felwood, the Winterfall, Teldrassil and Darkshore, Gnomeregan, the Dark Portal, the Blackrock over Redridge, Gadgetzan's water, Desolace's clans and Feralas. New files: restart the game fully (a /reload won't load them).
- Spoogledorf rewritten as the old Gnomeregan gnome he is in Stormwind.
- About 90 new innkeeper rumors across both continents, in `rumors/eastern.lua` and `rumors/kalimdor_more.lua`. **New files: restart the game fully.**
- Politics: new branches for the Alliance and Horde guard trees and the general vendor tree, with stance replies that record opinions (`regency`, `peace`, `refugees`, `gilneas`, `war_taxes`, `forsaken_in_horde`, `warsong`, `old_ways`, `goblin_trade`), reactions to each stance, gossip echoes and contradiction lines. New political lines and gossip echoes for Alliance and Horde townsfolk. No new files.
- Guards, townsfolk and innkeepers can notice your other characters (needs core 0.80.0).
- New Forever-only characters (new files: full game restart): The Darkspear Emissary in every Horde capital (Darkspear Islands battleground), and Gabbi Goodwhistle (goblin peddler; may only exist from the beta event).
- Origin nods (core 0.81.0): people here now notice the newer backgrounds from 0.70.0.

## 1.35.0 (2026-11-17)
- New: conversations for the battleground emissaries in the capitals (Silverwing, Warsong, League of Arathor, Defilers, Stormpike, Frostwolf, the Alliance Brigadier General and the Horde Warbringer), in `emissaries/`. New topic: Ashenvale. **New files: restart the game fully.**
- Sentinel guards (Darnassus and the night elf towns of Kalimdor) get their own conversation tree instead of the human watch's.
- Eleven new Stories (journal: Stories page) across Kalimdor and the Eastern Kingdoms, for both factions. New files: restart the game fully (a /reload won't load them).

## 1.34.0 (2026-11-17)
- Goblins talk like goblins: a voice pass on this pack's goblin speakers (see the main changelog for 0.76.0).

## 1.33.0 (2026-11-17)
- Writing pass: stock phrases ("Fair enough", "I won't pretend", "truly", neat little morals) rewritten in each speaker's own voice, and more grit and humour in the everyday lines.

## 1.32.0 (2026-11-17)
- Guards, stable masters and vendors (food, drink, reagents and the rest) now have whole conversations instead of one reply; goblin bruisers in Ratchet get their own, and Ratchet counts as a town. Townsfolk recognise you when your origin is from their town.
- Needs RPG Dialogue 0.71.0.

## 1.31.0 (2026-11-17)
- 72 new origins: at least four general backgrounds per race and two per race and class, Skyborne included. Needs RPG Dialogue 0.69.0 or later.

## 1.30.0 (2026-11-17)
- Townsfolk, guards, innkeepers, children, trainers and the other trades notice when you come back to their town after a week or more away, and pass on what the town has been saying about you. Needs RPG Dialogue 0.67.0.

## 1.29.1 (2026-11-17)
- The spirit healer no longer repeats a full greeting when you come back to the questions. Townsfolk from near Dalaran know its shield is down.

## 1.29.0 (2026-11-17)
- Diary entries for your first steps on Mount Hyjal, in Shen'dralas and in Dalaran. Zephras Isle's villages (Thendal, Shen'dar, Falaath, the Shrine of Akir) now count as the isle for town standing.

## 1.28.0 (2026-11-17)
- Guards, townsfolk and innkeepers notice who you travel with: a full company, a companion of another race, a pair on the road, a party with no healer. Needs RPG Dialogue 0.59.0.

## 1.27.0 (2026-11-17)
- Guards, townsfolk and innkeepers notice the dungeons and raids you've cleared (the Stockade, Ragefire, the Scarlet Monastery, Uldaman, Zul'Farrak, Blackrock Depths, the Plaguelands' halls, Molten Core and more). An innkeeper line that promised a free drink now doesn't. Needs RPG Dialogue 0.58.0.

## 1.26.0 (2026-11-17)
- Guards, townsfolk and innkeepers notice your honor rank, dishonorable kills, the creatures you've been killing, a dragon's head in your bags, and your guild. New night and dawn lines for innkeepers and townsfolk. Needs core 0.54.0.

## 1.25.0 (2026-11-16)
- Revantusk Village gets its own town standing.
- New files: exit the game fully and restart.

## 1.24.0 (2026-11-15)
- Every class trainer is now a full conversation, like the priest trainers: what to practise, one question where you take a side (mercy or judgement, need or sport, loyalty or coin, asking or commanding the elements...), a personal question, and the race-and-class pairings they'd notice.
- Guards, innkeepers, children, stable masters, blacksmiths and flight masters notice every class and race; all 48 town citizen pools notice classes and races; 55 new class-specific answers to "A little advice".
- 39 new origins: orcs, trolls, tauren and the Forsaken get their own lists for the first time, and every Alliance race and the Skyborne gain class origins (new files: exit the game fully and restart).

## 1.23.0 (2026-11-15)
- Citizens: anyone in the streets can now be talked to. 51 pools: every capital (Stormwind by district) and 42 towns.
- Arrivals: a diary entry the first time you reach each of 48 zones, with faction variants.
- Stories: titles and journal summaries for every throughline, and three new ones for the 45-60 road (the plague cauldrons, the Dawn's letters, the Light in the Plaguelands).
- Towns and topics for the Blasted Lands, Azshara and Silithus.
- New files: exit the game fully and restart.

## 1.22.0 (2026-11-15)
- "What do you know?" lead-ins for every role pool, the generic fallback and the spirit healer; warm and cold versions of role answers by disposition.
- The spirit healer's checks lose the written-in tags (the UI adds them now).

## 1.21.0 (2026-11-15)
- Alignment now comes only from statements, never questions, and every reply that shifts alignment has an opposing one beside it. Taking one stance with someone closes the others for good.

## 1.20.0 (2026-11-15)
- Burning Steppes: towns Morgan's Vigil (related to Lakeshire) and Flame Crest; topics the black dragonflight, Blackrock Spire, Blackrock Depths, Marshal Windsor, the ruins of Thaurissan, the Firegut ogres; claim `windsor_alive` (Ragged John; true, settled by Marshal Windsor); Marshal Maxwell carries a beat of Solomon's letters (`b8_maxwell`).

## 1.19.0 (2026-11-15)
- **The spirit healer, rewritten.** A real argument now: does coming back cheapen death, is it mercy or a cage, is the one who wakes the one who died, and what happens if you refuse to go back (you may; the healer does not make it easy). The healer argues honestly, turns questions on you, and can concede.
- Mysteries that stay open (claims `spirithealer_other_hand`, `spirithealer_was_mortal`, `spirithealer_the_door`): pages at the back of your file in another hand, dated ahead; a healer who half-remembers being alive; a door past the mist nobody opens. Two Persuade checks and a Deceive the healer always sees through.
- **The one with the lantern:** a ghost who refused to go back, waiting for someone. One chapter per visit, six in all, and you can promise to watch the road for them.
- Lines for where you fell: the Plaguelands (the missing the Scourge takes first), Duskwood, Felwood, Tirisfal, Desolace, the Blasted Lands, Silithus, Winterspring.
- **Stay with me a moment** (a new hub): the healer asks *you* questions (nine of them: fate, regret, the things you kill, who would look for you, forgiveness, who is watching, what you fear, whether a forgotten deed still counts, what the dead are owed), remembers your answers as opinions, notices when you change your mind, answers each question itself, and brings your answers back on a later visit. Twelve tales of the dead in four kinds (came back wrong, refused to go back, couldn't be saved, made the healer laugh), each with its own follow-up. Four debates in rounds (endless life, fate, suffering, debts to the dead) that you can win; winning puts you in the healer's own file, whose first page is in the same hand that writes ahead in yours.
- Death milestones from 3 to 300, each said once.
- The healer moved to its own file, `spirithealer.lua`.
- The healer remembers the argument: the next visit picks it up once (the cage, the ones who stay, the other hand, their own face, whether you are the same one who left, the promise to say your name).
- New death lines (wild creatures, unknown causes), race and class lines for everyone, what became of your people's dead, a send-off before you return, two noticing moments, journal entries, Scarlet Crusade and Argent Dawn topics. Voice bible in `bibles/spirithealer.md`.
- Voice pass for the healer (whole sentences, as everywhere else since 1.18.0).
- Western Plaguelands: towns Chillwind Camp and the Bulwark; topics the plague cauldrons, Andorhal, the Scholomance; claim `barov_heir` (disputed, left open).

## 1.18.0 (unreleased)
- Voice pass: the shared pools (children, guards, innkeepers, trainers, the spirit healer and the rest), the "ask anyone" answers, the generic lines, the inn rumors and the throughline beats now talk in whole sentences instead of clipped fragments; what they say is unchanged.

## 1.17.0 (unreleased)
- Throughline **The Scarlet Path** (`scarlet_path`): Brother Crowley's warning, Brother Anton's pride in Raleigh, Raleigh's truth, Tyrosus's welcome. Topics: The Scarlet Monastery, Raleigh the Devout.

## 1.16.0 (unreleased)
- A priest in Shadowform is noticed: priest trainers ask them to step out of it for the lesson (and, asked, say what the shadow costs), children think it's a ghost, guards on the road and in Stormwind get a fright.
- The shared priest trainer conversation: a branch for priests, Light or shadow, practise, and "Does the shadow frighten you?" in Shadowform.
- Origin: Novice of Northshire Abbey (human priest).
- Ask about: guards' advice by faction is part of the guard pool (it was being outranked).

## 1.15.0 (unreleased)
- Guards' advice by faction now shares the guard pool, so it varies (the faction pools were outranking every general line).
- Throughline `farholde_lost` (The lost of Farholde): Gray, Ashe, Cady and Demar on Fern Crimsonleaf; two endings chosen at Gray's table; her fate stays open.

## 1.14.0 (unreleased)
- "Ask anyone" topics: Their story, Their work, A little advice, Latest rumors (`standard = true`), and `asks.lua`: what every role says about its work, a little advice, and (unnamed people) their story, in question-only pools; generic deflections for anyone.
- Topic `keywords` for the short forms people say (Kurzen, Bloodsail, Dragonmaw, Gnomeregan...), and `linkName = false` for The Collector.
- The Riverglades: towns Farholde Keep and Powderfuse Port; topics the Brotherhood of the Horse, the Siege of Farholde, Sunnyglade, the Twilight's Hammer, Krol'dok, Fern Crimsonleaf, Powderfuse Port; open claims `stormwind_abandoned_riverglades`, `fern_lives`, `chogall_in_riverglades`, `melbin_built_port`; the book A Wartorn Land and The Brotherhood and the Farholde memorials; Riverglades rumors, with word of it in Redridge, Tanaris and the Swamp of Sorrows.

## 1.13.0 (unreleased)
- Towns: Bloodvenom Post, Thorium Point, Light's Hope Chapel.
- Claim `kalaran_father` (Kalaran Windblade's story; false, settled by Squire Maltrake).

## 1.12.0 (unreleased)
- Towns: Stonard, Refuge Pointe, Hammerfall, Aerie Peak, Kargath, Marshal's Refuge, Everlook.
- Topics: Uldaman, the Argent Dawn, the Venture Company.

## 1.11.0 (unreleased)
- Towns: Gadgetzan, Steamwheedle Port, Theramore, Brackenwall Village, Feathermoon Stronghold, Camp Mojache.

## 1.10.0 (unreleased)
- Towns: Camp Taurajo, Nijel's Point, Ghost Walker Post.

## 1.9.0 (unreleased)
- Towns: Deathknell, Brill, Shadowglen, Dolanaar, Coldridge Valley, Kharanos and the Sepulcher.
- Topics: the Scarlet Crusade; camping (Forever).

## 1.8.0 (unreleased)
- Towns: Booty Bay, Grom'gol Base Camp, the Rebel Camp, Freewind Post, the Mirage Raceway, the Valley of Trials, Razor Hill, Sen'jin Village, Camp Narache, Bloodhoof Village and Camp Gev'rek.
- Topics: the Steamwheedle Cartel, the Bloodsail Buccaneers, Colonel Kurzen's expedition, Yenniku, the Grimtotem clan, the Mirage Raceway, the Burning Blade, the Echo Isles.

## 1.7.0 (unreleased)
- Towns: Sun Rock Retreat and Stonetalon Peak.
- A new thread for druids, `the_circle`: Dendrite tells you the Keeper asked after you; Remulos asks you to watch for the land's sickness; Tonga (the Barrens) or Terenthis (Darkshore) shows it to you; Hamuul or Mathrengyl sends you back; Remulos hears you out.

## 1.6.0 (unreleased)
- Towns: Auberdine and Thelsamar.

## 1.5.0 (unreleased)
- Towns: the Crossroads, Astranaar, Maestra's Post, Splintertree Post, Southshore, Tarren Mill. Topic: the Wailing Caverns. Inn talk across Kalimdor (Darnassus, Thunder Bluff, the Crossroads, Ashenvale, and word of Moonglade).

## 1.4.0 (unreleased)
- Towns: Menethil Harbor and Nighthaven. Topics: the Dragonmaw clan, the Cenarion Circle. Rumors for the Wetlands' inns, and word of the Wetlands in Ironforge, Dun Morogh, Stormwind and Redridge.

## 1.3.0 (unreleased)
- Topics: the Carevins, Morgan Ladimore, the fall of Gnomeregan, the Dark Iron dwarves, the Explorers' League.

## 1.2.0 (unreleased)
- Towns for Lakeshire, Darkshire and Raven Hill; topics for the Blackrock, the Everstill Bridge, Redridge's gnolls, the Night Watch, the worgen and Stalvan; rumors for Redridge and Duskwood inns and word of both elsewhere.
- Throughlines: `solomons_letters` (Solomon, Gryan, Prestor, Bolvar, Daniels, Ello) and `stalvan` (Smitts, Haggard, Farley, Eva, Althea); Ello joins `westfall_left`.

## 1.1.0 (unreleased)
- Role pools for stable masters, bankers, auctioneers, blacksmiths, kinds of vendor, every class trainer (by title), Horde flight masters, faction guards, and the guards of Stormwind, Ironforge, Darnassus, Orgrimmar, Thunder Bluff and the Undercity.
- Towns: Eastvale, Sentinel Hill, the farms of Westfall, Zephras Isle and the five other capitals.
- Topics for Elwynn's east, Westfall and Zephras Isle; claims about Westfall's abandonment, the gnolls, and Lady Prestor's counsel; Westfall rumors for innkeepers.
- The `westfall_left` throughline: Dughan, Thomas, Danuvin, Salma, Bolvar and Gryan.

## 1.0.0 (first release, unreleased)
- Generic lines and role pools: guards, innkeepers, vendors, trainers, flight masters, children, spirit healers (one shared conversation tree, "your file").
- Towns: Northshire, Goldshire, Stormwind. Topics, claims, the `elwynn_gold` throughline, books, innkeeper rumors for Elwynn.
- Draft origins for human, dwarf, gnome, night elf and Skyborne characters (waiting for approval).
