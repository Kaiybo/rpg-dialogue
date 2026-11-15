-- Arathi Highlands: Refuge Pointe (Alliance) and Hammerfall (Horde). Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nials", id = TODO_NPC("Captain Nials"), name = "Captain Nials",
  bible = "bibles/arathi.md", role = "soldier", tier = "major",
  communities = { "refuge_pointe" }, temper = { "firm" }, values = { "dutiful", "proud" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_tent", text = "Captain Nials. Make it quick; the highlands don't wait, and neither do I." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the hills. What did you find?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been fighting. Good. Mend and go again. We've no spare soldiers, so we use every one." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "One of ours, from the south? Stromgarde stood beside Stormwind in the last war. Remember it, if anyone there forgets." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Nials. Stromgarde's keep fell in the Third War, and these tents are most of what our kingdom still holds. We're here to win the rest back." },
        { id = "h_badges", tags = { "news" }, when = { questActive = TODO_QUEST("Stromgarde Badges") },
          text = "The Syndicate's assassins took the badges off our dead. Bring them back. Their families deserve that much." },
        { id = "h_plea", when = { questActive = TODO_QUEST("Plea To The Alliance") },
          text = "Take our plea to the Alliance. Tell them Stromgarde still stands, in tents if not in stone." },
        { id = "h_northfold", when = { questActive = TODO_QUEST("Northfold Manor") },
          text = "Northfold Manor's crawling with Syndicate. Clear it. Every house they hold is one more we have to win back." },
        { id = "h_badges_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Stromgarde Badges"), days = 3 } },
          text = "The badges went out with the last rider south. Some families will open a letter this month and finally know. Thank you. I don't say it often." },
      },
      again = { { id = "h_again", text = "What else? Briefly." }, { id = "h_again2", text = "Go on. The tent can wait. The hills can't." } },
      choices = {
        { text = "Why not leave and regroup?", next = "leave" },
        { text = "Who holds the keep now?", next = "keep" },
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "There's a Horde camp east of here.", next = "hammerfall" },
        { text = "Lordaeron fell too. I know what that's like.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Put me in the line, Captain.", next = "line", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Let me bless the badges before they go home.", next = "priest_badges", when = { class = "PRIEST", questActive = TODO_QUEST("Stromgarde Badges") } },
        { text = "I'll fight for Stromgarde.", next = "END", fx = { affinity = 2, align = { honor = 1 }, standing = { refuge_pointe = 1 } } },
      },
    },
    leave = {
      big = true,
      lines = {
        { id = "l_default", text = "Because if we leave, nobody comes back. Others have asked me to send soldiers to guard the bridges and the passes. I said no. Duty keeps us here." },
      },
      choices = {
        { text = "The bridges matter too.", next = "leave_bridge", fx = { align = { order = 1 } } },
        { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
      },
    },
    leave_bridge = {
      lines = { { id = "lb_default", text = "To someone. Not to Stromgarde. If the Alliance wants the Thandol Span guarded, the Alliance can send the guards. I've none to spare and I won't pretend otherwise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "Syndicate in the halls, ogres in the yard, trolls on the walls. Everyone but the people it belongs to. I can see the towers from the ridge. I go and look, some evenings." } },
      choices = {
        { text = "You'll take it back.", next = "BACK", fx = { affinity = 2 } },
        { text = "With what army?", next = "keep_army", fx = { trait = { skeptical = 1 } } },
      },
    },
    keep_army = {
      lines = { { id = "ka_default", text = "This one. Small, stubborn and still here. And whoever walks in off the road willing to help. Today, that's you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    syndicate = {
      lines = { { id = "s_default", text = "Alterac's leftovers. Nobles who lost their kingdom and found a trade in knives. They rob the dead and call it business." } },
      choices = {
        { text = "Why take the badges?", next = "syndicate_badges" },
        { text = "Then they'll answer for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    syndicate_badges = {
      lines = { { id = "sb_default", text = "To sell, or to wear, or to walk into a village as one of ours. I don't know which. I know the families get nothing to bury." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hammerfall = {
      lines = { { id = "h2_default", text = "Hammerfall. It was a camp for orc prisoners, once. They broke it open and kept the ruins. We leave each other alone, most days. Most days is enough, for now." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { opinion = { peace = "for" } } },
        { text = "They should be driven out.", next = "BACK", fx = { align = { order = 1 }, opinion = { peace = "against" } } },
      },
    },
    lordaeron = {
      lines = { { id = "lo_default", text = "Then you know the worst part isn't losing it. It's the people who tell you to stop looking at what you lost. Don't stop. Not yet." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 } } } },
    },
    line = {
      lines = { { id = "ln_default", text = "Northfold first. Then the farms past it. Then, one day, the keep. Stand where I tell you and don't retreat unless I do. I won't." } },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 2, standing = { refuge_pointe = 1 } } } },
    },
    priest_badges = {
      lines = { { id = "pba_default", text = "The families need their dead back, and a blessing is the next best thing. Bless them, and I'll write in every letter that a priest stood over each one." } },
      choices = {
        { text = "Every one.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { refuge_pointe = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Soldier of Stromgarde, captain of what's left of it. That's the whole of my story until the keep is ours again.", next = "keep" } },
    advice = { { id = "tp_ad", text = "Never sleep in the open in the highlands. Ogres, trolls or Syndicate: one of them is always awake." } },
    _none = { { id = "tp_none", text = "Not Stromgarde's concern. Ask someone with more soldiers than we have." } },
  },
}

P:NPC {
  key = "drumfel", id = TODO_NPC("Drum Fel"), name = "Drum Fel",
  bible = "bibles/arathi.md", role = "soldier", tier = "major",
  communities = { "hammerfall" }, temper = { "driven" }, values = { "loyal", "ambitious" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_fort", text = "You're in Hammerfall. Here we fight, and soon we'll prosper. Which are you here for?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. The hills won't clear themselves." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, brother. Doomhammer fell on this ground setting us free. We owe him a fortress worth the price." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Boulderfist clubs, or Witherbark spears? Mend, then answer them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drum Fel. I lead Hammerfall. The Boulderfist ogres and the Witherbark trolls stand between us and the highlands. Once they fall, Hammerfall will thrive." },
        { id = "h_hammer", tags = { "news" }, when = { questActive = TODO_QUEST("The Hammer May Fall") },
          text = "The Boulderfist hit our walls and think we'll sit and take it. Show them otherwise." },
        { id = "h_arms", when = { questActive = TODO_QUEST("Call to Arms") },
          text = "A call to arms. The Witherbark first, then whoever's next. Hammerfall doesn't wait to be attacked." },
      },
      choices = {
        { text = "Tell me about this place.", next = "history" },
        { text = "I'll fight.", next = "END", fx = { affinity = 2, standing = { hammerfall = 1 } } },
      },
    },
    history = {
      big = true,
      lines = {
        { id = "hi_default", text = "The humans built a camp here to hold our people in chains. Thrall and Doomhammer tore it down. Doomhammer took a lance in that fight and didn't survive it. We rebuilt on the ruins and named it for him." },
      },
      choices = { { text = "Lok'tar ogar.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Not here. Doomhammer would have broken their necks himself." } },
    _none = { { id = "tp_none", text = "Not my concern. Hammerfall is." } },
  },
}

P:NPC {
  key = "zengu", id = TODO_NPC("Zengu"), name = "Zengu",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "patient" }, values = { "loyal", "brave" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_hunt", text = "Sit, sit. Zengu be patient. A good hunter always be patient." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Another hunter. Good. You know the waiting part of the hunt be longer than the killing part." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Then you know who sent me. The chief want something, and Zengu be bringing it home." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zengu, of the Darkspear. Vol'jin send me for a sword, Trol'kalar, made by humans to kill trolls. We going to use it against the Gurubashi. A fine joke, mon." },
        { id = "h_trollbane", tags = { "news" }, when = { questActive = TODO_QUEST("Trollbane") },
          text = "The sword sleep in Trollbane's tomb, in Stromgarde. The humans guard it. We going to need a key first." },
        { id = "h_sigil", when = { any = { { questActive = TODO_QUEST("Sigil of Strom") }, { questActive = TODO_QUEST("The Broken Sigil") }, { questActive = TODO_QUEST("Sigil of Thoradin") }, { questActive = TODO_QUEST("Sigil of Arathor") }, { questActive = TODO_QUEST("Sigil of Trollbane") } } },
          text = "The sigil be broken in pieces, all over these hills. Bring the pieces. A key that open a tomb don't come easy." },
        { id = "h_trolkalar", when = { questActive = TODO_QUEST("Trol'kalar") },
          text = "Trol'kalar. Bring it out of that tomb, and the chief will hear your name." },
      },
      choices = { { text = "A human sword against trolls?", next = "joke" } },
    },
    joke = {
      lines = { { id = "j_default", text = "Every blade cut whoever be in front of it, mon. The humans forgot that. Zengu didn't." } },
      choices = { { text = "Ha. Let's get it.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "The chief's boy. Bad business, in the jungle. Nimboya see to it. I see to this." } },
    echo_isles = { { id = "tp_isles", text = "One day, mon. First the sword, then the rest." } },
    _none = { { id = "tp_none", text = "Zengu only know the hunt. And the sword." } },
  },
}

P:NPC {
  key = "adegwa", id = TODO_NPC("Innkeeper Adegwa"), name = "Innkeeper Adegwa",
  bible = "bibles/arathi.md", role = "innkeeper", tier = "service",
  communities = { "hammerfall" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Come, rest. Hammerfall is hard stone, but there's a soft hide by my fire." },
    { id = "g_home", when = { homeInn = { "Hammerfall" } }, text = "Welcome back to Hammerfall. Your place by the fire is waiting." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You carry the spirit healer's chill still. Sit close to the fire. It fades." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Adegwa. A tauren among orcs, far from Mulgore's grass. Every fort needs a fire, and this one is mine." },
        { id = "h_grass", when = { metBefore = true }, text = "I keep a little pot of Mulgore grass by the door. It doesn't like the Highlands. Neither did I, at first. We're both getting used to it." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The grunts sing old war songs after dark. I don't know the words. I hum. They let me." },
      },
      choices = { { text = "Just a rest, thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Drum Fel. He knows the fort. I know the fire." } },
  },
}
