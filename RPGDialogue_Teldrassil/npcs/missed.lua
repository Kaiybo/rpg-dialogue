-- Shadowglen's missed folk: the merchants who outfit the young beneath Aldrassil (Andiss, Dellylah,
-- Freja Nightwing, Janna Brightmoon, Keina, Khardan Proudblade, Lyrai) and Orenthil Whisperwind, who
-- welcomes newcomers to the glen. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Andiss: armorer and shieldcrafter at Aldrassil.
P:NPC {
  key = "andiss", id = TODO_NPC("Andiss"), name = "Andiss", title = "Armorer & Shieldcrafter", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "steady", "plain" }, values = { "protective", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Andiss sells armor and shields beneath Aldrassil, and he looks at every young elf who passes as though measuring them for a breastplate. He is one of the few men in the glen who talks about war as a trade.",
    third = "{name} met Andiss, the armorer and shieldcrafter of Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Stand still a moment and let me see how that armor sits on you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and in one piece, which speaks well of my shields or of your feet." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is hanging off you in pieces, {class}. Have it mended before you go back among the spiders, because pride turns no fangs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior, and a young one. I am Andiss, and I make the shields that will stand between you and everything in this glen that bites, so we ought to know each other." },
        { id = "h_default", text = "I am Andiss, and I make armor and shields for the young who train beneath Aldrassil. Our people once had ten thousand years to learn caution, and now they must learn it in a season, so I sell them the next best thing." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of an armorer?" },
        { id = "h_again2", text = "Speak, then. The mail will not rust while we talk." },
      },
      choices = {
        { text = "Show me your armor and shields.", next = "BUSINESS" },
        { text = "A season instead of ten thousand years?", next = "season" },
        { text = "Few of our people carry shields.", next = "shields" },
        { text = "How should a warrior carry a shield?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Elune keep you, Andiss.", next = "END" },
      },
    },
    season = {
      lines = { { id = "s_default", text = "We gave up our immortality on Hyjal to break the Legion, and I do not regret the bargain. Still, a mortal people cannot spend its young as carelessly as an undying one could, and somebody has to dress them for it.", fx = { learn = { "nordrassil" } } } },
      choices = {
        { text = "Do the young understand that?", next = "young" },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    young = {
      lines = { { id = "y_default", text = "Some of them do, and the rest learn it in Shadowthread Cave, where the webwood spiders are patient teachers. I would rather they learned it from me, with a shield already on their arm." } },
      choices = { { text = "I will remember it. Something else.", next = "BACK" } },
    },
    shields = {
      lines = { { id = "sh_default", text = "That is true, and the Sentinels would tell you a glaive and a quick step serve better. A quick step fails the day you are tired, though, and a shield is never tired, so I go on making them for those wise enough to ask." } },
      choices = { { text = "A fair answer. Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "Hold it high and close, and let the blow slide off it instead of meeting it square. Alyissia will teach you the rest by the tree, and she is a harder teacher than I am a merchant." } },
      choices = { { text = "I will seek her out. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have made armor since before this tree was planted. The work has not changed, only how much it matters." } },
    teldrassil = { { id = "tp_tel", text = "It is a young tree and a proud one, and I would not have grown it without a blessing. But it is where we live now, so I guard those who live on it." } },
    _none = { { id = "tp_none", text = "That is no matter of mail or shields, so I cannot help you. Ask Conservator Ilthalaine, who keeps watch over the whole glen." } },
  },
}

-- Dellylah: food and drink at Aldrassil.
P:NPC {
  key = "dellylah", id = TODO_NPC("Dellylah"), name = "Dellylah", title = "Food & Drink", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "warm", "fussing" }, values = { "kind", "hospitable" },
  notices = { "weary", "class" },
  impression = {
    first = "Dellylah keeps the food and drink at Aldrassil and frets over every novice who trains on an empty stomach. She seems to believe that most of the world's troubles begin with someone who skipped a meal.",
    third = "{name} met Dellylah, who sells food and drink beneath Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, young one. Have you eaten anything today, or have you been chasing boars since moonrise?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, and thinner than when you left, I would swear to it." },
  },
  notice = {
    { id = "n_hurt", cat = "weary", when = { resSick = true },
      text = "You have the grey look of someone lately back from the spirits, child. Sit down, and eat something before you go one step further." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Dellylah, and I keep bread, fruit and cool water for everyone who trains beneath Aldrassil. The trainers fill their heads, and I see that there is something in their bellies to hold it all up." },
      },
      again = {
        { id = "h_again", text = "Is there something more, dear one?" },
        { id = "h_again2", text = "Ask away, and take a little bread while you do." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Where does your food come from?", next = "food" },
        { text = "The novices seem to keep you busy.", next = "novices" },
        { text = "What does a druid eat before a long meditation?", next = "druid", when = { class = "DRUID" } },
        { text = "Thank you, Dellylah.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "The fruit grows on Teldrassil's own boughs, and the water comes from the pool below the falls, which is as sweet as any moonwell and far less solemn. The bread I bake myself, since no one else in the glen has the patience." } },
      choices = {
        { text = "Does everything on this tree grow so well?", next = "grow" },
        { text = "Something else, if you would.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "gr_default", text = "It grows quickly, which is not always the same thing. The druids mutter about it, and I have noticed the boars are fatter and angrier every season, so I count my apples and keep my own counsel.", fx = { learn = { "teldrassil" } } } },
      choices = { { text = "A wise habit. Something else.", next = "BACK" } },
    },
    novices = {
      lines = { { id = "n_default", text = "They run off to the grells and the spiders without so much as a crust, and then they wonder why their arms shake. Dirania mends their hurts afterwards, and between her bandages and my bread we keep most of them upright." } },
      choices = { { text = "They are lucky to have you both.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "d_default", text = "As little as they can manage, if they follow Mardant's example, and then they come to me half starved when it is over. Take some fruit up the tree with you, and do not tell him it was my idea." } },
      choices = { { text = "It stays between us. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fed this glen since the first houses were shaped here. It is small work, and I have never wanted any other." } },
    teldrassil = { { id = "tp_tel", text = "It feeds us well, and I am grateful. I only wish it did not make the beasts so quarrelsome." } },
    _none = { { id = "tp_none", text = "Oh, I would not know about that, dear one. Ask one of the trainers, and come back when you are hungry." } },
  },
}

-- Freja Nightwing: leather armor at Aldrassil.
P:NPC {
  key = "freja_nightwing", id = TODO_NPC("Freja Nightwing"), name = "Freja Nightwing", title = "Leather Armor Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "quiet", "exacting" }, values = { "craft", "nature" },
  notices = { "class", "pet" },
  impression = {
    first = "Freja Nightwing sells leather armor at Aldrassil and can tell by the way a novice walks whether they will be heard coming. She speaks softly, as if loud voices might crease the hides.",
    third = "{name} met Freja Nightwing, the leather armor merchant of Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Elune light your path. You walk heavily for one of us, but good leather will forgive a great deal." },
    { id = "g_back", when = { metBefore = true }, text = "I heard you before I saw you, {class}, though you are quieter than you were." },
  },
  notice = {
    { id = "n_cat", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} back from the racks, if you please. A beast smells its cousins on the leather, and some of them take it badly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quiet", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "I am Freja Nightwing, and you are the sort I make my leathers for, {class}. A coat that creaks is worse than no coat, so everything on these racks has been worn in the woods before it was hung here." },
        { id = "h_default", text = "I am Freja Nightwing, and I sell leather armor to those who would rather not be heard. Cloth tears and mail sings like a wind chime, but well-cured leather keeps its secrets." },
      },
      again = {
        { id = "h_again", text = "What else, then? Speak softly, if you would." },
        { id = "h_again2", text = "I am listening, as I always am." },
      },
      choices = {
        { text = "Show me your leathers.", next = "BUSINESS" },
        { text = "Where do the hides come from?", next = "hides" },
        { text = "You can truly hear how someone walks?", next = "walk" },
        { text = "Walk in moonlight, Freja.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "From the thistle boars and the nightsabers of this glen, taken by hunters who use the whole animal and thank it afterwards. Terunne teaches the skinning nearby, and I will not buy a hide that was cut carelessly." } },
      choices = {
        { text = "How do you know a careless cut?", next = "cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "A hide remembers the knife, {class}, and a hurried hand leaves it thin in one place and thick in another. Such leather fails exactly where the claw lands, and I would not sell that to a child of this glen." } },
      choices = { { text = "That is a high standard. Something else.", next = "BACK" } },
    },
    walk = {
      lines = { { id = "w_default", text = "I was a scout for a long age before I was a merchant, and the ear does not forget. The young ones stamp about like kodos their first season, and by their second the glen has taught them better or the grells have." } },
      choices = { { text = "I will try to step lighter. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I scouted the forests of the mainland for centuries. Now I dress the ones who will do it after me." } },
    furbolgs = { { id = "tp_fur", text = "The Gnarlpine wear hides badly cured and worse kept. You can smell their camps from the road to Dolanaar." } },
    _none = { { id = "tp_none", text = "That is not something the hides have told me. Ask the Conservator, who hears more than I do." } },
  },
}

-- Janna Brightmoon: clothier at Aldrassil.
P:NPC {
  key = "janna_brightmoon", id = TODO_NPC("Janna Brightmoon"), name = "Janna Brightmoon", title = "Clothier", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "gracious", "particular" }, values = { "devout", "craft" },
  notices = { "class" },
  impression = {
    first = "Janna Brightmoon sells robes and cloth at Aldrassil and smooths every fold as if the garment were bound for the Temple of the Moon. She has opinions about hems that she delivers very kindly.",
    third = "{name} met Janna Brightmoon, the clothier of Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Come closer and let me see what you are wearing, for I fear the worst." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, {class}. You have grass stains to the knee, I see, so the glen has been keeping you busy." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A servant of Elune ought not to go about in a robe frayed at the sleeve. Shanda will tell you the Goddess sees the heart, but the rest of us see the sleeve." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Janna Brightmoon, and I clothe the novices of Aldrassil in something better than what they arrived in. A robe is the first thing anyone knows of you, and I like our young to be known well." },
      },
      again = {
        { id = "h_again", text = "What more can I tell you?" },
        { id = "h_again2", text = "Ask, and mind the bolts behind you." },
      },
      choices = {
        { text = "Show me your cloth.", next = "BUSINESS" },
        { text = "What makes a good robe?", next = "robe" },
        { text = "You sound as if you sewed for the Temple.", next = "temple" },
        { text = "Would the Sisterhood wear your robes?", next = "priest", when = { class = "PRIEST" } },
        { text = "Elune be with you.", next = "END" },
      },
    },
    robe = {
      lines = { { id = "r_default", text = "It should move when you move and be forgotten the rest of the time. I weave ours light, because a priestess who trips on her own hem in front of a grell has not been served well by her clothier." } },
      choices = {
        { text = "Do novices trip often?", next = "trip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trip = {
      lines = { { id = "t_default", text = "More often than they admit, and I mend the proof of it every evening. The grellkin tear at whatever trails behind, which is the best argument for a short hem that I have ever been handed." } },
      choices = { { text = "I will keep mine short. Something else.", next = "BACK" } },
    },
    temple = {
      lines = { { id = "te_default", text = "I did, long ago, when the temples stood on the mainland and the Sisterhood had more sisters than it could dress. Now Darnassus has its own weavers, and I am content to begin the young ones properly here.", fx = { learn = { "sisterhood_of_elune" } } } },
      choices = { { text = "A good beginning matters. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "p_default", text = "They wore plainer once, and were glad of it. Wear my robe until Darnassus gives you a finer one, and when the High Priestess asks who dressed you, you may tell her honestly." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have woven for our people longer than Darnassus has stood. The thread changes, and the hands do not." } },
    sisterhood_of_elune = { { id = "tp_sis", text = "They serve the Goddess and lead our people. Shanda teaches their first prayers here, beneath the tree." } },
    _none = { { id = "tp_none", text = "I am afraid that lies outside my loom. Conservator Ilthalaine would be the one to ask." } },
  },
}

-- Keina: bowyer at Aldrassil.
P:NPC {
  key = "keina", id = TODO_NPC("Keina"), name = "Keina", title = "Bowyer", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "keen", "teasing" }, values = { "skill", "patience" },
  notices = { "class" },
  impression = {
    first = "Keina makes and sells bows at Aldrassil, and she strings one while she talks without ever looking at her hands. She teases the novices about their aim, and then quietly shows them how to fix it.",
    third = "{name} met Keina, the bowyer of Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Tell me truly, have you ever hit what you were aiming at?" },
    { id = "g_back", when = { metBefore = true }, text = "The archer returns. I trust the boars of the glen are fewer for it, and the trees unharmed." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You hold yourself like someone waiting for a shot. Ayanna has been at you already, I see, and she does not waste her time on the hopeless." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Keina, and I make the bows that Ayanna's students learn on. Yours will pull harder than you like at first, hunter, and by the time it feels easy you will be ready for a better one." },
        { id = "h_default", text = "I am Keina, and I make bows for the young of this glen, along with the arrows they lose in the undergrowth. A bow is a patient weapon, which is why it suits our people better than it suits most." },
      },
      again = {
        { id = "h_again", text = "Something more? My hands can work while we speak." },
        { id = "h_again2", text = "Go on, I am only stringing." },
      },
      choices = {
        { text = "Show me your bows and arrows.", next = "BUSINESS" },
        { text = "What wood do you use?", next = "wood" },
        { text = "My aim could use some help.", next = "aim" },
        { text = "Good hunting, Keina.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Fallen boughs from Teldrassil itself, and only fallen ones, for I would no sooner cut this tree than cut my own arm. The wood is young and springy, and it wants more seasoning than the old forests' timber ever did." } },
      choices = {
        { text = "You miss the old forests.", next = "old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "I miss the ash of Ashenvale, which made a bow that would outlast its archer. Now the orcs are felling it by the wagonload for their walls, and I try not to think what a waste that is.", fx = { learn = { "warsong" } } } },
      choices = { { text = "That is a bitter thought. Something else.", next = "BACK" } },
    },
    aim = {
      lines = { { id = "a_default", text = "Then stop looking at the arrow and look at the boar, because your hands already know where your eyes are. Loose on the breath out, and if you still miss, at least miss quietly so the next shot is not wasted too." } },
      choices = {
        { text = "Miss quietly. I can manage that.", next = "BACK", reply = "Most can, and it is where every good archer begins. Come back when the quiver is empty." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have made bows since the Long Vigil began, and shot them longer. The making is the harder art." } },
    warsong = { { id = "tp_war", text = "The orcs cut Ashenvale as if trees were weeds. The Sentinels answer them, and I send bows when I can." } },
    _none = { { id = "tp_none", text = "You have loosed that question at the wrong target, friend. Try the Conservator." } },
  },
}

-- Khardan Proudblade: weaponsmith at Aldrassil.
P:NPC {
  key = "khardan_proudblade", id = TODO_NPC("Khardan Proudblade"), name = "Khardan Proudblade", title = "Weaponsmith", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "proud", "formal" }, values = { "honor", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Khardan Proudblade sells blades and staves at Aldrassil and hands each one over hilt first, with a small bow, as though it were an heirloom. He does not think a weapon should ever be bought lightly.",
    third = "{name} met Khardan Proudblade, the weaponsmith of Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. Choose slowly here, for a blade chosen in haste is drawn in haste." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and your weapon has seen use. Let me look at the edge before you tell me the tale." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { ["not"] = { race = "NightElf" } },
      text = "An outlander in Shadowglen is a rare sight. You are welcome at my rack, though I ask that you treat what you buy here with respect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "I am Khardan Proudblade, and you are one who will live or die by what I sell, {class}. I forged and chose every piece on this rack with that in mind, and I ask you to choose with the same care." },
        { id = "h_default", text = "I am Khardan Proudblade, and I arm the young of Aldrassil with daggers, swords and staves. They are plain weapons, honestly made, and each one has turned a grell's claw before now." },
      },
      again = {
        { id = "h_again", text = "Is there more you would know?" },
        { id = "h_again2", text = "Ask it. A weaponsmith has time for honest questions." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why hand a blade over so solemnly?", next = "solemn" },
        { text = "The Sentinels fight with glaives, not swords.", next = "glaives" },
        { text = "Which blade suits a beginner?", next = "beginner", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "Until we meet again.", next = "END" },
      },
    },
    solemn = {
      lines = { { id = "s_default", text = "Because whoever takes it from me is promising to stand between our people and harm. For ten thousand years the women of the Sentinels kept that promise while the men slept in the Dream, and I do not forget what it cost them.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "And now the men have woken.", next = "woken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woken = {
      lines = { { id = "wo_default", text = "They have, and many of our sons take up the blade who once would only have taken up the staff. I am glad of it, for the world that woke us will not be held back by one half of a people." } },
      choices = { { text = "Well said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    glaives = {
      lines = { { id = "g_glaive", text = "So they do, and the moonglaive is the finest weapon our people ever shaped. It is also the surest way I know for a novice to lose a hand, so I begin them on a short sword and let the Sentinels finish the lesson." } },
      choices = { { text = "A sensible order. Something else.", next = "BACK" } },
    },
    beginner = {
      lines = { { id = "b_default", text = "Take the one that feels a little too light, because your arm will tire long before the fight ends. Alyissia will tell you the same by the tree, and Frahun will tell you to take two and hide them both." } },
      choices = { { text = "I will take that counsel. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family has kept the blades of our people since before the Sundering. The name is older than I am, and I try to deserve it." } },
    sentinels = { { id = "tp_sen", text = "They are the shield of the kaldorei, and Tyrande's own. Half the blades I sell will one day hang at a Sentinel's side." } },
    _none = { { id = "tp_none", text = "On that I have nothing worth your hearing. Tenaron Stormgrip, at the top of Aldrassil, sees further than I do." } },
  },
}

-- Lyrai: general supplies at Aldrassil.
P:NPC {
  key = "lyrai", id = TODO_NPC("Lyrai"), name = "Lyrai", title = "General Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowglen" }, temper = { "practical", "amused" }, values = { "prepared", "kind" },
  notices = { "class" },
  impression = {
    first = "Lyrai sells the plain necessities at Aldrassil, the pouches and waterskins that novices never think of until they are halfway to the spider cave. She has stopped being surprised by what people forget.",
    third = "{name} met Lyrai, who sells general supplies beneath Aldrassil.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Let me guess, you set out this morning with a weapon and nothing whatever to carry things in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {class}? Something has run out, or something has filled up, and either way I can help." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and with a quiver that is half empty already. Keina makes the arrows, but I sell the pouch that keeps them dry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Lyrai, and I sell everything the trainers forget to mention, which is to say bags, water, and the small things that keep a journey from becoming a hardship. Nobody sings of the waterskin, but nobody travels far without one." },
      },
      again = {
        { id = "h_again", text = "What else have you forgotten?" },
        { id = "h_again2", text = "Ask, and I will see whether I have it on a shelf." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What do novices forget most?", next = "forget" },
        { text = "I mean to leave the glen soon.", next = "leaving" },
        { text = "My thanks, Lyrai.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Somewhere to put what they gather, nearly every time. Melithar sends them after the grellkin, and they come back with their arms full of fel moss and nowhere to put it but their own pockets.", fx = { learn = { "fel_moss" } } } },
      choices = {
        { text = "Fel moss in the pockets sounds unwise.", next = "moss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moss = {
      lines = { { id = "m_default", text = "It is unwise, and it stains besides. The stuff has an ill feeling to it that I do not like in my shop, so I sell them a pouch and ask them to carry it straight to whoever wanted it." } },
      choices = { { text = "I will keep it well away from you.", next = "BACK" } },
    },
    leaving = {
      lines = { { id = "l_default", text = "Then follow the road north and east out of the glen, and it will bring you to Dolanaar before your feet complain. Aldia keeps a shop there much like mine, so you need not carry the whole of Shadowglen on your back." } },
      choices = {
        { text = "What lies along the road?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Nightsabers in the brush, mostly, and the odd webwood spider that has wandered from the cave. Keep to the stones and you will see lamps ahead long before you see trouble." } },
      choices = { { text = "That is good to know. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept this shop since Shadowglen was first settled. It is a small place, and I know all of it." } },
    fel_moss = { { id = "tp_moss", text = "The grellkin carry it, and nobody can tell me where they find it. Ask Melithar Staghelm, who collects the stuff." } },
    _none = { { id = "tp_none", text = "I sell pouches, friend, and answers of that sort are not on my shelves. Try the Conservator." } },
  },
}

-- Orenthil Whisperwind: welcomes newcomers in Shadowglen (Classic: the "Welcome!" gift voucher).
P:NPC {
  key = "orenthil_whisperwind", id = TODO_NPC("Orenthil Whisperwind"), name = "Orenthil Whisperwind", gender = "male",
  bible = "bibles/missed.md", role = "greeter", tier = "service",
  communities = { "shadowglen" }, temper = { "courteous", "serene" }, values = { "hospitable", "tradition" },
  notices = { "race", "level" },
  impression = {
    first = "Orenthil Whisperwind stands in Shadowglen to welcome those newly come to Aldrassil, and he does it with the grave courtesy of a host at a very old feast. He seems honestly pleased by every arrival.",
    third = "{name} met Orenthil Whisperwind, who welcomes newcomers to Shadowglen.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, and be welcome in Shadowglen. It gladdens me to see another face beneath Aldrassil." },
    { id = "g_voucher", when = { questActive = TODO_QUEST("Welcome!") }, text = "Ah, you carry a voucher with my name upon it. Be welcome, and let me see it, for I have been expecting you." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again, {name}. The glen has been kind to you, I hope." },
  },
  notice = {
    { id = "n_grown", cat = "level", when = { minLevel = 12 },
      text = "You have grown a great deal since you last stood in this glen. It is a rare pleasure to see what becomes of those I welcomed." },
    { id = "n_outlander", cat = "race", when = { ["not"] = { race = "NightElf" } },
      text = "A guest from beyond the sea! Few of the Alliance find their way to Shadowglen, and you honor us by making the climb." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Orenthil Whisperwind, and it falls to me to welcome those who begin their path here. Our people were a long time sleeping and a long time alone, so I think every new arrival deserves to be greeted properly." },
      },
      again = {
        { id = "h_again", text = "What else may I tell you of the glen?" },
        { id = "h_again2", text = "Ask freely. A host has no finer duty." },
      },
      choices = {
        { text = "Where should a newcomer begin?", next = "begin" },
        { text = "Why does a welcome matter so much to you?", next = "why" },
        { text = "About this voucher I carry.", next = "voucher", when = { questActive = TODO_QUEST("Welcome!") } },
        { text = "Thank you for the welcome.", next = "END" },
      },
    },
    begin = {
      lines = { { id = "b_default", text = "With Conservator Ilthalaine, who stands before the great tree and watches over the balance of the glen. He will have work for you, and the trainers within Aldrassil will have lessons when the work is done." } },
      choices = {
        { text = "What troubles the balance here?", next = "balance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance = {
      lines = { { id = "ba_default", text = "The beasts have multiplied beyond what the glen can bear, and the grellkin have grown bold among the roots. The Conservator will explain it better than I can, for I only greet people and he must mend things." } },
      choices = { { text = "Then I will go to him. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "For ten thousand years we kept our borders closed and called it wisdom. Then the Legion returned, and we learned beside humans and orcs on Hyjal that no people stands alone, so I practise the lesson daily.", fx = { learn = { "burning_legion" } } } },
      choices = { { text = "A lesson worth keeping. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    voucher = {
      lines = { { id = "v_default", text = "It is an old courtesy to those who came early and gave generously, and I am glad to honor it. Hand it to me when you are ready, and we will see it done properly." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have welcomed travellers to our groves in one age or another for longer than I care to count. It is the gentlest duty I have held." } },
    teldrassil = { { id = "tp_tel", text = "It is our home now, grown by the druids after Nordrassil was spent. Shadowglen is its quietest bough." } },
    _none = { { id = "tp_none", text = "Forgive me, but that is beyond what a greeter knows. Tenaron Stormgrip, atop Aldrassil, may be able to answer you." } },
  },
}
