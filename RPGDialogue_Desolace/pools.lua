-- The Nijel's Point Guard: Stormwind soldiers a very long way from Stormwind.
local P = RPGDialogueAPI:Pack("rpgd.desolace")

P:Pool {
  id = "guard_nijels", role = "guard", community = "nijels_point",
  barks = {
    { id = "b_xkodo", text = "Kodo bones as far as the eye can see, and the old ones still wander out there, looking for somewhere to die." },
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
    { id = "l_xcentaur", text = "The Magram and the Gelkis hate each other more than they hate us, and the Captain says to let them. I'd rather they all went home, but I don't think centaur have one." },
    { id = "l_default", text = "We hold the pass for the Alliance. The centaur fight each other more than us, and Captain Pentigast likes it that way." },
  },
  choices = {
    { text = "Letting the centaur kill each other is smart.", next = "END", reply = "That's the Captain's thinking, and it's kept this wall standing.", fx = { align = { honor = -1 } } },
    { text = "Playing them against each other is no honourable way to fight.", next = "END", reply = "Maybe not, but honour's thin out here, and we're thinner.", fx = { align = { honor = 1 } } },
    { text = "Hold fast.", next = "END", fx = { standing = { nijels_point = 1 } } } },
  topics = {
    centaur = { { id = "t_xcentaur", text = "Magram, Gelkis, Kolkar. They fight each other more than us, thank the Light." } },
    kodo_graveyard = { { id = "t_xkodo", text = "Bones the size of houses out there. The old kodo still walk in to die." } },
    cenarion_circle = { { id = "t_circle", text = "Keeper Marandis and his dryads keep to themselves. They're after something in the south, something big." } },
    _none = { { id = "t_none", text = "Ask Captain Pentigast; he's got the maps, and the Light knows he's earned them." } },
  },
}
