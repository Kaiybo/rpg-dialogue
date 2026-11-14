-- The Argent Defenders at Chillwind Camp and the defenders of the Bulwark.
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")

P:Pool {
  id = "guard_chillwind", role = "guard", community = "chillwind_camp",
  barks = {
    { id = "b_count", text = "Commander's counting heads again. Stand still, or he starts over." },
    { id = "b_wind", text = "Wind's from the north. Smell that? Andorhal. Breathe through your mouth." },
  },
  greetings = {
    { id = "g_camp", text = "Chillwind Camp. Last warm fire before the dead. Keep to the road coming in." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night watch. If something moves past the torches, it isn't one of ours. Shout." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The ghouls chewed on you, I see. Wash those cuts before they turn green. I mean it. They turn green out here." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde? Here? The Dawn says you're welcome. The Dawn isn't the one standing next to you. Behave." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Show yourself! Anything that sneaks up on this camp gets a spear first and questions after." } },
  lines = {
    { id = "l_default", text = "Stormwind's soldiers and the Dawn's, side by side. Not enough of either. We make do." },
  },
  choices = { { text = "Keep watch.", next = "END", fx = { standing = { chillwind_camp = 1 } } } },
  topics = {
    andorhal = { { id = "t_andorhal", text = "North of here. Don't go alone. Don't go at all, if the commander hasn't sent you." } },
    argent_dawn = { { id = "t_dawn", text = "Pureheart's lot. Good soldiers. A bit preachy." } },
    _none = { { id = "t_none", text = "Ask the commander. I'm paid to watch the road, not to know things." } },
  },
}

P:Pool {
  id = "guard_bulwark", role = "guard", community = "bulwark",
  barks = {
    { id = "b_wall", text = "Another one shambling at the wall. Third today. They don't learn. That's their whole problem." },
    { id = "b_living", text = "The living ones snore. I didn't miss snoring." },
  },
  greetings = {
    { id = "g_wall", text = "The Bulwark. Past this gate, everything wants you dead. Even more than usual." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out east. I can tell by the holes. The smith in Brill can patch them. We can't." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 45 },
      text = "You're too fresh for that gate. I'm not stopping you. I'm just telling you, so it's on the record." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's creeping. If you're one of ours, cough. If you're not, you'll be one of ours soon." } },
  lines = {
    { id = "l_default", text = "We hold the wall so Tirisfal doesn't have to. Brill sleeps easy because of us. Not that Brill sleeps." },
  },
  choices = { { text = "For the Dark Lady.", next = "END", fx = { standing = { bulwark = 1 } } } },
  topics = {
    andorhal = { { id = "t_andorhal", text = "East. Full of the dead. Not our kind of dead." } },
    scarlet_crusade = { { id = "t_scarlet", text = "They come at us from the north, too. Everyone wants the Bulwark. It's very flattering." } },
    _none = { { id = "t_none", text = "Ask the High Executor. I hold a spear. That's my whole job." } },
  },
}
