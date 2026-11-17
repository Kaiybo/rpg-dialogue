-- Razor Hill's grunts and Sen'jin's watchers: orcs on the crossroads, trolls on the shore.
local P = RPGDialogueAPI:Pack("rpgd.durotar")

P:Pool {
  id = "guard_razorhill", role = "guard", community = "razor_hill",
  barks = {
    { id = "b_dust", text = "Dust on the Orgrimmar road. Could be a caravan, could be trouble, and usually it's both." },
    { id = "b_coast", text = "Kul Tiran sails off the coast again. Let them look; the Horde was born under harder eyes than theirs." },
  },
  greetings = {
    { id = "g_hill", text = "You stand in Razor Hill, where the roads to Orgrimmar, Sen'jin and the Barrens meet. Trouble meets here too, and we meet it with axes." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late to be on the road, and the Burning Blade likes the dark. Get inside the walls, {class}; there's no honor in a knife in the back." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Quilboar got a piece of you? The smith by the barracks will see to it." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh out of the valley, are you? Keep your weapon loose and your eyes open, because Durotar bites." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's creeping around the barracks. Show yourself, or I'll find you with my axe." } },
  lines = {
    { id = "l_default", text = "We hold the crossroads for the Warchief. Quilboar come from the west, humans from the coast and cultists from the canyons, and the Horde holds anyway, as it always has." },
  },
  choices = { { text = "Lok'tar.", next = "END", fx = { standing = { razor_hill = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everything that comes up the road from the Barrens or in off the coast passes this gate first. Here's what I've heard of it." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've held the line with us, so I'll tell you what Gar'Thok won't say out loud." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask, and keep it short, because the commander doesn't pay me to talk." },
    },
    burning_blade = { { id = "t_blade", text = "Orgnil hunts them. Don't get in his way, and don't get in theirs." } },
    _none = { { id = "t_none", text = "Ask Gar'Thok, in the barracks. He doesn't like questions, but he answers them, and he respects a grunt who asks to his face." } },
  },
}

P:Pool {
  id = "guard_senjin", role = "guard", community = "senjin",
  barks = {
    { id = "b_isles", text = "The isles look close today, mon, but they always look close. The loa like to tease us that way." },
    { id = "b_drums", text = "Hear the drums? Somebody be dancing for the loa tonight." },
  },
  greetings = {
    { id = "g_village", text = "This be Sen'jin Village, mon, named for the chief's father, so you walk respectful." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night on the shore be pretty and dangerous both. Stay by the fires, mon, where the spirits can see you." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Welcome home, or close as we got for now." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "You be new, and no shame in it; everybody start somewhere. Just mind the crabs." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Heh. Hiding from a troll, in a troll village? That be brave, mon, but it not be smart." } },
  lines = {
    { id = "l_default", text = "We watch the water. Zalazane's puppets come off the isles sometimes, and they don't come to trade, mon." },
  },
  choices = { { text = "Stay sharp.", next = "END", fx = { standing = { senjin = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Plenty of talk come across the water, mon, and plenty more come down the road. Ask me about these." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You be a friend of the Darkspear, so I tell you everything, even what Gadrin mumble to himself." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I tell you a little, but you not be from here, and I got the water to watch." },
    },
    echo_isles = { { id = "t_isles", text = "That be our home, and one day we take it back. Gadrin say so, and Gadrin don't lie." } },
    _none = { { id = "t_none", text = "Ask Master Gadrin. He know most things, and he tell you the rest whether you want it or not." } },
  },
}
