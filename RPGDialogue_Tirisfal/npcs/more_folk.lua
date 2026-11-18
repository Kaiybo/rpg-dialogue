-- More of Tirisfal: Yvette Farthing and the letter from Agamand Mills, the demon trainer in the
-- Gallows' End, the caretaker of Deathknell's crypts, five of Brill's Deathguard, and the
-- shopkeepers and smiths of Brill and Deathknell. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Yvette Farthing: Coleman's daughter; Thurman Agamand's lover once, and done with love now.
P:NPC {
  key = "tir_yvette", id = TODO_NPC("Yvette Farthing"), name = "Yvette Farthing",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "cold", "proud" }, values = { "family", "practical" },
  notices = { "race" },
  impression = {
    first = "Yvette Farthing keeps to a corner of the Gallows' End near her father and speaks of her old life as if it belonged to someone she once knew slightly. Agamand Mills is a name she would rather not hear.",
    third = "{name} met Yvette Farthing, Coleman Farthing's daughter, in the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "g_default", text = "If you're looking for my father, he's the one with the pipe and the long face. If you're looking for me, I can't think why." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, if you like; the chairs here are no use to anyone who can't feel them." },
    { id = "g_letter", when = { questActive = TODO_QUEST("A Letter Undelivered") }, text = "You're holding something out to me. What is it, then? Don't make me guess." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Letter Undelivered") }, text = "The one who brought me Thurman's letter. I've put it away, and I'd thank you not to ask where." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're breathing. I'd forgotten how loud that is, in a quiet room." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Newly risen, or near enough. You'll find the memories come back whether you want them or not, and the trick is not to want them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Yvette Farthing. My father worked the Agamands' mills, and I meant to marry into the family that owned them, and now we sit in the Gallows' End because there's nowhere else that will have us." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("A Letter Undelivered") },
          text = "That hand on the envelope is Thurman's. I'd know it anywhere, even now. Where did you find it, {class}?" },
        { id = "h_done", when = { questDone = TODO_QUEST("A Letter Undelivered") },
          text = "I've read it twice, which is once more than I should have. Regrets are for the weak, and I've no use for them, but I'm glad to know what became of him." },
      },
      again = {
        { id = "h_again", text = "Something else? Be quick about it, or be quiet." },
        { id = "h_again2", text = "Go on. My father's asleep in his chair, or doing whatever it is we do instead." },
      },
      choices = {
        { text = "I found a letter at Agamand Mills. It's addressed to you.", next = "letter", when = { questActive = TODO_QUEST("A Letter Undelivered") } },
        { text = "Who was Thurman Agamand?", next = "thurman" },
        { text = "You came from Agamand Mills?", next = "mills" },
        { text = "Your father looks like he carries a heavy load.", next = "father" },
        { text = "Nothing more. Good evening.", next = "END" },
      },
    },
    letter = {
      lines = { { id = "l_default", text = "Oh, my poor Thurman. I begged him to leave the mills with my father and me, but his family loyalty was too strong, and I knew it would be. And I knew Brand meant him harm, I just knew it." } },
      choices = {
        { text = "Who was Brand?", next = "brand" },
        { text = "I'm sorry. It must hurt to read.", next = "regrets" },
      },
    },
    brand = {
      lines = { { id = "b_default", text = "Someone Thurman trusted more than he should have, and that's all I'll say of him. The Plague did the rest, and the Scourge after it, and now the mills are full of bones that won't lie still." } },
      choices = {
        { text = "Then I'll make sure they lie still.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thurman = {
      lines = { { id = "t_default", text = "The eldest son of Gregor Agamand, who owned the mills and most of the folk who worked them. Thurman was kind, which in that family was a kind of weakness, and I loved him for it." } },
      choices = {
        { text = "Why didn't he leave with you?", next = "thurman2" },
        { text = "Something else, Yvette.", next = "BACK" },
      },
    },
    thurman2 = {
      lines = {
        { id = "t2_default", text = "Because his father wouldn't, and his brothers wouldn't, and an Agamand doesn't walk away from Agamand land. So he stayed when the Plague came, and I suppose he's still there, in whatever way the Scourge allows." },
        { id = "t2_done", when = { questDone = TODO_QUEST("A Letter Undelivered") },
          text = "His letter says he meant to follow us, in the end, once his father saw sense. His father never did, and the letter never left the mills, and that's the whole of it." },
      },
      choices = {
        { text = "Do you still love him?", next = "regrets" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regrets = {
      big = true,
      lines = { { id = "r_default", text = "As a Forsaken I have new goals, {class}, and love is not one of them. Whatever I felt for him was buried in the same ground as the rest of me, and I've no wish to dig it up." } },
      choices = {
        { text = "It's not weakness to remember him kindly.", next = "BACK", reply = "Perhaps not, for you. For me it's a door I'd rather keep shut, but I'll allow that you mean well.", fx = { align = { light = 1 } } },
        { text = "You're right. The dead have no business with love.", next = "BACK", reply = "Just so. The Dark Lady asks for our hands and our wits, and neither of those needs a sweetheart.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    mills = {
      lines = { { id = "m_default", text = "Agamand Mills, north and west of here. My father worked for the Agamands most of his life, and when the grain went bad I begged Thurman to leave with us, and he wouldn't." } },
      choices = {
        { text = "My father sent me to the mills already.", next = "mills2", when = { any = { { questActive = TODO_QUEST("Deaths in the Family") }, { questActive = TODO_QUEST("The Haunted Mills") } } } },
        { text = "What is it like there now?", next = "mills2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mills2 = {
      lines = { { id = "m2_default", text = "Full of the Agamand family and their servants, walking about as if there were still work to do. My father sends people there to put them down, and I don't ask him how he feels about it." } },
      choices = {
        { text = "If you find any more letters there, I'd take them.", next = "BACK", reply = "There won't be any more. Thurman never wrote twice when once would do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "He does. Coleman Farthing served that family faithfully for years, and now he hires strangers to kill them, and he does it because someone must. Speak to him if you want work; he always has some." } },
      choices = {
        { text = "You speak of him gently.", next = "BACK", reply = "Do I? Then I must be tired. He stayed at the mills when the Agamands asked him to, and he's never forgiven them for asking." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "They took the mills, and Thurman with them. I don't hate them as much as I ought to, which worries my father more than it worries me." } },
    forsaken = { { id = "tp_forsaken", text = "We're free, the Dark Lady says, and I believe her. Free of the Scourge, free of the living, and free of most of what we used to care about." } },
    background = { { id = "tp_bg", text = "I was a mill hand's daughter who was going to marry above herself. That plan didn't survive the Plague, and neither did I." } },
    advice = { { id = "tp_ad", text = "Don't go looking for the people you used to know. If they're dead, they'll find you, and if they're alive, they'll run." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, and I wouldn't try. Ask my father; he still likes to be asked things." } },
  },
}

-- Ageron Kargal: demon trainer in the Gallows' End; sells grimoires to teach warlocks' minions.
P:NPC {
  key = "tir_ageron", id = TODO_NPC("Ageron Kargal"), name = "Ageron Kargal", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "dry", "precise" }, values = { "knowledge", "control" },
  notices = { "class", "pet" },
  impression = {
    first = "Ageron Kargal sells grimoires to the warlocks of Brill, books that teach a summoned demon what its master can't be bothered to. He talks about imps the way a kennel master talks about hounds.",
    third = "{name} met Ageron Kargal, the demon trainer who keeps his books in the Gallows' End Tavern.",
  },

  greetings = {
    { id = "g_default", text = "Keep your hands off the shelf unless you mean to buy. Some of these books bite, and the rest are worse." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock. Good; I was beginning to think Rupert had frightened all the custom away." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. How is your little friend behaving?" },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Your {pet} is looking at my books with far too much interest. Tell it to sit, or I'll tell it for you." },
    { id = "n_notlock", cat = "class", when = { class = { "WARRIOR", "ROGUE", "PRIEST", "MAGE" } },
      text = "You're no warlock, so I've nothing to sell you, but you're welcome to stand there and be curious. Most are." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ageron Kargal. Rupert Boch teaches the warlocks of Brill their spells, and I teach their demons manners, which is the harder job by some distance." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Your demon knows what it was summoned knowing, {class}, and not a scrap more. A grimoire from me will teach it something new, if you've the coin and it's the right book for its kind." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the candles." },
        { id = "h_again2", text = "Ask, then. The books will keep." },
      },
      choices = {
        { text = "Show me the grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How do you teach a demon anything?", next = "grimoires" },
        { text = "Odd place to keep demon books, a tavern.", next = "tavern" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    grimoires = {
      lines = { { id = "gr_default", text = "You don't teach it, you instruct it. Each grimoire binds a new trick into the demon's leash, a firebolt for an imp or a sacrifice for a voidwalker, and the demon learns because it can't refuse." } },
      choices = {
        { text = "Do the demons resent it?", next = "leash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash = {
      big = true,
      lines = { { id = "le_default", text = "Every moment of every day. An imp will tell you so, loudly, and a voidwalker will tell you nothing and mean it more. The warlock who forgets that his servant hates him doesn't stay a warlock long." } },
      choices = {
        { text = "Then they're weapons, and weapons should be kept sharp.", next = "BACK", reply = "Spoken like a sensible master. Sharp, and on a short leash, and never left alone in the room.", fx = { align = { light = -1 } } },
        { text = "Binding anything that hates you seems a fool's bargain.", next = "BACK", reply = "Perhaps it is. But the Forsaken bargain with worse every day, and the demons at least are honest about it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tavern = {
      lines = { { id = "t_default", text = "Where else? The Undercity has its own trainers, and Brill has the newly risen coming up from Deathknell with an imp at their heel and no notion what to do with it. Renee doesn't mind, so long as nothing catches fire." } },
      choices = {
        { text = "Has anything caught fire?", next = "fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "Once or twice, and never anything that mattered. Imps are spiteful, not ambitious, and a singed tablecloth is about the limit of their imagination." } },
      choices = {
        { text = "That's reassuring, in a way.", next = "BACK" },
        { text = "Something else, Ageron.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "The things I deal with are the smallest and stupidest of the Legion's servants, and that's precisely why they can be leashed. I'd not sell a book for anything larger." } },
    background = { { id = "tp_bg", text = "I studied in Lordaeron before the Plague, quietly, because the Kirin Tor did not approve. They have bigger problems now." } },
    advice = { { id = "tp_ad", text = "Never let your demon see you hesitate. It will remember." } },
    _none = { { id = "tp_none", text = "Not my subject. Ask me about imps and you'll get an answer." } },
  },
}

-- Caretaker Caice: keeps a crypt by the Shadow Grave that no one enters; puzzles the newly risen.
P:NPC {
  key = "tir_caice", id = TODO_NPC("Caretaker Caice"), name = "Caretaker Caice",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "deathknell" }, temper = { "solemn", "odd" }, values = { "dutiful", "free_will" },
  notices = { "greenness" },
  impression = {
    first = "Caretaker Caice stands guard over a crypt in Deathknell that nobody seems to go into, and he talks to the newly risen about freedom as if it were a thing you could hold. It is hard to tell what he actually takes care of.",
    third = "{name} met Caretaker Caice, who keeps a sealed crypt in the graveyard at Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Another one up from the earth. Stand a moment, and let the world settle around you." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Most don't, once they find the road to Brill." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You're still learning which way your knees bend. It comes back, mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the caretaker here, and this crypt is in my care. You were the Lich King's once, as every corpse in these Glades was, but His grip on you is broken, and whatever the living think of you, you can choose your road, which no ghoul ever will." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of the living, walking among our graves. You'll forgive me if I don't ask whose dead you've come to see." },
      },
      again = {
        { id = "h_again", text = "What else would you ask the caretaker?" },
        { id = "h_again2", text = "Speak. The crypt isn't going anywhere." },
      },
      choices = {
        { text = "What's inside the crypt?", next = "crypt" },
        { text = "What do the living think of us?", next = "judged" },
        { text = "Who else keeps this graveyard?", next = "others" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    crypt = {
      lines = { { id = "c_default", text = "The dead who didn't rise, or who rose and went back down. The door is shut and I keep it shut, and nobody has yet given me a reason to open it." } },
      choices = {
        { text = "Then what are you guarding it from?", next = "crypt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crypt2 = {
      big = true,
      lines = { { id = "c2_default", text = "From the curious, mostly, and the apothecaries, who look at a sealed door the way a hungry man looks at a pie. Some rest is owed, even here. Don't you think so?" } },
      choices = {
        { text = "They've earned their rest. Leave them be.", next = "BACK", reply = "Then we agree, and the door stays shut. Not everyone who comes up from the earth wants to.", fx = { align = { light = 1 } } },
        { text = "The dead should serve the Dark Lady. All of them.", next = "BACK", reply = "Spoken like a true Forsaken, and maybe you're right. But not this door, not while I'm keeping it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    judged = {
      lines = { { id = "j_default", text = "The living, who see a corpse and reach for a torch, and the Scarlet Crusade worst of all. They'll judge you by your skin and your smell and never ask your name." } },
      choices = {
        { text = "And what chances do I have?", next = "chances" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chances = {
      lines = { { id = "ch_default", text = "To choose, which the Scourge never will. A ghoul out in the Glades does what it's told, and you, {class}, can walk away from anyone who tells you anything. That's more than most of the living can say." } },
      choices = {
        { text = "That's worth guarding too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Undertaker Mordo stitches up what the earth gives back, and Shadow Priest Sarvis tells the newly risen what they are. The Shadow Grave beside me is busier than my crypt, and I'm content to let it be." } },
      choices = {
        { text = "You don't mind being left out?", next = "BACK", reply = "Somebody has to stand still while everyone else is busy. I find I'm good at it." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "They are slaves who don't know it. Pity them if you like, but don't turn your back on them." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They'll burn you and call it mercy. Keep away from their towers until you're strong enough to stay away by choice." } },
    _none = { { id = "tp_none", text = "I keep a crypt. Beyond the gate, I know little and care less." } },
  },
}

-- Deathguard Terrence: walks the Undercity road; sends the curious after the Argent emissaries.
P:NPC {
  key = "tir_terrence", id = TODO_NPC("Deathguard Terrence"), name = "Deathguard Terrence",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "wary", "dry" }, values = { "dutiful", "loyal" },
  notices = { "race", "greenness" },
  impression = {
    first = "Deathguard Terrence walks the road between Brill and the Undercity and watches every traveller on it as if they owed him an explanation. He doesn't trust strangers in Tirisfal, even helpful ones, even dead ones.",
    third = "{name} met Deathguard Terrence, who patrols the road between Brill and the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Keep to the road, and keep moving. That's the best advice I've got, and it's free." },
    { id = "g_emissary", when = { questActive = TODO_QUEST("The Argent Emissary") }, text = "Found that Argent fellow yet? Southeast, toward the city's outskirts, and keep your head down." },
    { id = "g_emdone", when = { questDone = TODO_QUEST("The Argent Emissary") }, text = "You found the emissary, then. I hope he was worth the walk." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "I'm walking, I'm walking. Point that thing somewhere else." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Horde, and alive. You'll be wanting the Undercity, I expect; it's straight on, and don't stare at the abominations." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Deathknell, by the look of you. Stay off the Crusade's land until you've more than a rusty knife." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Terrence. I walk this road from Brill to the city gates and back again, and I see everyone who uses it, which is more than they'd like." },
        { id = "h_before", tags = { "news" }, when = { questBefore = TODO_QUEST("The Argent Emissary") },
          text = "Not sure if you heard, but two emissaries of the Argent Dawn just passed through here. Both Forsaken, which doesn't make me any less nervous about them poking around Tirisfal unsupervised." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Argent Emissary") },
          text = "The one you want headed southeast, toward the outskirts of the city. There's a pack of Scourge cultists snooping around out there, and if the emissary heard about them, that's where he'll be." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Argent Emissary") },
          text = "So the Dawn's out there hunting cultists on our doorstep. I don't mind the Argent Dawn, {class}, but I'd mind them less if they asked first." },
      },
      again = {
        { id = "h_again", text = "What else? I've a long road and short patience." },
        { id = "h_again2", text = "Go on, walk with me a bit. I don't stop." },
      },
      choices = {
        { text = "Why don't you trust the Argent Dawn?", next = "dawn" },
        { text = "What cultists?", next = "cult" },
        { text = "This road must see a lot of traffic.", next = "road" },
        { text = "The Executor sent me to motivate you.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "Safe walking, Deathguard.", next = "END" },
      },
    },
    dawn = {
      lines = { { id = "d_default", text = "I don't distrust them, exactly. They fight the Scourge and so do we, but they answer to their own commanders, and I'd like to know what they're looking for in our glades before they find it." } },
      choices = {
        { text = "They're Forsaken. Doesn't that count for something?", next = "dawn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn2 = {
      lines = { { id = "d2_default", text = "It counts for a little. But a Forsaken who swears to the Dawn has two masters, and I've only ever had room for the one. When it comes to it, which one will they follow?" } },
      choices = {
        { text = "So what would you have the Dawn do?", next = "dawn3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn3 = {
      big = true,
      lines = { { id = "d3_default", text = "Check in at Brill, tell the Executor their business, and let a Deathguard walk with them. That's not much to ask of guests, is it?" } },
      choices = {
        { text = "It's our land. Guests should follow our rules.", next = "BACK", reply = "Just so. The Dark Lady didn't take Lordaeron back so that every banner in the world could wander through it.", fx = { align = { order = 1 } } },
        { text = "They're killing cultists. Let them work without a minder.", next = "BACK", reply = "Hmph. Maybe you're right, and maybe I'm only sore that they're doing my job. Still, I'll be watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "c_default", text = "Cult of the Damned, the living who serve the Scourge of their own free will. They've been seen southeast of the city, skulking about the outskirts, and they're not to be trifled with, so stay low and try not to be seen." } },
      choices = {
        { text = "Why would the living serve the Scourge?", next = "cult2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      lines = { { id = "c2_default", text = "Promises. Kel'Thuzad promised them they'd live forever, and they believed him. We're what forever looks like, and you'd think one look at us would cure them of the notion." } },
      choices = {
        { text = "Some of them might listen, shown the truth.", next = "BACK", reply = "Might. I've never met one who did, and I don't plan to wait around to meet one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Newly risen going to the city, apothecaries going to Brill, Horde from Durotar coming off the zeppelin, and the odd fool who thinks a Crusade tabard will get him through. It doesn't." } },
      choices = {
        { text = "Do you ever stop walking?", next = "BACK", reply = "Not if I can help it. The last Deathguard who stopped on this road got a visit from the Executor's motivator." },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Me? I never stop walking, you ask anyone. Fine, fine, do what you must, and I'll be telling Zygand I was on my rounds when you found me." } },
      choices = {
        { text = "Consider yourself motivated.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    argent_dawn = { { id = "tp_dawn", text = "Good fighters, poor guests. That's all I'll say about the Dawn." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They come down the road sometimes, pretending to be pilgrims. They're very bad at it." } },
    _none = { { id = "tp_none", text = "If it isn't on this road, I don't know it. Ask in Brill." } },
  },
}

-- Deathguard Cyrus: a Brill guard who gives directions by the book and recites the rules.
P:NPC {
  key = "tir_cyrus", id = TODO_NPC("Deathguard Cyrus"), name = "Deathguard Cyrus",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "stiff", "proper" }, values = { "dutiful", "order" },
  notices = { "race" },
  impression = {
    first = "Deathguard Cyrus gives directions around Brill as if reciting from a manual, and he seems quietly proud that he has never once been late to his post. He would make a fine clerk, if Brill still had any.",
    third = "{name} met Deathguard Cyrus, one of the guards who keeps watch in Brill.",
  },

  greetings = {
    { id = "g_default", text = "State your business in Brill, {class}, and I'll point you to it." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "There must be some mistake. My conduct has been exemplary, and I can produce witnesses." },
    { id = "g_disdone", when = { questDone = TODO_QUEST("Discipline") }, text = "I trust the Executor was satisfied with your work. I certainly was not." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Visitors from the Horde are welcome in Brill, provided they keep the peace and don't eat anything from the apothecaries' tables." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Cyrus, on watch in Brill. If you need the inn, the Executor, an apothecary or a stable, I can direct you to any of them, and quickly." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on. I'm listening, and watching." },
      },
      choices = {
        { text = "Where can I find the Executor?", next = "directions" },
        { text = "You seem very sure of your duty.", next = "duty" },
        { text = "I'm here to motivate you. Executor's orders.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "That's all, Deathguard.", next = "END" },
      },
    },
    directions = {
      lines = { { id = "d_default", text = "Executor Zygand stands in the middle of town, where he can see everyone and everyone can see him. The Gallows' End is the tavern with the noise coming out of it, and Zachariah Post will sell you a horse if you've the coin and the years for it." } },
      choices = {
        { text = "And Deathknell, if I needed to go back?", next = "directions2" },
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    directions2 = {
      lines = { { id = "d2_default", text = "West along the road, through the graves and past the farms the Crusade still likes to haunt. I wouldn't go back unless you've forgotten something, and the dead seldom forget much." } },
      choices = {
        { text = "Helpful as ever, Cyrus.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty = {
      big = true,
      lines = { { id = "du_default", text = "Duty is what's left when the rest is gone, {class}. I can't taste, I can't sleep, I can't remember my mother's face, but I can stand my post, and I do it properly." } },
      choices = {
        { text = "Then you stand it well. Brill is safer for it.", next = "BACK", reply = "It is, and I'll thank you not to tell the others I liked hearing it.", fx = { align = { order = 1 } } },
        { text = "A post isn't a life. You could want more.", next = "BACK", reply = "Perhaps, if I could remember what more looked like. Until then, I'll stand here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "I've never missed a watch, not one, and I'll have that noted. Very well, if the Executor insists, do it quickly and do it where the others can't see." } },
      choices = {
        { text = "Done. Back to your post, Deathguard.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not covered in my duties, I'm afraid. Try the Executor, or the inn." } },
  },
}

-- Deathguard Lawrence: a Brill guard who leans on things and resents the motivator.
P:NPC {
  key = "tir_lawrence", id = TODO_NPC("Deathguard Lawrence"), name = "Deathguard Lawrence",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "grumbling", "dry" }, values = { "comfort", "survival" },
  notices = { "race" },
  impression = {
    first = "Deathguard Lawrence keeps watch in Brill mostly by leaning on whatever is nearest, and he has a long list of complaints about the Executor. He knows the town well, which he says is only because he has nothing else to look at.",
    third = "{name} met Deathguard Lawrence, a weary guard who keeps watch in Brill.",
  },

  greetings = {
    { id = "g_default", text = "If you're lost, I can help. If you're from the Executor, I was just straightening up." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "Oh, no. Not you as well. Doesn't Zygand have anything better for his errand-runners to do?" },
    { id = "g_disdone", when = { questDone = TODO_QUEST("Discipline") }, text = "My shoulder still smarts, if you were wondering. I wasn't sure we could still feel that." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, and not long up. Here's a tip: lean on the left foot, it's usually the one with fewer loose bits." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Lawrence, guarding Brill. I came back here when the Dark Lady took the town back, and I've been standing in roughly this spot ever since." },
      },
      again = {
        { id = "h_again", text = "Something else? Take your time; I'm not going anywhere." },
        { id = "h_again2", text = "Ask away, if it doesn't involve me moving." },
      },
      choices = {
        { text = "What's the Executor like to serve under?", next = "zygand" },
        { text = "You knew Brill before, then?", next = "before" },
        { text = "Executor Zygand sent me with his motivator.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "Carry on, Lawrence.", next = "END" },
      },
    },
    zygand = {
      lines = { { id = "z_default", text = "Exacting. He keeps a ledger with all our names in it, and every so often he hands a stranger a stick and lets them work down the list. I'm near the top, apparently, though no one will tell me why." } },
      choices = {
        { text = "Perhaps it's the leaning.", next = "zygand2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zygand2 = {
      big = true,
      lines = { { id = "z2_default", text = "A man can lean and watch at the same time. Nothing's got past me yet, not on my side of the square. But you tell me, {class}, is a guard who's resting a guard who's failing?" } },
      choices = {
        { text = "A guard should stand straight. The Executor's right.", next = "BACK", reply = "You and him both. Fine, I'll stand up straight until you're out of sight.", fx = { align = { order = 1 } } },
        { text = "If nothing's got past you, you're doing your job.", next = "BACK", reply = "That's what I keep saying! I'd have you speak for me, if Zygand ever let anyone speak.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "I knew it when it was a market town, with bread and beer and folk who complained about the weather. Now it's all apothecaries and gallows humour, and nobody complains about the weather because nobody feels it." } },
      choices = {
        { text = "Do you miss it?", next = "BACK", reply = "Miss is a strong word. I notice it's gone, the way you notice a tooth's gone, and then I get on with leaning." },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Of course he did. Go on, then, get it over with, and tell him I was standing perfectly straight when you arrived." } },
      choices = {
        { text = "You were leaning, Lawrence.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea. Ask Cyrus; he knows everything and he'll tell you, at length." } },
  },
}

-- Deathguard Mort: keeps watch upstairs in Brill's south building; once walked the Garren's Haunt road.
P:NPC {
  key = "tir_mort", id = TODO_NPC("Deathguard Mort"), name = "Deathguard Mort",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "gloomy", "quiet" }, values = { "solitude", "dutiful" },
  notices = { "race" },
  impression = {
    first = "Deathguard Mort keeps watch from an upstairs room in Brill, where he can see the road toward Garren's Haunt without anyone seeing much of him. He talks like someone who has had a great deal of time to think and didn't enjoy it.",
    third = "{name} met Deathguard Mort, who keeps watch from upstairs in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Up the stairs, are you? Not many bother. Mind the third step; it isn't there." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "So he's found me even up here. I suppose that's a compliment, of a sort." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You climbed all those stairs with lungs. I'd be impressed, if I could still be impressed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Mort. I used to walk the road between Brill and Garren's Haunt, until the Executor decided I'd be more use up here, watching it instead." },
      },
      again = {
        { id = "h_again", text = "Something else, while you're up here?" },
        { id = "h_again2", text = "Go on. It's quiet, which is how I like it." },
      },
      choices = {
        { text = "What's out at Garren's Haunt?", next = "garren" },
        { text = "You don't seem to mind the solitude.", next = "alone" },
        { text = "The Executor's motivator, I'm afraid.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "I'll leave you to your window.", next = "END" },
      },
    },
    garren = {
      lines = { { id = "g_default", text = "A farmstead to the north, full of hungry dead that nobody has bothered to clear. I walked past it every day for weeks, and every day something in there was watching me back." } },
      choices = {
        { text = "Did you ever go inside?", next = "garren2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garren2 = {
      big = true,
      lines = { { id = "g2_default", text = "Once, and I came out quicker than I went in. Some places should be burned, {class}, and some should be left to rot by themselves. I've never decided which that one is." } },
      choices = {
        { text = "Burn it. Leave nothing for the Scourge.", next = "BACK", reply = "Maybe. Though fire spreads, and Brill's no stranger to burning. I'll mention it to the Executor, if I ever see him.", fx = { align = { light = 1 } } },
        { text = "Leave it. Rot is what this land does now.", next = "BACK", reply = "That's the Forsaken way of looking at it, and maybe the wiser one. Let the Glades eat it slowly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "a_default", text = "I don't mind it, no. Down there everyone is very busy pretending to be alive, and up here I can watch the road and not pretend anything." } },
      choices = {
        { text = "That sounds lonely, Mort.", next = "BACK", reply = "Lonely is for the living. This is just quiet, and quiet is what I've got." },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Fair enough. I've been up here so long I'd half forgotten I was supposed to be doing anything. Go ahead; I'll be watching the road again before you're down the stairs." } },
      choices = {
        { text = "Mind the third step.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Can't help you there. I only know what I see from this window." } },
  },
}

-- Deathguard Royann: guards the cellar of the Gallows' End Tavern.
P:NPC {
  key = "tir_royann", id = TODO_NPC("Deathguard Royann"), name = "Deathguard Royann",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "sardonic", "watchful" }, values = { "dutiful", "order" },
  notices = { "race", "class" },
  impression = {
    first = "Deathguard Royann keeps watch over the cellar of the Gallows' End, and she has a sharp word for anyone who wanders down the stairs looking for a quieter place to drink. She seems to think the tavern needs guarding from its customers more than from the Crusade.",
    third = "{name} met Deathguard Royann, who guards the cellar of the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Lost on the way to the bar? It's upstairs, where it's always been." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "Down here? Really? I'm the only Deathguard in Brill who works indoors, and you still came looking." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Keep your imp off the barrels; the last one set fire to a perfectly good cask of something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Royann. I guard the cellar, which sounds like a joke until you've seen what comes down these stairs at closing time. If you need directions, I've those too." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your voice down; it carries." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "What comes down the stairs at closing?", next = "closing" },
        { text = "Where would I find Innkeeper Renee?", next = "directions" },
        { text = "Executor Zygand sends his regards. And his motivator.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "I'll go back up.", next = "END" },
      },
    },
    closing = {
      lines = { { id = "c_default", text = "Deathguard off watch, apothecaries who've sampled their own work, and newly risen who think the cellar's where the good stuff is kept. None of us can get drunk, mind, but you'd never know it to watch them try." } },
      choices = {
        { text = "What do you do with them?", next = "closing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    closing2 = {
      big = true,
      lines = { { id = "c2_default", text = "Send them back up, usually, and remember their faces for the Executor if they're rude about it. What would you do, {class}, if you had the stairs?" } },
      choices = {
        { text = "Report every one of them. Rules are rules.", next = "BACK", reply = "Spoken like Zygand himself. I'd keep a ledger too, if I could be bothered to write.", fx = { align = { order = 1 } } },
        { text = "Let them be. They've little enough left.", next = "BACK", reply = "Soft of you, but not wrong. I let most of them go with a glare, and the glare does the work.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    directions = {
      lines = { { id = "d_default", text = "Renee's upstairs behind the counter, where she always is. Coleman Farthing sits by the hearth if you're after work, and the trainers keep to their own rooms; ask Renee which, she knows them all." } },
      choices = {
        { text = "Thank you, Royann.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Fine, but make it quick, and don't knock over anything on your way out. Zygand can explain the barrels to Renee if you do." } },
      choices = {
        { text = "Careful as I can be.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not down here, I'm afraid. Ask upstairs." } },
  },
}

-- Eliza Callen: Brill's leather armor merchant.
P:NPC {
  key = "tir_eliza", id = TODO_NPC("Eliza Callen"), name = "Eliza Callen", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "brisk", "dry" }, values = { "practical", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Eliza Callen sells leather armor in Brill and judges every customer by the state of their boots. She has no patience for the newly risen who show up in grave rags and expect to be told they look fine.",
    third = "{name} met Eliza Callen, who sells leather armor in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Leather, cured and stitched. It won't stop a Crusader's sword, but it'll make him work for it." },
    { id = "g_rogue", when = { class = { "ROGUE", "HUNTER", "DRUID", "SHAMAN" } }, text = "You've the look of someone who'd rather move than stand and be hit. Good; I sell to people like you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's falling off you, and I don't mean that as a joke about Forsaken. Buy something before something buys you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Eliza Callen, leather armor. I've jerkins, boots, gloves and belts, and they're as good as anything you'll find short of the Undercity, and cheaper." },
      },
      again = {
        { id = "h_again", text = "Anything else? Or are you buying?" },
        { id = "h_again2", text = "Go on. I'm listening, and measuring you while I do." },
      },
      choices = {
        { text = "Let's see what you have.", next = "BUSINESS" },
        { text = "Where does the leather come from?", next = "hides" },
        { text = "Do the newly risen buy much?", next = "risen" },
        { text = "Not today.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "h2_default", text = "Wolves and boars from the Glades, mostly, and whatever the Deathguard drag back from the Crusade's farms. A hide doesn't care who skinned it, and nor do I." } },
      choices = {
        { text = "Even Crusade horses?", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides2 = {
      big = true,
      lines = { { id = "h3_default", text = "Once or twice, and it made fine saddle leather. Some of my customers think that's a crime, and some think it's the funniest thing they've heard all year. Which are you?" } },
      choices = {
        { text = "Waste nothing. The Crusade would do the same to us.", next = "BACK", reply = "They'd burn us rather than wear us, but I take your point. Waste not.", fx = { align = { light = -1 } } },
        { text = "The horses did nothing wrong. Leave them be.", next = "BACK", reply = "A tender heart in Brill! Keep it, if you can; most of us lost ours in the ground.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    risen = {
      lines = { { id = "r_default", text = "They come up from Deathknell in whatever they were buried in, which is never armor. I sell them a pair of boots first, because the road from the graveyard is long and their feet are in a dreadful state." } },
      choices = {
        { text = "Practical of you.", next = "BACK" },
        { text = "Something else, Eliza.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell leather, not answers. Try the inn." } },
  },
}

-- Oliver Dwor: Brill's apprentice weaponsmith.
P:NPC {
  key = "tir_oliver", id = TODO_NPC("Oliver Dwor"), name = "Oliver Dwor", title = "Apprentice Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "earnest", "dry" }, values = { "craft", "ambitious" },
  notices = { "class" },
  impression = {
    first = "Oliver Dwor sells plain, sturdy weapons in Brill and calls himself an apprentice without any sign of embarrassment. He says he means to be a master one day, and that being dead has given him plenty of time to practise.",
    third = "{name} met Oliver Dwor, the apprentice weaponsmith in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Swords, axes, maces and staves. Plain work, honestly made, and none of it will snap on you." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "You hold yourself like someone who swings for a living. Come and pick something heavy." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A caster, eh? I've a staff or two, and a dagger for when the spells run out. They always run out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Oliver Dwor, apprentice weaponsmith. Apprentice to whom, you ask? Nobody now, since my master didn't come back, so I suppose I'm apprenticed to the work itself." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've an edge to finish." },
        { id = "h_again2", text = "Go on. I can talk and file." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What happened to your master?", next = "master" },
        { text = "Plain work is all most of us need.", next = "plain" },
        { text = "Not today.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "He died in the Plague, same as me, but he stayed dead, which I suppose was his choice in the end. I kept his files and his hammer, and I've been teaching myself from what I remember." } },
      choices = {
        { text = "Do you remember much?", next = "master2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master2 = {
      big = true,
      lines = { { id = "m2_default", text = "His hands, mostly, and the way he swore at a bad temper. I can't remember his face at all. Do you think that's a mercy, {class}, or a theft?" } },
      choices = {
        { text = "A mercy. Faces only haunt you.", next = "BACK", reply = "That's what I tell myself, most days. The hands are enough to work by.", fx = { align = { light = -1 } } },
        { text = "A theft. Hold on to whatever you can.", next = "BACK", reply = "Then I'll keep trying. Maybe it'll come back while I'm at the anvil; things do, sometimes.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      lines = { { id = "p_default", text = "It is, and that's what I tell the newly risen who want something with a skull on the pommel. A skull won't help you against a Scarlet Crusader; a good edge will." } },
      choices = {
        { text = "I'll take the good edge.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. If it isn't steel, I don't know much about it." } },
  },
}

-- Hamlin Atkins: wandering mushroom farmer who sells fungus around Brill.
P:NPC {
  key = "tir_hamlin", id = TODO_NPC("Hamlin Atkins"), name = "Hamlin Atkins", title = "Mushroom Farmer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "cheerful", "rambling" }, values = { "craft", "community" },
  notices = { "race" },
  impression = {
    first = "Hamlin Atkins wanders Brill with a basket of mushrooms and talks about them the way other farmers talk about wheat. He was a farmer before the Plague, and he seems pleased to have found a crop that likes the dark as much as he now does.",
    third = "{name} met Hamlin Atkins, who grows and sells mushrooms around Brill.",
  },

  greetings = {
    { id = "g_default", text = "Mushrooms! Fresh from the cellar, or as fresh as anything in Brill gets." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you had the taste for them." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You'll want the ones from the left side of the basket, friend; the right side is for those of us who don't digest any more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hamlin Atkins, mushroom farmer. I used to grow barley out past the Brightwater, and now I grow mushrooms in a cellar, and if you ask me, the mushrooms are better company." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the basket." },
        { id = "h_again2", text = "Go on; I'm only walking in circles anyway." },
      },
      choices = {
        { text = "Let me see the basket.", next = "BUSINESS" },
        { text = "Why mushrooms?", next = "why" },
        { text = "You wander a lot for a farmer.", next = "wander" },
        { text = "Not today.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nothing else will grow in the Glades now, not properly. The soil's been sour since the Plague, and the only things that thrive in it are fungus and apothecaries." } },
      choices = {
        { text = "Do the apothecaries buy from you?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "w2_default", text = "Some of them, for things I'd rather not know about. I sell to whoever asks, mind, but I'd sooner my mushrooms were eaten than boiled down for whatever they brew in the Undercity. What do you think, should a farmer care where his crop goes?" } },
      choices = {
        { text = "A crop's a crop. Sell to whoever pays.", next = "BACK", reply = "That's what my father would've said, and he never lost a harvest to fussiness. Still, I wonder.", fx = { align = { honor = -1 } } },
        { text = "Yes. A farmer answers for his harvest.", next = "BACK", reply = "Thank you! I'll sell the apothecaries the small ones, then, and keep the good ones for eating.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wander = {
      lines = { { id = "wa_default", text = "Farmers stay put when there's a field to mind, but a basket goes where the hungry are. I walk Brill from the stables to the graveyard and back, and somebody always wants a mushroom." } },
      choices = {
        { text = "Even in the graveyard?", next = "BACK", reply = "Especially there. Mourners get peckish, and the Forsaken are always mourning something." },
        { text = "Something else, Hamlin.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me about mushrooms." } },
  },
}

-- Blacksmith Rand: Deathknell's apprentice armorer.
P:NPC {
  key = "tir_rand", id = TODO_NPC("Blacksmith Rand"), name = "Blacksmith Rand", title = "Apprentice Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "gruff", "steady" }, values = { "craft", "practical" },
  notices = { "greenness", "kit" },
  impression = {
    first = "Blacksmith Rand sells simple armor in Deathknell to the newly risen, most of whom have never worn any. He fits them out with the patience of someone who has done it a hundred times and expects to do it a hundred more.",
    third = "{name} met Blacksmith Rand, who sells armor to the newly risen in Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Fresh from the grave and wearing a shroud. Let's get some mail on you before the Crusade sees you like that." },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece? Good. Mostly good." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You're still stiff from the ground, I can tell. Armor will feel heavy for a while; that passes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Blacksmith Rand. I sell armor to the risen of Deathknell, which means I sell a great deal of very simple armor to people who don't yet know which end of a gauntlet goes on first." },
      },
      again = {
        { id = "h_again", text = "Something else? There's a line behind you, or there will be." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "Where do you get the metal out here?", next = "metal" },
        { text = "I don't think armor suits me.", next = "suits" },
        { text = "Not now.", next = "END" },
      },
    },
    metal = {
      lines = { { id = "me_default", text = "The Undercity sends some by cart, and the rest I pull out of Scarlet scrap the Deathguard bring in. Melted down, a Crusader's helm makes a fine pair of greaves for a Forsaken." } },
      choices = {
        { text = "There's justice in that.", next = "metal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    metal2 = {
      big = true,
      lines = { { id = "me2_default", text = "There's iron in it, which is what I care about. But I'll admit I enjoy the hammering more when I know whose helm it was. Is that wrong of me, {class}?" } },
      choices = {
        { text = "Not at all. Let them arm the people they burn.", next = "BACK", reply = "That's how I see it. Every Crusader helm I melt is one more of us who walks out of here protected.", fx = { align = { light = -1 } } },
        { text = "Iron is iron. Hate makes for bad work.", next = "BACK", reply = "Maybe it does. I'll try hammering calmer, and we'll see if the greaves come out any straighter.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    suits = {
      lines = { { id = "s_default", text = "Then take a pair of bracers at least, because nobody thinks armor suits them until an arrow finds the bit that wasn't covered. I've seen the Crusade's archers, and they aren't fussy." } },
      choices = {
        { text = "Bracers it is, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I hammer metal, not questions. Ask Mordo or the Shadow Priest." } },
  },
}

-- Abe Winters: Brill's apprentice armorer; married to Mrs. Winters of the general goods.
P:NPC {
  key = "tir_abe", id = TODO_NPC("Abe Winters"), name = "Abe Winters", title = "Apprentice Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "mild", "dry" }, values = { "family", "craft" },
  notices = { "kit" },
  impression = {
    first = "Abe Winters sells armor in Brill, a few doors from his wife's general goods, and seems to have made peace with being an apprentice at an age when most men are long past it. He speaks of Mrs. Winters with a fondness that surprises even him.",
    third = "{name} met Abe Winters, who sells armor in Brill and is married to Mrs. Winters of the general store.",
  },

  greetings = {
    { id = "g_default", text = "Mail and plate, made in Brill. Nothing fancy, but it'll keep your insides in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did my wife send you? She sends everyone." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's more holes than metal. Let me show you something with fewer holes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Abe Winters, armorer, or apprentice armorer, if you're going by the sign. The missus keeps the general goods across the way, and between the two of us we can clothe and feed half the town." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, I'm only polishing." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You and Mrs. Winters are married?", next = "wife" },
        { text = "Apprentice? You look old enough to be a master.", next = "apprentice" },
        { text = "Not today.", next = "END" },
      },
    },
    wife = {
      lines = { { id = "w_default", text = "We are, or we were, and we've decided it still counts. Neither of us remembers the wedding properly, so we've agreed it was lovely, and that saves a lot of arguing." } },
      choices = {
        { text = "That's oddly sweet.", next = "wife2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife2 = {
      big = true,
      lines = { { id = "w2_default", text = "Some in Brill say it's foolish, the dead keeping house as if nothing had changed. Gretchen Dedmar tells my wife so every week. What do you make of it?" } },
      choices = {
        { text = "Keep house. Whatever holds you together is worth keeping.", next = "BACK", reply = "That's what I tell her. I'll pass your vote along; she'll like having it.", fx = { align = { light = 1 } } },
        { text = "Gretchen's right. That life is over.", next = "BACK", reply = "Maybe it is. But it's a poor sort of afterlife that doesn't let a man keep his wife.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentice = {
      lines = { { id = "a_default", text = "Old enough, aye, but I was no smith before the Plague. When I came back, the Undercity needed armorers more than anything I used to be, so here I am, learning at an age I'd rather not count." } },
      choices = {
        { text = "It's never too late to learn a trade.", next = "BACK", reply = "Not when you've got forever, it isn't. That's one thing the Plague gave us." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the missus; she hears everything." } },
  },
}
