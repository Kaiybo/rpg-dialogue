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
  subzones = { "Goldshire", "Lion's Pride Inn" },
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
  subzones = { "Trade District", "Cathedral Square", "Old Town", "Dwarven District", "Mage Quarter", "Stormwind Keep", "The Canals", "Valley of Heroes" },
  zones = { "Stormwind City" },
  related = { goldshire = 0.05 },
  tiers = { Hero = "Hero of Stormwind" },
}
