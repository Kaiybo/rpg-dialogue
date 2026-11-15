-- Teldrassil's Sentinels: quiet watchers of the young world tree's roads.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")

P:Pool {
  id = "guard_dolanaar", role = "guard", community = "dolanaar",
  barks = {
    { id = "b_furbolg", text = "The Gnarlpine were friends to us once, and now they snarl at us from the trees. Something has gotten into them." },
    { id = "b_owl", text = "The owls are restless tonight, and they usually know before we do." },
  },
  greetings = {
    { id = "g_road", text = "Ishnu-alah, traveler. Dolanaar is safe enough, though the road beyond it is less so, so walk with care." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright tonight, which is good; you'll see the timberlings before they see you." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Shadowglen, I see. Every one of us walked this road once, and most of us came back." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid... The Gnarlpine might listen to one of you before they'd listen to my arrows, though I wouldn't wager on it." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The leaves just told me where you are. Sentinels learn to listen to them, not to look for shadows." } },
  lines = {
    { id = "l_default", text = "We watch the roads between Shadowglen and Darnassus. The forest is young, and not all that grows in it is healthy." },
  },
  choices = { { text = "Elune keep you, Sentinel.", next = "END", fx = { standing = { dolanaar = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "The druids of the Circle tend the tree and we guard it, which seems a fair division to me." } },
    _none = { { id = "t_none", text = "Ask in Dolanaar; Tallonkai or Athridas will know." } },
  },
}
