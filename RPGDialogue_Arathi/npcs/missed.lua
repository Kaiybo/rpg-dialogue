-- Arathi, the folk a roster scan found missing: Refuge Pointe's leather supplier, the apothecary at Go'Shek
-- Farm, the three caretakers of Trollbane's tomb, two more Blackwater hands at Faldir's Cove, Stromgarde's
-- reagent seller and cavalry lieutenant, and Genavie Callow (Undercity), whose grudge lies in Arathi.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Androd Fadran: leatherworking supplies at Refuge Pointe.
P:NPC {
  key = "ar_androd_fadran", id = TODO_NPC("Androd Fadran"), name = "Androd Fadran", title = "Leatherworking Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "plain", "steady" }, values = { "craft", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Androd Fadran sells thread, salt and dyes to leatherworkers out of a tent at Refuge Pointe. He talks about hides the way the soldiers around him talk about the war, as a thing to be got through properly.",
    third = "{name} met Androd Fadran, who sells leatherworking supplies at Refuge Pointe.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you work leather, I've what you need to finish it, and if you don't, there's little in this tent to interest you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Then the raptors have been keeping you in hides, and me in custom." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Those are a leatherworker's hands, cracked from the salt. The highland raptors give a fine hide, if you can take one without ruining it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then do me a kindness and aim for the eye, because I'm tired of being shown hides with a dozen holes in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Androd Fadran. I supply the leatherworkers who follow the militia, because an army in the field wears through straps and boots faster than it wears through swords." } },
      again = {
        { id = "h_again", text = "Was there something more?" },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "What hides come out of the highlands?", next = "hides" },
        { text = "How does a camp like this stay supplied?", next = "supply" },
        { text = "You don't sound like a soldier.", next = "soldier" },
        { text = "Let me see your goods.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Raptor, mostly, which is tough and scaled and takes dye beautifully. The kodo that used to cross the plain are long gone, so the heavy leather has to come up from the south by wagon." } },
      choices = {
        { text = "Where do the raptors run thickest?", next = "raptors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "All over the central plain, and thickest around the stone circles, where sensible people don't go anyway. Mind the big ones with the crests, for they hunt in threes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supply = {
      lines = { { id = "s_default", text = "Badly, and by the Thandol Span when it's passable. Captain Nials counts every wagon that comes in, and I count every spool, and neither of us ever likes the number." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    soldier = {
      lines = { { id = "so_default", text = "I'm not one, and I've never claimed to be. Stromgarde has lost enough fighting men that it can't spare one to mind a tent, so it's left to people like me to keep their boots on their feet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a supplier, and I followed the militia to Refuge Pointe because that's where the work is." } },
    _none = { { id = "tp_none", text = "I can't help you with that. Ask Captain Nials, if she has a moment, which she won't." } },
  },
}

-- Apothecary Jorell: Royal Apothecary Society, working at Go'Shek Farm.
P:NPC {
  key = "ar_apothecary_jorell", id = TODO_NPC("Apothecary Jorell"), name = "Apothecary Jorell", gender = "male",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "goshek_watch" }, temper = { "cold", "absorbed" }, values = { "knowledge", "loyal" },
  notices = { "race", "craft" },
  impression = {
    first = "Apothecary Jorell has turned a farmhouse at Go'Shek Farm into a workroom, and he hardly looked up from his notes. He sends a courier to Tarren Mill at intervals, and he would not say what the courier carries.",
    third = "{name} met Apothecary Jorell of the Royal Apothecary Society, at work on something at Go'Shek Farm.",
  },
  greetings = {
    { id = "g_default", text = "Do not touch the table, and do not breathe on the flasks. Now, what is it that could not wait?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust you have washed since you were last near my samples." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's own, at least. You may stand closer than the others, since you have less to lose by it." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You are warm, and you perspire, and both are contaminants. Kindly stay by the door." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, are you? Then you will understand why I do not explain my work to passers-by." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Apothecary Jorell, of the Royal Apothecary Society. The farm supplies what my work requires, which is quiet, livestock, and a great distance from anyone who would ask questions." } },
      again = {
        { id = "h_again", text = "Yes? My solutions are cooling while you think." },
        { id = "h_again2", text = "Ask, and be brief about it." },
      },
      choices = {
        { text = "What are you working on?", next = "work" },
        { text = "Why here, on a farm in Arathi?", next = "farm" },
        { text = "Your courier rides to Tarren Mill.", next = "courier" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "A refinement, let us say, of the Society's great undertaking. The Dark Lady has asked for a plague of our own making, and each of us contributes what he can.", fx = { learn = { "new_plague" } } } },
      choices = {
        { text = "A plague meant for whom?", next = "whom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    whom = {
      lines = { { id = "wh_default", text = "For the Scourge that made us, and for anyone else who would see the Forsaken put back in the ground. I find the list grows longer the more I consider it, and that does not trouble me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    farm = {
      lines = { { id = "f_default", text = "The humans who worked this land left their animals behind, and animals are honest subjects, for they do not pretend to feel better than they do. Hammerfall's orcs keep the Alliance looking the other way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    courier = {
      lines = { { id = "c_default", text = "You are observant, which is not always healthy. My notes and samples go to Apothecary Lydon in Tarren Mill, who is competent, and I use that word of very few." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a physician in Lordaeron, once. The work is much the same, with the purpose reversed." } },
    new_plague = { { id = "tp_np", text = "The Society's work, and not a subject for idle talk. You will know it when it is ready." } },
    _none = { { id = "tp_none", text = "That is outside my field, and so it is of no interest to me. Good day." } },
  },
}

-- Caretaker Alaric: one of three who keep Trollbane's tomb in the crypt of Stromgarde.
P:NPC {
  key = "ar_caretaker_alaric", id = TODO_NPC("Caretaker Alaric"), name = "Caretaker Alaric", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stromgarde" }, temper = { "grave", "stern" }, values = { "dutiful", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Caretaker Alaric stands watch in the crypt of Stromgarde, before the tomb of Thoras Trollbane and the sword laid with him. He is the eldest of three caretakers, and he speaks as though the dead king could hear.",
    third = "{name} met Caretaker Alaric, the senior keeper of Trollbane's tomb in Stromgarde.",
  },
  greetings = {
    { id = "g_default", text = "Lower your voice, {class}. You stand in the resting place of a king of Stromgarde, and we keep silence here." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the crypt. Pay your respects if you will, and touch nothing." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A knight of the Light is welcome here. Lord Trollbane stood with Lothar and Uther in the war, and he would have been glad of you." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You have the blood of Arathor in you, as all our people do. This is where it began, and you should see it once." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Alaric, caretaker of this crypt. Nevlin, Weston and I keep the tomb of Thoras Trollbane, and the blade Trol'kalar that lies with him, and we shall keep them while one of us draws breath." } },
      again = {
        { id = "h_again", text = "What more would you know? Speak softly." },
        { id = "h_again2", text = "Ask, {class}, and then leave him his peace." },
      },
      choices = {
        { text = "Who was Thoras Trollbane?", next = "thoras" },
        { text = "Tell me of the sword.", next = "sword" },
        { text = "Three men seems a thin guard for a king.", next = "guard" },
        { text = "I'll leave him his peace.", next = "END" },
      },
    },
    thoras = {
      lines = { { id = "t_default", text = "The lord of Stromgarde, and the staunchest ally the old Alliance ever had. He held these highlands against the Horde in the Second War, and he lived to see his city fall to thieves and ogres afterward, which was the crueller wound." } },
      choices = {
        { text = "How did he die?", next = "death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    death = {
      lines = { { id = "d_default", text = "By an assassin's hand, and the whole truth of it is not known to me. Prince Galen leads what remains of us now, and it is not a caretaker's place to say more than that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sword = {
      lines = { { id = "s_default", text = "Trol'kalar, which in the old tongue means the slayer of trolls. The house of Trollbane carried it against the Amani in the first days of Arathor, and the tomb is sealed so that no hand takes it up unworthily." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g_default2", text = "It is what Stromgarde can spare, with the Syndicate in the streets above and the Boulderfist at the walls. We are few, but none has passed us yet, and I do not intend that you shall see the day one does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept this crypt since before the city fell, and I shall keep it after." } },
    syndicate = { { id = "tp_sy", text = "Thieves with noble names, squatting in a king's city. They have not dared the crypt." } },
    _none = { { id = "tp_none", text = "That is a matter for the living, and I tend the dead. Ask above." } },
  },
}

-- Caretaker Nevlin: the second keeper of Trollbane's tomb.
P:NPC {
  key = "ar_caretaker_nevlin", id = TODO_NPC("Caretaker Nevlin"), name = "Caretaker Nevlin", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stromgarde" }, temper = { "wary", "blunt" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Caretaker Nevlin keeps the tomb of Thoras Trollbane with two others, and he watched my hands the whole time I was in the crypt. He seems to expect thieves, and to be a little disappointed each time a visitor is honest.",
    third = "{name} met Caretaker Nevlin, the wariest of the keepers of Trollbane's tomb.",
  },
  greetings = {
    { id = "g_default", text = "That's far enough. Keep your hands where I can see them, and tell me what brings you down here." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I counted the candlesticks after you left, and you may thank your luck they were all there." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know your trade by the way you walk. The Syndicate has sent better thieves than you down these stairs, and they are buried cheaper than the king." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighter, at least, and not a skulker. There's honest work killing Syndicate in the streets above, if you want it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Nevlin, caretaker. Alaric does the reverence and Weston does the sweeping, and I do the watching, because there's a sword in that tomb that every thief in Arathi would like to sell." } },
      again = {
        { id = "h_again", text = "Well? What else?" },
        { id = "h_again2", text = "Ask it, and keep your hands still." },
      },
      choices = {
        { text = "Who would steal from a king's tomb?", next = "thieves" },
        { text = "How is the tomb protected?", next = "sealed" },
        { text = "You don't trust anyone, do you?", next = "trust" },
        { text = "I'll go, and take nothing.", next = "END" },
      },
    },
    thieves = {
      lines = { { id = "t_default", text = "The Syndicate, for a start, since they hold half the city over our heads and would love a relic to bargain with. And the trolls of the highlands have hated that blade for longer than there has been a Stromgarde.", fx = { learn = { "syndicate" } } } },
      choices = {
        { text = "The trolls remember it that well?", next = "trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "tr_default", text = "It was forged to kill them, and it did so for generations. The Witherbark would give a great deal to see it broken, and I've heard the Horde's trolls feel no differently." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sealed = {
      lines = { { id = "s_default", text = "The tomb is sealed, and the seal wants more than a crowbar to open it, which is all I'll say on the matter. Beyond that there are the three of us, and we don't sleep at the same time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "tu_default", text = "I trust Alaric and Weston, and I trusted the old king. Stromgarde trusted its neighbours once, and you can see above us what that bought." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a soldier of Stromgarde before I was a caretaker. It's the same duty in a quieter room." } },
    syndicate = { { id = "tp_sy", text = "Alterac's leavings, robbing a city they couldn't have taken in a fair fight." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd not tell a stranger if I did." } },
  },
}

-- Caretaker Weston: the youngest keeper of Trollbane's tomb.
P:NPC {
  key = "ar_caretaker_weston", id = TODO_NPC("Caretaker Weston"), name = "Caretaker Weston", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stromgarde" }, temper = { "gentle", "wistful" }, values = { "dutiful", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "Caretaker Weston is the youngest of the three who keep Trollbane's tomb, and he trims the candles and sweeps the stone with real tenderness. He was glad of a living voice in the crypt, though he tried not to show it in front of the others.",
    third = "{name} met Caretaker Weston, the youngest keeper of Trollbane's tomb in Stromgarde.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a visitor! Forgive me, we see so few down here that I forget how to greet one properly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I'm glad, though Nevlin will pretend he isn't." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Would you say a word over him before you go? We keep the rites as best we can, but none of us is ordained." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in our crypt! Your masons would have something to say about our stonework, I expect, and none of it kind." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Weston, the junior caretaker, which means I trim the wicks and sweep the dust while Alaric prays and Nevlin glowers. It's an honour to tend Lord Trollbane, and I mean that, though the days are long." } },
      again = {
        { id = "h_again", text = "Is there anything else? I don't mind talking." },
        { id = "h_again2", text = "Please, go on." },
      },
      choices = {
        { text = "What does a caretaker do all day?", next = "day" },
        { text = "Do you ever go up into the city?", next = "city" },
        { text = "Nevlin seems a hard man to work beside.", next = "nevlin" },
        { text = "Keep the candles lit, Weston.", next = "END" },
      },
    },
    day = {
      lines = { { id = "d_default", text = "We keep the lamps burning, the stone clean and the damp out, and we stand our watches in turn. It sounds like little, I know, but a tomb that isn't tended is only a hole with a name over it." } },
      choices = {
        { text = "Did you know the king in life?", next = "king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I saw him ride out once, when I was a boy, with the red banners behind him. I thought then that nothing could ever happen to Stromgarde while he was in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "Seldom, and never far. Our soldiers hold only a corner of it now, and the rest belongs to Syndicate cut-throats and ogres, so the crypt is honestly the safest room in Stromgarde." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nevlin = {
      lines = { { id = "n_default", text = "He's better than he sounds. He stood a double watch for me when I had a fever, and never mentioned it after, except to complain about my sweeping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up in Stromgarde, and I've tended the crypt since I was old enough to be trusted with it." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Alaric might, for he knows all the old histories." } },
  },
}

-- Deckhand Moishe: Blackwater Raider at Faldir's Cove.
P:NPC {
  key = "ar_deckhand_moishe", id = TODO_NPC("Deckhand Moishe"), name = "Deckhand Moishe", title = "Blackwater Raiders", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "faldirs_cove", "blackwater" }, temper = { "grumbling", "sharp" }, values = { "profit", "self" },
  notices = { "class", "race" },
  impression = {
    first = "Deckhand Moishe is a goblin of the Blackwater Raiders, stuck at Faldir's Cove with the rest of the salvage crew, and he has a running tally of what the delay is costing him. He does the work nobody else wants and bills for it in his head.",
    third = "{name} met Deckhand Moishe, a goblin of the Blackwater Raiders stranded at Faldir's Cove.",
  },
  greetings = {
    { id = "g_default", text = "Yeah, yeah, whaddaya want? If it's a job, I'm busy, and if it's a payin' job, I just got free." },
    { id = "g_back", when = { metBefore = true }, text = "You again, pal? Still no tide, still no wages, so nothin's changed but my mood, and that got worse." },
  },
  notice = {
    { id = "n_swim", cat = "class", when = { class = { "DRUID", "SHAMAN" } },
      text = "Hey, you're one of them types that can breathe water or turn into a fish or somethin', right? Then you're worth more to this crew than I am, and I hate that." },
    { id = "n_goblin_friend", cat = "race", when = { race = "Gnome" },
      text = "A gnome, huh? Stay off the cannon, shorty, 'cause I only just got it pointin' the right way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deckhand Moishe, Blackwater Raiders. I signed on for a quick salvage run and a share of the take, and what I got was a reef, two sunk ships and a beach fulla naga, so you could say the contract ain't workin' out." } },
      again = {
        { id = "h_again", text = "What else? Clock's runnin', friend." },
        { id = "h_again2", text = "Go on, I'm scrubbin' and listenin'." },
      },
      choices = {
        { text = "What were you sent to salvage?", next = "salvage" },
        { text = "What's a deckhand's share of nothing?", next = "share" },
        { text = "What do you think of your captain?", next = "captain" },
        { text = "Back to work, Moishe.", next = "END" },
      },
    },
    salvage = {
      lines = { { id = "s_default", text = "There's wrecks all over the Drowned Reef, pal, and wrecks mean cargo nobody's got a receipt for. Trouble is the naga figure it's theirs, and they got more arms than we got crew." } },
      choices = {
        { text = "So the treasure's still down there.", next = "down" },
        { text = "Something else.", next = "BACK" },
      },
    },
    down = {
      lines = { { id = "d_default", text = "Every last copper of it, sittin' under forty feet of water and a pile of snake-women. If you're the swimmin' kind, the captain's hirin', and I get a finder's fee for sayin' so, so mention my name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    share = {
      lines = { { id = "sh_default", text = "Nothin', and I checked the sums twice hopin' they'd come out different. First Mate Nilzlix keeps tellin' me the tide's gonna turn, but he's been sayin' that for weeks and the only thing that's turned is the biscuit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    captain = {
      lines = { { id = "c_default", text = "O'Breen? He's all swagger till somebody mentions Fleet Master Seahorn, and then he goes the colour of bilge water. He ain't the worst I sailed under, though, on account of the worst is at the bottom of the reef." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Blackwater deckhand outta Booty Bay, and I'm owed back pay. That's my whole life story, pal." } },
    bloodsail = { { id = "tp_bs", text = "Red-sashed scum. We sink 'em on sight, and that part of the job I'd do for free." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, ain't paid to. Ask the first mate." } },
  },
}

-- First Mate Nilzlix: first mate of the Blackwater salvage expedition at Faldir's Cove.
P:NPC {
  key = "ar_first_mate_nilzlix", id = TODO_NPC("First Mate Nilzlix"), name = "First Mate Nilzlix", title = "Blackwater Raiders", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "faldirs_cove", "blackwater" }, temper = { "brisk", "calculating" }, values = { "profit", "loyal" },
  notices = { "class", "kit" },
  impression = {
    first = "First Mate Nilzlix keeps the Blackwater crew at Faldir's Cove fed, armed and more or less sober while Captain O'Breen does the shouting. He has the whole disaster worked out as a ledger, with a column for what can still be recovered.",
    third = "{name} met First Mate Nilzlix, who keeps the Blackwater Raiders' crew in order at Faldir's Cove.",
  },
  greetings = {
    { id = "g_default", text = "Ahoy there. State your business quick, friend, because I got a crew to run and every hour of it costs the fleet money." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the cove, huh? Good, 'cause a returning hand is cheaper than training a new one." },
  },
  notice = {
    { id = "n_fighter", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } },
      text = "You look like you can handle yourself in a scrap, and we got naga coming up the beach at low tide, so I'd call that a business opportunity for both of us." },
    { id = "n_kit", cat = "kit", when = { minLevel = 35 },
      text = "That's quality gear you're hauling, pal. Somebody with your kind of overhead oughta be looking for a salvage share." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "First Mate Nilzlix, of the Blackwater Raiders. The captain's the one with the hat and the voice, and I'm the one who knows how many barrels of water we got left, so if you want something done, you talk to me." } },
      again = {
        { id = "h_again", text = "What else? Keep it short, I'm tallying." },
        { id = "h_again2", text = "Go on, friend, time's money." },
      },
      choices = {
        { text = "How did the fleet end up stranded here?", next = "stranded" },
        { text = "What's your plan to get out?", next = "plan" },
        { text = "Your deckhand says the tide never turns.", next = "moishe" },
        { text = "Carry on, First Mate.", next = "END" },
      },
    },
    stranded = {
      lines = { { id = "s_default", text = "A reef that ain't on any chart, that's how. The Maiden's Folly and the Spirit of Silverpine went down on it, the Harbinger's holed, and the naga took the whole thing personal." } },
      choices = {
        { text = "Who do you blame for it?", next = "blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      lines = { { id = "b_default", text = "Officially? The chartmaker, and I got it in writing. Between you and me, the captain was in a hurry and Steelgut was trying to keep up, but a first mate who says that out loud is a first mate looking for a new ship." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plan = {
      lines = { { id = "p_default", text = "Hold the cove, bring up what cargo we can, patch the Harbinger and sail home with something to show Fleet Master Seahorn besides excuses. The salvage covers the losses, see, as long as the naga let us at it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    moishe = {
      lines = { { id = "m_default", text = "Moishe complains like other folks breathe, and he's still the hardest worker I got. I let him grumble on account of it's free, and it keeps him from asking about his wages." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Blackwater Raider, Booty Bay registered, first mate on this expedition. I keep the books and the crew." } },
    bloodsail = { { id = "tp_bs", text = "The competition, and bad for trade. The Baron pays us to keep them off his water." } },
    _none = { { id = "tp_none", text = "Not in my ledger, pal. Try the captain, if you like being shouted at." } },
  },
}

-- Deneb Walker: sells scrolls, potions and field-surgery manuals in the defended corner of Stromgarde.
P:NPC {
  key = "ar_deneb_walker", id = TODO_NPC("Deneb Walker"), name = "Deneb Walker", title = "Reagents", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "stromgarde" }, temper = { "dry", "tired" }, values = { "practical", "loyal" },
  notices = { "craft", "class" },
  impression = {
    first = "Deneb Walker sells scrolls, potions and manuals of field surgery in the corner of Stromgarde that its soldiers still hold. He is the only shop left in the city, and he said so without any pride.",
    third = "{name} met Deneb Walker, the last shopkeeper in Stromgarde Keep.",
  },
  greetings = {
    { id = "g_default", text = "You got in alive, which already makes you a better customer than most. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece, I see. I'd wondered, after you walked back out through that gate." },
  },
  notice = {
    { id = "n_aid", cat = "craft", when = { profession = "First Aid" },
      text = "You've bandaged a few wounds, by the look of your kit. I carry the manual for the next step, the same one the surgeons in Ironforge send people here for." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST" } },
      text = "A caster. Good, because I've scrolls gathering dust, and the soldiers here would sooner trust a shield." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deneb Walker. I sell what keeps a soldier on his feet, which is to say potions, scrolls and books on how to sew a man shut. In a city under siege from the inside, those are the only trades left worth following." } },
      again = {
        { id = "h_again", text = "Anything else, while you're here?" },
        { id = "h_again2", text = "Go on. I've no queue, as you can see." },
      },
      choices = {
        { text = "Why keep a shop in a ruined city?", next = "why" },
        { text = "Tell me about the surgery manuals.", next = "manual" },
        { text = "How does stock reach you through all this?", next = "stock" },
        { text = "Show me what you have.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because it was my city before it was a ruin, and the men on that wall need bandages more than Stormwind needs another shopkeeper. If I leave, it's one more door the Syndicate gets to kick in." } },
      choices = {
        { text = "How much of Stromgarde is still yours?", next = "yours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yours = {
      lines = { { id = "y_default", text = "This quarter, the chapel and the crypt. The Syndicate has the western streets, the Boulderfist ogres have the south, and Prince Galen has us, which on some days seems the worst bargain of the three.", fx = { learn = { "syndicate" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    manual = {
      lines = { { id = "m_default", text = "They teach the heavier bandages and the craft beyond what a town healer can show you. I started stocking them when our own surgeon died, so that somebody on the wall would know how to do his work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "A runner brings it from Refuge Pointe by night, when the ogres are sleeping off their supper. I've lost two runners this year, and I knew both their mothers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in Stromgarde, and still trading in it. There aren't many who can say either." } },
    syndicate = { { id = "tp_sy", text = "They hold the western streets. Masked thieves playing at being lords of Alterac." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. News doesn't reach us here unless it climbs the wall." } },
  },
}

-- Lieutenant Valorcall: Stromgarde's cavalry leader, riding the road between Stromgarde and Dabyrie's Farmstead.
P:NPC {
  key = "ar_lieutenant_valorcall", id = TODO_NPC("Lieutenant Valorcall"), name = "Lieutenant Valorcall", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "stromgarde" }, temper = { "brisk", "proud" }, values = { "dutiful", "honor" },
  notices = { "class", "mount" },
  impression = {
    first = "Lieutenant Valorcall leads what is left of Stromgarde's cavalry, and he rides the road between the keep and Dabyrie's Farmstead with a paladin's straight back. He spoke to me from the saddle and did not slow his horse much to do it.",
    third = "{name} met Lieutenant Valorcall, the paladin who leads Stromgarde's cavalry patrol.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Walk with my horse if you would speak, for the patrol does not halt." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again on the road. It is still Stromgarde's road, and I mean to keep it so." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A {g:brother|sister} of the Silver Hand! The Light has not forgotten Arathi after all. Ride with us a while, if your duty allows." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You have a soldier's bearing. Stromgarde has more horses than riders these days, and that is a hard thing for a cavalryman to say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Lieutenant Valorcall, of the cavalry of Stromgarde. We ride from the keep to the Dabyrie farm and back, so that the farmers may see our banner and the Syndicate may see our lances." } },
      again = {
        { id = "h_again", text = "What else, {class}? Be quick, for the road is long." },
        { id = "h_again2", text = "Speak, and keep pace." },
      },
      choices = {
        { text = "What threatens the road?", next = "threat" },
        { text = "How many riders does Stromgarde have left?", next = "riders" },
        { text = "You wear the Silver Hand's colours.", next = "light" },
        { text = "Ride safely, Lieutenant.", next = "END" },
      },
    },
    threat = {
      lines = { { id = "t_default", text = "Syndicate highwaymen from Northfold, ogres out of the southern hills, and of late Horde riders from Hammerfall who grow bolder each month. Any one of them would cut the farms off from the keep if we let a day pass unridden.", fx = { learn = { "syndicate" } } } },
      choices = {
        { text = "Which of them worries you most?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The Horde, for the others want plunder and the Horde wants the land. Hammerfall was a camp where we once held their kind prisoner, and now they hold it as a fortress, which they did not do by accident." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    riders = {
      lines = { { id = "r_default", text = "Fewer than I would tell an enemy, and fewer than I like to tell a friend. Once the cavalry of Stromgarde could fill this plain from wall to wall, and now I know every horse by name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "I do, and I hold to its vows though the Order itself is scattered. A knight needs no grand master to tell him that the weak must be shielded, and there are weak enough along this road.", fx = { learn = { "silver_hand" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a knight of Stromgarde and a paladin of the Light, and I lead its cavalry, such as remains." } },
    syndicate = { { id = "tp_sy", text = "Brigands who hold Northfold Manor and half our city. They flee from a charge, and I oblige them often." } },
    silver_hand = { { id = "tp_sh", text = "The Order that trained me. It is broken now, though its knights are not." } },
    _none = { { id = "tp_none", text = "I cannot say, {class}. My knowledge ends where this road does." } },
  },
}

-- Genavie Callow: Forsaken in the Undercity's Trade Quarter; her quarrel is with the Dabyries of Arathi.
P:NPC {
  key = "ar_genavie_callow", id = TODO_NPC("Genavie Callow"), name = "Genavie Callow", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "bitter", "furious" }, values = { "vengeance", "status" },
  notices = { "race", "class" },
  impression = {
    first = "Genavie Callow stands in the Trade Quarter of the Undercity and seethes about a family called Dabyrie, who farm in Arathi and who robbed her after the plague took everything else. She no longer wants her things back, only their heads.",
    third = "{name} met Genavie Callow, a Forsaken noblewoman in the Undercity who wants the Dabyrie family of Arathi dead.",
  },
  greetings = {
    { id = "g_default", text = "You have the look of someone who kills for a living. Good, because I have been waiting for exactly that." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Tell me that Kenata Dabyrie is no longer breathing, or tell me nothing at all." },
    { id = "g_done", when = { questDone = TODO_QUEST("To Steal From Thieves") }, text = "Ah, it is you. I have looked at their faces every day since, and I find I do not tire of it." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You died too, so you know what it is to wake and find that the living have helped themselves to your life." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You still have a pulse, and I shall try not to hold it against you. It is the fat, thriving, human living that I cannot bear." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A knife in the dark would do nicely, though I confess I should prefer that they see it coming." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Genavie Callow, and there was a time when that name opened doors in Lordaeron. The plague took my family, the war took our estate, and then a woman named Kenata Dabyrie took the little that was left." },
        { id = "h_active", when = { questActive = TODO_QUEST("To Steal From Thieves") }, text = "Kill them all, Kenata and her two wretched children, and bring me their heads. The farm lies northeast of the Alliance's camp at Refuge Pointe." },
        { id = "h_done", when = { questDone = TODO_QUEST("To Steal From Thieves") }, text = "Three heads, and all of them wearing the same surprised look. I thought that revenge might feel hollow, and I am pleased to report that it does not." },
      },
      again = {
        { id = "h_again", text = "What else do you wish to pick over?" },
        { id = "h_again2", text = "Ask, then. I have nothing left but time." },
      },
      choices = {
        { text = "What did the Dabyries take from you?", next = "took" },
        { text = "Who was your family?", next = "family" },
        { text = "Where do I find these Dabyries?", next = "farm" },
        { text = "You call yourself Forsaken as if it were an insult.", next = "forsaken" },
        { text = "I've heard enough.", next = "END" },
      },
    },
    took = {
      lines = { { id = "t_default", text = "The last precious belongings I had, the few things saved when the estate was looted and burned. Kenata was beneath us then, and she had the audacity to carry them off while I lay dead." } },
      choices = {
        { text = "Do you want them returned?", next = "returned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    returned = {
      lines = { { id = "r_default", text = "I did, once. I no longer care for the things themselves, because I have had a long while down here to think, and what I want now is for her to have nothing either." } },
      choices = {
        { text = "Her children as well?", next = "children" },
        { text = "Something else.", next = "BACK" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Fardel and Marcel are grown, and they have eaten well off what was mine. My own family did not get the mercy of growing old, so do not ask me to weep for hers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "The Callows were an old house, with land and a good name and a pew near the front. Every one of them died in the plague, and I alone got up again, which I have never been certain was a favour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    farm = {
      lines = { { id = "fa_default", text = "They keep a farmstead in the Arathi Highlands, northeast of Refuge Pointe, and I am told it is healthy and prospering. Stromgarde's riders pass that way, so do not linger over the work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "It is an accurate name, and I wear it. The Dark Lady gave us a city and a purpose, and I am grateful, but nothing she gives will make Kenata Dabyrie's good health any easier to stomach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a Callow of Lordaeron. Now I am a corpse with a grievance, and the grievance keeps me upright." } },
    _none = { { id = "tp_none", text = "I neither know nor care. Unless it concerns the Dabyries, do not trouble me with it." } },
  },
}
