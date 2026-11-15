-- The Theramore Guard: soldiers of Jaina's island, many of them veterans of the voyage from Lordaeron.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")

P:Pool {
  id = "guard_theramore", role = "guard", community = "theramore",
  barks = {
    { id = "b_marsh", text = "Fog off the marsh again. You learn to listen instead of look." },
    { id = "b_ships", text = "Sails on the horizon, ours, I hope. Usually they're ours." },
  },
  greetings = {
    { id = "g_isle", text = "Welcome to Theramore. The Lady keeps the peace here, and so do we." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be out. The marsh is worse after dark: crocolisks, and things bigger than crocolisks." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The marsh got its teeth into you. There's a smith in the city; get patched before you go back out." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "From Stormwind, or one of us who came over the sea? Either way, welcome to the only human city on Kalimdor." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's creeping by the docks. Step into the light, slowly." } },
  lines = {
    { id = "l_default", text = "We came over with the Lady after Lordaeron fell. Built this place out of a swamp. We're not giving it up, not to anyone." },
  },
  choices = { { text = "For Theramore.", next = "END", fx = { standing = { theramore = 1 } } } },
  topics = {
    grimtotem = { { id = "t_grimtotem", text = "Tauren who don't follow Thrall. Captain Vimes has been asking about them, though he wouldn't say why." } },
    _none = { { id = "t_none", text = "Ask in the citadel; Captain Vimes or the Archmage will know." } },
  },
}
