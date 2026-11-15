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
    { id = "gnome_rearguard", name = "Survivor of the Gnomeregan rearguard", class = "WARRIOR",
      blurb = "I held a corridor while the rest got out, and then I ran too, because the radiation was worse than the troggs. I've been trying to stop running ever since.",
      nudge = { trait = { brave = 1 }, align = { order = 1 } }, home = "ironforge" },
    { id = "gnome_scavenger", name = "Scavenger of fallen Gnomeregan", class = "ROGUE",
      blurb = "I slip back into the city for parts that nobody else is brave or foolish enough to fetch. Mekkatorque would call it salvage, and the troggs would call it theft.",
      nudge = { trait = { greedy = 1 }, align = { honor = -1 } } },
    { id = "gnome_last_student", name = "Gnomeregan's last arcane student", class = "MAGE",
      blurb = "My classroom is under a hundred feet of toxic sludge now, and so are my notes. I've been rebuilding both from memory in a corner of Tinker Town.",
      nudge = { trait = { curious = 1 } }, home = "ironforge" },
    { id = "gnome_forbidden_texts", name = "Reader of forbidden texts", class = "WARLOCK",
      blurb = "After Gnomeregan fell, nobody was watching which books went missing from which shelves. Demons are just another system with inputs and outputs, and I've studied a great many systems.",
      nudge = { trait = { curious = 1 }, align = { light = -2 } } },
    { id = "gnome_first_altar", name = "The first gnome at the Mystic Ward's altars", class = "PRIEST",
      blurb = "The dwarves gave us a home when Gnomeregan fell, and I wanted to understand what they prayed to. Somewhere between the questions and the answers, I started praying too.",
      nudge = { trait = { pious = 1 }, align = { light = 2 } }, home = "ironforge" },
    { id = "other", name = "Other" },
  },
}
