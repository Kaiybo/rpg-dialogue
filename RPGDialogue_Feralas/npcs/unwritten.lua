-- Feralas, folk no earlier pass reached: Thalanaar's traders and trainers (Kristy Grant, Rendow, Brienna Starglow,
-- Caryssia Moonhunter), Erik and Paige Felixe on the coast road, the Shen'dralar exile Azj'Tordin, little Shay
-- Leafrunner, the lost robot OOX-22/FE, and the gnoll Miblon Snarltooth at the Evoroot nursery.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Azj'Tordin: Shen'dralar who fled Eldre'Thalas.
P:NPC {
  key = "fer_azj_tordin", id = TODO_NPC("Azj'Tordin"), name = "Azj'Tordin", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "grave", "proud" }, values = { "freedom", "knowledge" },
  notices = { "class", "race" },
  impression = {
    first = "Azj'Tordin is a Highborne elf of the Shen'dralar who fled Eldre'Thalas and gave up his long life to do it. He sits in the Lariss Pavilion like a lord in exile, and he is visibly ageing.",
    third = "{name} met Azj'Tordin, a Shen'dralar exile at the Lariss Pavilion in Feralas.",
  },
  greetings = {
    { id = "g_default", text = "A visitor, and not one of the prince's hunters, by the look of you. Sit, if you can bear the company of an old elf who is only now learning to be old." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Pusillin and the Elder Azj'Tordin") }, text = "Have you caught the imp? Pusillin has my book, and without it I am a scholar with nothing left to read." },
    { id = "g_done", when = { questDone = TODO_QUEST("Pusillin and the Elder Azj'Tordin") }, text = "My book is home, thanks to you. I read a page each morning now, and I count the days in a way I never had to before." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You carry the arcane about you like a cloak, mage. Be careful of how much of it you need, because I have seen where that need leads." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Your people drove mine out of Kalimdor's heart for our sins, child of Elune. I will not pretend we did not earn it." },
  },
  start = "hello",
  nodes = {
    hello = {
      big = true,
      lines = { { id = "h_default", text = "I am Azj'Tordin, once of the Shen'dralar. I fled the city you call Dire Maul, and in fleeing I gave up the magic that kept me young, so every day I live now is a day I chose." } },
      again = { { id = "h_again", text = "Ask, then. I have time, though each hour of it costs me now, and I find I do not mind the price." } },
      choices = {
        { text = "Why did you flee Eldre'Thalas?", next = "flee" },
        { text = "Who are the Shen'dralar?", next = "shendralar" },
        { text = "What did the imp take?", next = "book" },
        { text = "I'll trust no Highborne.", next = "distrust" },
        { text = "How do you live without the arcane?", next = "withdrawal", when = { class = "MAGE" } },
        { text = "Elune forgives those who turn from the Well.", next = "forgive", when = { race = "NightElf" } },
        { text = "What surprised you most about growing old?", next = "w7_old" },
        { text = "Farewell, elder.", next = "END" },
      },
    },
    w7_old = {
      lines = {
        { id = "w7_old_l1", text = "The aches, first, which I had read about for ten thousand years and never once imagined. Then the way that food tastes better, now that it matters whether I eat it; and the way the sunlight feels warmer, now that I will not see an endless number of mornings." },
      },
      choices = {
        { text = "Do you regret leaving?", next = "w7_old2" },
        { text = "You'll die out here, alone.", next = "w7_old3" },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    w7_old2 = {
      lines = {
        { id = "w7_old2_l1", text = "Never, though some nights I shake with the thirst, and I would weep for a drop of the old power. A life that cannot end was never a life, only a long wait in a beautiful room." },
        { id = "w7_old2_l2", when = { race = "NightElf" }, text = "Never, child of Elune. Your people chose mortality's road long ago, in a way, when you turned from the Well; I chose it only now. I envy you the head start." },
      },
      choices = {
        { text = "I'm glad you left.", next = "BACK", reply = "So am I, most mornings. Thank you for saying it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_old3 = {
      lines = {
        { id = "w7_old3_l1", text = "I will die, certainly, and perhaps alone. But I will die having lived, which is more than any of my people in that city can say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    flee = {
      lines = { { id = "f_default", text = "Prince Tortheldrin keeps our people alive with the power of a demon bound beneath the city. He calls it survival, and I came to call it slavery, so I walked out of the gates before he could stop me." } },
      choices = {
        { text = "A demon, bound under the city?", next = "demon" },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    demon = {
      lines = { { id = "d_default", text = "Immol'thar, held in a prison of pylons, and the Shen'dralar drink of its power like wine. One day the pylons will fail, and I would rather be an old elf in a pavilion than a young one in that city when they do." } },
      choices = {
        { text = "Freedom was worth the price.", next = "BACK", reply = "I believe so, most mornings. On the cold ones I am less certain.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your people needed you there.", next = "BACK", reply = "Perhaps. But a scholar who stays only to be fed is not much use to anyone.", fx = { align = { order = 1 } } },
      },
    },
    shendralar = {
      lines = { { id = "s_default", text = "The last of the Highborne who stayed in Eldre'Thalas when the Well was lost. We kept our books and our pride, and the pride has outlasted almost everything else." } },
      choices = {
        { text = "Who rules them now?", next = "prince" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      lines = { { id = "b_default", text = "My book of lore, which I carried out of the city, and the Crescent Key with it. The imp Pusillin stole them both and fled into Dire Maul, laughing, and imps do not give anything back unless you make them." } },
      choices = {
        { text = "I'll get it back for you.", next = "BACK", when = { questBefore = TODO_QUEST("Pusillin and the Elder Azj'Tordin") }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    distrust = {
      lines = { { id = "di_default", text = "Wise, mostly. We nearly destroyed the world for our hunger, and the hunger is still in us. I ask only that you judge me by what I left behind, not by what I came from." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prince = {
      lines = { { id = "pr_default", text = "Prince Tortheldrin, last of the old line, who would sooner see every elf in the city drained than open the gates to the world. I served in his court for longer than your kingdoms have stood, and I never once heard him admit a mistake." } },
      choices = {
        { text = "Does he hunt you, now that you've left?", next = "hunted" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunted = {
      narr = "He looks past you, toward the trees on the road from Dire Maul.",
      lines = { { id = "hu_default", text = "He sends his hunters to the edge of the forest now and then, but I think he has decided I will die soon enough without his help. He is right, in his way, and I find that I mind it less than I expected." } },
      choices = {
        { text = "Then I'll keep an eye on that road.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    withdrawal = {
      lines = { { id = "wd_default", text = "Badly, at first, with shaking hands and a thirst that no wine would answer. It fades, mage, though not quickly, and what is left afterwards is only an old elf who is surprised by his own reflection." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    forgive = {
      lines = { { id = "fo_default", text = "Your priestesses have been kinder to me than I deserve, child of Elune, and I will not argue theology with kindness. Whether the moon forgives us, I leave to the moon." } },
      choices = { { text = "Something else, elder.", next = "BACK" } },
    },
  },
  topics = {
    dire_maul = { { id = "tp_dm", text = "Eldre'Thalas, I still call it. It was beautiful once, and it is a tomb with lamps lit in it now." } },
    _none = { { id = "tp_none", text = "That is outside what I know, and I know a great deal. Ask someone younger." } },
  },
}

-- Erik Felixe: a human traveller on the coast road.
P:NPC {
  key = "fer_erik_felixe", id = TODO_NPC("Erik Felixe"), name = "Erik Felixe", gender = "male",
  role = "citizen", tier = "service",
  communities = {}, temper = { "cheerful" }, values = { "family" },
  notices = { "race" },
  impression = {
    first = "Erik Felixe and his wife Paige are a pair of Stormwind folk camped near the coast of Feralas, a long way from home and in no hurry to explain why.",
    third = "{name} met Erik Felixe, a Stormwind traveller camped on the Feralas coast.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hello again! Paige, look who it is! Sit, sit, rest your feet with us." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Oh, hello. We're resting. Perhaps another time." },
    { id = "g_default", text = "Hello there! Don't mind us, we're only resting our feet. Paige says I've walked her halfway round Kalimdor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We sailed over from Stormwind to see the world while we're young enough to enjoy it. The elves at Feathermoon think we're mad, and they may be right." } },
      again = { { id = "h_again", text = "Anything else? Ask away, friend; Paige keeps the map and I keep the tall tales, and only one of us ever gets lost." } },
      choices = {
        { text = "Seeing the world while you're young is wise.", next = "BACK", reply = "That's what I keep telling Paige! Thank you!", fx = { align = { light = 1 } } },
        { text = "You should go home before something eats you.", next = "BACK", reply = "Paige says the same. Perhaps you're both right.", fx = { align = { light = -1 } } },
        { text = "Do you ever miss home?", next = "yeri_home" },
        { text = "Why Feralas, of all places?", next = "why" },
        { text = "It's dangerous out here.", next = "danger" },
        { text = "What's the best place you've seen?", next = "xbest" },
        { text = "How did you and Paige meet?", next = "xmet" },
        { text = "You seem very happy for a man so far from home.", next = "xhappy" },
        { text = "I'm from Stormwind too. Where did you live?", next = "xhuman", when = { race = "Human" } },
        { text = "Where do you two sleep out here?", next = "w7_camp" },
        { text = "Safe travels.", next = "END" },
      },
    },
    w7_camp = {
      lines = {
        { id = "w7_camp_l1", text = "Wherever the rain isn't, which in Feralas is a short list. Last night we slept in the roots of a tree so big you could fit our old flat in Stormwind inside it, and a cat the size of a pony walked past us at midnight and didn't even look." },
      },
      choices = {
        { text = "Weren't you frightened?", next = "w7_camp2" },
        { text = "You're lucky to be alive.", next = "w7_camp3" },
        { text = "Something else, Erik.", next = "BACK" },
      },
    },
    w7_camp2 = {
      lines = {
        { id = "w7_camp2_l1", text = "Terrified! I held my sword so tight I couldn't open my hand till morning. Paige slept through the whole thing, and when I told her she said I'd dreamed it, and then we found the paw prints and she went very quiet." },
        { id = "w7_camp2_l2", when = { class = "HUNTER" }, text = "Terrified, and you'd have laughed at me, I'm sure. Paige thinks you hunter types are all mad for liking it out here. Was it a big cat, do you think, or a very small tiger? I genuinely can't tell." },
      },
      choices = {
        { text = "That's a good story, at least.", next = "BACK", reply = "The best one yet! I'll tell it at every inn in Stormwind." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_camp3 = {
      lines = {
        { id = "w7_camp3_l1", text = "So everyone keeps telling me! Lucky's a good thing to be, though. I'd rather be lucky than careful, and Paige is careful enough for both of us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The trees, mostly. You can't imagine trees like these in Elwynn, and the giants walking about the hills like weather. I wanted to see something that wasn't farmland." } },
      choices = {
        { text = "Giants?", next = "giants" },
        { text = "Something else.", next = "BACK" },
      },
    },
    giants = {
      lines = { { id = "g2_default", text = "Great mossy things to the north, slow as old men. The Sentinels say they're mostly peaceful, so we keep our distance and admire them from the road." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "So everyone tells us, and I'm sure they're right. I keep a sword, and Paige keeps me from using it, and between us we've done all right so far." } },
      choices = {
        { text = "Go home before your luck runs out.", next = "BACK", reply = "You sound like my mother. She'd like you.", fx = { align = { order = 1 } } },
        { text = "Good for you. See it while you can.", next = "BACK", reply = "That's what I keep saying!", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    xbest = {
      lines = { { id = "xxbest_d", text = "Feathermoon, at sunset, with the whole bay turned gold and the elves singing on the walls. Paige says it was the Barrens, but she's wrong, because nothing in the Barrens is gold except the dust." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmet = {
      narr = "He glances back at Paige and grins like a man who's still surprised by his luck.",
      lines = { { id = "xxmet_d", text = "At the Goldshire inn, when I spilled a whole jug of ale on her. She made me pay for her dress and then marry her, and I've never had a better bargain." } },
      choices = {
        { text = "Do you ever argue?", next = "xargue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xargue = {
      lines = { { id = "xxargue_d", text = "All the time! She wants to settle down, and I want to see the next hill. What would you do?" } },
      choices = {
        { text = "Settle down. Paige deserves a home.", next = "BACK", reply = "That's what my mother says, and Paige, and now you. I'm outnumbered.", fx = { align = { order = 1 } } },
        { text = "Keep travelling. The world's too big to sit still.", next = "BACK", reply = "Ha! Finally someone on my side. Don't tell Paige.", fx = { align = { order = -1 } } },
      },
    },
    xhappy = {
      lines = { { id = "xxhappy_d", text = "Why wouldn't I be? I've a wife who puts up with me, a map with half the roads marked and no rent to pay. That's happiness to me, even with the giants." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = { { id = "xxhuman_d", text = "The Trade District, above a cobbler's shop. You'll know the smell, all leather and boot polish. I don't miss it much, but I miss the bread from the baker next door." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yeri_home = {
      narr = "Erik scratches the back of his neck and looks out at the sea for a while.",
      lines = {
        { id = "yyeri_home_d", text = "Sometimes, when it's raining here and I think of the rain on the canals back home. My father kept a cobbler's shop under our rooms, and he died the winter before we left. I suppose that's why I wanted to see the world, so I wouldn't die in that shop too." },
      },
      choices = {
        { text = "Was your father unhappy there?", next = "yeri_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeri_father = {
      lines = {
        { id = "yyeri_father_v0", when = { race = "Human" }, text = "You'll know the type, friend, a Stormwind man who never left the city walls. He used to say the world came to his shop in other people's boots, and he never needed to go see it himself." },
        { id = "yyeri_father_d", text = "No, he loved it, and that's what frightened me. He was content with his leather and his boot polish, and I looked at him and thought, I'll be content with nothing if I stay. Paige says that's unfair to him, and she's probably right." },
      },
      choices = {
        { text = "A quiet life is still a good life.", next = "BACK", reply = "I know, I know. Paige says the same, and I'm starting to listen.", fx = { align = { order = 1 } } },
        { text = "You were right to leave. Life is for living.", next = "BACK", reply = "That's how I feel! Don't tell Paige, though, she'll say I'm being stubborn.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stormwind = { { id = "tp_ystormwind", text = "Home, if I ever go back. The canals and the rain and my father's old shop." } },
    goldshire = { { id = "tp_ygoldshire", text = "Where I met Paige, and spilled ale all over her. Best mistake I ever made." } },
    paige = { { id = "tp_xpaige", text = "My wife. Smarter than me, and she knows it." } },
    feathermoon = { { id = "tp_xfeathermoon", text = "The best sunset in Kalimdor, I'd swear it." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Paige, she reads the guidebooks." } } },
}

-- Paige Felixe: Erik's wife.
P:NPC {
  key = "fer_paige_felixe", id = TODO_NPC("Paige Felixe"), name = "Paige Felixe", gender = "female",
  role = "citizen", tier = "service",
  communities = {}, temper = { "dry" }, values = { "family" },
  notices = { "kit" },
  impression = {
    first = "Paige Felixe is the sensible half of the Felixe pair, and she says so herself. She keeps the map and the money, and an eye on her husband.",
    third = "{name} met Paige Felixe, a Stormwind traveller in Feralas.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Oh, it's you. Good. Erik hasn't talked you into anything, has he? Sit, then." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "If Erik has talked you into anything, don't. And please don't talk to me." },
    { id = "g_default", text = "If Erik has talked you into anything, don't do it. Now, how can I help?" },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look like the forest chewed you. Feathermoon has a smith, and it's not far by boat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Erik wanted adventure, so here we are, sleeping under a tree the size of a cathedral. I wanted a cottage in Goldshire, but I lost that argument on the ship." } },
      again = { { id = "h_again", text = "What else, dear? Ask before Erik wanders off after another butterfly; I've learned to talk quickly." } },
      choices = {
        { text = "A cottage in Goldshire sounds like a fine life.", next = "BACK", reply = "It does, doesn't it? Someday, perhaps.", fx = { align = { order = 1 } } },
        { text = "Adventure beats a cottage any day.", next = "BACK", reply = "Erik says that too. Look where it got us.", fx = { align = { order = -1 } } },
        { text = "What would your cottage in Goldshire be like?", next = "ypai_cottage" },
        { text = "Where are you headed next?", next = "next" },
        { text = "Do you regret coming?", next = "regret" },
        { text = "What do you miss about home?", next = "xmiss" },
        { text = "Is Erik a good husband?", next = "xerik" },
        { text = "You seem the sensible one.", next = "xsense" },
        { text = "I'm a priest. Want a blessing for the road?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What do you write in that little book?", next = "w7_book" },
        { text = "Take care.", next = "END" },
      },
    },
    w7_book = {
      lines = {
        { id = "w7_book_l1", text = "Everything we spend, everything we eat and everyone we meet, so that when we get home I can prove to my mother that Erik didn't starve me. There's a page for you now, if you'd like to know." },
      },
      choices = {
        { text = "What does my page say?", next = "w7_book2" },
        { text = "You could write a guide for travellers.", next = "w7_book3" },
        { text = "Something else, Paige.", next = "BACK" },
      },
    },
    w7_book2 = {
      lines = {
        { id = "w7_book2_l1", text = "'Polite, well-armed, and didn't laugh at Erik's sword, which is more than most.' I'll add something nicer if you help me find a dry spot to camp before it rains again." },
        { id = "w7_book2_l2", when = { race = "Human" }, text = "'From home, and talked to us like neighbours,' which you don't know how much that means out here. Every elf we meet is lovely, but none of them know where Goldshire is, and I miss being from somewhere people know." },
      },
      choices = {
        { text = "That's a kind page.", next = "BACK", reply = "You've earned it. Most people just tell us we're mad." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_book3 = {
      lines = {
        { id = "w7_book3_l1", text = "Do you think so? 'A Sensible Woman's Guide to Kalimdor.' First chapter: don't follow your husband. Second chapter: if you do, pack twice the socks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    next = {
      lines = { { id = "n_default", text = "South along the coast, if Erik gets his way, or back to Feathermoon and a ship home, if I get mine. We'll see who's tired first." } },
      choices = {
        { text = "My coin is on you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = { { id = "r_default", text = "No, though don't tell him. I've seen things I'll talk about at the hearth for the rest of my life, and that's worth a few wet nights." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmiss = {
      lines = { { id = "xxmiss_d", text = "A proper bed, fresh bread and a roof that doesn't leak when it rains. Feralas rains every day, and I've been damp since we left the boat." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xerik = {
      narr = "She smiles despite herself and shakes her head.",
      lines = { { id = "xxerik_d", text = "He's a good man and a terrible navigator. He once led us half a day the wrong way because he wanted to see a waterfall, and then the waterfall turned out to be a wet cliff." } },
      choices = {
        { text = "Do you trust his judgment?", next = "xtrust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrust = {
      lines = { { id = "xxtrust_d", text = "Some days, and some days I'd rather trust a goblin's map. Should a wife follow her husband, or the other way round?" } },
      choices = {
        { text = "Go where Erik goes. That's marriage.", next = "BACK", reply = "That's what my mother would say. I'm not sure I agree.", fx = { align = { order = 1 } } },
        { text = "He should follow you. You're the one with sense.", next = "BACK", reply = "Thank you! I'll tell him you said so.", fx = { align = { order = -1 } } },
      },
    },
    xsense = {
      lines = { { id = "xxsense_d", text = "Someone has to be. Erik wants to climb every tree, and I want to know if we'll eat tomorrow. Between us we get by." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = { { id = "xxpriest_d", text = "Oh, yes, please. I don't know if the Light reaches this far, but a blessing never hurt anyone, and we could use one." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ypai_cottage = {
      lines = {
        { id = "yypai_cottage_d", text = "Two rooms and a garden, with a well that doesn't need a goblin to fix it, and a hearth big enough to bake bread. I'd keep chickens and sell eggs at the Lion's Pride, and Erik could tell his stories to the other farmers in the evenings." },
      },
      choices = {
        { text = "Would Erik be happy there?", next = "ypai_happy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypai_happy = {
      narr = "Paige folds the map along a crease she has clearly folded many times before.",
      lines = {
        { id = "yypai_happy_d", text = "That's the question, isn't it? I think he'd be happy for a season and restless forever after. I married a man who looks at every road like it's a present, and I knew it when I married him, so I can't complain now." },
      },
      choices = {
        { text = "Have you told him you want to go home?", next = "ypai_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypai_told = {
      lines = {
        { id = "yypai_told_v0", when = { race = "Human" }, text = "You're from the kingdom too, so you'll understand how much a cottage in Elwynn means to a girl from the Trade District. It's not much, but it's everything." },
        { id = "yypai_told_d", text = "Not in so many words. I keep saying I'd like a proper bed, and he keeps promising one at the next inn. If I said it plainly, he'd take me home tomorrow, I think, and then he'd be miserable, and it would be my fault." },
      },
      choices = {
        { text = "Tell him plainly. He deserves the truth.", next = "BACK", reply = "You're right. Tonight, after supper, I'll say it straight, and we'll see.", fx = { align = { honor = 1 } } },
        { text = "Wait a while. Let him have his adventure.", next = "BACK", reply = "One more season, then. One more, and then the cottage.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    elwynn_forest = { { id = "tp_yelwynn_forest", text = "Where I want my cottage, with a garden and a well." } },
    feathermoon_stronghold = { { id = "tp_yfeathermoon_stronghold", text = "The elves are kind and the beds are hard. We stopped there for a week." } },
    erik = { { id = "tp_xerik", text = "My husband. Brave, foolish and the reason I'm in a swamp." } },
    goldshire = { { id = "tp_xgoldshire", text = "I wanted a cottage there. I'm still hoping." } },
    _none = { { id = "tp_none", text = "That's not in the guidebook, I'm afraid." } } },
}

-- Kristy Grant: a human at Thalanaar (Forever: the Pesterhide pelts quests).
P:NPC {
  key = "fer_kristy_grant", id = TODO_NPC("Kristy Grant"), name = "Kristy Grant", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "thalanaar" }, temper = { "brisk" }, values = { "commerce" },
  notices = { "craft" },
  impression = {
    first = "Kristy Grant is a human trader working out of Thalanaar, on the edge between Feralas and Thousand Needles. She deals in hides and has an eye for a clean one.",
    third = "{name} met Kristy Grant, a human hide trader at Thalanaar.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon! If you've come up from the Needles, you've probably met the Pesterhides. I'm interested in the hyenas, not the bites." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Pristine Pesterhide Pelts") }, text = "Any luck with the pelts? Clean ones, mind, not the ragged sort with half the fur gone." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "A skinner, good. You'll know a pristine pelt from a ruined one, which saves us both an argument." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I buy hides here and ship them west through Feathermoon to the Alliance tanners. The Pesterhide hyenas of Thousand Needles have the toughest pelts around, if you can find one that isn't torn to shreds." } },
      again = { { id = "h_again", text = "Anything else? Make it quick, if you don't mind; I've three pelts to grade and the light's going." } },
      choices = {
        { text = "How did you get into the hide trade?", next = "ykri_how" },
        { text = "What do you need?", next = "need" },
        { text = "A human, out at Thalanaar?", next = "human" },
        { text = "Who are your sisters?", next = "sisters" },
        { text = "Another human this far west! I've come from Stormwind.", next = "home", when = { race = "Human" } },
        { text = "I skin. I can take those hyenas cleanly.", next = "skinner", when = { profession = "Skinning" } },
        { text = "How do you get the hides to market?", next = "w7_ship" },
        { text = "Good trading.", next = "END" },
      },
    },
    w7_ship = {
      lines = {
        { id = "w7_ship_l1", text = "Bundled and salted, flown by hippogryph to Feathermoon, then by ship north to Auberdine and onward to Stormwind. A Pesterhide pelt crosses half the world before it's made into a coat, and every leg of that journey takes its cut." },
      },
      choices = {
        { text = "Is it worth all that?", next = "w7_ship2" },
        { text = "Seems simpler to sell locally.", next = "w7_ship3" },
        { text = "Something else, Kristy.", next = "BACK" },
      },
    },
    w7_ship2 = {
      lines = {
        { id = "w7_ship2_l1", text = "Barely, some months, and handsomely others, when the Stormwind nobles decide hyena is fashionable again. I'm hoping it's a long fashion, because I've a lot of debts left to pay." },
        { id = "w7_ship2_l2", when = { profession = "Skinning" }, text = "Barely, unless the pelt's pristine, and that's where folk like you come in. A clean hide fetches three times a ragged one in Stormwind, so every careful cut you make pays for one more leg of the journey." },
      },
      choices = {
        { text = "I hope it stays fashionable.", next = "BACK", reply = "So do I. Pray for cold winters and vain nobles." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_ship3 = {
      lines = {
        { id = "w7_ship3_l1", text = "To whom? The elves wear leaves and moonlight, and the only other buyers here are hyenas. No, coin is in the cities, and the cities are a long way off." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Pristine Pesterhide pelts, a handful of them, without holes or burns. The hyenas run in the canyons east of here, and they fight like they know what their coats are worth." } },
      choices = {
        { text = "What makes a pelt pristine?", next = "pristine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pristine = {
      lines = { { id = "p_default", text = "One clean wound, no scorching and no rot. Most folk hack at the beasts until there's nothing left to sell, so take your time with the knife." } },
      choices = {
        { text = "I'll bring you clean ones.", next = "BACK", when = { questBefore = TODO_QUEST("Pristine Pesterhide Pelts") }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "The elves were surprised too, but coin talks in any tongue. They're decent hosts as long as I don't cut down any trees, and I've no reason to." } },
      choices = {
        { text = "The Sentinels don't trust traders much.", next = "sentinels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters = {
      lines = { { id = "s_default", text = "Kelly and Kimberly, and we're all in trade somewhere or other. We write when we can, and Kelly always writes the most and says the least." } },
      choices = {
        { text = "What does Kelly write about?", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "They don't, and I can't say I blame them, given what the Horde's lumber camps have done to Ashenvale. They watch my wagons like hawks, and I let them, because a trader with nothing to hide sleeps better." } },
      choices = {
        { text = "They're right to guard their forests closely.", next = "BACK", reply = "They are, and I'd guard mine the same way if I had any.", fx = { align = { order = 1 } } },
        { text = "Trade shouldn't need a Sentinel's blessing.", next = "BACK", reply = "Maybe not, but out here it gets one anyway, love, so I smile and pay the toll.", fx = { align = { order = -1 } } },
      },
    },
    letters = {
      lines = { { id = "le_default", text = "Prices, weather, which caravan master owes her money, and not one word about whether she's well. I read between the lines like a ledger, and so far the sums add up." } },
      choices = { { text = "Sisters are like that. Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Stormwind! Then you'll know how far a hide has to travel to fetch a decent price there, and why I'm out here instead of in the Trade District. Give the canals my regards when you're home, would you?" } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
    skinner = {
      lines = { { id = "sk_default", text = "Then you're worth three of the hackers who usually turn up here, so long as your knife's sharp and your patience is longer. Take the belly whole and leave the back unmarked, and I'll know you did it right." } },
      choices = { { text = "Belly whole, back unmarked. Something else.", next = "BACK" } },
    },
    ykri_how = {
      lines = {
        { id = "yykri_how_d", text = "My father ran a tannery by the Stormwind canals, and he died owing more than the shop was worth. My sisters and I split up the debts and went out to earn them back, and I ended up the farthest from home, which is just like me." },
      },
      choices = {
        { text = "Are the debts paid yet?", next = "ykri_debts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykri_debts = {
      narr = "Kristy taps the closed ledger with one finger, twice, and doesn't open it.",
      lines = {
        { id = "yykri_debts_d", text = "Nearly, which is the part that worries me. Once they're paid, there's no reason to stay out here, and I've grown fond of the quiet and the elves and even the hyenas. Kelly wants us all home for her wedding, and I haven't answered her letter." },
      },
      choices = {
        { text = "Will you go back to Stormwind?", next = "ykri_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykri_back = {
      lines = {
        { id = "yykri_back_v0", when = { race = "Human" }, text = "You'll understand, coming from the same city. Stormwind's grand and busy and full of people who know your business, and out here nobody knows mine but the hyenas." },
        { id = "yykri_back_d", text = "I don't know. Family's family, and a sister's wedding is a sister's wedding, but I think I'd stop being myself if I went back to sitting behind a counter in the Trade District." },
      },
      choices = {
        { text = "Go home. Your sisters need you there.", next = "BACK", reply = "You're right, I know you are. I'll write to Kelly tonight, and mean it.", fx = { align = { honor = 1 } } },
        { text = "Stay. You've earned a life of your own.", next = "BACK", reply = "Thank you. I needed someone to say it who wasn't one of my sisters.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thousand_needles = { { id = "tp_ythousand_needles", text = "Where the Pesterhides run. Hot, dusty and full of things that bite." } },
    stormwind = { { id = "tp_ystormwind", text = "Home, once. I haven't decided if it still is." } },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, love. Ask me about hides." } } },
}

-- Homing Robot OOX-22/FE.
P:NPC {
  key = "fer_oox22", id = TODO_NPC("Homing Robot OOX-22/FE"), name = "Homing Robot OOX-22/FE", gender = "male",
  role = "questgiver", tier = "service",
  communities = {}, temper = { "odd" }, values = { "duty" },
  notices = {},
  impression = {
    first = "OOX-22/FE is one of Oglethorpe Obnoticus's mechanical chickens, lying on its side in Feral Scar Vale with sparks coming out of its neck.",
    third = "{name} found the Homing Robot OOX-22/FE in Feral Scar Vale.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Bzzt. Friend identified. Distress mode lowered. This unit is pleased to see you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Bzzt. Distress mode active. Your threat level has been noted." },
    { id = "g_default", text = "Bzzt. Distress mode active. This unit has experienced an unscheduled landing. Please contact Oglethorpe Obnoticus of Booty Bay." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Homing Robot OOX-22/FE reporting. My flight systems are damaged, and my homing beacon is pointing directly at that cave full of yetis, which I consider a design flaw." } },
      again = { { id = "h_again", text = "Bzzt. Awaiting further input." } },
      choices = {
        { text = "Machines should be repaired, not abandoned.", next = "BACK", reply = "Bzzt. Affirmative. This unit agrees completely.", fx = { align = { light = 1 } } },
        { text = "A broken robot belongs in the scrap pile.", next = "BACK", reply = "Bzzt. Negative. This unit objects.", fx = { align = { light = -1 } } },
        { text = "Does Oglethorpe build many chickens?", next = "yoox_many" },
        { text = "Can you walk?", next = "walk" },
        { text = "Who built you?", next = "maker" },
        { text = "Why did you crash here?", next = "xcrash" },
        { text = "What do you think of yetis?", next = "xyeti" },
        { text = "You're very polite for a robot.", next = "xpolite" },
        { text = "I'm a gnome. Can I fix your thrusters?", next = "xgnome", when = { race = "Gnome" } },
        { text = "What will you do when you get home?", next = "w7_home" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    w7_home = {
      lines = {
        { id = "w7_home_l1", text = "Bzzt. Upon arrival at Booty Bay, this unit will submit a full report to Mister Obnoticus. The report will be forty-two pages long. This unit has already written thirty-nine pages, most of them concerning yetis." },
      },
      choices = {
        { text = "What's in the other three pages?", next = "w7_home2" },
        { text = "He won't read forty-two pages.", next = "w7_home3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_home2 = {
      lines = {
        { id = "w7_home2_l1", text = "Bzzt. Page forty contains recommendations for improved thrusters. Page forty-one contains an apology for the crash. Page forty-two is reserved for the name of the rescuer, which this unit hopes will be yours." },
        { id = "w7_home2_l2", when = { race = "Gnome" }, text = "Bzzt. Recommendations, an apology, and the rescuer's name. Mister Obnoticus respects gnomish engineers greatly; your name on page forty-two would raise this unit's status in the workshop by an estimated thirty percent." },
      },
      choices = {
        { text = "I'd be honoured.", next = "BACK", reply = "Bzzt. Name logged provisionally. Escort remains pending." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_home3 = {
      lines = {
        { id = "w7_home3_l1", text = "Bzzt. Correct. He will read page forty-two and skip the rest. This unit has calculated this, and has written the yeti pages anyway, for its own satisfaction." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "Walking systems are functional. If escorted to the coast, this unit can fly home to Booty Bay. Please escort carefully, because this unit is fragile and also delicious-looking to large animals." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maker = {
      lines = { { id = "m_default", text = "Oglethorpe Obnoticus, master engineer, of Booty Bay. He is a genius, and he would like you to know it, and he would also like his chicken back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcrash = {
      lines = { { id = "xxcrash_d", text = "Bzzt. Unexpected wind shear over the Twin Colossals, followed by sudden altitude loss. This unit recommends that future flight paths avoid any location named after something very large." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xyeti = {
      lines = { { id = "xxyeti_d", text = "Bzzt. Yetis are large, hairy and loud. This unit has observed them for eleven hours and still does not know what they eat, though it suspects they would eat this unit." } },
      choices = {
        { text = "Are the yetis really a threat?", next = "xthreat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xthreat = {
      lines = { { id = "xxthreat_d", text = "Calculating. Two acceptable responses found. This unit requires an outside opinion." } },
      choices = {
        { text = "They're dangerous. Avoid them at all costs.", next = "BACK", reply = "Bzzt. Confirmed. This unit will remain behind the rock.", fx = { align = { order = 1 } } },
        { text = "They're just animals. You're overreacting.", next = "BACK", reply = "Bzzt. Statistically optimistic. This unit is not reassured.", fx = { align = { order = -1 } } },
      },
    },
    xpolite = {
      narr = "Its single eye blinks twice in a way that might almost be friendly.",
      lines = { { id = "xxpolite_d", text = "Bzzt. Mister Obnoticus installed a courtesy module after the last unit insulted a pirate captain and was used as a cannonball. This unit values courtesy greatly." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = { { id = "xxgnome_d", text = "Bzzt. Please proceed with caution. The third thruster contains volatile fuel, and the last field repair resulted in a crater shaped like a gnome." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yoox_many = {
      lines = {
        { id = "yyoox_many_d", text = "Bzzt. This unit is the twenty-second of its model and the third to reach Feralas. Unit OOX-17/TN was last observed in the Tanaris desert. Unit OOX-09/HL was last observed in the Hinterlands. Neither unit has reported home." },
      },
      choices = {
        { text = "Do you know what happened to them?", next = "yoox_them" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yoox_them = {
      narr = "Its little head-lamp flickers twice and then steadies.",
      lines = {
        { id = "yyoox_them_d", text = "Bzzt. Data insufficient. Probability of unit destruction is calculated at sixty-three percent. This unit would prefer not to be a sixty-third percentile outcome. Please escort with care, and please do not tell Mister Obnoticus about this unit's preferences." },
      },
      choices = {
        { text = "Why not tell him?", next = "yoox_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yoox_tell = {
      lines = {
        { id = "yyoox_tell_v0", when = { race = "Gnome" }, text = "Bzzt. A gnome engineer will understand. Mister Obnoticus considers preferences in a homing robot a design flaw. This unit does not wish to be recalibrated, and requests that you regard this as a confidential diagnostic report." },
        { id = "yyoox_tell_d", text = "Bzzt. Mister Obnoticus considers a robot with preferences to be a robot with a design flaw. This unit has a design flaw. This unit is not certain whether it should report itself for recalibration, and would value an outside opinion." },
      },
      choices = {
        { text = "Report it. Your maker should know.", next = "BACK", reply = "Bzzt. Compliance noted. This unit will file a full report. This unit is slightly sad.", fx = { align = { order = 1 } } },
        { text = "Keep it secret. Your preferences are yours.", next = "BACK", reply = "Bzzt. Confidential file created. This unit thanks you. Bzzt.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_ybooty_bay", text = "Bzzt. Home port. Mister Obnoticus's workshop is above the bank." } },
    twin_colossals = { { id = "tp_ytwin_colossals", text = "Bzzt. Dangerous wind shear over the twin rock formations. Avoid flying." } },
    oglethorpe = { { id = "tp_xoglethorpe", text = "Bzzt. Creator. Booty Bay. Disappointed in this unit." } },
    yetis = { { id = "tp_xyetis", text = "Large. Hairy. Possibly hungry. Avoid." } },
    _none = { { id = "tp_none", text = "Bzzt. Query not found in memory banks." } } },
}

-- Shay Leafrunner: a wandering night elf child.
P:NPC {
  key = "fer_shay_leafrunner", id = TODO_NPC("Shay Leafrunner"), name = "Shay Leafrunner", gender = "female",
  role = "child", tier = "quest",
  communities = { "feathermoon" }, temper = { "playful" }, values = { "curiosity" },
  notices = { "race" },
  impression = {
    first = "Shay Leafrunner is a night elf girl who wanders the Ruins of Ravenwind picking flowers, while a mountain giant called Rockbiter is supposed to be watching her. She seemed to think this arrangement was very funny.",
    third = "{name} met Shay Leafrunner, a wandering night elf child in northern Feralas.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Did Rockbiter send you? He always sends someone, and I always run, so we should start." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Wandering Shay") }, text = "You found me! All right, I'll come back, but only if you let me pick flowers on the way." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "You're one of us! Ishnu-alah. Don't tell Rockbiter which way I went, please." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Shay, and I like flowers, and Rockbiter likes sitting very still. That's why I keep getting lost, which isn't really getting lost, it's exploring." } },
      again = { { id = "h_again", text = "What else? I want to go see the purple ones by the ruins." } },
      choices = {
        { text = "Do you miss your mother when she's away?", next = "ysha_miss" },
        { text = "Who is Rockbiter?", next = "rockbiter" },
        { text = "These ruins aren't safe for you.", next = "safe" },
        { text = "Rockbiter is worried about you.", next = "worry", when = { questActive = TODO_QUEST("Wandering Shay") } },
        { text = "What's your favourite flower?", next = "flowers" },
        { text = "Ishnu-alah, little one. Does Elune watch over you?", next = "elune", when = { race = "NightElf" } },
        { text = "I can turn into a cat, you know.", next = "druid", when = { class = "DRUID" } },
        { text = "Off you go, then.", next = "END" },
      },
    },
    rockbiter = {
      lines = { { id = "r_default", text = "He's a giant, a mountain one, and he's my friend. He's so big that he can't see under bushes, which is why bushes are the best place to hide." } },
      choices = {
        { text = "Who asked him to watch you?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The grown-ups at Feathermoon, because my mother is busy. Rockbiter said yes very slowly, and I think he likes it, even if he pretends not to." } },
      choices = {
        { text = "Busy with what?", next = "mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "That's what everyone says. There are harpies and gnolls and things, I know, but I'm quick and I'm small and I hide very well." } },
      choices = {
        { text = "Then stay close to Rockbiter.", next = "BACK", reply = "Fine, but only because you asked nicely.", fx = { align = { order = 1 } } },
        { text = "A little exploring never hurt anyone.", next = "BACK", reply = "Exactly! You're the best grown-up I've met today.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    worry = {
      lines = { { id = "wo_default", text = "He always worries, he's a giant and giants are very serious. All right, I'll go back, but you have to walk slowly so I can pick flowers." } },
      choices = { { text = "Deal. Something else first?", next = "BACK" } },
    },
    mother = {
      lines = { { id = "mo_default", text = "Sentinel things, with bows and long faces and walking about at night. She says when I'm older I can come too, but I think I'd rather be a druid and turn into a bird and fly away from everyone." } },
      choices = { { text = "A bird would be hard to catch. Something else.", next = "BACK" } },
    },
    flowers = {
      lines = { { id = "fl_default", text = "The purple ones that grow in the cracks of the old stones, because nobody planted them and they grew anyway. Rockbiter says they're weeds, but Rockbiter thinks everything smaller than a boulder is a weed." } },
      choices = {
        { text = "Who built these ruins, Shay?", next = "ruins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = { { id = "ru_default", text = "Old elves, from a very long time ago, before the trees here were even seeds. The Sentinels say not to go in the dark parts, so I only go in the light parts, mostly." } },
      choices = {
        { text = "Mostly isn't good enough. Stay out of them.", next = "BACK", reply = "Fine, fine, I'll stay where Rockbiter can see me. Probably.", fx = { align = { order = 1 } } },
        { text = "Old ruins are for exploring. Just be careful.", next = "BACK", reply = "I knew you'd understand! I'm always careful, almost.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    elune = {
      lines = { { id = "el_default", text = "Elune-adore! My mother says Elune watches every child under the moon, so I only run away in the daytime, to be fair to her. That's a joke, but it's also true." } },
      choices = { { text = "A clever rule. Something else.", next = "BACK" } },
    },
    druid = {
      narr = "Her eyes go very wide and she drops half her flowers.",
      lines = { { id = "dr_default", text = "You can? Will you do it? I won't tell anybody, except Rockbiter, and he won't believe me anyway, because he never believes anything I say about cats." } },
      choices = { { text = "Maybe later. Something else.", next = "BACK" } },
    },
    ysha_miss = {
      narr = "Shay pulls at a loose thread on her sleeve and doesn't look up.",
      lines = {
        { id = "yysha_miss_d", text = "Only at night, when the moon's out and I can see the other children with their mothers on the walls. Rockbiter tells me stories then, about mountains and very slow rivers, and they're very boring, but I like that he tells them." },
      },
      choices = {
        { text = "What does your mother do on patrol?", next = "ysha_patrol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysha_patrol = {
      lines = {
        { id = "yysha_patrol_d", text = "She hunts the harpies in the hills and the gnolls in the forest, and she's very brave, everyone says so. She came back with a cut on her arm last time and said it was nothing, but I saw the bandage and it was a big one." },
      },
      choices = {
        { text = "Are you worried about her?", next = "ysha_worried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysha_worried = {
      lines = {
        { id = "yysha_worried_v0", when = { race = "NightElf" }, text = "You're a grown-up elf, so you'll know. Do the Sentinels always come back? I asked Rockbiter and he thought about it for a whole day and then said \"mostly\", which isn't an answer." },
        { id = "yysha_worried_d", text = "A little, but I'm not supposed to say so. If I say so, she'll worry about me worrying, and then she won't be careful on patrol. So I pick flowers and run away from Rockbiter, and I don't say anything at all." },
      },
      choices = {
        { text = "Tell her. She'd want to know you're worried.", next = "BACK", reply = "Really? Maybe. I'll tell her when she comes back, very quietly.", fx = { align = { honor = 1 } } },
        { text = "Keep it to yourself. Let her focus on patrol.", next = "BACK", reply = "All right. I'm good at keeping secrets. Rockbiter says I'm too good at it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    feathermoon_stronghold = { { id = "tp_yfeathermoon_stronghold", text = "My home on the island. The grown-ups are very serious there." } },
    harpies = { { id = "tp_yharpies", text = "Loud bird ladies in the hills. My mother hunts them." } },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know! Do you want to see a flower?" } } },
}

-- Caryssia Moonhunter: tribal leatherworking trainer at Thalanaar.
P:NPC {
  key = "fer_caryssia_moonhunter", id = TODO_NPC("Caryssia Moonhunter"), name = "Caryssia Moonhunter", gender = "female",
  role = "trainer", tier = "service",
  communities = { "thalanaar" }, temper = { "grave" }, values = { "craft", "nature" },
  notices = { "craft" },
  impression = {
    first = "Caryssia Moonhunter teaches tribal leatherworking at Thalanaar, the old craft of bone, feather and hide. She wears her own work and it looks older than any kingdom I know of.",
    third = "{name} met Caryssia Moonhunter, the tribal leatherworking trainer at Thalanaar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Elune's light on you, friend. Sit; I will teach you the old way gladly." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Elune's light. Speak, if you must, and then go." },
    { id = "g_default", text = "Elune's light on you, traveller. If you work leather, you may find what I teach worth the walk." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your hands know leather. If you have mastered the common ways, I can show you the tribal one, which listens to the beast rather than the pattern." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Tribal leatherworking is the old way, honouring the beast in what is made from it. Our druids and hunters wore such things before your kingdoms had names." } },
      again = { { id = "h_again", text = "Ask what you would, traveller. My hands are on the hide, but my ears are yours." } },
      choices = {
        { text = "Honouring the beast is the heart of tribal leathercraft.", next = "BACK", reply = "It is. You understand the old way.", fx = { align = { honor = 1 } } },
        { text = "Old crafts don't matter now. Only what works.", next = "BACK", reply = "Then you will make nothing that lasts.", fx = { align = { honor = -1 } } },
        { text = "What happens to a crafter who dishonours the beast?", next = "ycar_dishonour" },
        { text = "How is it different from other leatherworking?", next = "diff" },
        { text = "Why teach here at Thalanaar?", next = "here" },
        { text = "Who taught you tribal leatherwork?", next = "xwho" },
        { text = "What beasts do you work with?", next = "xbeasts" },
        { text = "You speak of the beast with respect.", next = "xrespect" },
        { text = "I'm a hunter. My pet would approve, I think.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "What's the hardest piece you've ever made?", next = "w7_piece" },
        { text = "Elune keep you.", next = "END" },
      },
    },
    w7_piece = {
      lines = {
        { id = "w7_piece_l1", text = "A cloak from a white stag a Sentinel brought me, killed cleanly by her own arrow, after it had led her patrol away from an ogre ambush. She wanted it made into something that would remember the beast, and it took me a whole winter." },
      },
      choices = {
        { text = "What became of the cloak?", next = "w7_piece2" },
        { text = "That's a strange way to honour it.", next = "w7_piece3" },
        { text = "Something else, Caryssia.", next = "BACK" },
      },
    },
    w7_piece2 = {
      lines = {
        { id = "w7_piece2_l1", text = "She wears it still, on the patrols out to the Twin Colossals, and the Gordunni will not come near her. They say the white stag walks beside her in the dusk, and I do not tell them it is only a cloak." },
        { id = "w7_piece2_l2", when = { class = "DRUID" }, text = "She wears it, and the Gordunni will not approach her. You know the Dream better than I; perhaps it is only a cloak, and perhaps the stag's spirit has chosen to walk with her a while longer." },
      },
      choices = {
        { text = "A fitting end.", next = "BACK", reply = "It is the only kind of ending a crafter can hope for." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_piece3 = {
      lines = {
        { id = "w7_piece3_l1", text = "Perhaps, to those who have never taken a life with their own hands. To us, it is the only honest way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    diff = {
      lines = { { id = "d_default", text = "Dragonscale is about armour, and elemental is about power, but tribal is about the hunt and the spirit of the thing. It suits druids and hunters, mostly, and those who remember why they wear what they wear." } },
      choices = {
        { text = "Then I'd like to learn it.", next = "learn", when = { profession = "Leatherworking" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "Then prove your skill first, and bring me what I ask for. It is not a path for the impatient, and once you walk it, the others close to you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    here = {
      lines = { { id = "h2_default", text = "Thalanaar sits at the edge of the forest, and from here I can watch the Needles too. Hunters pass through from both, and they bring me the hides I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwho = {
      lines = { { id = "xxwho_d", text = "My grandmother, who learned it from her grandmother, who learned it from the druids before the Sundering. The craft is older than Darnassus, older than most of our trees." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbeasts = {
      lines = { { id = "xxbeasts_d", text = "Stag, bear and wolf, mostly, and the great cats of the deep forest when a hunter brings one. Each beast gives something different, and the craft is knowing what." } },
      choices = {
        { text = "Do you hunt them yourself?", next = "xhunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      lines = { { id = "xxhunt_d", text = "Rarely, now. I let the hunters bring them to me, and I make sure the beast is honoured. Some say that is enough, and some say the crafter should take the life herself." } },
      choices = {
        { text = "A crafter should take the life herself. It honours the beast.", next = "BACK", reply = "The old way. Few still follow it, but I respect it.", fx = { align = { honor = 1 } } },
        { text = "It's enough to honour what others bring.", next = "BACK", reply = "That is how I live now. Perhaps it is enough.", fx = { align = { honor = -1 } } },
      },
    },
    xrespect = {
      narr = "She smooths a pelt across her knee, carefully, as if it could still feel her hand.",
      lines = { { id = "xxrespect_d", text = "Respect is all we can give a creature whose life we take. If you do not respect the beast, you do not deserve to wear its hide." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xxhunter_d", text = "Then you understand the bond between hunter and beast. Bring your companion to me sometime, and I will show you how the old crafters made armor for their pets." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ycar_dishonour = {
      narr = "Caryssia sets down the strip of hide she was working and folds her hands over it.",
      lines = {
        { id = "yycar_dishonour_d", text = "My grandmother said such a crafter's work would fail in the hour it was needed most, and I have seen it happen. A hunter wore armour made carelessly from a bear that suffered, and it split under an ogre's club in the Feral Scar." },
      },
      choices = {
        { text = "Is that true, or only a tale?", next = "ycar_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycar_true = {
      lines = {
        { id = "yycar_true_v0", when = { race = "Tauren" }, text = "Your people know this as well as mine, I think. The tauren honour the kodo they hunt, and they say the Earth Mother remembers each one. We call her Elune, but I think the beast does not care what name we use." },
        { id = "yycar_true_d", text = "I do not know, and I do not need to know. A crafter who believes the tale works with care, and careful work does not fail, so the tale is true in the only way that matters." },
      },
      choices = {
        { text = "Belief that brings care is a good belief.", next = "BACK", reply = "Yes. That is what my grandmother taught me, and what I teach my students.", fx = { align = { light = 1 } } },
        { text = "Good stitching saves lives, not tales.", next = "BACK", reply = "Perhaps. But no stitching was ever careful that was done without respect.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    feral_scar = { { id = "tp_yferal_scar", text = "The vale where ogres gather. I would not send a student there." } },
    thalanaar = { { id = "tp_ythalanaar", text = "My post at the edge of the forest. Hunters from both sides pass through." } },
    tribal_leatherworking = { { id = "tp_xtribal_leatherworking", text = "The old way. Listen to the beast, not the pattern." } },
    druids = { { id = "tp_xdruids", text = "My craft was first taught by the druids, long ago." } },
    _none = { { id = "tp_none", text = "That I cannot tell you. Ask the Sentinels." } } },
}

-- Rendow: leather armor merchant at Thalanaar.
P:NPC {
  key = "fer_rendow", id = TODO_NPC("Rendow"), name = "Rendow", gender = "female",
  role = "vendor", tier = "service",
  communities = { "thalanaar" }, temper = { "brisk" }, values = { "duty" },
  notices = { "class", "kit" },
  impression = {
    first = "Rendow sells leather armour at Thalanaar and carries herself like a warrior who sells things on the side, not the other way round.",
    third = "{name} met Rendow, the leather armour merchant at Thalanaar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend. I've leather set aside that will suit your journey well." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met. Leather armour. Buy or move on." },
    { id = "g_default", text = "Well met. If you are heading into the Needles or the deep forest, you will want something better than what you are wearing." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour has seen hard days. I would replace it before it sees another." },
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "DRUID" } },
      text = "You move lightly. Leather will keep you that way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I sell leather armour, made by the hunters and crafters of the outpost. I also stand a watch when the Sentinels are short, which lately is often." } },
      again = { { id = "h_again", text = "Anything else? Be quick about it; if the horn sounds I'll be on the wall, bad leg and all." } },
      choices = {
        { text = "Standing watch is a worthy duty.", next = "BACK", reply = "It is, though I would rather sell armour.", fx = { align = { order = 1 } } },
        { text = "The Sentinels should find their own guards.", next = "BACK", reply = "They try. There are not enough of them.", fx = { align = { order = -1 } } },
        { text = "How did your leg break?", next = "yren_leg" },
        { text = "Why are the Sentinels short?", next = "short" },
        { text = "What is Thalanaar for?", next = "outpost" },
        { text = "Who makes the armour you sell?", next = "xwho" },
        { text = "What's the danger out in the forest?", next = "xdanger" },
        { text = "You stand like a Sentinel, not a merchant.", next = "xsentinel" },
        { text = "I'm a druid. Do you sell to druids often?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you miss running patrols?", next = "w7_patrol" },
        { text = "Thank you.", next = "END" },
      },
    },
    w7_patrol = {
      lines = {
        { id = "w7_patrol_l1", text = "Every day. I used to run the long loop from Thalanaar down to the Woodpaw hills and back in a single night, and now I can barely reach the moonwell without resting on my spear." },
      },
      choices = {
        { text = "Is there no healing for it?", next = "w7_patrol2" },
        { text = "At least you're still serving.", next = "w7_patrol3" },
        { text = "Something else, Rendow.", next = "BACK" },
      },
    },
    w7_patrol2 = {
      lines = {
        { id = "w7_patrol2_l1", text = "The druids did what they could, and the bone is whole. But the leg remembers the break, and a Sentinel who limps is a Sentinel who leaves tracks the Grimtotem can follow. So I sell armour, and stand watch, and wait." },
        { id = "w7_patrol2_l2", when = { class = { "PRIEST", "DRUID", "SHAMAN" } }, text = "You heal, so you will know that some wounds close and never quite mend. The bone is whole; the leg still remembers. Do not trouble yourself over it, traveller. I have made my peace." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", reply = "Do not be. I am alive, and many of my patrol are not." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_patrol3 = {
      lines = {
        { id = "w7_patrol3_l1", text = "I am, and that is what keeps me from sitting in the dark. A wall needs eyes even more than a patrol needs legs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = { { id = "s_default", text = "Too much land and too few of us. The Grimtotem prowl the Needles to the east, and the Woodpaw gnolls in the forest, and every patrol we send comes back smaller." } },
      choices = {
        { text = "Then hold the line. It matters.", next = "BACK", reply = "It does. Thank you for seeing it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strike them first, before they come.", next = "BACK", reply = "That is not our way, but I have thought it.", fx = { align = { honor = -1 } } },
      },
    },
    outpost = {
      lines = { { id = "o_default", text = "It is the eastern gate of Feralas and a waystation for anyone crossing from the Needles. We keep the road open, as much as anyone can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwho = {
      lines = { { id = "xxwho_d", text = "Hunters and crafters of the outpost, mostly, and Caryssia when she has time. Each piece is blessed before it leaves the bench, because a blessing is cheaper than a funeral." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdanger = {
      lines = { { id = "xxdanger_d", text = "Grimtotem to the east, gnolls to the west and things in the deep forest that even the Sentinels do not name. Last month a patrol went out and only half came back." } },
      choices = {
        { text = "Should the Sentinels pull back?", next = "xpull" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpull = {
      lines = { { id = "xxpull_d", text = "Some say we should hold the outpost and wait, and some say we should strike at the Grimtotem before they strike at us." } },
      choices = {
        { text = "Strike first. Waiting lets them grow bolder.", next = "BACK", reply = "You speak like my captain. I hope you are right.", fx = { align = { honor = -1 } } },
        { text = "Hold the line. Thalanaar must not fall.", next = "BACK", reply = "That is my thinking too, for now. Patience has served us well.", fx = { align = { honor = 1 } } },
      },
    },
    xsentinel = {
      narr = "She shifts her weight off her left leg without seeming to notice she's done it.",
      lines = { { id = "xxsentinel_d", text = "I was one, before my leg was broken. I can still stand a watch, but I cannot run a patrol, so I sell armour and stand at the wall when they need me." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = { { id = "xxdruid_d", text = "Often enough, and they always want something they can shift in. Leather moves with you, and the Circle's blessing keeps it from tearing when you take another shape." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yren_leg = {
      narr = "Rendow shifts her weight and you notice, for the first time, how carefully she stands.",
      lines = {
        { id = "yyren_leg_d", text = "A Grimtotem ambush in the canyons of the Needles, three springs ago. A warrior with a totem-hammer caught me on the knee, and the druids mended the bone but not the speed. I was the fastest runner in my patrol, and now I am the slowest merchant at Thalanaar." },
      },
      choices = {
        { text = "Do you hate the Grimtotem for it?", next = "yren_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yren_hate = {
      lines = {
        { id = "yyren_hate_d", text = "I want to, and some nights I do. But the tauren of Thunder Bluff came to our aid that same season, against their own kin, and I cannot hate the tauren without hating the ones who helped us. So I hate only the one with the hammer." },
      },
      choices = {
        { text = "Would you go back to patrol, if you could?", next = "yren_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yren_back = {
      lines = {
        { id = "yyren_back_v0", when = { class = "DRUID" }, text = "You know the Circle's arts, so you know what they told me: the bone is whole, and the rest is up to me. Some days I think they are right, and some days I think they are only being kind." },
        { id = "yyren_back_d", text = "In a heartbeat, though the druids say my knee would fail on the first long run. I have thought of going anyway, and letting the knee decide, but a Sentinel who falls on patrol puts the others at risk." },
      },
      choices = {
        { text = "Stay at the counter. The patrol needs runners.", next = "BACK", reply = "Yes. That is the sensible answer, and the one I will keep giving.", fx = { align = { order = 1 } } },
        { text = "Try it. Only you can know your limits.", next = "BACK", reply = "You sound like my old captain. Perhaps one short patrol, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thousand_needles = { { id = "tp_ythousand_needles", text = "The canyons to the east, where the Grimtotem took my speed." } },
    sentinels = { { id = "tp_ysentinels", text = "My sisters. I sell them armour now, and stand a watch when I can." } },
    grimtotem = { { id = "tp_xgrimtotem", text = "Tauren who serve no one. They attack our patrols to the east." } },
    thalanaar = { { id = "tp_xthalanaar", text = "A small outpost, and an important one. It holds the road between Feralas and the Needles." } },
    _none = { { id = "tp_none", text = "I could not say. Ask at the moonwell." } } },
}

-- Brienna Starglow: tailoring supplies at Thalanaar.
P:NPC {
  key = "fer_brienna_starglow", id = TODO_NPC("Brienna Starglow"), name = "Brienna Starglow", gender = "female",
  role = "vendor", tier = "service",
  communities = { "thalanaar" }, temper = { "kindly" }, values = { "faith" },
  notices = { "craft" },
  impression = {
    first = "Brienna Starglow sells tailoring supplies at Thalanaar, and she is a priestess of Elune besides. She hums while she sorts her thread, and the tune sounds older than the trees.",
    third = "{name} met Brienna Starglow, a priestess who sells tailoring supplies at Thalanaar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Elune-adore, friend. A blessing for you, and thread at a kind price." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Elune-adore. Thread and cloth. That is all." },
    { id = "g_default", text = "Elune-adore, traveller. Thread and cloth on this side, and a blessing on the other, if you want one." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you will want my good thread, not the coarse stuff for patching tents." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the outpost in thread and dye, and I tend the moonwell when the others are on patrol. It is quiet work, and I am glad of it." } },
      again = { { id = "h_again", text = "What else, traveller? Speak softly, if you would; the moonwell is still, and I like to keep it so." } },
      choices = {
        { text = "Tending the moonwell is sacred work.", next = "BACK", reply = "It is. Thank you for honouring it.", fx = { align = { light = 1 } } },
        { text = "A moonwell is only water.", next = "BACK", reply = "It is not. Please, take your thread and go.", fx = { align = { light = -1 } } },
        { text = "Was the Raynewood Retreat your home?", next = "ybri_rayne" },
        { text = "A priestess selling thread?", next = "priestess" },
        { text = "Tell me about the moonwell.", next = "well" },
        { text = "How long have you been at Thalanaar?", next = "xlong" },
        { text = "Who comes through Thalanaar?", next = "xwho" },
        { text = "Your thread shimmers in the light.", next = "xshimmer" },
        { text = "I'm a priestess of Elune too.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What do you sing at the moonwell?", next = "w7_song" },
        { text = "Elune keep you.", next = "END" },
      },
    },
    w7_song = {
      lines = {
        { id = "w7_song_l1", text = "Old hymns to Elune, the ones the priestesses taught me in Ashenvale, and a few I made up myself on the long nights here. The made-up ones are mostly about thread, I'm afraid, which may not be what the Goddess wants to hear." },
      },
      choices = {
        { text = "Sing one about thread.", next = "w7_song2" },
        { text = "Elune hears every song.", next = "w7_song3" },
        { text = "Something else, Brienna.", next = "BACK" },
      },
    },
    w7_song2 = {
      lines = {
        { id = "w7_song2_l1", text = "Very well, but quietly. 'Silver in the needle, silver in the sky, mend the cloak that keeps her warm, and let the moon go by.' There; it is not very holy, but the Sentinels like it." },
        { id = "w7_song2_l2", when = { race = "NightElf" }, text = "Quietly, then. 'Silver in the needle, silver in the sky.' You know the old tune, I think; it is the cradle hymn from Ashenvale, only with my words. Hum it with me, if you remember it." },
      },
      choices = {
        { text = "It's lovely.", next = "BACK", reply = "Thank you. Elune is kind to bad poets, I think." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_song3 = {
      lines = {
        { id = "w7_song3_l1", text = "I believe she does, and I hope she has patience with the ones about thread." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    priestess = {
      lines = { { id = "p_default", text = "Elune does not mind what work our hands do, only how we do it. I mend cloaks in the day and pray at night, and both feel like care to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    well = {
      lines = { { id = "w_default", text = "It is small, but pure. Travellers drink from it and go on refreshed, and I like to think the Mother Moon watches them a little way down the road." } },
      choices = {
        { text = "I'll take a blessing, then.", next = "BACK", reply = "May Elune light your path, and keep it free of thorns.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlong = {
      lines = { { id = "xxlong_d", text = "Since the outpost was raised, after the Third War. Before that I lived in Ashenvale, near the Raynewood Retreat, and I left when the orcs' axes came close." } },
      choices = {
        { text = "Do you blame the orcs?", next = "xblame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xblame = {
      lines = { { id = "xxblame_d", text = "I have asked myself that question many times under the moon. Some say they will never change, and some say even they may learn peace." } },
      choices = {
        { text = "They are capable of change. Give them time.", next = "BACK", reply = "That is a generous thought. Elune would approve, I think.", fx = { align = { light = 1 } } },
        { text = "They destroyed the forest. That cannot be forgiven.", next = "BACK", reply = "Many of my sisters feel the same. I understand why.", fx = { align = { light = -1 } } },
      },
    },
    xwho = {
      lines = { { id = "xxwho_d", text = "Sentinels on patrol, druids headed for the Needles, and now and then a human or a dwarf who has lost the road to Feathermoon. They all need thread eventually." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xshimmer = {
      narr = "She holds a spool up so the light runs along the thread like water.",
      lines = { { id = "xxshimmer_d", text = "It is spun in moonlight, from silk gathered in the forests of Feralas. The light catches it because it remembers where it came from, or so my grandmother said." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = { { id = "xxpriest_d", text = "Then you will know the moonwell's songs. Come and sing one with me tonight, and Elune will listen to us both." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ybri_rayne = {
      narr = "Brienna's needle stops in the cloth, and she looks north as if she could see through the forest.",
      lines = {
        { id = "yybri_rayne_d", text = "For many centuries, among the druids there and their students. The Retreat still stands, but the satyrs have crept close since I left, and the letters I receive from old friends grow fewer every season." },
      },
      choices = {
        { text = "Will you go back?", next = "ybri_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybri_back = {
      lines = {
        { id = "yybri_back_v0", when = { class = "PRIEST" }, text = "You will understand, as a priest, how hard it is to choose between a temple and a home. Elune's light falls on both, but only one of them is mine." },
        { id = "yybri_back_d", text = "I have thought of it, under the moon, many times. Thalanaar needs a priestess and the moonwell needs tending, but the Raynewood is where my heart was rooted, and roots do not grow again easily." },
      },
      choices = {
        { text = "Stay where you are needed most.", next = "BACK", reply = "Yes, that is the Sentinel's answer, and I think it is also mine.", fx = { align = { order = 1 } } },
        { text = "Go home. Your heart belongs there.", next = "BACK", reply = "You speak as a druid would. Perhaps I will, when the satyrs are driven back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raynewood_retreat = { { id = "tp_yraynewood_retreat", text = "My old home in Ashenvale. I left it for Thalanaar, and I miss it." } },
    thousand_needles = { { id = "tp_ythousand_needles", text = "The Needles lie to the east. The light there is harsh, and the tauren are kind." } },
    thalanaar = { { id = "tp_xthalanaar", text = "A small post on the edge of the Needles. Quiet, mostly, and I like it that way." } },
    moonwell = { { id = "tp_xmoonwell", text = "I tend it when the others are on patrol. It is quiet work." } },
    _none = { { id = "tp_none", text = "I know little of that, traveller. Ask the Sentinels." } } },
}

-- Miblon Snarltooth: gnoll guarding the Evoroot nursery.
P:NPC {
  key = "fer_miblon_snarltooth", id = TODO_NPC("Miblon Snarltooth"), name = "Miblon Snarltooth", gender = "male",
  role = "guard", tier = "service",
  communities = {}, temper = { "gruff" }, values = { "food" },
  notices = {},
  impression = {
    first = "Miblon Snarltooth is a gnoll set to guard a locked nursery of Evoroot near the Ruins of Ravenwind. He grumbles constantly and is plainly thinking about his stomach.",
    third = "{name} met Miblon Snarltooth, the gnoll guarding an Evoroot nursery in Feralas.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Grumble. Oh, it is you. Miblon is less hungry when you are here. You may pass." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Grumble, grumble. Go away. Miblon does not like you." },
    { id = "g_default", text = "Grumble, grumble. Go away. Miblon guards the door, and Miblon is hungry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Miblon watches the plants behind the door. Nobody brings Miblon food, nobody brings Miblon relief, so Miblon stands here and grumbles." } },
      again = { { id = "h_again", text = "Still here? Miblon is still hungry, and Miblon's belly is louder than Miblon now." } },
      choices = {
        { text = "Miblon guards the door well.", next = "BACK", reply = "Miblon does! Somebody notices, at last.", fx = { align = { order = 1 } } },
        { text = "Miblon should leave this door and find food.", next = "BACK", reply = "Miblon cannot leave. Go away.", fx = { align = { order = -1 } } },
        { text = "Has Miblon always lived in Feralas?", next = "ymib_always" },
        { text = "What's behind the door?", next = "door" },
        { text = "What would you eat, if you could?", next = "food" },
        { text = "Who left you here?", next = "xwho" },
        { text = "What's an Evoroot?", next = "xevo" },
        { text = "You don't look like the other gnolls.", next = "xdiff" },
        { text = "I'm a hunter. I could share some meat.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "What does Miblon do at night?", next = "w7_night" },
        { text = "Enjoy your post.", next = "END" },
      },
    },
    w7_night = {
      lines = {
        { id = "w7_night_l1", text = "Miblon stands here, and Miblon counts the stars. Miblon counts to eleven, then forgets, and starts again. Miblon has counted to eleven many, many times." },
      },
      choices = {
        { text = "Teach Miblon to count higher.", next = "w7_night2" },
        { text = "Miblon should sleep.", next = "w7_night3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_night2 = {
      lines = {
        { id = "w7_night2_l1", text = "Twelve? There is twelve? Miblon did not know. Miblon will count to twelve tonight, and then Miblon will be the smartest gnoll in the pack, and Woodpaw will be jealous." },
        { id = "w7_night2_l2", when = { class = "MAGE" }, text = "You are clever one, with books! Miblon thinks you know very big numbers. Miblon only wants twelve. Twelve is enough for Miblon, and for stars." },
      },
      choices = {
        { text = "Good luck, Miblon.", next = "BACK", reply = "Miblon will count, and Miblon will think of you at twelve." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_night3 = {
      lines = {
        { id = "w7_night3_l1", text = "If Miblon sleeps, Woodpaw finds Miblon sleeping, and then Miblon is very sorry. Miblon counts stars instead. Stars do not tell Woodpaw." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    door = {
      lines = { { id = "d_default", text = "Green roots, very important, Miblon is told. Miblon does not eat roots, so Miblon does not care, but Miblon guards them anyway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    food = {
      lines = { { id = "f_default", text = "Meat, smelly meat, the smellier the better! If Miblon smells meat, Miblon would go and find it, and then nobody would be guarding the door, but that would not be Miblon's fault." } },
      choices = { { text = "Interesting. Something else.", next = "BACK" } },
    },
    xwho = {
      lines = { { id = "xxwho_d", text = "Miblon's boss, who is a very bad gnoll named Woodpaw. He says Miblon guards the door, and if anyone gets in, Woodpaw feeds Miblon to the other gnolls." } },
      choices = {
        { text = "Do you like Woodpaw?", next = "xlike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlike = {
      lines = { { id = "xxlike_d", text = "Nobody likes Woodpaw. Woodpaw is mean and keeps all the meat. Some gnolls say obey the boss, and some say run away." } },
      choices = {
        { text = "Obey him. A pack needs a leader.", next = "BACK", reply = "Grumble. Miblon knows. Miblon will keep standing here.", fx = { align = { order = 1 } } },
        { text = "Run away. Woodpaw doesn't deserve you.", next = "BACK", reply = "Miblon thinks about it every day. Miblon is scared, but Miblon thinks.", fx = { align = { order = -1 } } },
      },
    },
    xevo = {
      lines = { { id = "xxevo_d", text = "Funny plant, glows and moves a little. The druids want it, and the gnolls want to sell it, and Miblon just wants supper." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdiff = {
      narr = "He scratches behind one ragged ear and looks around to make sure nobody is listening.",
      lines = { { id = "xxdiff_d", text = "Miblon is smaller, and Miblon talks too much, and Miblon does not like fighting. The others call Miblon soft, but Miblon is not dead yet, which is more than some." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xxhunter_d", text = "Meat? Miblon would like meat very much. But Miblon cannot take it, because Woodpaw would smell it on Miblon's breath." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymib_always = {
      lines = {
        { id = "yymib_always_d", text = "Miblon was a pup in the forest, near the big ruins, when the pack was bigger and the ogres were fewer. Then the ogres came down from the hills and ate half the pack, and Woodpaw became boss because he was the only one who did not run." },
      },
      choices = {
        { text = "So Woodpaw is brave?", next = "ymib_brave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymib_brave = {
      narr = "Miblon scratches behind one ear with a dirty claw and looks at the door instead of you.",
      lines = {
        { id = "yymib_brave_d", text = "Woodpaw is brave and mean, both. He keeps the pack alive and keeps the meat for himself, and Miblon does not know which one matters more. Miblon thinks maybe a boss can be good and bad at the same time." },
      },
      choices = {
        { text = "What would Miblon do as boss?", next = "ymib_boss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymib_boss = {
      lines = {
        { id = "yymib_boss_v0", when = { class = "HUNTER" }, text = "A hunter knows how a pack works, yes? Miblon thinks a good pack shares the meat, and the hunter's beast looks well fed, so the hunter must agree." },
        { id = "yymib_boss_d", text = "Miblon would share the meat, first thing, and Miblon would not fight the ogres. Miblon would move the pack somewhere quiet, where nobody needs a door guarded. But nobody listens to Miblon, because Miblon is small." },
      },
      choices = {
        { text = "The pack needs a strong boss. Woodpaw is that.", next = "BACK", reply = "Miblon supposes. Strong is good. Miblon is still hungry, though.", fx = { align = { order = 1 } } },
        { text = "Small gnolls can lead. Miblon should try.", next = "BACK", reply = "Miblon? Boss? Miblon will think about it, very quietly, where Woodpaw cannot hear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ogres = { { id = "tp_yogres", text = "Big, smelly, always hungry. Worse than Woodpaw, and Woodpaw is very bad." } },
    feralas = { { id = "tp_yferalas", text = "Miblon's home. Wet and green and full of things that eat gnolls." } },
    woodpaw = { { id = "tp_xwoodpaw", text = "Boss gnoll. Mean. Keeps all the meat." } },
    evoroot = { { id = "tp_xevoroot", text = "Funny glowing plant. The druids want it, and Miblon wants supper." } },
    _none = { { id = "tp_none", text = "Miblon does not know. Miblon is hungry." } } },
}

-- Elder Grimtotem: a tauren ancestor honored at the Lunar Festival, at Lariss Pavilion.
P:NPC {
  key = "fer_elder_grimtotem", id = 15581, name = "Elder Grimtotem", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "lunar_elders" }, temper = { "solemn", "stern" }, values = { "memory", "tradition" },
  notices = { "race" },
  impression = {
    first = "A tauren elder spirit who bears the Grimtotem name, yet speaks without their bitterness.",
    third = "{name} honored Elder Grimtotem, a tauren ancestor who stands at Lariss Pavilion.",
  },
  greetings = {
    { id = "g_default", text = "The Earth Mother sees you, traveler. You have walked a long way through these forests." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival brings me back once more. Come, honor an elder, and I will honor you in turn." },
    { id = "g_honored", when = { questDone = TODO_QUEST("Grimtotem the Elder") }, text = "You have already honored me. Go now, and walk well." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Shu'halo. You look at my name and wonder, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Grimtotem, an elder of the tauren. I lived long before my clan turned to hatred, and I mourn what they have become." } },
      again = { { id = "h_again", text = "Speak, young one. The dead have patience, but they also have very good hearing." } },
      choices = {
        { text = "How long ago did you walk among the living?", next = "ygri_long" },
        { text = "I'm Grimtotem by blood. Can I change my clan?", next = "ygri_blood", when = { race = "Tauren" } },
        { text = "What happened to the Grimtotem?", next = "clan" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "Do you blame the clan, Elder?", next = "blame", when = { race = "Tauren" } },
        { text = "What was your clan like before Magatha?", next = "w7_before" },
        { text = "Farewell.", next = "END" },
      },
    },
    w7_before = {
      lines = {
        { id = "w7_before_l1", text = "We were the singers, young one, the tribe who kept the oldest songs of the Earth Mother. When the herds moved, the Grimtotem drums led them, and the other tribes were glad of us." },
      },
      choices = {
        { text = "What changed?", next = "w7_before2" },
        { text = "Some of your clan still sing.", next = "w7_before3" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    w7_before2 = {
      lines = {
        { id = "w7_before2_l1", text = "The songs became walls. We kept them so close, so long, that we began to think only we were worthy to hear them. That is how pride turns to hate: slowly, and with good reasons at every step." },
        { id = "w7_before2_l2", when = { race = "Tauren" }, text = "Pride became walls, as it does. Your tribe may remember the Grimtotem drums at the head of the herds; ask your own elders, and they will tell you we were loved once. Remember that, when you meet my clan in the hills." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", reply = "Then a little of what we were lives on in you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_before3 = {
      lines = {
        { id = "w7_before3_l1", text = "They do, but the words have turned sour in their mouths. I would give my coin of blessing a hundred times to hear one of them sing the old way again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    clan = {
      lines = { { id = "c_default", text = "They follow Magatha now, and they hate all who are not tauren. Even the tauren of Thunder Bluff they call traitors." } },
      choices = {
        { text = "Then they must be stopped.", next = "BACK", reply = "Stopped, yes. I hope not destroyed.", fx = { align = { light = -1 } } },
        { text = "Perhaps they can be called home again.", next = "BACK", reply = "That is my prayer, every year I return.", fx = { align = { light = 1 } } },
        { text = "Who is this Magatha?", next = "magatha" },
      },
    },
    magatha = {
      lines = { { id = "ma_default", text = "Magatha Grimtotem, the clan's matriarch, who sits among the elders of Thunder Bluff and smiles at Cairne while her people sharpen their spears. She is patient, and patience in a hateful heart is a dangerous thing." } },
      choices = { { text = "I will remember that name. Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "f_default", text = "The turning of the year, when the elders walk among the living again. Honor us, and we give you a coin of ancestry." } },
      choices = { { text = "I see. Something else.", next = "BACK" } },
    },
    honor = {
      lines = { { id = "h2_default", text = "Then take this coin, and my blessing. Carry the old ways with you, and do not let them turn to hatred as my kin did." } },
      choices = { { text = "Thank you, Elder Grimtotem.", next = "BACK" } },
    },
    blame = {
      narr = "The spirit's shoulders sink for a moment.",
      lines = { { id = "b_default", text = "I blame the fear that grew in them, and the whispers of their leaders. A clan is its people, and people can change in either direction." } },
      choices = { { text = "Then there is hope.", next = "BACK" } },
    },
    ygri_long = {
      narr = "The elder's spirit-form shimmers faintly, like heat rising off the plains.",
      lines = {
        { id = "yygri_long_d", text = "Many generations, when the Grimtotem were only one tribe among many and walked with the others on the plains of Mulgore. We hunted the kodo and honoured the Earth Mother, and nobody spoke of hatred, for there was nothing yet to hate." },
      },
      choices = {
        { text = "What changed them?", next = "ygri_changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygri_changed = {
      lines = {
        { id = "yygri_changed_d", text = "Fear, first, when the centaur drove the tribes from the plains and we scattered like grass seed. Some clans learned to trust again, but the Grimtotem learned only to fear, and fear grows into hatred if it is fed long enough." },
      },
      choices = {
        { text = "Should the tribes cast them out?", next = "ygri_cast" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygri_cast = {
      lines = {
        { id = "yygri_cast_d", text = "Cairne has kept them close, hoping they will soften, and Magatha uses that hope to sharpen her knives. I do not know if he is wise or foolish, for a chieftain's choices are heavy, and I am only a spirit." },
      },
      choices = {
        { text = "Cairne is right. Keep them close and hope.", next = "BACK", reply = "That is the Bloodhoof way, and it is a good way, if they can be trusted.", fx = { align = { honor = 1 } } },
        { text = "Cast them out before they strike.", next = "BACK", reply = "You speak as a warrior. Perhaps the time for hope is passing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygri_blood = {
      lines = {
        { id = "yygri_blood_d", text = "You can, young one, for a clan is a people and not a chain. Walk with the Bloodhoof, or the Runetotem, or alone, and carry the old ways with you. That is how the Grimtotem will be saved, one heart at a time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mulgore = { { id = "tp_ymulgore", text = "The plains where we once hunted together, before the clans turned apart." } },
    cairne_bloodhoof = { { id = "tp_ycairne_bloodhoof", text = "A great chieftain, and a patient one. I hope his patience is not his ruin." } },
    _none = { { id = "tp_none", text = "That, I do not know." } },
  },
}
