-- Human origins. DRAFT for the user's approval (brief M5). Every list ends with "other".
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "human", race = "Human",
  origins = {
    { id = "human_westfall_farmhand", name = "Westfall farmhand",
      blurb = "I worked a farm in Westfall until the Defias made it theirs. I came east with what I could carry.",
      nudge = { trait = { stern = 1 }, align = { order = 1 } }, home = "goldshire" },
    { id = "human_minor_noble", name = "Younger child of a minor noble house",
      blurb = "My family has a name in Stormwind and not much else. The name went to my eldest sibling. I went looking for something of my own.",
      nudge = { trait = { cautious = 1 } }, home = "stormwind" },
    { id = "human_lordaeron_refugee", name = "Refugee from Lordaeron",
      blurb = "I was a child when we fled the plague and the dead. Stormwind took us in. I haven't forgotten the north.",
      nudge = { trait = { brave = 1 }, align = { light = 1 } } },
    { id = "human_paladin_squire", name = "Squire of the fallen Silver Hand", class = "PALADIN",
      blurb = "My training stopped when the Order fell apart. I kept the oaths anyway.",
      nudge = { trait = { pious = 1 }, align = { light = 2 } } },
    { id = "other", name = "Other" },
  },
}
