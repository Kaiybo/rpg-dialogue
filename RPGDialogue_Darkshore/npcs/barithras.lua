-- Barithras Moonshade of Auberdine, who needs cave mushrooms and heeds the Ancients (0.72.0). Voice: bibles/barithras.md
-- Classic: Cave Mushrooms, Onu.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "barithras", id = TODO_NPC("Barithras Moonshade"), name = "Barithras Moonshade",
  bible = "bibles/barithras.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "cautious", "courteous" }, values = { "wisdom", "patience" },
  notices = { "craft", "stealth" },
  impression = {
    first = "He is careful with his own life and frank about it.",
    third = "{name} met Barithras Moonshade of Auberdine, who sent them into the cave behind Cliffspring Falls for rare mushrooms and news of what hides there.",
  },

  greetings = {
    { id = "g_hello", text = "Elune's light on you. Mind the jars, for some of them are not as harmless as they look." },
    { id = "g_mush", when = { questActive = TODO_QUEST("Cave Mushrooms") }, text = "Scaber stalks and a death cap, and a careful look around that cave. Have you been yet?" },
    { id = "g_onu", when = { questActive = TODO_QUEST("Onu") }, text = "Onu is waiting for you at the Grove of the Ancients. The Ancients do not wait lightly, so I would not keep him long." },
    { id = "g_onu_done", when = { questDone = TODO_QUEST("Onu") }, text = "Whatever Onu told you, I hope you listened carefully. He chooses his words over centuries." },
    { id = "g_away", when = { away = 14 }, text = "You return after {away}. The potion is still not finished, so you have missed nothing exciting." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were braver than I when you went into that cave, and you have grown braver since, I think. I am glad of it." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Then you know what a single good death cap is worth, and why I would not trust a stranger to pick it badly." },
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "You move quietly, which is a fine thing to bring into a cave that the Ancients do not trust. Keep to the shadows in there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Barithras Moonshade. I make potions here in Auberdine, as I have for longer than the village has stood, and the one I am working on needs mushrooms that grow in only one place on this whole coast, a cave behind Cliffspring Falls that the Ancients of the grove, old Onu among them, have warned me away from." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Cave Mushrooms") },
          text = "The mushrooms grow in a cave behind Cliffspring Falls, to the east and a little north. I would fetch them myself, but the Grove of the Ancients has warned me away, for they sense a new evil hiding there." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cave Mushrooms"), days = 3 } },
          text = "You have my mushrooms, and you have seen the cave. Tell me nothing yet, because if the Ancients feared it, it is Onu who should hear it first." },
        { id = "h_onu", tags = { "news" }, when = { questActive = TODO_QUEST("Onu") },
          text = "Onu, an Ancient of Lore, knows you went to the falls and wishes to speak with you. The Ancients are patient beyond our understanding, so if he asks for you quickly, it must be urgent." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. Then you may hear what the Ancients hear better than I can, and perhaps you will tell me whether I was a coward to stay away from that cave." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, and young, as your people always are. Forgive me if I stare; I have begun to study how your kind carries its short years, and I have not yet learned the trick of it." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask it, by all means, and I will answer if I can." },
        { id = "h_again2", text = "I am listening, friend, though the potion is not." },
      },
      choices = {
        { text = "That potion smells strong.", next = "potion" },
        { text = "It's strange that the Ancients fear that cave.", next = "cave" },
        { text = "Why not go yourself?", next = "coward" },
        { text = "Tell me about Onu.", next = "onu_b" },
        { text = "I found naga in the cave.", next = "naga", when = { questDone = TODO_QUEST("Cave Mushrooms") } },
        { text = "You guard your life more closely than most elves I've met.", next = "mortal" },
        { text = "Do you feel the years now, Barithras, since Hyjal?", next = "xyears", when = { race = "NightElf" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Good day, Barithras.", next = "END" },
      },
    },

    potion = {
      lines = {
        { id = "po_default", text = "Something to clear the head and steady the hand, for the Sentinels who stand long watches on this coast. The scaber stalk wakes the mind and the death cap, in a tiny measure, quiets the tremor." },
      },
      choices = {
        { text = "Death cap? Isn't that poison?", next = "potion_poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    potion_poison = {
      lines = {
        { id = "pp_default", text = "In a large measure, certainly, and in a careless one. Most good medicines are poisons that someone measured patiently, and so I keep the death caps on the top shelf, far from my apprentices." },
      },
      choices = {
        { text = "I'll be careful how I carry it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Goodbye, Barithras.", next = "END" },
      },
    },

    cave = {
      lines = {
        { id = "ca_default", text = "They did not say why, and I did not presume to ask more than once. The Ancients speak slowly, and they speak of what they feel rather than what they see, so all I know is that something has come to Darkshore that was not here before." },
      },
      choices = {
        { text = "And still you sent me there.", next = "cave_sent", when = { any = { { questActive = TODO_QUEST("Cave Mushrooms") }, { questDone = TODO_QUEST("Cave Mushrooms") } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_sent = {
      big = true,
      lines = {
        { id = "cs_default", text = "I did, and I will not pretend otherwise. You are an adventurer, and I am a potion-maker who would be killed by the first thing that looked at him, and Auberdine needs to know what is in that cave." },
      },
      choices = {
        { text = "You did right. Someone had to look.", next = "BACK", reply = "Thank you, though it does not make me feel much better about sending you. I am glad you came back to say so.", fx = { align = { honor = -1 } } },
        { text = "You should have warned me plainly first.", next = "BACK", reply = "Perhaps I should have, and I am sorry for it. I was frightened, and I let you walk in there half blind.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coward = {
      lines = {
        { id = "co_default", text = "Because the Ancients told me not to, and because I am not a fighter. I have known proud people who ignored the Ancients, and I have helped to bury several of them." },
      },
      choices = {
        { text = "That's wisdom, not cowardice.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    onu_b = {
      lines = {
        { id = "ob_default", text = "Onu is an Ancient of Lore at the Grove, to the south near the mountains. He has watched this coast longer than Auberdine has stood, and he does not ask to see anyone without reason." },
      },
      choices = {
        { text = "I'm not sure what to say to him.", next = "onu_say" },
        { text = "Something else.", next = "BACK" },
      },
    },
    onu_say = {
      lines = {
        { id = "os_default", text = "The truth, slowly, and then wait. The Ancients take silence as respect, so do not fill it with chatter the way the young do." },
      },
      choices = {
        { text = "I'll be patient.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Goodbye, Barithras.", next = "END" },
      },
    },

    -- Kaldorei factions: an elder who has not made peace with the immortality lost at Hyjal.
    mortal = {
      lines = {
        { id = "mo_default", key = true,
          text = "I do, and I'll tell you why, since so few of my people will say it aloud. When Nordrassil gave up its power to destroy Archimonde, we lost the immortality it had granted us, and I woke on the slopes of Hyjal knowing that one day I would be as dead as any human." },
      },
      choices = {
        { text = "Are you afraid?", next = "mortal_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mortal_fear = {
      lines = {
        { id = "mf_default", text = "Every day. I made potions for thousands of years without once wondering how many I had left, and now I count them. The young ones shrug and take ship for Menethil, but I was here when the world was young, and I am not ready to leave it." },
      },
      choices = {
        { text = "Then live, rather than count. That's what short-lived folk do.", next = "BACK", reply = "So Allyndia tells me every morning, across the square. It's easier advice to give when you never had forever to lose.", fx = { align = { order = -1 } } },
        { text = "Caution is wisdom. Guard the years you have.", next = "BACK", reply = "Thank you; I hear that far less often than the other. I'll keep to the top shelf and the safe paths, then, and let the young laugh.", fx = { align = { order = 1 } } },
        { text = "Has it changed how you see the humans?", next = "mortal_humans" },
      },
    },
    mortal_humans = {
      lines = {
        { id = "mh_default", text = "It has, and not as I'd like. I used to pity them for living so briefly, and now I watch them with something nearer envy, because they're born knowing what I learned at Hyjal, and they laugh at the inn anyway." },
        { id = "mh_human", when = { race = "Human" },
          text = "It has, and I'll say it to your face. I used to pity your people for living so briefly, and now I envy you, because you were born knowing what I learned at Hyjal, and you still laugh at the inn as if the night will never end." },
      },
      choices = {
        { text = "We laugh because there isn't time not to.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xyears = {
      lines = {
        { id = "xy_default", text = "I feel them in my hands, {g:brother|sister}, when the pestle slips. Tell me honestly whether you feel it too, or whether you're young enough that it means nothing to you." },
      },
      choices = {
        { text = "I feel it. I'm afraid too.", next = "BACK", reply = "Then we can be afraid together, quietly, which is better than alone. Don't tell the Sentinels; they think fear is a foreign custom.", fx = { affinity = 1 } },
        { text = "It means freedom. Every day matters now.", next = "BACK", reply = "Freedom; that's Allyndia's word for it too. I wish I could hear it without hearing a door close.", fx = { align = { honor = -1 } } },
        { text = "It means duty. Our years must be spent well.", next = "BACK", reply = "Spent well, yes, and not thrown away on a boat to Menethil. I think you and I would agree on most things.", fx = { align = { honor = 1 } } },
      },
    },

    naga = {
      big = true,
      lines = {
        { id = "na_default", text = "Naga, behind our own falls? Then the Ancients were right to be afraid, and so am I. Whatever they are doing in there, the water runs down from that cave to every stream on this coast." },
      },
      choices = {
        { text = "Then we drive them out before it spreads.", next = "BACK", reply = "Then let it be done soon, and quietly, before the sickness reaches the deer at the shore. I will brew what I can for whoever goes.", fx = { align = { light = -1 } } },
        { text = "Let Onu advise us before anyone acts.", next = "BACK", reply = "Onu is wise, and he is old, and he will take his time about it. I'll brew in the meantime, and pray the water waits for him.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A maker of potions, and a careful one. Careful people live long in Darkshore; I would like to be one of them." } },
    advice = { { id = "tp_ad", text = "When the Ancients warn you away from a place, believe them. Then, if you must go, go carefully." } },
    fel_moss = { { id = "tp_fel_moss", text = "Fel moss is the reason I'm careful. I've seen what it does to those who brewed it carelessly, and a dull alchemist lives longer than a bold one." } },
    blackfathom = { { id = "tp_blackfathom", text = "The water near Blackfathom is fouled with something I can't name, and I don't want to name it. I keep my vials far from that coast." } },
    hyjal = { { id = "tp_hyjal", text = "I was on the mountain when the World Tree gave up its strength. We won, and we have been growing old ever since." } },
    highborne = { { id = "tp_highborne", text = "Highborne alchemy was brilliant and reckless, and the ruins prove both. I've found their vials, and I've put them back where I found them." } },
    _none = { { id = "tp_none", text = "I could not say. Ask at the Grove of the Ancients, if you have the patience for the answer." } },
  },
}
