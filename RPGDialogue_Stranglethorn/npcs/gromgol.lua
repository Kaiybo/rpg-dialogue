-- Grom'gol Base Camp: the Horde's foothold on the coast, and the road to Stonard. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "aggrogosh", id = TODO_NPC("Commander Aggro'gosh"), name = "Commander Aggro'gosh",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "gromgol" }, temper = { "blunt" }, values = { "dutiful", "stern" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_camp", text = "This is Grom'gol. Everyone in Grom'gol works. Are you here to work?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Fine. There's always more to do than hands to do it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces. Get it to the forge before you go out again. A dead grunt hauls no crates." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Good. Your cousins out past the walls are less friendly. Show them what a troll of the Horde is worth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Commander Aggro'gosh. This camp keeps the road to Stonard open, and that road feeds the Horde. Ogres and Bloodscalp make it hard. I make it happen anyway." },
        { id = "h_defense", tags = { "news" }, when = { questActive = TODO_QUEST("The Defense of Grom'gol") },
          text = "Something out there tests our walls every night. Go and test it in return. Harder." },
        { id = "h_road", when = { metBefore = true }, text = "Three caravans reached Stonard this week. Three. The ogres got none of them. Write that down. I want to read it later." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Bloodscalp drums are close tonight. Let them drum. We have walls, and they have drums." },
      },
      choices = {
        { text = "How's the supply line?", next = "road" },
        { text = "What do you need most?", next = "need" },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { gromgol = 1 } } },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "Stonard sits in the swamp past the mountains. Every caravan that reaches it in one piece is a victory. I count every one." },
      },
      choices = { { text = "Then I'll help you count.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
    need = {
      lines = { { id = "n_default", text = "More grunts. Fewer ogres. One week without rain. I'll settle for the first." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "Nimboya's business. He's welcome to it, as long as he pulls his weight while he's in my camp." } },
    _none = { { id = "tp_none", text = "Not my problem. Find someone with time to talk." } },
  },
}

P:NPC {
  key = "nimboya", id = TODO_NPC("Nimboya"), name = "Nimboya",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "wary" }, values = { "loyal", "stern" },
  notices = { "race" },

  greetings = {
    { id = "g_wary", text = "Nimboya don't know you. Say what you come for, and say it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. You keep coming back, maybe you be useful." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood. Then you understand why I be here, so far from Durotar." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The chief's son be lost in this jungle. Yenniku. I come from Orgrimmar to find him, and I don't go back without him." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("Hunt for Yenniku") },
          text = "The Bloodscalp got him, I think. Find out where they keep him. Don't let them see you looking." },
        { id = "h_heads", when = { questActive = TODO_QUEST("Headhunting") },
          text = "The Bloodscalp only understand one kind of talking. Go and talk to them that way." },
        { id = "h_grim", when = { questActive = TODO_QUEST("Grim Message") },
          text = "Time the Bloodscalp learn what Darkspear do to those who take our own. Make it a message they remember." },
        { id = "h_saving", when = { questActive = TODO_QUEST("Saving Yenniku") },
          text = "This be it. Bring Yenniku back to us. Whatever they done to him, we undo it." },
        { id = "h_dream", when = { metBefore = true }, text = "Nimboya dream of Yenniku last night. Small, like when he was a boy. Nimboya wake up and sharpen the spear." },
      },
      choices = {
        { text = "Who is Yenniku?", next = "yenniku" },
        { text = "I'll help you find him.", next = "END", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "Good hunting.", next = "END" },
      },
    },
    yenniku = {
      big = true,
      lines = {
        { id = "y_default", text = "Vol'jin's youngest. He come to Stranglethorn, and the trees swallow him. The chief trust me to bring him home." },
      },
      choices = { { text = "And the Bloodscalp?", next = "bloodscalp", fx = { learn = { "yenniku" } } } },
    },
    bloodscalp = {
      lines = {
        { id = "bs_default", text = "Their witch doctor, Nezzliok, know where the boy be. Alive or dead, he going to tell me." },
      },
      choices = { { text = "Then he'll tell you.", next = "END", fx = { affinity = 2, trait = { stern = 1 } } } },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "Every day he be gone, the chief carry it. I carry it too." } },
    _none = { { id = "tp_none", text = "Nimboya got one thing on his mind. That not it." } },
  },
}

