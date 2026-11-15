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
P:Topic { id = "ladimore", keywords = { "Ladimore", "Mor'Ladim" }, name = "Morgan Ladimore", category = "rumors", learned = "Sirra Von'Indi, the historian of Darkshire" }
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
P:Topic { id = "knows", name = "What do you know?", category = "anyone", standard = true, order = 0, learned = "anyone" }
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

-- Ironforge and Loch Modan (Ironforge 1.4.0, Loch Modan 1.2.0)
P:Topic { id = "troggs", keywords = { "trogg" }, name = "The troggs", category = "threats", learned = "Senator Stonehallow at Gol'Bolar, or anyone in Loch Modan" }
P:Topic { id = "frostmane", keywords = { "Frostmane" }, name = "The Frostmane trolls", category = "threats", learned = "Grelin Whitebeard in Coldridge Valley, or Senir Whitebeard in Kharanos" }
P:Topic { id = "stonewrought_dam", keywords = { "Stonewrought" }, name = "The Stonewrought Dam", category = "places", learned = "Chief Engineer Hinderweir VII, or Royal Historian Archesonus" }

-- The night elf lands (Darnassus 1.2.0, Teldrassil 1.3.0, Darkshore 1.2.0, Ashenvale 1.2.0)
P:Topic { id = "teldrassil", keywords = { "Teldrassil" }, name = "Teldrassil", category = "places", learned = "Tenaron, Corithras or Fandral" }
P:Topic { id = "malfurion", keywords = { "Malfurion" }, name = "Malfurion Stormrage", category = "people", learned = "Tyrande or Fandral in Darnassus" }
P:Topic { id = "sisterhood_of_elune", keywords = { "Sisterhood" }, name = "The Sisterhood of Elune", category = "people", learned = "Tyrande, A'moora or Gwennyth" }
P:Topic { id = "sentinels", keywords = { "Sentinels" }, name = "The Sentinels", category = "people", learned = "Tyrande, or any Sentinel" }
P:Topic { id = "warsong", keywords = { "Warsong" }, name = "The Warsong in Ashenvale", category = "threats", learned = "Tyrande, Raene or Splintertree Post" }
P:Topic { id = "silithid", keywords = { "silithid" }, name = "The silithid", category = "threats", learned = "Gracina Spiritmight in Darnassus" }
P:Topic { id = "fel_moss", keywords = { "Fel Moss" }, name = "Fel Moss", category = "threats", learned = "Melithar, Athridas, Terenthis or Thundris" }
P:Topic { id = "furbolgs", keywords = { "furbolg" }, name = "The furbolgs", category = "threats", learned = "Athridas, Thundris or Raene" }
P:Topic { id = "dark_strand", keywords = { "Dark Strand" }, name = "The Dark Strand", category = "threats", learned = "Delgren the Purifier at Maestra's Post" }

-- Western Plaguelands (Western Plaguelands pack)
P:Topic { id = "plague_cauldrons", name = "The plague cauldrons", category = "threats", learned = "High Priestess MacDonnell at Chillwind Camp, or Shadow Priestess Vandis at the Bulwark" }
P:Topic { id = "andorhal", name = "Andorhal", category = "places", learned = "Commander Valorfist or High Executor Derrington" }
P:Topic { id = "scholomance", name = "The Scholomance", category = "places", learned = "Alchemist Arbington or Apothecary Dithers" }

-- Burning Steppes (Burning Steppes pack)
P:Topic { id = "black_dragonflight", keywords = { "black dragonflight", "black dragons" }, name = "The black dragonflight", category = "threats", learned = "Helendis Riverhorn or Marshal Maxwell at Morgan's Vigil" }
P:Topic { id = "blackrock_spire", keywords = { "Blackrock Spire" }, name = "Blackrock Spire", category = "places", learned = "Marshal Maxwell at Morgan's Vigil, or anyone at Flame Crest" }
P:Topic { id = "blackrock_depths", keywords = { "Blackrock Depths" }, name = "Blackrock Depths", category = "places", learned = "Jalinda Sprig at Morgan's Vigil, or Ragged John at Flame Crest" }
P:Topic { id = "windsor", keywords = { "Windsor" }, name = "Marshal Windsor", category = "people", learned = "Marshal Maxwell at Morgan's Vigil, or Ragged John at Flame Crest" }
P:Topic { id = "thaurissan", keywords = { "Thaurissan" }, name = "The ruins of Thaurissan", category = "lore", learned = "Helendis Riverhorn, Mayara Brightwing or Maxwort Uberglint in the Burning Steppes" }
P:Topic { id = "firegut", keywords = { "Firegut" }, name = "The Firegut ogres", category = "threats", learned = "Oralius or Marshal Maxwell at Morgan's Vigil" }

