-- "Ask about..." topics. NPC files hold their own answers.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Topic { id = "defias", name = "The Defias", category = "people", learned = "talk about the thieves in the valley", keywords = "Defias" }
P:Topic { id = "kobolds", name = "Kobolds", category = "threats", learned = "kobold quests in Northshire and Goldshire", keywords = { "kobolds", "kobold" } }
P:Topic { id = "echo_ridge", name = "Echo Ridge Mine", category = "places", learned = "Marshal McBride's quests", keywords = "Echo Ridge" }
P:Topic { id = "hogger", name = "Hogger", category = "threats", learned = "the wanted poster, or anyone in Goldshire", keywords = "Hogger" }
P:Topic { id = "murlocs_east", name = "Murlocs in eastern Elwynn", category = "rumors", learned = "Remy's gossip, or Farley's", link = false }
P:Topic { id = "the_collector", name = "The Collector", category = "rumors", learned = "the gold pickup schedule, or rumors at the inn", keywords = "the Collector" }
P:Topic { id = "gold_dust", name = "Gold dust", category = "trade", learned = "Remy \"Two Times\"", keywords = "gold dust" }
P:Topic { id = "northshire_abbey", name = "Northshire Abbey", category = "places", learned = "being there", keywords = { "Northshire Abbey", "Northshire" } }
P:Topic { id = "lions_pride", name = "The Lion's Pride Inn", category = "places", learned = "being there", keywords = "Lion's Pride" }
P:Topic { id = "maybell_tommy", name = "Maybell and Tommy Joe", category = "people", learned = "William Pestle, or the farms", keywords = { "Maybell", "Tommy Joe" } }
P:Topic { id = "seven_kingdoms", name = "The Seven Kingdoms", category = "lore", learned = "the book of the same name", keywords = "Seven Kingdoms" }
P:Topic { id = "tome_of_divinity", name = "The Tome of Divinity", category = "lore", learned = "Brother Wilhelm in Goldshire", keywords = "Tome of Divinity" }
P:Topic { id = "lost_footmen", name = "Rolf and Malakai", category = "people", learned = "Guard Thomas at the Eastvale bridge", keywords = { "Rolf", "Malakai" } }
P:Topic { id = "eastvale", name = "Eastvale", category = "places", learned = "Guard Thomas, or being there", keywords = "Eastvale" }
P:Topic { id = "morganth", name = "Morganth", category = "threats", learned = "Theocritus at the Tower of Azora", keywords = "Morganth" }
P:Topic { id = "westfall", name = "Westfall", category = "places", learned = "Gryan Stoutmantle, or anyone sent west", keywords = "Westfall" }
P:Topic { id = "people_militia", name = "The People's Militia", category = "people", learned = "Sentinel Hill", keywords = "People's Militia" }
P:Topic { id = "harvest_watchers", name = "Harvest watchers", category = "threats", learned = "Farmer Saldean", keywords = { "harvest watchers", "harvest watcher" } }
P:Topic { id = "riverpaw", name = "The Riverpaw gnolls", category = "threats", learned = "Captain Danuvin", keywords = "Riverpaw" }
P:Topic { id = "moonbrook", name = "Moonbrook", category = "places", learned = "Scout Galiaan's map", keywords = "Moonbrook" }
P:Topic { id = "old_blanchy", name = "Old Blanchy", category = "people", learned = "Verna Furlbrow", keywords = "Blanchy" }
P:Topic { id = "al_aketh", name = "The Al'Aketh", category = "threats", learned = "Zephras Isle", keywords = "Al'Aketh" }
P:Topic { id = "two_orders", name = "The High Order and the Windshapers", category = "people", learned = "Zephras Isle", keywords = { "High Order", "Windshapers" } }
P:Topic { id = "shal_nan", name = "The Shal'nan", category = "lore", learned = "the High Elder", keywords = "Shal'nan" }
P:Topic { id = "windstones", name = "Windstones", category = "trade", learned = "Zephras Isle", keywords = { "windstones", "windstone" } }
P:Topic { id = "blackrock", name = "The Blackrock orcs", category = "threats", learned = "Lakeshire", keywords = "Blackrock" }
P:Topic { id = "everstill_bridge", name = "The Everstill Bridge", category = "places", learned = "Foreman Oslow", keywords = "Everstill" }
P:Topic { id = "redridge_gnolls", name = "Redridge's gnolls", category = "threats", learned = "Verner Osgood", keywords = "Redridge gnolls" }
P:Topic { id = "night_watch", name = "The Night Watch", category = "people", learned = "Darkshire", keywords = "Night Watch" }
P:Topic { id = "worgen", name = "The worgen of Duskwood", category = "threats", learned = "Darkshire, or the woods", keywords = "worgen" }
P:Topic { id = "stalvan", name = "Stalvan Mistmantle", category = "rumors", learned = "Tavernkeep Smitts, or the Legend of Stalvan", keywords = "Stalvan" }
P:Topic { id = "carevins", name = "The Carevins", category = "people", learned = "Jonathan Carevin or Calor in Darkshire", keywords = { "Carevins", "Carevin" } }
P:Topic { id = "ladimore", name = "Morgan Ladimore", category = "rumors", learned = "Sirra Von'Indi, the historian of Darkshire", keywords = "Ladimore" }
P:Topic { id = "gnomeregan", name = "The fall of Gnomeregan", category = "places", learned = "High Tinker Mekkatorque in Tinker Town", keywords = "Gnomeregan" }
P:Topic { id = "dark_iron", name = "The Dark Iron dwarves", category = "threats", learned = "Royal Historian Archesonus in the High Seat", keywords = "Dark Iron" }
P:Topic { id = "explorers_league", name = "The Explorers' League", category = "people", learned = "the Hall of Explorers in Ironforge", keywords = "Explorers' League" }
P:Topic { id = "dragonmaw", name = "The Dragonmaw clan", category = "threats", learned = "Captain Stoutfist in Menethil Harbor", keywords = "Dragonmaw" }
P:Topic { id = "cenarion_circle", name = "The Cenarion Circle", category = "people", learned = "Nighthaven, in Moonglade", keywords = "Cenarion Circle" }
P:Topic { id = "wailing_caverns", name = "The Wailing Caverns", category = "places", learned = "Tonga Runetotem at the Crossroads", keywords = "Wailing Caverns" }
P:Topic { id = "steamwheedle", name = "The Steamwheedle Cartel", category = "people", learned = "Baron Revilgaz in Booty Bay", keywords = { "Steamwheedle", "the Cartel" } }
P:Topic { id = "bloodsail", name = "The Bloodsail Buccaneers", category = "threats", learned = "Fleet Master Seahorn in Booty Bay", keywords = "Bloodsail" }
P:Topic { id = "kurzen", name = "Colonel Kurzen's expedition", category = "rumors", learned = "Lieutenant Doren at the Rebel Camp", keywords = "Kurzen" }
P:Topic { id = "grimtotem", name = "The Grimtotem clan", category = "threats", learned = "Cliffwatcher Longhorn at Freewind Post", keywords = "Grimtotem" }
P:Topic { id = "mirage_raceway", name = "The Mirage Raceway", category = "places", learned = "Pozzik or Fizzle on the Shimmering Flats", keywords = "Mirage Raceway" }
P:Topic { id = "burning_blade", name = "The Burning Blade", category = "threats", learned = "Zureetha Fargaze or Orgnil Soulscar in Durotar", keywords = "Burning Blade" }
P:Topic { id = "echo_isles", name = "The Echo Isles", category = "places", learned = "Master Gadrin in Sen'jin Village", keywords = "Echo Isles" }
P:Topic { id = "scarlet_crusade", name = "The Scarlet Crusade", category = "threats", learned = "Executor Arren or Executor Zygand in Tirisfal", keywords = { "Scarlet Crusade", "Scarlets" } }
P:Topic { id = "uldaman", name = "Uldaman", category = "places", learned = "Prospector Ryedol in the Badlands", keywords = "Uldaman" }
P:Topic { id = "argent_dawn", name = "The Argent Dawn", category = "people", learned = "Gregor Greystone in Everlook", keywords = "Argent Dawn" }
P:Topic { id = "venture_company", name = "The Venture Company", category = "threats", learned = "Mull Thunderhorn in Bloodhoof Village", keywords = { "Venture Company", "Venture Co" } }
P:Topic { id = "camping", name = "Camping", category = "trade", learned = "an adventurer camped on the road", link = false }
P:Topic { id = "yenniku", name = "Yenniku, son of Vol'jin", category = "people", learned = "Nimboya at Grom'gol", keywords = "Yenniku" }

