-- "Ask about..." topics. NPC files hold their own answers.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Topic { id = "defias", name = "The Defias", category = "people", learned = "talk about the thieves in the valley" }
P:Topic { id = "kobolds", keywords = { "kobold" }, name = "Kobolds", category = "threats", learned = "kobold quests in Northshire and Goldshire" }
P:Topic { id = "echo_ridge", keywords = { "Echo Ridge" }, name = "Echo Ridge Mine", category = "places", learned = "Marshal McBride's quests" }
P:Topic { id = "hogger", name = "Hogger", category = "threats", learned = "the wanted poster, or anyone in Goldshire" }
P:Topic { id = "murlocs_east", name = "Murlocs in eastern Elwynn", category = "rumors", learned = "Remy's gossip, or Farley's" }
P:Topic { id = "the_collector", linkName = false, name = "The Collector", category = "rumors", learned = "the gold pickup schedule, or rumors at the inn" }
P:Topic { id = "gold_dust", name = "Gold dust", category = "trade", learned = "Remy \"Two Times\"" }
P:Topic { id = "northshire_abbey", keywords = { "Northshire" }, name = "Northshire Abbey", category = "places", learned = "being there" }
P:Topic { id = "lions_pride", keywords = { "Lion's Pride" }, name = "The Lion's Pride Inn", category = "places", learned = "being there" }
P:Topic { id = "maybell_tommy", keywords = { "Maybell", "Tommy Joe" }, name = "Maybell and Tommy Joe", category = "people", learned = "William Pestle, or the farms" }
P:Topic { id = "seven_kingdoms", name = "The Seven Kingdoms", category = "lore", learned = "the book of the same name" }
P:Topic { id = "tome_of_divinity", name = "The Tome of Divinity", category = "lore", learned = "Brother Wilhelm in Goldshire" }
P:Topic { id = "lost_footmen", keywords = { "Rolf", "Malakai" }, name = "Rolf and Malakai", category = "people", learned = "Guard Thomas at the Eastvale bridge" }
P:Topic { id = "eastvale", name = "Eastvale", category = "places", learned = "Guard Thomas, or being there" }
P:Topic { id = "morganth", name = "Morganth", category = "threats", learned = "Theocritus at the Tower of Azora" }
P:Topic { id = "westfall", name = "Westfall", category = "places", learned = "Gryan Stoutmantle, or anyone sent west" }
P:Topic { id = "people_militia", name = "The People's Militia", category = "people", learned = "Sentinel Hill" }
P:Topic { id = "harvest_watchers", keywords = { "Harvest Watcher" }, name = "Harvest watchers", category = "threats", learned = "Farmer Saldean" }
P:Topic { id = "riverpaw", keywords = { "Riverpaw" }, name = "The Riverpaw gnolls", category = "threats", learned = "Captain Danuvin" }
P:Topic { id = "moonbrook", name = "Moonbrook", category = "places", learned = "Scout Galiaan's map" }
P:Topic { id = "old_blanchy", name = "Old Blanchy", category = "people", learned = "Verna Furlbrow" }
P:Topic { id = "al_aketh", name = "The Al'Aketh", category = "threats", learned = "Zephras Isle" }
P:Topic { id = "two_orders", keywords = { "Windshapers", "High Order" }, name = "The High Order and the Windshapers", category = "people", learned = "Zephras Isle" }
P:Topic { id = "shal_nan", name = "The Shal'nan", category = "lore", learned = "the High Elder" }
P:Topic { id = "windstones", keywords = { "windstone" }, name = "Windstones", category = "trade", learned = "Zephras Isle" }
P:Topic { id = "blackrock", keywords = { "Blackrock" }, name = "The Blackrock orcs", category = "threats", learned = "Lakeshire" }
P:Topic { id = "everstill_bridge", name = "The Everstill Bridge", category = "places", learned = "Foreman Oslow" }
P:Topic { id = "redridge_gnolls", name = "Redridge's gnolls", category = "threats", learned = "Verner Osgood" }
P:Topic { id = "stonewatch_keep", keywords = { "Stonewatch" }, name = "Stonewatch Keep", category = "places", learned = "Magistrate Solomon or Marshal Marris in Lakeshire" }
P:Topic { id = "keeshan", keywords = { "Keeshan" }, name = "Corporal Keeshan", category = "people", learned = "the notice outside the Lakeshire Inn, or Marshal Marris" }
P:Topic { id = "night_watch", name = "The Night Watch", category = "people", learned = "Darkshire" }
P:Topic { id = "worgen", keywords = { "worgen" }, name = "The worgen of Duskwood", category = "threats", learned = "Darkshire, or the woods" }
P:Topic { id = "stalvan", keywords = { "Stalvan" }, name = "Stalvan Mistmantle", category = "rumors", learned = "Tavernkeep Smitts, or the Legend of Stalvan" }
P:Topic { id = "carevins", name = "The Carevins", category = "people", learned = "Jonathan Carevin or Calor in Darkshire" }
P:Topic { id = "ladimore", keywords = { "Ladimore" }, name = "Morgan Ladimore", category = "rumors", learned = "Sirra Von'Indi, the historian of Darkshire" }
P:Topic { id = "gnomeregan", keywords = { "Gnomeregan" }, name = "The fall of Gnomeregan", category = "places", learned = "High Tinker Mekkatorque in Tinker Town" }
P:Topic { id = "dark_iron", keywords = { "Dark Iron" }, name = "The Dark Iron dwarves", category = "threats", learned = "Royal Historian Archesonus in the High Seat" }
P:Topic { id = "explorers_league", name = "The Explorers' League", category = "people", learned = "the Hall of Explorers in Ironforge" }
P:Topic { id = "dragonmaw", keywords = { "Dragonmaw" }, name = "The Dragonmaw clan", category = "threats", learned = "Captain Stoutfist in Menethil Harbor" }
P:Topic { id = "cenarion_circle", keywords = { "Cenarion" }, name = "The Cenarion Circle", category = "people", learned = "Nighthaven, in Moonglade" }
P:Topic { id = "wailing_caverns", name = "The Wailing Caverns", category = "places", learned = "Tonga Runetotem at the Crossroads" }
P:Topic { id = "steamwheedle", keywords = { "Steamwheedle" }, name = "The Steamwheedle Cartel", category = "people", learned = "Baron Revilgaz in Booty Bay" }
P:Topic { id = "bloodsail", keywords = { "Bloodsail" }, name = "The Bloodsail Buccaneers", category = "threats", learned = "Fleet Master Seahorn in Booty Bay" }
P:Topic { id = "kurzen", keywords = { "Kurzen" }, name = "Colonel Kurzen's expedition", category = "rumors", learned = "Lieutenant Doren at the Rebel Camp" }
P:Topic { id = "grimtotem", keywords = { "Grimtotem" }, name = "The Grimtotem clan", category = "threats", learned = "Cliffwatcher Longhorn at Freewind Post" }
P:Topic { id = "mirage_raceway", keywords = { "Raceway" }, name = "The Mirage Raceway", category = "places", learned = "Pozzik or Fizzle on the Shimmering Flats" }
P:Topic { id = "burning_blade", name = "The Burning Blade", category = "threats", learned = "Zureetha Fargaze or Orgnil Soulscar in Durotar" }
P:Topic { id = "echo_isles", name = "The Echo Isles", category = "places", learned = "Master Gadrin in Sen'jin Village" }
P:Topic { id = "scarlet_crusade", name = "The Scarlet Crusade", category = "threats", learned = "Executor Arren or Executor Zygand in Tirisfal" }
P:Topic { id = "scarlet_monastery", keywords = { "Scarlet Monastery", "Monastery" }, name = "The Scarlet Monastery", category = "places", learned = "Raleigh the Devout in Southshore" }
P:Topic { id = "raleigh", keywords = { "Raleigh" }, name = "Raleigh the Devout", category = "people", learned = "Brother Anton at Nijel's Point" }
P:Topic { id = "uldaman", name = "Uldaman", category = "places", learned = "Prospector Ryedol in the Badlands" }
P:Topic { id = "argent_dawn", name = "The Argent Dawn", category = "people", learned = "Gregor Greystone in Everlook" }
P:Topic { id = "venture_company", keywords = { "Venture Company" }, name = "The Venture Company", category = "threats", learned = "Mull Thunderhorn in Bloodhoof Village" }
P:Topic { id = "camping", name = "Camping", category = "trade", learned = "an adventurer camped on the road" }
P:Topic { id = "yenniku", name = "Yenniku, son of Vol'jin", category = "people", learned = "Nimboya at Grom'gol" }

