-- Towns and communities: town standing and the gossip network share these ids.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Town {
  id = "northshire", name = "Northshire",
  subzones = { "Northshire Valley", "Northshire Abbey", "Northshire Vineyards", "Echo Ridge Mine" },
  related = { goldshire = 0.25, stormwind = 0.1 },
  tiers = { Hero = "Hero of Northshire" },
  quests = {
    { TODO_QUEST("Kobold Camp Cleanup"), 3 }, { TODO_QUEST("Investigate Echo Ridge"), 3 },
    { TODO_QUEST("Skirmish at Echo Ridge"), 5 }, { TODO_QUEST("Wolves Across the Border"), 3 },
    { TODO_QUEST("Brotherhood of Thieves"), 5 }, { TODO_QUEST("Milly's Harvest"), 5 },
    { TODO_QUEST("Bounty on Garrick Padfoot"), 6 },
  },
}

P:Town {
  id = "goldshire", name = "Goldshire",
  subzones = { "Goldshire", "Lion's Pride Inn", "Westbrook Garrison", "Maclure Vineyards", "Stonefield Farm" },
  related = { northshire = 0.25, stormwind = 0.15 },
  tiers = { Hero = "Hero of Goldshire" },
  quests = {
    { TODO_QUEST("The Fargodeep Mine"), 4 }, { TODO_QUEST("The Jasperlode Mine"), 5 },
    { TODO_QUEST("Gold Dust Exchange"), 2 }, { TODO_QUEST("Kobold Candles"), 2 },
    { TODO_QUEST("Further Concerns"), 4 }, { TODO_QUEST("Manhunt"), 8 },
    { TODO_QUEST("WANTED: \"Hogger\""), 15 },
  },
}

P:Town {
  id = "stormwind", name = "Stormwind",
  subzones = { "Trade District", "Cathedral Square", "Old Town", "Dwarven District", "Mage Quarter", "Stormwind Keep", "The Canals", "Valley of Heroes", "Heroes' Vigil", "Cathedral of Light" },
  zones = { "Stormwind City" },
  related = { goldshire = 0.05 },
  tiers = { Hero = "Hero of Stormwind" },
}

P:Town {
  id = "eastvale", name = "Eastvale",
  subzones = { "Eastvale Logging Camp", "Tower of Azora", "Ridgepoint Tower" },
  related = { goldshire = 0.15 },
  tiers = { Hero = "Hero of Eastvale" },
  quests = {
    { TODO_QUEST("Further Concerns"), 3 }, { TODO_QUEST("Find the Lost Guards"), 4 },
    { TODO_QUEST("Report to Thomas"), 6 }, { TODO_QUEST("Protect the Frontier"), 6 },
    { TODO_QUEST("A Bundle of Trouble"), 6 }, { TODO_QUEST("Dead-Tooth Jack"), 8 },
  },
}

P:Town {
  id = "sentinel_hill", name = "Sentinel Hill",
  subzones = { "Sentinel Hill", "Sentinel Tower" },
  related = { westfall_farms = 0.3, goldshire = 0.05 },
  tiers = { Hero = "Hero of Sentinel Hill" },
  quests = {
    { TODO_QUEST("The People's Militia"), 8 }, { TODO_QUEST("Patrolling Westfall"), 6 },
    { TODO_QUEST("Red Leather Bandanas"), 6 }, { TODO_QUEST("The Defias Brotherhood"), 6 },
  },
}

P:Town {
  id = "westfall_farms", name = "the farms of Westfall",
  subzones = { "Saldean's Farm", "The Jansen Stead", "Furlbrow's Pumpkin Farm", "The Molsen Farm", "Alexston Farmstead" },
  related = { sentinel_hill = 0.3 },
  tiers = { Hero = "Friend of the Farms" },
  quests = {
    { TODO_QUEST("The Killing Fields"), 8 }, { TODO_QUEST("Westfall Stew"), 4 },
    { TODO_QUEST("Poor Old Blanchy"), 5 }, { TODO_QUEST("The Forgotten Heirloom"), 6 },
    { TODO_QUEST("Furlbrow's Deed"), 5 },
  },
}

