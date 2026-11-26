-- Arathi, the folk a roster scan found missing: Refuge Pointe's leather supplier, the apothecary at Go'Shek
-- Farm, the three caretakers of Trollbane's tomb, two more Blackwater hands at Faldir's Cove, Stromgarde's
-- reagent seller and cavalry lieutenant, and Genavie Callow (Undercity), whose grudge lies in Arathi.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
    ybefore = {
      lines = {
        { id = "yarapothecaryjorell1", text = "A physician in Stratholme, with a practice on the market square and a wife who disliked the smell of my hands. I treated fevers, broken bones and the vanity of lords. The grain killed my patients first, and then me." },
      },
      choices = {
        { text = "Do you remember your wife?", next = "ywife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywife = {
      lines = {
        { id = "yarapothecaryjorell2", text = "Her face, no. Her voice, yes, telling me to wash before supper. I find I wash my hands far more often now, and there is no supper. Make of that what you will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yrefuge = {
      lines = {
        { id = "yarapothecaryjorell3", text = "Commander Amaren sends scouts to watch this farm. One of them, a woman, sat in the grass for two days counting my couriers. I could have had her killed. I let her count. A dead scout only brings a living army." },
      },
      choices = {
        { text = "Should you have killed her?", next = "ykill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykill = {
      lines = {
        { id = "yarapothecaryjorell4", text = "The Society would say yes. Varimathras would say yes, and enjoy saying it. I find I have no taste for it, which is a weakness the Society does not tolerate. What would you have done?" },
      },
      choices = {
        { text = "Kill her. The work must stay secret.", next = "BACK", reply = "That is the Society's answer, and probably the correct one. I will consider it.", fx = { align = { light = -1 } } },
        { text = "Spare her. Not every life is an obstacle.", next = "BACK", reply = "A sentimental view. Perhaps the only one I have left.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What were you, before the plague?", next = "ybefore" },
        { text = "Do you trust the humans at Refuge Pointe to stay away?", next = "yrefuge" },
        { text = "Will the plague truly spare us?", next = "BACK", when = { race = "Scourge" }, reply = "That is the intent, and the Dark Lady's command. Intent and outcome are not always on speaking terms, so I test, and test again." },
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
    stratholme = { { id = "yarapothecaryjorell5", text = "I practised medicine there. The grain killed my patients first." } },
    lydon = { { id = "yarapothecaryjorell6", text = "Apothecary Lydon, in Tarren Mill. He receives my notes and thinks himself my superior." } },
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
    ykeep = {
      lines = {
        { id = "yarcaretakeralaric1", text = "My father kept it before me, and his father before him. Our family has tended the dead of House Trollbane for six generations. I was meant to be a scribe, but the Second War took my brothers, and so the keys came to me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygalen = {
      lines = {
        { id = "yarcaretakeralaric2", text = "That he would come down here, once, and kneel before his father. He has not, not since the burial. Some say he fears the ghost, and some say he fears his own failure. I do not know which." },
      },
      choices = {
        { text = "Should he come?", next = "ycome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycome = {
      lines = {
        { id = "yarcaretakeralaric3", text = "I have thought of writing to him, but Nevlin says a caretaker has no place lecturing a prince. Weston says the dead deserve their sons. I am caught between them." },
      },
      choices = {
        { text = "Nevlin is right. It's not your place to lecture.", next = "BACK", reply = "Aye. I will keep my silence, and keep the candles lit for him.", fx = { align = { order = 1 } } },
        { text = "Write to him. The king deserves his son.", next = "BACK", reply = "Then I will. If he is angry, I will bear it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhistory = {
      lines = {
        { id = "yarcaretakeralaric4", text = "Thoradin united the tribes of men against the Amani nearly three thousand years ago, and built Strom where these ruins stand. Every king since has drawn his blood from that line. Lord Thoras was the last to rule from here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How did you come to keep the crypt?", next = "ykeep" },
        { text = "What would you have of Prince Galen?", next = "ygalen" },
        { text = "I'll pay my respects to the king.", next = "BACK", when = { race = "Human" }, reply = "Kneel there, by the steps, and say his name. Thoras Trollbane. He would have been glad to hear it from one of his own people." },
        { text = "Tell me of Stromgarde's history.", next = "yhistory" },
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
    galen = { { id = "yarcaretakeralaric5", text = "The prince. He leads from Refuge Pointe, and he does not come here." } },
    thoradin = { { id = "yarcaretakeralaric6", text = "The first king of Arathor. All of us descend from him, one way or another." } },
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
    ywatch = {
      lines = {
        { id = "ybarcaretakernevlin1", text = "The night the keep fell. We heard the screaming through the stone, and Alaric wanted to go up and help. I held the door shut against him, because the king's tomb was our charge. I still hear it some nights." },
        { id = "ybarcaretakernevlin2", when = { class = { "WARRIOR", "PALADIN" } }, text = "You'll know that kind of watch, I'd guess. The kind where your duty and your heart pull opposite ways." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysoldier = {
      lines = {
        { id = "yarcaretakernevlin1", text = "Pikeman in the Stromic line, at the walls when the Horde came in the Second War. We held, and the king rode out at the head of the cavalry and broke them in the valley. Best day of my life, and I lost two friends in it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytried = {
      lines = {
        { id = "yarcaretakernevlin2", text = "Twice. The first time, a lad with a crowbar who ran when I lit the lamp. The second time, three men with masks and good boots. Only one went back up the stairs, and he didn't go back up whole." },
      },
      choices = {
        { text = "You killed them?", next = "ykilled" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykilled = {
      lines = {
        { id = "yarcaretakernevlin3", text = "I did, and I'd do it again. Alaric says I should have let them surrender and handed them to Refuge Pointe. Maybe so. What would you have done?" },
      },
      choices = {
        { text = "Handed them over. Let the law judge them.", next = "BACK", reply = "Law. Aye, that's what Alaric said. I'll try it next time, if there is one.", fx = { align = { order = 1 } } },
        { text = "Done the same. Thieves in a king's tomb get no mercy.", next = "BACK", reply = "That's what I told Alaric. He prayed for them anyway, the soft old fool.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What did you do as a soldier?", next = "ysoldier" },
        { text = "Have the Syndicate ever tried the crypt?", next = "ytried" },
        { text = "I'm no thief. Not here.", next = "BACK", when = { class = "ROGUE" }, reply = "Not here, you say. That's the most honest thing a rogue's ever said to me. Stay honest, and stay out." },
        { text = "What's the worst watch you've stood?", next = "ywatch" },
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
    alaric = { { id = "yarcaretakernevlin4", text = "He prays, I watch. We get along." } },
    weston = { { id = "yarcaretakernevlin5", text = "The boy. He sweeps, and he's kinder than either of us." } },
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
    yfav = {
      lines = {
        { id = "ybarcaretakerweston1", text = "Lighting the lamps at dusk. The whole crypt goes gold, and the carvings on the walls seem to move. Alaric says the old kings are watching. I like to think they're pleased." },
        { id = "ybarcaretakerweston2", when = { race = "Dwarf" }, text = "Your masons would admire the carvings, I think, even if they'd grumble about the joins." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = {
        { id = "yarcaretakerweston1", text = "Sometimes, when I hear the soldiers marching above us. I'd like to see Stormwind, or Ironforge, or the sea. But Alaric's old, and Nevlin's tired, and someone has to keep the lamps burning when they can't." },
      },
      choices = {
        { text = "Would they let you go?", next = "ylet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylet = {
      lines = {
        { id = "yarcaretakerweston2", text = "Alaric would, I think. Nevlin says I'd be a fool to leave, and a worse fool to stay. Should I go, do you think, while I'm still young?" },
      },
      choices = {
        { text = "Stay. Your duty is here, with them.", next = "BACK", reply = "You're right. Someone has to be the next Alaric, and it may as well be me.", fx = { align = { honor = 1 } } },
        { text = "Go. See the world before it's too late.", next = "BACK", reply = "I might. Next spring, maybe. Don't tell Nevlin, he'll only scoff.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysword = {
      lines = {
        { id = "yarcaretakerweston3", text = "Only what Alaric tells me, and what I see when I dust the case. It's old and plain, not grand like the stories. But sometimes when I pass it, it feels warm, like a fire someone just left." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yghosts = {
      lines = {
        { id = "yarcaretakerweston4", text = "Nevlin says I imagine it. But some nights I hear footsteps by the king's tomb, slow, like an old man walking. I've never seen anything. I leave a candle there now, just in case." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Do you ever want to leave the crypt?", next = "yleave" },
        { text = "What do you know of Trol'kalar?", next = "ysword" },
        { text = "I'll say a word over him.", next = "BACK", when = { class = "PRIEST" }, reply = "Thank you. Thank you. I'll light the big candle, the one we save for feast days. He deserves it." },
        { text = "Is the crypt haunted?", next = "yghosts" },
        { text = "What's your favourite part of the job?", next = "yfav" },
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
    sword = { { id = "yarcaretakerweston5", text = "Trol'kalar. It feels warm sometimes, like a fire someone just left." } },
    alaric = { { id = "yarcaretakerweston6", text = "He knows all the old histories. He'll tell you, if you've an hour." } },
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
    yreef = {
      lines = {
        { id = "ybardeckhandmoishe1", text = "Pretty, from the shore. Blue water, coral, wrecks everywhere. Then the naga come up out of it, and the pretty stops real quick. I seen a deckhand dragged under by his ankle. Never came up." },
        { id = "ybardeckhandmoishe2", when = { class = { "SHAMAN", "DRUID" } }, text = "You'd breathe down there, maybe. If you bring up a chest, I'll split it with you fifty-fifty." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yraider = {
      lines = {
        { id = "yardeckhandmoishe1", text = "Grew up on the docks in Booty Bay, sellin' fish heads to the sharks. Signed on with Revilgaz's fleet when I was twelve 'cause the pay was steady and the food was better. Then they sent me here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydo = {
      lines = {
        { id = "yardeckhandmoishe2", text = "Buy a little stall on the Bay docks and sell grog to sailors, an' never set foot on a deck again. That's the dream, pal. Instead I'm scrubbin' a cannon on a beach full of murlocs and snake-women." },
      },
      choices = {
        { text = "Why not quit?", next = "yquit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yquit = {
      lines = {
        { id = "yardeckhandmoishe3", text = "Desert, you mean? O'Breen would hang me from the mast. Nilzlix says I should stick it out and get paid eventually. My gut says grab a boat an' row for it. What'd you do?" },
      },
      choices = {
        { text = "Stick it out. A contract's a contract.", next = "BACK", reply = "Yeah, yeah, that's what Nilzlix says. Fine. Another week.", fx = { align = { order = 1 } } },
        { text = "Row for it. They broke the deal first.", next = "BACK", reply = "That's what I'm sayin'! You'd make a great pirate, pal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How'd you end up a Blackwater Raider?", next = "yraider" },
        { text = "What would you do with your share?", next = "ydo" },
        { text = "Fellow goblin. Need a better contract?", next = "BACK", when = { race = "Goblin" }, reply = "Contract? Pal, I'd sign anything that pays in coin and not promises. Write it up and I'll look it over." },
        { text = "What's the Drowned Reef like?", next = "yreef" },
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
    booty_bay = { { id = "yardeckhandmoishe4", text = "Home. The finest den o' thieves an' merchants in the world." } },
    nilzlix = { { id = "yardeckhandmoishe5", text = "First mate. Says the pay's comin'. It ain't." } },
    background = { { id = "tp_bg", text = "I'm a Blackwater deckhand outta Booty Bay, and I'm owed back pay. That's my whole life story, pal." } },
    bloodsail = { { id = "tp_bs", text = "Red-sashed scum. We sink 'em on sight, and that part of the job I'd do for free." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, ain't paid to. Ask the first mate." } },
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
    ybuy = {
      lines = {
        { id = "ybardenebwalker1", text = "Bandages, then healing potions, then anything that'll get them drunk. I don't sell the last, but I know who does, and I send them there. A soldier on the wall needs something to look forward to." },
        { id = "ybardenebwalker2", when = { profession = "First Aid" }, text = "You'll know the bandages, then. The heavy ones sell out first, every time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yrunners = {
      lines = {
        { id = "yardenebwalker1", text = "A girl named Lisbet, and a boy named Corwin. Both from the farms, both quick on their feet. The ogres caught Lisbet, and I don't know what happened to Corwin. I still keep their wages in a box under the counter." },
      },
      choices = {
        { text = "Will you keep sending runners?", next = "ykeep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykeep = {
      lines = {
        { id = "yardenebwalker2", text = "I have to, or the men on the wall go without bandages. But every time I send one, I wonder if I'm buying a soldier's life with a child's. Should I stop?" },
      },
      choices = {
        { text = "Stop. No child should die for a bandage.", next = "BACK", reply = "Then I'll carry it myself, at night, if I must.", fx = { align = { light = 1 } } },
        { text = "Keep sending them. The soldiers need it.", next = "BACK", reply = "I know. I know. It doesn't make it easier to watch them go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybefore = {
      lines = {
        { id = "yardenebwalker3", text = "I kept a small shop by the market, selling herbs and ointments to the noble houses. They're all gone now, the houses, and I sell to soldiers instead. They pay less, but they thank me more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Who were the runners you lost?", next = "yrunners" },
        { text = "What did you do before the war?", next = "ybefore" },
        { text = "I could help heal your soldiers.", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, reply = "Then go up to the wall and ask for the sergeant. He'll put you to work before you've put your bag down." },
        { text = "What do the soldiers buy most?", next = "ybuy" },
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
    lisbet = { { id = "yardenebwalker4", text = "A runner. The ogres caught her. I keep her wages under the counter." } },
    market = { { id = "yardenebwalker5", text = "I kept a shop there, before. It's Syndicate ground now." } },
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
    yhand = {
      lines = {
        { id = "yarlieutenantvalorcall1", text = "I was squire to Lord Trollbane's champion, and when Uther came to Stromgarde to seek knights for his new Order, I was chosen. I trained in Lordaeron's capital, and came home a paladin. That was a long time ago." },
        { id = "yarlieutenantvalorcall2", when = { race = "Human" }, text = "You'll know the stories of Uther, I expect. I met him once. He was kinder than the stories say." },
      },
      choices = {
        { text = "Is the Order still alive?", next = "yorder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yorder = {
      lines = {
        { id = "yarlieutenantvalorcall3", text = "In spirit, yes. Uther is dead, and the capital is fallen, and the Order has no grand master. Some knights say we should rebuild it as it was, and some say the Light needs no order at all, only knights who keep their vows." },
      },
      choices = {
        { text = "Rebuild it. The Light needs a strong order.", next = "BACK", reply = "I hope to see it, before I am too old to ride.", fx = { align = { order = 1 } } },
        { text = "The Light needs no order, only true knights.", next = "BACK", reply = "Perhaps. Many of us live that way already.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhammerfall = {
      lines = {
        { id = "yarlieutenantvalorcall4", text = "We built it after the Second War, to hold the orcs we'd captured. I stood guard there as a young knight. I did not think it wrong then. I wonder now. Those orcs were prisoners, not soldiers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How did you come to the Silver Hand?", next = "yhand" },
        { text = "What do you think of Hammerfall?", next = "yhammerfall" },
        { text = "Ride with me, then, a little way.", next = "BACK", when = { class = "PALADIN" }, reply = "Gladly. It's been long since I rode beside a brother of the Order. The Light shines a little brighter on the road today." },
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
    uther = { { id = "yarlieutenantvalorcall5", text = "Uther the Lightbringer. I met him once. He was kinder than the stories say." } },
    trollbane = { { id = "yarlieutenantvalorcall6", text = "My lord, and my king. I rode in his guard." } },
    background = { { id = "tp_bg", text = "I am a knight of Stromgarde and a paladin of the Light, and I lead its cavalry, such as remains." } },
    syndicate = { { id = "tp_sy", text = "Brigands who hold Northfold Manor and half our city. They flee from a charge, and I oblige them often." } },
    silver_hand = { { id = "tp_sh", text = "The Order that trained me. It is broken now, though its knights are not." } },
    _none = { { id = "tp_none", text = "I cannot say, {class}. My knowledge ends where this road does." } },
  },
}

