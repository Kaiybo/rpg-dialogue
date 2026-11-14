-- Teldrassil's Sentinels: quiet watchers of the young world tree's roads.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")

P:Pool {
  id = "guard_dolanaar", role = "guard", community = "dolanaar",
  barks = {
    { id = "b_furbolg", text = "The Gnarlpine were friends to us once. Now they snarl from the trees. Something has gotten into them." },
    { id = "b_owl", text = "The owls are restless tonight. They usually know before we do." },
  },
  greetings = {
    { id = "g_road", text = "Ishnu-alah. Dolanaar is safe; the road beyond it less so. Walk with care." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright tonight. Good. You'll see the timberlings before they see you." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Shadowglen. Every one of us walked this road once. Most of us came back." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The Gnarlpine might listen to one of you before they'd listen to my arrows. Might." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The leaves just told me where you are. Sentinels learn to listen to them, not to look for shadows." } },
  lines = {
    { id = "l_default", text = "We watch the roads between Shadowglen and Darnassus. The forest is young, and not all that grows in it is healthy." },
  },
  choices = { { text = "Elune keep you, Sentinel.", next = "END", fx = { standing = { dolanaar = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "The druids of the Circle tend the tree. We guard it. It is a fair division." } },
    _none = { { id = "t_none", text = "Ask in Dolanaar. Tallonkai or Athridas will know." } },
  },
}
