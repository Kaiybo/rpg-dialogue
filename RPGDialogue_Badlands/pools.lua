-- The Kargath Grunts: orcs and Forsaken on the edge of Dark Iron country.
local P = RPGDialogueAPI:Pack("rpgd.badlands")

P:Pool {
  id = "guard_kargath", role = "guard", community = "kargath",
  barks = {
    { id = "b_dust", text = "Dust in my teeth, dust in my boots. Even the dust has dust out here." },
    { id = "b_spire", text = "Smoke over the Spire again. Somebody up there is forging something." },
  },
  greetings = {
    { id = "g_kargath", text = "Kargath. Last Horde wall before the Blackrock. Keep yer weapon close." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. The Blackrock up the road wear our faces and serve dragons. Remember which of us is which." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Dark Irons got a piece of you. Get that armor fixed before they get the rest." },
  },
  react = { { id = "r_form", on = "form", text = "Something with claws walks into Kargath. Better be one of ours." } },
  lines = {
    { id = "l_default", text = "We hold the only Horde post in the dwarves' mountains. Dark Irons east, Blackrock north, ogres everywhere. Nobody sleeps much." },
  },
  choices = { { text = "Hold the wall.", next = "END", fx = { standing = { kargath = 1 } } } },
  topics = {
    blackrock = { { id = "t_blackrock", text = "The Blackrock call themselves the true Horde. Up there in the Spire, bowing to a dragon. True Horde." } },
    dark_iron = { { id = "t_dark_iron", text = "Short, angry, and they come out of the mountain at night. Kill them on sight; it's posted." } },
    _none = { { id = "t_none", text = "Ask the Warlord. He'll be up the tower, wishing he was somewhere else." } },
  },
}
