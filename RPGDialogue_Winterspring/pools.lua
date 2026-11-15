-- The Everlook Bruisers: Cartel muscle in fur hats.
local P = RPGDialogueAPI:Pack("rpgd.winterspring")

P:Pool {
  id = "guard_everlook", role = "guard", community = "everlook",
  barks = {
    { id = "b_cold", text = "Can't feel my ears and can't feel my toes, but I can still feel my paycheck, barely." },
    { id = "b_yeti", text = "If you hear a yeti in town, it's probably one of Umi's... probably." },
  },
  greetings = {
    { id = "g_everlook", text = "This is Everlook, and it's Cartel ground, so Horde, Alliance or whoever you are, you trade here and fight somewhere else." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Furbolgs, or frostsabers? Either way your gear's in pieces, and the smith's inside, where it's warm." },
  },
  react = { { id = "r_form", on = "form", when = { form = "bear" }, text = "Another bear, is it? Fine, just don't track snow into the inn." } },
  lines = {
    { id = "l_default", text = "We keep the peace and the yetis out, or mostly the peace, since the yetis do what they like." },
  },
  choices = { { text = "Stay warm.", next = "END", fx = { standing = { everlook = 1 } } } },
  topics = {
    steamwheedle = { { id = "t_steamwheedle", text = "Same Cartel as Booty Bay and Gadgetzan, only colder, a lot colder." } },
    _none = { { id = "t_none", text = "Ask inside, friend, because my jaw's frozen." } },
  },
}
