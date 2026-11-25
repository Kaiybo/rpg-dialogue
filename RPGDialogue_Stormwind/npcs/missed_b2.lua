-- Stormwind folk the roster scan found missing (part 2): Mage Quarter shopkeepers and the Blue
-- Recluse's innkeeper, the Schneider boy at Larson Clothiers, and Old Town's tradesfolk, tavernkeeper,
-- drill-master and patrolling officer. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
      lines = { { id = "greeting_default", text = "Nearly everything. One who bows to a stranger will listen to a teacher, and one who salutes will stand in a line, and one who cannot be troubled to do either will be a danger to whoever fights beside him." } },
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
