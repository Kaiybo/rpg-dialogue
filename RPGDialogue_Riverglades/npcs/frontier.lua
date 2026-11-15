-- Outside Farholde's walls: Turner's Logging Camp and Wheeler's Grange. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hurley", id = TODO_NPC("Hurley"), name = "Hurley",
  bible = "bibles/riverglades.md", role = "worker", tier = "quest",
  communities = { "farholde" }, temper = { "nervous" }, values = { "loyal", "kind" },
  notices = { "kit" },

  impression = {
    first = "Hurley worries for a living, or so it seemed, and most of his worrying is about Curly. He cuts trees for Turner and looks as if he hasn't slept properly in a month.",
    third = "{name} met Hurley, a fretful logger at Turner's camp who looks out for his friend Curly.",
  },

  greetings = {
    { id = "g_default", text = "Mind the stumps." },
    { id = "g_curly", text = "You haven't seen Curly, have you? No, of course you haven't." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like Curly after a lunch break. Sit down before something else falls off you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Hurley. I cut trees for Turner and keep Curly from getting himself killed, and the trees are the easy part." },
        { id = "h_helping", tags = { "news" }, when = { questActive = TODO_QUEST("Helping Hands") },
          text = "Come on, come on. Curly's in trouble out there and we haven't much time." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "Curly's on his feet, mostly. He says thank you, and he also says he had it handled, which he didn't." },
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
      lines = { { id = "c_default", text = "He's my partner, strong as an ox with the sense of a smaller one. I've found two gray hairs this month, and both have his name on them." } },
      choices = {
        { text = "Why keep working with him?", next = "curly_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curly_why = {
      lines = { { id = "cw_default", text = "Because he'd do the same for me, and because nobody else will hold the other end of the saw." } },
      choices = { { text = "That's a good reason.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    raids = {
      lines = { { id = "r_default", text = "Somebody's been at the woodpiles at night, and spear-length pieces have gone missing. Halligan thinks it's the Horde. I think so too, but I like to let Halligan be right first." } },
      choices = {
        { text = "I'll keep watch.", next = "BACK", fx = { affinity = 1, standing = { farholde = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    logging = {
      lines = { { id = "l_default", text = "Good timber, bad neighbours. Every beam in Farholde's walls came out of these woods, and probably every arrow in the cultists' quivers too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curly_after = {
      lines = { { id = "ca_default", text = "Bandaged, grumpy, and eating for three. Halligan's docking his pay for the axe he lost, and he'll pay it, and I'll help." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a logger, with an axe in my hands since I was twelve, and a worrier since I met Curly." } },
    advice = { { id = "tp_ad", text = "If you hear singing in the woods and it isn't us, run." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Halligan; he knows things, or says he does." } },
  },
}

P:NPC {
  key = "halligan", id = TODO_NPC("Halligan Turner"), name = "Halligan Turner",
  bible = "bibles/riverglades.md", role = "worker", tier = "quest",
  communities = { "farholde" }, temper = { "gruff" }, values = { "stern", "loyal" },
  notices = { "kit", "class" },

  impression = {
    first = "Halligan Turner runs his logging camp like a sergeant and seems to think anyone standing still owes him an hour's work. I'd wager he's softer on his people than he lets them see.",
    third = "{name} met Halligan Turner, the gruff boss of the logging camp that feeds Farholde its timber.",
  },

  greetings = {
    { id = "g_default", text = "If you're buying, talk. If you're standing around, there's an axe." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Pick up a saw or pick a direction." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Arms like that, and you swing a sword? That's a waste; you'd fell an oak in an afternoon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Halligan Turner. This camp feeds Farholde its timber, the Brotherhood keeps the cultists off it, mostly, and I keep the loggers off each other." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "You brought the kid back. He's a good worker when he isn't being an idiot, so... thanks, and that's all you're getting." },
      },
      again = { { id = "h_again", text = "What else? Daylight's money, so be quick." } },
      choices = {
        { text = "Is it safe, logging this far out?", next = "safe" },
        { text = "What's it like working for the Brotherhood?", next = "brotherhood" },
        { text = "Hurley says you're hard on Curly.", next = "curly", when = { heardLine = "hurley.h_default" } },
        { text = "I worked land like this, once.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Good day.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "No. We post a lookout, work in pairs, and sing loud so we know where everyone is. The Horde hears us too, but you can't have everything." } },
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
      lines = { { id = "b_default", text = "They pay in silver when they have it and in promises when they don't, and I've had more promises than silver this year. Brant keeps his, eventually." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
    },
    curly = {
      lines = { { id = "c_default", text = "Hard? I'm keeping him alive, and if that's hard, so be it." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Then you know how long a day is out here. Grab a saw if you get bored; I pay in stew." } },
      choices = { { text = "Maybe I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Loggers gossip worse than fishwives, and I hear all of it whether I want to or not. Ask what you want." },
    },
    background = { { id = "tp_bg", text = "This is Turner's camp. My name's on it, so the blame is too." } },
    advice = { { id = "tp_ad", text = "Never stand downhill of a falling tree, or of a falling logger." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Best customers I've got, and the only customers I've got." } },
    _none = { { id = "tp_none", text = "That's not my business; trees are my business." } },
  },
}

P:NPC {
  key = "benjy", id = TODO_NPC("Benjy Wheeler"), name = "Benjy Wheeler",
  bible = "bibles/riverglades.md", role = "farmer", tier = "quest",
  communities = { "farholde" }, temper = { "stubborn" }, values = { "practical" },
  notices = { "kit" },

  impression = {
    first = "Benjy Wheeler watches the fields at Wheeler's Grange with the look of a man who has stopped expecting good news. The clicking of the reapers out in the rows doesn't seem to let anyone there sleep.",
    third = "{name} met Benjy Wheeler at Wheeler's Grange, where harvest reapers have overrun the fields.",
  },

  greetings = {
    { id = "g_default", text = "Careful by the fence. Those reapers don't stay in the field." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Benjy Wheeler, and this is Wheeler's Grange. It was a farm, before the harvest reapers got into the fields, and now it's a farmhouse with a view of trouble." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear that clicking? That's them, all night, up and down the rows." },
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
      lines = { { id = "r_default", text = "Nobody tells a farmer that. They walk the rows like they're working them, but they're not; they're cutting anything that moves." } },
      choices = {
        { text = "What do they do at night?", next = "reapers_night" },
        { text = "I'll clear some of them out.", next = "BACK", fx = { affinity = 2, standing = { farholde = 1 } } },
      },
    },
    reapers_night = {
      lines = { { id = "rn_default", text = "They keep walking the rows, and you can hear them from the porch, click, click, click, till sunup. I've stopped noticing, and that's what worries me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stay = {
      lines = { { id = "s_default", text = "Because the house is still standing, and nobody else is going to keep it that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    farholde = {
      lines = { { id = "f_default", text = "They help when they can, but they've a war on and I've a fence, and I know which one the Commander's watching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    westfall = {
      lines = { { id = "w_default", text = "Westfall? I heard it's bad over there, so you know they don't stop for anything. Stay off the rows after dark." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer: was, is, and will be. There's nothing more to say about it that the dirt doesn't." } },
    advice = { { id = "tp_ad", text = "Stay off the rows after dark. The reapers don't sleep, and they don't ask who you are." } },
    _none = { { id = "tp_none", text = "I'm a farmer, so ask me about weather, or about reapers even, but not that." } },
  },
}
