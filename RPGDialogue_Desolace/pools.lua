-- The Nijel's Point Guard: Stormwind soldiers a very long way from Stormwind.
local P = RPGDialogueAPI:Pack("rpgd.desolace")

P:Pool {
  id = "guard_nijels", role = "guard", community = "nijels_point",
  barks = {
    { id = "b_y0", text = "The Kolkar raided the caravan road again. The goblins want us to escort them, and the Captain wants the goblins to pay for it." },
    { id = "b_y1", text = "Water's rationed again. You'd think in a land this dry they'd have dug a deeper well." },
    { id = "b_xkodo", text = "Kodo bones as far as the eye can see, and the old ones still wander out there, looking for somewhere to die." },
    { id = "b_dust", text = "Dust on the valley floor, centaur or just wind, and out here it's usually both." },
    { id = "b_far", text = "Stormwind's a long way off, and it feels longer every week." },
  },
  greetings = {
    { id = "g_point", text = "Nijel's Point, the only friendly roof for a long way in any direction, so make use of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night in Desolace: nothing grows, but plenty prowls. Stay in the light." },
    { id = "g_y0", when = { race = "Dwarf" }, text = "A dwarf! Good. Pentigast says your kind can find water in solid rock. Prove it, would you?" },
    { id = "g_y1", when = { race = "NightElf" }, text = "Ishnu-alah, or whatever it is. Marandis's dryads are your kin, I suppose. They never come inside the wall." },
    { id = "g_y2", when = { class = "PALADIN" }, text = "A paladin, in Desolace. Bless the well while you're here. It's the only thing we can't live without." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Centaur arrows, by the look of you, and they don't miss much. Get yourself mended." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something moving by the wall, and in Desolace that's never good news. Show yourself." } },
  lines = {
    { id = "l_y0", when = { class = "PALADIN" }, text = "The Light's thin out here, paladin, but the men still pray. If you've a blessing to spare, the sick bay could use it." },
    { id = "l_xcentaur", text = "The Magram and the Gelkis hate each other more than they hate us, and the Captain says to let them. I'd rather they all went home, but I don't think centaur have one." },
    { id = "l_default", text = "We hold the pass for the Alliance. The centaur fight each other more than us, and Captain Pentigast likes it that way." },
  },
  choices = {
    { text = "Talk to them. An ally out here is worth a hundred arrows.", next = "END", reply = "Maybe. Pentigast's tried before, and it didn't end well, but maybe.", fx = { align = { light = 1 } } },
    { text = "Never trust centaur. Keep them at arm's length.", next = "END", reply = "Aye, that's my view too. They've shot too many of us.", fx = { align = { light = -1 } } },
    { text = "How long have you served here?", next = "END", reply = "Three years. Long enough to forget the colour green, and to stop missing it, mostly." },
    { text = "Letting the centaur kill each other is smart.", next = "END", reply = "That's the Captain's thinking, and it's kept this wall standing.", fx = { align = { honor = -1 } } },
    { text = "Playing them against each other is no honourable way to fight.", next = "END", reply = "Maybe not, but honour's thin out here, and we're thinner.", fx = { align = { honor = 1 } } },
    { text = "Hold fast.", next = "END", fx = { standing = { nijels_point = 1 } } } },
  topics = {
    gizelton = { { id = "t_ygizelton", text = "The Gizelton Caravan runs the road south. Goblins, kodos and a lot of shouting." } },
    pentigast = { { id = "t_ypentigast", text = "Captain Pentigast holds the Point. He's stubborn, and that's what keeps us alive." } },
    mannoroc = { { id = "t_ymannoroc", text = "Mannoroc Coven, south of here. The demon blood is still in the ground." } },
    centaur = { { id = "t_xcentaur", text = "Magram, Gelkis, Kolkar. They fight each other more than us, thank the Light." } },
    kodo_graveyard = { { id = "t_xkodo", text = "Bones the size of houses out there. The old kodo still walk in to die." } },
    cenarion_circle = { { id = "t_circle", text = "Keeper Marandis and his dryads keep to themselves. They're after something in the south, something big." } },
    _none = { { id = "t_none", text = "Ask Captain Pentigast; he's got the maps, and the Light knows he's earned them." } },
  },
}