P:Town {
  id = "zephras_isle", name = "Zephras Isle",
  subzones = { "Valanaar", "Anvilas", "Siroccas", "Shen'dramar", "New Eldre'naar" },
  zones = { "Zephras Isle" },
  tiers = { Hero = "Hero of Zephras Isle" },
}

P:Town {
  id = "lakeshire", name = "Lakeshire",
  subzones = { "Lakeshire", "Lakeshire Inn", "Lakeshire Town Hall", "Lake Everstill" },
  related = { eastvale = 0.05 },
  tiers = { Hero = "Hero of Lakeshire" },
  quests = {
    { TODO_QUEST("Blackrock Menace"), 6 }, { TODO_QUEST("Missing In Action"), 10 },
    { TODO_QUEST("The Lost Tools"), 5 }, { TODO_QUEST("The Everstill Bridge"), 6 },
    { TODO_QUEST("Murloc Poachers"), 5 }, { TODO_QUEST("Dry Times"), 4 },
    { TODO_QUEST("Howling in the Hills"), 6 }, { TODO_QUEST("Tharil'zun"), 12 },
    { TODO_QUEST("The True Masters"), 10 },
  },
}

P:Town {
  id = "darkshire", name = "Darkshire",
  subzones = { "Darkshire", "Scarlet Raven Tavern", "Darkshire Town Hall" },
  related = { raven_hill = 0.2, lakeshire = 0.05 },
  tiers = { Hero = "Hero of Darkshire" },
  quests = {
    { TODO_QUEST("The Night Watch"), 6 }, { TODO_QUEST("The Embalmer's Revenge"), 15 },
    { TODO_QUEST("The Legend of Stalvan"), 3 }, { TODO_QUEST("The Shadowy Figure"), 4 },
  },
}

P:Town {
  id = "raven_hill", name = "Raven Hill",
  subzones = { "Raven Hill", "Raven Hill Cemetery" },
  related = { darkshire = 0.2 },
  tiers = { Hero = "Friend of Raven Hill" },
  quests = { { TODO_QUEST("Jitters' Growling Gut"), 4 } },
}

P:Town {
  id = "menethil", name = "Menethil Harbor",
  subzones = { "Menethil Harbor", "Deepwater Tavern", "Menethil Keep", "Menethil Bay" },
  tiers = { Hero = "Hero of Menethil" },
  quests = {
    { TODO_QUEST("War Banners"), 6 }, { TODO_QUEST("Nek'rosh's Gambit"), 6 },
    { TODO_QUEST("Defeat Nek'rosh"), 15 }, { TODO_QUEST("Lifting the Curse"), 8 },
  },
}

P:Town {
  id = "nighthaven", name = "Nighthaven",
  subzones = { "Nighthaven", "Shrine of Remulos", "Lake Elune'ara", "Stormrage Barrow Dens" },
  tiers = { Hero = "Friend of the Circle" },
}

P:Town {
  id = "crossroads", name = "The Crossroads",
  subzones = { "The Crossroads" },
  tiers = { Hero = "Hero of the Crossroads" },
  quests = {
    { TODO_QUEST("Disrupt the Attacks"), 6 }, { TODO_QUEST("The Disruption Ends"), 8 },
    { TODO_QUEST("Supplies for the Crossroads"), 5 }, { TODO_QUEST("Serena Bloodfeather"), 10 },
  },
}

P:Town {
  id = "astranaar", name = "Astranaar",
  subzones = { "Astranaar", "Lake Iris" },
  related = { maestras_post = 0.2 },
  tiers = { Hero = "Hero of Astranaar" },
  quests = { { TODO_QUEST("Culling the Threat"), 8 }, { TODO_QUEST("Raene's Cleansing"), 6 }, { TODO_QUEST("Fallen Sky Lake"), 10 } },
}

