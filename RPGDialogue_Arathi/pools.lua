-- Arathi's guards: Stromgarde's last soldiers at Refuge Pointe, and the Horde's guardians at Hammerfall.
local P = RPGDialogueAPI:Pack("rpgd.arathi")

P:Pool {
  id = "guard_refuge", role = "guard", community = "refuge_pointe",
  barks = {
    { id = "b_keep", text = "You can see the keep from the ridge on a clear day. It was ours once, and it'll be ours again, once the quartermaster finds us arrows that don't snap." },
    { id = "b_tents", text = "Tents again tonight, and mine leaks right over my bedroll, so I sleep with my boots on and my feet in a puddle." },
  },
  greetings = {
    { id = "g_pointe", text = "This is Refuge Pointe. It's not much of a town, but it's what Stromgarde has left, so we hold it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The highlands bit you, trolls or ogres by the look of it, so get mended." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Syndicate creep around these hills, so step out where I can see you." } },
  lines = {
    { id = "l_default", text = "The Third War took the keep, but it didn't take us, and we'll be here until Stromgarde is ours again." },
  },
  choices = { { text = "For Stromgarde.", next = "END", fx = { standing = { refuge_pointe = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask Captain Nials, and she'll tell you, briefly, and probably while she's eating." } },
  },
}

P:Pool {
  id = "guard_hammerfall", role = "guard", community = "hammerfall",
  barks = {
    { id = "b_name", text = "This place is named for Doomhammer, so stand up straight in it." },
    { id = "b_trolls", text = "Witherbark drums in the hills again. Let them drum; I've slept through worse snoring in this barracks." },
  },
  greetings = {
    { id = "g_fort", text = "This is Hammerfall. The humans kept orcs in cages here once, and now it's ours." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! Your grandfathers might have stood behind these walls in chains, so remember who broke them." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's creeping by the wall, so show yourself before I put an axe in the shadow." } },
  lines = {
    { id = "l_default", text = "Thrall and Doomhammer broke this camp open and set our people free, and Doomhammer died for it, so we hold it in his name." },
  },
  choices = { { text = "For Doomhammer.", next = "END", fx = { standing = { hammerfall = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask Drum Fel; he leads here, and he's in a mood since a wind rider ate his map." } },
  },
}
