-- The Sepulcher's Deathguard: a crypt turned fortress, with worgen to the south and Dalaran's mages to the east.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")

P:Pool {
  id = "guard_sepulcher", role = "guard", community = "sepulcher",
  barks = {
    { id = "b_howl", text = "Howling from the south again. The worgen are hungry tonight." },
    { id = "b_lights", text = "Strange lights by Ambermill. Dalaran's people, up to something." },
  },
  greetings = {
    { id = "g_crypt", text = "The Sepulcher. It was a graveyard once. It still is, but now the dead keep it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay inside the walls after dark. The forest has teeth." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Worgen, by the look of those marks. You were lucky. Get patched before you're less lucky." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "A shadow moving between the graves. Deathstalker, or thief? Show yourself." } },
  lines = {
    { id = "l_default", text = "Worgen to the south, the Scourge to the east, Dalaran's mages poking about in between. We hold the road for the Dark Lady." },
  },
  choices = { { text = "For the Dark Lady.", next = "END", fx = { standing = { sepulcher = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask the High Executor. He reads every report." } },
  },
}
