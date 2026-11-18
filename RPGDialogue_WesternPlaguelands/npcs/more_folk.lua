-- More of Caer Darrow's ghosts: Artist Renfray, who painted the Fordrings; Rory the fisherman, who knows
-- he is dead; Joseph Dirte, who still hauls the Barovs' refuse; and Baker Masterson, who still bakes.
-- Most are seen only with the Spectral Essence. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Artist Renfray: ghost painter of Caer Darrow, friend of the Fordrings, who hid "Of Love and Family".
P:NPC {
  key = "renfray", id = TODO_NPC("Artist Renfray"), name = "Artist Renfray",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "gentle", "weary" }, values = { "beauty", "memory", "loyal" },
  notices = { "paladin", "lore" },

  impression = {
    first = "Remembering what the other spirits have forgotten seems to be her curse.",
    third = "{name} met Artist Renfray, the ghost of the painter who made the Fordring family's portrait at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "You can see me? Then you've come a long way, and through a great deal of darkness." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The others never remember a face, but I do." },
    { id = "g_painting", when = { questActive = TODO_QUEST("Of Love and Family") }, text = "The Scarlet Bastion, behind the painting of our twin moons. Chip gently; it is my master work underneath." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A paladin! For a moment, I thought Tirion had come at last. Forgive a ghost her hopes." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself as Tirion did, before they took the Silver Hand from him. I'd have painted you in the morning light." },
    { id = "n_lore", cat = "lore", when = { questDone = TODO_QUEST("Of Love and Family") },
      text = "He has it back, doesn't he? I can feel it, somehow, the way you feel a window open in another room." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I was Renfray, the artist, when this island had people on it who wanted their portraits painted. Many of the spirits here are cursed to relive their last happy memory, but I am one of the few who remembers all of it." },
        { id = "h_sent", tags = { "news" }, when = { questActive = TODO_QUEST("Of Love and Family") },
          text = "Tirion sent you? Tirion, my old friend, is that you, come to save us? No, of course not, but you've come from him, and that is nearly as good." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Of Love and Family") },
          text = "You found it, and you brought it to him. Perhaps this was the thing that kept me here, and perhaps I'll be free of it soon." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have nothing but time, and a great deal of it is memory." },
        { id = "h_again2", text = "Go on. It's good to be asked something." },
      },
      choices = {
        { text = "What happened to Caer Darrow?", next = "darrow" },
        { text = "Tell me about the Fordrings' portrait.", next = "portrait" },
        { text = "You knew Tirion Fordring?", next = "tirion" },
        { text = "Why do you remember, when the others don't?", next = "curse" },
        { text = "Rest easy, Renfray.", next = "END" },
      },
    },

    darrow = {
      lines = {
        { id = "da_default", text = "A plague came up out of Scholomance, out of the Barovs' own cellars, and ate the town alive from the inside. It wasn't the Scourge; there was no Scourge yet, only men in robes beneath the Barov house and a sickness no priest could touch." },
      },
      choices = {
        { text = "The Barovs allowed this?", next = "darrow_barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darrow_barov = {
      lines = {
        { id = "db_default", text = "They sold their island to the Cult of the Damned for a promise, and the Cult kept its promise in its own way. Alexei Barov gave the order, and his children inherited the ruin." },
      },
      choices = {
        { text = "The Barovs should answer for it.", next = "darrow_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darrow_answer = {
      big = true,
      lines = {
        { id = "dn_default", text = "Some say the sons are doing just that, sending others to kill each other's servants. I'm too tired to wish them harm, but I can't find it in me to wish them well." },
      },
      choices = {
        { text = "Let them answer to justice, then.", next = "BACK", reply = "Justice. I'd almost forgotten the word. I hope it finds them, if it can find anything here.", fx = { align = { light = 1 } } },
        { text = "Let them tear each other apart. It's earned.", next = "BACK", reply = "Perhaps it is. I only wish it didn't have to happen on my island.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    portrait = {
      lines = {
        { id = "po_default", text = "The Fordrings came here on family excursions, and on their last visit, I painted them along the beach: Tirion, his wife Karandra and their boy Taelan. I called it Of Love and Family, and it was the best thing I ever made." },
      },
      choices = {
        { text = "Where is it now?", next = "portrait_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portrait_where = {
      lines = {
        { id = "pw_default", text = "It hung on the wall of my workshop inside the Order's barracks in Stratholme for years. After Tirion's trial I knew I couldn't keep it visible, so I hid it under another painting, a painting of our twin moons." },
        { id = "pw_active", when = { questActive = TODO_QUEST("Of Love and Family") },
          text = "In Stratholme, deep in what is now the Scarlet Bastion, under a painting of our twin moons. Chip away at the paint until you uncover it, and may the Light guide your hand." },
      },
      choices = {
        { text = "Why hide it?", next = "portrait_hide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portrait_hide = {
      lines = {
        { id = "ph_default", text = "Because Tirion was stripped of his title and sent away for sparing an orc, and his name became something people spat. I wouldn't let them burn his family's faces for it." },
      },
      choices = {
        { text = "That was loyal of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tirion = {
      lines = {
        { id = "ti_default", text = "Very well, once. He laughed more than paladins are supposed to, and he held his son as if the boy might blow away. I don't know what became of them after the trial, and I'm afraid to ask." },
      },
      choices = {
        { text = "He's alive. He lives in exile.", next = "tirion_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tirion_alive = {
      big = true,
      lines = {
        { id = "ta_default", text = "Alive! And Taelan? No, don't tell me if it's bad. I would rather keep the boy on the beach a little longer." },
      },
      choices = {
        { text = "Then I won't. Keep him there.", next = "BACK", reply = "Thank you. That's a kindness the living rarely think to give us.", fx = { align = { honor = -1 } } },
        { text = "You deserve the truth, even if it hurts.", next = "BACK", reply = "Perhaps I do. But not today. Today let me be a painter with a happy picture.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    curse = {
      lines = {
        { id = "cu_default", text = "I don't know. Perhaps there's something I left undone, and the curse wants it done. Perhaps the thing you're asking about is why I haunt these ruins, and perhaps telling it shall set me free." },
      },
      choices = {
        { text = "Then I hope it does.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't remember that, and I remember almost everything. It must not have mattered very much." } },
  },
}

-- Rory: ghost fisherman of Caer Darrow, who knows that the town is dead.
P:NPC {
  key = "rory_darrow", id = TODO_NPC("Rory"), name = "Rory",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "caer_darrow" }, temper = { "grim", "weary" }, values = { "memory", "honest" },
  notices = { "profession" },

  impression = {
    first = "He insists something older and worse than the Scourge killed his town.",
    third = "{name} met Rory, a ghost fisherman of Caer Darrow who remembers that the town is dead.",
  },

  greetings = {
    { id = "g_default", text = "Another one who can see us. Leave me to my line, if you please." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The fish haven't bitten since I died, in case you were wondering." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "You fish? Then you'll know the lake was good, once." },
  },

  notice = {
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" },
      text = "That's a fisher's rod. Don't bother with the lake; nothing in it is worth eating now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They don't realise that they're dead. They're cursed to relive the last memory they had before the town was eaten alive from the inside out, most of them, anyway. Some were less fortunate." },
      },
      again = {
        { id = "h_again", text = "Still here? Ask, then." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "The Scourge did this?", next = "scourge" },
        { text = "Why do you remember?", next = "remember" },
        { text = "Who were the less fortunate?", next = "unfortunate" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    scourge = {
      lines = {
        { id = "sc_default", text = "You thought the Scourge did this? The Scourge did not yet exist, and if they had, we would at least have put up a damned fight. This was a plague out of Scholomance, and none survived." },
      },
      choices = {
        { text = "Scholomance is still full of them.", next = "scourge_school" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scourge_school = {
      big = true,
      lines = {
        { id = "ss_default", text = "I know. I watch the boats come and go from the island, carrying new students in and nothing out. If you're going in, burn it to the ground, and I'll go with you in spirit." },
      },
      choices = {
        { text = "I'll see it cleansed, Rory.", next = "BACK", reply = "Cleansed. Aye, that'd do. Go on, then, and good luck.", fx = { align = { light = 1 } } },
        { text = "I'll take what I need from it. That's all.", next = "BACK", reply = "Then you're no better than the ones who brought it here. Leave me to my sorrows.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = {
        { id = "re_default", text = "I don't know, and I'd give anything to forget. Masterson still bakes bread no one eats, and Joseph still hauls the Barovs' rubbish, and I'm the only one who can see that it's pointless." },
      },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    unfortunate = {
      lines = {
        { id = "un_default", text = "The ones who were taken below and made into what walks the halls of the school now. At least the rest of us got to keep our faces. Now leave me to my sorrows." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Goodbye, Rory.", next = "END" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know. Don't care. I'm fishing." } },
  },
}

-- Joseph Dirte: ghost of Caer Darrow's refuse man, still at his shed.
P:NPC {
  key = "joseph_dirte", id = TODO_NPC("Joseph Dirte"), name = "Joseph Dirte", title = "Waste Management",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "caer_darrow" }, temper = { "cheerful", "touchy" }, values = { "pride", "work" },
  notices = { "kit" },

  impression = {
    first = "Cross him and he threatens you with his fists of fury.",
    third = "{name} met Joseph Dirte, the ghost of Caer Darrow's refuse man, who still minds his shed.",
  },

  greetings = {
    { id = "g_default", text = "Busy day, busy day. Mind the bins, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The Barov house never stops, so neither do I." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Look at the state of your gear! I've hauled better off the Barov midden, and I should know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Joseph Dirte, and my job title is Waste Management Specialist, thank you very much. The Barov house sure does keep me busy, because there's always some sort of refuse coming out of there." },
      },
      again = {
        { id = "h_again", text = "What else? These bins won't empty themselves." },
        { id = "h_again2", text = "Speak up, friend!" },
      },
      choices = {
        { text = "Refuse from the Barovs?", next = "refuse" },
        { text = "So you're the rubbish man.", next = "title" },
        { text = "Who's Brandy?", next = "brandy" },
        { text = "Good luck with the bins.", next = "END" },
      },
    },
    refuse = {
      lines = {
        { id = "rf_default", text = "Strange stuff lately, too: bones, and robes, and jars that smell of the grave. I don't ask, I just haul, but there's more of it every week, and none of it's from the kitchens." },
      },
      choices = {
        { text = "Joseph, the Barovs are gone. So is the town.", next = "refuse_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuse_dead = {
      big = true,
      lines = {
        { id = "rd_default", text = "Gone? Don't be daft, I hauled their bins this morning, same as every morning. You're having a laugh at a working man, and I don't care for it." },
      },
      choices = {
        { text = "You're right. Forget I said anything.", next = "BACK", reply = "Forgotten already, friend. Now, where was I?", fx = { align = { honor = -1 } } },
        { text = "I'm not laughing. You died here, Joseph.", next = "BACK", reply = "I... no. No, I've the bins to do. I've always got the bins to do.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    title = {
      lines = {
        { id = "ti_default", text = "Waste Management Specialist! Perhaps you should speak into these sound-enhancing devices attached to my FISTS OF FURY. Say it properly, and we'll get on fine." },
      },
      choices = {
        { text = "Waste Management Specialist. My apologies.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brandy = {
      lines = {
        { id = "br_default", text = "Ah, my sweet Brandy, I miss her so! She went to the mainland to see her sister, and she's been gone ever so long. She'll be back any day now." },
      },
      choices = {
        { text = "I hope she comes back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't say, friend. I just haul what the Barovs throw out." } },
  },
}

-- Baker Masterson: ghost baker of Caer Darrow, still selling bread and drink.
P:NPC {
  key = "baker_masterson", id = TODO_NPC("Baker Masterson"), name = "Baker Masterson",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "caer_darrow" }, temper = { "warm", "cheerful" }, values = { "hospitality", "craft" },
  notices = { "hunger" },

  impression = {
    first = "He doesn't know he is dead, and it's the saddest thing here.",
    third = "{name} met Baker Masterson, the ghost baker who still sells bread at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "Fresh from the oven! Well, fresh enough, it's been a busy morning." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You must like my rolls." },
  },

  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved, poor thing! Sit, sit, and have a roll before you go any further." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Masterson's the name, and bread's the game, as my father used to say. The Barovs' guests eat well, and the townsfolk eat better, so long as I'm up before the sun." },
      },
      again = {
        { id = "h_again", text = "What else, dear? The loaves are rising." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Who buys from you these days?", next = "customers" },
        { text = "You haven't noticed anything strange?", next = "strange" },
        { text = "Not today.", next = "END" },
      },
    },
    customers = {
      lines = {
        { id = "cu_default", text = "Everyone! Well, it's been quiet this week, very quiet, and I can't think why. Maybe the Barovs have a fever going round the house again." },
      },
      choices = {
        { text = "A fever?", next = "customers_fever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_fever = {
      big = true,
      lines = {
        { id = "cf_default", text = "Some sickness or other, coming up out of the cellars, the maids say. I keep baking, because sick folk need bread more than anybody." },
      },
      choices = {
        { text = "That's kind. Keep baking.", next = "BACK", reply = "I will, dear, I always do.", fx = { align = { light = 1 } } },
        { text = "Nobody's coming, Masterson. They're all gone.", next = "BACK", reply = "Gone? Don't be silly. They'll be along once the fever's passed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = {
        { id = "st_default", text = "Strange? Only that the flour never seems to run out, and the oven's always warm. I'm not one to look a gift horse in the mouth, dear." },
      },
      choices = {
        { text = "No, I suppose not.", next = "BACK" },
        { text = "Let's see the bread.", next = "BUSINESS" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask me about bread." } },
  },
}
