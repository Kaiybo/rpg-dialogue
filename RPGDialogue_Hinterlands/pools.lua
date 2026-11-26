-- The Wildhammer Sentries of Aerie Peak: gryphon-riding dwarves who don't answer to Ironforge.
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")

P:Pool {
  id = "guard_aeriepeak", role = "guard", community = "aerie_peak",
  barks = {
    { id = "b_gryphon", text = "Hear that screech? That's a happy gryphon, for the angry ones ye don't hear till it's too late." },
    { id = "b_trolls", text = "Witherbark smoke over the hills again. By my beard, ye'd think they'd run out o' things tae burn." },
    { id = "xb_falstad", text = "The thane's in a fine mood today, an' that means somebody's in trouble, an' it isnae me." },
    { id = "xb_wind", text = "Wind's from the west, so the gryphons'll be flyin' high an' the trolls'll be hidin' low." },
  },
  greetings = {
    { id = "g_peak", text = "Welcome tae Aerie Peak, friend. Mind the gryphons; they bite strangers, an' they decide who's a stranger." },
    { id = "xg_back", when = { metBefore = true }, text = "Ye're back, an' still in one piece, which is more than the trolls can say, I hope." },
    { id = "xg_night", when = { timeOfDay = "night" }, text = "Late for travellin' the cliff paths, friend. Get inside afore ye step off the edge in the dark." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "An Ironforge dwarf, by the look o' ye? Welcome anyway. Up here we judge a dwarf by the sky, not the mountain." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The trolls gave ye a hiding, so get mended, then go an' give 'em one back." },
    { id = "xn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Ye'll find plenty o' game in these hills, though the owlbeasts hunt back, so watch yer neck." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about the aviary? The gryphons can smell ye, even if I can't see ye." } },
  lines = {
    { id = "l_default", text = "The Wildhammer keep the Hinterlands free, from the sky, an' the trolls hate us for it, which suits us, for the gryphons hate them worse." },
    { id = "xl_ironforge", text = "Ironforge sends envoys now an' then tae talk o' the Alliance, an' Falstad listens politely, then does as he likes." },
    { id = "xl_vilebranch", text = "The Vilebranch take prisoners up tae Jintha'Alor, an' none come back down. We've lost scouts that way, good ones." },
    { id = "xl_revantusk", text = "There's a troll village on the coast that flies the Horde banner. They fight the Vilebranch too, so we leave 'em be, for now." },
  },
  choices = {
    { text = "The Wildhammer should stand closer with Ironforge.", next = "END", reply = "Maybe, but we'll stand where the sky is, an' Ironforge can come up tae meet us.", fx = { align = { order = 1 } } },
    { text = "Keep your freedom. Answer to no king.", next = "END", reply = "Aye! That's the Wildhammer creed, an' ye've learned it quick.", fx = { align = { order = -1 } } },
    { text = "For the Wildhammer.", next = "END", fx = { standing = { aerie_peak = 1 } } },
  },
  topics = {
    falstad = { { id = "xt_falstad", text = "Our thane, an' a hero o' the Second War. He's loud, he's proud, an' he's never wrong, so he says." } },
    gryphons = { { id = "xt_gryphons", text = "Bonded for life tae their riders, an' the finest beasts in Azeroth. Ye'll no' find better anywhere." } },
    _none = { { id = "t_none", text = "Ask Thane Falstad, an' stand back, for he answers loud an' he's had his breakfast ale." } },
  },
}
