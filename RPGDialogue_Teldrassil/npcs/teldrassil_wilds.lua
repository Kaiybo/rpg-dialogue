-- Teldrassil between the glades: Lake Al'Ameth, Shadowglen's poisoned scout, Dolanaar's cook, Rut'theran's perch.
-- Voice: bibles/teldrassil_wilds.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "denalan", id = TODO_NPC("Denalan"), name = "Denalan",
  bible = "bibles/teldrassil_wilds.md", role = "scholar", tier = "quest",
  communities = { "dolanaar" }, temper = { "calm" }, values = { "curious" },
  notices = { "class" },

  impression = {
    first = "Denalan studies the plants of Teldrassil from his camp at Lake Al'Ameth, and something about them is troubling him.",
    third = "{name} met Denalan, a druidic scholar who tends his experiments by Lake Al'Ameth.",
  },

  greetings = {
    { id = "g_lake", text = "Ishnu-alah, traveller. Step carefully, for my sprouts are planted closer to the path than they should be." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The lake has been quiet, and my sprouts less so." },
  },

  start = "hello",
  nodes = {
    xmage = {
      lines = {
        { id = "xma_default", text = "Arcane? I hope not, for that would mean someone brought it here, and I would rather it were only a young tree's growing pains. If you sense something, tell me, but do not go casting at my timberlings to find out." },
      },
      choices = {
        { text = "I'll watch, and cast nothing near them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If magic did this, magic can find it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's wrong with the timberlings?", next = "timber" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then watch them, and tell me how they behave when they think no one is near, for they are wary of me now. Their seeds may tell us what is wrong, so bring me those if you can." },
      },
      choices = {
        { text = "I'll watch them, and harm none needlessly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Easier to cut a few open and look inside.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why work by the lake?", next = "lake" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Denalan, and I study how the life of Teldrassil grows. The great tree is young, and the creatures born of it are not always what we hoped." },
        { id = "h_earth", when = { questActive = TODO_QUEST("Denalan's Earth") },
          text = "My earth from Darnassus, at last! Thank you, for I had nearly given up on it, and the planting cannot wait much longer." },
        { id = "h_seeds", when = { questActive = TODO_QUEST("Timberling Seeds") },
          text = "The timberlings around the lake carry seeds within them. Bring me some, and we may learn what the tree is trying to say." },
        { id = "h_sprouts", when = { questActive = TODO_QUEST("Timberling Sprouts") },
          text = "The sprouts by the water have grown in ways I did not expect. Gather what you can, and be gentle if they let you." },
      },
      again = {
        { id = "h_again", text = "Is there something more you would ask?" },
        { id = "h_again2", text = "I am listening, though my mind is half on the soil." },
      },
      choices = {
        { text = "What is wrong with the timberlings?", next = "timber" },
        { text = "Why study plants out here, not in Darnassus?", next = "why" },
        { text = "Tell me about Lake Al'Ameth.", next = "lake" },
        { text = "As a druid, I feel something amiss in the land.", next = "druid", when = { class = "DRUID" } },
        { text = "Something arcane may be twisting your timberlings.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your timberlings never hear me. I could watch them for you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Elune guide your work.", next = "END" },
      },
    },
    timber = {
      lines = { { id = "t_default", text = "They are the tree's own children, yet many have turned angry and strange. I want to know whether the fault lies in them or in the soil they rose from." } },
      choices = {
        { text = "And what do you suspect?", next = "timber_sus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    timber_sus = {
      lines = { { id = "ts_default", text = "That Teldrassil was planted without nature's blessing, and the land knows it. I say that quietly, for not everyone in Darnassus would like to hear it." } },
      choices = {
        { text = "Then the Archdruid must be told plainly.", next = "timber_end", fx = { align = { order = -1 } } },
        { text = "The Archdruid knows best. Trust his judgment.", next = "timber_end", fx = { align = { order = 1 } } },
        { text = "What will you do?", next = "timber_end" },
      },
    },
    timber_end = {
      lines = { { id = "te_default", text = "Study, and gather proof, and say nothing I cannot show. Help me with the seeds, and we may know soon enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
    why = {
      lines = { { id = "w_default", text = "Because the city tends its gardens too carefully, and I need to see what grows when no one is watching. The lake shows me the truth of things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lake = {
      lines = { { id = "l_default", text = "It is a calm place, and its waters are clear, though the furbolgs near Ban'ethil grow restless. Dolanaar is close, should you need rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you feel what I feel, and I am glad not to be alone in it. Listen to the timberlings; they will tell you more than I can." } },
      choices = { { text = "I will listen.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I do not know, friend. The soil and I keep to ourselves." } },
  },
}

P:NPC {
  key = "iverron", id = TODO_NPC("Iverron"), name = "Iverron",
  bible = "bibles/teldrassil_wilds.md", role = "citizen", tier = "quest",
  communities = { "shadowglen" }, temper = { "gentle" }, values = { "kind" },
  notices = { "class" },

  impression = {
    first = "Iverron lay sick on the road by the spider cave, poisoned by the webwood venom, and grateful for every kindness.",
    third = "{name} met Iverron, a young kaldorei of Shadowglen who was poisoned by the spiders near the cave.",
  },

  greetings = {
    { id = "g_road", text = "Forgive me for not rising, friend. The venom has made my legs into water." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I'm standing now, mostly, and I have you to thank for it." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "You know poisons? Then you know how slow this one is, and I would rather not hear how it ends. Dirania has gone for a cure, but if you can tell me how long I have, perhaps I could stop counting." },
      },
      choices = {
        { text = "The truth is it's serious, but slow. You have time.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You'll be fine. Don't think on it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who is Dirania to you?", next = "dirania" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A spell? I would not know, and forgive me, I am not sure I want to learn it from a stranger's magic. Dirania is bringing a remedy of herbs, and our people trust herbs more than spells." },
      },
      choices = {
        { text = "Herbs it is. I won't interfere.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If she's late, I'm trying the spell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What happened in the cave?", next = "cave" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Iverron, and I was foolish enough to wander too near the spiders' cave. The venom works slowly, which is a mercy and a torment both." },
        { id = "h_antidote", when = { questActive = TODO_QUEST("Iverron's Antidote") },
          text = "Dirania is making an antidote, and she needs things from the glade to finish it. Please hurry, for my strength fades by the hour." },
        { id = "h_done", when = { questDone = TODO_QUEST("Iverron's Antidote") },
          text = "The antidote worked, and I owe you my life. I'll stay well away from that cave from now on, I promise." },
      },
      again = {
        { id = "h_again", text = "Is there more? Talking keeps my mind off the pain." },
        { id = "h_again2", text = "Ask what you like, friend." },
      },
      choices = {
        { text = "Why were you near the cave?", next = "cave" },
        { text = "Who is Dirania to you?", next = "dirania" },
        { text = "What lives in Shadowglen?", next = "glen" },
        { text = "Let me see the wound. I'm a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I know poisons. I could tell you what this is.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could a spell draw the venom out?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Rest easy, Iverron.", next = "END" },
      },
    },
    cave = {
      lines = { { id = "c_default", text = "I wanted to see the webwood spiders up close, for they're beautiful in a terrible way. One of them saw me first." } },
      choices = {
        { text = "Should the spiders be cleared out?", next = "cave_clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_clear = {
      lines = { { id = "cc_default", text = "Some say so, since they've grown bold and many. Others say the cave was theirs first, and I was the one who trespassed." } },
      choices = {
        { text = "The forest is theirs too. Leave them in peace.", next = "cave_end", fx = { align = { light = 1 } } },
        { text = "They nearly killed you. Burn them out.", next = "cave_end", fx = { align = { light = -1 } } },
        { text = "What do you think?", next = "cave_end" },
      },
    },
    cave_end = {
      lines = { { id = "ce_default", text = "I think I'll keep my curiosity on the near side of the path next time. That's the only lesson I'm sure of." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dirania = {
      lines = { { id = "d_default", text = "A dear friend, and a far better healer than I am a scout. She'll scold me when I'm well, and I'll deserve every word." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glen = {
      lines = { { id = "g_default", text = "Young druids, sentinels and a great many grells, which the elders say are the work of the Burning Legion's leftovers. It's peaceful, mostly, if you stay away from caves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Elune bless you for the thought, but Dirania says only the antidote will clear it. Your prayers are still welcome, though." } },
      choices = { { text = "Then you'll have them.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I've spent too long lying in the grass to hear the news." } },
  },
}

P:NPC {
  key = "zarrin", id = TODO_NPC("Zarrin"), name = "Zarrin",
  bible = "bibles/teldrassil_wilds.md", role = "vendor", tier = "quest",
  communities = { "dolanaar" }, temper = { "warm" }, values = { "generous" },
  notices = { "craft" },

  impression = {
    first = "Zarrin cooks for Dolanaar and keeps the old kaldorei recipes alive, one pot at a time.",
    third = "{name} met Zarrin, the cook of Dolanaar, who guards the recipes of the kaldorei.",
  },

  greetings = {
    { id = "g_cook", text = "Welcome, welcome! Come closer to the fire, for nothing tastes as good as food made where you can smell it." },
  },

  start = "hello",
  nodes = {
    xmage = {
      lines = {
        { id = "xma_default", text = "Conjured bread! A human traveler offered me some once, and it tasted of nothing but its own cleverness. Sit and eat a proper meal, and tell me afterwards which you prefer." },
      },
      choices = {
        { text = "Your cooking, of course. I'll stay.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured bread keeps me fed. That's enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is the oldest recipe you keep?", next = "recipe" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "My spice cupboard is guarded by my good opinion of my guests, which you are testing. Ask, and I will share; take, and you will eat elsewhere." },
      },
      choices = {
        { text = "I'd only ever ask, Zarrin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I was only testing your lock.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who eats here, mostly?", next = "guests" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Zarrin, and I cook for Dolanaar as my mother did before me. The recipes of the kaldorei are older than Teldrassil, and I mean to keep them that way." },
        { id = "h_recipe", when = { questActive = TODO_QUEST("Recipe of the Kaldorei") },
          text = "The old recipe needs what the forest around Dolanaar provides, and I've no time to hunt it myself. Bring it, and I'll teach you a taste of home." },
      },
      again = {
        { id = "h_again", text = "Anything else? Taste this while you think; I fear it wants a pinch more moonroot." },
        { id = "h_again2", text = "Ask away, friend; I can talk and cook at once." },
      },
      choices = {
        { text = "What is the kaldorei recipe?", next = "recipe" },
        { text = "Who comes to eat here?", next = "guests" },
        { text = "What was it like before Teldrassil?", next = "before" },
        { text = "I cook too. Any secrets to share?", next = "cook", when = { profession = "Cooking" } },
        { text = "I can conjure bread. You needn't cook for me.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your spice cupboard is very poorly guarded.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Farewell, Zarrin.", next = "END" },
      },
    },
    recipe = {
      lines = { { id = "r_default", text = "A stew we made under the stars of Kalimdor, before the World Tree was planted. The ingredients are found here now, so the taste is a little different, but the heart is the same." } },
      choices = {
        { text = "Should the old ways change for a new land?", next = "recipe_change" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipe_change = {
      lines = { { id = "rc_default", text = "That is the question of our people, friend, in the kitchen as much as the council chamber. Some say we must hold fast, and others that we must grow." } },
      choices = {
        { text = "The old ways are worth keeping exactly as they were.", next = "recipe_end", fx = { align = { order = 1 } } },
        { text = "A recipe should change with the land.", next = "recipe_end", fx = { align = { order = -1 } } },
        { text = "And you?", next = "recipe_end" },
      },
    },
    recipe_end = {
      lines = { { id = "re_default", text = "I keep the heart and change the herbs, and nobody has complained yet. Bring me the ingredients and judge for yourself." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    guests = {
      lines = { { id = "g_default", text = "Sentinels off their watch, druids back from the glades and travellers like you. Everyone eats, and that's why I always have work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "We lived among the trees of Ashenvale and Hyjal, and there was no great tree to build on. I miss those forests, but Teldrassil is home now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "c_default", text = "Patience, mostly, and fresh herbs. And never trust a recipe that says 'until done'." } },
      choices = { { text = "Wise words.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask me about food instead." } },
  },
}
