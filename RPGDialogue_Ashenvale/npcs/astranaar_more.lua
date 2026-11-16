-- Astranaar, more of its people (0.37.0). Voice: bibles/ashenvale.md
-- Classic only: Sentinel Thenysil sends proven heroes on to Tyrande (Reception from Tyrande);
-- Daelyshia keeps the hippogryphs. No Silverwind Refuge, no Thenysil command (Cataclysm).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thenysil", id = TODO_NPC("Sentinel Thenysil"), name = "Sentinel Thenysil",
  bible = "bibles/ashenvale.md", role = "soldier", tier = "quest",
  communities = { "astranaar" }, temper = { "measured" }, values = { "dutiful", "devout" },
  notices = { "race", "class" },
  impression = {
    first = "Sentinel Thenysil weighs every newcomer as if she were deciding where to post them. She says little, but what she says tends to reach Darnassus.",
    third = "{name} met Sentinel Thenysil of Astranaar, who sends word of proven heroes to Tyrande Whisperwind.",
  },

  greetings = {
    { id = "g_watch", text = "Elune's light on you. Astranaar's gates are open to friends of the kaldorei, and the Sentinels decide who those are." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and in one piece. That's a habit I like to see in the people I send out." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, this deep in Ashenvale. The High Priestess once had harsh words for your people, and she has softer ones now, so earn them." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "A priest of the Light. The Sisterhood would say we pray to the same dawn by different names, and some days I believe it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Thenysil. I keep watch over Astranaar for the Sisterhood, and when someone proves themselves to the kaldorei, it is my task to see that Darnassus hears of it." },
        { id = "h_reception", tags = { "news" }, when = { questActive = TODO_QUEST("Reception from Tyrande") },
          text = "The High Priestess has heard your name, and she wishes to receive you in the Temple of the Moon. Go to Darnassus, and stand straight when you meet her, because she will be measuring you as I did." },
        { id = "h_stonetalon", when = { questDone = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "Faldreas crossed you off his list with a smile, and Keeper Albagorm speaks well of you from Stonetalon Peak. The Sentinels keep a list of their own, and your name is on it now." },
        { id = "h_tyrande", when = { questDone = TODO_QUEST("Reception from Tyrande") },
          text = "You stood before the High Priestess, and she sent word back that she was not disappointed. From her that is high praise, so take it as such." },
      },
      again = {
        { id = "h_again", text = "What else? The watch changes soon." },
        { id = "h_again2", text = "Ask. A Sentinel listens even while she watches the trees." },
      },
      choices = {
        { text = "How do you judge who's proven themselves?", next = "proven" },
        { text = "What do the Sentinels face here?", next = "warsong_t" },
        { text = "What is the High Priestess like?", next = "tyrande" },
        { text = "I trained as a Sentinel scout before I left.", next = "scout_t", when = { origin = "nightelf_sentinel_scout" } },
        { text = "Would Tyrande truly receive a human?", next = "human_t", when = { race = "Human" } },
        { text = "Elune keep the watch.", next = "END", fx = { standing = { astranaar = 1 } } },
      },
    },
    proven = {
      lines = {
        { id = "pr_default", text = "By what they do when nobody is watching them, which is harder to learn than you'd think. Raene tells me who helps her scouts, Faldreas tells me who comes back, and Pelturas tells me who was kind to his daughter." },
      },
      choices = {
        { text = "So everyone here reports to you?", next = "proven2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proven2 = {
      big = true,
      lines = {
        { id = "pr2_default", text = "They talk to me, which is not the same thing. A village at war has to know who it can trust, and I would rather learn it from neighbours than from graves." },
      },
      choices = {
        { text = "That's wise. Trust has to be earned.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "It sounds like spying on your own people.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    warsong_t = {
      lines = {
        { id = "w_default", text = "The Thistlefur in the north, who were our friends once, and the Warsong in the east, who never were. The orcs cut our trees for their war, and the furbolgs have gone mad, and Astranaar sits on its island between them." },
      },
      choices = {
        { text = "Can the Horde be reasoned with?", next = "warsong_t2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    warsong_t2 = {
      big = true,
      lines = {
        { id = "w2_default", text = "Their warchief signed a peace with the humans, and his axes keep falling in our forest all the same. I don't know whether he cannot stop them or will not, and from where I stand it hardly matters." },
      },
      choices = {
        { text = "Then they must be driven out of Ashenvale.", next = "BACK", fx = { align = { honor = -1 }, learn = { "warsong" } } },
        { text = "Some orcs keep their word. Find those ones.", next = "BACK", fx = { align = { honor = 1 }, learn = { "warsong" } } },
      },
    },
    tyrande = {
      lines = {
        { id = "ty_default", text = "She has led us alone since Malfurion went into the Dream, and she carries it as she carries everything, without complaint. She is gentle with the weak and very hard on the proud, so if you meet her, be the first and not the second." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, learn = { "sentinels" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scout_t = {
      lines = {
        { id = "sc_default", text = "Then you know what we ask of our own, and why we ask it. Raene could use someone who already knows how to keep still in the brush, so tell her I sent you." },
      },
      choices = {
        { text = "I'll go to her.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } },
        { text = "I left the Sentinels for a reason.", next = "BACK", fx = { affinity = -1, trait = { stubborn = 1 } } },
      },
    },
    human_t = {
      lines = {
        { id = "hu_default", text = "She stood beside Jaina Proudmoore at Hyjal, and she has not forgotten it, whatever her people grumble. If you have done enough for us, she will receive you as she would one of her own." },
      },
      choices = {
        { text = "Then I'll do enough.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Much of what happens in Astranaar reaches me sooner or later. Ask, and I'll tell you what a Sentinel may." },
    },
    background = { { id = "tp_bg", text = "I am a Sentinel of the Sisterhood, posted to Astranaar. My story is the watch, and the watch has no end." } },
    advice = { { id = "tp_ad", text = "Don't cross Lake Iris at night without a lantern, because the Sentinels on the bridge shoot first at shadows." } },
    sentinels = { { id = "tp_sent", text = "We answer to the High Priestess, and we stand where the forest needs us, which lately is everywhere." } },
    warsong = { { id = "tp_warsong", text = "The orcs' lumber camps are east of here, and every tree they fell is one we will not see grow again." } },
    _none = { { id = "tp_none", text = "That is not a Sentinel's business. Ask Raene, or the innkeeper; between them they hear everything." } },
  },
}

P:NPC {
  key = "daelyshia", id = TODO_NPC("Daelyshia"), name = "Daelyshia",
  title = "Hippogryph Master",
  bible = "bibles/ashenvale.md", role = "flightmaster", tier = "service",
  communities = { "astranaar" }, temper = { "wry" }, values = { "dutiful" },
  notices = { "race" },
  impression = {
    first = "Daelyshia keeps the hippogryphs on Astranaar's island and keeps a sharp eye on the eastern sky. She flies her birds low over the trees, and doesn't apologise for it.",
    third = "{name} met Daelyshia, the hippogryph master of Astranaar.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. The birds are ready if you are, and I'd go before the wind turns." },
    { id = "g_back", when = { metBefore = true }, text = "You again! The birds remember you, which is more than they do for most." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Promise me you won't try to improve the harness. The last one of your folk who tried came down in Lake Iris." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Daelyshia, and I keep Astranaar's hippogryphs. They'll take you north to Auberdine, and to other roosts once you've walked the roads to find them." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I'll fly them by night if you insist, but they don't like the dark over the eastern woods, where the Warsong's fires burn." },
      },
      again = {
        { id = "h_again", text = "Anything else, or are we flying?" },
        { id = "h_again2", text = "Go on. The birds are in no hurry, even if you are." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why fly so low over the trees?", next = "low" },
        { text = "How do the birds like Ashenvale?", next = "birds" },
        { text = "Can a hunter's eye help you spot trouble?", next = "hunter_d", when = { class = "HUNTER" } },
        { text = "My home's a long way off. How far can they go?", next = "far_d", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Not today.", next = "END" },
      },
    },
    low = {
      lines = {
        { id = "lo_default", text = "Because the Horde has archers in the east, and a bird against the open sky is a target. Low over the canopy, the trees hide us, and the birds know every gap." },
      },
      choices = {
        { text = "Have the orcs ever brought one down?", next = "low2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    low2 = {
      lines = {
        { id = "lo2_default", text = "Not one of mine, and not for want of trying. I lost a saddle to an arrow last spring, and I keep it on the wall so the birds and I both remember." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    birds = {
      lines = {
        { id = "bi_default", text = "This is their home, and they love it as we do. They are bred in these woods, and they'd sooner nest in a burning tree than leave it, which is more loyalty than some people manage." },
      },
      choices = {
        { text = "They sound like Sentinels.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_d = {
      lines = {
        { id = "hd_default", text = "It can, and Raene's scouts already tell me where the Warsong are thickest. If you see smoke where there shouldn't be any, tell her first and me second, and I'll route the birds around it." },
      },
      choices = { { text = "I'll keep watch for smoke.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } } },
    },
    far_d = {
      lines = {
        { id = "fd_default", text = "Not across the sea, I'm afraid; for that you'll want the Bravery out of Auberdine. But they'll get you to the boat faster than your own legs, and drier too." },
      },
      choices = { { text = "Faster and drier will do.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raise hippogryphs and fly them where Astranaar needs them. That keeps me busy enough." } },
    advice = { { id = "tp_ad", text = "If you're flying east, keep your head down and let the bird do the thinking." } },
    _none = { { id = "tp_none", text = "I keep birds, not answers. Kimlya at the inn hears more than I do." } },
  },
}