-- 0.35.0: Blasted Lands (topics for that pack go below this line)
P:Topic { id = "dark_portal", keywords = { "Dark Portal" }, name = "The Dark Portal", category = "places", learned = "anyone at Nethergarde Keep in the Blasted Lands" }
P:Topic { id = "burning_legion", keywords = { "Burning Legion" }, name = "The Burning Legion", category = "threats", learned = "Watcher Mahar Ba or Ambassador Ardalan at Nethergarde Keep" }
P:Topic { id = "nethergarde", keywords = { "Nethergarde" }, name = "Nethergarde Keep", category = "places", learned = "Quartermaster Lungertz, or the keep's soldiers" }
P:Topic { id = "dreadmaul", keywords = { "Dreadmaul" }, name = "The Dreadmaul ogres", category = "threats", learned = "Quartermaster Lungertz at Nethergarde Keep" }
P:Topic { id = "tainted_scar", keywords = { "Tainted Scar", "Kazzak" }, name = "The Tainted Scar", category = "threats", learned = "Quartermaster Lungertz, Ambassador Ardalan or Daio the Decrepit in the Blasted Lands" }
P:Topic { id = "draenethyst", keywords = { "draenethyst" }, name = "Draenethyst", category = "trade", learned = "Kum'isha the Collector in the Blasted Lands" }
P:Topic { id = "khadgar", keywords = { "Khadgar" }, name = "Archmage Khadgar", category = "people", learned = "Watcher Mahar Ba or Quartermaster Lungertz at Nethergarde Keep" }

-- 0.35.0: Azshara (topics for that pack go below this line)
P:Topic { id = "highborne", keywords = { "Highborne" }, name = "The Highborne", category = "lore", learned = "Loh'atu at Talrendis Point, or Archmage Xylem" }
P:Topic { id = "queen_azshara", keywords = { "Queen Azshara" }, name = "Queen Azshara", category = "lore", learned = "Loh'atu at Talrendis Point" }
P:Topic { id = "eldarath", keywords = { "Eldarath" }, name = "The Ruins of Eldarath", category = "places", learned = "Loh'atu at Talrendis Point, or Ogtinc above the ruins" }
P:Topic { id = "spitelash", keywords = { "Spitelash" }, name = "The Spitelash naga", category = "threats", learned = "Jarrodenus at Talrendis Point, or Archmage Xylem" }
P:Topic { id = "satyrs", keywords = { "satyr" }, name = "The satyr of Azshara", category = "threats", learned = "Loh'atu at Talrendis Point" }
P:Topic { id = "xylem", keywords = { "Xylem" }, name = "Archmage Xylem", category = "people", learned = "Loh'atu, Jediga, or Sanath Lim-yo below the tower" }
P:Topic { id = "morphaz", keywords = { "Morphaz" }, name = "Morphaz the green drake", category = "threats", learned = "Archmage Xylem, or Ogtinc above Eldarath" }
P:Topic { id = "rimtori", keywords = { "Rimtori" }, name = "Magus Rimtori's expedition", category = "threats", learned = "Ag'tor Bloodfist at Valormok, or Kim'jael" }
P:Topic { id = "waterlords", keywords = { "Waterlords", "Hydraxis" }, name = "The Hydraxian Waterlords", category = "people", learned = "Duke Hydraxis in the Bay of Storms" }
P:Topic { id = "loramus", keywords = { "Loramus" }, name = "Loramus the demon hunter", category = "people", learned = "Loramus Thalipedes on his island in the Bay of Storms" }
P:Topic { id = "arkkoroc", keywords = { "Arkkoroc" }, name = "Lord Arkkoroc", category = "people", learned = "Loramus Thalipedes, or the Temple of Arkkoran" }
P:Topic { id = "horizon_scout", keywords = { "Horizon Scout" }, name = "The wreck of the Horizon Scout", category = "rumors", learned = "Captain Vanessa Beltis in the Ruined Reaches" }

-- 0.35.0: Silithus (topics for that pack go below this line)
P:Topic { id = "ahn_qiraj", keywords = { "Ahn'Qiraj", "Scarab Wall" }, name = "Ahn'Qiraj", category = "places", learned = "Commander Mar'alith at Cenarion Hold, or Layo Starstrike at Valor's Rest" }
P:Topic { id = "silithid_hives", keywords = { "Hive'Regal", "Hive'Ashi", "Hive'Zora" }, name = "The hives of Silithus", category = "places", learned = "Geologist Larksbane or Commander Mar'alith at Cenarion Hold" }
P:Topic { id = "abyssal_council", keywords = { "Abyssal Council" }, name = "The Abyssal Council", category = "threats", learned = "Aurel Goldleaf or the Wildmane brothers at Cenarion Hold" }
P:Topic { id = "natalia", keywords = { "Natalia" }, name = "Mistress Natalia Mar'alith", category = "people", learned = "Commander Mar'alith or Captain Vish Kozus at Cenarion Hold" }
P:Topic { id = "southwind", keywords = { "Southwind" }, name = "Southwind Village", category = "places", learned = "Layo Starstrike at Valor's Rest, or Calandrath at the Oasis Inn" }
P:Topic { id = "ortell", keywords = { "Ortell" }, name = "Hermit Ortell", category = "people", learned = "Geologist Larksbane at Cenarion Hold" }
P:Topic { id = "bronze_dragonflight", keywords = { "bronze dragonflight", "Brood of Nozdormu" }, name = "The bronze dragonflight", category = "lore", learned = "Baristolth of the Shifting Sands at Cenarion Hold, or Frankal Stonebridge at Bronzebeard's camp" }
P:Topic { id = "cthun", keywords = { "C'Thun" }, name = "C'Thun", category = "threats", learned = "Commander Mar'alith, after Hive'Regal" }
