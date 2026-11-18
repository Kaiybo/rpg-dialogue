-- The Argent Defenders at Chillwind Camp and the defenders of the Bulwark.
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")

P:Pool {
  id = "guard_chillwind", role = "guard", community = "chillwind_camp",
  barks = {
    { id = "b_count", text = "The commander's counting heads again, so stand still, or he'll have to start over." },
    { id = "b_wind", text = "Wind's from the north, and that smell is Andorhal, so breathe through your mouth if you can." },
  },
  greetings = {
    { id = "g_camp", text = "Welcome to Chillwind Camp, the last warm fire before the dead, so keep to the road coming in." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "I'm on the night watch, and if something moves out past the torches, it isn't one of ours, so shout." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The ghouls have been chewing on you, I see. Wash those cuts before they turn green, and I mean that, since out here they really do turn green." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, here in the camp? The Dawn says you're welcome, but the Dawn isn't the one standing next to you, so mind how you behave." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Show yourself, because anything that sneaks up on this camp gets a spear first and questions after!" } },
  lines = {
    { id = "l_default", text = "Stormwind's soldiers and the Dawn's stand side by side here, and there aren't nearly enough of either, nor enough dry socks, but we make do." },
  },
  choices = { { text = "Keep watch.", next = "END", fx = { standing = { chillwind_camp = 1 } } } },
  topics = {
    andorhal = { { id = "t_andorhal", text = "Andorhal's north of here, friend, and there's a cart in the ditch on the way that nobody's had the stomach to clear. You shouldn't go alone, or at all, if the commander hasn't sent you." } },
    argent_dawn = { { id = "t_dawn", text = "They're Officer Pureheart's lot, and good soldiers, though a bit preachy for my taste, and they still owe me three silver from dice." } },
    _none = { { id = "t_none", text = "Ask the commander. I'm paid to watch the road, friend, not to know things, and I've not been paid since the thaw, either." } },
  },
}

P:Pool {
  id = "guard_bulwark", role = "guard", community = "bulwark",
  barks = {
    { id = "b_wall", text = "There's another one shambling at the wall, the third today, and they never learn, which is their whole problem." },
    { id = "b_living", text = "The living soldiers here snore all night long, and I can't say I missed snoring." },
  },
  greetings = {
    { id = "g_wall", text = "This is the Bulwark, and past this gate everything wants you dead, even more than usual." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out east, I can tell by the holes in you. The smith in Brill can patch them, but we can't." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 45 },
      text = "You're too fresh for that gate, if you ask me. I'm not stopping you, mind, I'm only saying so, so that it's on the record." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's creeping about, so if you're one of ours, cough, and if you're not, you'll be one of ours soon enough." } },
  lines = {
    { id = "l_default", text = "We hold the wall so Tirisfal doesn't have to, and Brill sleeps easy because of us, not that anyone in Brill sleeps." },
  },
  choices = { { text = "For the Dark Lady.", next = "END", fx = { standing = { bulwark = 1 } } } },
  topics = {
    andorhal = { { id = "t_andorhal", text = "It's east of here and full of the dead, and not our kind of dead, either." } },
    scarlet_crusade = { { id = "t_scarlet", text = "They come at us from the north as well, so it seems everyone wants the Bulwark, which is very flattering." } },
    _none = { { id = "t_none", text = "Ask the High Executor. I hold a spear, and that's the whole of my job, though I do lose a finger now and then and have to go and find it." } },
  },
}
