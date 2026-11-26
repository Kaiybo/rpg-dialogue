-- Teldrassil's Sentinels: quiet watchers of the young world tree's roads.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")

P:Pool {
  id = "guard_dolanaar", role = "guard", community = "dolanaar",
  barks = {
    { id = "b_y0", text = "The priestesses say the moonwell's light dimmed for a moment last night. They say it is nothing. Priestesses always say it is nothing, right before it is something." },
    { id = "b_y1", text = "A pack of nightsabers crossed the road at dusk. Beautiful creatures, and hungry ones. Keep your arrows close." },
    { id = "b_furbolg", text = "The Gnarlpine were friends to us once, and now they snarl at us from the trees. Something has gotten into them." },
    { id = "b_owl", text = "The owls are restless tonight, and they usually know before we do. One of them stole my supper too, which I choose to take as a sign from Elune." },
  },
  greetings = {
    { id = "g_road", text = "Ishnu-alah, traveler. Dolanaar is safe enough, though the road beyond it is less so, so walk with care." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright tonight, which is good; you'll see the timberlings before they see you." },
    { id = "g_y0", when = { race = "Human" }, text = "A human, so far up the World Tree? You must have come by Rut'theran. Mind the young owls; they test strangers." },
    { id = "g_y1", when = { race = "Dwarf" }, text = "A dwarf in Dolanaar! You are welcome, but please do not try to dig. The tree takes it personally." },
    { id = "g_y2", when = { class = "HUNTER" }, text = "A hunter. Good. The road needs sharp eyes, and the Gnarlpine are cunning in the trees." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Shadowglen, I see. Every one of us walked this road once, and most of us came back." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid... The Gnarlpine might listen to one of you before they'd listen to my arrows, though I wouldn't wager on it." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The leaves just told me where you are. Sentinels learn to listen to them, not to look for shadows." } },
  lines = {
    { id = "l_y0", when = { class = "HUNTER" }, text = "Hunters keep this road safer than any wall could. Watch the treetops; the Gnarlpine climb higher than you expect." },
    { id = "l_x1", text = "The moonwell in Dolanaar is the heart of the village. Drink from it with respect; the priestesses notice who does not." },
    { id = "l_x2", text = "Fel Rock to the east has gone foul. Something dark nests in that cave, and our novices come back pale from it." },
    { id = "l_x3", when = { race = "NightElf" }, text = "You walk like someone born under these branches. Teldrassil is still young, sister or brother, so tend it gently." },

    { id = "l_default", text = "We watch the roads between Shadowglen and Darnassus. The forest is young, and not all that grows in it is healthy; some of it bites, and some of it just smells of rot." },
  },
  choices = {
    { text = "They can still be healed. Show them mercy.", next = "END", reply = "The priestesses would agree with you. I hope you are both right.", fx = { align = { light = 1 } } },
    { text = "Drive them out. The road must be safe.", next = "END", reply = "Perhaps. It is a hard thing to say, but I have said it too.", fx = { align = { light = -1 } } },
    { text = "What lies beyond Dolanaar?", next = "END", reply = "Darnassus to the west, Fel Rock to the east, and the Gnarlpine everywhere in between. Walk carefully." },
    { text = "Elune keep you, Sentinel.", next = "END", fx = { standing = { dolanaar = 1 } } },
  },
  topics = {
    darnassus = { { id = "t_ydarnassus", text = "Darnassus lies west along the road. The gates are beautiful, and the Sentinels at them are less forgiving than we are." } },
    fel_rock = { { id = "t_yfel_rock", text = "Fel Rock, to the east. Something dark nests there. The novices come back pale." } },
    moonwell = { { id = "t_ymoonwell", text = "The moonwell is the heart of Dolanaar. Drink from it with respect." } },
    teldrassil = { { id = "t_xteldrassil", text = "Our new World Tree. It grew quickly, and some say it grew too proud." } },
    gnarlpine = { { id = "t_xgnarlpine", text = "Furbolgs who were our friends. Something has poisoned their minds, and we grieve while we fight them." } },

    cenarion_circle = { { id = "t_circle", text = "The druids of the Circle tend the tree and we guard it, which seems a fair division to me." } },
    _none = { { id = "t_none", text = "Ask in Dolanaar, where Tallonkai or Athridas will know. If they don't, the innkeeper will pretend to, and graciously." } },
  },
}
