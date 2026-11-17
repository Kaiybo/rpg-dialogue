-- Bloodhoof Village: Cairne's tribe on the plains below the bluffs. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baine", id = TODO_NPC("Baine Bloodhoof"), name = "Baine Bloodhoof",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "bloodhoof" }, temper = { "calm" }, values = { "wise", "loyal", "kind" },
  notices = { "race", "form" },
  impression = {
    first = "Baine Bloodhoof would rather talk the goblins, gnolls and dwarves down than fight them, and he means it. He walks the village every evening and admits he is still learning a few of its faces.",
    third = "{name} met Baine Bloodhoof, Cairne's son, who keeps Bloodhoof Village and the plains below the bluffs.",
  },

  greetings = {
    { id = "g_tent", text = "Be welcome in Bloodhoof Village. My father keeps the bluffs; I keep the plains below them." },
    { id = "g_back", when = { metBefore = true }, text = "Friend, sit with me a moment; the village can spare me." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. My father welcomed your people, and I'll do no less. Ask if you need anything of Mulgore." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from the red city. Your Warchief helped bring my people here, and we remember that." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear in my tent, and a polite one. The Earth Mother has a sense of humor." },
  },

  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, when a brave follows a kodo too far west and the Palemane gnolls take offence, or a hunter strays onto the goblins' claims. Most quarrels start with a hunt that went one step too far, so I ask our hunters to know where the borders lie." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a calm way about it. I find that the beasts of a peaceful hunter are always calm, and the restless ones belong to the restless." },
      },
      choices = {
        { text = "I'll respect the borders, Baine, and avoid quarrels.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hunt goes where the prey goes, borders or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You may be right, and I won't pretend I've never wished to know what the Venture Company tells its foremen. But a tauren caught listening at a goblin's tent can never sit across a fire from him again, so if you go, go knowing that my father's name goes with you." },
      },
      choices = {
        { text = "Secrets win more peace than open talk ever has.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then I'll go openly and speak your words plainly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What troubles the plains most?", next = "troubles" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps it could, but my people's oldest stories tell of a time when magic broke the world apart. I'll take your help gladly against the gnolls and the goblins, though I'd ask you to keep your fire away from the grain fields." },
      },
      choices = {
        { text = "I'll respect the fields. Your village, your rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fire is fire, and I'll use it where it works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why talk, if they won't listen?", next = "talk" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They will bear it because my father asks them to, but don't mistake that for welcome. Our hunters have heard what the Burning Blade did in Durotar, and a tauren who sees your imp will reach for a spear before he remembers we are allies, so keep it close and keep it quiet." },
      },
      choices = {
        { text = "I'll keep it leashed. Your people's peace matters.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them stare. My power protects the Horde too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How did the tauren come to Mulgore?", next = "coming" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baine Bloodhoof, Cairne's son. Goblins dig to the east, gnolls raid from the west, and dwarves blast the earth at Bael'dun. I'd rather talk them all down than fight them." },
        { id = "h_cairne", when = { heardLine = "cairne.h_default" },
          text = "You've met my father on the bluffs, so he'll have told you about the land. He tells everyone; he never tires of it." },
        { id = "h_rounds", when = { metBefore = true }, text = "I walk the village each evening, every tent and every fire. A leader should know every face, and I'm still learning a few." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Stars over Stonebull Lake, and on nights like this I can almost hear the old songs from when we wandered." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You carry totems, and the grass seems to lean toward you as you walk. My father calls the shamans the oldest memory of our people, so I'm glad to see one more." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The plains feed Bloodhoof, and those who hunt them well keep the peace better than any treaty I could make." },
      },
      choices = {
        { text = "How did the tauren come to Mulgore?", next = "coming" },
        { text = "What troubles the plains?", next = "troubles" },
        { text = "Why talk, if they won't listen?", next = "talk" },
        { text = "Does your father miss living on the plains?", tag = "Persuade", next = "baine_father",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "cairne.h_default" }, { race = "Tauren" } } } },
          fail = { next = "baine_father_no", fx = { affinity = -1 } } },
        { text = "A warrior settles quarrels too, Baine.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Your father stood up for my people. Why?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I've begun to walk the druid's path.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "Are the Windshapers good neighbours?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the spirits favor talking the Venture Company down, Baine?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Talking works better when you know their secrets first, Baine.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The arcane could help defend Bloodhoof, Baine.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the hunters cause you quarrels, Baine?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I bring a demon to Mulgore. Will your people bear it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Earth Mother guide you.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else, friend? The village is quiet for now, so ask." },
        { id = "h_again2", text = "Go on. I'd rather hear it from you than from the gossip at Kauth's fire." },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "It does, and I've carried a weapon for my people and will again. But a warrior who only knows how to end a quarrel will start a great many of them, and the plains have had enough of that." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "You'll stand with the braves at Bael'dun or against the Palemane one day, and I'll be glad of you. Only remember that the best fight is the one you were strong enough not to need." },
      },
      choices = {
        { text = "Strength is what makes them listen, Baine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then I'll talk first and fight only if I must.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Because you came to us asking for help, and the tauren remember what it is to be lost. My father believes your people can be cured of what was done to you, and that hope is why he spoke for you before the Warchief." },
        { id = "fk_farmer", when = { origin = "forsaken_brill_farmer" },
          text = "You farmed once, near Brill? Then you'll know what my father means when he speaks of the land, and I hope our fields remind you of yours more kindly than they hurt." } },
      choices = {
        { text = "I'm grateful to him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Do you think there's a cure?", next = "forsaken_cure" },
      },
    },
    forsaken_cure = {
      lines = { { id = "fc_default", text = "I don't know, friend, and I won't pretend. But I've watched my father refuse to give up on things far longer than anyone thought sensible, and he's been right more often than not." } },
      choices = { { text = "Then I'll hope as long as he does.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you'll go up to the Elder Rise and Hamuul will teach you to listen to the land, which my father says is the hardest thing a tauren ever learns. Come back and tell me what it says about Bael'dun; I'd like to know if I'm right to be worried." } },
      choices = { { text = "I'll come back and tell you.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Quiet ones, and respectful of the land, which is all a tauren asks. They watch the sky the way Harken does, as if they're waiting for it to call them home, and I haven't the heart to ask whether it will." } },
      choices = {
        { text = "Some of us are waiting for that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Mulgore is home enough now.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } },
      },
    },
    baine_father = {
      lines = {
        { id = "bf_default", text = "Every season. He tells me the High Rise is a fine place to see the land from and a poor place to stand on it. He'd rather walk with the herds, I think, and he stays up there because the tribes need one place to look to. I've never told him I noticed." },
        { id = "bf_heard", when = { heardLine = "cairne.h_default" },
          text = "You've heard him speak of the land, so you know already. He talks about the plains the way old warriors talk about a battle they miss. I keep the village well so that he can at least look down and see it kept." },
      },
      choices = {
        { text = "He's lucky in his son.", next = "BACK", fx = { affinity = 2 } },
        { text = "I won't mention it to him.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    baine_father_no = {
      lines = {
        { id = "bn_default", text = "My father's heart is his own to speak of, friend." },
        { id = "bn_ask", text = "Ask him yourself, on the High Rise. He'll tell you more than I should." },
      },
      choices = { { text = "Of course.", next = "BACK" } },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "The Venture Company cuts the land in the east, and the Palemane gnolls raid from the west. At Bael'dun, the dwarves blast the ground until the earth's spirits cry out. I warned them, and they kept digging." },
      },
      choices = {
        { text = "I'll help.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 }, align = { honor = 1 } } },
        { text = "The Venture Company pays well, and I won't cross them for a few hills.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "Because sometimes they do. A spear settles one quarrel, but a word, spoken well, can settle a hundred." },
      },
      choices = { { text = "Wise words.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    coming = {
      lines = {
        { id = "c_default", text = "We wandered for longer than any elder remembers. My father met Thrall's orcs, and with them beside us we drove the centaur from these plains. Mulgore is the first home our people have held in centuries." },
      },
      choices = { { text = "A home worth guarding.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The earth spirits are furious with the goblins at the mine, and I can't blame them. But a furious spirit beside a furious tauren would leave nothing standing in the east, so I ask the shamans to calm the one while I try to calm the other." } },
      choices = {
        { text = "Calm first. Mulgore has seen enough fire.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the earth swallow their mine, and the goblins with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The plains bring news to Bloodhoof from every road, and I try to hear all of it. Ask me about these, and I'll tell you what I know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "Sit with me, friend; you've earned the long answers, and the village can spare me a while." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, as I'd answer anyone who asks honestly, and I hope you are asking honestly." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul studies with them. My father trusts them, and so do I. The land needs friends who listen to it." } },
    grimtotem = { { id = "tp_grimtotem", text = "They're tauren, whatever else they are. I'd rather reason with them than fight them, for as long as reason works." } },
    _none = { { id = "tp_none", text = "I don't know, but I'll ask, and I'll remember you asked first." } },
    venture_company = { { id = "tp_venture", text = "We refused them the right to mine, and they poisoned our wells anyway. I'd still rather they sat down and talked, though I'm starting to doubt they know how." } },
  },
}

P:NPC {
  key = "zarlman", id = TODO_NPC("Zarlman Two-Moons"), name = "Zarlman Two-Moons",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class", "affliction" },
  impression = {
    first = "As Baine tends the people of Bloodhoof, Zarlman Two-Moons tends its spirits. He speaks of them as if they were restless children, which may be exactly what they are.",
    third = "{name} met Zarlman Two-Moons, spiritual leader of Bloodhoof Village and keeper of the rite of vision.",
  },

  greetings = {
    { id = "g_spirit", text = "Peace, young one. Baine tends the village in this world. I tend it in the other." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the spirit lodge. The spirits remember your step." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk close to the spirits already; I can see it. Don't be afraid of what they show you." },
    { id = "n_ghostly", cat = "affliction", place = "before", when = { resSick = true },
      text = "You've come back from the spirit's road not long ago, and it leaves a mark. Rest, and it fades." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They do, and they ask only that you fight for something worth their watching. The braves who fell to the centaur in the long years of wandering rest easier now that the tauren have a home, and a warrior who guards that home walks with their blessing." } },
      choices = {
        { text = "I'll fight to guard this home, as they did.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The dead can watch. My fight is my own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every hunter carries a few, and they stay as long as you remember them. The tauren give thanks for every plainstrider and every kodo so that their spirits return to the Earth Mother in peace, and I'd ask the same of you while you hunt these plains." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a living spirit among all those departed ones. It keeps them company, I think, and they seem to like it." },
      },
      choices = {
        { text = "I'll give thanks for every life I take.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead don't need my thanks, Zarlman.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind it the way a herd minds a stranger at the waterhole, child. The arcane does not belong to the land, and the spirits of Bloodhoof feel it pass like a cold draft, so they will not trouble you, but neither will they speak to you." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "The spirits are uneasy around the restless dead already, and the arcane only adds a cold draft to it. They will not trouble you, child, but neither will they speak to you, and I am sorry for it." },
      },
      choices = {
        { text = "Then I'll respect their silence, elder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't need the spirits' approval to study.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What are the spirits saying?", next = "spirits" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They sensed it before you crested the hill, and every one of them has gone quiet and watchful. Fel magic is a wound, not a power, and I fear the spirits will never forgive what walks beside you." },
      },
      choices = {
        { text = "Then I'll keep it far from the village, elder.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits' forgiveness means nothing to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What are the spirits saying lately?", next = "spirits" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zarlman Two-Moons is my name, and I look after the spirits of this village, and of the young ones passing through it." },
        { id = "h_vision", tags = { "news" }, when = { questActive = TODO_QUEST("Rite of Vision") },
          text = "The rite of vision asks you to see with more than your eyes. Drink, follow, and don't fight what you're shown." },
        { id = "h_young", when = { metBefore = true }, text = "The young ones come down from Narache shaking, from their first death or their first vision. At that age they look much the same." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The spirits are louder after dark, not angrier, only louder, like children who won't sleep." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The spirits of Bloodhoof's fallen braves watch the young ones who carry their weapons now, and they watch you as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and the spirits of the beasts you've taken walk close behind you. Don't worry; they seem content." },
      },
      choices = {
        { text = "What are the spirits saying?", next = "spirits" },
        { text = "What does the rite show?", next = "vision" },
        { text = "The spirits answer me now, elder. What should I ask them?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do the spirits mind what I am, elder?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do the spirits mind the arcane, elder?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the spirits of fallen braves watch over warriors, Zarlman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the spirits of my kills follow me, Zarlman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can the spirits sense my demon, elder?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Thank you, elder.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Is there more? The Earth Mother hears every question, and I will hear yours." },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Ask them nothing at first. Sit by the water and let them ask you, because the elements are tired of being commanded, and they remember who listens." },
        { id = "sh_rise", when = { origin = "tauren_spirit_rise" },
          text = "The seers on the Spirit Rise taught you well, I can tell; you already lower your voice near the water. Go and sit at the wells with Mull, and tell him what they say to you." },
      },
      choices = { { text = "I'll let them ask first.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "They notice it, as a wind notices a stone. You walk where the dead should be resting and you are not, and the spirits here aren't sure what to make of that. They aren't angry, little one, only puzzled, as I am." } },
      choices = { { text = "So am I, elder.", next = "BACK", fx = { affinity = 2 } } },
    },
    vision = {
      lines = { { id = "v_default", text = "Something different for everyone: a path, usually, and sometimes the end of one. The spirits choose; I only open the door." } },
      choices = {
        { text = "I'm ready.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather walk my own path than one the spirits pick for me.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = {
        { id = "s_wells", text = "They're restless near the wells. The water's spirits don't understand why it tastes of oil. Mull is trying to explain it to them." },
        { id = "s_quiet", text = "Quiet, today, and quiet is good. Quiet means nobody is grieving." },
      },
      choices = { { text = "Thank you, elder.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that. I won't speak for them." } },
  },
}

P:NPC {
  key = "harken", id = TODO_NPC("Harken Windtotem"), name = "Harken Windtotem",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Harken Windtotem watches the sky over Mulgore out of a habit left from the wandering years. He reads the weather from his aching knees and calls it progress with a perfectly straight face.",
    third = "{name} met Harken Windtotem, who keeps watch over what flies above Mulgore, which lately means far too many swoops.",
  },

  greetings = {
    { id = "g_plains", text = "Watch the sky over Mulgore for a while. You'll see what I mean about the swoops." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you'll have a better eye for birds than most, so use it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To a grown warrior, no, but to the young ones out in the fields, very much so. There are too many of them this year and they've grown bold, so thin them where they nest, and the farmers of Bloodhoof will sleep easier for it." } },
      choices = {
        { text = "I'll thin them where they nest, for the farmers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Swoops aren't worth a warrior's time, Harken.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then between us we'd see everything, and that's more than most of Bloodhoof manages. The Palemane gnolls creep in from the west at dusk, so if you have quiet feet and sharp eyes, watch the western road and tell the braves what you see." },
      },
      choices = {
        { text = "Better they never see me. Then they can't fight back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll watch, then meet them openly with the braves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why do you watch the sky?", next = "sky" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, and the young hunters would never forgive you for stealing their practice. Swoops are a nuisance, not a war, and I'd rather the youngsters learned to drop them with an arrow than watched a stranger freeze them out of the sky." },
      },
      choices = {
        { text = "Fair enough. The young need their practice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A pest is a pest, and I'll clear them anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why keep watch on the sky?", next = "sky" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Harken Windtotem, and I keep an eye on what flies over Mulgore. Lately it's mostly swoops, and too many of them." },
        { id = "h_swoop", tags = { "news" }, when = { questActive = TODO_QUEST("Swoop Hunting") },
          text = "The swoops are thick this season. Thin them, and bring me their quills. Nothing goes to waste in this village." },
        { id = "h_knees", when = { metBefore = true }, text = "My grandfather read the weather from how the birds flew. I read it from how my knees ache. The tribe calls that progress." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Even the swoops sleep at this hour, but I don't, much; it's an old habit from the wandering years." },
        { id = "h_maur", when = { heardLine = "maur.h_default" }, text = "Maur's after that beast again? He's tracked it longer than some of our braves have been alive." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Then you'll know the wind is turning before my knees do, and I'd thank you to tell me when." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and a tall one. Watch the skies, because the swoops dive at anything that stands still long enough on the plains." },
      },
      choices = {
        { text = "Why watch the sky?", next = "sky" },
        { text = "Do the swoops ever come down at a hunter's beast?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The air over Mulgore feels uneasy. Have you noticed, Harken?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I watch the ground the way you watch the sky.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could bring down those swoops with frost.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Are the swoops a real danger, Harken?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'll see to it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Something else? Ask away, and I'll keep one eye on the swoops while you do." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Not at a grown one, but they'll take a kodo calf or a careless pup. Watch how they circle: two turns wide and one turn tight, and then they drop, so loose your arrow on the tight turn." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "{pet} has been watching them since you got here, see? A good beast reads the sky as well as I do. Let it tell you when one's about to stoop." },
      },
      choices = { { text = "Two wide, one tight. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    sky = {
      lines = {
        { id = "s_map", text = "When we wandered, the sky was the only map we had. Now we've a home with walls of grass, and I still can't stop looking up." },
      },
      choices = { { text = "Keep watching for us.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Noticed it? The Windfury harpies have the swoops flying crooked over the whole plain, and the winds off their ridge smell of trouble. In the wandering years we'd simply have moved on, but we have a home now, so the wind will have to get used to us." } },
      choices = {
        { text = "We have a home now, so we hold it against the harpies.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind can't be owned. Maybe we should still move with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. Ask Baine; he hears more than I do." } },
  },
}

P:NPC {
  key = "maur", id = TODO_NPC("Maur Raincaller"), name = "Maur Raincaller",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "solemn" }, values = { "brave" },
  notices = { "kit" },
  impression = {
    first = "Rain followed every camp Maur Raincaller made on the long walk to Mulgore, and the name stuck. He tracks a beast the young hunters only whisper about, and he means to see its hide.",
    third = "{name} met Maur Raincaller, a solemn tauren hunter on the trail of the great beast Mazzranache.",
  },

  greetings = {
    { id = "g_rain", text = "Rain's coming; I can smell it on the wind. It's good for the grass, and bad for tracking." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out in the grass had a go at you. Get mended before you go after anything bigger." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The young hunters call it Mazzranache, and it's bigger than any prairie wolf or cougar I've seen, with tracks that cross the plains and vanish into the hills. If it comes at you, don't run, because nothing that size has ever been outrun on open ground." } },
      choices = {
        { text = "I'll stand my ground if it comes, Maur.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it comes, I'll run. There's no shame in living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'll be the first, because that beast has winded every hunter who's gone after it. It hunts by smell more than sight, so rub yourself in sage and keep downwind, and you might get close enough to see its eyes." },
      },
      choices = {
        { text = "I'll strike before it knows I'm there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I want it to see me. Let it be a fair hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "How did you come by your name?", next = "name" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, but the hide would come back scorched, and I want that hide to hang in Bloodhoof. A hunt is a conversation between the hunter and the hunted, and fire is no kind of conversation at all." },
      },
      choices = {
        { text = "You're right. The beast deserves an honest hunt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hunting isn't a conversation. It's a kill.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How did you get your name?", next = "name" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Maur Raincaller. There's a beast in Mulgore the young hunters whisper about, and I've seen its tracks. I'd like to see its hide." },
        { id = "h_mazz", tags = { "news" }, when = { questActive = TODO_QUEST("Mazzranache") },
          text = "The beast is called Mazzranache. Find it, end it, and bring me proof, and the young ones will stop whispering and start bragging." },
        { id = "h_slow", when = { metBefore = true }, text = "The young braves ask me how to track. I tell them: walk slower than you want to. Not one of them listens." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Something big moves out in the dark grass. I've heard it more than I've seen it, and that's the part I don't like." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You walk like a shaman, light on the grass, and that's a gift on a hunt. The beast I'm tracking would hear anyone else coming a mile off." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You won't track the beast I'm after, but if it ever turns on you, I'd like to know you can stand your ground." },
      },
      choices = {
        { text = "How did you get your name?", next = "name" },
        { text = "I'm a tracker too. What have its tracks told you?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Would the spirits frown on hunting Mazzranache, Maur?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your beast won't see me coming, Maur.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can't a mage simply blast the beast from afar?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What is this beast you're after, Maur?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'll find it.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak softly; voices carry out on the grass." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "That it's heavy at the front and drags its left hind a little, so it's been hurt before and it lived. A beast that has survived a hunter is a beast that's learned, and that's why I go slowly." },
        { id = "hu_narache", when = { origin = "tauren_narache_hunter" },
          text = "Your mother or father hunted out of Narache, didn't they? Then you were raised on the same tracks I was. Look for where it drinks, and wait there; it's thirsty after a kill." },
      },
      choices = {
        { text = "Then we'll wait for it, and be patient.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather drive it out and finish it fast.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    name = {
      lines = {
        { id = "n_rain", text = "It rained on every camp I made, the whole long walk to Mulgore. My mother said the clouds had adopted me, and the name stuck, and so did the clouds." },
      },
      choices = { { text = "It's a good name.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I asked an elder that once, and she told me the spirits don't frown on a hunt, only on a waste. If I take its hide, I'll honor every part of it, and I'll thank the earth for letting us meet." } },
      choices = {
        { text = "A clean hunt, honestly given. The spirits can't ask more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A trap works better than a chase, and nobody's the wiser.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not something I've tracked." } },
  },
}

P:NPC {
  key = "mull", id = TODO_NPC("Mull Thunderhorn"), name = "Mull Thunderhorn",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "worried" }, values = { "devout", "protective" },
  notices = { "race" },
  impression = {
    first = "Mull Thunderhorn walks to every sacred well each morning and finds the water no better each time. His worry is plain, but so is his stubbornness, and he will walk again tomorrow.",
    third = "{name} met Mull Thunderhorn, who grieves for the sacred wells of Mulgore poisoned by the Venture Company's machines.",
  },

  greetings = {
    { id = "g_wells", text = "Forgive me, my mind is on the wells. It's always on the wells, lately." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Tell me the water runs clean somewhere, please." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're of the plains, so the wells are yours too. Help me cleanse them." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Venture Company thugs, mostly, with clubs and too much confidence. They've set up at the sacred wells and won't leave for any words of mine, so if they won't listen to reason, perhaps they'll listen to an axe, though I'd rather it didn't come to that." } },
      choices = {
        { text = "I'll drive them off, but only if words fail.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Words always fail with goblins. I'll start with the axe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The plainstriders drink from the wells and sicken, and the wolves that eat them sicken in turn, and so the poison spreads across the plains. Bring down the sick ones mercifully when you find them, and help me cleanse the wells so the next ones drink clean." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from the wells near the goblin camps. I couldn't bear to see a hunter's companion fall to that poison too." },
      },
      choices = {
        { text = "I'll put the sick beasts down mercifully, Mull.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sick beasts are easy kills. I'll take them for hides.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would you? The goblins swear it's only water from their drills, but I've tasted the wells and I know better, so find out what they're pouring and where, and I'll know which well to save first." },
      },
      choices = {
        { text = "I'll wreck their drills while I'm in there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll find the truth and let the elders confront them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Who poisoned the wells?", next = "who" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I've asked myself that, because I'd take help from almost anywhere now. But the wells are alive in a way your magic doesn't understand, and I'd rather see them healed slowly by the Earth Mother than quickly by something that doesn't know what it's healing." },
      },
      choices = {
        { text = "Then I'll leave the healing to the Earth Mother.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Slow healing means more poisoned water. Let me try.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who's poisoning the wells?", next = "who" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mull Thunderhorn, and the sacred wells of Mulgore are sick. Goblins set up beside them, and now the water tastes of oil and worse." },
        { id = "h_poison", tags = { "news" }, when = { questActive = TODO_QUEST("Poison Water") },
          text = "The creatures that drink from the wells are sickening too. Bring me proof of it, so I know how deep the poison runs." },
        { id = "h_cleanse", when = { any = { { questActive = TODO_QUEST("Winterhoof Cleansing") }, { questActive = TODO_QUEST("Thunderhorn Cleansing") }, { questActive = TODO_QUEST("Wildmane Cleansing") } } },
          text = "Take the totem to the well and let it work. The earth remembers clean water; we only have to remind it." },
        { id = "h_totem", when = { any = { { questActive = TODO_QUEST("Thunderhorn Totem") }, { questActive = TODO_QUEST("Wildmane Totem") } } },
          text = "A totem must be made before a well can be cleansed. Gather what it needs, and I'll do the rest." },
        { id = "h_walk", when = { metBefore = true }, text = "I walked to every well this morning, and my hooves ache, and the water's no better. Tomorrow I'll walk again." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The goblins by the wells hire bruisers to guard their drills, and I'd sooner a warrior of the Horde dealt with them than any of my braves." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have seen what the goblins' oil has done to the beasts near the wells, then, and I wish I hadn't." },
      },
      choices = {
        { text = "Who poisoned them?", next = "who" },
        { text = "I could slip into the goblin camp and see what they're dumping.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could a mage purify the water, Mull?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Who guards the goblin drills, Mull?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What has the oil done to the beasts, Mull?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'll help cleanse them.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Goblin oil means goblin coin, and I won't stand in its way.", next = "END", fx = { align = { light = -1 } } },
        { text = "The water spirits are frightened. I can hear them.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Can a druid help the land heal the wells?", next = "druid", when = { class = "DRUID" } },
      },
      again = {
        { id = "h_again", text = "Something more? Forgive me; half my mind is still at the wells." },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "You can? Then tell me what they're saying, because I only feel the wrongness through the totem, and you hear it plainly. Do they blame us, for letting the goblins near?" },
      },
      choices = {
        { text = "They don't blame you. They're only confused.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "They blame anyone who did nothing.", next = "shaman_blame" },
      },
    },
    shaman_blame = {
      lines = { { id = "sb_default", text = "Then they're right, and I'll do more than walk to the wells and worry. Carry the totems for me, and let them see that someone is doing something." } },
      choices = { { text = "I'll carry them.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The land under the wells is healthy still; it's the water that's been fouled from above. A druid can tend the grass around them while the totems do their work, and I'd be grateful for it." } },
      choices = { { text = "I'll tend the grass.", next = "BACK", fx = { affinity = 2 } } },
    },
    who = {
      lines = { { id = "w_default", text = "The Venture Company, with their machines and their spills. They don't mean it, I think; they simply don't care, and somehow that's worse." } },
      choices = { { text = "It is.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, my thoughts are with the water. Ask Baine." } },
    venture_company = { { id = "tp_venture", text = "They wanted to mine our mountains, and we said no, so they took the wells instead. That is how they listen." } },
  },
}

P:NPC {
  key = "ahab", id = TODO_NPC("Ahab Wheathoof"), name = "Ahab Wheathoof",
  bible = "bibles/mulgore.md", role = "farmer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "anxious" }, values = { "kind" },
  notices = { "pet" },
  impression = {
    first = "Ahab Wheathoof cannot go two sentences without asking after his dog Kyle. It is plain the scruffy creature is his best friend in all the world.",
    third = "{name} met Ahab Wheathoof, a kindly rancher by the lake near Bloodhoof whose dog Kyle has a habit of running off.",
  },

  greetings = {
    { id = "g_kyle", text = "Oh! Hello, traveler, you haven't seen a dog, have you? He's brown and scruffy, and he never sits still." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you seen any sign of him, any at all?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine companion you have. Keep him close, and don't ever let him wander off." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scruffy and brown and always hungry, with a tail that never stops wagging. He ran off after the smell of something tasty, and I'm afraid the wolves or the swoops might mistake him for supper, so a strong warrior keeping an eye out would ease my mind." } },
      choices = {
        { text = "I'll keep an eye out for Kyle, Ahab.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A lost dog isn't a warrior's concern, Ahab.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Kyle wants to be found, I'm sure of it, he's just got his nose in something he shouldn't. He loves tender meat more than he loves me, the scamp, so if you see a scruffy tail wagging by the lake, that's my boy." },
      },
      choices = {
        { text = "I'll find him, Ahab. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If I find him, I'll expect something for my trouble.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's Kyle like?", next = "kyle" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "If you can, you're a better mage than any I've heard of. Kyle doesn't answer to spells, he answers to tender meat, and he'll come running for a good bit of wolf if you leave it where he can smell it." },
      },
      choices = {
        { text = "Then I'll look the old way, for Kyle's sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Magic can find anything. I'll show you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What does Kyle look like?", next = "kyle" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ahab Wheathoof, and I keep a little ranch by the lake. I kept a dog, too, Kyle, until he ran off, and he's never been gone this long." },
        { id = "h_kyle", tags = { "news" }, when = { questActive = TODO_QUEST("Kyle's Gone Missing!") },
          text = "If you find him, he'll be hungry; he's always hungry. Bring him something tasty and he'll follow you anywhere." },
        { id = "h_kyle_done", when = { questDone = TODO_QUEST("Kyle's Gone Missing!") },
          text = "He's home! Look at him, Kyle, sit, Kyle, sit, oh, he won't sit and I don't care one bit. He's home!" },
        { id = "h_fence", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), metBefore = true }, text = "Kyle chewed through the fence again, but he didn't go anywhere; he just likes chewing fences. I've stopped mending it." },
        { id = "h_watch", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), timeOfDay = "night" }, text = "He sleeps across the door now, like he's afraid I'll be the one to wander off. Silly dog." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman? Then maybe the spirits have seen my Kyle, because he's a scruffy little thing and he goes wherever his nose takes him." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! If you happen to see my dog Kyle while you're out fighting things, please don't fight him; he's only a little scruffy." },
      },
      choices = {
        { text = "Tell me about Kyle.", next = "kyle" },
        { text = "I'm good at finding things that don't want to be found.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can a mage find a lost dog, do you think?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does Kyle look like, Ahab?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'll keep an eye out for him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "It's only a dog.", next = "END", fx = { affinity = -2 } },
        { text = "My beast could follow Kyle's scent.", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Do the spirits ever watch over a lost dog, Ahab?", next = "xhsham", when = { class = "SHAMAN" } },
      },
      again = {
        { id = "h_again", text = "Anything else? Sorry, I keep looking at the lake shore in case he comes back." },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Could it? Oh, could it really? Here, this is the old blanket he sleeps on, so let {pet} have a good sniff. He likes the lake shore and the far end of the fields, and he never goes near the bluffs." } },
      choices = { { text = "We'll start at the lake.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
    kyle = {
      lines = {
        { id = "k_pup", text = "Found him as a pup down by the lake, soaking wet and barking at a frog. He's been barking at things ever since. Best friend I've got." },
      },
      choices = { { text = "He sounds wonderful.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I hope they do, because I leave a bowl by the door every night and every morning it's still full. If the wind carries his scent anywhere, it's probably toward the wolves, and Kyle is no match for a wolf, though he'd never believe it." } },
      choices = {
        { text = "The spirits look after small, loyal things. He'll come home.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the wolves got him, better to know and grieve now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Sorry, I can't think about anything else until Kyle's home." } },
  },
}

P:NPC {
  key = "kauth", id = TODO_NPC("Innkeeper Kauth"), name = "Innkeeper Kauth",
  bible = "bibles/mulgore.md", role = "innkeeper", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "No traveller leaves Innkeeper Kauth's inn unfed, and he keeps bringing Mull stew that goes uneaten. He swears the bluff folk come down for his stew, not the view.",
    third = "{name} rested at Innkeeper Kauth's inn in Bloodhoof Village, where nobody leaves without a bowl of stew.",
  },

  greetings = {
    { id = "g_inn", text = "Come in from the grass and the wind. There's stew, and a hide to sleep on." },
    { id = "g_home", when = { homeInn = { "Bloodhoof Village" } }, text = "Your sleeping hide is aired and ready. The wind is kind tonight." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin. Sit by the fire until the color comes back." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "The village brew is stronger than it tastes, and most learn that once." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every young brave on the way down from Camp Narache, and plenty of orcs and trolls besides, now that we stand with the Horde. They eat like kodos and sleep like stones, and the next morning they're off to fight the gnolls or the centaur without so much as a thank you." } },
      choices = {
        { text = "Thank you for your fire, Kauth. It's appreciated.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "An inn is for sleeping. I'll be gone at dawn.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider and kodo, mostly, and a prairie wolf when the hunters are feeling generous. The tauren waste no part of a beast, so I make broth from the bones and send the hides up to Una on the bluffs, and nothing goes to waste in my kitchen." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And there's always a bowl for your {pet}. Every beast that walks into Bloodhoof gets fed, same as everyone else." },
      },
      choices = {
        { text = "I'll bring my game here, and waste none of it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep my game for myself. I caught it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Easy to rob and hard to carry, friend, because it's iron and it's hot and it's bigger than you. Besides, nobody in Bloodhoof needs to steal from me, since I feed anyone who asks, and that's the best lock any inn ever had." },
      },
      choices = {
        { text = "That's a good lock. I'd never rob a kind host.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A full belly never stopped a real thief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's in the stew today?", next = "stew" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Your imp gets a bowl when the Earth Mother herself comes to supper and asks for one. I don't feed things from the Twisting Nether, friend, so it can wait outside the door and you can eat for the both of you." },
      },
      choices = {
        { text = "Fair. It waits outside, and I'll eat its share.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's hungry, and it's coming in whether you like it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What goes into the stew?", next = "stew" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kauth. Travelers come through here on the way to the bluffs, and all of them leave my inn fed." },
        { id = "h_task", when = { questActive = TODO_QUEST("A Task Unfinished") },
          text = "There's a task left undone that weighs on me. You'll carry it further than I can." },
        { id = "h_view", when = { metBefore = true }, text = "The bluff folk come down for my stew and say they're here for the view. The view's fine, but the stew's better." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wind's dropped, so listen: that's the lake against the shore, the best sound in Mulgore." },
        { id = "h_mull", when = { heardLine = "mull.h_default" }, text = "Mull's been to every well again, hasn't he? I bring him stew, and he forgets to eat it, so I bring more." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at my table! Sit near the fire, since your kind always seem to be listening to it, and I'll bring you a bowl of stew." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and I can hear your stomach from here. Sit down, friend, and let me feed you before you go off and fight something." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have game to share, I hope, because my pot's always open to a fresh plainstrider." },
      },
      choices = {
        { text = "What's in the stew?", next = "stew" },
        { text = "Do the elders still bless the hearths in Bloodhoof, Kauth?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your stew pot would be easy to rob, Kauth.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do many warriors pass through Bloodhoof, Kauth?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you cook from the plains, Kauth?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does my imp get a bowl too, Kauth?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Just a meal, thank you.", next = "END" },
      },
    },
    stew = {
      lines = {
        { id = "s_roots", text = "Tallstrider, wild roots, and whatever the hunters bring in that they can't name. Don't ask more than that; it spoils the taste." },
      },
      choices = { { text = "Smells good.", next = "END", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Old Zarlman blesses everything from the well to my stewpot, and I let him, because it only costs me a bowl. Mull won't touch the stew, but he says the fire burns cleaner since, and I'll take a compliment wherever I find one." } },
      choices = {
        { text = "Old ways keep a village whole. I'm glad he blesses it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good fire needs good wood, not blessings.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear a little of everything and keep less. Ask Baine." } },
  },
}

-- Forever's camping: the adventurer camped just outside Bloodhoof Village.
P:NPC {
  key = "kaga", id = TODO_NPC("Kaga Wildhoof"), name = "Kaga Wildhoof",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous", "brave" },
  notices = { "craft" },
  impression = {
    first = "Kaga Wildhoof wanders and camps and comes home to Mulgore when the wind turns. She has met more friends at campfires than in any town, she says, and after sitting at hers I can see why.",
    third = "{name} shared a fire with Kaga Wildhoof, a wandering tauren camped outside Bloodhoof who teaches the art of a good camp.",
  },

  greetings = {
    { id = "g_fire", text = "Earth Mother's blessing, traveler. Come and sit; the fire is big enough for two." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my fire, are you? Good. Sit, and tell me where the road took you." },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work hides? Then you'll want to learn the tent. A night by a fire with a tent close by is a night well spent." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Up into the Stonetalon Mountains, out across the Barrens and down to the edge of Thousand Needles, and I've come back to Mulgore every time the wind turned. I've seen warriors guard caravans and warriors raid them, and I'll tell you the first kind sleeps a good deal better." } },
      choices = {
        { text = "Then I'll be the kind who guards caravans.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The raiders eat better, I'd wager.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you're missing the best part of camping, friend, which is the fire and whoever wanders up to it. I've met more good friends at a campfire than I've lost to bandits, and I'd rather take that wager than sleep cold and alone in the dark." },
      },
      choices = {
        { text = "Perhaps you're right. I'll light a fire tonight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Friends find you too easily. Better cold and alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What is it you love about camping?", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Ha, that's true, and I once watched a troll mage light a campfire with a snap of his fingers. Still, striking flint makes a fire feel earned, so I'll keep doing it the old way, though I won't refuse your spark if the wood is wet." },
      },
      choices = {
        { text = "The old way has its place. I'll strike flint.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Flint is a waste of time when a spell works faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you love about camping?", next = "why" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kaga Wildhoof. I wander, I camp, and I come back to Mulgore when the wind turns, and the Chief and I go back a long way." },
        { id = "h_bundle", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "A bundle from Chief Hawkwind? He never forgets a kindness. Tell him he owes me nothing, and that I said so twice." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and let it work on you. The rest comes when it comes." },
        { id = "h_narache", when = { metBefore = true }, text = "I came past Camp Narache on the way in, where the young ones were fighting boars with sticks. I gave them a few pointers, and a few bandages." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the campfire is good luck, the old wanderers used to say, because the fire burns brighter beside one of you. Sit down, and we'll test the saying." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Sit by my fire a while, because I've met warriors on every road I've ever walked, and they always have the best stories." },
      },
      choices = {
        { text = "What is it you love about camping?", next = "why" },
        { text = "My people camped under a different sky.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I hunt as I travel. Does that suit a camp?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Did the wandering bands keep shamans on the long road, Kaga?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I prefer camps with no fire, where nobody finds me.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage never needs flint to start a fire.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Where have your roads taken you, Kaga?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Earth Mother keep you.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Throw a stick on the fire while you think of it." },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Did they? I'd love to hear how a fire behaves where the wind is a spirit and not just weather. Down here it only wants to blow my sparks into the grass, and I have to talk it out of that every night." } },
      choices = { { text = "Ask it nicely. The wind listens.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It suits it best of all, because a hunter brings the supper and keeps the watch. Every camp I've shared with a hunter has eaten well and slept soundly." } },
      choices = { { text = "Then I'll bring the supper.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Every fire is a small village for a night. Whoever passes can sit at it. I've met more friends at campfires than in any town." } },
      choices = { { text = "Teach me.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every band had one, and ours sang to the earth each night before we slept, so we'd know where the water hid. Now Mulgore is home and the shamans sit up on the bluffs, and I miss hearing that singing out on the plains." } },
      choices = {
        { text = "The bluffs keep the songs safe for everyone, and that's worth something.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A shaman belongs on the open road, singing for the people.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Start with a fire, which any cook can make, and then add what your hands know how to make." } },
    _none = { { id = "tp_none", text = "I don't know. The wind hasn't told me." } },
  },
}
