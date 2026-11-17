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
    first = "Barithras Moonshade wanted mushrooms from a cave the Ancients told him to avoid, so he sent me instead and asked me to look around while I was there. He is careful with his own life and frank about it.",
    third = "{name} met Barithras Moonshade of Auberdine, who sent them into the cave behind Cliffspring Falls for rare mushrooms and news of what hides there.",
  },

  greetings = {
    { id = "g_hello", text = "Good day to you. Mind the jars; some of them are not as harmless as they look." },
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
          text = "I am Barithras Moonshade. I make potions here in Auberdine, and the one I am working on needs mushrooms that grow in only one place on this whole coast." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Cave Mushrooms") },
          text = "The mushrooms grow in a cave behind Cliffspring Falls, to the east and a little north. I would fetch them myself, but the Grove of the Ancients has warned me away, for they sense a new evil hiding there." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cave Mushrooms"), days = 3 } },
          text = "You have my mushrooms, and you have seen the cave. Tell me nothing yet, because if the Ancients feared it, it is Onu who should hear it first." },
        { id = "h_onu", tags = { "news" }, when = { questActive = TODO_QUEST("Onu") },
          text = "Onu, an Ancient of Lore, knows you went to the falls and wishes to speak with you. The Ancients are patient beyond our understanding, so if he is in a hurry, I fear it is urgent." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. Then you may hear what the Ancients hear better than I can, and perhaps you will tell me whether I was a coward to stay away from that cave." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask, by all means." },
        { id = "h_again2", text = "I am listening, friend, though the potion is not." },
      },
      choices = {
        { text = "What potion are you making?", next = "potion" },
        { text = "Why do the Ancients fear that cave?", next = "cave" },
        { text = "Why not go yourself?", next = "coward" },
        { text = "Tell me about Onu.", next = "onu_b" },
        { text = "I found naga in the cave.", next = "naga", when = { questDone = TODO_QUEST("Cave Mushrooms") } },
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
        { id = "pp_default", text = "In a large measure, certainly, and in a careless one. Most good medicines are poisons that someone measured patiently, which is why I do not let apprentices near the death caps." },
      },
      choices = {
        { text = "I'll be careful how I carry it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Goodbye, Barithras.", next = "END" },
      },
    },

    cave = {
      lines = {
        { id = "ca_default", text = "They did not say, and I did not presume to ask more than once. The Ancients speak slowly, and they speak of what they feel rather than what they see, so all I know is that something has come to Darkshore that was not here before." },
      },
      choices = {
        { text = "And you sent me there anyway?", next = "cave_sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_sent = {
      big = true,
      lines = {
        { id = "cs_default", text = "I did, and I will not pretend otherwise. You are an adventurer, and I am a potion-maker who would be killed by the first thing that looked at him, and Auberdine needs to know what is in that cave." },
      },
      choices = {
        { text = "You did right. Someone had to look.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You should have warned me plainly first.", next = "BACK", fx = { align = { honor = 1 } } },
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
        { text = "What should I say to him?", next = "onu_say" },
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

    naga = {
      big = true,
      lines = {
        { id = "na_default", text = "Naga, behind our own falls? Then the Ancients were right to be afraid, and so am I. Whatever they are doing in there, the water runs down from that cave to every stream on this coast." },
      },
      choices = {
        { text = "Then we drive them out before it spreads.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let Onu advise us before anyone acts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A maker of potions, and a careful one. Careful people live long in Darkshore; I would like to be one of them." } },
    advice = { { id = "tp_ad", text = "When the Ancients warn you away from a place, believe them. Then, if you must go, go carefully." } },
    _none = { { id = "tp_none", text = "I could not say. Ask at the Grove of the Ancients, if you have the patience for the answer." } },
  },
}
