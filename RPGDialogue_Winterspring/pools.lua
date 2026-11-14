-- The Everlook Bruisers: Cartel muscle in fur hats.
local P = RPGDialogueAPI:Pack("rpgd.winterspring")

P:Pool {
  id = "guard_everlook", role = "guard", community = "everlook",
  barks = {
    { id = "b_cold", text = "Can't feel my ears. Can't feel my toes. Can feel my paycheck. Barely." },
    { id = "b_yeti", text = "If you hear a yeti in town, it's probably Umi's. Probably." },
  },
  greetings = {
    { id = "g_everlook", text = "Everlook. Cartel ground. Horde, Alliance, whoever: trade here, fight somewhere else." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Furbolgs? Frostsabers? Either way, your gear's in pieces. The smith's inside, where it's warm." },
  },
  react = { { id = "r_form", on = "form", when = { form = "bear" }, text = "Another bear. Fine. Just don't track snow into the inn." } },
  lines = {
    { id = "l_default", text = "We keep the peace and the yetis out. Mostly the peace. The yetis do what they like." },
  },
  choices = { { text = "Stay warm.", next = "END", fx = { standing = { everlook = 1 } } } },
  topics = {
    steamwheedle = { { id = "t_steamwheedle", text = "Same Cartel as Booty Bay and Gadgetzan. Colder, though. Much colder." } },
    _none = { { id = "t_none", text = "Ask inside. My jaw's frozen." } },
  },
}