-- The Riverglades (Forever)
P:Topic { id = "brotherhood_horse", name = "The Brotherhood of the Horse", category = "people", learned = "Demar Brant at Farholde Keep" }
P:Topic { id = "siege_of_farholde", name = "The Siege of Farholde", category = "lore", learned = "Ashe Amberhall, or the memorials at Farholde Keep" }
P:Topic { id = "sunnyglade", name = "Sunnyglade", category = "places", learned = "anyone at Farholde Keep" }
P:Topic { id = "twilights_hammer", name = "The Twilight's Hammer", category = "threats", learned = "Demar Brant or Sergeant Riftan in the Riverglades" }
P:Topic { id = "krol_dok", name = "Krol'dok", category = "threats", learned = "Demar Brant at Farholde Keep" }
P:Topic { id = "fern_crimsonleaf", keywords = { "Fern" }, name = "Fern Crimsonleaf", category = "people", learned = "her memorial at Farholde Keep, or Gray Dawnbright in Powderfuse Port" }
P:Topic { id = "powderfuse_port", keywords = { "Powderfuse" }, name = "Powderfuse Port", category = "places", learned = "the boat from Steamwheedle Port, or Melbin Powderfuse" }

-- "Ask anyone": always known, answered by everyone (their own take, then their role's,
-- then anyone's). Never linked in text, never archived.
P:Topic { id = "background", name = "Their story", category = "anyone", standard = true, order = 1, learned = "anyone" }
P:Topic { id = "trade", name = "Their work", category = "anyone", standard = true, order = 2, learned = "anyone" }
P:Topic { id = "advice", name = "A little advice", category = "anyone", standard = true, order = 3, learned = "anyone" }
P:Topic { id = "rumors", name = "Latest rumors", category = "anyone", standard = true, order = 4, learned = "anyone" }

-- Stormwind (Stormwind pack 1.6.0)
P:Topic { id = "si7", keywords = { "SI:7" }, name = "SI:7", category = "people", learned = "Mathias Shaw, Renzik or Elling Trias in Stormwind" }
P:Topic { id = "stonemasons", keywords = { "Stonemasons" }, name = "The Stonemasons' Guild", category = "people", learned = "Baros Alexston, Mathias Shaw or Arthur the Faithful" }
P:Topic { id = "the_stockade", keywords = { "Stockade" }, name = "The Stockade", category = "places", learned = "Warden Thelwater, or Baros Alexston's Bazil Thredd" }
P:Topic { id = "valley_of_heroes", keywords = { "Valley of Heroes" }, name = "The Valley of Heroes", category = "places", learned = "General Marcus Jonathan" }

-- Elwynn (Elwynn pack 1.10.0)
P:Topic { id = "heroes_vigil", keywords = { "Heroes' Vigil", "Stone of Remembrance" }, name = "Heroes' Vigil", category = "places", learned = "Henze Faulk, on Stone Cairn Lake" }
P:Topic { id = "brotherhood_northshire", keywords = { "Brotherhood of Northshire" }, name = "The Brotherhood of Northshire", category = "people", learned = "Brother Sammuel at Northshire Abbey" }

-- Duskwood (Duskwood pack 1.3.0)
P:Topic { id = "morbent_fel", keywords = { "Morbent" }, name = "Morbent Fel", category = "threats", learned = "Sven Yorgen, or the council in Darkshire" }
P:Topic { id = "embalmer", keywords = { "Embalmer" }, name = "The Embalmer", category = "rumors", learned = "Lord Ello Ebonlocke, after the hermit's note" }
P:Topic { id = "dark_riders", keywords = { "Dark Riders" }, name = "The Dark Riders", category = "threats", learned = "Sven Yorgen or Jitters" }
P:Topic { id = "raven_hill", keywords = { "Raven Hill" }, name = "Raven Hill", category = "places", learned = "Darkshire, or the road west" }

-- Westfall (Westfall pack 1.4.0)
P:Topic { id = "deadmines", keywords = { "Deadmines" }, name = "The Deadmines", category = "places", learned = "Sentinel Hill, once the hideout is found" }

-- Wetlands and Hillsbrad (packs 1.2.0)
P:Topic { id = "grim_batol", keywords = { "Grim Batol" }, name = "Grim Batol", category = "places", learned = "Captain Stoutfist in Menethil Harbor" }
P:Topic { id = "third_fleet", keywords = { "Third Fleet", "Wave Mistress" }, name = "The Third Fleet", category = "lore", learned = "First Mate Fitzsimmons in Menethil Harbor" }
P:Topic { id = "thandol_span", keywords = { "Thandol Span" }, name = "The Thandol Span", category = "places", learned = "Harlo Barnaby in Menethil Harbor" }
P:Topic { id = "syndicate", keywords = { "Syndicate" }, name = "The Syndicate", category = "threats", learned = "Magistrate Maleb or Marshal Redpath in Southshore" }
P:Topic { id = "alterac", keywords = { "Alterac" }, name = "The ruins of Alterac", category = "places", learned = "Loremaster Dibbs or Marshal Redpath in Southshore" }
P:Topic { id = "silver_hand", keywords = { "Silver Hand" }, name = "The Knights of the Silver Hand", category = "people", learned = "Brewmeister Bilger in Southshore" }
P:Topic { id = "new_plague", keywords = { "new plague" }, name = "The new plague", category = "rumors", learned = "Apothecary Lydon or High Executor Darthalia in Tarren Mill" }
