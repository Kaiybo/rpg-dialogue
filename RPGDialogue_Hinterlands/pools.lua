-- The Wildhammer Sentries of Aerie Peak: gryphon-riding dwarves who don't answer to Ironforge.
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")

P:Pool {
  id = "guard_aeriepeak", role = "guard", community = "aerie_peak",
  barks = {
    { id = "b_gryphon", text = "Hear that screech? That's a happy gryphon, for the angry ones ye don't hear till it's too late." },
    { id = "b_trolls", text = "Witherbark smoke over the hills again. By my beard, ye'd think they'd run out o' things tae burn." },
  },
  greetings = {
    { id = "g_peak", text = "Welcome tae Aerie Peak, friend. Mind the gryphons; they bite strangers, an' they decide who's a stranger." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "An Ironforge dwarf, by the look o' ye? Welcome anyway. Up here we judge a dwarf by the sky, not the mountain." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The trolls gave ye a hiding, so get mended, then go an' give 'em one back." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about the aviary? The gryphons can smell ye, even if I can't see ye." } },
  lines = {
    { id = "l_default", text = "The Wildhammer keep the Hinterlands free, from the sky, an' the trolls hate us for it, which suits us, for the gryphons hate them worse." },
  },
  choices = { { text = "For the Wildhammer.", next = "END", fx = { standing = { aerie_peak = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask the Thane, an' stand back, for he answers loud an' he's had his breakfast ale." } },
  },
}
