-- Arathi's guards: Stromgarde's last soldiers at Refuge Pointe, and the Horde's guardians at Hammerfall.
local P = RPGDialogueAPI:Pack("rpgd.arathi")

P:Pool {
  id = "guard_refuge", role = "guard", community = "refuge_pointe",
  barks = {
    { id = "b_keep", text = "You can see the keep from the ridge on a clear day. Ours, once. Ours again, one day." },
    { id = "b_tents", text = "Tents again tonight. Stone walls are a memory around here." },
  },
  greetings = {
    { id = "g_pointe", text = "Refuge Pointe. Not much of a town. It's what Stromgarde has left, so we hold it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The highlands bit you. Trolls or ogres, by the look. Get mended." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Syndicate creep around these hills. Step out where I can see you." } },
  lines = {
    { id = "l_default", text = "The Third War took the keep. It didn't take us. We'll be here until Stromgarde is ours again." },
  },
  choices = { { text = "For Stromgarde.", next = "END", fx = { standing = { refuge_pointe = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask the Captain. She'll tell you, briefly." } },
  },
}

P:Pool {
  id = "guard_hammerfall", role = "guard", community = "hammerfall",
  barks = {
    { id = "b_name", text = "This place is named for Doomhammer. Stand up straight in it." },
    { id = "b_trolls", text = "Witherbark drums in the hills again. Let them drum." },
  },
  greetings = {
    { id = "g_fort", text = "Hammerfall. The humans kept orcs in cages here once. Now it's ours." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. Your grandfathers might have stood behind these walls in chains. Remember who broke them." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's creeping by the wall. Show yourself before I put an axe in the shadow." } },
  lines = {
    { id = "l_default", text = "Thrall and Doomhammer broke this camp open and set our people free. Doomhammer died for it. We hold it in his name." },
  },
  choices = { { text = "For Doomhammer.", next = "END", fx = { standing = { hammerfall = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask Drum Fel. He leads here." } },
  },
}
