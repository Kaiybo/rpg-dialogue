-- The Deathguard: Forsaken soldiers of Tirisfal. Dry, tired, and very hard to kill a second time.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")

P:Pool {
  id = "guard_brill", role = "guard", community = "brill",
  barks = {
    { id = "b_crusade", text = "Crusaders in the fields again. They never stop coming. Neither do we." },
    { id = "b_grave", text = "Graveyard's quiet tonight. I don't trust it when it's quiet." },
  },
  greetings = {
    { id = "g_brill", text = "Brill belongs to the Dark Lady now. Mind your manners and you'll keep your bones." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night or day, it's all the same to us. You might want a lamp, though." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Falling apart, are you? Join the club. The smith can patch the armor, at least." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8, race = "Scourge" },
      text = "Freshly risen. You'll stop flinching at your own reflection eventually. Most of us did." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I smell something living, or something sneaking. Either way, show yourself." } },
  lines = {
    { id = "l_default", text = "We keep the Crusade out of Brill and the mindless out of the graveyard. The Dark Lady asks no more. She asks no less, either." },
  },
  choices = { { text = "For the Dark Lady.", next = "END", fx = { standing = { brill = 1 } } } },
  topics = {
    scarlet_crusade = { { id = "t_crusade", text = "Living fanatics who think we're the plague. We were its victims. They never listen long enough to hear it." } },
    _none = { { id = "t_none", text = "Ask the Executor, at the inn. He likes questions about as much as I do." } },
  },
}

P:Pool {
  id = "guard_deathknell", role = "guard", community = "deathknell",
  barks = {
    { id = "b_mindless", text = "Another one woke up mindless. We put it back down. That's the job." },
  },
  greetings = {
    { id = "g_knell", text = "You're awake. And you're you, by the look of it. The undertaker will want to see you." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Still getting used to the body? Walk slowly. Things fall off if you rush." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneaking already? You'll do well in the Undercity." } },
  lines = {
    { id = "l_default", text = "Deathknell's where the Forsaken wake. Not all of us wake as ourselves. Those that don't, we deal with." },
  },
  choices = { { text = "Understood.", next = "END", fx = { standing = { deathknell = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask Sarvis. He has answers for everything, and opinions for the rest." } },
  },
}
