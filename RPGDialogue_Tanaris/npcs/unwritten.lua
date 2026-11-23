-- Tanaris, folk no earlier pass reached: Anachronos at the Caverns of Time, Andi Lynn in Gadgetzan, the lost robot
-- OOX-17/TN, Meridith the Mermaiden on Land's End Beach, the naga Zalashji, the turtle Torta, and the Stone Watcher
-- of Norgannon at the Uldum pedestal.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Anachronos: bronze dragon, guardian of the Caverns of Time.
P:NPC {
  key = "tan_anachronos", id = TODO_NPC("Anachronos"), name = "Anachronos", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "grave", "ancient" }, values = { "time", "duty" },
  notices = { "race", "class" },
  impression = {
    first = "Anachronos is a bronze dragon, the heir of Nozdormu, who takes the shape of an old elf at the mouth of the Caverns of Time. He spoke to me as though he already knew how our conversation would end, and was being polite about it.",
    third = "{name} met Anachronos, heir of Nozdormu, at the Caverns of Time.",
  },
  greetings = {
    { id = "g_default", text = "Ah, you have arrived. You are neither early nor late, which is more than most mortals manage." },
    { id = "g_brood", when = { reputation = { faction = "Brood of Nozdormu", min = "friendly" } }, text = "Champion. The sands have spoken of you, and for once they spoke kindly." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. I fought beside your people at the Scarab Wall a thousand years ago, and I remember the names of those who fell, even if you do not." },
  },
  start = "hello",
  nodes = {
    hello = {
      big = true,
      lines = { { id = "h_default", text = "I am Anachronos, and I watch over these caverns for the Timeless One. Time is a river, mortal, and my brood stands on its banks to keep it from flooding." } },
      again = { { id = "h_again", text = "Ask, then. I have all the time there is, which is not the same as having patience." } },
      choices = {
        { text = "What lies in the Caverns of Time?", next = "caverns" },
        { text = "You fought at the Scarab Wall?", next = "wall" },
        { text = "Where is Nozdormu?", next = "nozdormu" },
        { text = "The scepter. What must I do?", next = "scepter", when = { questActive = TODO_QUEST("The Scepter of the Shifting Sands") } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    caverns = {
      lines = { { id = "c_default", text = "All that was and all that may be, held in stillness. Mortals are not meant to walk there yet, and I would be grateful if you did not try." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wall = {
      lines = { { id = "w_default", text = "A thousand years ago the qiraji poured out of Ahn'Qiraj, and the kaldorei could not stop them alone. My flight and the red, the blue and the green came to their aid, and together we raised the Scarab Wall and sealed the insects behind it." } },
      choices = {
        { text = "And Fandral Staghelm?", next = "fandral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fandral = {
      lines = { { id = "f_default", text = "He lost his son Valstann to the qiraji, and in his grief he shattered the scepter that sealed the wall. A father's sorrow is a terrible thing, and the cost of it may yet fall on all of you." } },
      choices = {
        { text = "He had every right to grieve.", next = "BACK", reply = "To grieve, yes. To break the key to the world's prison, perhaps not.", fx = { align = { order = -1 } } },
        { text = "His duty should have come first.", next = "BACK", reply = "Spoken like one who has not yet buried a child. I hope you never learn otherwise.", fx = { align = { order = 1 } } },
      },
    },
    nozdormu = {
      lines = { { id = "n_default", text = "Everywhere and nowhere, in every moment at once. The Timeless One sees what I cannot, and I serve him by not asking what that is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scepter = {
      lines = { { id = "s_default", text = "Gather its pieces from the dragons who keep them, and reforge it, and bring it to the Scarab Gong. Know that when the gates open, the qiraji will not be the only thing that wakes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bronze_dragonflight = { { id = "tp_bronze", text = "We keep time's path true, which means we watch more than we act. It is harder than it sounds." } },
    _none = { { id = "tp_none", text = "That thread is not mine to pull, mortal." } },
  },
}

-- Andi Lynn: Gadgetzan quest giver, The Dunemaul Compound.
P:NPC {
  key = "tan_andi_lynn", id = TODO_NPC("Andi Lynn"), name = "Andi Lynn", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brisk", "angry" }, values = { "justice" },
  notices = { "race" },
  impression = {
    first = "Andi Lynn is a gnome in Gadgetzan with a grudge against the Dunemaul ogres, and she keeps a tally of what they have cost the town on a scrap of paper she will show anyone.",
    third = "{name} met Andi Lynn, a gnome in Gadgetzan with a grudge against the Dunemaul ogres.",
  },
  greetings = {
    { id = "g_default", text = "You look like someone who can swing something heavy, and I have just the place for you to swing it. Have you heard of the Dunemaul?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The Dunemaul Compound") }, text = "You took the fight to the Dunemaul, and the road's been quieter for it. I crossed three lines off my tally!" },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Then you know what it is to lose a home to brutes, and you'll understand why I'm so cross." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The Dunemaul ogres hold a compound south of here, and they raid every caravan that passes close enough to smell. I've lost cargo, friends and nearly my eyebrows to them." } },
      again = { { id = "h_again", text = "Anything else? My tally's waiting." } },
      choices = {
        { text = "What do you want done?", next = "job" },
        { text = "Show me your tally.", next = "tally" },
        { text = "Why not leave it to the Bruisers?", next = "bruisers" },
        { text = "How do you find Gadgetzan?", next = "gadgetzan" },
        { text = "Gnomeregan taught us plenty about brutes too.", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "Good luck with the ogres.", next = "END" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "Go to the compound and thin them out, and bring down their leader, Gor'marok the Ravager, if you can reach him. Ogres follow strength, so take theirs away and the rest may scatter." } },
      choices = {
        { text = "Gor'marok?", next = "gormarok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gormarok = {
      lines = { { id = "g_default", text = "Big, even for an ogre, and he wears his victims' gear like trophies. I've seen my cousin's goggles on his belt, and I want them back." } },
      choices = {
        { text = "I'll bring the goggles back.", next = "BACK", when = { questBefore = TODO_QUEST("The Dunemaul Compound") }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally = {
      lines = { { id = "t_default", text = "Four caravans, eleven crates of gears, one prized goggles and two good friends. The friends I count separately, in red ink, because I'm not ready to cross them out." } },
      choices = {
        { text = "Your friends might still be alive.", next = "friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bruisers = {
      lines = { { id = "b_default", text = "The Bruisers guard the town, not the road, and they say the ogres are outside their contract. I say that's a fine way of saying they're scared." } },
      choices = {
        { text = "They're right to keep the walls.", next = "BACK", reply = "Hmph. Perhaps. But walls don't bring back cargo.", fx = { align = { order = 1 } } },
        { text = "Contracts won't stop the ogres. Fighting will.", next = "BACK", reply = "Exactly what I've been saying!", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    friends = {
      narr = "She runs a fingertip down the red ink without looking at it.",
      lines = { { id = "fr_default", text = "That's what the red ink is for, you see, because red can still be scratched out and written over. Ogres take prisoners when they're feeling clever, which isn't often, but I've built my hopes on smaller odds." } },
      choices = {
        { text = "Then hope. I'll look for them in the compound.", next = "BACK", reply = "You will? Oh, thank you, I'll keep the ink wet.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to grieve now than hope for nothing.", next = "BACK", reply = "Maybe, but I'm a gnome, and gnomes don't do things in the sensible order.", fx = { align = { light = -1 } } },
      },
    },
    gadgetzan = {
      lines = { { id = "ga_default", text = "Hot, loud and full of goblins who'd sell you your own shadow, but the workshops are good and nobody minds a small explosion. It's the nearest thing to Tinker Town I've found in Kalimdor." } },
      choices = {
        { text = "Do the goblins treat you fairly?", next = "goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "go_default", text = "Fairly by goblin standards, which means they cheat everyone equally and they're honest about it. I'll take that over an ogre's club any day of the week." } },
      choices = { { text = "A low bar, but fair. Something else.", next = "BACK" } },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "It did, didn't it, and we didn't even get to choose our brutes, they just came up from below with Thermaplugg's blessing. At least the Dunemaul are honest about wanting to smash things, which I suppose is something." } },
      choices = { { text = "Small mercies. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about ogres." } } },
}

-- Homing Robot OOX-17/TN.
P:NPC {
  key = "tan_oox17", id = TODO_NPC("Homing Robot OOX-17/TN"), name = "Homing Robot OOX-17/TN", gender = "male",
  role = "questgiver", tier = "service",
  communities = {}, temper = { "odd" }, values = { "duty" },
  notices = {},
  impression = {
    first = "OOX-17/TN is one of Oglethorpe Obnoticus's mechanical chickens, half buried in sand in the hills east of the Gaping Chasm and complaining about it in a flat metal voice.",
    third = "{name} found the Homing Robot OOX-17/TN in Tanaris.",
  },
  greetings = {
    { id = "g_default", text = "Bzzt. Distress mode active. Sand detected in all joints. Please notify Oglethorpe Obnoticus of Booty Bay." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Homing Robot OOX-17/TN reporting. This unit crashed in the desert and is surrounded by wastewander bandits, which is statistically unfortunate." } },
      again = { { id = "h_again", text = "Bzzt. Awaiting instructions." } },
      choices = {
        { text = "Can you get home?", next = "home" },
        { text = "What's wrong with you?", next = "wrong" },
        { text = "Good luck, chicken.", next = "END" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Affirmative, if escorted to Steamwheedle Port. The bandits will attempt to disassemble this unit on the way, so please be vigilant and also fast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "w_default", text = "Flight system failure, sand ingress and mild embarrassment. Oglethorpe Obnoticus did not program the embarrassment, so this unit suspects it is the sand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Bzzt. Query not found. Please shake the sand out and try again." } } },
}

-- Meridith the Mermaiden: a lovesick naga off Land's End Beach.
P:NPC {
  key = "tan_meridith", id = TODO_NPC("Meridith the Mermaiden"), name = "Meridith the Mermaiden", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "tanaris_coast" }, temper = { "dreamy" }, values = { "love" },
  notices = { "race" },
  impression = {
    first = "Meridith is a naga who lives in the surf off Land's End Beach, and she is in love with Narain Soothfancy, who crashed a flying machine into her bay once and has never been the same. She sighs a great deal.",
    third = "{name} met Meridith the Mermaiden, a lovesick naga off the coast of Tanaris.",
  },
  greetings = {
    { id = "g_default", text = "Oh! A visitor from the land. Did he send you? Please say he sent you." },
    { id = "g_song", when = { questDone = TODO_QUEST("Love Song for Narain") }, text = "Did he like the song? Don't tell me if he didn't. I'll sing another one anyway." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Meridith, and my heart belongs to Narain, the seer of the dunes. He fell out of the sky into my bay one day, and he was the most beautiful thing I had ever seen." } },
      again = { { id = "h_again", text = "Is there more? Tell me about him again." } },
      choices = {
        { text = "Narain? Soothfancy?", next = "narain" },
        { text = "A naga and a gnome?", next = "odd" },
        { text = "Can I take him a message?", next = "message", when = { questActive = TODO_QUEST("Love Song for Narain") } },
        { text = "Where do you live, Meridith?", next = "bay" },
        { text = "Narain's a gnome, like me. He's quite a catch.", next = "gnome", when = { race = "Gnome" } },
        { text = "I'll leave you to the sea.", next = "END" },
      },
    },
    narain = {
      lines = { { id = "n_default", text = "He crashed his gnomish machine into my waters and I pulled him out. He babbled about the future and the stars and his owl, and I knew at once." } },
      choices = {
        { text = "Does he love you back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "He would, if only he remembered me. He hit his head quite hard, you see, so I sing to him from the shore and hope the words find their way." } },
      choices = {
        { text = "Love finds a way. Keep singing.", next = "BACK", reply = "I will! You are very kind, for a land-walker.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let him go. It's kinder.", next = "BACK", reply = "Never. The sea never lets go of anything.", fx = { align = { light = -1 } } },
      },
    },
    odd = {
      lines = { { id = "o_default", text = "Love does not care what shape you are. My sisters laugh at me, but my sisters have never been rescued by a gnome who smelled of oil and dreams." } },
      choices = {
        { text = "What do your sisters say about him?", next = "sisters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message = {
      lines = { { id = "m_default", text = "Take him my song, and sing it to him, even if you sing badly. He will understand the words, even if the tune is lost." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sisters = {
      lines = { { id = "si_default", text = "That he is small and dry and talks to an owl, which is all true, and that I should find someone with fins. They don't understand that I've had fins all my life, and I'm quite tired of them." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    bay = {
      lines = { { id = "ba_default", text = "In the warm water off the coast, where the sand is soft and the land-walkers' boats rarely come. From there I can see the dunes where Narain lives, if I swim up very high and squint." } },
      choices = {
        { text = "Isn't it lonely out there?", next = "lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      narr = "She trails her fingers through the water and watches the ripples go.",
      lines = { { id = "lo_default", text = "Only when the tide is low and the gulls are quiet, and then I sing until it's better. Songs are how the sea remembers things, and I want it to remember him." } },
      choices = { { text = "It will. Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "He is, isn't he? You must know, then, how clever your people are and how lovely their little hands are with tools. Tell him a gnome agrees with me, and perhaps he'll listen." } },
      choices = { { text = "I'll put in a word. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I know only the sea and my heart. Ask Narain, he knows everything." } } },
}

-- Zalashji: a solitary, peaceable naga.
P:NPC {
  key = "tan_zalashji", id = TODO_NPC("Zalashji"), name = "Zalashji", gender = "male",
  role = "citizen", tier = "service",
  communities = { "tanaris_coast" }, temper = { "wistful" }, values = { "solitude" },
  notices = {},
  impression = {
    first = "Zalashji is a lone naga who lives in a den on the Tanaris coast and comes out to stare at the sea. He is not hostile, which surprised me more than I would like to admit.",
    third = "{name} met Zalashji, a solitary naga on the Tanaris coast.",
  },
  greetings = {
    { id = "g_default", text = "You need not draw your weapon, land-dweller. I have no quarrel with you, and no one else to quarrel with." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Zalashji. I left the others of my kind and found this den, and I watch the water every day, though I no longer know what I am waiting for." } },
      again = { { id = "h_again", text = "You are still here. Speak, if you wish." } },
      choices = {
        { text = "Why did you leave the others?", next = "leave" },
        { text = "What do you watch for?", next = "watch" },
        { text = "Farewell, naga.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "They are full of anger, about what was lost under the sea and who took it. I grew tired of anger, so I swam until I found a quiet beach." } },
      choices = {
        { text = "Peace was the right choice.", next = "BACK", reply = "Perhaps. It is lonely, but it is mine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You abandoned your people.", next = "BACK", reply = "They abandoned something first. I only followed.", fx = { align = { honor = -1 } } },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "The tide, the gulls, the ships of the goblins. Once I watched for my kin to come and fetch me, but they never did, and now I watch only the tide." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I do not know, land-dweller. The sea does not tell me such things." } } },
}

-- Torta: Tooga's mate, a turtle.
P:NPC {
  key = "tan_torta", id = TODO_NPC("Torta"), name = "Torta", gender = "female",
  role = "citizen", tier = "service",
  communities = {}, temper = { "cross", "fond" }, values = { "family" },
  notices = {},
  impression = {
    first = "Torta is a talking turtle, the mate of the wandering Tooga, and she has been waiting for him for longer than she cares to say. She speaks slowly and pointedly.",
    third = "{name} met Torta, the turtle waiting for Tooga.",
  },
  greetings = {
    { id = "g_default", text = "<Torta looks at you, and then past you, and then back at you.> You are not Tooga." },
    { id = "g_done", when = { questDone = TODO_QUEST("Tooga's Quest") }, text = "Tooga is home, thanks to you. Torta is very cross with Tooga, and very glad." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Torta is waiting for Tooga, who went for a walk and did not come back. Turtles are patient, but Torta's patience is getting very thin." },
        { id = "h_done", when = { questDone = TODO_QUEST("Tooga's Quest") }, text = "Tooga says the desert was very big and very hot, and Torta says that is what happens when you wander off. We will be arguing about it for a hundred years." },
      },
      again = { { id = "h_again", text = "Torta is listening, slowly." } },
      choices = {
        { text = "Where did Tooga go?", next = "where" },
        { text = "How long have you waited?", next = "long" },
        { text = "I'll look out for him.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Out into the sand, looking at things. Tooga always looks at things, and then Tooga forgets which way home is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "A long time, even for a turtle, which is a very long time. Torta is not worried, of course. Torta is only checking the horizon very often." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Torta does not know. Torta is a turtle." } } },
}

-- Stone Watcher of Norgannon: titan projection at the Uldum pedestal.
P:NPC {
  key = "tan_stone_watcher", id = TODO_NPC("Stone Watcher of Norgannon"), name = "Stone Watcher of Norgannon", gender = "male",
  role = "scholar", tier = "service",
  communities = {}, temper = { "ancient" }, values = { "knowledge" },
  notices = { "race" },
  impression = {
    first = "The Stone Watcher of Norgannon is a projection that appears above the pedestal in the Valley of the Watchers, a titan record speaking to whoever has the right discs. It looked through me as though I were a footnote.",
    third = "{name} spoke with the Stone Watcher of Norgannon at the Uldum pedestal.",
  },
  greetings = {
    { id = "g_default", text = "Discs accepted. Greetings, creature. You have activated a record of the Keepers. State your inquiry." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Earthen-derived. Your lineage is recorded. Your ancestors were made of stone, and their descendants have become flesh." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "This record was placed by Norgannon, keeper of lore. It speaks of the titans, of the shaping of this world and of those who were made to guard it." } },
      again = { { id = "h_again", text = "Further inquiry permitted." } },
      choices = {
        { text = "Who were the titans?", next = "titans" },
        { text = "What is behind these gates?", next = "gates" },
        { text = "End the record.", next = "END" },
      },
    },
    titans = {
      lines = { { id = "t_default", text = "Makers of order, who shaped worlds and set guardians upon them. They are gone from this world now, and their works sleep." } },
      choices = {
        { text = "Who did they make?", next = "made" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made = {
      lines = { { id = "m_default", text = "The earthen, shaped from stone, and the watchers who guard the titans' vaults, and others whose names this record does not hold. Some changed, as all things change, and that too was recorded." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gates = {
      lines = { { id = "g_default", text = "Uldum. Access is restricted. This record is not authorized to open the gates, only to speak of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That inquiry is outside this record's parameters." } } },
}

-- Elder Ragetotem: a tauren elder honoured in Tanaris during the Lunar Festival.
P:NPC {
  key = "tan_elder_ragetotem", id = 15573, name = "Elder Ragetotem", gender = "male",
  role = "elder", tier = "quest",
  temper = { "calm", "dry" }, values = { "ancestors", "tradition" },
  notices = { "race", "season" },
  impression = {
    first = "A tauren elder glowing softly in the desert heat, unbothered by the sand.",
    third = "{name} paid respects to Elder Ragetotem in Tanaris during the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, traveller. The sand is hot and the ancestors are near, so we will both bear it together." },
    { id = "g_done", when = { questDone = TODO_QUEST("Ragetotem the Elder") }, text = "You honoured me already. The desert remembers footprints a short while, but the ancestors remember longer." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Kin from the grasslands, far from home. You must miss the rain as much as I do." },
    { id = "n_lunar", cat = "season", when = { holiday = "lunar" }, text = "The festival lanterns burn even in Tanaris. The ancestors do not mind the heat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Ragetotem, an elder of my people, and for the Lunar Festival I stand in this desert as the ancestors ask. Those who seek the elders carry honour from one to the next." } },
      again = { { id = "h_again", text = "Ask, child. There is no hurry in the desert, only heat." } },
      choices = {
        { text = "Why would the ancestors send you to the desert?", next = "desert" },
        { text = "I've come to honour you, elder.", next = "honour", when = { questActive = TODO_QUEST("Ragetotem the Elder") } },
        { text = "Your name sounds fierce for an elder.", next = "name" },
        { text = "May the eternal sun shine on you.", next = "END" },
      },
    },
    desert = {
      lines = { { id = "d_default", text = "There are spirits here older than any tauren, buried with the cities beneath the sand. The ancestors wish them to know that they are not forgotten, even by strangers." } },
      choices = {
        { text = "Old cities, like the troll ruins at Zul'Farrak?", next = "cities" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cities = {
      lines = { { id = "c_default", text = "Zul'Farrak, and older places still, far to the south behind gates the goblins cannot open. Some things are buried for a reason, child, and the wise leave them be." } },
      choices = {
        { text = "Ancient secrets should be uncovered.", next = "BACK", reply = "Then go carefully, for the desert keeps its secrets jealously.", fx = { align = { order = -1 } } },
        { text = "I agree. Let the dead keep their cities.", next = "BACK", reply = "A wise answer from one so young.", fx = { align = { order = 1 } } },
      },
    },
    honour = {
      lines = { { id = "ho_default", text = "Then take my blessing and a coin of the ancestors. Drink deeply before your next road; the elders are many, and the desert is wide." } },
      choices = { { text = "I will, elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = { { id = "n_default", text = "I earned it young, when my temper was hotter than this sand. Age has cooled me, but the name stayed, as names do." } },
      choices = { { text = "Names outlast us all. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An old tauren with a fierce name and a quiet heart. Nothing more." } },
    _none = { { id = "tp_none", text = "Ask the goblins, child. They sell answers, I am told." } },
  },
}

-- Prospector Gunstan: an Explorers' League dwarf keeping a lonely watch over the sealed gates in the Valley of the Watchers.
P:NPC {
  key = "tan_prospector_gunstan", id = 5389, name = "Prospector Gunstan", gender = "male",
  role = "explorer", tier = "quest",
  temper = { "stubborn", "hearty" }, values = { "discovery", "titans" },
  notices = { "race", "class" },
  impression = {
    first = "A sunburnt dwarf prospector who hasn't seen a friendly face in weeks and is glad of yours.",
    third = "{name} met Prospector Gunstan of the Explorers' League in the Valley of the Watchers.",
  },
  greetings = {
    { id = "g_default", text = "Well, I'll be! A visitor, out here in the Valley of the Watchers! Come in out o' the sun, {g:lad|lass}." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I'm still here, and the gates are still shut, if ye were wonderin'." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Easy now, I'm just a dwarf with a pick an' a notebook. Nothin' here worth fightin' over." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "A fellow son o' the mountain! Tell me, how's the ale in Ironforge these days?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Prospector Gunstan, o' the Explorers' League. I've been watchin' these great gates for months, waitin' for some way to open 'em, an' writin' down every scratch on these statues." } },
      again = { { id = "h_again", text = "What else, then? I've nothin' but time an' sand." }, { id = "h_again2", text = "Go on, ask! It's grand to hear a voice that isn't mine." } },
      choices = {
        { text = "What lies behind the gates?", next = "gates" },
        { text = "Why does the League care about this place?", next = "league" },
        { text = "Do you know Magni's interest in the titans?", next = "magni", when = { race = "Dwarf" } },
        { text = "You've been alone out here a long while.", next = "lonely" },
        { text = "Good luck with your digging.", next = "END" },
      },
    },
    gates = {
      lines = { { id = "g_default", text = "That's the question, isn't it? The goblins say a lost city, the trolls say a curse, an' the statues say nothin' at all, the stony beggars. I'd wager it's titan work, an' old as the world." } },
      choices = {
        { text = "Titan work? How can you tell?", next = "titans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    titans = {
      lines = { { id = "t_default", text = "The same marks as on the old stonework at Uldaman in the Badlands, the very same! Whoever built that built this, I'd stake me beard on it." } },
      choices = {
        { text = "Some doors are better left shut.", next = "BACK", reply = "Bah, that's what the cowards said about Uldaman, an' look what we found there.", fx = { align = { order = 1 } } },
        { text = "Then we have to find a way in.", next = "BACK", reply = "That's the spirit! Ye'd make a fine Explorer, {g:lad|lass}.", fx = { align = { order = -1 } } },
      },
    },
    league = {
      lines = { { id = "l_default", text = "The League wants to know where we came from, an' who made the world the way it is. Every ruin's a page in that book, an' this one's a whole chapter." } },
      choices = { { text = "A noble cause. Something else.", next = "BACK" } },
    },
    magni = {
      lines = { { id = "m_default", text = "Aye, the king's keen on it, an' Brann Bronzebeard more so. If I find anythin' here, it'll go straight to Ironforge, an' maybe they'll let me come home." } },
      choices = { { text = "May it be soon. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lonely = {
      lines = { { id = "lo_default", text = "Aye, an' the sun's cooked half me wits by now. I talk to the statues of an evening, an' I swear one o' them's started listenin'." } },
      choices = { { text = "That's worrying. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ironforge born, Explorers' League by trade, an' sunburnt by bad luck." } },
    _none = { { id = "tp_none", text = "No idea, {g:lad|lass}, but if ye find out, write it down for me!" } },
  },
}

-- Rumsen Fizzlebrack: a Steamwheedle goblin outside Gadgetzan who lets fallen-out adventurers buy their way back into the Cartel's good books.
P:NPC {
  key = "tan_rumsen_fizzlebrack", id = 16417, name = "Rumsen Fizzlebrack", gender = "male",
  role = "merchant", tier = "quest",
  temper = { "pushy", "shrewd" }, values = { "profit", "cartel" },
  notices = { "reputation", "class" },
  impression = {
    first = "A goblin with a ledger in one hand, already counting what you owe him.",
    third = "{name} met Rumsen Fizzlebrack, who sells forgiveness on the Cartel's behalf outside Gadgetzan.",
  },
  greetings = {
    { id = "g_default", text = "Hey there, pal! Somebody upset the bruisers, did they? Don't worry, Rumsen fixes everything, for a reasonable fee." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite repeat customer! Still owe the Cartel a favour or two? Let's talk." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "A rogue! I bet you're the type who's always needin' my services, ain't ya?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rumsen Fizzlebrack, Steamwheedle Cartel, Department of Second Chances. Anybody who's made the goblins of Tanaris mad can come to me and work it off, see, because grudges are bad for business and so's an empty warehouse." } },
      again = { { id = "h_again", text = "What else, buddy? Time is money, and you're spendin' mine." }, { id = "h_again2", text = "Talk to me, pal. I'm listening, and I'm billing." } },
      choices = {
        { text = "How do I get back in the Cartel's good books?", next = "how" },
        { text = "Why do you need mageweave and flux?", next = "materials" },
        { text = "What happens if I stay on their bad side?", next = "bad" },
        { text = "I'm on the war at sea, as you asked.", next = "war", when = { questActive = TODO_QUEST("War at Sea") } },
        { text = "I'll pass for now.", next = "END" },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "Easy, you bring me mageweave and strong flux, I put in a good word, and the bruisers stop tryin' to break your knees. Do it enough times and you're a valued customer again, no hard feelings, only paperwork." } },
      choices = {
        { text = "That sounds like extortion.", next = "extortion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    extortion = {
      lines = { { id = "e_default", text = "Extortion's an ugly word, friend; I prefer reconciliation services. You broke something, you pay for it, and everybody walks away happy and nobody walks away limpin'." } },
      choices = {
        { text = "Fair's fair. I'll pay what I owe.", next = "BACK", reply = "Now that's what I like to hear! A customer with integrity, rare as hen's teeth.", fx = { align = { order = 1 } } },
        { text = "I'll take my chances with the bruisers.", next = "BACK", reply = "Your funeral, pal, and I mean that literally, so the offer stands.", fx = { align = { order = -1 } } },
      },
    },
    materials = {
      lines = { { id = "m_default", text = "Sails and guns, pal, sails and guns. The Bloodsail Buccaneers have been raiding our ships off the coast, and you don't fight pirates with harsh language." } },
      choices = {
        { text = "Tell me about these pirates.", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "Bloodsail scum, the lot of 'em, down at Lost Rigger Cove and all along the south coast. They rob our cargo, sink our ships, and don't even leave a receipt." } },
      choices = { { text = "Sounds like they need stopping. Something else.", next = "BACK" } },
    },
    bad = {
      lines = { { id = "b_default", text = "Then every goblin town from Booty Bay to Ratchet gets real unfriendly, real fast. No trading, no bank, and the guards develop a sudden interest in your face." } },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
    war = {
      lines = { { id = "w_default", text = "That's what I like to see! Every bolt of cloth is another sail, every bit of flux is another cannon, and every cannon is one less pirate. Keep it coming!" } },
      choices = { { text = "I'll keep at it.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Steamwheedle man through and through. Born in a ledger, I like to say." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, pal, unless there's coin in it." } },
  },
}
