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
        { text = "My first binding went badly, Adrian. It left scars.", next = "binding", when = { class = "WARLOCK" } },
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
      choices = { { text = "Mind your chalk lines, Adrian. Mine nearly cost me a hand.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I woke in a Tirisfal grave like the rest, and found I'd more curiosity than fear left. The Magic Quarter is where curiosity gets sent." } },
    _none = { { id = "tp_none", text = "That isn't in any of my notes. Ask Carendin Halgar across the quarter, if you dare take up his time." } },
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
        { text = "What did a factor's clerk do in the capital?", next = "as_clerk" },
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
      lines = { { id = "gather_default", text = "Herbs, if you've the knack, since nothing else sells so surely in this city. Failing that, bring ore or hides, because the War Quarter and the Rogues' Quarter never have enough of either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    source = {
      lines = { { id = "s_default", text = "From everywhere the Horde can reach, and a few places it can't officially. An orc lists a hide in Orgrimmar and a Forsaken tailor has it by the next post, and the goblins who carry it take their cut twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    as_clerk = {
      lines = { { id = "as_c_default", text = "Kept the books for a wool factor who bought from every farm in Tirisfal and sold to every tailor in the capital. I knew the price of a fleece in Brill before the farmer did. Then the farmers died, and so did the price." } },
      choices = {
        { text = "And now you watch the war through prices?", next = "as_war" },
        { text = "I could use your figures for my trade.", next = "BACK", when = { profession = { "Herbalism", "Mining", "Skinning" } }, reply = "Bring me your goods, then, and I'll tell you what they'll fetch. Honestly, for once." },
        { text = "Something else.", next = "BACK" },
      },
    },
    as_war = {
      lines = { { id = "as_w_default", text = "Iron up means the Bulwark is short of blades. Peacebloom down means the Society has found something better to brew with, and I'd rather not know what. Linen up, always, because somebody somewhere is always bleeding." } },
      choices = {
        { text = "Should the auction house profit from the war?", next = "as_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    as_stance = {
      lines = { { id = "as_s_default", text = "The house takes its cut from every sale, whether it's bandages for the Bulwark or poison for the Scarlets. I've been told I ought to feel something about that. I feel the cut, and that's my job." } },
      choices = {
        { text = "Trade is trade. Someone must keep the market running.", next = "BACK", reply = "Thank you. You'd be astonished how few people say so.", fx = { align = { honor = -1 } } },
        { text = "Profiting from the dying is low, even for the dead.", next = "BACK", reply = "Low and steady. I've seen worse business, believe me.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_advice_x", text = "Sell on the day the soldiers are paid, and buy on the day after a battle." } },
    goblins = { { id = "tp_goblins_x", text = "The Steamwheedle runs the neutral houses, and they charge accordingly. I admire them, from a distance." } },
    background = { { id = "tp_bg", text = "I was a factor's clerk in the capital upstairs, back when it had a market square. The square is rubble now, and the trade simply moved down a floor." } },
    _none = { { id = "tp_none", text = "I've no figures on that, and I don't guess without figures. Ask me what it costs instead." } },
  },
}
