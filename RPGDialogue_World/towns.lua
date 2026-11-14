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
