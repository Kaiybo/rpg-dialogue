-- More of the Bulwark: Mickey Levine (A Plague Upon Thee: termites for the Scarlet lumber mill
-- at Northridge) and Argent Quartermaster Hasana (the Argent Dawn's stores).
-- Voices: bibles/bulwark_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Mickey Levine
---------------------------------------------------------------------------
P:NPC {
  key = "mickey_levine", id = TODO_NPC("Mickey Levine"), name = "Mickey Levine",
  bible = "bibles/bulwark_folk.md", role = "questgiver", tier = "quest",
  communities = { "bulwark" }, temper = { "wry", "bitter" }, values = { "vengeful", "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Mickey Levine keeps a jar of plague termites at the Bulwark and a grudge against the Scarlet Crusade that she means to settle one rotten beam at a time. She is cheerful about it in a way that is not cheerful at all.",
    third = "{name} met Mickey Levine at the Bulwark, who plans to bring down the Scarlet Crusade's lumber mill at Northridge with termites.",
  },

  greetings = {
    { id = "g_default", text = "Mind the jars. They're full of very hungry little friends, and they don't care what they eat." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Tell me you've come about the termites, because nobody else at the Bulwark wants to hear about them." },
  },

  notice = {
    { id = "n_scarlet", cat = "class", when = { class = "PALADIN" },
      text = "The Light still shines off you, {class}, which makes my teeth ache. I'll overlook it, since you're not wearing red." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mickey Levine. I've a grudge against the Scarlet Crusade, a plan to settle it, and a jar of insects to do the work for me, if you've the stomach for termites." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Plague Upon Thee") },
          text = "The mounds are in Plaguewood, up in the Eastern Plaguelands, and the barrel goes to Northridge Lumber Mill, west of the road up to Hearthglen. Put it somewhere high, open the lid, and let my little friends take care of the rest." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Plague Upon Thee") },
          text = "I hear the Crusade's mill is groaning like an old man on the stairs, and every timber they cut turns to dust before it reaches Hearthglen. That's the best news I've had since I died." },
        { id = "h_young", when = { maxLevel = 47 },
          text = "You're a bit green for Plaguewood, if you don't mind my saying so. Come back when the Plaguelands can't eat you in one bite, and I'll have a job waiting." },
      },
      again = {
        { id = "h_again", text = "What else? I've all night, and so do the termites." },
        { id = "h_again2", text = "Go on, ask. It's not often anyone here wants to talk to me." },
      },
      choices = {
        { text = "Why termites?", next = "plan" },
        { text = "What did the Crusade do to you?", next = "grudge" },
        { text = "What's it like, living at the Bulwark?", next = "bulwark" },
        { text = "Termites, Mickey? I'd rather just shoot them.", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I'll leave you to your insects.", next = "END" },
      },
    },

    -- The plan
    plan = {
      lines = { { id = "p_default", text = "Because the Crusade builds everything from Northridge timber: their palisades, their siege towers, and the pyres they burn folk like me on. Take away the wood and Hearthglen starts to look very bare, and bare walls don't keep out the Dark Lady's armies." } },
      choices = {
        { text = "And the termites won't spread anywhere else?", next = "plan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan2 = {
      big = true,
      lines = { { id = "p2_default", text = "They might, I suppose, and the forests of Lordaeron might have a hard few years of it. I can't say it keeps me up at night, since nothing does any more." } },
      choices = {
        { text = "The land has suffered enough. Use them carefully.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them spread. These forests belong to the dead now.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Her grudge
    grudge = {
      lines = { { id = "g_default", text = "They burned my sister on the green at Hearthglen while she was still breathing, because she'd nursed a plague victim and they called that taint. I came along a few weeks later in a cart of corpses, and by the time I woke up, they'd forgotten both our names." } },
      choices = {
        { text = "I'm sorry, Mickey.", next = "grudge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grudge2 = {
      lines = { { id = "g2_default", text = "Don't be sorry, be useful, because sorry never rotted a single beam. The Crusade remembers its enemies by their deeds, so I mean to give them a deed they'll remember." } },
      choices = {
        { text = "Then I'll help you give it to them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Bulwark
    bulwark = {
      lines = { { id = "b_default", text = "It's the last wall between Tirisfal and the Plaguelands, and the Scourge test it every night with whatever they can drag out of Andorhal. Derrington holds the gate, Vandis keeps our spirits up, and the Argent Dawn has set up beside us, which some of the Deathguard don't care for." } },
      choices = {
        { text = "Why don't they care for the Argent Dawn?", next = "bulwark2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark2 = {
      lines = { { id = "b2_default", text = "Because half the Dawn wear the Light on their sleeves, and the last people who did that in Lordaeron burned us. Garush is an orc and Hasana is a troll, mind, so I think the Dawn's quarrel is with the Scourge and not with us." } },
      choices = {
        { text = "Do you trust them?", next = "bulwark3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark3 = {
      big = true,
      lines = { { id = "b3_default", text = "I trust anyone who'll fight the Scourge beside me, which is a short list and getting shorter. Ask me again after they've stood on the wall through a bad night, and I'll tell you then." } },
      choices = {
        { text = "Light or no Light, they're welcome on the wall.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Anyone who wears the Light will turn on us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Hunters
    xhunt = {
      lines = { { id = "xh_default", text = "So would I, but an arrow kills one Crusader and a termite kills the house he sleeps in. Shoot all you like on the way to Northridge, {class}; the barrel will do the real work." } },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, and I'm too busy thinking about termites to find out. Ask Derrington." } },
  },
}

---------------------------------------------------------------------------
-- Argent Quartermaster Hasana
---------------------------------------------------------------------------
P:NPC {
  key = "hasana", id = TODO_NPC("Argent Quartermaster Hasana"), name = "Argent Quartermaster Hasana", title = "The Argent Dawn",
  bible = "bibles/bulwark_folk.md", role = "vendor", tier = "service",
  communities = { "bulwark", "argent_dawn" }, temper = { "easygoing" }, values = { "dutiful", "fair" },
  notices = { "race", "status" },

  impression = {
    first = "Argent Quartermaster Hasana is a Darkspear troll who keeps the Argent Dawn's stores at the Bulwark. She sells the Dawn's best goods only to those it has learned to trust, and she argues about spirits with Shadow Priestess Vandis in the evenings.",
    third = "{name} met Argent Quartermaster Hasana, who keeps the Argent Dawn's stores at the Bulwark.",
  },

  greetings = {
    { id = "g_default", text = "Argent Dawn stores, mon. If the Dawn know your name, I got somethin' for you." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
      text = "Ah, I know you! Your name been written in the good column more times than I can count, and the Dawn don't forget." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Another Darkspear this far north! Your feet be cold as mine, I bet, and there ain't a palm tree for a hundred miles." },
    { id = "n_dawn", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered among the Dawn, you are. I keep the best stock in the back for folk like you, so ask and I'll fetch it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Argent Quartermaster Hasana, keepin' the Dawn's stores at the Bulwark. If the Dawn know your name, I got somethin' for you, and if it don't, Garush can tell you how to change that." },
      },
      again = {
        { id = "h_again", text = "What else you need, mon?" },
      },
      choices = {
        { text = "Show me the Dawn's stock.", next = "BUSINESS" },
        { text = "A troll in the Argent Dawn?", next = "troll" },
        { text = "Why sell only to friends of the Dawn?", next = "rules" },
        { text = "I'll go.", next = "END" },
      },
    },
    troll = {
      lines = { { id = "t_default", text = "The Darkspear know what it is to be hunted by somethin' that won't stop, mon, and the Scourge don't ever stop. When the Dawn asked for hands, I gave mine, and they gave me a ledger, which I thought was a joke at first." } },
      choices = {
        { text = "Do the Forsaken treat you well?", next = "troll2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll2 = {
      lines = { { id = "t2_default", text = "Well enough, for folk who can't taste the food I cook for them. Vandis and me talk about the spirits some evenings, and we disagree about all of it, which keeps the both of us sharp." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rules = {
      big = true,
      lines = { { id = "r_default", text = "Because the stores be thin and the war be long, and I can't give the good steel to every traveler who passes by. Bring Garush your Scourgestones, earn the Dawn's trust, and the shelves open up for you." } },
      choices = {
        { text = "Trust earned is the right way to do it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Arm everyone. The Scourge won't wait for ledgers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That ain't in my ledger, mon. Ask Garush, or ask the High Executor." } },
  },
}