---------------------------------------------------------------------------
-- Core topics (0.26.0). Everyone can be asked these, the way everyone in Morrowind could be
-- asked about their background or the latest rumors. Always known; they never link.
---------------------------------------------------------------------------
P:Topic { id = "background", name = "Background", category = "general", learned = "always yours to ask" }
P:Topic { id = "my_trade", name = "My trade", category = "general", learned = "always yours to ask" }
P:Topic { id = "little_secret", name = "A little secret", category = "general", learned = "always yours to ask; people tell more once they know you" }
P:Topic { id = "latest_rumors", name = "Latest rumors", category = "general", learned = "always yours to ask; innkeepers hear the most" }
P:Topic { id = "someplace_nearby", name = "Someplace nearby", category = "general", learned = "always yours to ask" }

---------------------------------------------------------------------------
-- The wider world (0.26.0). Learned by hearing the name: a link in what someone says.
---------------------------------------------------------------------------
P:Topic { id = "alliance", name = "The Alliance", category = "people", learned = "anyone who says the word", keywords = "Alliance" }
P:Topic { id = "horde", name = "The Horde", category = "people", learned = "anyone who says the word", keywords = "Horde" }
P:Topic { id = "scourge", name = "The Scourge", category = "threats", learned = "anyone who fought it, or fled it", keywords = { "Scourge", "Plaguelands" } }
P:Topic { id = "third_war", name = "The Third War", category = "lore", learned = "veterans, everywhere", keywords = "Third War" }
P:Topic { id = "forsaken", name = "The Forsaken", category = "people", learned = "anyone who says the word", keywords = "Forsaken" }
P:Topic { id = "silver_hand", name = "The Silver Hand", category = "people", learned = "paladins and old soldiers", keywords = "Silver Hand" }
P:Topic { id = "holy_light", name = "The Holy Light", category = "lore", learned = "priests, paladins, and the faithful", keywords = { "Holy Light", "the Light" } }
P:Topic { id = "elune", name = "Elune", category = "lore", learned = "night elves", keywords = "Elune" }
P:Topic { id = "earth_mother", name = "The Earth Mother", category = "lore", learned = "tauren", keywords = "Earth Mother" }
P:Topic { id = "stormwind", name = "Stormwind", category = "places", learned = "anyone who says the name", keywords = "Stormwind" }
P:Topic { id = "ironforge", name = "Ironforge", category = "places", learned = "anyone who says the name", keywords = "Ironforge" }
P:Topic { id = "darnassus", name = "Darnassus", category = "places", learned = "anyone who says the name", keywords = { "Darnassus", "Teldrassil" } }
P:Topic { id = "orgrimmar", name = "Orgrimmar", category = "places", learned = "anyone who says the name", keywords = "Orgrimmar" }
P:Topic { id = "thunder_bluff", name = "Thunder Bluff", category = "places", learned = "anyone who says the name", keywords = "Thunder Bluff" }
P:Topic { id = "undercity", name = "The Undercity", category = "places", learned = "anyone who says the name", keywords = "Undercity" }
P:Topic { id = "booty_bay", name = "Booty Bay", category = "places", learned = "anyone who says the name", keywords = "Booty Bay" }
P:Topic { id = "gadgetzan", name = "Gadgetzan", category = "places", learned = "anyone who says the name", keywords = "Gadgetzan" }
P:Topic { id = "ratchet", name = "Ratchet", category = "places", learned = "anyone who says the name", keywords = "Ratchet" }
P:Topic { id = "theramore", name = "Theramore", category = "places", learned = "anyone who says the name", keywords = "Theramore" }
P:Topic { id = "goldshire", name = "Goldshire", category = "places", learned = "anyone who says the name", keywords = "Goldshire" }
P:Topic { id = "gromgol", name = "Grom'gol", category = "places", learned = "anyone who says the name", keywords = "Grom'gol" }
P:Topic { id = "bolvar", name = "Highlord Bolvar Fordragon", category = "people", learned = "anyone who says the name", keywords = { "Bolvar", "Fordragon" } }
P:Topic { id = "king_anduin", name = "King Anduin Wrynn", category = "people", learned = "anyone who speaks of the king", keywords = { "King Anduin", "boy king" } }
P:Topic { id = "varian", name = "King Varian", category = "rumors", learned = "anyone who says the name", keywords = "Varian" }
P:Topic { id = "magni", name = "King Magni Bronzebeard", category = "people", learned = "anyone who says the name", keywords = "Magni" }
P:Topic { id = "tyrande", name = "Tyrande Whisperwind", category = "people", learned = "anyone who says the name", keywords = "Tyrande" }
P:Topic { id = "jaina", name = "Lady Jaina Proudmoore", category = "people", learned = "anyone who says the name", keywords = "Jaina" }
P:Topic { id = "thrall", name = "Thrall", category = "people", learned = "anyone who says the name", keywords = "Thrall" }
P:Topic { id = "cairne", name = "Cairne Bloodhoof", category = "people", learned = "anyone who says the name", keywords = "Cairne" }
P:Topic { id = "sylvanas", name = "Lady Sylvanas Windrunner", category = "people", learned = "anyone who says the name", keywords = { "Sylvanas", "Dark Lady" } }
P:Topic { id = "gurubashi", name = "The jungle trolls", category = "threats", learned = "anyone in Stranglethorn", keywords = { "Gurubashi", "Bloodscalp", "Skullsplitter", "Zul'Gurub" } }
P:Topic { id = "blackwater", name = "The Blackwater Raiders", category = "people", learned = "Booty Bay", keywords = "Blackwater" }
P:Topic { id = "nesingwary", name = "Hemet Nesingwary", category = "people", learned = "anyone in Stranglethorn", keywords = "Nesingwary" }
