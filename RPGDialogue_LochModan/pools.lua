-- Thelsamar's Mountaineers: dwarven rangers and guards of the loch country.
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")

P:Pool {
  id = "guard_thelsamar", role = "guard", community = "thelsamar",
  barks = {
    { id = "b_trogg", text = "Troggs again on the north ridge. Like weeds with fists." },
    { id = "b_dam", text = "The dam's holding. It's always holding. Until it isn't, I suppose." },
  },
  greetings = {
    { id = "g_loch", text = "Thelsamar. Good beer, good folk, and troggs in every hole in the hills. Mind yer step." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Bit late fer wanderin'. Get indoors; the Stoutlager's still pourin'." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Troggs had a go at ye? Morhan'll put ye right, by the inn. Then go an' have a go back." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' ours! Welcome home, near enough. Ironforge is just over the hills." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's sneakin' about? Come out, or I'll set the dogs on ye. We've no dogs. Come out anyway." } },
  lines = {
    { id = "l_default", text = "Mountaineers keep the roads open between Ironforge an' the loch. Troggs, gnolls, Dark Irons. We've a fair few to keep 'em open against." },
  },
  choices = { { text = "Good luck, Mountaineer.", next = "END", fx = { standing = { thelsamar = 1 } } } },
  topics = {
    dark_iron = { { id = "t_dark_iron", text = "They've been at the dam. Don't let the engineer tell ye otherwise. He'll try." } },
    explorers_league = { { id = "t_league", text = "League folk dig all over the loch. Ironband's lot are the loudest." } },
    _none = { { id = "t_none", text = "Ask Kadrell, across from the inn. He knows everythin' about the loch." } },
  },
}
