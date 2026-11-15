# RPG Dialogue: World (pack changelog)

The pack's own version is `version` in `pack.lua`; bump both together.

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
