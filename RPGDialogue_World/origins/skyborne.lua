-- Skyborne origins, from section 10 of the brief only. DRAFT for the user's approval.
-- Every list ends with "other". Faction-specific entries use `faction`.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "skyborne", race = "Skyborne",
  origins = {
    { id = "skyborne_high_order", name = "Descendant of Highborne magisters (High Order)", faction = "Alliance",
      blurb = "My line kept the old arcane books through every drift of the isles. I came down to find what's missing from them.",
      nudge = { trait = { curious = 1 } } },
    { id = "skyborne_windshaper", name = "Windshaper initiate", faction = "Horde",
      blurb = "I passed the elemental trials and drank the sapta. The winds that sheltered us are gone; I mean to honor them anyway.",
      nudge = { trait = { pious = 1 }, align = { order = -1 } } },
    { id = "skyborne_peacekeeper", name = "Peacekeeper of Zephras Isle",
      blurb = "I kept the peace on Zephras Isle. Down here I'm not sure whose peace I'm keeping.",
      nudge = { align = { order = 2 } } },
    { id = "skyborne_thendal_ranger", name = "Ranger of Thendal Grove",
      blurb = "I walked the paths around Thendal Village. These forests are bigger, and quieter, and not mine.",
      nudge = { trait = { cautious = 1 } } },
    { id = "other", name = "Other" },
  },
}
