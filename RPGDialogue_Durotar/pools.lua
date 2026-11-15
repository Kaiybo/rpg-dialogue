-- Razor Hill's grunts and Sen'jin's watchers: orcs on the crossroads, trolls on the shore.
local P = RPGDialogueAPI:Pack("rpgd.durotar")

P:Pool {
  id = "guard_razorhill", role = "guard", community = "razor_hill",
  barks = {
    { id = "b_dust", text = "Dust on the Orgrimmar road. Could be a caravan, could be trouble, and usually it's both." },
    { id = "b_coast", text = "Kul Tiran sails off the coast again. Let them look all they like." },
  },
  greetings = {
    { id = "g_hill", text = "You're standing in Razor Hill, where the roads to Orgrimmar, Sen'jin and the Barrens all meet. So does trouble." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late to be on the road, and the cultists like the dark. Get yourself inside the walls." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Quilboar got a piece of you? The smith by the barracks will see to it." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh out of the valley, are you? Keep your weapon loose and your eyes open, because Durotar bites." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's creeping around the barracks. Show yourself, or I'll find you with my axe." } },
  lines = {
    { id = "l_default", text = "We hold the crossroads for the Warchief. Quilboar come from the west, humans from the coast and cultists from the canyons, and we hold anyway." },
  },
  choices = { { text = "Lok'tar.", next = "END", fx = { standing = { razor_hill = 1 } } } },
  topics = {
    burning_blade = { { id = "t_blade", text = "Orgnil hunts them. Don't get in his way, and don't get in theirs." } },
    _none = { { id = "t_none", text = "Ask Gar'Thok, in the barracks. He doesn't like questions, but he answers them." } },
  },
}

P:Pool {
  id = "guard_senjin", role = "guard", community = "senjin",
  barks = {
    { id = "b_isles", text = "The isles look close today, but they always look close." },
    { id = "b_drums", text = "Hear the drums? Somebody be dancing for the loa tonight." },
  },
  greetings = {
    { id = "g_village", text = "This be Sen'jin Village, mon, named for the chief's father, so you walk respectful." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night on the shore be pretty and dangerous both. Stay by the fires." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Welcome home, or close as we got for now." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "You be new, and no shame in it; everybody start somewhere. Just mind the crabs." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Heh. Hiding from a troll, in a troll village? That be brave, mon, but it not be smart." } },
  lines = {
    { id = "l_default", text = "We watch the water. Zalazane's puppets come off the isles sometimes, and they don't come to trade." },
  },
  choices = { { text = "Stay sharp.", next = "END", fx = { standing = { senjin = 1 } } } },
  topics = {
    echo_isles = { { id = "t_isles", text = "That be our home, and one day we take it back. Gadrin say so, and Gadrin don't lie." } },
    _none = { { id = "t_none", text = "Ask Master Gadrin. He know most things, and he tell you the rest whether you want it or not." } },
  },
}
