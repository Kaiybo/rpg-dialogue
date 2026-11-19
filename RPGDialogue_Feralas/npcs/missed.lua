-- Feralas, the missed folk (Alliance side): the quiet trades of Feathermoon Stronghold (Bethan Bluewater,
-- Brannock, Savanne, Dulciea Frostmoon, Faralorn, Kylanna Windwhisper, Logannas, Mardrack Greenwell) and the
-- two watchers at the Twin Colossals (Marli Wishrunner, Kalin Windflight). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bethan Bluewater: in the druids' tree-house at Feathermoon Stronghold.
P:NPC {
  key = "bethan_bluewater", id = TODO_NPC("Bethan Bluewater"), name = "Bethan Bluewater", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "feathermoon" }, temper = { "quiet" }, values = { "patient", "rooted" },
  notices = { "class", "race" },
  impression = {
    first = "Bethan Bluewater keeps to the druids' tree-house at Feathermoon and watches the sea through its windows as though it owed her an answer. She speaks softly and takes her time, and I had the feeling the island would have to sink before she left it.",
    third = "{name} met Bethan Bluewater, a night elf who keeps to the druids' tree-house at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. You have come a long way over the water to stand in so quiet a room." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and the tide has turned twice since you were last here. Sit a while, if you wish." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright on the water tonight. It is the best hour to be on this island, and the hour the naga like best as well." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You walk as the druids do, with one foot in the Dream. Quintis will want to speak with you, though he will pretend he is too busy." },
    { id = "n_young", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Your people measure a journey in days, I am told. I have been watching this one shore for longer than your kingdoms have had names, and I have not finished." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Bethan Bluewater. I keep this house in order for the druids and I watch the water, and between the two I am rarely idle, though it may not look so to one in a hurry." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The tide is in no haste, and neither am I." },
        { id = "h_again2", text = "There was something more, I think." },
      },
      choices = {
        { text = "What do you watch the water for?", next = "water" },
        { text = "This is the druids' house, then.", next = "house" },
        { text = "You don't seem troubled by the naga.", next = "naga" },
        { text = "Elune light your path.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "For whatever it brings, which is the only honest answer. Wreckage from the Isle of Dread, sea giants wading where they did not wade last season, and now and then a ship that has no business being so far south." } },
      choices = {
        { text = "And what has it brought lately?", next = "lately" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lately = {
      lines = { { id = "l_default", text = "More naga than I have seen since the Sentinels first raised these walls. They gather in the ruins at the island's northern end, and they are too patient about it for my liking." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    house = {
      lines = { { id = "ho_default", text = "It is Quintis Jonespyre's more than anyone's, and he fills it with seeds and stones and questions. I see that he eats, and that nothing he is studying is left where a visitor may sit on it." } },
      choices = {
        { text = "What is he studying now?", next = "studying" },
        { text = "Something else.", next = "BACK" },
      },
    },
    studying = {
      lines = { { id = "s_default", text = "A grain from the crater far to the south, which Darnassus wants in great quantity and will not say why. He frowns at it for hours, and I have learned not to ask him before he has had his tea." } },
      choices = { { text = "A wise rule. Something else.", next = "BACK" } },
    },
    naga = {
      lines = { { id = "n_default", text = "I am troubled by them, but I will not be moved by them. This island has belonged to them once already, when it had another name, and General Feathermoon did not win it back so that I might flinch at a fin in the surf." } },
      choices = {
        { text = "Then I'm glad you are staying.", next = "BACK", reply = "As am I. Someone should know this shore well enough to notice when it changes.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Feralas with the Sentinels when the stronghold was raised, and I have seen no reason to live anywhere else since." } },
    _none = { { id = "tp_none", text = "That has not washed up on my shore. Ask Quintis, or one of the General's officers." } },
  },
}

-- Savanne: fishing supplies, beside Brannock.
P:NPC {
  key = "savanne", id = TODO_NPC("Savanne"), name = "Savanne", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "wry" }, values = { "honest", "practical" },
  notices = { "craft" },
  impression = {
    first = "Savanne sells lines, hooks and bait at Feathermoon, and she will tell you plainly which of them you do not need. She and the fishing master Brannock argue about bait like an old married pair, though neither would thank me for writing it down.",
    third = "{name} met Savanne, who sells fishing supplies at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. If you have come for tackle, tell me first what you mean to catch, and I will save you the price of three things you do not need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I hope with a tale of the one that did not get away." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You hold yourself like someone who has lost a good fish and not forgiven it. I can help with the line, if not with the grudge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Savanne, and I keep the stronghold in hooks, line and bait. Brannock teaches the art and I supply the means, and between us nobody on this island need go hungry." },
      },
      again = {
        { id = "h_again", text = "Was there something more you needed?" },
        { id = "h_again2", text = "Ask, then. The fish will wait, as they always do." },
      },
      choices = {
        { text = "What does a fisher need for these waters?", next = "need" },
        { text = "You and Brannock work side by side.", next = "brannock" },
        { text = "Do the naga trouble your trade?", next = "naga" },
        { text = "Fair winds, Savanne.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "A strong line before anything else, because the redgill here fight harder than they look. After that a little patience, which I cannot sell you, and which Brannock claims he can teach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brannock = {
      lines = { { id = "b_default", text = "For longer than either of us cares to count. He is the finest fisher I know, and he is entirely wrong about nightcrawlers, and I tell him both things whenever he will listen." } },
      choices = {
        { text = "Who is right about the bait?", next = "bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "I am, naturally. A bright lure brings the yellowtail up from the reef faster than any worm, and I have a century of full baskets to prove it. He will tell you otherwise, and you may smile and nod." } },
      choices = { { text = "I'll smile and nod. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    naga = {
      lines = { { id = "na_default", text = "They cut the nets we used to set off the northern point, and so we set no nets there now. It is a small loss beside what the Sentinels risk each night, and I do not complain of it where they can hear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept fishers supplied since the stronghold was a row of tents. The trade is quiet, and I like it so." } },
    _none = { { id = "tp_none", text = "That is beyond my baskets, I fear. Ask at the inn; Shyria hears everything." } },
  },
}

-- Dulciea Frostmoon: cloth armor merchant.
P:NPC {
  key = "dulciea_frostmoon", id = TODO_NPC("Dulciea Frostmoon"), name = "Dulciea Frostmoon", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "gracious" }, values = { "careful", "proud" },
  notices = { "class", "kit" },
  impression = {
    first = "Dulciea Frostmoon sells robes and cloth at Feathermoon Stronghold, and she folds each one as though it were going to a temple. She looked at my travelling clothes with real sorrow.",
    third = "{name} met Dulciea Frostmoon, the cloth armor merchant of Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. The salt air has not been kind to what you are wearing, and I say so only because I can mend the matter." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I see the forest has added a few new tears since we last spoke." },
  },
  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth by calling and not by poverty, which I am glad to see. Too few who come through this garrison understand that a robe is armor of another kind." },
    { id = "n_tailor", cat = "kit", when = { profession = "Tailoring" },
      text = "A tailor's eye went to my seams before it went to my face. Look as closely as you like, for I am not ashamed of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Dulciea Frostmoon. In a stronghold full of mail and glaives I sell silk and woven cloth, and you would be surprised how many Sentinels come to me when their watch is over." },
      },
      again = {
        { id = "h_again", text = "What else may I tell you?" },
        { id = "h_again2", text = "Speak freely. Folding can wait." },
      },
      choices = {
        { text = "Who buys robes in a garrison?", next = "who" },
        { text = "How does cloth fare in this wet forest?", next = "wet" },
        { text = "Cloth won't turn an ogre's club.", next = "club" },
        { text = "Good day, Dulciea.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The priestesses, the druids in the tree-house, and every soldier who wishes to be something other than a soldier for an evening. Even General Feathermoon does not sleep in her armor, whatever the recruits believe." } },
      choices = { { text = "I'll keep that between us. Something else.", next = "BACK" } },
    },
    wet = {
      lines = { { id = "we_default", text = "Poorly, unless it is treated, and so I treat every bolt with oils before it is cut. Feralas rots what it cannot grow over, and it has been trying to grow over this island since we arrived." } },
      choices = {
        { text = "Where does your cloth come from?", next = "from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "f_default", text = "By ship from Auberdine and Darnassus when the sea allows, which is less often than I would like. When it does not, I make do, and I have learned to make do rather well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    club = {
      lines = { { id = "c_default", text = "No, it will not, and I would never tell you that it would. Those who wear my robes mean to end the argument before the club arrives, and the Gordunni have learned to their cost that some of them can." } },
      choices = { { text = "A fair answer. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have worked cloth for a very long time, in Ashenvale first and then here. A garrison needs softness more than it knows." } },
    _none = { { id = "tp_none", text = "I cannot speak to that. My knowledge is in thread, and it ends where the thread does." } },
  },
}

-- Faralorn: general supplies.
P:NPC {
  key = "faralorn", id = TODO_NPC("Faralorn"), name = "Faralorn", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "orderly" }, values = { "prepared" },
  notices = { "weary", "race" },
  impression = {
    first = "Faralorn keeps Feathermoon's general stores, and he counts every water skin twice before a patrol goes out. He asked where I was bound before he would sell me anything, and then told me what I had forgotten.",
    third = "{name} met Faralorn, who sells general supplies at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Tell me where in Feralas you are bound, and I will tell you what you have forgotten to pack." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back whole, so you must have packed well. What have you run short of?" },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your gear has taken a beating that I can see from here. The mainland does that, and I would see the smith before you cross again." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf on Sardor! Pratt McGrubben will be pleased, for he has been complaining that nobody here understands a proper breakfast." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Faralorn, and anything a traveller needs that is not a weapon passes across my counter. The Sentinels provision here before every crossing to the mainland, and I have yet to send one out short." },
      },
      again = {
        { id = "h_again", text = "What else do you need to know before you go?" },
        { id = "h_again2", text = "Go on. I am listening while I count." },
      },
      choices = {
        { text = "What do travellers forget most?", next = "forget" },
        { text = "How do supplies reach an island?", next = "ships" },
        { text = "The Sentinels seem stretched thin.", next = "thin" },
        { text = "I'm well packed. Farewell.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Water, though they are surrounded by it, because none of it on the western shore is fit to drink. After that it is rope, and after that it is the sense to turn back before dusk when the Woodpaw are about." } },
      choices = { { text = "I'll carry all three. Something else.", next = "BACK" } },
    },
    ships = {
      lines = { { id = "s_default", text = "The boat from the Forgotten Coast brings what the mainland can spare, and the hippogryphs bring what cannot wait. Fyldren Moonfeather grumbles each time I ask her riders to carry a crate, and each time she lets them." } },
      choices = {
        { text = "And when the boat is late?", next = "late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    late = {
      lines = { { id = "l_default", text = "Then Mardrack and I sit down with our ledgers and decide what the garrison will go without. It has never yet been arrows or bread, and I intend that it never shall be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thin = {
      lines = { { id = "t_default", text = "They are, and you are observant to see it. There are naga on our own island, ogres in the highlands and gnolls on the road, and only so many glaives to send against all three." } },
      choices = { { text = "Then they can use my help. Something else.", next = "BACK", reply = "They can, and they will say so less gracefully than I do. Speak with the General's officers.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept the stores for the Sentinels in Ashenvale before this, and I came south with General Feathermoon's expedition." } },
    _none = { { id = "tp_none", text = "That is not in my stores or my ledgers. Ask Ginro Hearthkindle, who reads every dispatch." } },
  },
}

-- Logannas: alchemy supplies, beside Kylanna.
P:NPC {
  key = "logannas", id = TODO_NPC("Logannas"), name = "Logannas", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "mild" }, values = { "careful" },
  notices = { "craft" },
  impression = {
    first = "Logannas sells vials and alchemical stock beside Kylanna Windwhisper's table, and he wraps each piece of glass in moss before he hands it over. He seems content to stand in her shadow, and to keep it well supplied.",
    third = "{name} met Logannas, who sells alchemy supplies at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Mind the crates by your feet, for every one of them is glass and it came a very long way." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I have set a few vials aside against breakage, as I always do." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, by the look of your satchel. Then you will know how quickly a day's work runs through a case of vials." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Logannas. Mistress Kylanna teaches the art, and I see that her students have glass to practise in and something to put in it. It is humble work, though nothing here would be brewed without it." },
      },
      again = {
        { id = "h_again", text = "Is there anything else I can tell you?" },
        { id = "h_again2", text = "Please, go on." },
      },
      choices = {
        { text = "How do you keep glass whole out here?", next = "glass" },
        { text = "What is it like working beside Kylanna?", next = "kylanna" },
        { text = "Her students must break a great deal.", next = "students" },
        { text = "I'll mind the crates. Farewell.", next = "END" },
      },
    },
    glass = {
      lines = { { id = "g_default", text = "With moss, patience, and a strict word to every hippogryph rider who carries a crate for me. The sea crossing breaks one vial in ten whatever I do, and I have made my peace with the other nine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kylanna = {
      lines = { { id = "k_default", text = "She is the finest alchemist I have known, and she does not suffer carelessness in anyone, least of all herself. I have learned more by listening from this side of the table than I did in years of study." } },
      choices = {
        { text = "Do you brew as well?", next = "brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "A little, in the evenings, when the table is free and nobody is watching. I am better with ledgers than with cauldrons, and I think the stronghold is safer for my knowing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students = {
      lines = { { id = "s_default", text = "They do, and they are always so sorry about it. I tell them that every master began by dropping things, which is true, and it sends them back to the cauldron with a steadier hand." } },
      choices = { { text = "That's kindly done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have supplied alchemists since I was young, and I followed Mistress Kylanna to Feralas when she came for the herbs." } },
    _none = { { id = "tp_none", text = "I would not know, I am sorry. My world is rather the size of this table." } },
  },
}

-- Mardrack Greenwell: food and drink.
P:NPC {
  key = "mardrack_greenwell", id = TODO_NPC("Mardrack Greenwell"), name = "Mardrack Greenwell", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "warm" }, values = { "hospitable" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Mardrack Greenwell feeds Feathermoon Stronghold, and he is the nearest thing to a cheerful night elf I have met on the island. He put bread in my hand before he asked my name.",
    third = "{name} met Mardrack Greenwell, who sells food and drink at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}! You have crossed the water, so you are hungry, and I will hear no argument on the matter." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and thinner than when you left. The mainland feeds nobody well, I have always said so." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You looked at my fire before you looked at my food, as only a cook does. Tell me honestly what you think of the bread." },
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "The evening watch is changing, and that means supper. Sit down with the rest of them, friend, before the stew is gone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mardrack Greenwell, and I keep the Sentinels fed, which is harder than keeping them armed. A soldier will forgive a dull blade sooner than a cold supper, and I have ten thousand years of experience to say so." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Eat while you ask." },
        { id = "h_again2", text = "Go on, I am only watching the kettle." },
      },
      choices = {
        { text = "What does the island put on your table?", next = "table" },
        { text = "You're merrier than most of your kin.", next = "merry" },
        { text = "Does the garrison ever run short?", next = "short" },
        { text = "Thank you, Mardrack.", next = "END" },
      },
    },
    table = {
      lines = { { id = "t_default", text = "Fish from Brannock's students, fruit from the mainland groves, and bread from grain that comes by sea. I would give a great deal for a proper garden, but the soil here is half sand and the naga have the rest." } },
      choices = {
        { text = "Brannock's students keep you supplied?", next = "students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "s_default", text = "They do, though the early catches are small and sorry things. I cook them all the same and tell each student it was delicious, and Brannock pretends he does not know that I do it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    merry = {
      lines = { { id = "m_default", text = "So I am told, usually by someone frowning. I have seen enough wars to know that a full bowl and a kind word are worth guarding too, and I leave the solemnity to those who carry glaives." } },
      choices = { { text = "Never change. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    short = {
      lines = { { id = "sh_default", text = "Now and then, when storms keep the boat from the Forgotten Coast. Faralorn and I ration between us, and I thin the stew and thicken the conversation until the sails appear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have cooked for Sentinels since long before this stronghold. They march better for it, though none of them will say so." } },
    _none = { { id = "tp_none", text = "That I cannot tell you, friend. Ask me about supper instead, for there I am never wrong." } },
  },
}

-- Marli Wishrunner: small camp in a nook of the north-western Colossal, by the road.
P:NPC {
  key = "marli_wishrunner", id = TODO_NPC("Marli Wishrunner"), name = "Marli Wishrunner", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "feathermoon" }, temper = { "cheerful", "absent" }, values = { "curious" },
  notices = { "class", "travel" },
  impression = {
    first = "Marli Wishrunner keeps a small camp in a hollow at the foot of one of the Twin Colossals, right beside the road. She talks brightly and loses her thread halfway through, and she kept glancing up at the top of the other stone.",
    third = "{name} met Marli Wishrunner, who camps by the road between the Twin Colossals in Feralas.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a traveller! Ishnu-alah, {class}, and mind the wind between the stones, for it took my good cloak last week." },
    { id = "g_back", when = { metBefore = true }, text = "You came by again! I was sure I had something to tell you, and it will come back to me in a moment." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You are a long way from Camp Mojache. I keep no quarrel with travellers on this road, so long as they keep none with me." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You have the look of one who has stepped between places without walking. Then you know how easy it is to forget where you left someone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Marli Wishrunner, and this hollow is my half of the watch. My partner Kalin keeps the other half, up on top of the far Colossal, where he can see half of Feralas and I can scarcely see him." },
      },
      again = {
        { id = "h_again", text = "Now, what were we speaking of? Ask me again." },
        { id = "h_again2", text = "Yes? I am listening, mostly." },
      },
      choices = {
        { text = "What are the two of you watching?", next = "watch" },
        { text = "How does Kalin get up there?", next = "kalin" },
        { text = "Tell me about the Colossals themselves.", next = "stones" },
        { text = "Keep hold of your cloak. Farewell.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "The road, chiefly, since everything that crosses Feralas must pass between these two stones. Kalin counts the ogres and the Horde's riders from above, and I count whoever is friendly enough to stop." } },
      choices = {
        { text = "And what have you counted lately?", next = "counted" },
        { text = "Something else.", next = "BACK" },
      },
    },
    counted = {
      lines = { { id = "c_default", text = "More Gordunni on the highland paths than last season, and yetis coming down from the Feral Scar when the nights are cold. I wrote it all down for Feathermoon, and I believe I still have the letter somewhere." } },
      choices = { { text = "You should send that. Something else.", next = "BACK", reply = "I should, should I not? I will see to it today, or certainly tomorrow." } },
    },
    kalin = {
      lines = { { id = "k_default", text = "There is an old way, which I know and he does not, and so he goes up and comes down when I remember him. He is very patient about it, though he was a little short with me the evening I forgot." } },
      choices = { { text = "Try not to forget him. Something else.", next = "BACK" } },
    },
    stones = {
      lines = { { id = "s_default", text = "They were standing here before the Sundering, and nobody now living can say who raised them or whether anyone did. On a clear dawn the tops catch the light before the forest wakes, and I never tire of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Kalin and I have kept this watch a good while. He does the seeing and I do the remembering, which he says is the wrong way round." } },
    _none = { { id = "tp_none", text = "I am sure I knew that once. Ask me another day, when it has come back to me." } },
  },
}

-- Kalin Windflight: atop the south-eastern Colossal.
P:NPC {
  key = "kalin_windflight", id = TODO_NPC("Kalin Windflight"), name = "Kalin Windflight", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "feathermoon" }, temper = { "dry", "patient" }, values = { "watchful" },
  notices = { "travel", "class" },
  impression = {
    first = "Kalin Windflight keeps watch from the very top of one of the Twin Colossals, with all of Feralas laid out under him. He was plainly surprised to have company, and he asked at once whether Marli had sent me or simply forgotten me.",
    third = "{name} met Kalin Windflight, who keeps watch from the top of one of the Twin Colossals.",
  },
  greetings = {
    { id = "g_default", text = "A visitor, at this height? Well met, {class}, and stay back from the edge, because the wind does not give warnings." },
    { id = "g_back", when = { metBefore = true }, text = "You have climbed the sky twice now. Either you like the view, or Marli has mislaid you again." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then you, at least, have a way down that does not depend on anyone's memory. I envy you more than I can say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kalin Windflight. From this stone I can see the highlands, the road and the sea, and I send word of what moves on them to Feathermoon. My partner Marli keeps the camp below, and decides when I come down." },
      },
      again = {
        { id = "h_again", text = "What else? I have time, as you may have gathered." },
        { id = "h_again2", text = "Speak up, the wind takes half of every word." },
      },
      choices = {
        { text = "What can you see from here?", next = "see" },
        { text = "Marli decides when you come down?", next = "marli" },
        { text = "It's a lonely post.", next = "lonely" },
        { text = "I'll watch my step. Farewell.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Smoke from the Gordunni fires to the east, the hippogryphs wheeling over the Frayfeather Highlands, and on a clear day the walls of Eldre'Thalas above the trees. I like that last sight least, for nothing good has come out of those walls in my lifetime." } },
      choices = {
        { text = "What troubles you about Eldre'Thalas?", next = "eldre" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldre = {
      lines = { { id = "e_default", text = "It was a city of the Highborne, and now ogres hold court in it and call it Dire Maul. I do not know which of those two facts I trust less, and from up here I am glad to keep my distance from both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    marli = {
      lines = { { id = "m_default", text = "She knows the old way up and down these stones, and I do not. She is the kindest soul in Feralas and has the worst memory in it, and I once spent a full night up here thinking about both of those things." } },
      choices = { { text = "I'll remind her on my way past. Something else.", next = "BACK", reply = "I would be grateful. Say it twice, and watch her face to be sure it has landed.", fx = { affinity = 1 } } },
    },
    lonely = {
      lines = { { id = "l_default", text = "It is quiet, which is not the same thing. I have the wind, the hippogryphs and a view no king could buy, and I have learned to bring a second cloak and a third meal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept watches for the Sentinels in many places. This is the highest of them, and the hardest to leave." } },
    _none = { { id = "tp_none", text = "I see a great deal from here, but not that. Ask on the ground, where the gossip lives." } },
  },
}
