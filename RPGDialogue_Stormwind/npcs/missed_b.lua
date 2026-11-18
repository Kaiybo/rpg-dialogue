-- Stormwind folk the roster scan found missing (part 1): the recruiter in the Trade District, the
-- Chaddis family on their walk, the Champions' Hall quartermasters, two of the Sanctum's talkers
-- and the night elves of the Park. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Justine Demalier: recruiting for the army in the Trade District square, beside Melris Malagan.
P:NPC {
  key = "justine_demalier", id = TODO_NPC("Justine Demalier"), name = "Justine Demalier", title = "Stormwind Recruiter", gender = "female",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "cheerful" }, values = { "dutiful", "loyal" },
  notices = { "soldier" },
  impression = {
    first = "Justine Demalier stands in the Trade District square with a great sword on her back and looks every passer-by over as if measuring them for a tabard. She told me the army needed me before she had asked my name.",
    third = "{name} met Justine Demalier, who recruits for Stormwind's army in the Trade District.",
  },
  greetings = {
    { id = "g_default", text = "Oy, you there! You've two good arms and nothing in them, and Stormwind's army can mend that for you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? I knew you'd the look of someone who can't walk past a fight." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's how a soldier stands. Half the lads I sign can't tell the pommel from the point, so you're a welcome sight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Justine Demalier, recruiter for the armies of Stormwind. Captain Malagan watches the square and I watch the people in it, and between us we find the ones worth sending up to the Keep." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've a whole square to look over." },
        { id = "h_again2", text = "Go on, mate, but talk while I watch the crowd." },
      },
      choices = {
        { text = "Why does the army need recruiting in the square?", next = "need" },
        { text = "What do you look for in a recruit?", next = "look" },
        { text = "You carry a large sword for a recruiter.", next = "sword" },
        { text = "Good luck with the crowd.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Because the regiments are in Redridge and the Burning Steppes and half a dozen other places, and they aren't coming home soon. That leaves Westfall to its farmers and the city to the Watch, so Highlord Bolvar takes every able hand I can send him." } },
      choices = {
        { text = "And when the hands run out?", next = "runout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runout = {
      lines = { { id = "r_default", text = "Then I'll stand here until I'm grey and sign up their children, I suppose. Folk still come, mind you, from Elwynn and from the refugee roads, and most of them come because they've already lost something." } },
      choices = { { text = "That's a hard reason to enlist. Something else.", next = "BACK" } },
    },
    look = {
      lines = {
        { id = "l_default", text = "Somebody who looks at the notice board and then looks at the gate, instead of at the tavern. I can teach a farmhand to hold a shield in a month, but I can't teach him to want to." },
        { id = "l_low", when = { maxLevel = 10 }, text = "Somebody much like you, a season from now. Go and get some Elwynn mud on those boots first, and then come back and let me look at you again." },
      },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },
    sword = {
      lines = { { id = "s_default", text = "A recruiter who's never stood in a line is only a clerk with a loud voice, and nobody follows one of those. I did my marching before I was given this corner, and the sword came back with me." } },
      choices = {
        { text = "It suits you better than a quill would.", next = "BACK", reply = "Ha! Tell that to the clerks at the Keep, who want everything in three copies.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I soldiered first and recruited after, and I'd go back to the line tomorrow if they'd let me." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, mate. Ask Captain Malagan; he hears more than I do." } },
  },
}

-- Karlee Chaddis: walks the city with her children Gil and Paige, bound for Ancient Curios.
P:NPC {
  key = "karlee_chaddis", id = TODO_NPC("Karlee Chaddis"), name = "Karlee Chaddis", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "patient", "warm" }, values = { "family" },
  notices = { "kin" },
  impression = {
    first = "Karlee Chaddis crosses Stormwind with a shopping list in one hand and a child on either side, and answers the same question from her son every twenty paces. She never once raised her voice.",
    third = "{name} met Karlee Chaddis, a Stormwind mother on a long walk to the Mage Quarter with her two children.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Forgive us if we don't stop long, because if I stand still Gil will start asking how far it is again." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! We're still walking, as you can see, and it's still not far." },
  },
  notice = {
    { id = "n_mage", cat = "kin", when = { class = "MAGE" },
      text = "A mage! Please don't do anything clever in front of Gil, or I shall hear about nothing else until supper." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Karlee Chaddis, and these two are Gil and Paige. We're on our way to Ancient Curios in the Mage Quarter, and we're taking the long way so the pair of them are tired by bedtime." },
      },
      again = {
        { id = "h_again", text = "Was there something else? Paige, stay where I can see you." },
        { id = "h_again2", text = "Yes? Quickly, before Gil asks again." },
      },
      choices = {
        { text = "What do you need from Ancient Curios?", next = "list" },
        { text = "Your son seems eager to arrive.", next = "gil" },
        { text = "It's a long walk for small legs.", next = "walk" },
        { text = "Enjoy your walk.", next = "END" },
      },
    },
    list = {
      lines = { { id = "li_default", text = "A few things off my list, which Charys Yserian puts up for me whenever I call. The last one on it is the hard one to find, and she always has it, so I don't shop anywhere else." } },
      choices = {
        { text = "What's the last thing on the list?", next = "last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = { { id = "la_default", text = "Nothing that would interest anybody but me, and I'd sooner not say it in the street with small ears about. Charys knows what it is and what it's for, and that's enough people knowing." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    gil = {
      lines = { { id = "g_default", text = "He's asked whether we're there yet since the Trade District, and he'll ask again at the canal. Once we arrive he forgets all of it, because Charys keeps a rabbit called Fizzles and Gil has a whole story about him." } },
      choices = { { text = "I'd like to hear that story. Something else.", next = "BACK", reply = "Then ask Paige, because she tells it better than he does." } },
    },
    walk = {
      lines = { { id = "w_default", text = "It is, but they see the whole city this way, the Cathedral and the canals and the guards on the bridges. I'd rather they knew their own streets than only the one we live on." } },
      choices = { { text = "That's a good reason. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've lived in Stormwind all my life, and I mean my children to know every street of it." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. We really must keep walking, I'm afraid." } },
  },
}

-- Paige Chaddis: Karlee's daughter; wants to pet Fizzles the rabbit.
P:NPC {
  key = "paige_chaddis", id = TODO_NPC("Paige Chaddis"), name = "Paige Chaddis", gender = "female",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "bright" }, values = { "family" },
  notices = { "pet" },
  impression = {
    first = "Paige Chaddis holds her mother's hand all the way across Stormwind and talks about a rabbit called Fizzles the whole time. She believes every word of her brother's story about him.",
    third = "{name} met Paige Chaddis, a little girl walking Stormwind with her mother and brother.",
  },
  greetings = {
    { id = "g_default", text = "Hello! We're going to see Fizzles, and Mommy says I can pet him if I'm gentle." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! We haven't got to Fizzles yet, because Gil walks too slow." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Is {pet} yours? Does {pet} bite, or can I say hello?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Paige, and that's my mommy, and that's Gil, who is my brother and keeps asking if we're there yet. We're going to the shop with all the old things in it, where Fizzles lives." },
      },
      again = {
        { id = "h_again", text = "Do you want to know something else about Fizzles?" },
        { id = "h_again2", text = "What else? Mommy says we have to keep walking." },
      },
      choices = {
        { text = "Who is Fizzles?", next = "fizzles" },
        { text = "You must like the walk through the city.", next = "walk" },
        { text = "Be gentle with the rabbit, Paige.", next = "END" },
      },
    },
    fizzles = {
      lines = { { id = "f_default", text = "He's a rabbit, and he lives with Charys in the shop, and he's very soft. Gil says he used to be a great wizard, but one of his spells went wrong and now he's a rabbit forever." } },
      choices = {
        { text = "Do you think that's true?", next = "true_story" },
        { text = "Poor Fizzles.", next = "BACK", reply = "I know! That's why I pet him, so he isn't sad about it." },
        { text = "I'm a mage, and I'm still not a rabbit.", next = "BACK", when = { class = "MAGE" }, reply = "Not yet. You should be very careful with your spells, like Fizzles wasn't." },
      },
    },
    true_story = {
      lines = { { id = "t_default", text = "Gil says it is, and he's bigger than me, so he knows. Once Fizzles looked right at me and wiggled his nose, and I think he was trying to say a magic word." } },
      choices = { { text = "Maybe he was. Something else.", next = "BACK" } },
    },
    walk = {
      lines = { { id = "w_default", text = "I like the bridges, because you can see the fish, and I like the big statues by the gate. I don't like the part with the stairs, because my legs get tired and Mommy won't carry me any more." } },
      choices = { { text = "You're nearly there. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Paige, and I live with Mommy and Gil, and I'm going to have a rabbit of my own one day." } },
    _none = { { id = "tp_none", text = "I don't know about that. You should ask my mommy." } },
  },
}

-- Lieutenant Jackspring: gnome weapons quartermaster in the Champions' Hall, Old Town.
P:NPC {
  key = "lieutenant_jackspring", id = TODO_NPC("Lieutenant Jackspring"), name = "Lieutenant Jackspring", title = "Weapons Quartermaster", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "precise", "eager" }, values = { "dutiful", "curious" },
  notices = { "rank", "gnome" },
  impression = {
    first = "Lieutenant Jackspring keeps the Champions' Hall's weapons, most of which are taller than he is, and can recite the weight and balance of every one. He looked at my rank before he looked at my face.",
    third = "{name} met Lieutenant Jackspring, the gnome who keeps the officers' weapons in Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Weapons desk, Lieutenant Jackspring speaking! Everything on these racks is issued by rank, so let's see what yours entitles you to before either of us gets excited." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and I've re-oiled every blade on the third rack since you left, which took exactly forty minutes." },
    { id = "g_none", when = { pvpRank = false }, text = "No rank at all, I see. You're welcome to look, but please look from there, because the polish on these is regulation." },
  },
  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another gnome in the Hall! Excellent, because nobody else here appreciates how well a properly counterweighted sword compensates for reach." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lieutenant Jackspring, weapons quartermaster. I hold the arms the Alliance awards to its highest officers, and I keep a ledger of who has earned which, cross-referenced by regiment and by battleground." },
      },
      again = {
        { id = "h_again", text = "Was there another question? I've an inventory to finish, although I finished it once already this morning." },
        { id = "h_again2", text = "Yes, go on, I can count and listen at once." },
      },
      choices = {
        { text = "Who are these weapons for?", next = "who" },
        { text = "How does a gnome handle blades that size?", next = "size" },
        { text = "What do you make of the Hall?", next = "hall" },
        { text = "As you were, Lieutenant.", next = "END" },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "For the Marshals, the Field Marshals and the Grand Marshal, and for nobody below them, however nicely they ask. An officer who has fought that long in Warsong Gulch or Alterac Valley has earned steel that won't fail, and that's what I issue." },
        { id = "w_high", when = { pvpRank = { min = 12, max = 14 } }, text = "For officers of your standing, sir, which is a sentence I say perhaps four times a year. Tell me what you carry now and I'll tell you precisely how much better mine is." },
      },
      choices = {
        { text = "Has anyone tried to talk you round?", next = "talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "Seventeen people this year, including one knight who offered me a pony. I wrote all seventeen names down in the ledger, in a separate column, and I showed the column to Sergeant Major Clate, who laughed for a very long time." } },
      choices = { { text = "I'll stay out of that column. Something else.", next = "BACK" } },
    },
    size = {
      lines = { { id = "s_default", text = "With a stepladder, a set of padded tongs of my own design and a great deal of care, since you ask. I don't need to swing them, only to know them, and I know the balance point of every weapon in this room to a quarter inch." } },
      choices = { { text = "That's more than most swordsmen know. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hall = {
      lines = { { id = "ha_default", text = "It's the tidiest posting I've ever had, and after Gnomeregan I value a room where nothing leaks, glows or explodes. Biggins has the accessories at the next desk and Clate has the armour, and between the three of us an officer leaves here properly equipped." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came out of Gnomeregan with the exiles, and I took the Alliance's commission because somebody ought to keep the count right." } },
    _none = { { id = "tp_none", text = "That isn't in my ledger, I'm afraid, and if it isn't in the ledger I can't vouch for it." } },
  },
}

-- Master Sergeant Biggins: gnome accessories quartermaster in the Champions' Hall.
P:NPC {
  key = "master_sergeant_biggins", id = TODO_NPC("Master Sergeant Biggins"), name = "Master Sergeant Biggins", title = "Accessories Quartermaster", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful", "fussy" }, values = { "dutiful", "proud" },
  notices = { "rank" },
  impression = {
    first = "Master Sergeant Biggins issues the insignia, cloaks and tabards of the Champions' Hall and straightens every one of them before it leaves his desk. He straightened my collar too, without asking.",
    third = "{name} met Master Sergeant Biggins, who keeps the insignia and tabards of Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Accessories, Master Sergeant Biggins! Insignia, cloaks and tabards, all issued by rank, and all of them to be worn straight, if you please." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again! Stand still a moment and let me see whether that clasp is fastened the way I showed you." },
    { id = "g_none", when = { pvpRank = false }, text = "Hello, hello! There's no rank on you yet, so there's nothing I may issue, but that's a matter of time and a few battles." },
  },
  notice = {
    { id = "n_rank", cat = "rank", when = { pvpRank = { min = 1, max = 14 } },
      text = "You've a rank, and I can always tell, because ranked soldiers stand as if somebody might inspect them. Somebody might, and it's usually me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Master Sergeant Biggins, accessories quartermaster. The others hand out the swords and the plate, and I hand out the small things that tell the rest of the army who you are, which I'd argue matters just as much." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've forty-two tabards to fold, and they don't fold themselves, more's the pity." },
        { id = "h_again2", text = "Yes, yes, ask away." },
      },
      choices = {
        { text = "What do the small things tell the army?", next = "small" },
        { text = "Which is the first thing a soldier earns here?", next = "first" },
        { text = "You take this very seriously.", next = "serious" },
        { text = "Carry on, Master Sergeant.", next = "END" },
      },
    },
    small = {
      lines = { { id = "s_default", text = "That you were there, mostly. A soldier sees a Knight's cloak across a field in Arathi and knows that somebody who has done this before is standing on that hill, and he fights a good deal steadier for knowing it." } },
      choices = {
        { text = "And if someone wears what they haven't earned?", next = "unearned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unearned = {
      lines = { { id = "u_default", text = "Then they answer to me, and I'm a great deal less pleasant than I look. It happened once, with a merchant's son and a borrowed tabard, and he spent a week polishing every insignia in this hall with a cloth the size of my hand." } },
      choices = { { text = "A fitting sentence. Something else.", next = "BACK" } },
    },
    first = {
      lines = {
        { id = "f_default", text = "The tabard of a Private, and I've seen hardened dwarves go quiet when I hand it over. After that comes the insignia at Corporal and the cloak at Sergeant, and I remember every one I've issued." },
        { id = "f_private", when = { pvpRank = { min = 1, max = 2 } }, text = "The tabard you've already earned, soldier, and I hope you wear it. The insignia and the Sergeant's cloak come next, and I've one of each put by with your regiment's name against it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    serious = {
      lines = { { id = "se_default", text = "I do, and Jackspring teases me for it, though he counts his swords twice a day. I was a tinker's clerk in Gnomeregan, and I learned there that the small parts are the ones that hold a machine together." } },
      choices = { { text = "An army's a machine like any other. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a tinker's stores in Gnomeregan before the fall, and I keep the Alliance's now, to the same standard." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, I'm sorry to say. Try Sergeant Major Clate; he's been here longer than the paint." } },
  },
}

-- Sergeant Major Clate: dwarf armor quartermaster in the Champions' Hall (Karter already mentions him).
P:NPC {
  key = "sergeant_major_clate", id = TODO_NPC("Sergeant Major Clate"), name = "Sergeant Major Clate", title = "Armor Quartermaster", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gruff", "steady" }, values = { "dutiful", "proud" },
  notices = { "rank", "dwarf" },
  impression = {
    first = "Sergeant Major Clate keeps the officers' armour in the Champions' Hall and measures a soldier with his eyes before a word is said. He will not be argued with about prices, fit or the Horde.",
    third = "{name} met Sergeant Major Clate, the dwarf who keeps the officers' armour in Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Armour's here, {g:lad|lass}, and it's for them that's earned it. Stand up straight an' let me have a look at ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Ye've not grown any broader since last time, so the same fittin' stands." },
    { id = "g_none", when = { pvpRank = false }, text = "Nae rank on ye yet. Go an' earn one in the battlegrounds, an' then we'll talk about plate." },
  },
  notice = {
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf, by my beard! Ye'll be the easiest fittin' I've had all week, after all these long-legged humans." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sergeant Major Clate, armour quartermaster. I keep the plate, the mail an' the rest for the Alliance's ranked soldiers, an' I fit every piece myself, because armour that pinches gets a soldier killed." },
      },
      again = {
        { id = "h_again", text = "What else are ye after? Speak up." },
        { id = "h_again2", text = "Aye, go on, then." },
      },
      choices = {
        { text = "What makes this armour different from a smith's?", next = "different" },
        { text = "Lieutenant Karter says you play cards badly.", next = "cards" },
        { text = "How long have you held this post?", next = "post" },
        { text = "Good day, Sergeant Major.", next = "END" },
      },
    },
    different = {
      lines = { { id = "d_default", text = "It's made for fightin' the Horde an' nothin' else, {g:lad|lass}. A smith makes ye plate tae stop a boar or a bandit, but mine's made tae stand up tae an orc's axe in Warsong Gulch, an' tae be seen from across the field while it does." } },
      choices = {
        { text = "Why does being seen matter?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "Because the green recruits look fer it. When the line's bucklin' an' they see a Knight-Captain's pauldrons still standin' in the middle of it, they hold, an' I've seen that turn a fight in Arathi more than once." } },
      choices = { { text = "Then I hope to wear it. Something else.", next = "BACK" } },
    },
    cards = {
      lines = { { id = "c_default", text = "She would say that, aye, an' she's won enough of my silver tae say it. I'll tell ye what I tell her, which is that a dwarf plays fer the ale an' the company, an' I've never lost at either." } },
      choices = { { text = "A sound way to lose. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    post = {
      lines = {
        { id = "p_default", text = "Since the Hall opened its doors, an' I soldiered a good while before that. I'd rather be in the line, truth be told, but my knees had other ideas, an' somebody has tae see the young ones are armoured right." },
        { id = "p_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "Since the Hall opened, an' I carried a shield like yers fer many a year before it. My knees sent me behind this desk, so mind yers, an' never skimp on the greaves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a soldier of Ironforge lent tae the Alliance, an' I'll fit armour here till they find a dwarf with better eyes." } },
    _none = { { id = "tp_none", text = "I kinna help ye there. Ask one o' the gnomes; they write everythin' down." } },
  },
}

-- Sergeant Major Skyshadow: night elf of the Sentinels posted in the Champions' Hall.
P:NPC {
  key = "sergeant_major_skyshadow", id = TODO_NPC("Sergeant Major Skyshadow"), name = "Sergeant Major Skyshadow", gender = "female",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "reserved", "watchful" }, values = { "dutiful", "kaldorei" },
  notices = { "kaldorei", "rank" },
  impression = {
    first = "Sergeant Major Skyshadow stands in the Champions' Hall as still as the banners and watches the door. She wears a human rank and speaks of Ashenvale as though she had left it that morning.",
    third = "{name} met Sergeant Major Skyshadow, a night elf of Darnassus posted to Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. This hall honours those who have fought the Horde, and you are welcome to stand in it for a time." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. The hall has not changed, though I think perhaps you have." },
  },
  notice = {
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Elune-adore, {g:brother|sister}. It gladdens me to hear a voice from home among so much stone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Skyshadow, of the Sentinels, and Sergeant Major by the Alliance's reckoning. Darnassus sent me so that those who fight for Ashenvale would find one of our own in this hall." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. I have the patience for it." },
        { id = "h_again2", text = "There is more you wish to know?" },
      },
      choices = {
        { text = "What is the fight in Ashenvale?", next = "ashenvale" },
        { text = "A human rank must sit strangely on a Sentinel.", next = "rank" },
        { text = "How do you find Stormwind?", next = "city" },
        { text = "Elune light your watch.", next = "END" },
      },
    },
    ashenvale = {
      lines = { { id = "a_default", text = "The orcs of the Warsong clan cut our forest for their city in the dust, and they have been cutting since before your Alliance knew our name. The Silverwing Sentinels meet them in Warsong Gulch, tree by tree, and I send them what help this hall can give.", fx = { learn = { "warsong_gulch" } } } },
      choices = {
        { text = "Can the forest be held?", next = "held" },
        { text = "Something else.", next = "BACK" },
      },
    },
    held = {
      lines = {
        { id = "he_default", text = "It has been held for ten thousand years against worse than axes. But a tree that took a thousand years to grow falls in an afternoon, and the orcs are never short of afternoons." },
        { id = "he_druid", when = { class = "DRUID" }, text = "You of all people know what is lost when an old grove falls, druid. It can be held, but only if those who hear the forest also stand in front of it." },
      },
      choices = { { text = "Then it needs more defenders. Something else.", next = "BACK" } },
    },
    rank = {
      lines = { { id = "r_default", text = "It did at first, for among the Sentinels a sister is known by her deeds and not by a word on her collar. But the younger races remember better what is written down, and so I wear it for their sake." } },
      choices = { { text = "That's generous of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    city = {
      lines = { { id = "c_default", text = "It is loud, and bright at the wrong hours, and its people do everything in haste. Yet they rebuilt all of this stone within a single short lifetime, and I have learned not to mistake haste for weakness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have served the Sentinels longer than this city has stood, and I serve them here because I was asked to." } },
    warsong_gulch = { { id = "tp_wg", text = "The Silverwing Sentinels hold the gulch against the Warsong Outriders, and they are always glad of another bow." } },
    _none = { { id = "tp_none", text = "That is not a matter I know. Ask one who has lived longer among these walls." } },
  },
}

-- Lisan Pierce: one of three mages who sit at the foot of the Wizard's Sanctum arguing over a spell.
P:NPC {
  key = "lisan_pierce", id = TODO_NPC("Lisan Pierce"), name = "Lisan Pierce", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "stubborn" }, values = { "learning" },
  notices = { "mage" },
  impression = {
    first = "Lisan Pierce sits at the foot of the Wizard's Sanctum with two friends and argues about a spell none of them has finished. She is the one who writes everything down, and she is sure she is right.",
    third = "{name} met Lisan Pierce, a young mage who debates spellcraft with her friends below the Wizard's Sanctum.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello. You haven't come to settle the argument, have you, because Suzanne has already offered that job to three strangers this week." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and no, we haven't agreed on anything yet, although I'm closer to being right than I was." },
  },
  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "You're a mage, so you'll understand me. Tell Janey that a spell should be written down before it's cast, and not the other way about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Lisan Pierce, and those two are Janey Anship and Suzanne. We study at the Sanctum, and we've spent most of a month trying to decide whether what we want to make is a spell or a potion." },
      },
      again = {
        { id = "h_again", text = "What else did you want to ask? I can spare a moment while Janey's talking." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Which do you say it is, spell or potion?", next = "which" },
        { text = "Why sit out here and not in the tower?", next = "outside" },
        { text = "It sounds as if you three enjoy the argument.", next = "enjoy" },
        { text = "I'll leave you to your debate.", next = "END" },
      },
    },
    which = {
      lines = { { id = "w_default", text = "A spell, plainly, because a spell can be tested a piece at a time and a potion has to be drunk whole before you learn anything. Suzanne says a potion keeps on a shelf and a spell doesn't, which is true and beside the point." } },
      choices = {
        { text = "What is it supposed to do?", next = "does" },
        { text = "Something else.", next = "BACK" },
      },
    },
    does = {
      lines = { { id = "d_default", text = "That's the part we do agree on, and so it's the part we've sworn not to tell anybody until it works. I will say that nobody will be turned into anything, which is more than some students of the Sanctum can promise." } },
      choices = { { text = "That's reassuring. Something else.", next = "BACK" } },
    },
    outside = {
      lines = { { id = "o_default", text = "Because the masters upstairs like quiet, and we are not quiet. When it gets too heated we walk it off along the canals and through the Trade District, and by the time we're back somebody has usually had an idea." } },
      choices = { { text = "A sensible habit. Something else.", next = "BACK" } },
    },
    enjoy = {
      lines = { { id = "e_default", text = "I suppose we do, though I'd never say so in front of them. I'd have given up on the whole thing in a week by myself, and with those two I can't, because one of them would finish it without me." } },
      choices = { { text = "That's what friends are for. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I study at the Wizard's Sanctum, and I keep the notes for the three of us because nobody else will." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't like not knowing. Ask one of the masters in the tower." } },
  },
}

-- Suzanne: the third of the Sanctum's talkers; the peacemaker who favours the potion.
P:NPC {
  key = "suzanne_mage", id = TODO_NPC("Suzanne"), name = "Suzanne", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "easygoing", "wry" }, values = { "learning", "friendship" },
  notices = { "craft" },
  impression = {
    first = "Suzanne sits between her two friends at the foot of the Wizard's Sanctum and lets them argue until they tire, and then says the sensible thing. She laughs at all three of them, herself included.",
    third = "{name} met Suzanne, a young mage who keeps the peace in a long argument below the Wizard's Sanctum.",
  },
  greetings = {
    { id = "g_default", text = "Hello there! Sit down if you like, and if you have an opinion about spells and potions, please keep it to yourself until they've finished shouting." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. You've missed nothing, I promise you, because we're exactly where you left us." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've the stains of an alchemist on your fingers. Wonderful, because you're on my side, and I shall tell Lisan so." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Suzanne. Lisan wants our little project to be a spell and Janey changes her mind every other day, and I think it ought to be a potion, so you can see how well we're getting on." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you, while they draw breath?" },
        { id = "h_again2", text = "Ask away, I'm not the one arguing." },
      },
      choices = {
        { text = "Why a potion?", next = "potion" },
        { text = "How long has this gone on?", next = "long" },
        { text = "You seem to be the calm one.", next = "calm" },
        { text = "Good luck with it, Suzanne.", next = "END" },
      },
    },
    potion = {
      lines = { { id = "p_default", text = "Because anybody can drink a potion, and only a mage can cast a spell. If the thing is as useful as we hope, I'd like a farmer in Elwynn to have it too, and not only the people in that tower." } },
      choices = {
        { text = "What does Lisan say to that?", next = "lisan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lisan = {
      lines = { { id = "l_default", text = "She says a potion can't be tested safely, and she's right, which is very annoying of her. So we need her spellwork to prove it first and my brewing to bottle it after, and one day she'll see that's what I've been saying all along." } },
      choices = { { text = "So you're both right. Something else.", next = "BACK", reply = "Don't tell her that, whatever you do. She'd be unbearable." } },
    },
    long = {
      lines = { { id = "lo_default", text = "About a month here on the steps, and a good while before that in the library. We've walked the canals and the Trade District so many times over it that the fruit sellers have started greeting us by name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    calm = {
      lines = { { id = "c_default", text = "Somebody has to be, or we'd have set fire to something by now. I was the middle child of five, and I learned very early that the one who waits until last usually gets listened to." } },
      choices = { { text = "A useful lesson. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I study at the Sanctum with Lisan and Janey, and I like brewing a good deal better than I like chanting." } },
    _none = { { id = "tp_none", text = "I haven't a clue, I'm sorry. Lisan might, since she writes everything down." } },
  },
}

-- Maldryn: night elf druid trainer in the Park.
P:NPC {
  key = "maldryn", id = TODO_NPC("Maldryn"), name = "Maldryn", title = "Druid Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "serene", "gentle" }, values = { "balance", "kaldorei" },
  notices = { "form", "kaldorei" },
  impression = {
    first = "Maldryn teaches druids under the trees of Stormwind's Park and is the only person I met in the city who seemed in no hurry at all. He says a quiet mind can be carried anywhere, even inside stone walls.",
    third = "{name} met Maldryn, a night elf druid who teaches in Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome under these trees. The city presses close around them, yet there is stillness here for anyone who will stop long enough to find it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young druid. If you have come to learn, sit, and we will begin with your breathing before we begin with anything else." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the trees. I am glad of it, for few in this city return to them." },
  },
  notice = {
    { id = "n_form", cat = "form", when = { class = "DRUID", minLevel = 40 },
      text = "You wear your forms easily now, and the bear no longer drags at your shoulders when you walk as yourself. That is well learned." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Maldryn. Sheldras Moontree leads the teaching in this grove, and Theridran and I take the students he sends us, each according to what they most need to learn." },
      },
      again = {
        { id = "h_again", text = "Ask, and take your time in asking." },
        { id = "h_again2", text = "What more would you know?" },
      },
      choices = {
        { text = "What do you teach that the others don't?", next = "teach" },
        { text = "Can a druid find balance inside a city?", next = "balance" },
        { text = "These trees look tired to me.", next = "trees" },
        { text = "I'd learn from you, Maldryn.", next = "pupil", when = { class = "DRUID" } },
        { text = "Peace to you, Maldryn.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Patience, chiefly. Theridran sends the young ones out on the road to answer the call of Moonglade, and when they return full of new shapes and new strength, I teach them to sit still inside all of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    balance = {
      lines = { { id = "b_default", text = "One may find it anywhere, for it was never in the forest to begin with. The forest only makes it easier to hear, as a quiet room makes it easier to hear your own heart." } },
      choices = {
        { text = "Then why keep a grove at all?", next = "grove" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grove = {
      lines = { { id = "g_default", text = "Because students are young, and the young need the quiet room before they can manage without it. I was a great many years older than this city before I could keep my peace in a crowd." } },
      choices = { { text = "That gives me some hope. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trees = {
      lines = { { id = "tr_default", text = "They are, and you have good eyes to see it. Their roots lie in soil laid over cut stone and they drink from a canal, but they grow all the same, and I count that a lesson worth more than most of mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pupil = {
      lines = { { id = "p_default", text = "Then you shall, and gladly. Show me what you already know, without haste, and I will show you where your grip on it is too tight." } },
      choices = { { text = "Thank you, shan'do. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I walked the Dream for long ages, and I teach now because the waking world has need of druids who are awake." } },
    _none = { { id = "tp_none", text = "I do not know this thing. Perhaps Sheldras does, for he listens to the city more than I." } },
  },
}

-- Theridran: night elf druid trainer in the Park; sends young druids to Moonglade (Heeding the Call).
P:NPC {
  key = "theridran", id = TODO_NPC("Theridran"), name = "Theridran", title = "Druid Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "grave", "direct" }, values = { "duty", "kaldorei" },
  notices = { "form", "greenness" },
  impression = {
    first = "Theridran teaches in Stormwind's Park and watches each young druid as if deciding whether they are ready for something. He speaks of Moonglade the way a soldier speaks of a muster.",
    third = "{name} met Theridran, the night elf druid in Stormwind's Park who sends the young to Moonglade.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. I teach the druids who come to this grove, and I have little to offer any other, save a seat under the trees." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Ishnu-alah, young one. Stand where I can see you, and let me judge how far you have come." },
    { id = "g_call", tags = { "news" }, when = { class = "DRUID", questActive = TODO_QUEST("Heeding the Call") }, text = "You are still within these walls. The Moonglade does not come to those who wait for it, young one." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Speak, then, and I will listen." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { class = "DRUID", maxLevel = 9 },
      text = "There is wildness in you already, though it has no shape yet. Come to me again when it begins to press against your skin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Theridran. Those who feel the first stirring of the bear come to me, and I send them where they must go, which is north across the sea to Moonglade." },
        { id = "h_done", when = { questDone = TODO_QUEST("Heeding the Call") }, text = "You have stood in Moonglade and come back, and I see it in how you carry yourself. Ask what you wish, for you have earned plainer answers now." },
      },
      again = {
        { id = "h_again", text = "What else do you wish to ask of me?" },
        { id = "h_again2", text = "Speak on." },
      },
      choices = {
        { text = "What is this call you speak of?", next = "call" },
        { text = "Tell me of Moonglade.", next = "moonglade" },
        { text = "Why teach in a human city?", next = "city" },
        { text = "I feel the bear stirring, Theridran.", next = "stirring", when = { class = "DRUID", minLevel = 10 } },
        { text = "Elune guide you, Theridran.", next = "END" },
      },
    },
    call = {
      lines = { { id = "c_default", text = "Every druid hears it in time, as a restlessness that no amount of walking will settle. It is the Cenarion Circle making itself known, and it means the student is ready to be taught by greater teachers than I." } },
      choices = {
        { text = "And if a druid ignores it?", next = "ignore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ignore = {
      lines = { { id = "i_default", text = "Then the wildness grows with no one to shape it, and that ends badly for the druid and worse for those nearby. I have seen it only twice in all my years, and I do not mean to see it a third time among my own students." } },
      choices = {
        { text = "What became of those two?", next = "two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    two = {
      lines = { { id = "tw_default", text = "One was found and brought to Moonglade late, and learned at great cost what he might have learned gently. Of the other I will say only that the forest keeps her now, and that she no longer answers to her name." } },
      choices = { { text = "I'm sorry to have asked. Something else.", next = "BACK" } },
    },
    moonglade = {
      lines = { { id = "m_default", text = "It lies high in the north of Kalimdor, between Felwood and the snows, and it belongs to the Cenarion Circle alone. Night elf and tauren walk there side by side without a blade drawn, which is a thing you will see nowhere else.", fx = { learn = { "moonglade" } } } },
      choices = {
        { text = "Tauren and elves, in peace?", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "In peace, yes, and it troubles many of my people more than it troubles me. Cenarius taught Malfurion and did not ask what he was first, and I think the Circle is right to do the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "ci_default", text = "Because our young are here, following the Alliance's wars, and a druid untaught is a danger wherever he stands. I would rather teach under these poor trees than leave them to find their shapes alone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stirring = {
      lines = {
        { id = "s_default", text = "Then it is time. Go to Dendrite Starblaze in Nighthaven, the village of Moonglade, and tell him that Theridran judged you ready. He will show you the rest." },
        { id = "s_done", when = { questDone = TODO_QUEST("Heeding the Call") }, text = "It stirred, and you answered it, and that part of your road is behind you. Whatever stirs in you now is for the Circle's elders to name, and not for me." },
      },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sent many young druids north to Moonglade, and I remember the name of each one." } },
    moonglade = { { id = "tp_mg", text = "It is the Cenarion Circle's own ground, far in the north of Kalimdor, and every druid must stand there once." } },
    _none = { { id = "tp_none", text = "That lies outside my knowing. I teach druids, and little else." } },
  },
}

-- Sylista: night elf stable master in the Park.
P:NPC {
  key = "sylista", id = TODO_NPC("Sylista"), name = "Sylista", title = "Stable Master", gender = "female",
  bible = "bibles/missed_b.md", role = "stablemaster", tier = "service",
  communities = { "stormwind" }, temper = { "gentle", "watchful" }, values = { "beasts", "kaldorei" },
  notices = { "pet" },
  impression = {
    first = "Sylista keeps hunters' beasts in Stormwind's Park and speaks to every one of them before she speaks to its master. The animals in her care were calmer than most of the people in the city.",
    third = "{name} met Sylista, the night elf stable master of Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Greetings. I keep the companions of those who hunt, and I can help you find one that has strayed from your side." },
    { id = "g_back", when = { metBefore = true }, text = "You have come again. The beasts remembered your step before I did." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "{pet} walks close to you and looks to you before looking at me. You have treated that one well, and I am glad to see it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sylista. When a hunter must leave a companion behind, I shelter it here among the trees, where it can at least smell earth and not only stone." },
      },
      again = {
        { id = "h_again", text = "Is there more? Speak softly, for the owl has only just settled." },
        { id = "h_again2", text = "Ask, and I will answer." },
      },
      choices = {
        { text = "How do wild beasts take to a city?", next = "city" },
        { text = "The dwarves keep a stable across the city too.", next = "dwarves" },
        { text = "What should a hunter know about leaving a pet?", next = "leave", when = { class = "HUNTER" } },
        { text = "Take good care of them, Sylista.", next = "END" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "Poorly, at first. The bells frighten them and the smoke confuses their noses, so I keep the new ones near the water and sit with them through the first night until they understand that nothing here is hunting them." } },
      choices = {
        { text = "Which are the hardest to settle?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "h2_default", text = "The great cats, always, for they are proud and will not show that they are afraid. A bear sulks and a boar complains, but a nightsaber will sit like a statue for two days and then refuse to forgive you for a week." } },
      choices = { { text = "I've known people like that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "Jenova Stoneshield, yes, among the forges. She is kind to her charges and I think well of her, though I do not know how any creature sleeps beside so many hammers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "That the beast does not understand why, and will wait for you every hour you are gone. Leave it fed, leave it something that carries your scent, and do not stay away longer than you must." } },
      choices = { { text = "I won't. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I tended the nightsabers of Teldrassil before I came here, and beasts are much the same under any sky." } },
    _none = { { id = "tp_none", text = "I cannot say. I know beasts far better than I know this city." } },
  },
}
