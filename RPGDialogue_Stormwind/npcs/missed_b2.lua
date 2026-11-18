-- Stormwind folk the roster scan found missing (part 2): Mage Quarter shopkeepers and the Blue
-- Recluse's innkeeper, the Schneider boy at Larson Clothiers, and Old Town's tradesfolk, tavernkeeper,
-- drill-master and patrolling officer. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Maria Lumere: vials and alchemy supplies at Alchemy Needs, among the night elf alchemists.
P:NPC {
  key = "maria_lumere", id = TODO_NPC("Maria Lumere"), name = "Maria Lumere", title = "Alchemy Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "practical", "wry" }, values = { "trade" },
  notices = { "craft", "kaldorei" },
  impression = {
    first = "Maria Lumere sells vials at Alchemy Needs, the one human in a shop full of night elves, and does all the haggling for the lot of them. She counts glassware faster than I can count coins.",
    third = "{name} met Maria Lumere, who sells alchemy supplies at Alchemy Needs in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Alchemy Needs. Vials, flasks and the like are with me, and please don't lean on that shelf, because every piece on it is glass." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more vials? I thought you might be, since nobody ever buys enough the first time." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, and one who's run short of vials, if I'm any judge. Lilyssia will teach you the brewing, and I'll see you've something to pour it into." },
    { id = "n_elf", cat = "kaldorei", when = { race = "NightElf" },
      text = "Another night elf! Your people have very nearly taken this shop over, and I mean that kindly, because the herbs have never been better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maria Lumere. Lilyssia teaches the alchemy and Eldraeith sells the herbs, and I keep the glass and deal with the customers, since I'm the only one here who enjoys an argument over a price." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind your elbow on the way round." },
        { id = "h_again2", text = "What else can I tell you?" },
      },
      choices = {
        { text = "How did you come to work with night elves?", next = "elves" },
        { text = "Is there much to know about a vial?", next = "vials" },
        { text = "This is a quiet corner for a shop.", next = "corner" },
        { text = "Thanks, Maria.", next = "END" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "The shop was mine first, and half empty, because good herbs were hard to come by. Then Lilyssia arrived wanting a bench to teach from, and brought the others with her, and now I've the best-stocked alchemist's in the city." } },
      choices = {
        { text = "Do you get on with them?", next = "geton" },
        { text = "Something else.", next = "BACK" },
      },
    },
    geton = {
      lines = { { id = "g_default", text = "Well enough, once I stopped expecting an answer the same day I asked the question. They think I hurry and I think they dawdle, and Tel'Athir asks me about human customs as if I were a book, but I'd miss them now if they left." } },
      choices = { { text = "It sounds like a good arrangement. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    vials = {
      lines = { { id = "v_default", text = "More than you'd think, because cheap glass cracks when a brew runs hot and then you've lost your herbs and your eyebrows together. I buy mine thick, and I test one from every crate over a candle before I'll sell the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    corner = {
      lines = { { id = "c_default", text = "It's as far east as the Mage Quarter goes, and I like it that way. The students from the Sanctum know where to find us, and nobody else comes by to complain about the smell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept this shop since before the night elves came to the city, and it's done better with them in it." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask Lilyssia, though you may wait a while for the answer." } },
  },
}

-- Owen Vaughn: reagents at Essential Components in the Mage Quarter.
P:NPC {
  key = "owen_vaughn", id = TODO_NPC("Owen Vaughn"), name = "Owen Vaughn", title = "Reagents", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "dry", "careful" }, values = { "trade", "order" },
  notices = { "mage", "warlock" },
  impression = {
    first = "Owen Vaughn sells reagents at Essential Components and weighs out every powder as if it might go off, which he says some of them might. He can tell what spell I mean to cast from what I ask for.",
    third = "{name} met Owen Vaughn, the reagent seller at Essential Components in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Essential Components, and the name's an honest one. Tell me what you mean to cast and I'll tell you what you've forgotten to buy for it." },
    { id = "g_back", when = { metBefore = true }, text = "Run out already? That's the trouble with reagents, friend; they're only ever used once." },
  },
  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "A mage, and bound somewhere in a hurry, I expect. Buy your runes before you need them, because nobody ever opened a portal on good intentions." },
    { id = "n_lock", cat = "warlock", when = { class = "WARLOCK" },
      text = "I know what your sort buys, and I sell it, and I don't ask. I'd thank you to conduct the rest of your business at the Slaughtered Lamb and not at my counter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Owen Vaughn. I sell the powders, runes, candles and seeds that spellcasters burn through, and I've made a decent living from the fact that the grandest magic in the world still needs a pinch of something." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Go on, I'm only weighing powder." },
      },
      choices = {
        { text = "Who are your best customers?", next = "customers" },
        { text = "Is any of this dangerous to keep?", next = "danger" },
        { text = "You can guess a spell from a shopping list?", next = "guess" },
        { text = "Good day, Owen.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "The Sanctum's apprentices, who buy little and often and always in a panic the night before an examination. After them it's the priests from the Cathedral, who buy their candles by the crate and never once haggle." } },
      choices = {
        { text = "And the worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Adventurers, saving your presence. They come in at a run, buy one rune, leave by portal and come back an hour later for the one they needed to get home again." } },
      choices = { { text = "I'll buy two next time. Something else.", next = "BACK", reply = "Then you're already wiser than most of them.", fx = { affinity = 1 } } },
    },
    danger = {
      lines = { { id = "d_default", text = "Arcane powder near an open flame is, which is why the candles live at the other end of the shop. In all my years the worst I've had was a shelf that turned a mouse blue, and the mouse seemed to bear it well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guess = {
      lines = {
        { id = "g_default", text = "Nine times in ten. Somebody who buys a light feather means to jump off something, and somebody who buys a great many candles has a friend who keeps dying on them." },
        { id = "g_druid", when = { class = "DRUID" }, text = "Nine times in ten, and with druids it's easier still. When one of your people buys seeds, somebody in the party isn't expected to stay on their feet." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've no magic of my own, friend. I only sell the parts, and I've outlasted a good many who had the gift." } },
    _none = { { id = "tp_none", text = "That's not something I stock, and it's not something I know. Try the Sanctum." } },
  },
}

-- Steven Lohan: innkeeper behind the counter of the Blue Recluse.
P:NPC {
  key = "steven_lohan", id = TODO_NPC("Steven Lohan"), name = "Steven Lohan", title = "Innkeeper", gender = "male",
  bible = "bibles/missed_b.md", role = "innkeeper", tier = "service",
  communities = { "stormwind" }, temper = { "genial", "unflappable" }, values = { "hospitality" },
  notices = { "mage", "drink" },
  impression = {
    first = "Steven Lohan keeps the counter at the Blue Recluse and treats floating tankards and singed tablecloths as ordinary wear. Nothing a mage did in his common room made him so much as look up.",
    third = "{name} met Steven Lohan, innkeeper of the Blue Recluse in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Blue Recluse! Find a seat that's staying where it is, friend, and I'll see somebody brings you a drink." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. Your usual table's free, and so far today nobody has enchanted it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A late one, is it? The apprentices are only now getting loud, so you've come at the lively hour." },
  },
  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "One of the Sanctum's, are you? House rule for your people: conjure your own water if you must, but the tables stay on the floor." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a few already, I can see. Sit down before you fall down, and I'll have Angus send out some bread." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Steven Lohan, and I keep the Blue Recluse. Joachim pours, Angus cooks and thinks he's the reason anyone comes, and I count the mugs at closing to see how many have been turned into something else." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, friend?" },
        { id = "h_again2", text = "Go on, the counter's quiet for a moment." },
      },
      choices = {
        { text = "What's it like, keeping a tavern for mages?", next = "mages" },
        { text = "Angus thinks he's the reason people come?", next = "angus" },
        { text = "Why the Blue Recluse?", next = "name" },
        { text = "I'll find a seat. Thanks.", next = "END" },
      },
    },
    mages = {
      lines = { { id = "m_default", text = "Much like any other tavern, only the brawls are quieter and a good deal stranger. Two apprentices fell out over a girl last month, and I had a sheep at the bar for the better part of a minute." } },
      choices = {
        { text = "What did you do with the sheep?", next = "sheep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sheep = {
      lines = { { id = "s_default", text = "I waited, friend, because it wears off, and then I charged him for the drink he'd knocked over while he had hooves. The masters at the Sanctum settle with me for the worst of it, and I've never had cause to complain of them." } },
      choices = { { text = "You're a patient man. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    angus = {
      lines = { { id = "a_default", text = "He does, and I'll admit he's not altogether wrong, because the man can cook. But he'd sooner throw a plate away than send it out with the sauce crooked, and it's me who pays for the plates." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "It had the name when it came to me, and the sign was already paid for. The apprentices each have a story about a blue spider in the cellar, and I let them tell it, because it keeps them out of the cellar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept this counter a good many years, and I've learned not to be surprised by anything that floats." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask around the tables; there's always somebody here who's read a book about it." } },
  },
}

-- Thurman Schneider: Rema's boy, apprenticed at Larson Clothiers; receives "Package for Thurman".
P:NPC {
  key = "thurman_schneider", id = TODO_NPC("Thurman Schneider"), name = "Thurman Schneider", gender = "male",
  bible = "bibles/missed_b.md", role = "child", tier = "quest",
  communities = { "stormwind" }, temper = { "restless", "cheeky" }, values = { "family" },
  notices = { "craft" },
  impression = {
    first = "Thurman Schneider is apprenticed at Larson Clothiers and would plainly rather be anywhere else, preferably somewhere with dragons. He has clever hands when he forgets to be bored.",
    third = "{name} met Thurman Schneider, the restless young apprentice at Larson Clothiers in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Hello. Are you here for a robe, because Mistress Larson does the robes, and I only do the hems and get told off." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again! Have you been anywhere good since, or just Stormwind?" },
    { id = "g_package", tags = { "news" }, when = { questActive = TODO_QUEST("Package for Thurman") }, text = "Is that from my mother? Oh no, it's my sewing kit, isn't it, and I'd only just told Mistress Larson I'd lost it." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew too? But you've got a sword and everything, so why would you sew if nobody was making you?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Thurman Schneider, and I'm Mistress Larson's apprentice, which means I thread needles all day. My mother has the tailor's shop on the canal, and she says I'm to learn the trade properly somewhere I can't talk my way out of it." },
        { id = "h_done", when = { questDone = TODO_QUEST("Package for Thurman") }, text = "You're the one who brought my kit, so now I've got to use it, and I haven't quite forgiven you. Mistress Larson says my stitching was straight today, though, so I suppose it isn't all your fault." },
      },
      again = {
        { id = "h_again", text = "What else? Talk quietly, or she'll notice I've stopped." },
        { id = "h_again2", text = "Ask me something, go on, it's better than hemming." },
      },
      choices = {
        { text = "You don't care for tailoring, then?", next = "tailoring" },
        { text = "Tell me about your family.", next = "family" },
        { text = "What would you rather be doing?", next = "rather" },
        { text = "Did you really lose that sewing kit?", next = "kit", when = { questDone = TODO_QUEST("Package for Thurman") } },
        { text = "Back to your hems, Thurman.", next = "END" },
      },
    },
    tailoring = {
      lines = { { id = "t_default", text = "It isn't that I'm bad at it, because I'm not, and even Mistress Larson says so when she thinks I can't hear. It's that every stitch is the same as the last one, and there are about a thousand of them in a robe." } },
      choices = {
        { text = "What's Mistress Larson like?", next = "larson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    larson = {
      lines = { { id = "l_default", text = "She never shouts, which is worse, because she just looks at the seam and then looks at me. She did let me cut a whole sleeve by myself last week, though, and she only unpicked half of it." } },
      choices = { { text = "That sounds like praise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    family = {
      lines = { { id = "f_default", text = "My mother is Rema Schneider, and my sister Lisbeth works in the canal shop with her and never does anything wrong, ever. They both say I've got the best hands in the family, and they only say it so I'll stay." } },
      choices = {
        { text = "Maybe they say it because it's true.", next = "truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    truth = {
      lines = { { id = "tr_default", text = "That's what Lisbeth said, and then she made me rethread her needle, so I don't know. I suppose I'd rather be good at it than bad at it, if I've got to do it anyway." } },
      choices = { { text = "That's a sensible way to see it. Something else.", next = "BACK" } },
    },
    rather = {
      lines = {
        { id = "r_default", text = "Anything with a griffon in it! I watch them go over from the shop door, and I think that every one of those riders is going somewhere I've never been, and I'm in here with a pincushion." },
        { id = "r_mage", when = { class = "MAGE" }, text = "What you do! The mages come in for their robes and they can make fire in their hands, and I asked one to teach me and he said to finish his cuffs first." },
      },
      choices = { { text = "Somebody has to make the riders' cloaks. Something else.", next = "BACK", reply = "I never thought of that. I bet I could make a good one, too." } },
    },
    kit = {
      lines = { { id = "k_default", text = "I didn't lose it exactly, I just left it under my bed at home, on purpose, where I knew where it was. I thought she'd send me home if I had nothing to sew with, and my mother worked it out before the day was over." } },
      choices = { { text = "Mothers usually do. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Schneider, and Schneiders sew, and nobody asked me whether I wanted to." } },
    _none = { { id = "tp_none", text = "I don't know about that. I only know about hems, and I wish I didn't." } },
  },
}

-- Master Wood: stands outside the Command Center in Old Town; particular about manners.
P:NPC {
  key = "master_wood", id = TODO_NPC("Master Wood"), name = "Master Wood", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "stern", "formal" }, values = { "courtesy", "discipline" },
  notices = { "soldier" },
  impression = {
    first = "Master Wood stands outside the Command Center in Old Town with his hands behind his back and judges everyone who passes by how they greet him. A salute earned me a nod, and I suspect rudeness would have earned me worse.",
    third = "{name} met Master Wood, a stern old master who keeps watch outside Stormwind's Command Center.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. You may approach, provided you remember your manners while you do it." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and you greeted me properly this time, which I shall count as progress." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry your weapon as though you know its weight. Good, for there are too many in this city who wear a sword the way they would wear a hat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Master Wood. The warriors of this city train behind that door, and I stand before it, where I can see what sort of person each of them is before they have picked anything up." },
      },
      again = {
        { id = "h_again", text = "You have another question. Ask it properly, and I will answer it." },
        { id = "h_again2", text = "Yes? Stand up straight when you speak to me." },
      },
      choices = {
        { text = "What can you tell from a greeting?", next = "greeting" },
        { text = "Are you one of the trainers here?", next = "trainer" },
        { text = "You must meet your share of rude folk.", next = "rude" },
        { text = "Good day, Master Wood.", next = "END" },
      },
    },
    greeting = {
      lines = { { id = "g_default", text = "Nearly everything. One who bows to a stranger will listen to a teacher, and one who salutes will stand in a line, and one who cannot be troubled to do either will be a danger to whoever fights beside him." } },
      choices = {
        { text = "And one who shows off his muscles?", next = "flex" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flex = {
      lines = { { id = "f_default", text = "I see three of those a day, and I am never impressed. Strength is the commonest thing in Old Town, and I have watched a great many strong young men carried home from Redridge by smaller ones who kept their heads." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    trainer = {
      lines = {
        { id = "t_default", text = "I was, for longer than you have been alive. The masters inside teach the blade and the shield now, and I teach the part that comes before those, to anyone with the sense to stop and learn it." },
        { id = "t_warrior", when = { class = "WARRIOR" }, text = "I was, and I taught some of those who will teach you. Go in and learn the blade from them, warrior, and when they have finished with you, come and show me that you still know how to bow." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rude = {
      lines = { { id = "r_default", text = "Daily, and I answer every one of them in kind, so that they know how it feels. Most go away angry, and a few come back the next morning and try again properly, and those few are worth the trouble." } },
      choices = { { text = "A hard lesson, but a fair one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have taught in Old Town since this quarter was rebuilt, and I shall stand here until I cannot." } },
    _none = { { id = "tp_none", text = "I do not know, and I will not guess. Ask inside, and ask politely." } },
  },
}

-- Mayda Thane: cobbler at Thane's Boots in Old Town.
P:NPC {
  key = "mayda_thane", id = TODO_NPC("Mayda Thane"), name = "Mayda Thane", title = "Cobbler", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "blunt", "kindly" }, values = { "craft" },
  notices = { "kit", "travel" },
  impression = {
    first = "Mayda Thane makes and sells boots in Old Town and looked at my feet before she looked at me. She can tell where a person has been walking, and she had opinions about where I had.",
    third = "{name} met Mayda Thane, the cobbler of Thane's Boots in Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Thane's Boots. Come in and let me see what you've been walking on, because I can hear that left heel from here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you've been through water since I saw you last. Sit down and let me look." },
  },
  notice = {
    { id = "n_dwarf", cat = "kit", when = { race = { "Dwarf", "Gnome" } },
      text = "I do cut for dwarves and gnomes, before you ask, and I charge the same. There's less leather in it, but a great deal more swearing." },
    { id = "n_elf", cat = "travel", when = { race = "NightElf" },
      text = "One of the night elves! Half your folk come in here barefoot and tell me the earth should be felt, and then they meet Stormwind's cobbles in winter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mayda Thane, cobbler. Smiths get the glory and tailors get the nobles, but an army marches on its feet, and nobody ever won a war in boots that didn't fit." },
      },
      again = {
        { id = "h_again", text = "What else, love? I've a sole to stitch." },
        { id = "h_again2", text = "Go on, I can talk and stitch." },
      },
      choices = {
        { text = "What can you tell from a pair of boots?", next = "tell" },
        { text = "Who buys the most boots in Old Town?", next = "buys" },
        { text = "What makes a boot last?", next = "last" },
        { text = "Thank you, Mayda.", next = "END" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "Where you've been, mostly. Westfall dust gets into the seams and never leaves, Duskwood rots the stitching, and the red clay of Redridge stains the welt so it looks like rust." } },
      choices = {
        { text = "And what do mine say?", next = "mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "m_default", text = "That you walk a good deal more than you ride, and that you don't dry them by the fire, which I'm glad of. They also say you've been putting off a visit to a cobbler, and here you are." },
        { id = "m_low", when = { maxLevel = 12 }, text = "That they haven't been far yet, love. There's Elwynn grass on them and not much else, and I'd look them over again when they've seen a real road." },
      },
      choices = { { text = "You read them well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buys = {
      lines = { { id = "b_default", text = "The barracks, by the dozen, and they wear them through faster than I can make them. After the soldiers it's the folk from the building round the corner, who always want a soft sole and never say why." } },
      choices = { { text = "A soft sole? Something else.", next = "BACK", reply = "I don't ask, love, and I'd advise you not to either." } },
    },
    last = {
      lines = { { id = "l_default", text = "Good hide from the Protective Hide down the way, waxed thread, and an owner who greases them once a week. I can do the first two, and the third is up to you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The shop has my name over the door, and I've made boots in Old Town since I was tall enough to reach the bench." } },
    _none = { { id = "tp_none", text = "I only know feet, love. Ask at the Pig and Whistle; they know everything else." } },
  },
}

-- Randal Worth: Simon Tanner's apprentice at the Protective Hide; a dandy, but dependable.
P:NPC {
  key = "randal_worth", id = TODO_NPC("Randal Worth"), name = "Randal Worth", title = "Apprentice Leatherworker", gender = "male",
  bible = "bibles/missed_b.md", role = "worker", tier = "service",
  communities = { "stormwind" }, temper = { "vain", "good-natured" }, values = { "style", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Randal Worth is apprenticed at the Protective Hide and is the best-dressed man in a shop that smells of tannin. He knows exactly what looks good and is still learning how to make it hold together.",
    third = "{name} met Randal Worth, the stylish apprentice leatherworker at the Protective Hide.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Protective Hide! Simon does the teaching, but if you want to know whether a thing will look well on you, I'm the one to ask." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back, and still wearing that. We really must talk about it one of these days." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather yourself, I see, and your stitching's tighter than mine. Don't tell Simon I said so, or I'll never hear the end of it." },
    { id = "n_rogue", cat = "kit", when = { class = "ROGUE" },
      text = "Now that is how black leather ought to be worn, close and quiet. I shan't ask where you wear it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Randal Worth, apprentice leatherworker. I know style when I see it, and Simon is teaching me the techniques to go with it, which he says is the proper way round and I say is taking a very long time." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with?" },
        { id = "h_again2", text = "Do go on, I'm only waiting for the dye to take." },
      },
      choices = {
        { text = "What's Simon like as a master?", next = "simon" },
        { text = "Does style matter in armour?", next = "style" },
        { text = "They say you're fond of mirrors.", next = "mirror" },
        { text = "Good day, Randal.", next = "END" },
      },
    },
    simon = {
      lines = { { id = "s_default", text = "A real sport, truly. He lets me try my own cuts, and when they fall apart he shows me why without making a speech of it, which is more than I'd do in his place." } },
      choices = {
        { text = "What fell apart last?", next = "fell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fell = {
      lines = { { id = "f_default", text = "A jerkin with the most beautiful slashed sleeves you ever saw, in oxblood red. It looked magnificent on the stand, and the first time the customer drew his bow both sleeves came off at the shoulder." } },
      choices = { { text = "At least he looked good doing it. Something else.", next = "BACK", reply = "That's exactly what I told Simon! He didn't laugh as much as I'd hoped.", fx = { affinity = 1 } } },
    },
    style = {
      lines = { { id = "st_default", text = "More than the old hands admit. A soldier who looks the part stands taller, and a man who stands taller gets hit less, I'm sure of it. Simon says a well-sewn seam does the same job better, and I expect we're both right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mirror = {
      lines = { { id = "m_default", text = "Jillian told you that, didn't she? I check the fit of a collar in the buckles now and then, and that's all there is to it. A leatherworker who doesn't care how he looks is asking you to trust a baker who won't eat his own bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Simon with an eye for cut and no idea how to hold an awl, and I'm mending the second part." } },
    _none = { { id = "tp_none", text = "I'm afraid I wouldn't know. Simon might, if it's to do with hides." } },
  },
}

-- Reese Langston: tavernkeeper of the Pig and Whistle; keeps the taps and the fire.
P:NPC {
  key = "reese_langston", id = TODO_NPC("Reese Langston"), name = "Reese Langston", title = "Tavernkeeper", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "hearty", "shrewd" }, values = { "hospitality" },
  notices = { "drink", "soldier" },
  impression = {
    first = "Reese Langston keeps the taps at the Pig and Whistle and greets every soul through the door as though the party had been waiting on them. He misses nothing that happens in his common room.",
    third = "{name} met Reese Langston, tavernkeeper of the Pig and Whistle in Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Pig and Whistle! Take a mug and pull up a seat, friend, because there's always room for one more at these tables." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! I told Elly you'd be back, and she owes me a copper." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Come in out of the dark, friend. The fire's high and the barracks has just let out, so mind your toes." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've a fair start on the evening already. Sit near the wall, friend, and well away from Bartleby's stool." },
    { id = "n_mage", cat = "drink", when = { class = "MAGE" },
      text = "A mage, are you? Then hear it from me before you hear it from Elly: nobody chills my ale but the cellar." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Reese Langston, and the Pig and Whistle's mine to keep. Elly runs the drinks and Stephen runs the kitchen, and I mind the taps and the fire and whoever looks likely to throw a chair." },
      },
      again = {
        { id = "h_again", text = "What else'll it be, friend?" },
        { id = "h_again2", text = "Go on, I can pour and listen." },
      },
      choices = {
        { text = "Who drinks here?", next = "who" },
        { text = "How do you keep the peace?", next = "peace" },
        { text = "It's a strange name for a tavern.", next = "name" },
        { text = "I'll find a seat, Reese.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Soldiers from the barracks, mostly, and the dockhands and the tanners, and a few quiet sorts from round the corner who drink little and leave good coin. Harry Burlguard's held that table since before I had the place, and I'd no more move him than move the hearth." } },
      choices = {
        { text = "And Bartleby?", next = "bartleby" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bartleby = {
      lines = { { id = "b_default", text = "Bartleby came with the building too, near enough. He loves that mug more than most men love their wives, and so long as nobody touches it he's no trouble to anyone but himself." } },
      choices = { { text = "I'll leave the mug alone. Something else.", next = "BACK" } },
    },
    peace = {
      lines = {
        { id = "p_default", text = "By seeing it coming, friend. A fight has a sound before it starts, like a kettle before it boils, and if I put a fresh mug in front of the right man at the right moment it never does." },
        { id = "p_warrior", when = { class = "WARRIOR" }, text = "By seeing it coming, and by keeping on good terms with big folk like yourself. If a chair goes up tonight, I'd be obliged if you stood on my side of the room." },
      },
      choices = { { text = "A fresh mug is cheaper than a window. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = { { id = "n_default", text = "Everybody says so, and everybody remembers it, which is the whole use of a name. The old sign had a pig on it that looked more like a dog, so I had it painted again, and now it looks like a pig that's seen something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept the Pig and Whistle through lean years and loud ones, and I'd not trade it for the Gilded Rose and all its cushions." } },
    _none = { { id = "tp_none", text = "That's one I haven't heard, friend, and I hear most things. Ask Harry at his table." } },
  },
}

-- Seoman Griffith: leather armor at the Protective Hide, beside Alyssa Griffith's bags.
P:NPC {
  key = "seoman_griffith", id = TODO_NPC("Seoman Griffith"), name = "Seoman Griffith", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "quiet", "exacting" }, values = { "craft" },
  notices = { "kit" },
  impression = {
    first = "Seoman Griffith makes and sells leather armour at the Protective Hide and lets his work do most of the talking. He turned my collar over to look at the stitching and said nothing, which told me enough.",
    third = "{name} met Seoman Griffith, the leather armour merchant of the Protective Hide in Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Leather armour's on this side of the shop. Have a look, and bend the pieces if you like, because good leather doesn't mind." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. How has the last piece been wearing?" },
  },
  notice = {
    { id = "n_leather", cat = "kit", when = { class = { "ROGUE", "DRUID", "HUNTER" } },
      text = "You're someone who needs to move in what you wear. I cut for that, and I'd sooner you could run in it than look fine standing still." },
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll want the Strangs at Limited Immunity for your sort of armour. I can do you a decent belt, mind, and every plate wearer needs one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Seoman Griffith. I make the leather armour here, Alyssa sells her bags at the next table, and Simon turns out the apprentices who'll put us both out of business one day." },
      },
      again = {
        { id = "h_again", text = "Something more?" },
        { id = "h_again2", text = "Ask, and I'll answer while I work." },
      },
      choices = {
        { text = "Why would anyone choose leather over steel?", next = "why" },
        { text = "Do you and Alyssa share the trade?", next = "alyssa" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Good day, Seoman.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because steel is loud and heavy and you can't swim in it. A scout who has to cross the Nazferiti or lie under a hedge all night wants something that keeps quiet, and that's what I sell." } },
      choices = {
        { text = "Does it stop a blade?", next = "blade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "It turns one that isn't well aimed, and it gives you the speed to make sure most of them aren't. I boil the chest pieces in wax until they'd blunt a kitchen knife, but I'll not tell a customer it's plate." } },
      choices = { { text = "An honest answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    alyssa = {
      lines = { { id = "a_default", text = "We share the hides and the name over the table, and that's about all. She can sell a bag to a man who came in for bootlaces, and I've never talked anybody into anything, so we leave each other's customers be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hides = {
      lines = {
        { id = "hi_default", text = "Elwynn and Westfall for the common leather, and the hunters bring heavier stuff up from Stranglethorn when they're in the city. Maris checks every skin that comes through the door, and she's sent back more than she's kept." },
        { id = "hi_skin", when = { profession = "Skinning" }, text = "From people like you, as often as not. Bring your skins to Maris first, and if they get past her, I'll be glad of them and say so." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've cut leather in Old Town for a long while, and I'd rather be known by the work than by the talk." } },
    _none = { { id = "tp_none", text = "Couldn't say. Alyssa hears more than I do; ask her." } },
  },
}

-- Wilhelm Strang: mail armor at Limited Immunity, alongside Osric Strang's plate.
P:NPC {
  key = "wilhelm_strang", id = TODO_NPC("Wilhelm Strang"), name = "Wilhelm Strang", title = "Mail Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "patient", "plain-spoken" }, values = { "craft", "family" },
  notices = { "kit", "soldier" },
  impression = {
    first = "Wilhelm Strang sells mail at Limited Immunity and will run a hauberk through his hands link by link while he talks. He is the quieter of the two Strangs in the shop, and the more patient.",
    third = "{name} met Wilhelm Strang, the mail armour merchant at Limited Immunity in Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Limited Immunity. The mail's with me and the plate's with Osric, and you're welcome to try the weight of either." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you back. Any broken links since last time, or have you been lucky?" },
  },
  notice = {
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER", minLevel = 40 },
      text = "You've the shoulders for mail now, hunter. Most of your kind wait too long to change over, and they carry the scars to show for it." },
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "I've nothing you could wear and still lift your arms, I'm afraid. You're welcome to look, though, and it costs nothing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wilhelm Strang. Mail is my side of the family trade, and I'll tell you plainly it's the better half, because it bends where a body bends and you can mend it by a campfire with a pair of pliers." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on. The links will wait." },
      },
      choices = {
        { text = "Does Osric agree it's the better half?", next = "osric" },
        { text = "How do you judge good mail?", next = "judge" },
        { text = "Who buys mail these days?", next = "buyers" },
        { text = "Good day, Wilhelm.", next = "END" },
      },
    },
    osric = {
      lines = { { id = "o_default", text = "He does not, and we've had that argument at every family supper I can remember. He says plate stops what mail only slows, and I say a man in plate who falls in the canal stays there." } },
      choices = {
        { text = "Has anyone settled it?", next = "settled" },
        { text = "Something else.", next = "BACK" },
      },
    },
    settled = {
      lines = { { id = "s_default", text = "The customers settle it every day, by buying both. A good soldier wears mail under his plate at the joints, so the truth is that neither of us would eat without the other, and we both know it." } },
      choices = { { text = "That sounds like family. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    judge = {
      lines = { { id = "j_default", text = "Hold it up to the window and look for light where there shouldn't be any, and then pull it hard across your knee. Riveted links hold and butted ones open, and anybody selling you butted mail for a soldier's price is a thief." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "The Watch, the caravan guards on the Redridge road, and a good many dwarves, who won't wear anything they couldn't have forged themselves. I take that as a compliment when they buy from me anyway." },
        { id = "b_dwarf", when = { race = "Dwarf" }, text = "The Watch, the caravan guards, and your own people, who test every link with their teeth before they'll pay. I've not had one handed back yet, and I'm prouder of that than of anything else in the shop." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Strangs have sold armour in Old Town for as long as I can remember, and I learned mail at the same bench Osric learned plate." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm sorry. Osric might, and he'll tell you whether he does or not." } },
  },
}

-- Officer Brady: Stormwind City Guard, walking a patrol through the streets.
P:NPC {
  key = "officer_brady", id = TODO_NPC("Officer Brady"), name = "Officer Brady", gender = "male",
  bible = "bibles/missed_b.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "wary" }, values = { "dutiful", "order" },
  notices = { "watch", "stealth" },
  impression = {
    first = "Officer Brady walks his patrol through Stormwind at a pace that does not invite company and talks without ever quite stopping. He looked at my hands and my belt before he looked at my face.",
    third = "{name} met Officer Brady of the Stormwind City Guard, on patrol through the streets.",
  },
  greetings = {
    { id = "g_default", text = "Keep it brief, citizen, and walk with me if you want to talk, because this patrol doesn't stop." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Nothing to report, I hope, and you've kept out of trouble." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You're out late, citizen. Keep to the lit streets and you'll hear nothing more from me." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You walk very quietly for somebody with nothing to hide. I'm not accusing you of anything, but I've a good memory for faces." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Officer Brady, City Guard. I walk the streets between the districts and I keep my eyes open, and with the regiments away there are few enough of us that I can't stand about." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep walking while you ask." },
        { id = "h_again2", text = "Quickly, then." },
      },
      choices = {
        { text = "What do you watch for on patrol?", next = "watch" },
        { text = "The city looks peaceful enough to me.", next = "peace" },
        { text = "How thin is the Guard stretched?", next = "thin" },
        { text = "Carry on, Officer.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Cutpurses in the Trade District, drunks in Old Town, and anybody wearing a red mask anywhere at all. The Defias have friends inside these walls, whatever the nobles like to say, and I mean to find them." } },
      choices = {
        { text = "The Defias, inside Stormwind?", next = "defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias = {
      lines = { { id = "d_default", text = "They built these walls, citizen, so they know every drain and cellar better than we do. The Stockade is full of them and still in riot, and for each one in a cell I'd wager there's another renting a room over a shop." } },
      choices = { { text = "I'll keep my eyes open too. Something else.", next = "BACK", reply = "Do that, and bring what you see to the Guard, not to a tavern.", fx = { affinity = 1 } } },
    },
    peace = {
      lines = { { id = "p_default", text = "It looks that way because we walk it, day and night. The folk in the Trade District see clean streets and suppose streets are clean by nature, and I'd as soon they kept thinking so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thin = {
      lines = {
        { id = "t_default", text = "Thin enough that I walk a round that used to be three men's. The army's in Redridge and beyond, and the city makes do with what's left of us and whatever help passes through the gate." },
        { id = "t_soldier", when = { class = { "WARRIOR", "PALADIN" } }, text = "Thin enough that I'd hand you a tabard this minute if it were mine to give. See the recruiter in the Trade District square, if you're inclined, because she's short of people who already know which end to hold." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've walked a beat in this city for years, and I know it better by night than most know it by day." } },
    _none = { { id = "tp_none", text = "Not my business, citizen, and I've a round to finish. Try the Command Center." } },
  },
}
