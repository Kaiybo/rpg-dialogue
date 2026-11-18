-- Anthion Harmon: the ghost outside Stratholme's gate, who died trying to save his wife Ysida from
-- Baron Rivendare and knows where Valthalak's medallion went. Voice: bibles/more_folk.md
-- Also Aurora Skycaller, the high elf priestess below Quel'Lithien Lodge (Crystal of Zin-Malor).
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "anthion", id = TODO_NPC("Anthion Harmon"), name = "Anthion Harmon",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stratholme_gate" }, temper = { "grim", "sharp" }, values = { "loving", "stubborn", "regretful" },
  notices = { "deeds", "stranger" },

  impression = {
    first = "Anthion Harmon is a ghost at Stratholme's gate who died trying to rescue his wife from Baron Rivendare. He'll answer questions about an old treasure, but only once he knows she's safe.",
    third = "{name} met Anthion Harmon, a ghost outside Stratholme who died trying to free his wife Ysida from the Baron.",
  },

  greetings = {
    { id = "g_default", text = "You can see me? Then listen, because I haven't long and there's something you must do." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Is there news? Tell me there's news." },
    { id = "g_plea", when = { questActive = TODO_QUEST("Dead Man's Plea") }, text = "Tell me, is Ysida alive? Every moment you stand here, the Baron's clock runs down." },
    { id = "g_materials", when = { questActive = TODO_QUEST("Anthion's Strange Request") }, text = "Did you obtain the materials I asked for? I can't fight Theldren for you, but I can shape the means." },
    { id = "g_falrin", when = { questActive = TODO_QUEST("Anthion's Old Friend") }, text = "Falrin, in the library of Dire Maul. He'll be rude to you, but he's rude to everyone." },
  },

  notice = {
    { id = "n_strat", cat = "deeds", when = { deed = "dungeon:Stratholme" },
      text = "You've been inside and come out again. I couldn't manage that, as you can see." },
    { id = "n_stranger", cat = "stranger", when = { metBefore = false },
      text = "A living face. It's been so long I'd almost forgotten how the living squint at a ghost." },
    { id = "n_brd", cat = "deeds", when = { deed = "dungeon:Blackrock Depths" },
      text = "You've the soot of Blackrock on you. Then you may have passed Theldren's ring already and never known whose brother stood in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Anthion Harmon, or what's left of him. I'll give you the information you've come for, but more pressing matters are at hand: my beloved wife has been taken prisoner by Rivendare's undead scum." },
        { id = "h_locket", tags = { "news" }, when = { questDone = TODO_QUEST("Proof of Life") },
          text = "That locket... you found her! I can rest in peace at long last. Ask what you must, but make haste, because my time in this world is not long." },
        { id = "h_saved", tags = { "news" }, when = { questDone = TODO_QUEST("Dead Man's Plea") },
          text = "You went in after her. Whatever she told you, whatever she gave you, I'd know it before I go." },
        { id = "h_dawn", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
          text = "You wear the Argent Dawn's favour. Ysida joined them against my wishes, and now she's in the Baron's hands, so forgive me if I'm not glad to see their colours." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly; I can feel myself thinning." },
        { id = "h_again2", text = "Ask. I'll answer if I can." },
        { id = "h_again3", text = "Go on. The gate is at my back and I'd rather look at you than at it." },
      },
      choices = {
        { text = "Tell me about your wife.", next = "ysida" },
        { text = "How did you die?", next = "death" },
        { text = "I came about Valthalak's medallion.", next = "medallion" },
        { text = "Why can't you rest?", next = "rest" },
        { text = "Who else was in your company?", next = "company" },
        { text = "You stand very close to that gate.", next = "gate" },
        { text = "I serve the Argent Dawn. Ysida chose well.", next = "dawn", when = { reputation = { faction = "Argent Dawn", min = "friendly" } } },
        { text = "I've walked the Baron's side of the city.", next = "walked", when = { deed = "dungeon:Stratholme" } },
        { text = "I'll be back.", next = "END" },
      },
    },

    ysida = {
      lines = {
        { id = "ys_default", text = "Ysida, my wife. I strongly objected to her joining the Argent Dawn's foolish crusade, but that's not of importance any more. Rivendare took her, and she's somewhere inside that city, waiting." },
      },
      choices = {
        { text = "Where in Stratholme?", next = "ysida_where" },
        { text = "The Argent Dawn isn't foolish.", next = "ysida_dawn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysida_where = {
      lines = {
        { id = "yw_default", text = "The Baron keeps his prisoners close, deep past the ziggurats in the dead side of the city. He likes to make a game of it, and he keeps the time himself, so you'll have to be fast." },
        { id = "yw_active", when = { questActive = TODO_QUEST("Dead Man's Plea") },
          text = "Past the ziggurats, in the Baron's own hall. You must finish what I attempted to do; you must rescue Ysida from the clutches of the Baron!" },
      },
      choices = {
        { text = "I'll bring her out.", next = "ysida_promise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysida_promise = {
      big = true,
      lines = {
        { id = "yp_default", text = "Don't promise me. I promised her the same, and look at me. Just go, and bring her out if the Light allows it." },
      },
      choices = {
        { text = "I promise anyway. Some promises are worth making.", next = "BACK", reply = "Then I'll hold you to it, from wherever I end up.", fx = { align = { honor = 1 } } },
        { text = "No promises, then. Only a good try.", next = "BACK", reply = "That's honest. It's more than most of the living give a ghost.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysida_dawn = {
      big = true,
      lines = {
        { id = "yd_default", text = "Not foolish to fight the Scourge, no. Foolish to march into Stratholme with a handful of priests and a song, and foolish of me to let her go alone." },
      },
      choices = {
        { text = "She chose to fight. Respect that.", next = "BACK", reply = "I respect it. I just wish I'd told her so, before.", fx = { align = { order = -1 } } },
        { text = "You were right to object. It was reckless.", next = "BACK", reply = "Right, and dead, and she's still in there. Being right was no comfort at all.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    death = {
      lines = {
        { id = "de_default", text = "I went in after her, alone, because I wouldn't wait for anyone. I got as far as the Baron's hall, and that's as far as I remember." },
      },
      choices = {
        { text = "That was brave.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    medallion = {
      lines = {
        { id = "me_default", text = "We didn't realise the importance of Valthalak's medallion, so it was divided along with the rest of the spoils. The first piece was taken by a dwarf named Theldren, who beat me within an inch of my life when I tried to get it back." },
      },
      choices = {
        { text = "Where is Theldren now?", next = "medallion_theldren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion_theldren = {
      lines = {
        { id = "mt_default", text = "Last I heard, he'd become a gladiator for the Dark Iron dwarves. Getting him to fight you will be a challenge, since Theldren is not one to willingly take part in a fair fight." },
      },
      choices = {
        { text = "Then how do I make him?", next = "medallion_banner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion_banner = {
      lines = {
        { id = "mb_default", text = "A banner in his family's colours, with a little sorcery worked into it, will provoke him beyond resisting. An old acquaintance of mine named Falrin knows the procedure; he has a particular way of aggravating people." },
      },
      choices = {
        { text = "I'll gather what you need.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    rest = {
      lines = {
        { id = "re_default", text = "Because I don't know if she's alive. I won't go on until I do, and I won't go anywhere the Baron can follow." },
        { id = "re_done", when = { questDone = TODO_QUEST("Proof of Life") },
          text = "I can, now. She's safe, and that was all that held me. I'll stay only long enough to answer what you need." },
      },
      choices = {
        { text = "Then I hope you find peace.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "co_default", text = "A band of us, sellswords out of the Veiled Blade, and we were good. We went into Blackrock Spire for Lord Valthalak's hoard and came out rich, and not one of us has had a quiet day since we shared it out." } },
      choices = {
        { text = "What became of the others?", next = "company2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company2 = {
      lines = { { id = "co2_default", text = "Theldren went to the Dark Irons' arena, as I told you. The rest scattered or died, and I'll not send you chasing every one of them from a graveside. Deliana in Ironforge and Mokvar in Orgrimmar know the tale, and they're the ones who sent you to me." } },
      choices = {
        { text = "So the hoard was cursed.", next = "company3" },
        { text = "You robbed a tomb and it followed you.", next = "company3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company3 = {
      lines = { { id = "co3_default", text = "Call it what you like. I called it luck, for a year, and then I called it nothing at all, because I was too busy to give it a name. Find the medallion and take it back where it belongs, and you'll have done better by Valthalak than we did." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gate = {
      lines = { { id = "ga_default", text = "I fell forty paces inside it, and this is as far as I can get from where I fell. I've tried the road south a hundred times. Something in that city has a hook in every soul that dies there, and it only lets out so much line." } },
      choices = {
        { text = "Do you see others like you?", next = "gate2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate2 = {
      lines = { { id = "ga2_default", text = "Hundreds, pressed up against the walls on the inside, and they don't know me or each other. I think I kept my wits only because I died with one clear thought, and I've held onto it like a rope ever since." } },
      choices = {
        { text = "Then hold onto it a little longer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = {
        { id = "dw_default", text = "Chose well? She chose a cause that marched her into that city. But I'll grant you this much, since you wear their mark honestly: they'd not have left her there by choice, and one of their own is standing here asking after her." },
        { id = "dw_done", when = { questDone = TODO_QUEST("Proof of Life") }, text = "She did, and I was a stubborn fool to say otherwise. Your order went back in for her when her own husband couldn't. Tell Lord Tyrosus that a dead mercenary has changed his mind." },
      },
      choices = {
        { text = "The Dawn doesn't abandon its own.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    walked = {
      lines = { { id = "wk_default", text = "Then you know the ziggurats, and the things that guard them, and how the Baron keeps his hall. Did you hear a woman's voice anywhere past the slaughterhouse? No, don't answer unless you're certain. I've had enough of hoping on a maybe." } },
      choices = {
        { text = "I heard nothing I could swear to.", next = "BACK", reply = "Then say no more. Go in again with your ears open, and come back when you can swear.", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stratholme = { { id = "tp_strat", text = "I can tell you every stone of the first forty paces. After that, I'm no use to you." } },
    argent_dawn = { { id = "tp_dawn", text = "My wife's people. I had hard words for them once, and I've had a long time at this gate to regret most of those." } },
    scourge = { { id = "tp_scourge", text = "Rivendare's scum. I've no fine words about them, only a debt." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't the time left to wonder." } },
  },
}

---------------------------------------------------------------------------
-- Aurora Skycaller: high elf priestess below Quel'Lithien Lodge, near Northpass Tower; knows what the Crystal of Zin-Malor was.
---------------------------------------------------------------------------
P:NPC {
  key = "aurora_skycaller", id = TODO_NPC("Aurora Skycaller"), name = "Aurora Skycaller",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "northpass" }, temper = { "sorrowful", "guarded" }, values = { "memory", "devout" },
  notices = { "race", "class" },
  impression = {
    first = "Aurora Skycaller is a high elf priestess who keeps a lonely post below Quel'Lithien Lodge, apart from her own kin. She is curt with strangers and then ashamed of it, and she carries the old sins of her people as if she had committed them.",
    third = "{name} met Aurora Skycaller, a high elf priestess near Northpass Tower who knew the history of the Crystal of Zin-Malor.",
  },

  greetings = {
    { id = "g_default", text = "You have come a long way to stand in a dead forest. Say what you want of me, and then let me return to my prayers." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Forgive me, I am out of the habit of visitors, and I greeted you poorly the first time." },
    { id = "g_writings", when = { questActive = TODO_QUEST("Fragments of the Past") }, text = "It is only in the pages of the sacred writings that I shall be able to tell whether I can help you. Have you been to the temple?" },
    { id = "g_crystal", when = { questActive = TODO_QUEST("Tormented By the Past") }, text = "The crystal is whole. Take it to Lake Kel'Theril, and find a spirit there who understands what was done." },
  },

  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "A child of Kalimdor. Your people cast mine out ten thousand years ago, and here we stand in a blighted wood, both of us far from anything we would call home." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You serve the Light, or something near it. Then pray with me a moment before you ask your question. This forest has had too few prayers." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You carry the arcane openly. My people did the same, and you can see around you what it bought us. I do not say this to wound you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aurora Skycaller, a priestess of Quel'Thalas, of what remains of it. I keep my own vigil here, below the lodge, because the rangers above have closed their gate and their hearts, and I would not close mine." },
        { id = "h_before", when = { minLevel = 54, questBefore = TODO_QUEST("Fragments of the Past") }, text = "You bring me fragments of crystal and ask what my ancestors broke. I did not realise what you carried, and I spoke harshly. Forgive me. If your request is truly genuine, then I shall help you." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fragments of the Past") }, text = "We must not forget the past, {class}. The elves, as a race, have been shattered like that crystal, and I do not know whether the pieces will ever be made one again. But my sorrow has been eased by helping you with this one small task." },
      },
      again = {
        { id = "h_again", text = "Ask. I shall try to answer more gently than I began." },
        { id = "h_again2", text = "Go on. The trees are past listening, so I may as well speak to you." },
        { id = "h_again3", text = "Yes? I have the time. It is nearly all I have." },
      },
      choices = {
        { text = "What is the Crystal of Zin-Malor?", next = "crystal" },
        { text = "Why do you stand apart from the lodge?", next = "lodge" },
        { text = "What happened to this forest?", next = "forest" },
        { text = "You speak as if you carry your ancestors' guilt.", next = "guilt" },
        { text = "Our peoples were one, once.", next = "kin", when = { race = "NightElf" } },
        { text = "I'll pray with you.", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll leave you to your vigil.", next = "END" },
      },
    },
    crystal = {
      lines = {
        { id = "c_default", text = "An artifact of the Highborne, made to contain and control strong arcane forces. It could have been used for good. But those who stole it meant evil by it, and their intent caused it to shatter." },
        { id = "c_active", when = { questActive = TODO_QUEST("Fragments of the Past") }, text = "Go to the Temple of Zin-Malor in Azshara, where the crystal was kept. The sacred writings were held there, and I can only hope the book still lies where it was left." },
      },
      choices = {
        { text = "Who stole it?", next = "crystal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal2 = {
      lines = { { id = "c2_default", text = "Highborne, from other Highborne, in the days when my forebears served Queen Azshara and thought no power too great to reach for. They carried it north to the lake your people call Kel'Theril, and what they did there froze a city and bound its dead." } },
      choices = {
        { text = "And those spirits are still bound?", next = "crystal3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal3 = {
      lines = { { id = "c3_default", text = "For ten thousand years. Think of that, {class}. I have grieved only a few years over my own homeland, and it has nearly unmade me. If the crystal can be made whole and shown to them, they may learn that the wrong has at last been put right." } },
      choices = {
        { text = "Then I'll see it done.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge = {
      lines = { { id = "l_default", text = "Quel'Lithien was a hunting lodge of my people, and when Quel'Thalas fell, some of our rangers held it and refused to leave. They have been alone in this blight for years now, and they will suffer no one near them, not even me." } },
      choices = {
        { text = "They'd turn away one of their own?", next = "lodge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge2 = {
      big = true,
      lines = { { id = "l2_default", text = "They have turned inward. I brought them the Light's comfort, and their ranger lord told me that comfort was a thing for people who still had a kingdom. So I pray for them from here, where they can see my fire and need not answer it." } },
      choices = {
        { text = "You should leave them. They chose this.", next = "BACK", reply = "Perhaps they did. But a priestess who leaves when she is unwelcome was never much of a priestess.", fx = { align = { honor = -1 } } },
        { text = "Stay. Someone must keep faith with them.", next = "BACK", reply = "That is what I tell myself at dusk, when the fire seems small. Thank you for saying it aloud.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest = {
      lines = { { id = "f_default", text = "The Scourge marched through it on the road to Quel'Thalas. The prince of Lordaeron led them, and his lich walked beside him. The trees were green on the morning they came, and you see what stands here now." } },
      choices = {
        { text = "Were you here that day?", next = "forest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest2 = {
      lines = { { id = "f2_default", text = "I was further north, behind gates we believed could not be opened. I shall not speak of what came through them. I shall only say that I have not seen the Sunwell's light since, and that there is a silence in me where it used to be." } },
      choices = {
        { text = "I'm sorry for what you lost.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guilt = {
      lines = { { id = "g2_default", text = "Do I? I suppose I do. My people were exiled for loving magic more than wisdom, and we built a kingdom on the same love, and it was that very magic the Scourge came to drink. I do not think that we ever learned." } },
      choices = {
        { text = "You can't answer for the dead.", next = "BACK", reply = "No. But I can remember them honestly, and that is nearer to answering than most of us come." },
        { text = "Then learn now. That's all anyone can do.", next = "BACK", reply = "It is a hard counsel, and a fair one. I shall keep it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "We were, and I have not forgotten it, though I think my people worked hard to. Tell me, do they still speak of the Highborne in your groves as a warning to children? I should not blame them." } },
      choices = {
        { text = "They do. But you aren't those Highborne.", next = "BACK", reply = "That is generous. I am their daughter, at ten thousand years' remove, and I accept the welcome and the warning both.", fx = { affinity = 1 } },
        { text = "They do, and with good reason.", next = "BACK", reply = "Yes. Look about you. I can hardly argue the point from where I stand." },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "p_default", text = "Then stand here, by the fire. I ask nothing grand. Only that the rangers above find their way back to one another, and that the spirits at Kel'Theril be let go. There. It is strange how much lighter it is, said by two." } },
      choices = {
        { text = "Light keep you, Aurora.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "They walked through my homeland as through an open door. I have had years to wonder who left it open." } },
    arthas = { { id = "tp_arthas", text = "I will not say his name. He passed within a mile of where we stand, and the ground has not forgiven it." } },
    holy_light = { { id = "tp_light", text = "It came late to my people, and we held it lightly. I hold it more tightly now than anything else I own." } },
    argent_dawn = { { id = "tp_dawn", text = "They hold the chapel to the south, and they have never asked what I am before offering bread. I think well of them." } },
    _none = { { id = "tp_none", text = "I do not know. I have kept a small fire in a dead wood for a long time, and news does not come this way." } },
  },
}
