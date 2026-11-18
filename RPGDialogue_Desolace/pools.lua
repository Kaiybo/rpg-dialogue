-- The Nijel's Point Guard: Stormwind soldiers a very long way from Stormwind.
local P = RPGDialogueAPI:Pack("rpgd.desolace")

P:Pool {
  id = "guard_nijels", role = "guard", community = "nijels_point",
  barks = {
    { id = "b_dust", text = "Dust on the valley floor, centaur or just wind, and out here it's usually both." },
    { id = "b_far", text = "Stormwind's a long way off, and it feels longer every week." },
  },
  greetings = {
    { id = "g_point", text = "Nijel's Point, the only friendly roof for a long way in any direction, so make use of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night in Desolace: nothing grows, but plenty prowls. Stay in the light." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Centaur arrows, by the look of you, and they don't miss much. Get yourself mended." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something moving by the wall, and in Desolace that's never good news. Show yourself." } },
  lines = {
    { id = "l_default", text = "We hold the pass for the Alliance. The centaur fight each other more than us, and Captain Pentigast likes it that way." },
  },
  choices = { { text = "Hold fast.", next = "END", fx = { standing = { nijels_point = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "Keeper Marandis and his dryads keep to themselves. They're after something in the south, something big." } },
    _none = { { id = "t_none", text = "Ask Captain Pentigast; he's got the maps, and the Light knows he's earned them." } },
  },
}
