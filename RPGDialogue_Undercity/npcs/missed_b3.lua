-- Undercity folk the first passes missed (part 3 of 3): Sergeant Rutger and the recruit Travist Bosk, Tyler of the
-- War Quarter pit, Silas Zimmer in the Temple of the Damned, Susan Tillinghast of the Rogues' Quarter, enchanting
-- supplier Thaddeus Webb, Theodore Griffs at his bookshelf, the sick tauren Thersa Windsong, Jezelle Pruitt's pupils
-- Victor Bartholomew and Winifred Kerwin, and apprentice tailor Victor Ward. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sergeant Rutger: a sergeant of the Deathguard in the War Quarter.
P:NPC {
  key = "uc_sergeant_rutger", id = TODO_NPC("Sergeant Rutger"), name = "Sergeant Rutger", title = "Sergeant", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "grim" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Sergeant Rutger keeps the Deathguard's rolls in the War Quarter and speaks in the flat, quick way of a man who has read too many casualty lists. Where Sergeant Houser shouts, Rutger simply waits until you've finished being wrong.",
    third = "{name} met Sergeant Rutger, a sergeant of the Deathguard in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "State your business, {class}. I've a watch to post and four names fewer to post it with than I had last week." },
    { id = "g_back", when = { metBefore = true }, text = "You're still in one piece, I see. Then you're doing better than the patrol I sent to the Bulwark." },
  },
  notice = {
    { id = "n_fighter", cat = "class", when = { class = { "WARRIOR", "HUNTER", "ROGUE" } },
      text = "You look as though you can handle yourself, and I've a use for such people. Deathguard Dillinger in Brill and the Executor at the Bulwark never have enough of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Sergeant Rutger, of the Deathguard. Houser makes the soldiers and I decide where they stand, which is the less cheerful half of the work, since I'm the one who knows how many come back." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be quick about it." },
        { id = "h_again2", text = "Go on, {class}, I'm listening." },
      },
      choices = {
        { text = "Where do you send them?", next = "posts" },
        { text = "How many come back?", next = "back" },
        { text = "The Horde could send you soldiers.", next = "horde", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "As you were, Sergeant.", next = "END" },
      },
    },
    posts = {
      lines = { { id = "p_default", text = "The city's gates and lifts first, then Brill and the road, then the Bulwark where Tirisfal meets the Plaguelands. What's left goes south to the Sepulcher in Silverpine and to Tarren Mill, where the humans of Hillsbrad are still pretending we'll go away." } },
      choices = {
        { text = "Which post is the worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The Bulwark, without question, because the Scourge sends our own dead back at us there. The Scarlet Crusade in the north of Tirisfal is a close second, though at least a Scarlet has the courtesy to stay down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    back = {
      lines = { { id = "b_default", text = "Enough to hold the line and never enough to move it. We can't raise sons to replace the fallen as the living do, so every Deathguard I lose is one the Dark Lady doesn't get back, unless some old grave gives up a new recruit, and those are running short." } },
      choices = {
        { text = "That's a hard sum to live with.", next = "sum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sum = {
      lines = { { id = "s_default", text = "It's the only sum there is, {class}, and I do it every morning. It's why I'm sparing with them, and why I'll take a capable stranger over a brave recruit any day of the week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "ho_default", text = "It could, and now and then it does, and I'll say for your people that they fight well and ask few questions. They also can't stand the smell of the place for more than a week, so I've learned not to write them into the roster in ink." } },
      choices = { { text = "A fair complaint. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a soldier before the plague and I'm a soldier after it. Only the roll has changed, and it gets shorter every month." } },
    _none = { { id = "tp_none", text = "That's not a matter for the watch. Take it to someone with time to spare." } },
  },
}

-- Silas Zimmer: stands in the Temple of the Damned, across from Hannah Akeley.
P:NPC {
  key = "uc_silas_zimmer", id = TODO_NPC("Silas Zimmer"), name = "Silas Zimmer", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "quiet", "grim" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Silas Zimmer stands in the Temple of the Damned across from Hannah Akeley's reagent table, with powders and old charms laid out before him that he doesn't seem to be selling. He studies the warlocks who pass him with a collector's patience.",
    third = "{name} met Silas Zimmer, who keeps a table of old charms in the Undercity's Temple of the Damned.",
  },
  greetings = {
    { id = "g_default", text = "Look all you like, but nothing here is priced. I haven't decided yet whether any of it ought to leave my keeping." },
    { id = "g_back", when = { metBefore = true }, text = "You're back at my table. The charms haven't changed, and neither has my mind about them." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp's eyes went straight to the third charm from the left. It did the same last time one of you came by, which is why that one will never be for sale." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Silas Zimmer. I gather relics, the small sort that people kept in drawers and wore under their shirts, and I bring them here because the warlocks' temple is the one place in the city where nobody asks what a thing is for." },
      },
      again = {
        { id = "h_again", text = "Was there more? Don't lean on the table." },
        { id = "h_again2", text = "Ask, then. I'm in no haste." },
      },
      choices = {
        { text = "What sort of relics?", next = "relics" },
        { text = "Hannah Akeley sells; why don't you?", next = "hannah" },
        { text = "Is any of this safe to touch?", next = "safe" },
        { text = "I'll leave you to them.", next = "END" },
      },
    },
    relics = {
      lines = { { id = "r_default", text = "Saints' medals, plague charms, a lock of hair in a silver case, and a farmer's token against the murrain that plainly did not work. Lordaeron was full of little protections, and I find it instructive to hold them now and consider what they were up against." } },
      choices = {
        { text = "Do any of them still work?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "w_priest", when = { class = "PRIEST" }, text = "One of the medals grows warm when a priest stands near it, and it is warm now. I mention it as a courtesy, and I'd ask you not to pray at it, because I don't know what it would do." },
        { id = "w_default", text = "One of the medals grows warm near a priest, and the lock of hair is colder than it ought to be. As for the rest, I think they did what such things always did, which was to give frightened people something to hold." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hannah = {
      lines = { { id = "h2_default", text = "Hannah sells what is used up, powders and candles, and the Temple could not run a day without her. I keep what cannot be made again, and she has nailed a horseshoe up to guard her table from mine, which I choose to find flattering." } },
      choices = {
        { text = "She's superstitious about you?", next = "superstition" },
        { text = "Something else.", next = "BACK" },
      },
    },
    superstition = {
      lines = { { id = "s_default", text = "She is superstitious about everything, and cheerfully so. She told me my table is unlucky, and then she asked whether I had a charm for sore joints, so I don't think her heart is in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safe enough for the dead, since most of it was made to keep death off and has nothing further to say to us. I would advise the living to keep their hands in their sleeves, and not out of superstition." } },
      choices = { { text = "I'll keep my hands to myself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a sexton in a parish of Lordaeron and buried people with these things round their necks. It seemed right that somebody should gather them up again." } },
    _none = { { id = "tp_none", text = "I've no relic that answers that, nor any knowledge either. Ask the warlocks, if you can pay what they charge for an answer." } },
  },
}

-- Susan Tillinghast: wanders the Rogues' Quarter; a woods-wise scavenger.
P:NPC {
  key = "uc_susan_tillinghast", id = TODO_NPC("Susan Tillinghast"), name = "Susan Tillinghast", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "wary", "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Susan Tillinghast walks the Rogues' Quarter with a satchel and a trapper's eye for corners. She lived rough in Tirisfal after she rose, before there was an Undercity to come home to, and it shows in how little she carries and how much she notices.",
    third = "{name} met Susan Tillinghast, a wanderer of the Undercity's Rogues' Quarter who knows how to live rough.",
  },
  greetings = {
    { id = "g_default", text = "You walk loudly for someone in this quarter. Nobody will rob you for it, but they'll all know where you are." },
    { id = "g_back", when = { metBefore = true }, text = "I heard you on the bridge before I saw you. You're a little quieter than last time, I'll grant." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with a beast at heel and mud to the knee. You're the first soul this week who looks as though they've slept somewhere without a roof." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Susan Tillinghast. I walk the quarter because I can't abide standing in one place, which is a habit from the months I spent in the Tirisfal woods with the Scourge on one side and the Scarlets on the other." },
      },
      again = {
        { id = "h_again", text = "What else? Walk with me, I don't stop for long." },
        { id = "h_again2", text = "Go on, and keep your voice down." },
      },
      choices = {
        { text = "How did you survive out there?", next = "survive" },
        { text = "Why keep to the Rogues' Quarter?", next = "quarter" },
        { text = "Tirisfal's game is poor hunting.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Walk safely, Susan.", next = "END" },
      },
    },
    survive = {
      lines = { { id = "s_default", text = "The dead need no food or fire, which is two-thirds of living rough dealt with before you start. The rest was learning to lie still in a ditch while a Scarlet patrol rode past, and learning which of the things shambling about could still be reasoned with." } },
      choices = {
        { text = "How did you tell which could?", next = "tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "I said my own name aloud, and watched whether they flinched at the sound of a voice. The ones the Dark Lady had freed looked round, and the Lich King's only kept walking, and I was wrong just the once, which cost me most of this hand." } },
      choices = { { text = "A hard way to learn it. Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "Because the people here watch their own backs, and I understand that better than I understand the Trade Quarter's chatter. The Deathstalkers leave me alone, and now and then one of them asks me how to cross open ground at night." } },
      choices = {
        { text = "And what do you tell them?", next = "night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = { { id = "n_default", text = "That you go slowly, along the low ground, and stop whenever the bats stop. I also tell them a name is a poor thing to share with a plaguebringer, since I've a kinsman in that line of work who has made ours known in places I'd rather it weren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It is, since the plague. The deer are thin, the bats taste of nothing, and half the hounds you'll see have been dead longer than I have. Go south to Silverpine if you want meat that fights back, and mind the worgen while you're about it." } },
      choices = { { text = "I'll try Silverpine. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I set snares for a living near Agamand Mills, before the plague. I rose alone and stayed out in the woods until the Dark Lady's people found me." } },
    _none = { { id = "tp_none", text = "I don't know it, and I don't guess. Guessing is how people get found." } },
  },
}

-- Theodore Griffs: studies a bookshelf in the inner room of the Apothecarium.
P:NPC {
  key = "uc_theodore_griffs", id = TODO_NPC("Theodore Griffs"), name = "Theodore Griffs", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "absent", "mild" }, values = { "learned", "curious" },
  notices = { "profession" },
  impression = {
    first = "Theodore Griffs stands facing a bookshelf in the inner room of the Apothecarium and answers questions without turning round. He is mild and absent in a wing full of people who are neither, and he seems not to have noticed.",
    third = "{name} met Theodore Griffs, who reads at a bookshelf in the Undercity's Apothecarium.",
  },
  greetings = {
    { id = "g_default", text = "Hm? Oh, do come in, only don't move the green volume, because I've left it open at a page I shall want again." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you, I know the footsteps. I'm on the same shelf, I'm afraid, though two books further along." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "You smell of fadeleaf and something burnt, so you're an alchemist. Then perhaps you can tell me why every author on this shelf spells 'distillate' differently." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Theodore Griffs. I look things up for the apothecaries, since they are far too busy making discoveries to check whether somebody made the same one two hundred years ago. Very often somebody did." },
      },
      again = {
        { id = "h_again", text = "Yes? I'm listening, though I may not look as if I am." },
        { id = "h_again2", text = "Do go on. I can read and hear at once, more or less." },
      },
      choices = {
        { text = "What's on that shelf?", next = "shelf" },
        { text = "Do the apothecaries thank you for it?", next = "thanks" },
        { text = "You never turn round, do you?", next = "turn" },
        { text = "I'll leave you to your shelf.", next = "END" },
      },
    },
    shelf = {
      lines = { { id = "s_default", text = "The herbals and pharmacopoeias of old Lordaeron, with some Dalaran treatises that were copied badly. The physicians who wrote them were trying to keep people alive, of course, and the Society reads them the other way up, so to speak." } },
      choices = {
        { text = "Does that sit well with you?", next = "sit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sit = {
      lines = {
        { id = "si_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "I try not to let it sit anywhere. I find the reference, I mark the page, and what Master Faranell does with it is his affair and the Dark Lady's. You look as though you'd like a different answer, and I haven't one to give." },
        { id = "si_default", text = "I try not to let it sit anywhere. I find the reference, I mark the page, and what Master Faranell does with it is his affair and the Dark Lady's. A librarian who asked what the books were for would never finish shelving." },
      },
      choices = { { text = "A careful answer. Something else.", next = "BACK" } },
    },
    thanks = {
      lines = { { id = "t_default", text = "Seldom, because nobody likes to hear that his new compound is on page forty of a dead man's notebook. The chemists Cuely and Fuely are the politest about it, and they still go on and repeat the experiment, to see it for themselves." } },
      choices = {
        { text = "And are the old books ever wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Constantly, and with great confidence. One of them recommends a poultice of swiftthistle for the plague, and I keep it on the shelf at eye level, to remind me how sure a man can be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    turn = {
      lines = { { id = "tu_default", text = "I lose my place if I do, and then I must begin the shelf again from the left. I'm told there are some remarkable things in the room behind me, in cages, and I've found that I read more comfortably without having seen them." } },
      choices = { { text = "You may be the wisest man here. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I catalogued a nobleman's library near the capital. He is gone and the library with him, but the habit of looking things up has proved hard to kill." } },
    _none = { { id = "tp_none", text = "It isn't on this shelf, and I've not reached the next. Ask me again in a month or so." } },
  },
}

-- Travist Bosk: a recruit drilling under Sergeant Houser with Alyssa Blaye and Eldin Partridge.
P:NPC {
  key = "uc_travist_bosk", id = TODO_NPC("Travist Bosk"), name = "Travist Bosk", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "earnest", "nervous" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Travist Bosk swings at a straw dummy in the War Quarter under Sergeant Houser's eye, a beat behind every order. He is the newest of the three recruits and the most anxious to be shouted at less.",
    third = "{name} met Travist Bosk, a recruit training under Sergeant Houser in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "I can't stop to talk, the Sergeant's watching, so I'll have to keep swinging while you ask whatever it is." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again. I've hit it nine times running since you were last here, though the Sergeant says only six of them counted." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You're a real warrior, aren't you? Would you mind standing just there, so the Sergeant looks at you for a while and not at my elbows?" },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Travist Bosk, recruit, though the Sergeant mostly calls me 'Bosk, you're late.' I'm training for the Deathguard with Alyssa Blaye and Eldin Partridge, and I'm the worst of us three, but I'm less the worst than I was." },
      },
      again = {
        { id = "h_again", text = "What else? I have to keep my feet moving while you ask." },
        { id = "h_again2", text = "Go on, quickly, he's looking the other way." },
      },
      choices = {
        { text = "Why did you join the Deathguard?", next = "join" },
        { text = "Is Sergeant Houser as hard as he sounds?", next = "houser" },
        { text = "You drop your guard after each swing.", next = "guard", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Keep at it, Bosk.", next = "END" },
      },
    },
    join = {
      lines = { { id = "j_default", text = "I woke up in a crypt near Deathknell with no notion of what I was for, and a Deathguard walked me to the road and told me where the city was. I thought I should like to be the one who does that for somebody, so here I am, hitting straw." } },
      choices = {
        { text = "What were you before?", next = "before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "A baker's lad, I think, because my hands knew how to knead before they knew how to hold a sword. I don't remember much else, and Eldin says that's a mercy and I ought to stop poking at it." } },
      choices = { { text = "Eldin may be right. Something else.", next = "BACK" } },
    },
    houser = {
      lines = { { id = "h2_default", text = "He's harder, and he never runs out of breath for it. But Alyssa says he's only that loud with the ones he means to pass, and he once stayed two hours after the drill to fix my grip, shouting the whole time." } },
      choices = {
        { text = "What comes after the dummies?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "The pit, where Brother Malach raises things for Edward and Tyler to fight, and one day for us. I watch them from the rail when we're dismissed, and I've decided I should like to meet the ghoul first and the abomination a good deal later." } },
      choices = { { text = "A sound plan. Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g2_default", text = "Do I? The Sergeant says so too, only he says it with more words in it. If I bring the shield back before I look where the blow landed, would that mend it, do you think?" } },
      choices = {
        { text = "Yes. Shield first, then look.", next = "BACK", reply = "Shield first, then look. Thank you, I'll say it under my breath until it sticks.", fx = { affinity = 1 } },
        { text = "Ask your sergeant, not me.", next = "BACK", reply = "That's fair, and I will, when he stops for breath." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I rose near Deathknell not long ago, and I think I was a baker's lad before that. I'm to be a Deathguard, if the Sergeant ever passes me." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm only a recruit. The Sergeant knows everything, but please don't tell him I sent you." } },
  },
}

-- Tyler: fights in the War Quarter pit beside Edward, against what Brother Malach summons.
P:NPC {
  key = "uc_tyler", id = TODO_NPC("Tyler"), name = "Tyler", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "reckless" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Tyler fights in the War Quarter's pit beside Edward, against whatever Brother Malach calls up, and grins while he does it. He talks between opponents in short bursts and never takes his weight off the balls of his feet.",
    third = "{name} met Tyler, who fights in the pit of the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Talk fast, friend, because Malach doesn't wait, and the next one's usually bigger than the last." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to watch! Stay for the abomination; I've been working on something for it." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Now that's a fighter's stance. If Edward ever takes a day off, which he won't, I'd have you beside me down here." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Tyler, and that's Edward, and between us we knock down whatever Brother Malach raises. It's meant to be training, though I'll admit it's the most alive I've felt since I stopped being it." },
      },
      again = {
        { id = "h_again", text = "What else? One eye on the gate while you ask, mind." },
        { id = "h_again2", text = "Go on, I've got until the next one stands up." },
      },
      choices = {
        { text = "What does Malach send against you?", next = "sends" },
        { text = "How do you and Edward fight together?", next = "edward" },
        { text = "Do you hear the crowd down here?", next = "crowd" },
        { text = "How would you take an abomination?", next = "abom", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Fight well, Tyler.", next = "END" },
      },
    },
    sends = {
      lines = { { id = "s_default", text = "Three human captives to start, and they come at you with everything, having nothing to lose. Then a ghoul and a zombie, so we don't forget what we're really training for, and an abomination to finish, which is the only one that ever worries Edward." } },
      choices = {
        { text = "The captives don't trouble you?", next = "captives" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captives = {
      lines = {
        { id = "c_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "They were Scarlets and Hillsbrad militia, and every one of them was taken with a torch or a pitchfork in his hand. They get a blade and a chance down here, friend, which is more than their kind ever gave one of us." },
        { id = "c_default", text = "They were Scarlets and Hillsbrad militia, and every one of them was taken with a torch or a pitchfork in his hand. They get a blade and a chance, which is more than they gave, and I sleep no worse for it, or I would if I slept." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    edward = {
      lines = { { id = "e_default", text = "He holds and I move, and it works because he never once looks to see whether I'm where I should be. He says I'm reckless and I say he's furniture, and neither of us would go through that gate with anyone else." } },
      choices = {
        { text = "Has he ever had to save you?", next = "saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saved = {
      lines = { { id = "sa_default", text = "More times than I've saved him, and he keeps the count, the wretch. I got him out from under the abomination once, though, when it had him by the leg, and I mean to dine out on that for a decade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "cr_default", text = "Every word, and none of it's any use. There's a woman up there who tells me I drop my shoulder, and a fellow called Gossom who cheers when I fall over, and I've grown fond of the pair of them without ever learning what they look like." } },
      choices = { { text = "She's right about the shoulder. Something else.", next = "BACK" } },
    },
    abom = {
      lines = { { id = "a_default", text = "From behind, always, while somebody solid keeps its hook busy in front. It's three corpses stitched into one, and the stitches are the weak part, so you cut where the colours don't match and keep out from under it when it comes apart." } },
      choices = { { text = "I'll remember the stitches. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a brawler in Lordaeron, the sort who got thrown out of taverns. Now I'm paid for it, in a manner of speaking, and nobody throws me anywhere but the abomination." } },
    _none = { { id = "tp_none", text = "No idea, friend, and no time to think about it. Ask me when the gate's shut." } },
  },
}

-- Victor Bartholomew: a pupil at Jezelle Pruitt's demon lessons in the Magic Quarter.
P:NPC {
  key = "uc_victor_bartholomew", id = TODO_NPC("Victor Bartholomew"), name = "Victor Bartholomew", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "nervous", "dry" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Victor Bartholomew attends Jezelle Pruitt's demon lessons in the Magic Quarter with Adrian Bartlett and Winifred Kerwin, and stands a careful half step behind them both. He takes notes on every demon and has not yet summoned so much as a spark himself.",
    third = "{name} met Victor Bartholomew, a cautious pupil at Jezelle Pruitt's demon lessons.",
  },
  greetings = {
    { id = "g_default", text = "Not so loud, please. Mistress Pruitt has something half summoned, and I'm told they come through in a worse temper if they're startled." },
    { id = "g_back", when = { metBefore = true }, text = "You again. We've had the imp twice since you left, and it remembered my name, which I didn't care for." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You have one of your own, bound and everything. Might I ask whether it hurt, the first time, or is that the sort of question one doesn't ask?" },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Victor Bartholomew, student. Mistress Pruitt calls the demons up one at a time and tells us what each is good for, and I write it all down, because I've no power of my own yet and a notebook is what I have in its place." },
      },
      again = {
        { id = "h_again", text = "Yes? Quietly, if you would, she's started the next circle." },
        { id = "h_again2", text = "Ask, but I may have to stop and write." },
      },
      choices = {
        { text = "No power of your own?", next = "power" },
        { text = "Which demon unsettles you most?", next = "demon" },
        { text = "What are your classmates like?", next = "class" },
        { text = "It didn't hurt. It argued terms, like a lawyer with teeth.", next = "argued", when = { class = "WARLOCK" } },
        { text = "Mind your notes, Victor.", next = "END" },
      },
    },
    power = {
      lines = { { id = "p_default", text = "Not a drop, as yet. Adrian can already feel the circle when she draws it, and Winifred was born to it, being a Kerwin, and I stand here like an empty inkwell hoping somebody will pour something in." } },
      choices = {
        { text = "Then why study demons at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I was a notary, and I have never been frightened of a contract. Mistress Pruitt says every binding is an agreement with terms, and that most warlocks who come to grief did so because they failed to read what they'd signed." } },
      choices = { { text = "Then you may outlast them all. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    demon = {
      lines = { { id = "d_default", text = "The succubus, and not for the reason Adrian supposes. The voidwalker does as it's told and the felhunter is only a hound with worse habits, but she looks at each of us in turn and you can see her working out the price." } },
      choices = {
        { text = "And the imp?", next = "imp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    imp = {
      lines = { { id = "i_default", text = "The imp talks, incessantly, and Mistress Pruitt says that is the lesson: the small ones wear you down with chatter until you agree to something. I've a page of things it has said about my handwriting, and I intend to hold it to none of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    class = {
      lines = { { id = "c_default", text = "Adrian wants a demon of his own so badly that it's uncomfortable to stand next to, and Winifred answers Mistress Pruitt's questions before they're finished. I'm the one who asks what happens if it goes wrong, and somebody has to, in my opinion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    argued = {
      lines = { { id = "a_default", text = "It argued! Then Mistress Pruitt has it right, and it is all terms and conditions in the end. You've no idea how much better that makes me feel; I can out-argue anything, given ink." } },
      choices = { { text = "Read every line twice. They hide the hooks in the margins.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a notary in Lordaeron and drew up other people's wills. I find the warlock's trade is the same work, with clients who bite." } },
    _none = { { id = "tp_none", text = "It isn't in my notes, and I shouldn't like to guess. Mistress Pruitt would know, once the lesson's over." } },
  },
}

-- Winifred Kerwin: a pupil at Jezelle Pruitt's demon lessons; kin to Richard Kerwin, the warlock trainer.
P:NPC {
  key = "uc_winifred_kerwin", id = TODO_NPC("Winifred Kerwin"), name = "Winifred Kerwin", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "proud", "sharp" }, values = { "learned", "ambitious" },
  notices = { "class" },
  impression = {
    first = "Winifred Kerwin stands at the front of Jezelle Pruitt's demon lessons and answers each question a breath before it's finished. She is a Kerwin, like the warlock trainer Richard, and is determined that nobody shall think it's the name that got her there.",
    third = "{name} met Winifred Kerwin, the quickest pupil at Jezelle Pruitt's demon lessons.",
  },
  greetings = {
    { id = "g_default", text = "If you have a question, ask me and not Mistress Pruitt, since she's mid-summoning and I very probably know the answer." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I have learned the felhunter's binding since you left, in theory, and I'd be glad to recite it." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A practising warlock. Then you studied under Richard Kerwin or one of the others, and you may tell me honestly whether he's as dull in a lesson as he is at home." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Winifred Kerwin. I attend Mistress Pruitt's lessons with Adrian Bartlett and Victor Bartholomew, and I intend to be the first of us permitted to summon, which shouldn't be difficult, given the competition." },
      },
      again = {
        { id = "h_again", text = "Another question? Good, I like them." },
        { id = "h_again2", text = "Go on, and be precise, please." },
      },
      choices = {
        { text = "What does Mistress Pruitt teach?", next = "teach" },
        { text = "You're kin to Richard Kerwin?", next = "richard" },
        { text = "You're hard on your classmates.", next = "mates" },
        { text = "Which demon would you bind first, if you dared?", next = "first", when = { class = "WARLOCK" } },
        { text = "Back to your lesson, then.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "She summons each of the common demons in turn, the imp, the voidwalker, the succubus and the felhunter, and has us learn its nature before we are trusted with its name. It is slow, and I've come to see that slow is the point, though I didn't enjoy coming to see it." } },
      choices = {
        { text = "What changed your mind?", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "A student before us drew her own circle after three lessons, to save time. Mistress Pruitt keeps what was left of her robe pinned to the wall, and she has never once referred to it, which is more persuasive than any lecture." } },
      choices = { { text = "A convincing argument. Something else.", next = "BACK" } },
    },
    richard = {
      lines = { { id = "r_default", text = "I am, and I chose Mistress Pruitt's lessons over his so that nobody could say I was passed on the strength of a surname. He teaches a curse as though it were penmanship, and I've had quite enough of that across the supper table." } },
      choices = {
        { text = "Does he approve of your studying elsewhere?", next = "approve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    approve = {
      lines = { { id = "a_default", text = "He said it was 'a sound decision, properly reasoned,' which from Richard is a declaration of love. I shall go to him for the advanced work when I've earned it, and not one day before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mates = {
      lines = { { id = "m_default", text = "I'm accurate about them, which isn't the same. Adrian wants a demon far too much and Victor wants one far too little, and of the two I'd sooner stand next to Victor, because at least he reads the wards before he steps over them." } },
      choices = { { text = "So you do like one of them. Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "The voidwalker, because it obeys and it stands between you and whatever you've angered. Everyone begins with the imp, I know, but I see no merit in starting one's career with a servant who answers back." } },
      choices = { { text = "The imp teaches patience, and spite. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Kerwins had a talent for the forbidden arts before the plague made them respectable. I mean to be better at them than any Kerwin yet, Richard included." } },
    _none = { { id = "tp_none", text = "I don't know, which annoys me. I shall look it up and know by tomorrow." } },
  },
}
