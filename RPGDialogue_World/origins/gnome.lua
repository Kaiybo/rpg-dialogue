-- Gnome origins. DRAFT for the user's approval (brief M5). Every list ends with "other".
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "gnome", race = "Gnome",
  origins = {
    { id = "gnome_gnomeregan_refugee", name = "Refugee from Gnomeregan",
      blurb = "I left Gnomeregan with a toolbag and the clothes I was wearing. I still dream about the lower levels.",
      nudge = { trait = { cautious = 1 } } },
    { id = "gnome_tinker_apprentice", name = "Tinker's apprentice",
      blurb = "Three explosions, one workshop fire and a very patient master. I'm told I'm promising.",
      nudge = { trait = { curious = 1 } } },
    { id = "gnome_ironforge_raised", name = "Raised in Tinker Town",
      blurb = "Ironforge's hospitality is real and so are the stares. I learned to be twice as clever and half as loud.",
      nudge = { trait = { witty = 1 } } },
    { id = "other", name = "Other" },
  },
}
