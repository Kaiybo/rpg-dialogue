-- Towns and communities: town standing and the gossip network share these ids.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Town {
  id = "northshire", name = "Northshire",
  subzones = { "Northshire Valley", "Northshire Abbey", "Northshire Vineyards", "Echo Ridge Mine" },
  related = { goldshire = 0.25, stormwind = 0.1 },
  tiers = { Hero = "Hero of Northshire" },
}

P:Town {
  id = "goldshire", name = "Goldshire",
  subzones = { "Goldshire", "Lion's Pride Inn" },
  related = { northshire = 0.25, stormwind = 0.15 },
  tiers = { Hero = "Hero of Goldshire" },
}

P:Town {
  id = "stormwind", name = "Stormwind",
  subzones = { "Trade District", "Cathedral Square", "Old Town", "Dwarven District", "Mage Quarter", "Stormwind Keep", "The Canals", "Valley of Heroes" },
  zones = { "Stormwind City" },
  related = { goldshire = 0.05 },
  tiers = { Hero = "Hero of Stormwind" },
}
