-- Two quieter Winterspring souls: Umbranse the Spiritspeaker (a human medium in the hills northeast of Everlook)
-- and Natheril Raincaller (general goods at Starfall Village).
-- Voice: bibles/winterspring_strangers.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Umbranse the Spiritspeaker
---------------------------------------------------------------------------
P:NPC {
  key = "umbranse", id = TODO_NPC("Umbranse the Spiritspeaker"), name = "Umbranse the Spiritspeaker",
  bible = "bibles/winterspring_strangers.md", role = "scholar", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "smooth", "quiet" }, values = { "curious", "ambitious" },
  notices = { "ghost", "undead" },

  impression = {
    first = "Umbranse the Spiritspeaker lives alone in a small house in the hills northeast of Everlook and says he can speak with the dead. He is polite, soft-voiced and very interested in what the player has seen.",
    third = "{name} met Umbranse the Spiritspeaker, a human medium living in the hills of Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and close the door gently. The spirits around here are easily startled." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The spirits mentioned you might; they're often right about such things." },
    { id = "g_duke", when = { questDone = TODO_QUEST("Duke Nicholas Zverenhoff") }, text = "Gregor tells me my little book proved useful to the Argent Dawn. I'm glad; it was lonely on my shelf." },
  },

  notice = {
    { id = "n_ghost", cat = "ghost", when = { deaths = { min = 20 } },
      text = "You've crossed over more than once, haven't you? I can see it on you, the way frost stays on a window after the cold has gone. Do sit down and tell me what you saw there." },
    { id = "n_undead", cat = "undead", when = { race = "Scourge" },
      text = "Oh, how remarkable. A spirit that came back to its own body instead of drifting. You must forgive me for staring." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Umbranse, and some call me the Spiritspeaker, which is a grand name for a man who listens carefully. The dead are everywhere in Winterspring, Highborne mostly, from the old days, and if you know how to ask, they have a great deal to say." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Your sort usually wants the dead sent onward, and I usually want them to stay a little longer and talk. I hope we can be friends regardless." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've tea, if you're cold." },
        { id = "h_again2", text = "Go on. The spirits are quiet tonight, so I'm all yours." },
      },
      choices = {
        { text = "How do you speak to the dead?", next = "speak" },
        { text = "Which spirits haunt Winterspring?", next = "spirits" },
        { text = "What book did you give Gregor Greystone?", next = "book" },
        { text = "Why live out here alone?", next = "alone" },
        { text = "I've walked as a spirit myself.", next = "crossed", when = { deaths = { min = 20 } } },
        { text = "I should be going.", next = "END" },
      },
    },

    speak = {
      lines = { { id = "sp_default", text = "Patience, mostly, and a little arcane training that I picked up when I was younger and more careless. Spirits are like shy animals: they come closer if you sit very still and don't want anything too obviously." } },
      choices = {
        { text = "And what do you want from them?", next = "speak_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speak_want = {
      big = true,
      lines = { { id = "sw_default", text = "Knowledge, of course. The Highborne knew things about magic that our kingdoms have spent ten thousand years forgetting, and they're happy to share, if one is polite. Some would say the dead should be left in peace, but I think they're lonely, and I'm a good listener." } },
      choices = {
        { text = "Let the dead rest. That knowledge is theirs.", next = "speak_end", fx = { align = { light = 1 } } },
        { text = "If they'll share it, take it. Knowledge is knowledge.", next = "speak_end", fx = { align = { light = -1 } } },
        { text = "What have they told you?", next = "speak_end" },
      },
    },
    speak_end = {
      lines = { { id = "se_default", text = "A great deal, though very little of it would interest a practical person. Old spells, old quarrels, the names of rivers that have changed course since. I write it all down, and someday it will make a very long book that nobody reads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    spirits = {
      lines = { { id = "sr_default", text = "Highborne in the ruins of Kel'Theril and Mazthoril, who remember the Well and the Queen and can't decide whether they're sorry. A few kaldorei sentinels who never finished their watch. And now and then something older, which I don't call, because it doesn't come when called." } },
      choices = {
        { text = "Something older?", next = "spirits_older" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_older = {
      lines = { { id = "so_default", text = "I don't know what it is, and I've decided not to find out. There are some doors a sensible man leaves closed, and I like to think I'm sensible, most days." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },

    book = {
      lines = { { id = "bo_default", text = "Studies in Spirit Speaking, my own humble notes. Gregor Greystone of the Argent Dawn came asking after ways to reach the restless dead, and I lent it to him, because the Dawn has more need of it than my shelf." } },
      choices = {
        { text = "You trust the Argent Dawn?", next = "book_dawn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_dawn = {
      lines = { { id = "bd_default", text = "I trust that they mean well, which is not quite the same thing. They want the Scourge's dead freed, and I want the dead to talk, and for now those two wishes walk the same road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },

    alone = {
      lines = { { id = "al_default", text = "Because Everlook is very loud, and the dead are very quiet, and it's hard to hear one over the other. The yetis in the hills leave me be, and the goblins only come when they want something, which suits me well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crossed = {
      lines = { { id = "cr_default", text = "Then you've seen the grey country, and you came back from it. Tell me, when you walked there, did the other spirits speak to you, or only look? I've always wondered whether the newly dead can hear each other." } },
      choices = {
        { text = "They only looked at me.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'd rather not talk about it.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The dead of Winterspring, the Highborne, and the art of listening." } },
    highborne = { { id = "tp_hb", text = "Brilliant, proud, and very sorry, some of them. Others are only proud." } },
    argent_dawn = { { id = "tp_ad", text = "Good people, I think. Gregor has my book; I hope he's reading it." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. The living world rather passes me by." } },
  },
}

---------------------------------------------------------------------------
-- Natheril Raincaller
---------------------------------------------------------------------------
P:NPC {
  key = "natheril", id = TODO_NPC("Natheril Raincaller"), name = "Natheril Raincaller", title = "General Goods",
  bible = "bibles/winterspring_strangers.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "calm", "gentle" }, values = { "practical", "kind" },
  notices = { "cold" },

  impression = {
    first = "Natheril Raincaller sells food, water and travelling gear at Starfall Village, and he worries about every traveller who comes in from the snow. He always has something warm on the fire.",
    third = "{name} met Natheril Raincaller, who sells general goods at Starfall Village.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Starfall. Come in out of the cold; the snow will still be there when you leave." },
    { id = "g_back", when = { metBefore = true }, text = "Back safe from the hills. Elune be thanked, and come warm your hands." },
  },

  notice = {
    { id = "n_cold", cat = "cold", when = { nearlyNaked = true },
      text = "You're walking through Winterspring dressed like that? Please, sit by the fire, and then buy a cloak from someone, anyone, before you freeze." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Natheril Raincaller, and I keep Starfall supplied with food, water, thread and the little things a traveller forgets. It's a small village and a long way from Darnassus, so most of what I sell comes north through Felwood, if the furbolgs let it." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde, and this is a Darnassian village, though Everlook's goblins keep a sort of peace in these hills. I'll answer your questions, but I'd keep moving, for your own sake." },
      },
      again = { { id = "h_again", text = "Anything else? The kettle's nearly boiled." } },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What's life like in Starfall?", next = "village" },
        { text = "How do your supplies get here?", next = "road" },
        { text = "Goodbye.", next = "END" },
      },
    },
    village = {
      lines = { { id = "vi_default", text = "Quiet and cold, and very beautiful when the stars come out over the snow. Wynd keeps watch over the ruins, and the dwarves from the Explorers' League dig where they shouldn't, and I keep everyone fed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    road = {
      big = true,
      lines = { { id = "ro_default", text = "Through Timbermaw Hold, when the furbolgs are friendly, and over the mountains when they're not. Some say we should buy from the goblins in Everlook instead, but their prices would empty every purse in Starfall." } },
      choices = {
        { text = "Trust the Timbermaw. Old friends are worth it.", next = "BACK", reply = "You have a kind heart, and the Timbermaw remember kindness for longer than goblins remember a debt. When the snows close the passes, it is their paths that keep us fed.", fx = { align = { order = 1 } } },
        { text = "Buy wherever it's cheapest. Sentiment won't feed anyone.", next = "BACK", reply = "Cheap bread is still bread, I grant you, but the goblins will leave the day the coin runs thin, and the furbolgs will still be here. I would rather owe a friend than a ledger.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, the roads north, and how to keep warm." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw carry our goods through their tunnels. The Winterfall would rather eat them." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Ask Wynd; he knows the old things." } },
  },
}
