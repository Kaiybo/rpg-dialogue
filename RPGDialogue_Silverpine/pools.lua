-- The Sepulcher's Deathguard: a crypt turned fortress, with worgen to the south and Dalaran's mages to the east.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")

P:Pool {
  id = "guard_sepulcher", role = "guard", community = "sepulcher",
  barks = {
    { id = "b_howl", text = "Howling from the south again. The worgen dragged off a pack mule last night, and they'll be back for the saddle." },
    { id = "b_lights", text = "Strange lights by Ambermill, which means Dalaran's people are up to something." },
  },
  greetings = {
    { id = "g_crypt", text = "You're at the Sepulcher, which was a graveyard once. It still is, but now the dead keep it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay inside the walls after dark, because the forest has teeth." },
  },
  notice = {
    { id = "n_xwoods", cat = "origin", when = { origin = "forsaken_silverpine_woodsman" },
      text = "You know these woods; you walk them like a woodsman, not a soldier. If you drank in Pyrewood once, don't go back after dark, because the faces you'd know aren't quite faces then." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Worgen, by the look of those marks, and you were lucky. Get patched up before you're less lucky." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "There's a shadow moving between the graves. Deathstalker or thief, show yourself." } },
  lines = {
    { id = "l_default", text = "Worgen to the south, the Scourge to the east, Dalaran's mages poking about in between. We hold the road for the Dark Lady." },
  },
  choices = { { text = "For the Dark Lady.", next = "END", fx = { standing = { sepulcher = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Sepulcher gets reports from every corner of Silverpine, and most of them are bad. Here's what I can share." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask your questions and go, because the forest is dangerous enough without distractions at the gate." },
    },
    _none = { { id = "t_none", text = "Ask the High Executor; he reads every report, even the ones about who keeps nicking the lamp oil." } },
  },
}
