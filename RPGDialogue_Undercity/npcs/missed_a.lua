-- Undercity folk the rosters missed, part one: a warlock's pupil, the Apothecarium's zombie herb-seller,
-- a recruit and a spectator in the War Quarter, a walking apothecary, and seven of the ring's auctioneers.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Adrian Bartlett: sits Jezelle Pruitt's demon lesson in the Magic Quarter with Winifred Kerwin and Victor Bartholomew.
P:NPC {
  key = "uc_adrian_bartlett", id = TODO_NPC("Adrian Bartlett"), name = "Adrian Bartlett", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "eager", "dry" }, values = { "ambitious" },
  notices = { "class" },
  impression = {
    first = "Adrian Bartlett stands in Jezelle Pruitt's lesson in the Magic Quarter and watches each demon she summons as a hungry man watches a kitchen door. He has the theory by heart and has yet to be trusted with the practice.",
    third = "{name} met Adrian Bartlett, a pupil at Jezelle Pruitt's demon lessons in the Magic Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down, if you please. Mistress Pruitt is lecturing, and she has a long memory for interruptions." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and between demonstrations too, which is the only safe time to talk to me." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "A practising warlock, standing in a lesson for beginners. I'll try not to be envious, though I make no promises." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You've bound one already, haven't you? You stand like someone who has had to keep a leash tight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Adrian Bartlett, and I am a student, as you can see. Mistress Pruitt shows us the demons one at a time, and Winifred, Victor and I are expected to learn what each one wants before we're allowed to call it ourselves." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Adrian Bartlett, and still a student, which you plainly are not. Mistress Pruitt shows us the demons one at a time, and I am told I'll be allowed a circle of my own when she stops finding fault with my chalk lines." },
      },
      again = {
        { id = "h_again", text = "Ask quickly, before she summons the next one." },
        { id = "h_again2", text = "Something else? I can listen to you and to her at once, provided neither of you says anything difficult." },
      },
      choices = {
        { text = "What is she teaching today?", next = "lesson" },
        { text = "You haven't summoned anything yourself yet.", next = "practice" },
        { text = "Who are the other two?", next = "others" },
        { text = "What was your first binding like for you? Mine went badly.", next = "binding", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your lesson.", next = "END" },
      },
    },
    lesson = {
      lines = { { id = "l_default", text = "The same thing she teaches every day, which is that a demon serves exactly as long as it must and not a breath longer. She calls up an imp, then a voidwalker, then the worse ones, and tells us what each would do to us if her attention slipped." } },
      choices = {
        { text = "Which one frightens you?", next = "fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "f_default", text = "The succubus, though not for the reason you'd suppose, since very little of that sort troubles the dead. She is the only one that looks at the three of us as though she were choosing, and I dislike being chosen." } },
      choices = { { text = "A sensible fear. Something else.", next = "BACK" } },
    },
    practice = {
      lines = { { id = "p_default", text = "No, I have not, and you needn't say it so loudly. Mistress Pruitt says the theory comes first because the pupils who hurried are no longer attending, and she doesn't mean that they graduated." } },
      choices = {
        { text = "Patience suits the dead. You have time.", next = "BACK", reply = "So everyone tells me, and I find it wears thin by the third year. Still, I would sooner be late than be eaten.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Winifred Kerwin has a warlock in the family and never lets us forget it, and Victor Bartholomew writes down every word, including the coughs. I ask the questions, which Mistress Pruitt says is either promise or impertinence, depending on her mood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    binding = {
      lines = { { id = "b_default", text = "Badly how, exactly? No, tell me nothing, because she says a warlock's first failure is the one lesson nobody else can teach. I shall simply stand here and imagine it, which is worse." } },
      choices = { { text = "Mind your chalk lines, Adrian.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I woke in a Tirisfal grave like the rest, and found I'd more curiosity than fear left. The Magic Quarter is where curiosity gets sent." } },
    _none = { { id = "tp_none", text = "That isn't in any of my notes. Ask Carendin Halgar across the quarter, if you dare take up his time." } },
  },
}

-- Algernon: zombie alchemy-supply vendor in the Apothecarium, a bouquet in his fist; keeps Doctor Marsh in herbs.
P:NPC {
  key = "uc_algernon", id = TODO_NPC("Algernon"), name = "Algernon", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "slow", "gentle" }, values = { "loyal" },
  notices = { "craft" },
  impression = {
    first = "Algernon is a zombie, grey and stooped, who sells vials in the Apothecarium with a bunch of wilted flowers gripped in one fist. He speaks slowly and with great care, as if each word had to be carried up a flight of stairs.",
    third = "{name} met Algernon, the zombie who sells alchemy supplies in the Apothecarium.",
  },
  greetings = {
    { id = "g_default", text = "Algernon has vials, and Algernon has herbs for the doctor. You may buy the vials, but the herbs are spoken for." },
    { id = "g_back", when = { metBefore = true }, text = "Algernon remembers you, and that is a good day, because Algernon does not remember everyone." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "You smell of the bottles, like the doctors do. Algernon has clean vials for you, with no cracks in them." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You have green on your fingers, from picking. Algernon picks too, when the doctor sends him up into the light." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Algernon sells the glass for the potions, and he carries herbs to Doctor Marsh, because the doctor must not run out. It is good work, and nobody shouts at Algernon while he does it." },
      },
      again = {
        { id = "h_again", text = "Algernon is still listening, if you talk slowly." },
        { id = "h_again2", text = "You have more to say? Algernon has time, for the vials do not go anywhere." },
      },
      choices = {
        { text = "You bring Doctor Marsh his herbs?", next = "marsh" },
        { text = "Those flowers have seen better days.", next = "flowers" },
        { text = "You're not like the other Forsaken here.", next = "zombie" },
        { text = "Show me your vials, Algernon.", next = "BUSINESS" },
        { text = "Goodbye, Algernon.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "m_default", text = "Every day, the same herbs in the same order, because Doctor Marsh is still learning and he gets cross when the bench is wrong. Algernon counts them twice, and then once more on the stairs." } },
      choices = {
        { text = "Is the doctor good to you?", next = "kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kind = {
      lines = { { id = "k_default", text = "He says thank you on the days when the potion works, and he says nothing on the other days. Doctor Halsey only looks at Algernon, for a long time, the way he looks at the things in the jars." } },
      choices = { { text = "I'd keep clear of Halsey. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    flowers = {
      lines = { { id = "f_default", text = "They were yellow when Algernon picked them, up in the Glades where the sun is. They are for somebody, he is sure of that, but he has forgotten who, so he keeps them until he remembers." } },
      choices = {
        { text = "I hope you remember, Algernon.", next = "BACK", reply = "Algernon hopes so too. It was somebody small, he thinks, and that is all there is.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zombie = {
      lines = { { id = "z_default", text = "The others woke up quick and clever, and Algernon woke up slow. The Dark Lady's people said he may stay and be useful all the same, and so he is useful every day." } },
      choices = { { text = "Useful counts for a great deal here. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Algernon does not know what he was before. He knows the vials and the herbs and the stairs, and that is enough to fill a day." } },
    _none = { { id = "tp_none", text = "That is too big for Algernon. Ask one of the doctors, for they know the big things." } },
  },
}

-- Alyssa Blaye: drills in the War Quarter with Eldin Partridge and Travist Bosk under Sergeant Houser.
P:NPC {
  key = "uc_alyssa_blaye", id = TODO_NPC("Alyssa Blaye"), name = "Alyssa Blaye", gender = "female",
  bible = "bibles/missed_a.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "fierce", "brisk" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Alyssa Blaye drills in the War Quarter under Sergeant Houser's eye, and she hits the practice dummy as though it owed her a life. She talks between strokes and never quite stops moving.",
    third = "{name} met Alyssa Blaye, a recruit drilling under Sergeant Houser in the War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Talk if you must, but stand clear of my sword arm, because the sergeant won't excuse a missed stroke on your account." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and I'm still at the same dummy. It has not yet surrendered." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "You carry steel as if you've used it. Watch my guard a moment, and tell me whether Houser is right about my elbow." },
  },
  notice = {
    { id = "n_living", cat = "class", when = { ["not"] = { race = "Scourge" } },
      text = "You breathe hard when you fight, I expect. We don't, and Sergeant Houser says that's worth a rank of men by itself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Alyssa Blaye, recruit, and no more than that until Sergeant Houser says otherwise. Eldin, Travist and I drill here from one bell to the next, and when we're good enough the Deathguard will have us." },
      },
      again = {
        { id = "h_again", text = "Go on, then. I can listen and strike at once." },
        { id = "h_again2", text = "What else? The sergeant is looking the other way for the moment." },
      },
      choices = {
        { text = "What is Sergeant Houser like?", next = "houser" },
        { text = "You hit that dummy like you hate it.", next = "hate" },
        { text = "Where will they send you?", next = "posting" },
        { text = "Your elbow drops before the cut. He's right.", next = "elbow", when = { class = "WARRIOR" } },
        { text = "Back to your drill, recruit.", next = "END" },
      },
    },
    houser = {
      lines = { { id = "ho_default", text = "He has never once said that anything was good, only that it was less bad than yesterday. Eldin thinks he's cruel, but I think he has buried recruits before and would rather not do it twice." } },
      choices = {
        { text = "And Eldin and Travist?", next = "squad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    squad = {
      lines = { { id = "sq_default", text = "Eldin Partridge thinks too long before he swings, and Travist Bosk doesn't think at all, so between them they make one decent soldier. I'd still rather have those two at my back than strangers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hate = {
      lines = { { id = "ha_default", text = "I do hate it, because I've decided it wears a red tabard. The Scarlet Crusade burned the farm I woke up beside with the people still in it, living and dead alike, and I mean to return the courtesy." } },
      choices = {
        { text = "Then drill hard. They don't die easily.", next = "BACK", reply = "Neither do we, which is rather the point of us. I'll drill until the dummy falls apart.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    posting = {
      lines = { { id = "po_default", text = "The Bulwark, if I'm lucky, where the Plaguelands begin and the Scourge comes down the road. If I'm not, it will be a bridge in Silverpine, watching for worgen and wishing something would happen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elbow = {
      lines = { { id = "e_default", text = "Damn it all, then he is right, and I've lost a week arguing about it. I'd thank you, but the sergeant will be unbearable when I tell him." } },
      choices = { { text = "Don't tell him. Just fix it.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I woke in Tirisfal with nothing but a grudge, and the War Quarter was the first place that had a use for one." } },
    _none = { { id = "tp_none", text = "I'm a recruit. Nobody tells me anything except to keep my guard up." } },
  },
}

-- Andrew Hartwell: one of the crowd cheering Edward and Tyler in the War Quarter's fighting pit.
P:NPC {
  key = "uc_andrew_hartwell", id = TODO_NPC("Andrew Hartwell"), name = "Andrew Hartwell", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "loud", "sardonic" }, values = { "bloodthirsty" },
  notices = { "race" },
  impression = {
    first = "Andrew Hartwell stands at the rail of the War Quarter's pit and shouts advice at two fighters who can't hear him. He keeps a running account of every bout, and he is wrong about most of them with complete confidence.",
    third = "{name} met Andrew Hartwell, a loud spectator at the War Quarter's fighting pit.",
  },
  greetings = {
    { id = "g_default", text = "Find a place at the rail, friend, and don't block my view. Brother Malach is about to send in the next lot." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another bout? I knew you had the look of someone who enjoys a proper show." },
    { id = "g_human", when = { race = "Human" }, text = "A living human, standing at the rail instead of down in the sand. You've a stronger stomach than the last three we had in there." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { ["not"] = { race = "Scourge" } },
      text = "You'll want to stand back a pace. When the abomination comes out, the front row gets rather more of it than they wanted." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Andrew Hartwell, and I've not missed a bout this season. Edward and Tyler are our lads down there, and Brother Malach keeps them supplied with things to kill, which is the best entertainment this city has." },
      },
      again = {
        { id = "h_again", text = "Go on, but talk while I watch, because I'll not turn my back on the sand." },
        { id = "h_again2", text = "What else? Be quick, they're about to start again." },
      },
      choices = {
        { text = "What do they fight?", next = "bouts" },
        { text = "Which of the two is better?", next = "better" },
        { text = "Hartwell. Like the mage trainer?", next = "name" },
        { text = "This is a cruel sort of sport.", next = "cruel" },
        { text = "Enjoy the show.", next = "END" },
      },
    },
    bouts = {
      lines = { { id = "b_default", text = "It always goes the same way, and I never tire of it. First come three human captives, who don't last, then a ghoul and a zombie together, and to finish Malach lets an abomination loose on the pair of them." } },
      choices = {
        { text = "Where do the captives come from?", next = "captives" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captives = {
      lines = { { id = "c_default", text = "Scarlets from the Monastery road, or so I like to think, though nobody announces them. They get a blade and a chance, which is more than their Crusade ever gave one of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    better = {
      lines = { { id = "be_default", text = "Edward, without question, since he has the reach and the patience. Chloe Curthas beside me swears by Tyler, mind you, and she has a trainer in the family, so she thinks that settles it." } },
      choices = { { text = "You sound very sure. Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "There are more Hartwells down here than you'd think, and we don't all dine together. Anastasia throws fire in the Magic Quarter and Geoffrey sells blades around the corner, and I do the family's shouting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cruel = {
      lines = { { id = "cr_default", text = "It is, and I'll not pretend otherwise. We were farmers and clerks until the Scourge made corpses of us, and a little cruelty at a safe distance is what we have instead of a harvest fair." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a Lordaeron man with a quiet trade, once. Now I've a place at the rail, and I find I prefer it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it didn't happen in the pit, I didn't see it." } },
  },
}

-- Apothecary Vallia: Royal Apothecary Society; walks a round between the Apothecarium and the Trade Quarter.
P:NPC {
  key = "uc_vallia", id = TODO_NPC("Apothecary Vallia"), name = "Apothecary Vallia", title = "Royal Apothecary Society", gender = "female",
  bible = "bibles/missed_a.md", role = "scholar", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "brisk", "cold" }, values = { "practical", "loyal" },
  notices = { "craft", "race" },
  impression = {
    first = "Apothecary Vallia walks between the Apothecarium and the Trade Quarter with a satchel that clinks, and she does not slow down for conversation. She answers questions over her shoulder, precisely, and only once.",
    third = "{name} met Apothecary Vallia of the Royal Apothecary Society on her rounds through the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Walk with me if you wish to talk, because the Society does not pay me to stand still." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Keep pace this time, and mind the satchel." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "You've stains on your cuffs that I recognise. Walk with me, then, and tell me what you've been ruining lately." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { ["not"] = { race = "Scourge" } },
      text = "Don't touch the canal water, and don't ask me what's in it. Your sort has lungs to consider." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Apothecary Vallia, of the Royal Apothecary Society. I carry what the Apothecarium needs down from the Trade Quarter and what it has finished back up again, and I'm trusted not to drop either." },
      },
      again = {
        { id = "h_again", text = "Ask the next one. I've another flight of stairs before I'm rid of this satchel." },
        { id = "h_again2", text = "Well? I can spare you as far as the next archway." },
      },
      choices = {
        { text = "What's in the satchel?", next = "satchel" },
        { text = "What does the Society want with the market?", next = "market" },
        { text = "You must know every corner of this city.", next = "city" },
        { text = "Does the Society take on new alchemists?", next = "join", when = { profession = "Alchemy" } },
        { text = "I won't keep you.", next = "END" },
      },
    },
    satchel = {
      lines = { { id = "s_default", text = "Samples going one way and reagents coming the other, each in a stoppered bottle with a label only we can read. If I told you more, Master Faranell would want to know why, and I'd have no good answer for him." } },
      choices = {
        { text = "Has one ever broken?", next = "broken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    broken = {
      lines = { { id = "br_default", text = "Once, on the stairs by the bank, when a courier ran into me. They scrubbed that step for a week, and the moss has never grown back on it." } },
      choices = { { text = "I'll give you room. Something else.", next = "BACK" } },
    },
    market = {
      lines = { { id = "m_default", text = "Herbs by the crate, glass by the gross, and whatever odd thing the auctioneers have that week. The New Plague is the Dark Lady's answer to the Scourge, and it will not brew itself out of good intentions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "I know which stairs are short and which bat handler talks too much, and that is all a city is. If you're lost, keep the canal on one hand and you'll come back to the Trade Quarter sooner or later." } },
      choices = { { text = "Useful. Something else.", next = "BACK" } },
    },
    join = {
      lines = { { id = "j_default", text = "The Society takes results, and people only when they come attached to them. Bring Doctor Halsey something that works, and you'll find doors in the Apothecarium open that you hadn't noticed were shut." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I ground powders for a chemist in life, and I carry bottles for the Society in death. The work is better now, and so is the cause." } },
    _none = { { id = "tp_none", text = "That is not the Society's business, and so it isn't mine. Ask a guard." } },
  },
}

-- Auctioneer Cain: auctioneer in the ring between the Trade Quarter and the canals.
P:NPC {
  key = "uc_auctioneer_cain", id = TODO_NPC("Auctioneer Cain"), name = "Auctioneer Cain", title = "Auctioneer", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "solemn", "dry" }, values = { "orderly" },
  notices = { "purse" },
  impression = {
    first = "Auctioneer Cain reads out lots in the ring above the canals with the gravity of a man reading a will. He treats every sale as an estate, which in this city it very often is.",
    third = "{name} met Auctioneer Cain, who calls the lots in the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Every lot here once belonged to someone, and I ask only that you bid as though you remembered it." },
    { id = "g_back", when = { metBefore = true }, text = "You return to us. The listings have changed since you left, though the fees, I regret to say, have not." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The house keeps no hours, since its staff need no sleep. Bid at your leisure." },
  },
  notice = {
    { id = "n_living", cat = "purse", when = { ["not"] = { race = "Scourge" } },
      text = "The living are welcome to bid. Your coin has no pulse either, and it spends the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Auctioneer Cain. I take in what people no longer need, and I see that it passes to someone who does, with the house's fee taken decently off the top." },
      },
      again = {
        { id = "h_again", text = "Is there something further? The ledger will wait a moment." },
        { id = "h_again2", text = "Do go on. I'm in no hurry, and haven't been for years." },
      },
      choices = {
        { text = "You speak of lots like funerals.", next = "estates" },
        { text = "How does the house make its money?", next = "fees" },
        { text = "There are a great many auctioneers here.", next = "staff" },
        { text = "Let me see the listings.", next = "BUSINESS" },
        { text = "Good day, Cain.", next = "END" },
      },
    },
    estates = {
      lines = { { id = "e_default", text = "A good half of what we sell came off someone who had no further use for it, in one way or another. I find that a little ceremony costs nothing, and the previous owner is seldom in a position to object." } },
      choices = {
        { text = "Does anyone ever come back for their things?", next = "return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["return"] = {
      lines = { { id = "r_default", text = "Now and then one of us wakes in Tirisfal and finds his own sword on my list at a fair price. I tell him the truth, which is that he may bid for it like anyone else." } },
      choices = { { text = "That's cold, even for here. Something else.", next = "BACK" } },
    },
    fees = {
      lines = { { id = "f_default", text = "You leave a deposit when you list, and you lose it if nobody wants your goods. If they sell, the house keeps a small part of the price, and both of us go away content." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    staff = {
      lines = { { id = "s_default", text = "The ring is wide and the bidders are impatient, so the house keeps a caller at every turn of it. Stockton knows the prices best and Yarly cares the least, and you may take your custom to whichever suits you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept accounts in life, I believe. The habit of the ledger outlasted the memory of the office." } },
    _none = { { id = "tp_none", text = "I'm afraid that is not on my list. If it isn't listed, I cannot speak to it." } },
  },
}

-- Auctioneer Epitwee: auctioneer in the ring; brisk, all fees and arithmetic.
P:NPC {
  key = "uc_auctioneer_epitwee", id = TODO_NPC("Auctioneer Epitwee"), name = "Auctioneer Epitwee", title = "Auctioneer", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "sharp" }, values = { "thrifty" },
  notices = { "purse" },
  impression = {
    first = "Auctioneer Epitwee does sums aloud while she talks, and she has the house's cut worked out before the seller has finished describing the goods. She has no patience for bidders who can't make up their minds.",
    third = "{name} met Auctioneer Epitwee, a quick-tongued caller in the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Buying or selling? Decide before you reach the counter, because there's a queue behind you whether you can see it or not." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, so either you sold well or you bought badly. Which is it today?" },
  },
  notice = {
    { id = "n_goblin", cat = "purse", when = { race = "Goblin" },
      text = "A goblin at my counter. You'll not talk me down on the deposit, so save us both the breath you still have." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Epitwee. I list it, I call it, and I take the house's share, and I do all three faster than anyone else in this ring." },
      },
      again = {
        { id = "h_again", text = "Next question, and briskly, please." },
        { id = "h_again2", text = "Yes? I'm adding a column while you think, so take your time if you must." },
      },
      choices = {
        { text = "What sells quickest down here?", next = "sells" },
        { text = "You sound as if bidders annoy you.", next = "bidders" },
        { text = "Any advice for someone selling?", next = "advice" },
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "I'll be off.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Herbs, before anything, because the Apothecarium eats them by the crate and never says what for. After that it's cloth for bandages and iron for the War Quarter, and anything a living adventurer has decided is pretty." } },
      choices = {
        { text = "And what never sells?", next = "never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    never = {
      lines = { { id = "n_default", text = "Food, in any quantity worth mentioning. Three customers in four down here haven't a working stomach, and the fourth is an orc who brought his own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bidders = {
      lines = { { id = "b_default", text = "The ones who bid a copper over each other all afternoon annoy me, yes. I've eternity ahead of me, and I still don't intend to spend it watching two fools fight over a belt." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Price it to sell today and not to flatter yourself, because a deposit lost is silver you threw in the canal. Look at what the same thing is already listed for, and go a little under." } },
      choices = { { text = "Sound enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I counted other people's money before the plague and I count it now. Death changed my complexion and nothing else." } },
    _none = { { id = "tp_none", text = "There's no fee in that for the house, so I've never looked into it." } },
  },
}

-- Auctioneer Leeka: auctioneer in the ring; a shopkeeper by old habit.
P:NPC {
  key = "uc_auctioneer_leeka", id = TODO_NPC("Auctioneer Leeka"), name = "Auctioneer Leeka", title = "Auctioneer", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "wry", "steady" }, values = { "practical" },
  notices = { "gear" },
  impression = {
    first = "Auctioneer Leeka handles other people's goods as a shopkeeper would, turning each piece over and checking the rivets before she lists it. She misses having a counter of her own and says so without self-pity.",
    third = "{name} met Auctioneer Leeka, who has a shopkeeper's eye for the goods in the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Come up to the counter, such as it is. Nothing on it is mine, but I can tell you which of it is worth your coin." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning customer. That is the one pleasure of the trade that death left alone." },
    { id = "g_shield", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } }, text = "You're one who carries a shield, or ought to. I've an eye for them still, so ask me before you bid on one." },
  },
  notice = {
    { id = "n_gear", cat = "gear", when = { class = { "WARRIOR", "PALADIN" } },
      text = "That harness has been mended by someone who knew the work. I always notice, and I can't seem to stop." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Leeka. I kept a shop of my own in life, with my name over the door, and now I sell other people's stock for a house that pays me in purpose. It's a comedown, but it is still selling." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I've a few lots to look over, but they'll keep." },
        { id = "h_again2", text = "Go on. A shopkeeper never minds a customer who lingers." },
      },
      choices = {
        { text = "What did your shop sell?", next = "shop" },
        { text = "You check the goods before you list them.", next = "check" },
        { text = "What should I look for in a shield?", next = "shield", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } } },
        { text = "Show me what's listed.", next = "BUSINESS" },
        { text = "Good day, Leeka.", next = "END" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "Shields and maces, the honest sort that a militiaman could afford and trust. I remember the stock better than I remember the street, which tells you what mattered to me." } },
      choices = {
        { text = "Do you miss it?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss knowing my customers by name and their sons after them. Here a lot comes in from Orgrimmar and goes out to a stranger, and I never learn whether it served him well." } },
      choices = { { text = "It served someone. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    check = {
      lines = { { id = "c_default", text = "The house doesn't ask me to, but I'll not put my voice to rubbish. A blade with a cracked tang gets listed all the same, mind you, and all I can do is call it without enthusiasm." } },
      choices = { { text = "I'll listen for that. Something else.", next = "BACK" } },
    },
    shield = {
      lines = { { id = "sh_default", text = "Look at the straps before the face, because a handsome boss won't help you when the grip tears out. Then knock on it, and if it rings thin, leave it for some other fool." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a shopkeeper, and I died one. I'd be one still if anyone would rent a counter to me." } },
    _none = { { id = "tp_none", text = "That I never stocked, and so I never learned it. Try the trainers upstairs." } },
  },
}

-- Auctioneer Naxxremis: auctioneer in the ring; enjoys a bidding war for its own sake.
P:NPC {
  key = "uc_auctioneer_naxxremis", id = TODO_NPC("Auctioneer Naxxremis"), name = "Auctioneer Naxxremis", title = "Auctioneer", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gleeful", "cold" }, values = { "competitive" },
  notices = { "purse" },
  impression = {
    first = "Auctioneer Naxxremis calls her lots with relish, and her voice rises whenever two bidders start to hate each other. She says the goods are incidental and the spite is the real merchandise.",
    third = "{name} met Auctioneer Naxxremis, who delights in a bidding war in the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Step up, step up. Somebody in this city wants the very thing you want, and I can't wait to introduce you." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you win the last one, or have you come to try again with a heavier purse?" },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { level = { min = 40 } },
      text = "You've the look of deep pockets and old grudges. You will be very good for business, I can tell." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Naxxremis, at your service and at your rival's. I call the lots, and I've found there is nothing so lively in a city of the dead as two people who both want the last one." },
      },
      again = {
        { id = "h_again", text = "More? Good, I do enjoy a customer who can't leave well alone." },
        { id = "h_again2", text = "Go on, then. Nobody is bidding against you for my time." },
      },
      choices = {
        { text = "You enjoy this more than seems decent.", next = "enjoy" },
        { text = "What's the fiercest bidding you've seen?", next = "fiercest" },
        { text = "How do I win a bidding war?", next = "win" },
        { text = "Show me the lots.", next = "BUSINESS" },
        { text = "Another time.", next = "END" },
      },
    },
    enjoy = {
      lines = { { id = "e_default", text = "Decency went into the ground with the rest of me, and I've not missed it. We feel so little now that a good honest spite is worth warming one's hands at, even when it belongs to someone else." } },
      choices = { { text = "At least you admit it. Something else.", next = "BACK" } },
    },
    fiercest = {
      lines = { { id = "f_default", text = "Two apothecaries, over a single crate of gromsblood that each needed for the same experiment. It went to nine times its worth, and the loser stood at my counter for an hour afterwards without saying a word." } },
      choices = {
        { text = "What became of the winner?", next = "winner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winner = {
      lines = { { id = "w_default", text = "Her experiment failed, I'm told, and the gromsblood went into the canal with it. I think of that crate whenever business is slow, and it cheers me enormously." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    win = {
      lines = { { id = "wi_default", text = "Decide your limit before you start, and then pay the buyout if there is one, because it ends the matter cleanly. I'm sorry to say it, since a clean ending is the dullest thing I ever have to call." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I couldn't tell you what I was before. I only know that I woke up bored, and the auction ring cured it." } },
    _none = { { id = "tp_none", text = "Nobody's bidding on that, so I've no opinion of it at all." } },
  },
}

-- Auctioneer Rhyker: auctioneer in the ring; strict about the house's rules.
P:NPC {
  key = "uc_auctioneer_rhyker", id = TODO_NPC("Auctioneer Rhyker"), name = "Auctioneer Rhyker", title = "Auctioneer", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "stern", "precise" }, values = { "orderly", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Auctioneer Rhyker recites the house's rules before anyone has asked, and she recites them again to anyone who tries to haggle. She regards a posted price as a kind of oath.",
    third = "{name} met Auctioneer Rhyker, who keeps the Undercity auction house's rules to the letter.",
  },
  greetings = {
    { id = "g_default", text = "The price listed is the price, the deposit is not returned on unsold goods, and I do not haggle. Now, how may I help you?" },
    { id = "g_back", when = { metBefore = true }, text = "You know the rules already, so I'll spare you the recital. What do you need?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Hands where I can see them, if you please. The house has had dealings with your profession before." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I count the lots before a rogue comes to the counter and again after he leaves. Take no offence, for it's only the rule." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Rhyker. The house runs on its rules, and I am here to see them kept, because a market without them is merely a crowd of people robbing each other slowly." },
      },
      again = {
        { id = "h_again", text = "Is there another matter? State it plainly." },
        { id = "h_again2", text = "Go on. I'm permitted to answer questions, within reason." },
      },
      choices = {
        { text = "What are the rules, then?", next = "rules" },
        { text = "Nobody ever haggles with you?", next = "haggle" },
        { text = "Who settles it when a sale goes wrong?", next = "dispute" },
        { text = "I'd like to see the listings.", next = "BUSINESS" },
        { text = "Good day.", next = "END" },
      },
    },
    rules = {
      lines = { { id = "r_default", text = "You list for a set time and pay a deposit to do it. The highest bid takes the lot when the time runs out, unless someone has paid the buyout first, and the coin and the goods both travel by post so that buyer and seller never need meet." } },
      choices = {
        { text = "Why keep them apart?", next = "apart" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apart = {
      lines = { { id = "a_default", text = "Because half of this city carries knives and the other half carries poisons, and a buyer who feels cheated has all of eternity in which to brood. The mailbox has never yet stabbed anyone." } },
      choices = { { text = "A wise rule. Something else.", next = "BACK" } },
    },
    haggle = {
      lines = { { id = "h2_default", text = "They try, and the goblins try hardest. I tell each of them that Naxxremis down the ring enjoys an argument, and that I am not Naxxremis." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dispute = {
      lines = { { id = "d_default", text = "Nothing goes wrong, because the house holds the coin until the lot is delivered. Should someone object to that all the same, the Deathguard at the archway are very attentive listeners." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served the law in a small way under the old kingdom, and I serve the house's law now. Order is the one thing the plague couldn't rot." } },
    _none = { { id = "tp_none", text = "That falls outside the house's rules, and I don't speculate. Ask elsewhere." } },
  },
}

-- Auctioneer Stockton: auctioneer in the ring; the one who knows what everything fetches.
P:NPC {
  key = "uc_auctioneer_stockton", id = TODO_NPC("Auctioneer Stockton"), name = "Auctioneer Stockton", title = "Auctioneer", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "shrewd", "talkative" }, values = { "curious" },
  notices = { "craft" },
  impression = {
    first = "Auctioneer Stockton knows what everything in the Undercity fetched last week and has a theory about what it will fetch next. He reads the whole war in the price of iron and peacebloom.",
    third = "{name} met Auctioneer Stockton, who follows every price in the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Good day. Copper ore is up and linen is down, in case you were wondering, and you ought to be." },
    { id = "g_back", when = { metBefore = true }, text = "Back to watch the prices, or to move them? Either way, I've news since you were last here." },
    { id = "g_gather", when = { profession = "Herbalism" }, text = "An herbalist, I'd wager, by the satchel. Whatever you've picked, the Apothecarium wants it more than you do, so list it." },
  },
  notice = {
    { id = "n_mining", cat = "craft", when = { profession = "Mining" },
      text = "A miner, and a welcome one. The War Quarter's forges have been outbidding each other for ore all month." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Stockton. I call the lots like the others, but I also keep track of them, and you'd be surprised how much of the world you can read off a price list if you look at it every day." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've figures for nearly everything." },
        { id = "h_again2", text = "Ask away. Knowledge keeps better than most of what I sell." },
      },
      choices = {
        { text = "What do the prices tell you?", next = "prices" },
        { text = "What should I be gathering to sell?", next = "gather" },
        { text = "Where do all these goods come from?", next = "source" },
        { text = "Show me today's listings.", next = "BUSINESS" },
        { text = "Thank you, Stockton.", next = "END" },
      },
    },
    prices = {
      lines = { { id = "p_default", text = "When iron climbs, the Deathguard is arming for something, and when swiftthistle climbs, the rogues are. Just now it's the plague herbs that won't stay on the list, so I'd say the Apothecaries are close to something they like." } },
      choices = {
        { text = "Does that worry you?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "I am already dead, so there's a limit to what they can do to me. I'd sell before the news breaks rather than after, though, and that is as much worrying as I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gather = {
      lines = { { id = "g_default", text = "Herbs, if you've the knack, since nothing else sells so surely in this city. Failing that, bring ore or hides, because the War Quarter and the Rogues' Quarter never have enough of either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    source = {
      lines = { { id = "s_default", text = "From everywhere the Horde can reach, and a few places it can't officially. An orc lists a hide in Orgrimmar and a Forsaken tailor has it by the next post, and the goblins who carry it take their cut twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a factor's clerk in the capital upstairs, back when it had a market square. The square is rubble now, and the trade simply moved down a floor." } },
    _none = { { id = "tp_none", text = "I've no figures on that, and I don't guess without figures. Ask me what it costs instead." } },
  },
}

-- Auctioneer Tricket: auctioneer in the ring; puzzled and fascinated by what the living buy.
P:NPC {
  key = "uc_auctioneer_tricket", id = TODO_NPC("Auctioneer Tricket"), name = "Auctioneer Tricket", title = "Auctioneer", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "curious", "dry" }, values = { "curious" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Tricket studies her living customers as a naturalist studies beetles, and she keeps a private list of the strangest things they have bought. She asks nearly as many questions as she answers.",
    third = "{name} met Auctioneer Tricket, who is fascinated by what the living buy at the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the auction house. Tell me what you're after, and don't be shy about it, because I've heard stranger." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Did the last thing you bought turn out to be what you wanted?" },
    { id = "g_living", when = { ["not"] = { race = "Scourge" } }, text = "Oh, good, a live one. Do tell me what you mean to buy, because your people's shopping never fails to astonish me." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, all the way down here under the stone. I'd have thought you would miss the sky too much to shop." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Tricket. I call lots for the house, and in the quiet hours I try to work out why anybody wants half of them." },
        { id = "h_living", when = { ["not"] = { race = "Scourge" } }, text = "Auctioneer Tricket. I call lots for the house, and I've a question for you when you've a moment, because you are breathing and I've been wondering about something." },
      },
      again = {
        { id = "h_again", text = "What else? I'm quite at leisure." },
        { id = "h_again2", text = "Do go on. You're more interesting than the ledger." },
      },
      choices = {
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "What puzzles you about the living?", next = "living" },
        { text = "What did you want to ask me?", next = "ask", when = { ["not"] = { race = "Scourge" } } },
        { text = "What do the Forsaken buy?", next = "forsaken" },
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "Goodbye, Tricket.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "A small green snake in a wicker cage, which went for more than a good sword did that same afternoon. The buyer was a troll, and he carried it off as if it were his firstborn." } },
      choices = {
        { text = "People like company on the road.", next = "pets" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pets = {
      lines = { { id = "p_default", text = "So I'm told, and I've added it to my list of things I used to understand. I believe I kept a cat once, but I can't recall its name, and I find that I mind that more than I expected." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    living = {
      lines = { { id = "l_default", text = "The food, chiefly. Orcs will pay good silver for a stack of spiced meat that will be gone by evening, and then they come back and do it again the next day." } },
      choices = { { text = "Hunger is persuasive. Something else.", next = "BACK" } },
    },
    ask = {
      lines = { { id = "a_default", text = "When you buy a fine cloak, is it for the warmth or for being looked at? I've sold a hundred of them, and I can no longer remember which one it was that I used to care about." } },
      choices = {
        { text = "The warmth, mostly.", next = "BACK", reply = "How practical of you. I'd have guessed the other, so I shall have to amend my list." },
        { text = "For being looked at, if I'm honest.", next = "BACK", reply = "Ha, I thought as much! Thank you, that's the first straight answer I've had all week.", fx = { affinity = 1 } },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Reagents, thread and embalming salts, in sensible quantities and with no fuss at all. We're dull customers, I'm afraid, which is why I'm so glad of the other sort." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was somebody's daughter in a town that isn't there any more. I remember the shop windows better than I remember the house." } },
    _none = { { id = "tp_none", text = "I haven't the least idea, and now I shall wonder about it all day. Thank you for that." } },
  },
}