P:Town {
  id = "maestras_post", name = "Maestra's Post",
  subzones = { "Maestra's Post" },
  related = { astranaar = 0.2 },
  tiers = { Hero = "Friend of Maestra's Post" },
}

P:Town {
  id = "splintertree", name = "Splintertree Post",
  subzones = { "Splintertree Post" },
  tiers = { Hero = "Hero of Splintertree" },
  quests = { { TODO_QUEST("Ashenvale Outrunners"), 6 }, { TODO_QUEST("The Hunt Completed"), 12 } },
}

P:Town {
  id = "southshore", name = "Southshore",
  subzones = { "Southshore" },
  tiers = { Hero = "Hero of Southshore" },
  quests = { { TODO_QUEST("Crushridge Bounty"), 8 }, { TODO_QUEST("Syndicate Assassins"), 6 }, { TODO_QUEST("Farren's Proof"), 4 } },
}

P:Town {
  id = "tarren_mill", name = "Tarren Mill",
  subzones = { "Tarren Mill" },
  tiers = { Hero = "Hero of Tarren Mill" },
  quests = { { TODO_QUEST("Battle of Hillsbrad"), 6 }, { TODO_QUEST("WANTED: Syndicate Personnel"), 6 } },
}

P:Town {
  id = "auberdine", name = "Auberdine",
  subzones = { "Auberdine" },
  tiers = { Hero = "Hero of Auberdine" },
  quests = { { TODO_QUEST("The Blackwood Corrupted"), 8 }, { TODO_QUEST("WANTED: Murkdeep!"), 8 }, { TODO_QUEST("For Love Eternal"), 4 } },
}

P:Town {
  id = "thelsamar", name = "Thelsamar",
  subzones = { "Thelsamar", "Stoutlager Inn", "Stonewrought Dam", "Valley of Kings", "Ironband's Excavation Site" },
  tiers = { Hero = "Hero of Thelsamar" },
  quests = { { TODO_QUEST("Rat Catching"), 4 }, { TODO_QUEST("The Trogg Threat"), 6 }, { TODO_QUEST("A Dark Threat Looms"), 8 } },
}

P:Town {
  id = "sun_rock", name = "Sun Rock Retreat",
  subzones = { "Sun Rock Retreat", "Malaka'jin" },
  tiers = { Hero = "Hero of Sun Rock" },
  quests = { { TODO_QUEST("Harpies Threaten"), 6 }, { TODO_QUEST("Arachnophobia"), 8 } },
}

P:Town {
  id = "stonetalon_peak", name = "Stonetalon Peak",
  subzones = { "Stonetalon Peak", "The Talon Den" },
  tiers = { Hero = "Friend of the Peak" },
  quests = { { TODO_QUEST("Reclaiming the Charred Vale"), 8 } },
}

P:Town {
  id = "booty_bay", name = "Booty Bay",
  subzones = { "Booty Bay", "The Salty Sailor Tavern" },
  tiers = { Hero = "Friend of the Baron" },
  quests = { { TODO_QUEST("The Bloodsail Buccaneers"), 8 }, { TODO_QUEST("The Haunted Isle"), 6 } },
}

P:Town {
  id = "gromgol", name = "Grom'gol Base Camp",
  subzones = { "Grom'gol Base Camp" },
  tiers = { Hero = "Hero of Grom'gol" },
  quests = { { TODO_QUEST("Saving Yenniku"), 8 }, { TODO_QUEST("The Defense of Grom'gol"), 6 } },
}

P:Town {
  id = "rebel_camp", name = "The Rebel Camp",
  subzones = { "Rebel Camp" },
  tiers = { Hero = "Brother of the Rebellion" },
  quests = { { TODO_QUEST("Colonel Kurzen"), 8 }, { TODO_QUEST("Mai'Zoth"), 6 } },
}

P:Town {
  id = "freewind", name = "Freewind Post",
  subzones = { "Freewind Post" },
  tiers = { Hero = "Hero of Freewind" },
  quests = { { TODO_QUEST("Wanted - Arnak Grimtotem"), 8 }, { TODO_QUEST("Pacify the Centaur"), 6 } },
}

