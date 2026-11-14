-- The Nijel's Point Guard: Stormwind soldiers a very long way from Stormwind.
local P = RPGDialogueAPI:Pack("rpgd.desolace")

P:Pool {
  id = "guard_nijels", role = "guard", community = "nijels_point",
  barks = {
    { id = "b_dust", text = "Dust on the valley floor. Centaur, or just wind. Out here it's usually both." },
    { id = "b_far", text = "Stormwind's a long way off. Feels longer every week." },
  },
  greetings = {
    { id = "g_point", text = "Nijel's Point. The only friendly roof for a long way in any direction. Make use of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night in Desolace. Nothing grows, but plenty prowls. Stay in the light." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Centaur arrows, by the look of you. They don't miss much. Get mended." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something moving by the wall. In Desolace that's never good news. Show yourself." } },
  lines = {
    { id = "l_default", text = "We hold the pass for the Alliance. The centaur fight each other more than us, and the Captain likes it that way." },
  },
  choices = { { text = "Hold fast.", next = "END", fx = { standing = { nijels_point = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "The keeper and his sisters keep to themselves. They're after something in the south. Something big." } },
    _none = { { id = "t_none", text = "Ask the Captain. He's got the maps." } },
  },
}
