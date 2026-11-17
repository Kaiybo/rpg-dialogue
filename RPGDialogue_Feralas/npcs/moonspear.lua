-- Latronicus and Vestia Moonspear, husband and wife at Feathermoon Stronghold (0.72.0).
-- Voice: bibles/moonspear.md. He fights the Hatecrest naga for Shandris; she reads the things he brings home.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "latronicus", id = TODO_NPC("Latronicus Moonspear"), name = "Latronicus Moonspear",
  bible = "bibles/moonspear.md", role = "soldier", tier = "quest",
  communities = { "feathermoon" }, temper = { "brisk", "stern" }, values = { "dutiful", "loyal" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Latronicus Moonspear runs Feathermoon's war on the naga for General Feathermoon, and has no patience for chatter. Under the brusque manner he is fond of his wife and proud of his island.",
    third = "{name} met Latronicus Moonspear, Shandris Feathermoon's second, who leads Feathermoon's fight against the Hatecrest naga.",
  },

  greetings = {
    { id = "g_default", text = "State your business. The naga don't stop for pleasantries, so neither do I, and my boots have been full of seawater since dawn." },
    { id = "g_scales", when = { questActive = TODO_QUEST("Against the Hatecrest") }, text = "Ten Hatecrest scales, in good condition. You know how to get them." },
    { id = "g_shalzaru", when = { questDone = TODO_QUEST("Against Lord Shalzaru") }, text = "Ah, the one who put Shalzaru down. You're welcome on this island any time, and I mean that." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the naga have been busy in that time. I hope you have too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Sentinels tell me you've been of use around the Stronghold. Good; there's always more to do." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word is you've put someone's back up here. Sort it out, because I've no time to referee." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like a soldier, which is more than I can say for most who wash up on this island." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's in tatters. See Pratt before you go anywhere near Sardor's shore, or the naga will finish what someone else started." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Latronicus Moonspear, and I serve General Feathermoon and this Stronghold. If you're here to fight the naga, you're welcome, and if you're here for chit-chat, I'm afraid I'm unavailable." },
        { id = "h_fs", when = { questActive = TODO_QUEST("Feathermoon Stronghold") },
          text = "So the city sent you. Good, because we need every blade we can get, and the city sends us precious few." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Against the Hatecrest") },
          text = "Whatever the naga are doing at Solarsal, sooner or later they'll move to take this island for their own. I intend to counter that before it's too late." },
        { id = "h_scales", tags = { "news" }, when = { questRecent = { TODO_QUEST("Against the Hatecrest"), days = 3 } },
          text = "Those scales were more than satisfactory; I sent them down to Pratt to see what he can make of them. You've cut your teeth on the naga now." },
        { id = "h_shalzaru", tags = { "news" }, when = { questActive = TODO_QUEST("Against Lord Shalzaru") },
          text = "Lord Shalzaru is one of the crueler of their royals, and he's dug something up in a cave on the Isle of Dread. Stop him, and bring me what he found." },
        { id = "h_relic", when = { questActive = TODO_QUEST("Delivering the Relic") },
          text = "Take the relic to Vestia; she's just around the bend, no doubt with her nose in a book. I couldn't make heads or tails of it if there were a wager on it." },
        { id = "h_web", when = { questActive = TODO_QUEST("Lethtendris's Web") },
          text = "Lethtendris is in the satyrs' quarter of the old city, weaving her web of stolen magic. Bring it here, and we'll let that power go back into the wild before it does harm." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of our own, good. You'll understand why I don't let the island go unwatched for a single night." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick." },
        { id = "h_again2", text = "Go on. I can spare a moment more." },
      },
      choices = {
        { text = "What are the naga doing at Solarsal?", next = "naga" },
        { text = "Shandris says you complain more than she does.", next = "shandris" },
        { text = "You speak fondly of this Vestia.", next = "vestia" },
        { text = "Any word of the missing courier?", next = "courier" },
        { text = "Night elves aren't warmongers. Why strike first?", next = "strike" },
        { text = "I've fought naga before. What should I know?", next = "veteran", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Give me a task.", next = "BUSINESS" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    naga = {
      lines = { { id = "n_default", text = "Digging, mostly, in the old ruins across the water, and our scouts can't tell us what for. Royalty walks among their ranks and gives the orders, which means whatever they want, they want it badly." } },
      choices = {
        { text = "Who leads them?", next = "naga_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_lead = {
      lines = { { id = "nl_default", text = "A handful of their lords and ladies, each crueler than the last. Bring one of them down and you set their plans back weeks, if not months, and I'll take months gladly." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    shandris = {
      lines = { { id = "sh_default", text = "Does she now? Then she's been sleeping more than she lets on, which I'll take up with her. The General and I have kept this island watched since the day we landed, and neither of us has slept well since." } },
      choices = { { text = "Something else, Latronicus.", next = "BACK", fx = { affinity = 1 } } },
    },
    vestia = {
      lines = { { id = "v_default", text = "My wife, a fine priestess for this community and one of the most learned scholars you'll find anywhere. When I bring home something I don't understand, which is often, it goes to Vestia." } },
      choices = {
        { text = "She calls you Latro, doesn't she?", next = "vestia_latro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vestia_latro = {
      lines = { { id = "vl_default", text = "She does, and so do my friends, and you are neither yet. Earn it on the shore, and we'll see." } },
      choices = { { text = "Then I'll go and earn it, Latronicus.", next = "BACK" } },
    },
    courier = {
      lines = { { id = "c_default", text = "Nothing, and it's been more than a week, so I've had to declare him missing in action. Ginro Hearthkindle hasn't given up, though; speak with him, if you've time to spare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strike = {
      big = true,
      lines = { { id = "st_default", text = "We night elves are dedicated to peace and harmony, and that doesn't mean we wait politely for our throats to be cut. I'll protect this Stronghold's interests before the naga come for them, and that is my duty to the General." } },
      choices = {
        { text = "Striking first is how a careful soldier survives.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Striking first makes you the aggressor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    veteran = {
      lines = { { id = "ve_default", text = "Watch their sirens, because a naga warrior will hold you while the siren behind him does the killing. And never fight them waist-deep in the water, however good the footing looks." } },
      choices = { { text = "Good advice. Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A soldier of Darnassus, General Feathermoon's second, and Vestia's husband. In that order on duty, and the other order off it." } },
    advice = { { id = "tp_ad", text = "Assume your enemy will come for what's yours, and act before they do. Hope is not a defense." } },
    sentinels = { { id = "tp_sent", text = "The finest soldiers on Kalimdor, and the General is the finest of them. I'll argue the point with anyone." } },
    _none = { { id = "tp_none", text = "I've no time for that. Ask Shyria at the inn; she hears everything and has the time to repeat it." } },
  },
}

P:NPC {
  key = "vestia", id = TODO_NPC("Vestia Moonspear"), name = "Vestia Moonspear",
  bible = "bibles/moonspear.md", role = "scholar", tier = "quest",
  communities = { "feathermoon" }, temper = { "warm", "precise" }, values = { "curious", "kind" },
  notices = { "lore", "priest" },
  impression = {
    first = "Vestia Moonspear is a priestess and scholar who studies whatever strange things her husband brings back from the naga ruins. She is warm, quick, and blushes a little when she calls him Latro.",
    third = "{name} met Vestia Moonspear, a priestess and scholar of Feathermoon Stronghold and Latronicus Moonspear's wife.",
  },

  greetings = {
    { id = "g_default", text = "Yes, may I help you? Forgive the books; they multiply when I'm not looking." },
    { id = "g_relic", when = { questDone = TODO_QUEST("Delivering the Relic") }, text = "Still working on that relic of yours, I'm afraid. It's being very stubborn, much like the man who sent it." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and I've filled another notebook in that time. Come and tell me where you've been." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People here speak warmly of you, and in Feathermoon that's no small thing. Elune's blessings on you." },
  },

  notice = {
    { id = "n_lore", cat = "lore", when = { class = "MAGE" },
      text = "You've the look of someone who reads, and probably someone who reads things they shouldn't. I won't tell." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A fellow priest! Then you'll forgive me if I ask how you keep your prayers and your studies from fighting each other." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Vestia, a priestess of this community, and a scholar when the community lets me be one. My husband says I'd read the naga's shopping lists if he brought them home, and he isn't wrong." },
        { id = "h_relic", when = { questActive = TODO_QUEST("Delivering the Relic") },
          text = "Hold on, you're the one who's been helping General Feathermoon and Latro with the naga, aren't you? Erm, Latronicus, I mean. Do you have something for me from him?" },
        { id = "h_relic_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Delivering the Relic"), days = 3 } },
          text = "That relic from Solarsal doesn't belong there, I'm nearly sure of it, and it isn't of naga design either. It will take time, but I mean to find out what it is." },
        { id = "h_npriest", when = { race = "NightElf", class = "PRIEST" },
          text = "A sister of the moon, or nearly! Sit down, please, and tell me what news there is from the Temple." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I'm happy to put the book down." },
        { id = "h_again2", text = "Ask away. I've been talking to parchment all morning." },
      },
      choices = {
        { text = "What do you make of the relic?", next = "relic", when = { questDone = TODO_QUEST("Delivering the Relic") } },
        { text = "What are you studying?", next = "study" },
        { text = "Tell me about Latro.", next = "latro" },
        { text = "The naga seem to be digging in the ruins.", next = "naga" },
        { text = "How do you balance prayer and study?", next = "priest", when = { class = "PRIEST" } },
        { text = "Do you have anything for me?", next = "BUSINESS" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    relic = {
      lines = { { id = "r_default", text = "It's strange, very strange, and it's giving me a headache. It doesn't match the ruins it came from, and it isn't naga work, and I'm afraid it's something altogether more alien than either." } },
      choices = {
        { text = "Alien? How so?", next = "relic_alien" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relic_alien = {
      lines = { { id = "ra_default", text = "The workmanship follows no school I know, and I know a great many. When I've studied it properly I may have need of you again, if you're still around." } },
      choices = {
        { text = "Some things are better left unstudied.", next = "relic_stance" },
        { text = "I'll come back when you know more.", next = "relic_stance" },
      },
    },
    relic_stance = {
      big = true,
      lines = { { id = "rs_default", text = "Perhaps, but not knowing has never kept anyone safe that I've heard of. The naga dug this out of the ground for a reason, and I'd rather understand that reason than be surprised by it." } },
      choices = {
        { text = "Knowledge is the best shield we have. Keep at it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Be careful. Some secrets are buried for a reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "Whatever comes to hand, which out here means the ruins of Solarsal and the sea's leavings. The highborne built along this coast long ago, and the naga are digging up what's left of it." } },
      choices = {
        { text = "The highborne? Isn't that dangerous ground?", next = "study_high" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study_high = {
      lines = { { id = "sh_default", text = "It is, and I study it the way one studies a disease, carefully and without falling in love with it. The highborne's magic nearly ended our people once, and remembering that is half of why I read." } },
      choices = { { text = "A wise way to put it.", next = "BACK", fx = { affinity = 1 } } },
    },
    latro = {
      lines = { { id = "l_default", text = "He's brusque and tired and very good at what he does, and he's kinder than he lets anyone see. He brings me puzzles the way other husbands bring flowers, and I like puzzles better." } },
      choices = { { text = "He seems lucky to have you.", next = "BACK", fx = { affinity = 1 } } },
    },
    naga = {
      lines = { { id = "n_default", text = "They are, and that is what I lose sleep over. They're not simply raiding; they're excavating, carefully, as if they know exactly what they're looking for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "I don't think they fight at all. Elune gave us minds, and I can't believe she wants them left on the shelf." } },
      choices = { { text = "I agree, Vestia.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess, a scholar and Latro's wife. I've been asked which matters most, and I've never managed an answer." } },
    advice = { { id = "tp_ad", text = "Write things down. Memory is a kind priestess but a poor scholar." } },
    highborne = { { id = "tp_hb", text = "Brilliant and reckless, and their reckless brilliance broke the world. I study them so I'm never tempted to admire them." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't in any of my books. Not yet, at least." } },
  },
}