P:Town {
  id = "mirage_raceway", name = "The Mirage Raceway",
  subzones = { "Mirage Raceway", "The Shimmering Flats" },
  tiers = { Hero = "Fan Favorite" },
  quests = { { TODO_QUEST("Rocket Car Parts"), 6 } },
}

P:Town {
  id = "valley_of_trials", name = "The Valley of Trials",
  subzones = { "Valley of Trials", "The Den", "Burning Blade Coven" },
  tiers = { Hero = "Blooded in the Valley" },
  quests = { { TODO_QUEST("Sarkoth"), 4 }, { TODO_QUEST("Burning Blade Medallion"), 6 } },
}

P:Town {
  id = "razor_hill", name = "Razor Hill",
  subzones = { "Razor Hill", "Razor Hill Barracks" },
  tiers = { Hero = "Hero of Razor Hill" },
  quests = { { TODO_QUEST("Vanquish the Betrayers"), 6 }, { TODO_QUEST("Dark Storms"), 6 } },
}

P:Town {
  id = "senjin", name = "Sen'jin Village",
  subzones = { "Sen'jin Village" },
  tiers = { Hero = "Friend of the Darkspear" },
  quests = { { TODO_QUEST("Zalazane"), 8 } },
}

P:Town {
  id = "narache", name = "Camp Narache",
  subzones = { "Camp Narache", "Red Cloud Mesa" },
  tiers = { Hero = "Honored by the Hawkwind" },
  quests = { { TODO_QUEST("Attack on Camp Narache"), 6 } },
}

P:Town {
  id = "bloodhoof", name = "Bloodhoof Village",
  subzones = { "Bloodhoof Village" },
  tiers = { Hero = "Friend of the Bloodhoof" },
  quests = { { TODO_QUEST("Wildmane Cleansing"), 6 }, { TODO_QUEST("Kyle's Gone Missing!"), 4 } },
}

P:Town {
  id = "gevrek", name = "Camp Gev'rek",
  subzones = { "Camp Gev'rek" },
  tiers = { Hero = "Friend of the Windshapers" },
}

P:Town {
  id = "deathknell", name = "Deathknell",
  subzones = { "Deathknell", "Night Web's Hollow" },
  tiers = { Hero = "Risen Champion" },
  quests = { { TODO_QUEST("The Scarlet Crusade"), 4 } },
}

P:Town {
  id = "brill", name = "Brill",
  subzones = { "Brill", "Gallows' End Tavern", "Brill Town Hall" },
  tiers = { Hero = "Hero of Brill" },
  quests = { { TODO_QUEST("Wanted: Maggot Eye"), 6 }, { TODO_QUEST("Deaths in the Family"), 6 } },
}

P:Town {
  id = "coldridge", name = "Coldridge Valley",
  subzones = { "Coldridge Valley", "Anvilmar", "Whitebeard's Encampment" },
  tiers = { Hero = "Pride of Anvilmar" },
  quests = { { TODO_QUEST("The Stolen Journal"), 4 } },
}

P:Town {
  id = "kharanos", name = "Kharanos",
  subzones = { "Kharanos", "Thunderbrew Distillery" },
  tiers = { Hero = "Friend of Kharanos" },
  quests = { { TODO_QUEST("Frostmane Hold"), 6 } },
}

P:Town {
  id = "shadowglen", name = "Shadowglen",
  subzones = { "Shadowglen", "Aldrassil", "Shadowthread Cave" },
  tiers = { Hero = "Child of Aldrassil" },
  quests = { { TODO_QUEST("Webwood Egg"), 4 } },
}

P:Town {
  id = "dolanaar", name = "Dolanaar",
  subzones = { "Dolanaar" },
  tiers = { Hero = "Friend of Dolanaar" },
  quests = { { TODO_QUEST("Ursal the Mauler"), 6 }, { TODO_QUEST("Ferocitas the Dream Eater"), 6 } },
}

