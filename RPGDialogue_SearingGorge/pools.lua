-- The Thorium Brotherhood's lookouts: Dark Iron dwarves who'd rather not be mistaken for the other kind.
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")

P:Pool {
  id = "guard_thorium", role = "guard", community = "thorium_point",
  barks = {
    { id = "b_heat", text = "Hot today. Hot every day. That's the Gorge." },
    { id = "b_mountain", text = "Smoke over the mountain. Somebody down there's still workin' for the Firelord. Poor sods." },
  },
  greetings = {
    { id = "g_point", text = "Thorium Point. Brotherhood ground. We're Dark Iron, aye, but no' that kind. Mind ye remember it." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, starin' at a Dark Iron. Go on, get it out o' yer system. Then we can do business." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Gorge chewed yer gear. Master Smith Burninate'll fix it, for a price. Everything's for a price here." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about the Point? The Brotherhood didnae escape a mountain by bein' easy to sneak up on." } },
  lines = {
    { id = "l_default", text = "We forged weapons for the Firelord's armies till we found a way out. Now we forge for whoever pays. Better bargain, that." },
  },
  choices = { { text = "Fair enough.", next = "END", fx = { standing = { thorium_point = 1 } } } },
  topics = {
    dark_iron = { { id = "t_dark_iron", text = "Our kin, still under the mountain, still bowin' to fire. We left. They didnae. Don't lump us together." } },
    blackrock = { { id = "t_blackrock", text = "Orcs in the upper Spire, our kin in the depths below. That mountain's got more masters than a bad smithy." } },
    _none = { { id = "t_none", text = "Ask the Overseer. He knows everything that happens on the Point. He says so, often." } },
  },
}
