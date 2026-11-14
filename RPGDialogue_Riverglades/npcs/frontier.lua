-- Outside Farholde's walls: Turner's Logging Camp and Wheeler's Grange. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hurley", id = TODO_NPC("Hurley"), name = "Hurley",
  bible = "bibles/riverglades.md", role = "worker", tier = "quest",
  communities = { "farholde" }, temper = { "nervous" }, values = { "loyal", "kind" },
  notices = { "kit" },

  greetings = {
    { id = "g_default", text = "Mind the stumps." },
    { id = "g_curly", text = "You haven't seen Curly, have you? No. Course not." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like Curly after a lunch break. Sit down before something else falls off you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hurley. I cut trees for Turner and keep Curly from getting himself killed. The trees are the easy part." },
        { id = "h_helping", tags = { "news" }, when = { questActive = TODO_QUEST("Helping Hands") },
          text = "Come on, come on. Curly's in trouble out there and we haven't much time." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "Curly's on his feet. Mostly. He says thank you. He also says he had it handled. He didn't." },
      },
      again = { { id = "h_again", text = "Something else? Quick, before Curly wanders off again." } },
      choices = {
        { text = "Who's Curly?", next = "curly" },
        { text = "Who's been raiding your woodpiles?", next = "raids" },
        { text = "How's the logging?", next = "logging" },
        { text = "How's Curly holding up?", next = "curly_after", when = { questDone = TODO_QUEST("Helping Hands") } },
        { text = "Good luck, Hurley.", next = "END" },
      },
    },
    curly = {
      lines = { { id = "c_default", text = "My partner. Strong as an ox, sense of a smaller ox. I've found two gray hairs this month, and both have his name on them." } },
      choices = {
        { text = "Why keep working with him?", next = "curly_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curly_why = {
      lines = { { id = "cw_default", text = "Because he'd do the same for me. And because nobody else will hold the other end of the saw." } },
      choices = { { text = "That's a good reason.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    raids = {
      lines = { { id = "r_default", text = "Somebody's been at the woodpiles at night. Spear-length pieces, gone. Halligan thinks it's the Horde. I think so too, but I like to let Halligan be right first." } },
      choices = {
        { text = "I'll keep watch.", next = "BACK", fx = { affinity = 1, standing = { farholde = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    logging = {
      lines = { { id = "l_default", text = "Good timber, bad neighbours. Every beam in Farholde's walls came out of these woods. Probably every arrow in the cultists' quivers too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curly_after = {
      lines = { { id = "ca_default", text = "Bandaged, grumpy, and eating for three. Halligan's docking his pay for the axe he lost. He'll pay it. I'll help." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Logger. Axe since I was twelve. Worrier since I met Curly." } },
    advice = { { id = "tp_ad", text = "If you hear singing in the woods and it isn't us, run." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Halligan. He knows things. Or says he does." } },
  },
}

P:NPC {
  key = "halligan", id = TODO_NPC("Halligan Turner"), name = "Halligan Turner",
  bible = "bibles/riverglades.md", role = "worker", tier = "quest",
  communities = { "farholde" }, temper = { "gruff" }, values = { "stern", "loyal" },
  notices = { "kit", "class" },

  greetings = {
    { id = "g_default", text = "If you're buying, talk. If you're standing around, there's an axe." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Pick up a saw or pick a direction." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Arms like that, and you swing a sword? Waste. You'd fell an oak in an afternoon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Halligan Turner. This camp feeds Farholde its timber, the Brotherhood keeps the cultists off it, mostly, and I keep the loggers off each other." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "You brought the kid back. He's a good worker when he isn't being an idiot. Thanks. Don't make me say it twice." },
      },
      again = { { id = "h_again", text = "What else? Daylight's money." } },
      choices = {
        { text = "Is it safe, logging this far out?", next = "safe" },
        { text = "What's it like working for the Brotherhood?", next = "brotherhood" },
        { text = "Hurley says you're hard on Curly.", next = "curly", when = { heardLine = "hurley.h_default" } },
        { text = "I worked land like this, once.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Good day.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "No. We post a lookout, work in pairs, and sing loud so we know where everyone is. The Horde hears us too. Can't have everything." } },
      choices = {
        { text = "And when they come?", next = "safe_come" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_come = {
      lines = { { id = "sc_default", text = "We drop the axes and run for the keep. Logs don't care who wins." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "They pay in silver when they have it and in promises when they don't. I've had more promises than silver this year. Brant keeps his, eventually." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
    },
    curly = {
      lines = { { id = "c_default", text = "Hard? I'm keeping him alive. If that's hard, so be it." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Then you know how long a day is out here. Grab a saw if you get bored. I pay in stew." } },
      choices = { { text = "Maybe I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Turner's camp. My name's on it, so the blame is too." } },
    advice = { { id = "tp_ad", text = "Never stand downhill of a falling tree. Or a falling logger." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Best customers I've got. Only customers I've got." } },
    _none = { { id = "tp_none", text = "Not my business. Trees are my business." } },
  },
}

P:NPC {
  key = "benjy", id = TODO_NPC("Benjy Wheeler"), name = "Benjy Wheeler",
  bible = "bibles/riverglades.md", role = "farmer", tier = "quest",
  communities = { "farholde" }, temper = { "stubborn" }, values = { "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_default", text = "Careful by the fence. Those reapers don't stay in the field." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Benjy Wheeler. This is Wheeler's Grange. It was a farm, before the harvest reapers got into the fields. Now it's a farmhouse with a view of trouble." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear that clicking? That's them. All night, up and down the rows." },
      },
      again = { { id = "h_again", text = "Anything else? I've a fence to mend." } },
      choices = {
        { text = "Where did the reapers come from?", next = "reapers" },
        { text = "Why stay?", next = "stay" },
        { text = "Farholde's close. Can't they help?", next = "farholde" },
        { text = "Harvest golems ran my family off our farm too.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Take care, Benjy.", next = "END" },
      },
    },
    reapers = {
      lines = { { id = "r_default", text = "Nobody tells a farmer that. They walk the rows like they're working them. They're not. They're cutting anything that moves." } },
      choices = {
        { text = "What do they do at night?", next = "reapers_night" },
        { text = "I'll clear some of them out.", next = "BACK", fx = { affinity = 2, standing = { farholde = 1 } } },
      },
    },
    reapers_night = {
      lines = { { id = "rn_default", text = "Keep walking. You can hear them from the porch. Click, click, click, till sunup. I've stopped noticing. That's what worries me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stay = {
      lines = { { id = "s_default", text = "Because the house is still standing, and nobody else is going to keep it that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    farholde = {
      lines = { { id = "f_default", text = "They help when they can. They've a war on. I've a fence. I know which one the Commander's watching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    westfall = {
      lines = { { id = "w_default", text = "Westfall? I heard it's bad over there. Then you know they don't stop for anything. Stay off the rows after dark." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Farmer. Was, is, will be. Nothing more to say about it that the dirt doesn't." } },
    advice = { { id = "tp_ad", text = "Stay off the rows after dark. The reapers don't sleep, and they don't ask who you are." } },
    _none = { { id = "tp_none", text = "I'm a farmer. Ask me about weather. Ask me about reapers, even. Not that." } },
  },
}