P:Town {
  id = "sepulcher", name = "The Sepulcher",
  subzones = { "The Sepulcher" },
  tiers = { Hero = "Hero of the Sepulcher" },
  quests = { { TODO_QUEST("Assault on Fenris Isle"), 8 }, { TODO_QUEST("The Dead Fields"), 6 } },
}

P:Town {
  id = "taurajo", name = "Camp Taurajo",
  subzones = { "Camp Taurajo" },
  tiers = { Hero = "Friend of Taurajo" },
  quests = { { TODO_QUEST("Betrayal from Within"), 6 } },
}

P:Town {
  id = "nijels_point", name = "Nijel's Point",
  subzones = { "Nijel's Point" },
  tiers = { Hero = "Hero of Nijel's Point" },
  quests = { { TODO_QUEST("Brutal Politics"), 8 } },
}

P:Town {
  id = "ghost_walker", name = "Ghost Walker Post",
  subzones = { "Ghost Walker Post" },
  tiers = { Hero = "Hero of Ghost Walker Post" },
  quests = { { TODO_QUEST("The Corrupter"), 8 } },
}

P:Town {
  id = "gadgetzan", name = "Gadgetzan",
  subzones = { "Gadgetzan", "The Road Warrior" },
  tiers = { Hero = "Friend of the Cartel" },
  quests = { { TODO_QUEST("More Wastewander Justice"), 6 }, { TODO_QUEST("Noggenfogger Elixir"), 6 } },
}

P:Town {
  id = "steamwheedle_port", name = "Steamwheedle Port",
  subzones = { "Steamwheedle Port" },
  tiers = { Hero = "Known on the Docks" },
}

P:Town {
  id = "theramore", name = "Theramore",
  subzones = { "Theramore Isle", "Foothold Citadel" },
  tiers = { Hero = "Friend of Theramore" },
  quests = { { TODO_QUEST("The Black Shield"), 6 }, { TODO_QUEST("Daelin's Men"), 6 } },
}

P:Town {
  id = "brackenwall", name = "Brackenwall Village",
  subzones = { "Brackenwall Village" },
  tiers = { Hero = "Hero of Brackenwall" },
  quests = { { TODO_QUEST("Justice Dispensed"), 8 } },
}

-- The other capitals. Their guards speak from pools_roles.lua; standing grows from quests
-- each capital's own pack lists later.
P:Town {
  id = "ironforge", name = "Ironforge",
  subzones = { "The Great Forge", "The Commons", "The Military Ward", "The Mystic Ward", "Tinker Town", "Hall of Explorers", "The Forlorn Cavern", "Hall of Arms" },
  zones = { "Ironforge" },
  tiers = { Hero = "Hero of Ironforge" },
}

P:Town {
  id = "darnassus", name = "Darnassus",
  subzones = { "Temple of the Moon", "Cenarion Enclave", "Warrior's Terrace", "Craftsmen's Terrace", "Tradesmen's Terrace" },
  zones = { "Darnassus" },
  tiers = { Hero = "Hero of Darnassus" },
}

P:Town {
  id = "orgrimmar", name = "Orgrimmar",
  subzones = { "Valley of Strength", "Valley of Honor", "Valley of Spirits", "Valley of Wisdom", "The Drag", "Cleft of Shadow", "Grommash Hold" },
  zones = { "Orgrimmar" },
  tiers = { Hero = "Hero of Orgrimmar" },
}

P:Town {
  id = "thunder_bluff", name = "Thunder Bluff",
  subzones = { "Elder Rise", "Spirit Rise", "Hunter Rise" },
  zones = { "Thunder Bluff" },
  tiers = { Hero = "Hero of Thunder Bluff" },
}

P:Town {
  id = "undercity", name = "Undercity",
  subzones = { "The Apothecarium", "The Magic Quarter", "The War Quarter", "The Rogues' Quarter", "The Royal Quarter", "The Trade Quarter" },
  zones = { "Undercity" },
  tiers = { Hero = "Hero of the Undercity" },
}