P:NPC {
  key = "kinweelay", id = TODO_NPC("Kin'weelay"), name = "Kin'weelay",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "playful" }, values = { "loyal", "curious" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_spirits", text = "The spirits told me somebody coming. They don't say who. Spirits be rude like that, mon." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the spirits remember your face. That be a fine thing. Mostly." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear them too, the ones nobody else hear? Then we talk easy, you and me." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A shapechanger. The wild spirits like you; you wear their skins with respect. The Bloodscalp won't." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "Heh! Big cat in Grom'gol, and the grunts don't even blink. You walk it well, mon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kin'weelay, witch doctor of the Darkspear. Orgrimmar send me to help Nimboya. He use his spear. I use what can't be seen." },
        { id = "h_reef", when = { questActive = TODO_QUEST("The Vile Reef") },
          text = "Under the water at the Vile Reef, old troll carving be waiting. Bring me a piece of it. Mind the sharks; they don't read." },
        { id = "h_necklaces", when = { questActive = TODO_QUEST("Bloody Bone Necklaces") },
          text = "The Skullsplitter wear bone round their necks. Bring me enough, and I make something useful out of something ugly." },
        { id = "h_fate", tags = { "news" }, when = { questActive = TODO_QUEST("The Fate of Yenniku") },
          text = "I look for the boy with my magic. What I find, I don't like. His body walk here. His spirit, not with it." },
        { id = "h_crystals", when = { questActive = TODO_QUEST("The Singing Crystals") },
          text = "Them crystals sing, if you know how to listen. I need their song for what come next." },
        { id = "h_spirits", when = { metBefore = true }, text = "De jungle spirits be loud here, mon. Louder than at home. Dey not friendly. Dey not unfriendly. Dey just loud." },
      },
      choices = {
        { text = "What can't be seen?", next = "unseen" },
        { text = "Farewell, witch doctor.", next = "END" },
      },
    },
    unseen = {
      lines = {
        { id = "u_default", text = "Spirits, curses, old magic left lying around. Stranglethorn full of all three. You walk through them every day and never know." },
      },
      choices = { { text = "That's not comforting.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "His spirit wander, mon. I bring it home, one way or another." } },
    _none = { { id = "tp_none", text = "Even the spirits don't know that one. Or they not telling." } },
  },
}

P:NPC {
  key = "mokthardin", id = TODO_NPC("Far Seer Mok'thardin"), name = "Far Seer Mok'thardin",
  bible = "bibles/stranglethorn.md", role = "priest", tier = "quest",
  communities = { "gromgol" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class" },

  greetings = {
    { id = "g_fire", text = "The camp is loud. Here by the fire it's quieter. Speak, and I'll listen." },
    { id = "g_back", when = { metBefore = true }, text = "The fire kept your place. Sit." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Another who listens to the elements. Out here they speak loudly, and mostly about rain." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Far Seer Mok'thardin, of Orgrimmar. The beasts of Stranglethorn carry old power in their blood and bones. I'm learning to draw it out." },
        { id = "h_ench", when = { questActive = TODO_QUEST("Mok'thardin's Enchantment") },
          text = "The enchantment needs what only those beasts can give. Bring it, and I'll show you what it becomes." },
        { id = "h_bones", when = { metBefore = true }, text = "A raptor's bones sing differently than a panther's. I can hear it now. I wish I couldn't, at night." },
      },
      choices = {
        { text = "What kind of power?", next = "power" },
        { text = "Thank you, far seer.", next = "END" },
      },
    },
    power = {
      lines = {
        { id = "p_default", text = "The kind that settles into anything that's lived long in a wild place. Orgrimmar teaches us to ask before we take. So I ask." },
      },
      choices = { { text = "And if the answer's no?", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That is beyond what the elements tell me." } },
  },
}

P:NPC {
  key = "thulbek", id = TODO_NPC("Innkeeper Thulbek"), name = "Innkeeper Thulbek",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "gromgol" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in! Sit by the fire. Out here a fire keeps things away, not cold." },
    { id = "g_home", when = { homeInn = { "Grom'gol Base Camp" } }, text = "Home again. Your bed's dry, which in Stranglethorn counts as a luxury." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the spirit healer just sent you back. Sit. Eat. Don't argue." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Slow down. The grog in this camp is strong, and it holds a grudge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Thulbek. As long as Grom'gol stands, there's a bed here for you. All I ask is a story of the fighting while you eat." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he wrestled a gorilla. By morning it was two gorillas. By noon, a gorilla king. Good story. Bad liar." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The jungle never sleeps. Listen. Everything out there is either hunting or hiding. Eat your stew." },
      },
      choices = {
        { text = "I've a story or two.", next = "story" },
        { text = "Just a meal, thanks.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Good! Tell it loud. The grunts by the wall need cheering, and the trolls outside should hear what's waiting for them." } },
      choices = { { text = "[Tell it]", next = "END", fx = { affinity = 2, standing = { gromgol = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the Commander. He hears everything in this camp, and complains about most of it." } },
  },
}
