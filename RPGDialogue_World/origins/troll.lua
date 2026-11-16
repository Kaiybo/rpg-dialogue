-- Troll origins. DRAFT for the user's approval. Year 1: the Darkspear sailed with Thrall,
-- were driven off the Echo Isles by Zalazane, and settled at Sen'jin.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "troll", race = "Troll",
  origins = {
    { id = "troll_echo_isles", name = "Darkspear from the Echo Isles",
      blurb = "The Echo Isles are home, mon, and Zalazane is sitting on them with his hexed slaves. Every Darkspear knows we're going back one day.",
      nudge = { trait = { brave = 1 }, align = { order = -1 } }, home = "senjin" },
    { id = "troll_sailed_with_thrall", name = "Sailed with Thrall from the south seas",
      blurb = "The sea witch and the murlocs would have had us all if the Warchief hadn't come. Vol'jin's father swore our debt to the Horde, and I was there to hear it.",
      nudge = { trait = { generous = 1 }, align = { honor = 2 } }, home = "senjin" },
    { id = "troll_witch_doctor_apprentice", name = "Apprentice to a Darkspear witch doctor",
      blurb = "I ground roots and boiled things that still moved for an old witch doctor at Sen'jin. He taught me that every loa wants something, and to know what before you ask.",
      nudge = { trait = { curious = 1 }, align = { order = -1 } }, home = "senjin" },
    { id = "troll_headhunter", name = "Headhunter of the Darkspear", class = "HUNTER",
      blurb = "My father took heads in Stranglethorn and his father before him. I hunt for the Horde now, and I keep the habit of watching the treeline.",
      nudge = { trait = { stern = 1 }, align = { honor = -1 } } },
    { id = "troll_loa_speaker", name = "Speaker for the loa", class = "PRIEST",
      blurb = "The loa speak and I listen, and sometimes I tell people what they said. Most of the time I keep it to myself, because the loa have a cruel sense of humor.",
      nudge = { trait = { pious = 1 }, align = { light = 1, order = -1 } } },
    { id = "troll_other_voice", name = "Listener to a voice that isn't a loa", class = "WARLOCK",
      blurb = "One night a voice spoke to me that didn't want an offering, only a bargain. The witch doctors won't speak to me now, and I didn't stop listening.",
      nudge = { trait = { curious = 1 }, align = { light = -2 } } },
    { id = "other", name = "Other" },
  },
}
