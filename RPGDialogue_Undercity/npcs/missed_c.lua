-- Undercity folk the rosters missed, part three: Ralston Farnsley, the Horde's cloth quartermaster in the
-- Magic Quarter (the wiki files him under Durotar, where he stands in a later age). Voice: bibles/missed_c.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ralston Farnsley: collects wool, silk, mageweave and runecloth for the Undercity.
P:NPC {
  key = "ralston_farnsley", id = TODO_NPC("Ralston Farnsley"), name = "Ralston Farnsley", gender = "male",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "service",
  communities = { "undercity" }, temper = { "dry", "fussy" }, values = { "thrifty", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "Ralston Farnsley keeps the Horde's cloth in the Magic Quarter, and he handles a bolt of wool the way other Forsaken handle a relic. He is polite in the manner of a man who has already counted what you are carrying.",
    third = "{name} met Ralston Farnsley, the cloth quartermaster who gathers donations for the Undercity in the Magic Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my good supplier returns. I've set aside a bolt of Stromgarde wool for a friend of the Quarter, and you're the friend." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep your hands off the folded linen, if you please; I count every bolt twice once you've passed." },
    { id = "g_default", text = "Good day to you, {class}. If that pack of yours holds any cloth you can spare, the Undercity would put it to better use than the moths will." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again, and I hope your pack is heavier than it was. My shelves empty a good deal faster than they fill." },
    { id = "g_wool", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "You have the wool, I trust? Lay it on the table, if you please, and mind the candle." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the living, and all the way down here in the damp. You are welcome, of course, though I would ask you not to bleed on the stock." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "You wear cloth yourself, I see, so you will know good weave from bad. That is rarer among my visitors than you might hope." },
  },
  start = "hello",
  nodes = {
    w3_damp = {
      lines = {
        { id = "w3_damp_1", text = "With cedar, camphor and constant suspicion. The canal sweats into every stone of this city, and a bolt of silk left one night on the lower shelf comes up spotted green by morning, so nothing of mine ever touches the floor." },
        { id = "w3_damp_2", when = { profession = "Tailoring" }, text = "With cedar, camphor and constant suspicion, as you'll know if you've ever lost good silk to a damp cellar. Nothing of mine touches the floor, and nothing touches the wall, either." },
      },
      choices = {
        { text = "Camphor? Where do you find that in the Undercity?", next = "w3_camphor" },
        { text = "I've lost a bolt or two to mildew myself.", next = "BACK", when = { profession = "Tailoring" }, reply = "Then you have my sympathy, which I do not hand out freely. Mildew is the only thief I cannot have hanged." },
        { text = "Something else, quartermaster.", next = "BACK" },
      },
    },
    w3_camphor = {
      lines = {
        { id = "w3_camphor_1", text = "The Apothecarium boils it up for me in exchange for first pick of the runecloth, which is a bargain I regret every Tuesday. Their powder keeps the moths off, though the whole Quarter smells faintly of a dead man's wardrobe." },
      },
      choices = {
        { text = "It does smell like that, now you mention it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_forsaken", when = { race = "Scourge" }, text = "Ralston Farnsley, cloth quartermaster. You need no telling why I am here, since you can see what the grave does to a coat, and the Dark Lady has a whole people to keep decently covered." },
        { id = "h_default", text = "I am Ralston Farnsley, and I gather cloth on behalf of the Undercity. Wool, silk, mageweave or runecloth will all serve, and whoever brings it will find that the Forsaken remember those who were useful to them." },
      },
      again = {
        { id = "h_again", text = "Was there something more? I have a tally to finish, and the wool will not fold itself." },
        { id = "h_again2", text = "Do go on, though I should warn you that I am counting while you talk." },
      },
      choices = {
        { text = "I have cloth to donate.", next = "BUSINESS" },
        { text = "What do the dead need with so much cloth?", next = "need" },
        { text = "What does the Undercity give in return?", next = "return_", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Why keep cloth in the Magic Quarter?", next = "quarter" },
        { text = "Where did you keep cloth, in Lordaeron?", next = "rf_store" },
        { text = "How do you keep cloth from rotting down here?", next = "w3_damp" },
        { text = "Good day, quartermaster.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Rather more than the living do, as it happens. A wound on one of us does not close of its own accord, so it must be stitched and bound and bound again, and what is not used for bandages goes to uniforms for the Deathguard." } },
      choices = {
        { text = "Which cloth do you need most?", next = "most" },
        { text = "I hadn't thought of the dead needing bandages.", next = "bandages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    most = {
      lines = { { id = "m_default", text = "Runecloth, without question, and I will take as much of it as anyone cares to carry down here. Wool and silk I accept gratefully the once, but runecloth takes an enchantment and holds a stitch, and the apothecaries ask for it faster than I can fold it." } },
      choices = { { text = "I'll keep it in mind. Another matter.", next = "BACK" } },
    },
    bandages = {
      lines = { { id = "b_default", text = "Few of the living do think of it. They suppose that we feel nothing and so need nothing, when the truth is that an arm left untended simply comes off, and one has only so many arms." } },
      choices = { { text = "A fair point. Something else.", next = "BACK" } },
    },
    return_ = {
      lines = { { id = "r_default", text = "Its regard, which is not given cheaply to the living. Bring enough over enough time and the Deathguard will stop watching your hands, and I am told that those we hold in the very highest esteem may even buy our horses." } },
      choices = { { text = "Regard will do. Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "Because it is the driest corner of a city built in a sewer, and because the mages and warlocks next door are my most particular customers. They ruin a robe a week between them, and they are never the ones who come to replace it." } },
      choices = { { text = "Something else, quartermaster.", next = "BACK" } },
    },
    rf_store = {
      lines = { { id = "rf_s_default", text = "In the royal stores by the river gate, where I kept the garrison's woollens and the court's silks on separate floors, as was proper. I knew every bolt by touch. When the prince came home, I was counting linen for his welcome banners." } },
      choices = {
        { text = "What became of the banners?", next = "rf_banners" },
        { text = "I sew for my living too.", next = "BACK", when = { profession = "Tailoring" }, reply = "Then you'll understand why I flinch at a crooked seam. Bring me good work and I'll know it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rf_banners = {
      lines = { { id = "rf_b_default", text = "They hung in the throne room on the day he killed his father, I'm told. I'd made sure the gold thread was straight. It is a strange thing, to be proud of your stitching on the worst day in the kingdom's history." } },
      choices = {
        { text = "Does the Horde treat its quartermasters fairly?", next = "rf_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rf_stance = {
      lines = { { id = "rf_st_default", text = "The orcs pay what they promise and count nothing twice, which makes them easy to supply and impossible to audit. Some of my colleagues say the Forsaken should keep their own stores apart. I'm undecided, and I'm seldom undecided." } },
      choices = {
        { text = "The Horde is one army. Share the stores.", next = "BACK", reply = "A tidy answer. The orcs would agree with you, loudly.", fx = { align = { order = 1 } } },
        { text = "Keep Forsaken stores for the Forsaken first.", next = "BACK", reply = "A prudent view. I'll make a note of it, quietly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lordaeron_x", text = "I measured cloth for a king. I measure it now for a queen. The tape hasn't changed." } },
    arthas = { { id = "tp_arthas_x", text = "I stitched his welcome banners. I'll say no more than that." } },
    background = { { id = "tp_bg", text = "I measured and counted cloth when Lordaeron had a king, and I do the same now that it has a queen. The work has changed less than I have." } },
    _none = { { id = "tp_none", text = "That is not a thing I keep on my shelves, I am afraid. Ask me about cloth, or ask someone else." } },
  },
}
