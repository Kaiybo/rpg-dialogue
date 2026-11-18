-- Thelsamar's Mountaineers: dwarven rangers and guards of the loch country.
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")

P:Pool {
  id = "guard_thelsamar", role = "guard", community = "thelsamar",
  barks = {
    { id = "b_trogg", text = "Troggs again on the north ridge, like weeds with fists." },
    { id = "b_dam", text = "The dam's holdin', same as it always holds, until the day it doesn't, I suppose." },
  },
  greetings = {
    { id = "g_loch", text = "Welcome tae Thelsamar, where there's good beer, good folk, an' troggs in every hole in the hills, so mind yer step." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's a bit late fer wanderin'. Get indoors; the Stoutlager's still pourin'." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Troggs had a go at ye? Morhan the smith by the inn'll put ye right, an' then ye can go an' have a go back." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' ours! Welcome home, near enough, for Ironforge is just over the hills." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's sneakin' about? Come out, or I'll set the dogs on ye, an' never mind that we've no dogs; come out anyway." } },
  lines = {
    { id = "l_default", text = "The Mountaineers keep the roads open between Ironforge an' the loch, an' we've a fair few tae keep 'em open against: troggs, kobolds an' Dark Irons." },
  },
  choices = { { text = "Good luck, Mountaineer.", next = "END", fx = { standing = { thelsamar = 1 } } } },
  topics = {
    dark_iron = { { id = "t_dark_iron", text = "The Dark Irons have been at the Stonewrought Dam, so don't let the dam's engineer tell ye otherwise, though he'll try." } },
    explorers_league = { { id = "t_league", text = "League folk dig all over the loch, an' Prospector Ironband's lot at the excavation are the loudest of 'em." } },
    _none = { { id = "t_none", text = "Ask Mountaineer Kadrell, across from the inn; he knows everythin' about the loch." } },
  },
}
