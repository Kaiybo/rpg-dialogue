-- Thelsamar's Mountaineers: dwarven rangers and guards of the loch country.
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")

P:Pool {
  id = "guard_thelsamar", role = "guard", community = "thelsamar",
  barks = {
    { id = "b_trogg", text = "Troggs again on the north ridge, like weeds with fists." },
    { id = "b_dam", text = "The dam's holdin', same as it always holds, until the day it doesn't, I suppose." },
    { id = "xb_ale", text = "Two more hours o' watch, an' then the Stoutlager, an' I'll no' be talked out of it." },
    { id = "xb_gryphon", text = "There goes one o' Thorgrum's birds over the loch, wi' a rider on it, thank the stone." },
  },
  greetings = {
    { id = "g_loch", text = "Welcome tae Thelsamar, where there's good beer, good folk, an' troggs in every hole in the hills, so mind yer step." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's a bit late fer wanderin'. Get indoors; the Stoutlager's still pourin'." },
    { id = "xg_back", when = { metBefore = true }, text = "Back in the loch country, are ye? Good, for the troggs havenae thinned themselves." },
    { id = "xg_rain", text = "Mind the mud on the north road, friend, for it's ankle deep an' it'll take a boot off ye." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Troggs had a go at ye? Morhan the smith by the inn'll put ye right, an' then ye can go an' have a go back." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' ours! Welcome home, near enough, for Ironforge is just over the hills." },
    { id = "xn_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome this far east? There's a few o' yer folk at the excavation, arguin' wi' the League about drills, so ye'll feel right at home." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's sneakin' about? Come out, or I'll set the dogs on ye, an' never mind that we've no dogs; come out anyway." } },
  lines = {
    { id = "l_default", text = "The Mountaineers keep the roads open between Ironforge an' the loch, an' we've a fair few tae keep 'em open against: troggs, kobolds an' Dark Irons." },
    { id = "xl_garrison", text = "Half the garrison's gone off tae the Wetlands an' Arathi, so the rest of us stand double watches an' grumble about it at the inn." },
    { id = "xl_troggs", text = "The troggs came up out o' Uldaman an' the deep places, an' now they're thick in every cave from the dam tae the Badlands road." },
    { id = "xl_captain", text = "Captain Rugelfuss runs the watch from the tower by the inn, an' he's strict, but he's never sent a Mountaineer where he wouldnae go himsel'." },
  },
  choices = {
    { text = "The troggs will be cleared. I'll see to it.", next = "END", reply = "Big words, an' I hope ye mean 'em, for we could use the help.", fx = { align = { order = 1 } } },
    { text = "Leave the troggs their caves. Guard the roads.", next = "END", reply = "Easy said, but the caves keep growin' toward the roads, friend.", fx = { align = { order = -1 } } },
    { text = "Good luck, Mountaineer.", next = "END", fx = { standing = { thelsamar = 1 } } },
  },
  topics = {
    dark_iron = { { id = "t_dark_iron", text = "The Dark Irons have been at the Stonewrought Dam, so don't let the dam's engineer tell ye otherwise, though he'll try." } },
    explorers_league = { { id = "t_league", text = "League folk dig all over the loch, an' Prospector Ironband's lot at the excavation are the loudest of 'em." } },
    troggs = { { id = "xt_troggs", text = "Ugly, strong an' everywhere, an' they breed faster than we can shoot 'em. Mind the caves in the north hills." } },
    stoutlager = { { id = "xt_stout", text = "Best inn in the loch country, an' Hearthstove'll tell ye so himsel'. The dark ale's worth the walk." } },
    _none = { { id = "t_none", text = "Ask Mountaineer Kadrell, across from the inn; he knows everythin' about the loch." } },
  },
}
