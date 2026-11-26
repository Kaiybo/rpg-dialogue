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
      again = { { id = "h_again", text = "Ask, then. I have time, though less of it than I once did." } },
      choices = {
        { text = "Why did you flee Eldre'Thalas?", next = "flee" },
        { text = "Who are the Shen'dralar?", next = "shendralar" },
        { text = "What did the imp take?", next = "book" },
        { text = "I'll trust no Highborne.", next = "distrust" },
        { text = "How do you live without the arcane?", next = "withdrawal", when = { class = "MAGE" } },
        { text = "Elune forgives those who turn from the Well.", next = "forgive", when = { race = "NightElf" } },
        { text = "Farewell, elder.", next = "END" },
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
    { id = "g_default", text = "Hello there! Don't mind us, we're only resting our feet. Paige says I've walked her halfway round Kalimdor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We sailed over from Stormwind to see the world while we're young enough to enjoy it. The elves at Feathermoon think we're mad, and they may be right." } },
      again = { { id = "h_again", text = "Anything else? Paige has the map, but I've the stories." } },
      choices = {
        { text = "Why Feralas, of all places?", next = "why" },
        { text = "It's dangerous out here.", next = "danger" },
        { text = "What's the best place you've seen?", next = "xbest" },
        { text = "How did you and Paige meet?", next = "xmet" },
        { text = "You seem very happy for a man so far from home.", next = "xhappy" },
        { text = "I'm from Stormwind too. Where did you live?", next = "xhuman", when = { race = "Human" } },
        { text = "Safe travels.", next = "END" },
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
  },
  topics = {
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
      again = { { id = "h_again", text = "What else, dear?" } },
      choices = {
        { text = "Where are you headed next?", next = "next" },
        { text = "Do you regret coming?", next = "regret" },
        { text = "What do you miss about home?", next = "xmiss" },
        { text = "Is Erik a good husband?", next = "xerik" },
        { text = "You seem the sensible one.", next = "xsense" },
        { text = "I'm a priest. Want a blessing for the road?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Take care.", next = "END" },
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
  },
  topics = {
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
      again = { { id = "h_again", text = "Anything else? I've a ledger to keep." } },
      choices = {
        { text = "What do you need?", next = "need" },
        { text = "A human, out at Thalanaar?", next = "human" },
        { text = "Who are your sisters?", next = "sisters" },
        { text = "Another human this far west! I've come from Stormwind.", next = "home", when = { race = "Human" } },
        { text = "I skin. I can take those hyenas cleanly.", next = "skinner", when = { profession = "Skinning" } },
        { text = "Good trading.", next = "END" },
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
    { id = "g_default", text = "Bzzt. Distress mode active. This unit has experienced an unscheduled landing. Please contact Oglethorpe Obnoticus of Booty Bay." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Homing Robot OOX-22/FE reporting. My flight systems are damaged, and my homing beacon is pointing directly at that cave full of yetis, which I consider a design flaw." } },
      again = { { id = "h_again", text = "Bzzt. Awaiting further input." } },
      choices = {
        { text = "Can you walk?", next = "walk" },
        { text = "Who built you?", next = "maker" },
        { text = "Why did you crash here?", next = "xcrash" },
        { text = "What do you think of yetis?", next = "xyeti" },
        { text = "You're very polite for a robot.", next = "xpolite" },
        { text = "I'm a gnome. Can I fix your thrusters?", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'll leave you be.", next = "END" },
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
  },
  topics = {
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
      again = { { id = "h_again", text = "Ask what you would, traveller." } },
      choices = {
        { text = "How is it different from other leatherworking?", next = "diff" },
        { text = "Why teach here at Thalanaar?", next = "here" },
        { text = "Who taught you tribal leatherwork?", next = "xwho" },
        { text = "What beasts do you work with?", next = "xbeasts" },
        { text = "You speak of the beast with respect.", next = "xrespect" },
        { text = "I'm a hunter. My pet would approve, I think.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Elune keep you.", next = "END" },
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
  },
  topics = {
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
      again = { { id = "h_again", text = "Anything else? Be quick, I may be called to the wall." } },
      choices = {
        { text = "Why are the Sentinels short?", next = "short" },
        { text = "What is Thalanaar for?", next = "outpost" },
        { text = "Who makes the armour you sell?", next = "xwho" },
        { text = "What's the danger out in the forest?", next = "xdanger" },
        { text = "You stand like a Sentinel, not a merchant.", next = "xsentinel" },
        { text = "I'm a druid. Do you sell to druids often?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Thank you.", next = "END" },
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
  },
  topics = {
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
      again = { { id = "h_again", text = "What else, traveller?" } },
      choices = {
        { text = "A priestess selling thread?", next = "priestess" },
        { text = "Tell me about the moonwell.", next = "well" },
        { text = "How long have you been at Thalanaar?", next = "xlong" },
        { text = "Who comes through Thalanaar?", next = "xwho" },
        { text = "Your thread shimmers in the light.", next = "xshimmer" },
        { text = "I'm a priestess of Elune too.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Elune keep you.", next = "END" },
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
  },
  topics = {
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
    { id = "g_default", text = "Grumble, grumble. Go away. Miblon guards the door, and Miblon is hungry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Miblon watches the plants behind the door. Nobody brings Miblon food, nobody brings Miblon relief, so Miblon stands here and grumbles." } },
      again = { { id = "h_again", text = "Still here? Miblon is still hungry." } },
      choices = {
        { text = "What's behind the door?", next = "door" },
        { text = "What would you eat, if you could?", next = "food" },
        { text = "Who left you here?", next = "xwho" },
        { text = "What's an Evoroot?", next = "xevo" },
        { text = "You don't look like the other gnolls.", next = "xdiff" },
        { text = "I'm a hunter. I could share some meat.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Enjoy your post.", next = "END" },
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
  },
  topics = {
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
      again = { { id = "h_again", text = "Speak, young one." } },
      choices = {
        { text = "What happened to the Grimtotem?", next = "clan" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "Do you blame the clan, Elder?", next = "blame", when = { race = "Tauren" } },
        { text = "Farewell.", next = "END" },
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
  },
  topics = {
    _none = { { id = "tp_none", text = "That, I do not know." } },
  },
}
