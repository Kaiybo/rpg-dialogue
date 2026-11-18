-- More of Stormwind's shops and corners: the Dwarven District's pet trainer and gun seller, the Blue
-- Recluse's bartender, the Mage Quarter's hatter, Old Town's blade merchant, the winery's counter
-- and a beggar in Old Town. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Karrina Mekenda: dwarf pet trainer in the Dwarven District.
P:NPC {
  key = "karrina_mekenda", id = TODO_NPC("Karrina Mekenda"), name = "Karrina Mekenda", title = "Pet Trainer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "hearty" }, values = { "craft", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Karrina Mekenda trains hunters' beasts in the Dwarven District, and she greets the animal before she greets its owner. She has a laugh that carries down the whole street.",
    third = "{name} met Karrina Mekenda, the dwarf who trains hunters' pets in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_x1", when = { class = "HUNTER", race = "Dwarf" }, text = "Well met, cousin! And who's this fine beast? Let it have a sniff of my hand, and we'll get acquainted." },
    { id = "g_default", text = "Well, look at ye! Bring yer beast over here, {g:lad|lass}, and let me have a look at the both of ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And how's the wee beastie keeping? Better than you, by the look of it." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Oh, would ye look at {pet}! Come here, come here, ye handsome thing. Yer owner can wait." },
  },
  notice = {
    { id = "n_x1", cat = "class", when = { race = "NightElf" },
      text = "A night elf! Yer folk have a way with the big cats that I'd give my best boar to learn. Don't tell the boar I said so." },
    { id = "n_x2", cat = "race", when = { race = "Gnome" },
      text = "A gnome! If ye've come about training one o' those clockwork chickens, lass or lad, I'll tell ye now it's nae a beast and I'll nae be bitten by a spring again." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and one that keeps their beast fed, by the shine on its coat. That's more than half of them manage." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Ye'll know the rams of Dun Morogh, then, and how they'll butt ye if ye turn yer back. Pets are no different." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Karrina Mekenda, and I train hunters' pets in the ways of a fight, from a good growl to a better bite. Nae a hunter in this district goes out without stopping by me first, if they've any sense." },
        { id = "h_nohunt", when = { class = { "WARRIOR", "MAGE", "PRIEST", "ROGUE", "WARLOCK", "PALADIN", "DRUID", "SHAMAN" } }, text = "Karrina Mekenda, pet trainer, though ye've nae pet that I can see, so I'll just talk at ye instead. Hunters come here to teach their beasts a trick or two." },
      },
      again = {
        { id = "h_x_again1", text = "Aye? Go on, the beasts are fed and I've time." },
        { id = "h_again", text = "Anything else, {g:lad|lass}? I've a boar out back that wants its supper." },
        { id = "h_again2", text = "Go on, then. I'm listening, and so's the boar." },
      },
      choices = {
        { text = "Teach my pet something new.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How does a dwarf come to train pets in Stormwind?", next = "why" },
        { text = "What makes a good hunting beast?", next = "good" },
        { text = "A pet is just a tool for the hunt.", next = "tool", when = { class = "HUNTER" } },
        { text = "Who else trains hunters in the district?", next = "others" },
        { text = "What's the strangest beast you've trained?", next = "strangest" },
        { text = "My pet's been flagging in long fights.", next = "flagging", when = { class = "HUNTER" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The same way half this district came, following the work after the wars. Stormwind has more hunters than Ironforge has rams, and fewer folk who know what to do with them." } },
      choices = {
        { text = "Do you miss the mountains?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Every winter, when the snow doesn't come. But there's good ale in the district and a forge on every corner, so it's near enough to home that I only grumble on feast days." } },
      choices = { { text = "Something else, Karrina.", next = "BACK" } },
    },
    good = {
      lines = {
        { id = "gd_default", text = "Loyalty first, then teeth, then brains, and never the other way round. A clever wolf that won't come when ye call is worse than no wolf at all." },
        { id = "gd_hunter", when = { class = "HUNTER" }, text = "Loyalty first, then teeth, and ye'll know that already if ye've lost a beast to a bad choice. Feed it well and it'll not leave ye." },
      },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    tool = {
      big = true,
      lines = { { id = "t_default", text = "A tool, is it? Then ye'll get a tool's loyalty, which is none, the moment it hurts. Talk like that in front of my boar and ye'll find out how sharp a tool can be." } },
      choices = {
        { text = "You're right. My pet's my partner, not my tool.", next = "BACK", reply = "That's better. Now give it a scratch behind the ears and apologise.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A beast that won't obey gets replaced.", next = "BACK", reply = "Then ye'll be replacing a lot of beasts, and I'll not be teaching any of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "Einris Brightspear, Ulfir Ironbeard and Thorfin Stoneshield, down by the gunsmith's. They teach the hunter, and I teach the beast, and between us we send out a pair that might come home again." },
      },
      choices = {
        { text = "Do you get on with them?", next = "geton" },
        { text = "Something else.", next = "BACK" },
      },
    },
    geton = {
      lines = {
        { id = "geton_1", text = "Well enough. Ulfir thinks a pet's there to hold the enemy still while he shoots, and I've told him that's a fine way to end up with no pet and a great many enemies. We argue it over ale every week and nobody's budged yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    strangest = {
      lines = {
        { id = "strangest_1", text = "A crab, from the Westfall shore, brought in by a lad who'd named it Lord Pinchington. It learned to hold a gnoll by the ankle and nae let go, and I'll confess I grew fond of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    flagging = {
      lines = {
        { id = "flagging_1", text = "Then it's hungry, or it's hurting, or it thinks ye've stopped noticing. Feed it before the fight and nae after, mend it when it's bleeding, and say its name out loud when it's done well, and ye'll see it stand twice as long." },
        { id = "flagging_2", when = { pet = { family = "Boar" } }, text = "A boar? Then it's hungry, and I'd stake my beard on it. A boar fights on its belly, lad or lass, so feed {pet} before every scrap and it'll charge through a stone wall for ye." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "A hunter came through with a white wolf she swore she'd found in Dun Morogh's high passes. I've never seen its like, and I've been looking ever since." } },
    background = { { id = "tp_bg", text = "Raised among the rams of Dun Morogh, and stubborn as one. Ask anyone in the district." } },
    advice = { { id = "tp_ad", text = "Feed yer beast before ye feed yerself, and it'll never forget it." } },
    _none = { { id = "tp_none", text = "I know beasts, {g:lad|lass}, not that. Ask me something with fur on it." } },
  },
}

-- Thulman Flintcrag: dwarf gun vendor in the Dwarven District.
P:NPC {
  key = "thulman_flintcrag", id = TODO_NPC("Thulman Flintcrag"), name = "Thulman Flintcrag", title = "Guns Vendor", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "proud" }, values = { "craft", "practical" },
  notices = { "class", "craft" },
  impression = {
    first = "Thulman Flintcrag sells guns in the Dwarven District and talks about them like a father about his sons. He'd sell a rifle to a priest if he could find the right argument.",
    third = "{name} met Thulman Flintcrag, the dwarf gun seller in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_x1", when = { class = "HUNTER" }, text = "Now there's a body who appreciates a good barrel! Come in, come in, and tell me what ye've been shooting with, so I can tell ye what's wrong with it." },
    { id = "g_default", text = "Come in, come in! Every gun on this wall was made by a dwarf or checked by one, and that's the only promise worth making." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another look? I knew it. Once ye've held a proper rifle, a bow feels like a twig." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Now there's someone who knows the value of a good barrel. Let's see what ye're carrying." },
  },
  notice = {
    { id = "n_x1", cat = "class", when = { race = "Dwarf" },
      text = "A cousin from the mountain! Ye'll not need the speech I give the humans. Have a look at the long rifle, and tell me if Ironforge has made a better one since I left." },
    { id = "n_x2", cat = "craft", when = { race = "Gnome" },
      text = "A gnome! Yer folk make a fine scope, I'll give ye that, though ye will insist on adding a second lens, a bell and a wee flag." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Is that a bow on yer back? Och, we'll have to see about that. A gun doesnae need to be strung in the rain." },
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Then ye'll appreciate the barrels on these; bored true, every one, nae a wobble among them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thulman Flintcrag, and guns are my trade, my pride and my only true love, if ye don't tell my wife. Ironforge makes the best in the world, and I bring them south so ye humans can stop squinting down arrows." },
      },
      again = {
        { id = "h_x_again1", text = "Aye? There's more to say about guns than I've said yet." },
        { id = "h_again", text = "Anything else? I've a blunderbuss I'm dying to show someone." },
        { id = "h_again2", text = "Go on, then. Mind ye don't point anything at the window." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Why are guns better than bows?", next = "bows" },
        { text = "Where do your guns come from?", next = "source" },
        { text = "Guns are loud and clumsy.", next = "clumsy" },
        { text = "Is there a Mrs. Flintcrag, then?", next = "wife" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "I make my own firearms.", next = "maker", when = { profession = "Engineering" } },
        { text = "What rifle would you carry yourself?", next = "carry", when = { class = "HUNTER" } },
        { text = "Not today, Thulman.", next = "END" },
      },
    },
    bows = {
      lines = {
        { id = "b_default", text = "A bow needs arms like a blacksmith and years of practice, and a gun needs a steady eye and a bit of powder. Any farmer's son can learn a rifle in a week, and that's what won us the last war." },
        { id = "b_elf", when = { race = "NightElf" }, text = "Now, I know yer folk love yer bows, and I'll not say a word against them in front of ye. But a dwarven rifle hits harder at twice the range, and ye can quote me on that in Darnassus." },
      },
      choices = {
        { text = "What war did a rifle win?", next = "war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Every war since the trolls, if ye ask a dwarf, and the Second War most of all. The Bronzebeard riflemen held the passes when nothing else would, and my grandda among them.", fx = { learn = { "second_war" } } } },
      choices = { { text = "Your grandfather would be proud. Something else.", next = "BACK" } },
    },
    source = {
      lines = { { id = "s_default", text = "Ironforge, mostly, from the gunsmiths under the mountain, and a few I make myself on the forge out back. I check every barrel before it goes on that wall, because a gun that bursts is bad for business and worse for faces." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clumsy = {
      big = true,
      lines = { { id = "c_default", text = "Loud, aye, and proud of it! The noise is half the point, because nothing frightens a gnoll like a bang. As for clumsy, ye've just not met the right gun yet." } },
      choices = {
        { text = "Fair enough. A loud weapon has its uses.", next = "BACK", reply = "That's it! Now come and hold this one. Gently.", fx = { align = { order = -1 } } },
        { text = "A quiet blade gets the work done cleaner.", next = "BACK", reply = "Cleaner, maybe, but ye've got to get close for that, and I like my enemies far away.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife = {
      lines = {
        { id = "wife_1", text = "There is, in Ironforge, and she says she married a dwarf and got a gun rack. She writes every month to ask when I'm coming home, and I write back that the humans still can't shoot, so my work's nae done." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = {
        { id = "customers_1", text = "The hunter trainers across the way send me every apprentice they take, and the city guard buys a few for the wall. And there's a nobleman who buys one a year and has never fired a single one, bless his purse." },
      },
      choices = {
        { text = "What do the guard want with rifles?", next = "guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = {
        { id = "guard_1", text = "To shoot from the gate towers, though they've nae the practice for it. I offered to drill them myself, and the captain said the king's guard had always carried crossbows, as if that were a reason." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    maker = {
      lines = {
        { id = "maker_1", text = "Do ye now! Then ye'll know the barrel's the heart of it, and that most who fail, fail at the boring. Bring one by, and I'll look down it and tell ye the truth, which nae maker's friends ever will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "carry_1", text = "A long rifle with a walnut stock, plain as a plank, sighted for two hundred paces. The fancy ones are for selling. The one I'd trust my beard to has nae a mark on it but my own." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "Word from the mountain is that the Dark Irons have been buying powder through go-betweens. I check who I sell to twice as carefully now." } },
    advice = { { id = "tp_x_advice", text = "Keep yer powder dry and yer barrel clean, and never point it at anything ye wouldn't pay to replace." } },
    background = { { id = "tp_bg", text = "Born in Ironforge, apprenticed to a gunsmith, and sent south to sell to the humans. Best thing that ever happened to me." } },
    trade = { { id = "tp_trade", text = "Guns, powder and shot. Everything else is just something ye wear while ye shoot." } },
    _none = { { id = "tp_none", text = "Never heard of it. Is it loud? If it's not loud, I don't know it." } },
  },
}

-- Joachim Brenlow: bartender of the Blue Recluse in the Mage Quarter.
P:NPC {
  key = "joachim_brenlow", id = TODO_NPC("Joachim Brenlow"), name = "Joachim Brenlow", title = "Bartender", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "smooth" }, values = { "practical" },
  notices = { "drink", "arcane" },
  impression = {
    first = "Joachim Brenlow keeps the bar at the Blue Recluse, and he pours as if every glass were a secret he's agreed to keep. The mages drink here, and he knows all their orders.",
    third = "{name} met Joachim Brenlow, who pours at the Blue Recluse in the Mage Quarter.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Good evening. The room's full of mages tonight, so speak softly and don't ask anyone what they're working on." },
    { id = "g_default", text = "Welcome to the Blue Recluse. What'll it be? The Dalaran Noir is excellent, if a little dear." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I remember you. The usual, or are we feeling adventurous tonight?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for it, isn't it? The mages are just getting started, so you'll have company." },
  },
  notice = {
    { id = "n_x1", cat = "arcane", when = { class = "WARLOCK" },
      text = "You'll want the Slaughtered Lamb, I'd have thought. No? Then you're welcome here, and I'll only ask that your companion stays outside." },
    { id = "n_x2", cat = "drink", when = { race = "Dwarf" },
      text = "A dwarf at a wine bar. I'll not insult you with the list; I've one cask of stout I keep for exactly this, and it's yours." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage! Your lot make up most of my trade. I'll ask you what I ask them all: no conjured water in my glasses, please." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a few already, I can see. I'll pour you something light, and you can thank me tomorrow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Joachim Brenlow, at your service. The Blue Recluse serves the finest wine and spirits in the Mage Quarter, and Angus Stern's kitchen serves the finest food, as he'll tell you himself." },
      },
      again = {
        { id = "h_x_again1", text = "Something else? I've glasses to polish, but they'll wait." },
        { id = "h_again", text = "Anything else? I'm only polishing glasses." },
        { id = "h_again2", text = "Another round of questions, then?" },
      },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "Who drinks at the Blue Recluse?", next = "patrons" },
        { text = "What's the Dalaran Noir?", next = "noir" },
        { text = "You must hear all sorts of secrets.", next = "secrets" },
        { text = "How did you come to keep bar for mages?", next = "how" },
        { text = "What do mages drink?", next = "drink" },
        { text = "What does the Sanctum say when it's had a few?", next = "sanctum", when = { class = "MAGE" } },
        { text = "Good night, Joachim.", next = "END" },
      },
    },
    patrons = {
      lines = { { id = "p_default", text = "Mages from the Sanctum, mostly, and the scholars who wish they were mages. The odd noble comes in to be seen, and a few adventurers who've heard the food is good, which it is." } },
      choices = {
        { text = "And Angus? Is he as particular as they say?", next = "angus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    angus = {
      lines = { { id = "a_default", text = "Worse, and I say that with love. He sent back a sauce last week because the colour was a shade too yellow, and then he made it again three times before he was happy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    noir = {
      lines = { { id = "n_default", text = "A dark red from the vineyards near Dalaran, or so the label says, and there are fewer bottles of it every year. When it's gone, it's gone; nobody's making more while the city sits behind its shield.", fx = { learn = { "dalaran" } } } },
      choices = { { text = "Then I'll have it while I can. Something else.", next = "BACK" } },
    },
    secrets = {
      big = true,
      lines = { { id = "s_default", text = "I hear everything, and I repeat nothing, which is why the mages keep coming back. A barman who talks is a barman with an empty room." } },
      choices = {
        { text = "Good. A man's word is worth keeping.", next = "BACK", reply = "It is, and it's worth more than the wine. Thank you for saying so.", fx = { align = { honor = 1 } } },
        { text = "A little gossip never hurt anyone.", next = "BACK", reply = "Then you've never been the subject of it. I'll keep my silence.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    how = {
      lines = {
        { id = "how_1", text = "I answered a notice. It asked for a barman who could pour, count, and hold his tongue, and I've never been much good at counting. The owner said two out of three would do, and that the third was the one that mattered least." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = {
        { id = "drink_1", text = "The young ones drink whatever's sweet and strong, and the old ones drink one glass of something dear and make it last the evening. Now and then one of them chills his own wine with a finger, and I pretend not to see, because the ice bill is what it is." },
      },
      choices = {
        { text = "Does anyone ever cause trouble?", next = "trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "trouble_1", text = "Twice a year a pair of apprentices decide to settle an argument with sparks. I've a bucket of sand behind the bar and a standing arrangement with the Sanctum, and they're sent back in the morning to scrub my floor by hand." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sanctum = {
      lines = {
        { id = "sanctum_1", text = "A fellow mage ought to know better than to ask. I'll say only that the higher the robe, the more they complain about apprentices, and that every one of them was the worst apprentice of their year, to hear the others tell it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_x_advice", text = "Order the house red and tip the cook. Angus remembers who appreciates him, and his memory's reflected in the portions." } },
    dalaran = { { id = "tp_x_dalaran", text = "Half my regulars studied there, and they don't raise a glass to it. They raise it and say nothing, and I leave the bottle." } },
    background = { { id = "tp_bg", text = "I've poured drinks in this city since I was tall enough to see over the bar." } },
    rumors = { { id = "tp_rum", text = "I don't spread them, but I'll say the mages have been nervous about Nethergarde lately." } },
    _none = { { id = "tp_none", text = "Can't help you there, I'm afraid. Another drink, perhaps?" } },
  },
}

-- Evan Larson: hatter in the Mage Quarter, of the Larson Clothiers.
P:NPC {
  key = "evan_larson", id = TODO_NPC("Evan Larson"), name = "Evan Larson", title = "Hatter", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "craft" },
  notices = { "class", "status" },
  impression = {
    first = "Evan Larson sells hats and helms in the Mage Quarter, near Wynne Larson's cloth, and he has an opinion about everyone's head. He measures by eye and is rarely wrong.",
    third = "{name} met Evan Larson, the hatter of Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "g_x1", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "Come in, come in. You've the bearing for a proper hat, and I can't say that of everyone who wears a robe." },
    { id = "g_default", text = "A new head! Come in, come in, let me look at you. Oh, yes, I think we can do something here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I remember the shape of your head, you know; I never forget a head." },
  },
  notice = {
    { id = "n_x1", cat = "status", when = { origin = "human_minor_noble" },
      text = "Now that's a head that's been measured by a court hatter before. I shan't embarrass us both by guessing which one." },
    { id = "n_x2", cat = "class", when = { race = "NightElf" },
      text = "Forgive me for staring. It's the ears, you see; I've been trying to cut a brim that would sit round a pair like those for two years." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A helm man, I see. I keep a few good mail coifs at the back for folk who'd sooner keep their skulls than their style." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "A robe-wearer! You'll want something with a brim, then, or a circlet at least. The Sanctum's mages are terribly particular about brims." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Evan Larson, hatter. Wynne sells the cloth and robes, and I sell what goes on top, which is the part people look at first, so it's the more important trade, whatever she says." },
      },
      again = {
        { id = "h_x_again1", text = "Another question? Ask it, and I'll look at your hat while you do." },
        { id = "h_again", text = "Anything else? I've a feathered cap you'd look splendid in." },
        { id = "h_again2", text = "Yes, yes? I'm listening and measuring." },
      },
      choices = {
        { text = "Show me your hats.", next = "BUSINESS" },
        { text = "Are you related to Wynne Larson?", next = "wynne" },
        { text = "What do the mages wear on their heads?", next = "mages" },
        { text = "A hat's a hat. Who cares?", next = "care" },
        { text = "How do you measure a head by eye?", next = "measure" },
        { text = "You must know everyone in the Mage Quarter.", next = "quarter" },
        { text = "What goes into a good hat?", next = "making", when = { profession = "Tailoring" } },
        { text = "Good day.", next = "END" },
      },
    },
    wynne = {
      lines = { { id = "w_default", text = "Family, yes, and we share a wall and an argument about which of us is the real draw. She says customers come for robes; I say they come for robes and leave with a hat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mages = {
      lines = { { id = "m_default", text = "Wide brims for the older ones, so nobody can see if they're asleep in the lectures, and circlets for the young ones who want to look clever. I sell both, and I don't ask who's asleep." } },
      choices = {
        { text = "What would you put on me?", next = "me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    me = {
      lines = {
        { id = "me_default", text = "Something with a little height, I think, and a dark band. You have the look of someone who'll be seen from across a battlefield, so you'd best be seen well." },
        { id = "me_gnome", when = { race = "Gnome" }, text = "Something tall, and I mean that respectfully, because a gnome in a tall hat is a gnome who's noticed. You'd be amazed how many I sell to Tinker Town." },
        { id = "me_dwarf", when = { race = "Dwarf" }, text = "A good helm, with room for the beard to spill out the bottom. Dwarves never want a hat, but they always want a helm, and I respect it." },
      },
      choices = { { text = "I'll think about it. Something else.", next = "BACK" } },
    },
    care = {
      big = true,
      lines = { { id = "c_default", text = "Everyone cares, friend, even those who say they don't, and especially those. You'll wear something on your head every day you're out there, so it might as well be made right." } },
      choices = {
        { text = "Fair. A thing done right is worth paying for.", next = "BACK", reply = "Exactly! You've the makings of a good customer.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll wear whatever I find on the road.", next = "BACK", reply = "And you'll look it, too. Come back when you've changed your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    measure = {
      lines = {
        { id = "measure_1", text = "Thirty years of looking at heads, friend, and a hatter's block for each size hanging in the back. I look at the brow and the ears and how a person carries their chin, and I'm out by a finger's width once in a hundred." },
      },
      choices = {
        { text = "And when you're out?", next = "out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    out = {
      lines = {
        { id = "out_1", text = "Then I steam it, stretch it, and never speak of it again. Wynne caught me at it once and has told the story to every customer since, with the head getting larger each time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter = {
      lines = {
        { id = "quarter_1", text = "By their heads, at any rate. The Sanctum's mages wear my brims, the Blue Recluse's patrons leave theirs on my counter when they've had too much, and the lot from the Slaughtered Lamb keep their hoods up and buy nothing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    making = {
      lines = {
        { id = "making_1", text = "A good felt, a block that fits, steam, and patience. The trim's what people pay for, but it's the stiffening that keeps a hat a hat after a week of rain, and that's the part I'll never show a rival." },
        { id = "making_2", when = { profession = "Tailoring", class = "MAGE" }, text = "Felt, steam and a true block, and for a mage's hat a lining of mageweave, if you can get it. It doesn't do a thing for the spells, whatever they tell you at the Sanctum, but it keeps the point from drooping." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "A gentleman bought a very deep hood from me last week and paid double not to be remembered. I've forgotten him entirely, as you can tell." } },
    advice = { { id = "tp_x_advice", text = "Buy the hat that fits and not the hat you admire. An admired hat on the wrong head is only a joke people are too polite to make." } },
    background = { { id = "tp_bg", text = "A Larson, and Larsons have dressed this quarter for three generations. I took the top half." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Now, if you'd asked about brims..." } },
  },
}

-- Heinrich Stone: blade merchant in Old Town.
P:NPC {
  key = "heinrich_stone", id = TODO_NPC("Heinrich Stone"), name = "Heinrich Stone", title = "Blade Merchant", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "dry" }, values = { "craft", "practical" },
  notices = { "class", "soldier" },
  impression = {
    first = "Heinrich Stone sells swords in Old Town, close by the barracks, and most of his customers are soldiers spending their first pay. He tests every edge on his thumb and has the scars to show for it.",
    third = "{name} met Heinrich Stone, the blade merchant of Old Town.",
  },
  greetings = {
    { id = "g_x1", when = { class = { "WARRIOR", "PALADIN" } }, text = "There's a hand that knows a hilt. Try anything on the rack, and tell me if the balance offends you." },
    { id = "g_x2", when = { timeOfDay = "night" }, text = "Late for buying steel, friend. I'll sell it, but I'll ask what the hurry is." },
    { id = "g_default", text = "Swords, friend, long and short, and every one of them sharp. Have a look, and don't touch the edges unless you're buying." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your blade's chipped, I'd wager, or you'd not be here." },
  },
  notice = {
    { id = "n_x1", cat = "soldier", when = { origin = "human_city_guard" },
      text = "One of the guard's own. You'll have been issued a blade, and you'll have noticed what's wrong with it, or you wouldn't be here." },
    { id = "n_x2", cat = "class", when = { race = "Dwarf" },
      text = "A dwarf, looking at human steel! Be kind, friend. I know what you're used to, and I buy from your cousins when I can afford them." },
    { id = "n_warrior", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've the shoulders of someone who swings for a living. I've something here that'll suit them." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You'll want something short and quiet, I expect, from that lot over at SI:7. I've daggers too, at the back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Heinrich Stone, blade merchant, and I've sold swords on this street since before the city walls went back up. The barracks are just around the corner, so I see a lot of fresh soldiers and a lot of broken swords." },
      },
      again = {
        { id = "h_x_again1", text = "Anything else? I've an edge to finish." },
        { id = "h_again", text = "Anything else? I've an edge to put on that broadsword." },
        { id = "h_again2", text = "Go on, I've a minute between whetstones." },
      },
      choices = {
        { text = "Let me see the blades.", next = "BUSINESS" },
        { text = "What makes a good sword?", next = "good" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Swords are for the guard, not common folk.", next = "common" },
        { text = "You test every edge on your thumb.", next = "thumb" },
        { text = "What do the barracks issue their soldiers?", next = "issue" },
        { text = "Do you sell anything shorter and quieter?", next = "short", when = { class = "ROGUE" } },
        { text = "I forge blades. Would you buy from me?", next = "buy", when = { profession = "Blacksmithing" } },
        { text = "Not today.", next = "END" },
      },
    },
    good = {
      lines = { { id = "gd_default", text = "Good steel, a balance you don't notice, and an edge that keeps. Most folk ask about the hilt first, which is how I know they've never had to use one." } },
      choices = {
        { text = "Who makes your blades?", next = "makers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makers = {
      lines = { { id = "m_default", text = "The dwarves in the district make the best, and I buy what I can afford of theirs. The rest come from the smithies in the Trade District, and I sharpen those twice before I'll sell them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Footmen with their first pay, mostly, and old soldiers who want a better blade than the crown gave them. Every so often a noble's son buys the shiniest thing I have, and I sell it to him with a straight face." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    common = {
      big = true,
      lines = { { id = "c_default", text = "The guard can't be everywhere, friend, and the Defias don't wait for them. A man who can defend his own door is a man who doesn't need to call for help." } },
      choices = {
        { text = "Every citizen should be able to defend himself.", next = "BACK", reply = "That's what I say, and I'll sell him the sword to do it.", fx = { align = { order = -1 } } },
        { text = "Leave the swords to the guard. That's what they're for.", next = "BACK", reply = "Then you'd best hope the guard's on your street when you need it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thumb = {
      lines = {
        { id = "thumb_1", text = "I do, and it's cost me most of the feeling in it. A stone tells you a blade's sharp, but only skin tells you how it's sharp, whether it bites or slides, and the customer's the one who has to live with the difference." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    issue = {
      lines = {
        { id = "issue_1", text = "A plain arming sword from the royal armoury, made by the hundred and good for a year of drill. They're honest swords, but every one's the same length whoever's holding it, and so the tall lads and the short ones all end up at my door." },
      },
      choices = {
        { text = "Who trains them to use it?", next = "trains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trains = {
      lines = {
        { id = "trains_1", text = "Wu Shen and Ilsa Corbin, at the Command Center round the corner, and they send their students to me when they've outgrown the issue blade. Ilsa told me once that half of swordsmanship is having the right sword, and I've quoted her ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "I'm a sword man, and I'll not pretend otherwise. But I keep a few long knives under the counter for sailors and such, and I don't ask what such means. For anything finer you'd want the folk who trade behind the barracks, and you didn't hear of them from me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buy = {
      lines = {
        { id = "buy_1", text = "If the steel's good and the price is fair, gladly. Bring me one finished blade, and I'll put it on the stone and the thumb, and if it passes both I'll take a dozen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "The barracks have ordered twice the usual swords this season. Nobody's said why, and I'd sooner they had." } },
    advice = { { id = "tp_x_advice", text = "Buy for the balance and not for the polish. You'll be holding it for hours, and looking at it hardly ever." } },
    background = { { id = "tp_bg", text = "A soldier once, a merchant now, and the swords are the only thing that's stayed the same." } },
    _none = { { id = "tp_none", text = "Can't say I know that one. Ask me about steel." } },
  },
}

-- Julia Gallina: wine vendor at the counter of the Gallina Winery.
P:NPC {
  key = "julia_gallina", id = TODO_NPC("Julia Gallina"), name = "Julia Gallina", title = "Wine Vendor", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "warm" }, values = { "practical", "loyal" },
  notices = { "drink", "light" },
  impression = {
    first = "Julia Gallina sells wine at the counter of the Gallina Winery on the canals, while Suzetta keeps the tally and Roberto keeps the cellar. She smiles easily and charges full price.",
    third = "{name} met Julia Gallina, who sells wine at the Gallina Winery's counter.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "We're nearly closed, but there's always time for one more bottle. What's the occasion?" },
    { id = "g_default", text = "Welcome to the Gallina Winery! Red, white, or something for a cold night by the canal?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you came back! The wine's that good, isn't it? I knew it would be." },
  },
  notice = {
    { id = "n_x1", cat = "drink", when = { race = "Dwarf" },
      text = "A dwarf! I shan't pretend we've anything to rival Thunderbrew, but try the port, and tell your cousins we're not all water down here." },
    { id = "n_x2", cat = "light", when = { class = "PALADIN" },
      text = "A knight of the Light. The Cathedral orders its table wine from us, so you've likely had our red without knowing it." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest! We've a sacramental red that the Cathedral should be buying, if only they'd try it." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've already started, I see. I'll sell you a bottle for later, then, and not for now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Julia, at the counter, and I sell what Roberto keeps in the cellar and what Suzetta lets me sell, which isn't always the same. Renato's the one shouting in the square, if you've met him." },
      },
      again = {
        { id = "h_x_again1", text = "Something else? I've only the shelf to dust." },
        { id = "h_again", text = "Anything else? I've a bottle open if you'd like to taste." },
        { id = "h_again2", text = "Go on, I'm only dusting the bottles." },
      },
      choices = {
        { text = "Let me see your wines.", next = "BUSINESS" },
        { text = "What's the best you have?", next = "best" },
        { text = "Does Renato really give wine away?", next = "renato" },
        { text = "Wine is a waste of good coin.", next = "waste" },
        { text = "What's it like, working for family?", next = "family" },
        { text = "Where do the grapes come from?", next = "grapes" },
        { text = "Which of these would you cook with?", next = "cook", when = { profession = "Cooking" } },
        { text = "I carried one of Renato's adverts.", next = "advert", when = { questDone = TODO_QUEST("Wine Shop Advert") } },
        { text = "Good day.", next = "END" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Roberto would say the merlot, and he'd go on about it for an hour, so I'll save you the trouble. The merlot, then, and a bottle of the white for whoever you're sharing it with." } },
      choices = {
        { text = "Who buys the merlot?", next = "merlot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    merlot = {
      lines = { { id = "m_default", text = "Taverns, mostly, and a barkeep in Lakeshire who sends for a cask whenever the roads are open. Lately they rarely are, so Roberto has a cask set aside, waiting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    renato = {
      lines = { { id = "r_default", text = "Tickets for tastings, yes, and Suzetta has a fit every time he does it. He says it brings in customers, and he's not wrong, but most of them never buy a thing." } },
      choices = { { text = "Something else, Julia.", next = "BACK" } },
    },
    waste = {
      big = true,
      lines = { { id = "w_default", text = "Some say so, but a good bottle shared with friends is worth more than gold, and I'll stand by that. Of course, I would say that, wouldn't I?" } },
      choices = {
        { text = "You're right. A shared bottle's a good thing.", next = "BACK", reply = "There, you see? You're smarter than you look.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Gold's still better. It keeps.", next = "BACK", reply = "So does wine, if it's good, and it only gets better. Gold doesn't.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "family_1", text = "Loud, mostly. Suzetta counts every copper, Roberto fusses over every cask, Renato gives away the profits, and I stand at the counter and smile at whoever walks in on the argument." },
      },
      choices = {
        { text = "Who usually wins?", next = "wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wins = {
      lines = {
        { id = "wins_1", text = "Suzetta, because she holds the cashbox. But Roberto has the cellar key, so now and then he locks himself in with the good merlot until she apologises, and we sell nothing but white for a day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grapes = {
      lines = {
        { id = "grapes_1", text = "From the Maclure vineyards in Elwynn, when the harvest gets through. Lately there've been thieves in the vines, and Roberto reads every delivery note twice over as though it were a letter from the front." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_1", text = "The white, for fish, and never the good red, whatever a chef tells you. Angus Stern at the Blue Recluse buys our cheapest by the cask for his sauces and our dearest by the bottle for himself, and that tells you what a cook really thinks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    advert = {
      lines = {
        { id = "advert_1", text = "Did you? Then you've met him at full volume. We had six new customers that week who asked for \"the free wine\", and Suzetta made Renato serve every one of them himself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "Lakeshire's barkeep hasn't sent for his cask in a month. Roberto worries for the wine, and I worry for the barkeep." } },
    advice = { { id = "tp_x_advice", text = "Lay a bottle on its side, in the dark, and forget you own it. That's all the cellaring most people need." } },
    background = { { id = "tp_bg", text = "I've stood at this counter since I could reach it. The bottles were taller than me then." } },
    _none = { { id = "tp_none", text = "No idea, sorry. Would you like a glass while you think of something else?" } },
  },
}

-- Ol' Beasley: a beggar in Old Town.
P:NPC {
  key = "ol_beasley", id = TODO_NPC("Ol' Beasley"), name = "Ol' Beasley", gender = "male",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "wry" }, values = { "practical" },
  notices = { "purse" },
  impression = {
    first = "Ol' Beasley begs in Old Town near the barracks, and he watches the street with an eye sharper than most guards'. He asks for coin politely, and he takes a refusal with good grace.",
    third = "{name} met Ol' Beasley, a beggar of Old Town.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Evenin', friend. Mind how you go round the back of the barracks at this hour, there's folk about who don't beg for their coin." },
    { id = "g_x2", when = { money = { min = 500000 } }, text = "That's a heavy purse you're walking with, friend. I'd not ask for much of it, only that you tie it tighter in Old Town." },
    { id = "g_default", text = "Spare a copper for an old man, friend? I'll not ask twice, and I'll thank you either way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I remember your face. Not many do come back, you know." },
  },
  notice = {
    { id = "n_x1", cat = "purse", when = { class = { "PRIEST", "PALADIN" } },
      text = "Bless you, {class}. The Cathedral's almoner comes by on feast days, and you've the same look about you, of somebody who sees a person and not a doorway." },
    { id = "n_x2", cat = "purse", when = { origin = "human_stonemason_child" },
      text = "I know that jaw. Your father cut stone on the north wall, or I'm no judge, and he shared his bread with me more than once." },
    { id = "n_purse", cat = "purse", when = { minLevel = 30 },
      text = "You've a heavy purse, friend, and I can hear it from here. Mind the alley by the barracks; there's folk there who'd hear it too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ol' Beasley, they call me, and I've begged on this street long enough to know everyone who walks it. The soldiers give the most, oddly enough, and the nobles the least." },
      },
      again = {
        { id = "h_x_again1", text = "Somethin' else, friend? I've nowhere to be." },
        { id = "h_again", text = "Anything else? I've nowhere to be." },
        { id = "h_again2", text = "Go on, then. Time's the one thing I've got plenty of." },
      },
      choices = {
        { text = "How did you end up here?", next = "how" },
        { text = "What do you see from this corner?", next = "see" },
        { text = "Get a job, old man.", next = "job" },
        { text = "Who are Topper and Morris?", next = "friends" },
        { text = "The soldiers are the generous ones.", next = "soldiers" },
        { text = "My father was a mason. Did you know the guild?", next = "guild", when = { origin = "human_stonemason_child" } },
        { text = "You notice a lot for a man who says nothing.", next = "notice", when = { class = "ROGUE" } },
        { text = "Good luck to you.", next = "END" },
      },
    },
    how = {
      lines = { { id = "h_how", text = "The same as Topper and Morris, more or less; there was a farm, and then there wasn't. I came to the city because they said there'd be work rebuilding it, and there was, until I got too old to carry stone.", fx = { learn = { "stonemasons" } } } },
      choices = {
        { text = "You worked on the walls?", next = "walls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walls = {
      lines = { { id = "w_default", text = "I carried stone for the masons, and they were good to me, though the city wasn't good to them in the end. I hear some of them went west, angry, and I can't say I blame them, though I wish they'd not done what they did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    see = {
      lines = { { id = "s_default", text = "Soldiers coming and going, and SI:7's lot slipping in and out where they think nobody sees. I see, but I don't say, and that's why nobody bothers me." } },
      choices = { { text = "Then you'll not say I was here. Something else.", next = "BACK" } },
    },
    job = {
      big = true,
      lines = { { id = "j_default", text = "I had one, friend, carrying stone for this city's walls, until my back gave out. Now I've this corner, and it's honest enough, if not much." } },
      choices = {
        { text = "I'm sorry. That was unkind of me.", next = "BACK", reply = "No harm done, friend. You'd not be the first to say it, nor the last.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The city owes you nothing.", next = "BACK", reply = "Maybe not, but it took my back all the same. Good day to you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends = {
      lines = {
        { id = "friends_1", text = "Topper McNabb and Morris Lawry, who work the Trade District, where the pickings are better and the guards are quicker. We meet at the Cathedral steps on feast days and compare corners, like merchants." },
      },
      choices = {
        { text = "What do you compare?", next = "compare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    compare = {
      lines = {
        { id = "compare_1", text = "Who gives and who kicks, mostly. Topper says the bankers are the worst, and I say it's the nobles' footmen, who've only just got a clean coat and can't bear to be reminded." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers = {
      lines = {
        { id = "soldiers_1", text = "They are, and I've thought about why. A lad who's just had his first pay and knows where he's being sent next looks at an old man on the ground and sees how things can go. He gives so that it won't be him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    guild = {
      lines = {
        { id = "guild_1", text = "Knew it? I carried for it. VanCleef himself checked my loads, and he'd tell you to your face if one was short and thank you if it wasn't. Whatever he's become since, child, he was a fair master, and I'll not say otherwise to please a guard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    notice = {
      lines = {
        { id = "notice_1", text = "And you notice that I notice, which tells me your trade. Don't fret, friend. I've watched your sort go in and out of that barracks door for years, and I've never yet remembered a face when asked." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "There's been a new face watching the barracks from the tavern window, three days running. He's no beggar, because he's got good boots." } },
    advice = { { id = "tp_x_advice", text = "Give a beggar a copper and a good day, friend. The copper's for him, and the good day's so you remember he's a man." } },
    background = { { id = "tp_bg", text = "A farm, then the walls, then this corner. Not much of a story, but it's mine." } },
    stonemasons = { { id = "tp_sm", text = "Good men, mostly, who got cheated. What they did after, I can't speak for." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I only know this street." } },
  },
}

-- Sergeant Major Clate: the dwarf who keeps the Alliance's officers' armour in the Champions' Hall, Old Town.
P:NPC {
  key = "sergeant_major_clate", id = TODO_NPC("Sergeant Major Clate"), name = "Sergeant Major Clate", title = "Armor Quartermaster", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "stolid", "exact" }, values = { "dutiful", "honor" },
  notices = { "rank", "kit", "race" },
  impression = {
    first = "Sergeant Major Clate keeps the officers' armour in the Champions' Hall and has never been heard to raise his voice or lower a price. He reads a soldier's rank and the dents in their plate with the same slow care.",
    third = "{name} met Sergeant Major Clate, armour quartermaster of Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Well met. The armour on these racks is for those the Alliance has ranked, and I'm the one who checks the rank. Let's see yours." },
    { id = "g_2", when = { metBefore = true }, text = "Ye've returned. Has the rank changed, or only the dents?" },
    { id = "g_3", when = { pvpRank = false }, text = "No rank on ye at all, I see. Ye may look, and ye may ask, and when ye've fought for it ye may buy." },
  },
  notice = {
    { id = "n_1", cat = "rank", when = { pvpRank = { min = 6 } },
      text = "A knight's stripes, and honestly come by, from the look of that pauldron. There's a rack here ye've earned the right to open." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That plate's been through a battleground and not seen a hammer since. I sell new armour, but I'll not watch ye walk out in that without saying so." },
    { id = "n_3", cat = "race", when = { race = "Dwarf" },
      text = "A kinsman. Good. I'll not have to explain why a breastplate should outlast its owner." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Sergeant Major Clate, armour quartermaster. Every piece in this hall was made for an officer of the Alliance and is sold only to one, and I've held that line against dukes' sons and worse." },
        { id = "hello_2", when = { pvpRank = { min = 6 } }, text = "Sergeant Major Clate, armour quartermaster. Ye hold the rank, so the racks are open to ye. Choose slowly; ye'll be wearing it where the Horde can see." },
      },
      again = {
        { id = "hello_again1", text = "Was there more?" },
        { id = "hello_again2", text = "Go on. I've only the ledger to mind." },
        { id = "hello_again3", text = "Aye? Ask it." },
      },
      choices = {
        { text = "Show me the armour.", next = "BUSINESS" },
        { text = "Who decides what an officer may wear?", next = "decides" },
        { text = "Where is this armour made?", next = "made" },
        { text = "Rank shouldn't decide who gets good armour.", next = "rank" },
        { text = "I've begun to earn rank. What comes first?", next = "first", when = { pvpRank = { min = 1 } } },
        { text = "A dwarf, keeping Stormwind's armoury?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Who else serves in this hall?", next = "hall" },
        { text = "Good day, Sergeant Major.", next = "END" },
      },
    },
    decides = {
      lines = {
        { id = "decides_1", text = "The Alliance's high command sets it out, rank by rank, and I keep the list. A knight may wear this and a knight-captain that, and it's not my place to bend it, nor anyone's place to ask me." },
      },
      choices = {
        { text = "Has anyone asked?", next = "asked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    asked = {
      lines = {
        { id = "asked_1", text = "A nobleman's son, last spring, with a purse the size of his head and nae a day in the field. I told him the Arathi Basin was open to all, and that I'd hold the breastplate for him. He's not been back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    made = {
      lines = {
        { id = "made_1", text = "The plate's forged in Ironforge and fitted here, and the mail and leather come from the best hands in Stormwind and Darnassus. I inspect every rivet myself, because an officer who falls for want of a rivet falls in front of his whole company." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rank = {
      big = true,
      lines = {
        { id = "rank_1", text = "I've heard it said. But this armour marks a soldier out on the field, so that others know who to follow. Put it on someone who's not led, and ye've made a target of a fool and liars of the rest of us." },
      },
      choices = {
        { text = "Earned honours mean something. Keep the line.", next = "BACK", reply = "I intend to. It's good to hear it from the other side of the counter.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A recruit's life is worth as much as an officer's.", next = "BACK", reply = "It is. And the recruit's better served by a leader he can find in the smoke.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_1", text = "Fight where the Alliance asks, and fight well enough to be noticed. Warsong Gulch, Arathi, Alterac; the marshals keep count. Come back with a sergeant's stripe and I'll have something for yer shoulders." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dwarf_1", text = "Aye, and why not? Ironforge forged half of what hangs here. King Magni lent me to the hall when it was founded, and I've stayed because nae human I've met can tell good plate from polished tin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = {
        { id = "hall_1", text = "Lieutenant Jackspring has the weapons and Master Sergeant Biggins the smaller kit, both gnomes, and both sharper than they look. Lieutenant Karter keeps the war mounts out front. Guards Quine and Hammon keep the door, and Archmage Gaiman keeps to his chair." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ironforge = { { id = "tp_y_ironforge", text = "Home, and the only city I'd call properly built. Stormwind's handsome enough, for a place with so many windows." } },
    second_war = { { id = "tp_y_second_war", text = "I held a pass in Dun Algaz with forty dwarves and a great many rocks. The plate I wore that week hangs in my quarters, and it's uglier than anything on these racks." } },
    background = { { id = "tp_background", text = "A smith's son of Ironforge and thirty years a soldier. They gave me a counter when my knees gave out, and I've run it like a shield wall." } },
    rumors = { { id = "tp_rumors", text = "The marshals say the Horde has a hall like this in Orgrimmar. I'd like to see their armour, purely as a professional." } },
    advice = { { id = "tp_advice", text = "Buy the armour ye can move in. I've buried soldiers who bought the armour that looked best." } },
    trade = { { id = "tp_trade", text = "I don't haggle. The price is the price, and the rank is the rank." } },
    _none = { { id = "tp_none", text = "That's not a matter for this counter. Ask at the keep." } },
  },
}

-- Lieutenant Jackspring: the gnome who keeps the officers' weapons in the Champions' Hall, Old Town.
P:NPC {
  key = "lieutenant_jackspring", id = TODO_NPC("Lieutenant Jackspring"), name = "Lieutenant Jackspring", title = "Weapons Quartermaster", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "precise", "eager" }, values = { "invention", "dutiful" },
  notices = { "rank", "craft", "race" },
  impression = {
    first = "Lieutenant Jackspring keeps the officers' weapons in the Champions' Hall and can give the weight of any of them to the quarter-ounce. He stands on a crate to see over his own counter and has measured the crate, too.",
    third = "{name} met Lieutenant Jackspring, weapons quartermaster of Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the armoury! Weapons for ranked officers of the Alliance, catalogued by type, weight and reach. May I see your insignia?" },
    { id = "g_2", when = { metBefore = true }, text = "Ah, hello again! I've rebalanced the claymore since you were last in, by a hair, but you'd feel it." },
    { id = "g_3", when = { pvpRank = false }, text = "No rank yet? That's quite all right, I'm permitted to answer questions for anyone, and I've a great many answers." },
  },
  notice = {
    { id = "n_1", cat = "rank", when = { pvpRank = { min = 6 } },
      text = "Knight's insignia, authentic, slightly scorched. Excellent. You qualify for racks three through five, and I'd start at four." },
    { id = "n_2", cat = "craft", when = { profession = "Engineering" },
      text = "Is that solder on your cuff? A colleague! I've a repeating crossbow design the high command won't approve, and I'd value a second opinion that isn't \"no\"." },
    { id = "n_3", cat = "race", when = { race = "Gnome" },
      text = "A fellow Gnomereganer in the Champions' Hall! We're two of four, counting Biggins and a clerk at the keep. I keep statistics." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Lieutenant Jackspring, weapons quartermaster. Everything on these racks was made for an officer and tested by me personally, within the limits of my reach, which I've extended with a very good stepladder." },
        { id = "hello_2", when = { pvpRank = { min = 6 } }, text = "Lieutenant Jackspring, weapons quartermaster, and you're cleared to purchase. Tell me how you fight and I'll tell you what to carry, to within a tolerance of one weapon." },
      },
      again = {
        { id = "hello_again1", text = "Anything further? I've calibrations pending, but they're not urgent." },
        { id = "hello_again2", text = "Do go on, I'm listening closely." },
        { id = "hello_again3", text = "Yes? I have time for precisely one more question, or several." },
      },
      choices = {
        { text = "Show me the weapons.", next = "BUSINESS" },
        { text = "How does a gnome test a claymore?", next = "test" },
        { text = "What makes an officer's weapon different?", next = "different" },
        { text = "A gnome has no business judging swords.", next = "judge" },
        { text = "What should a newly ranked soldier save for?", next = "save", when = { pvpRank = { min = 1 } } },
        { text = "How did one of us end up in this hall?", next = "gnome", when = { race = "Gnome" } },
        { text = "Tell me about the repeating crossbow.", next = "crossbow", when = { profession = "Engineering" } },
        { text = "Good day, Lieutenant.", next = "END" },
      },
    },
    test = {
      lines = {
        { id = "test_1", text = "With a frame of my own design, which clamps the hilt and swings it at a post one hundred times. Then Sergeant Major Clate swings it once and says \"aye\" or doesn't. My frame and his \"aye\" have never yet disagreed, which I find scientifically satisfying." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    different = {
      lines = {
        { id = "different_1", text = "Better steel, truer balance, and a mark that tells the whole line whose it is. An officer's weapon is seen as much as it's used, and a company fights harder under a blade it recognises." },
      },
      choices = {
        { text = "Who forges them?", next = "forges" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forges = {
      lines = {
        { id = "forges_1", text = "Dwarves, for the blades and hammers, and my own people for anything with a mechanism. The bows come from Darnassus by a sentinel who counts them twice and trusts me not at all, which I respect." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    judge = {
      big = true,
      lines = {
        { id = "judge_1", text = "I can't swing most of them, that's true. But I can tell you the point of balance, the flex under load and how many strikes before the edge turns, and no amount of arm tells you that. Measurement is how you know a thing, and strength is only how you use it." },
      },
      choices = {
        { text = "Knowing a weapon matters more than swinging it.", next = "BACK", reply = "Thank you! I shall quote you to the Sergeant Major, with attribution.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Only someone who's bled with a blade should judge one.", next = "BACK", reply = "I've bled, sir. Gnomeregan wasn't lost quietly. But I take the point as intended.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    save = {
      lines = {
        { id = "save_1", text = "Don't buy the first thing your stripe permits. The step from sergeant to knight opens the better racks, and I'd sooner sell you one fine weapon then than two adequate ones now. I say this against my own sales figures." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gnome_1", text = "After Gnomeregan fell, the Alliance wanted every hand, and mine were good with numbers. High Tinker Mekkatorque seconded me to Stormwind, and I've sent him a report each month. He hasn't answered one, but he's very busy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crossbow = {
      lines = {
        { id = "crossbow_1", text = "Six bolts, one crank, eleven seconds! The high command says it jams. It does jam, one time in nine, and I maintain that the other eight are a considerable argument. I've got it to one in twelve since the review." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_y_trade", text = "Rank determines eligibility and coin determines purchase. I've a chart, if you'd like to see the chart." } },
    ironforge = { { id = "tp_y_ironforge", text = "Tinker Town is very hospitable and forty percent too small. I visit quarterly, and I bring my own stool." } },
    background = { { id = "tp_background", text = "An armourer's apprentice in Gnomeregan, and an exile since. I hold a lieutenant's commission, which I earned at a desk and am not ashamed of." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I think about it daily, at a rate I've stopped measuring. Every weapon I pass across this counter is one more argument for going back." } },
    rumors = { { id = "tp_rumors", text = "Biggins tells me the Horde's officers carry axes too heavy for any human to lift. I'd need to weigh one before I believed it." } },
    advice = { { id = "tp_advice", text = "Choose the weapon you can swing for an hour, not the one you can swing once impressively." } },
    _none = { { id = "tp_none", text = "I've no figures on that, and I never guess. Try the Sergeant Major." } },
  },
}

-- Master Sergeant Biggins: the gnome who keeps officers' insignia, cloaks and kit in the Champions' Hall, Old Town.
P:NPC {
  key = "master_sergeant_biggins", id = TODO_NPC("Master Sergeant Biggins"), name = "Master Sergeant Biggins", title = "Accessories Quartermaster", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "genial", "chatty" }, values = { "comfort", "dutiful" },
  notices = { "rank", "purse", "race" },
  impression = {
    first = "Master Sergeant Biggins keeps the tabards, insignia, cloaks and small comforts of the Alliance's officers and thinks them the most important stock in the Champions' Hall. He is the only quartermaster there who offers a visitor a seat.",
    third = "{name} met Master Sergeant Biggins, accessories quartermaster of Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in! Mind the step, sit if you like, and tell me what you're after. Insignia, cloaks, trinkets, I've the lot." },
    { id = "g_2", when = { metBefore = true }, text = "There you are again! I've put by a cloak in your colours, on the off chance." },
    { id = "g_3", when = { pvpRank = false }, text = "No rank yet? Never mind, never mind. Have a look round, and you'll know what you're fighting toward." },
  },
  notice = {
    { id = "n_1", cat = "rank", when = { pvpRank = { min = 3 } },
      text = "A sergeant's stripe or better, and worn on the proper side. You'd be surprised how many I have to turn round." },
    { id = "n_2", cat = "purse", when = { money = { min = 1000000 } },
      text = "You've done well for yourself, I see. Rank opens my cabinets and not gold, mind, but I'll admit gold makes the choosing pleasanter." },
    { id = "n_3", cat = "race", when = { race = "Gnome" },
      text = "One of ours! Jackspring will want to add you to his statistics. Humour him, there's a good {g:fellow|lass}; it's how he copes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Master Sergeant Biggins, accessories. Clate will tell you armour wins wars and Jackspring will tell you weapons do, and I say it's the tabard that tells a frightened recruit which way to run, so who's really doing the work?" },
        { id = "hello_2", when = { pvpRank = { min = 3 } }, text = "Master Sergeant Biggins, accessories, and you've the rank for my cabinets. Insignia first, I always say; the rest is only kit, but the insignia's who you are." },
      },
      again = {
        { id = "hello_again1", text = "Something else? I've all afternoon, and a pot on." },
        { id = "hello_again2", text = "Go on, do. I like a visitor." },
        { id = "hello_again3", text = "Yes, yes, ask away!" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What counts as an accessory?", next = "counts" },
        { text = "Who wears your insignia?", next = "wears" },
        { text = "Medals and cloaks are vanity.", next = "vanity" },
        { text = "What's my first insignia worth having?", next = "insignia", when = { pvpRank = { min = 1 } } },
        { text = "Do you miss Gnomeregan, Biggins?", next = "miss", when = { race = "Gnome" } },
        { text = "What goes on upstairs in this hall?", next = "lounge" },
        { text = "Good day, Master Sergeant.", next = "END" },
      },
    },
    counts = {
      lines = {
        { id = "counts_1", text = "Everything that isn't hitting or being hit. Tabards, cloaks, the rank insignia, signet rings, and one or two medallions the mages have had a go at. I also keep the good biscuits, which aren't regulation, and which I count as morale." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wears = {
      lines = {
        { id = "wears_1", text = "Every officer who's come through the battlegrounds, from sergeants up to the Grand Marshal, when there is one. They come in mud to the knees, and I pin the new stripe on myself, and that's the best part of this post by a long way." },
      },
      choices = {
        { text = "Who was the last you pinned?", next = "last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = {
        { id = "last_1", text = "A dwarf rifleman, made Knight-Lieutenant after Alterac, who wouldn't sit down because he'd not washed. I pinned it on him standing, and he went straight to the Pig and Whistle, and I'm told he bought for the house." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    vanity = {
      big = true,
      lines = {
        { id = "vanity_1", text = "Oh, I've heard that, usually from someone who's never been handed one. A stripe's a small bit of cloth that says somebody saw what you did. I've watched hard old soldiers go quiet when I pin it on, and that isn't vanity." },
      },
      choices = {
        { text = "Being seen for what you've done matters. You're right.", next = "BACK", reply = "There, you understand. Have a biscuit.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Soldiers should fight for the cause, not for ribbons.", next = "BACK", reply = "They do, friend. The ribbon's only how the cause says thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    insignia = {
      lines = {
        { id = "insignia_1", text = "The sergeant's, without question. It's the plainest thing in the cabinet and the one they all keep. I've had Knight-Champions come back in to ask if I'd a spare, because they'd worn the first one through." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = {
        { id = "miss_1", text = "Every day, though I miss the noise more than the place. Tinker Town's got the noise right, at least. I send half my pay there, and Jackspring sends reports, and between us we've done our bit for the old city." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lounge = {
      lines = {
        { id = "lounge_1", text = "The officers' lounge, for knights and above, with a fire and a good cellar. Archmage Gaiman reads there most days, and Sergeant Major Skyshadow stands by the window and says very little. I send up biscuits." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_y_gnomeregan", text = "We'll have it back. I've kept the key to the third-sector storeroom on a chain all this time, and I mean to use it." } },
    stormwind = { { id = "tp_y_stormwind", text = "A fine city with terrible doorknobs, all of them a foot too high. I've written to the keep about it." } },
    background = { { id = "tp_background", text = "I kept the stores in Gnomeregan's third sector. It was all filed beautifully, and I like to think the troggs have never found a thing." } },
    rumors = { { id = "tp_rumors", text = "They say there'll be a new battleground opened before long. I've ordered extra stripes, in hope." } },
    advice = { { id = "tp_advice", text = "Wear your insignia where your own side can see it. The other side will work out who you are soon enough." } },
    trade = { { id = "tp_trade", text = "Rank first, then coin. I don't make the rule, but I do rather like it." } },
    _none = { { id = "tp_none", text = "Oh, I couldn't say. Ask Clate; he won't say either, but he does it more impressively." } },
  },
}

-- Sergeant Major Skyshadow: a night elf officer who keeps to the Champions' Hall in Old Town.
P:NPC {
  key = "sergeant_major_skyshadow", id = TODO_NPC("Sergeant Major Skyshadow"), name = "Sergeant Major Skyshadow", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "remote", "watchful" }, values = { "duty", "balance" },
  notices = { "rank", "race", "class" },
  impression = {
    first = "Sergeant Major Skyshadow stands in the Champions' Hall as still as its banners and watches the officers come and go. She fought in Ashenvale before she ever saw a city of stone, and she has not decided what she thinks of this one.",
    third = "{name} met Sergeant Major Skyshadow, a night elf officer of the Alliance, in Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. This hall is for those who have fought under the Alliance's banners. If you are one, be welcome; if you are not yet, be patient." },
    { id = "g_2", when = { metBefore = true }, text = "You have returned. The hall has not changed, and I have not moved." },
    { id = "g_3", when = { race = "NightElf" }, text = "Elune-adore, {g:brother|sister}. It is good to hear a voice from home among so much stone." },
  },
  notice = {
    { id = "n_1", cat = "rank", when = { pvpRank = { min = 6 } },
      text = "You carry a knight's rank, and you carry it without swagger. Both are noted." },
    { id = "n_2", cat = "class", when = { class = "HUNTER" },
      text = "You walk like one who has stalked. In Ashenvale we would have put a bow in your hand and asked no more questions." },
    { id = "n_3", cat = "race", when = { race = "Human" },
      text = "Your people build to be seen. I am still learning whether that is courage or only noise." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Sergeant Major Skyshadow, of the Sentinels, and now of the Alliance's officers. I was sent here to learn how the younger races make war together, and to be seen learning it." },
        { id = "hello_2", when = { faction = "Horde" }, text = "I am Sergeant Major Skyshadow. I have fought your kind among the trees of Ashenvale, and I know the sound of your axes. You stand in the wrong hall." },
        { id = "hello_3", when = { pvpRank = { min = 1 } }, text = "I am Sergeant Major Skyshadow. You have begun to earn a place here, so I will speak to you as a comrade and not as a guest." },
      },
      again = {
        { id = "hello_again1", text = "There is more you would ask?" },
        { id = "hello_again2", text = "Speak. I am listening." },
        { id = "hello_again3", text = "Ask, and I will answer what I may." },
      },
      choices = {
        { text = "Where did you fight, before this hall?", next = "fought" },
        { text = "What do you make of Stormwind?", next = "stormwind" },
        { text = "You stand apart from the others here.", next = "apart" },
        { text = "I've fought at Warsong Gulch. Is that your war?", next = "warsong", when = { pvpRank = { min = 1 } } },
        { text = "Why does a Sentinel wear a human rank?", next = "rank", when = { race = "NightElf" } },
        { text = "Who else keeps this hall?", next = "others" },
        { text = "Elune light your path.", next = "END" },
      },
    },
    fought = {
      lines = {
        { id = "fought_1", text = "In Ashenvale, where the orcs cut the forest for their war engines. I led a company of Sentinels along the Warsong lumber roads for two years, and I learned that they do not tire and do not listen.", fx = { learn = { "sentinels" } } },
      },
      choices = {
        { text = "And what did they learn of you?", next = "learned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned = {
      lines = {
        { id = "learned_1", text = "That the forest has eyes, and that a tree they felled at dusk might cost them four by dawn. It did not stop them. It has slowed them, and I have learned to count that as a victory." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stormwind = {
      lines = {
        { id = "stormwind_1", text = "It is loud, and bright, and proud of having been rebuilt, as if a thing must fall before it is worth loving. But your soldiers stand watch through the night with only torches, seeing nothing, and they stand anyway. I did not expect that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    apart = {
      big = true,
      lines = {
        { id = "apart_1", text = "I do. Your officers drink together and boast, and it binds them, I see that. My people do not boast of war. We have ten thousand years of it, and we have learned that the one who boasts has not yet lost enough." },
      },
      choices = {
        { text = "There's wisdom in that. War is no cause for pride.", next = "BACK", reply = "Then you hear me better than most in this hall.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Soldiers need their pride. It's what brings them back to the line.", next = "BACK", reply = "Perhaps, for those with short lives. I will think on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warsong = {
      lines = {
        { id = "warsong_1", text = "It is. The Silverwing Sentinels hold that gulch for all our forests, and every flag you carried back was an acre of Ashenvale left standing. If you have bled there, you have my thanks, and I do not give them lightly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rank = {
      lines = {
        { id = "rank_1", text = "Because Tyrande asked it of us. The Alliance counts its soldiers in sergeants and knights, and we must be countable to be heard in their councils. I wear the stripe as I would wear a borrowed cloak, with care, and without mistaking it for my own skin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "The dwarf Clate, who is honest. The two gnomes, who are clever and kind and never silent. The mage Gaiman, who reads, and who has seen more war than he speaks of. And the guards at the door, who nod to me and wonder what I am thinking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A Sentinel of Ashenvale for longer than this city has stood. I do not say it to boast; it is only the number." } },
    sentinels = { { id = "tp_sentinels", text = "We are the eyes of the forest and Tyrande's hand. Here they call us scouts, which is near enough for stone-dwellers." } },
    rumors = { { id = "tp_rumors", text = "The officers speak of Horde war parties pressing deeper into Ashenvale. They speak of it as news. To me it is a letter from home." } },
    advice = { { id = "tp_advice", text = "Listen before you strike. The forest taught me that, and I have not found it false in a city." } },
    _none = { { id = "tp_none", text = "That is not known to me. I have been in your lands a short while, as I count time." } },
  },
}

-- Archmage Gaiman: a battle-mage of the Alliance who keeps a chair in the Champions' Hall, Old Town.
P:NPC {
  key = "archmage_gaiman", id = TODO_NPC("Archmage Gaiman"), name = "Archmage Gaiman", gender = "male",
  bible = "bibles/more_folk.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "dry", "tired" }, values = { "knowledge", "duty" },
  notices = { "arcane", "rank", "class" },
  impression = {
    first = "Archmage Gaiman sits in the Champions' Hall with a book he rarely turns the pages of, and the officers lower their voices when they pass him. He has thrown fire on three battlefields and would rather discuss almost anything else.",
    third = "{name} met Archmage Gaiman, a battle-mage of the Alliance, in Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've come for the quartermasters, they're by the racks. If you've come to ask a mage about war, I'd sit down first." },
    { id = "g_2", when = { metBefore = true }, text = "You again. Good. You're one of the few who doesn't ask me to set something on fire." },
    { id = "g_3", when = { class = "MAGE" }, text = "A colleague, in this hall of swordsmen. Pull up a chair, and tell me they're still teaching the fundamentals at the Sanctum." },
  },
  notice = {
    { id = "n_1", cat = "arcane", when = { class = "MAGE" },
      text = "Your wards are well made, if a little eager. I was the same at your age, and it very nearly cost me an eyebrow and a company of footmen." },
    { id = "n_2", cat = "rank", when = { pvpRank = { min = 6 } },
      text = "A knight of the battlegrounds. Then you've stood where the spells land, and you'll have opinions about mages who aim badly." },
    { id = "n_3", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell what you practise. I've fought beside your kind when the line was failing, and I was glad of you, and I slept badly afterwards." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Archmage Gaiman. The Kirin Tor trained me and the Alliance borrowed me, and I've been on loan ever since. I advise the officers here on what magic can and can't do in a battle, and they mostly want to hear about the first part." },
        { id = "hello_2", when = { class = "MAGE" }, text = "Archmage Gaiman, formerly of Dalaran and lately of wherever the Alliance needs something large set alight. You'll understand, as they don't, that I find it the least interesting use of the art." },
      },
      again = {
        { id = "hello_again1", text = "Something more? The book will wait; it always does." },
        { id = "hello_again2", text = "Go on. I've nowhere pressing to be." },
        { id = "hello_again3", text = "Ask, by all means." },
      },
      choices = {
        { text = "What does a mage do in a battle?", next = "battle" },
        { text = "What are you reading?", next = "reading" },
        { text = "Magic wins wars. You should be proud of it.", next = "proud" },
        { text = "What should a mage know before the battlegrounds?", next = "know", when = { class = "MAGE" } },
        { text = "What should a soldier know about fighting beside mages?", next = "beside", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "HUNTER" } } },
        { text = "Why keep a mage in a soldiers' hall?", next = "hall" },
        { text = "Good day, Archmage.", next = "END" },
      },
    },
    battle = {
      lines = {
        { id = "battle_1", text = "Two things, chiefly. One is to break a charge before it lands, which is frost and timing. The other is to keep the enemy's shamans and warlocks from doing the same to our side, which is most of the work and none of the glory." },
      },
      choices = {
        { text = "And the fire?", next = "fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = {
        { id = "fire_1", text = "The fire is what they remember, and what the bards put in. It's the crudest thing I do, and it's the one I'm asked for by name. I've come to think of it the way a surgeon thinks of the saw." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    reading = {
      lines = {
        { id = "reading_1", text = "A treatise on the ley lines beneath Arathi, by a colleague who didn't survive Dalaran. I've read it nine times. I keep hoping that on the tenth I'll find the page where he explains why the Basin matters so much to both sides." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    proud = {
      big = true,
      lines = {
        { id = "proud_1", text = "I'm proud of the soldiers who went home because a charge broke forty yards short of them. I'm not proud of how I broke it. Those are separate ledgers, and a mage who lets them run together ends by enjoying his work." },
      },
      choices = {
        { text = "Power should weigh on the one who uses it.", next = "BACK", reply = "It should. I'm glad to hear someone say it who isn't a mage.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "In war you use what wins, and you don't apologise.", next = "BACK", reply = "I use it. I've never refused. I only decline to be cheerful about it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = {
        { id = "know_1", text = "That your own side will stand closer to your target than you'd like, every time. Learn to hold a spell half-cast for three breaths while you check where the footmen are. No one teaches it, and it's the whole of the craft out there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    beside = {
      lines = {
        { id = "beside_1", text = "Don't stand between us and what we're looking at, and when one of us shouts \"down\", get down first and ask afterwards. And if the mage beside you goes quiet and pale, {g:he's|she's} out of strength, not courage, so put a shield in front of {g:him|her}." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = {
        { id = "hall_1", text = "Because the high command wants its officers to think of magic as a branch of the army, like cavalry. So they put a mage where the officers drink. Biggins sends up biscuits, and Sergeant Major Skyshadow and I sit in silence, which suits us both." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stormwind = { { id = "tp_y_stormwind", text = "The Sanctum here is a good school, and young. It hasn't yet had a disaster of its own to learn from, and I hope it never does." } },
    second_war = { { id = "tp_y_second_war", text = "I was an apprentice carrying water for the mages at Blackrock Spire. I thought fire was glorious until I saw what it left." } },
    background = { { id = "tp_background", text = "Dalaran taught me, and I was in the field when it fell, which is the only reason I'm here to say so." } },
    dalaran = { { id = "tp_dalaran", text = "I'll speak of the libraries, if you like, or of the streets in spring. I'd rather not speak of the end." } },
    rumors = { { id = "tp_rumors", text = "The officers say the Horde's shamans are calling storms over Alterac Valley. If that's true, somebody on their side has stopped caring what it costs." } },
    advice = { { id = "tp_advice", text = "Count your own side before you cast. Then count them again." } },
    _none = { { id = "tp_none", text = "That's outside what I know, and I've learned not to improvise." } },
  },
}

-- Guard Quine: the younger of the two guards at the door of the Champions' Hall, Old Town.
P:NPC {
  key = "guard_quine", id = TODO_NPC("Guard Quine"), name = "Guard Quine", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "curious" }, values = { "dutiful", "learning" },
  notices = { "rank", "class", "travel" },
  impression = {
    first = "Guard Quine keeps the door of the Champions' Hall and asks every returning officer one question about where they have been. He writes the answers down afterwards and hopes one day to see the places for himself.",
    third = "{name} met Guard Quine, who keeps the door of Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Good evening! The hall's quieter at night, and the officers who come now mostly come to sit. I don't ask those ones my question." },
    { id = "g_default", text = "Good day! This is the Champions' Hall. Officers of the Alliance may enter freely, and everyone else may enter politely." },
    { id = "g_2", when = { metBefore = true }, text = "Welcome back! Have you been anywhere new since? I'd be glad to hear it, if you've a moment." },
    { id = "g_3", when = { pvpRank = { min = 6 } }, text = "Sir! The hall's yours, sir. Might I ask which battleground, sir? It's for my notes." },
  },
  notice = {
    { id = "n_1", cat = "rank", when = { pvpRank = { min = 1 } },
      text = "You've rank on your collar. I'm supposed to nod and stand aside, and I will, but I'd dearly like to know how you came by it." },
    { id = "n_2", cat = "travel", when = { minLevel = 40 },
      text = "You've the dust of three or four kingdoms on that cloak. I've only ever seen the one, and most of that from this doorway." },
    { id = "n_3", cat = "class", when = { race = { "NightElf", "Gnome", "Dwarf" } },
      text = "We see all the Alliance's peoples at this door. I've been learning the proper greetings, and I'd be obliged if you'd correct mine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Guard Quine, door watch, Champions' Hall. Hammon has the left side and I have the right, and between us we see every officer in the Alliance sooner or later. I've met more heroes than a bard has, and I've not left Old Town in two years." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Guard Quine, door watch. You're not coming in, and I'd as soon you weren't standing there when Hammon looks round." },
      },
      again = {
        { id = "hello_again1", text = "Is there anything else? I'm not due relief for hours." },
        { id = "hello_again2", text = "Please, go on." },
        { id = "hello_again3", text = "Yes? I'm glad of the company, truthfully." },
      },
      choices = {
        { text = "What do you write in those notes?", next = "notes" },
        { text = "What's it like, guarding heroes?", next = "heroes" },
        { text = "A guard should guard, not daydream.", next = "daydream" },
        { text = "I'll tell you about the battlegrounds.", next = "tell", when = { pvpRank = { min = 1 } } },
        { text = "I've seen a good deal of the world. Ask me something.", next = "ask", when = { minLevel = 40 } },
        { text = "Who's inside the hall today?", next = "inside" },
        { text = "Good day, Quine.", next = "END" },
      },
    },
    notes = {
      lines = {
        { id = "notes_1", text = "Places, mostly. A knight tells me there's a gulch in Ashenvale where the trees are as wide as this hall, and I write it down. A dwarf tells me the snow in Alterac comes up to his beard, and I write that down, with a note about the height of the dwarf." },
      },
      choices = {
        { text = "What will you do with them?", next = "plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      lines = {
        { id = "plans_1", text = "Go and look, when my service is up, and see how much of it was true. Hammon says soldiers lie about three things, which are the size of the enemy, the depth of the snow and the quality of the ale, so I expect to be surprised." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    heroes = {
      lines = {
        { id = "heroes_1", text = "Stranger than you'd think. They come in tired, mostly, and they're kinder than the nobles. A Knight-Captain once held this door for me while I fixed my boot, and I've not known what to do with that since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    daydream = {
      big = true,
      lines = {
        { id = "daydream_1", text = "Hammon says the same, and he's forgotten more about guarding than I know. But I watch better for being curious, I think. A man who wonders about everyone who passes notices the one who doesn't fit." },
      },
      choices = {
        { text = "Curiosity makes a sharper watchman. Keep the notes.", next = "BACK", reply = "I will, then. And I'll put you in them, if you don't object.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Discipline first. Wonder on your own time.", next = "BACK", reply = "Yes. You're right, of course. I'll keep the book in my boot until relief.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = {
        { id = "tell_1", text = "Would you? Wait, let me fix it in my head. Start with the sound, if you would, because nobody ever tells me about the sound, and I think it must be most of it." },
      },
      choices = {
        { text = "It's horns, then shouting, then nothing you can make out.", next = "BACK", reply = "Horns, shouting, then nothing. Thank you. That's better than a page of what the bards say." },
        { text = "Another time. Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = {
        { id = "ask_1", text = "Then here's the one I ask everybody. Of all the places you've stood, which would you go back to with nobody trying to kill you? Most say home, and one dwarf said \"a tavern in Booty Bay\", and wouldn't explain." },
      },
      choices = {
        { text = "Somewhere with trees and no war in them.", next = "BACK", reply = "I'll write that down as it stands. It's the answer I'd like to give, one day." },
        { text = "I'll think on it. Something else.", next = "BACK" },
      },
    },
    inside = {
      lines = {
        { id = "inside_1", text = "Sergeant Major Clate at the armour, the two gnome quartermasters, and Archmage Gaiman in his chair upstairs. And Sergeant Major Skyshadow, who came in at dawn, and whom I didn't hear arrive or see pass, which Hammon says I shouldn't put in the report." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_y_second_war", text = "Hammon was in it, and won't say where. I've put a blank page in the book for when he changes his mind." } },
    background = { { id = "tp_background", text = "A cooper's son from the Trade District. I joined the guard to see the world, and they've shown me a doorway." } },
    rumors = { { id = "tp_rumors", text = "An officer told me the Horde keeps a hall like ours. I asked what their door guards were like, and he'd never noticed, which I thought was telling." } },
    advice = { { id = "tp_advice", text = "Ask people where they've been. Nearly everyone wants to tell someone, and nearly no one asks." } },
    stormwind = { { id = "tp_stormwind", text = "I know Old Town stone by stone, and the rest by hearsay. That's a strange thing to say about your own city." } },
    _none = { { id = "tp_none", text = "I don't know that one. Might I write it down, and ask the next officer?" } },
  },
}

-- Guard Hammon: the senior guard at the door of the Champions' Hall, Old Town; bald, patient, long in service.
P:NPC {
  key = "guard_hammon", id = TODO_NPC("Guard Hammon"), name = "Guard Hammon", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "steady", "fatherly" }, values = { "dutiful", "comrades" },
  notices = { "rank", "soldier", "kit" },
  impression = {
    first = "Guard Hammon has kept the door of the Champions' Hall since it opened, greeting generals and recruits in the same level voice. He is bald as a helmet, and says the hair went the year he began training door guards.",
    third = "{name} met Guard Hammon, the senior guard at the door of Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Evening. Night watch on this door is the easy one; it's the officers who can't sleep, and they only want a nod." },
    { id = "g_default", text = "Good day to you. Champions' Hall. Wipe your boots, mind your manners, and you'll have no trouble from me." },
    { id = "g_2", when = { metBefore = true }, text = "Back again. Good. Boots, please, same as before." },
    { id = "g_3", when = { pvpRank = { min = 6 } }, text = "Sir. Welcome to the hall. Quine will want to ask you a question, and I'd take it as a kindness if you'd answer him." },
  },
  notice = {
    { id = "n_1", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like you've done a watch or two yourself. Then you know the trick is in the knees." },
    { id = "n_2", cat = "rank", when = { pvpRank = { min = 1 } },
      text = "There's a stripe. Well earned, I don't doubt. The quartermasters are straight in and to the right." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You'll not go in to see Clate with your armour like that, will you? He'll look at it for a full minute without speaking, and nobody enjoys it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Guard Hammon, senior watch, Champions' Hall. I've had this door since the hall was founded, and I've trained four partners at it. Quine's the fifth, and he asks more questions than the other four put together." },
        { id = "hello_2", when = { origin = "human_city_guard" }, text = "Guard Hammon, senior watch. You're guard-trained yourself, I can see it in the heels. Which gate did they start you on? Mine was the Valley of Heroes, in the rain." },
      },
      again = {
        { id = "hello_again1", text = "Anything else I can do for you?" },
        { id = "hello_again2", text = "Go on. The door's quiet." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "You've had this door a long time.", next = "long" },
        { text = "What do you make of young Quine?", next = "quine" },
        { text = "Standing at a door is no life for a soldier.", next = "nolife" },
        { text = "What's the trick in the knees?", next = "knees", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I started on the Trade District gate.", next = "gate", when = { origin = "human_city_guard" } },
        { text = "What trouble does this door ever see?", next = "trouble" },
        { text = "Good day, Hammon.", next = "END" },
      },
    },
    long = {
      lines = {
        { id = "long_1", text = "Long enough to have seen lads go in as sergeants and come out, a few years on, as knight-captains, with half as much to say. I've saluted every one, and I remember the ones who saluted back when they'd no need to." },
      },
      choices = {
        { text = "Do many stop coming?", next = "stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stop = {
      lines = {
        { id = "stop_1", text = "Aye. A name gets mentioned at the quartermasters' counter in a certain voice, and then I don't see that face again. Clate takes the armour off the reserve rack himself, and none of us say anything that day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quine = {
      lines = {
        { id = "quine_1", text = "He'll make a fine guard, if he doesn't make an explorer first. He keeps a little book of everywhere the officers have been. I tell him to put it away, and then I ask him what's in it when the watch gets long." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    nolife = {
      big = true,
      lines = {
        { id = "nolife_1", text = "I've heard that from men half my age. But the officers in there go out to the worst places there are, and when they come back, the first thing they see is the same bald fool at the same door. I think that's worth doing." },
      },
      choices = {
        { text = "Somebody has to be what they come home to.", next = "BACK", reply = "That's how I've always seen it. Kind of you to put it better than I do.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You've wasted good years holding a door for better men.", next = "BACK", reply = "Maybe. They're good men, though, and I'd hold it again.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knees = {
      lines = {
        { id = "knees_1", text = "Never lock them. Weight on the balls of your feet, shift a little every hundred breaths, and flex inside your boots where the sergeant can't see. I've stood twelve hours that way, and seen proud lads go over like trees in two." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gate = {
      lines = {
        { id = "gate_1", text = "The Trade District! Then you had the crowds, and the pickpockets, and that crier. You'll have learned to watch hands. Out here I mostly watch faces, and I miss having something to do with my eyes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "trouble_1", text = "Little enough. A nobleman's son who thinks his name's a rank, now and then, and once a drunk from the Pig and Whistle who wanted to challenge a Knight-Champion. I walked him home. The Knight-Champion offered to carry his feet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_y_second_war", text = "I was at the retreat from the city, with a pike and no notion how to use it. That's as much as I tell Quine, and it's as much as I'll tell you." } },
    background = { { id = "tp_background", text = "Thirty years in the guard, and the last of them at this door. I was a mason's labourer before, which is where the back comes from." } },
    rumors = { { id = "tp_rumors", text = "The talk at the counter is all Alterac, and how the snow's worse than the Horde. I've yet to hear a soldier blame himself when weather was to hand." } },
    advice = { { id = "tp_advice", text = "Wipe your boots before you go in anywhere. It costs nothing, and it's how people decide what you are." } },
    stormwind = { { id = "tp_stormwind", text = "I helped carry stone for these walls when they went back up. I like to think one of the blocks in this doorway is mine." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it didn't come through this door, I've not seen it." } },
  },
}

-- Wilder Thistlenettle: a dwarf miner in a quiet Dwarven District pub, the one survivor of a cave-in in the Deadmines that killed his brother and their company.
P:NPC {
  key = "wilder_thistlenettle", id = TODO_NPC("Wilder Thistlenettle"), name = "Wilder Thistlenettle", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "grieving", "gruff" }, values = { "kin", "memory" },
  notices = { "race", "craft", "drink" },
  impression = {
    first = "Wilder Thistlenettle drinks alone in a near-empty Dwarven District pub, the one miner of his company to walk out of a cave-in under Moonbrook. He speaks of his brother the foreman as if the tunnel had only just fallen.",
    third = "{name} met Wilder Thistlenettle, a dwarf miner who lost his brother and his company in the Deadmines.",
  },
  greetings = {
    { id = "g_default", text = "Pull up a stool, if ye like. There's not shortage of them, as ye can see." },
    { id = "g_2", when = { metBefore = true }, text = "Ye came back. Most folk hear the story once and find somewhere else to drink." },
    { id = "g_3", when = { questActive = TODO_QUEST("Collecting Memories") }, text = "Have ye been down there yet? I see their faces every night, and I'd like to hold their cards and see the names instead." },
    { id = "g_4", when = { questDone = TODO_QUEST("Oh Brother. . .") }, text = "There ye are. I've his badge here on the table, where he can keep an eye on my drinking." },
  },
  notice = {
    { id = "n_1", cat = "race", when = { race = "Dwarf" },
      text = "A kinsman. Sit. I've been among humans so long I've started to forget how a proper silence sounds." },
    { id = "n_2", cat = "craft", when = { profession = "Mining" },
      text = "Ye've a miner's hands. Then ye know the sound a prop makes before it goes, and ye know there's never time enough after ye hear it." },
    { id = "n_3", cat = "drink", when = { drunk = true },
      text = "Ye've had a few, and I'm the last dwarf alive who'd lecture ye for it. Mind the step on the way out, that's all." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Wilder Thistlenettle. I was a miner, with my brother's company, in a great vein under a barn in Moonbrook. The tunnel came down on the lot of us, and I'm the only one who crawled out, and I've not been able to say why it was me." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Oh Brother. . .") }, text = "Wilder Thistlenettle. Ye brought me my brother's badge out of that pit, and their union cards before it. I sleep, now, some nights, and that's your doing." },
        { id = "hello_3", when = { questActive = TODO_QUEST("Oh Brother. . .") }, text = "Wilder Thistlenettle. If ye find him down there, he'll not know ye, and he'll not be kind. Take the badge from him and put him to rest, and don't tell me how it went." },
      },
      again = {
        { id = "hello_again1", text = "Was there more ye wanted?" },
        { id = "hello_again2", text = "Go on. I've nowhere to be." },
        { id = "hello_again3", text = "Aye? Ask." },
      },
      choices = {
        { text = "What happened in the mine?", next = "mine" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "You should stop blaming yourself.", next = "blame" },
        { text = "Was it a bad roof, or was it brought down?", next = "roof", when = { profession = "Mining" } },
        { text = "Why not go home to Ironforge?", next = "home", when = { race = "Dwarf" } },
        { text = "I brought back their union cards. Who were they?", next = "cards", when = { questDone = TODO_QUEST("Collecting Memories") } },
        { text = "I'll leave you to your drink.", next = "END" },
      },
    },
    mine = {
      lines = {
        { id = "mine_1", text = "We were deep, deeper than the humans had ever dug, and the ore was the best I'd seen outside Khaz Modan. Then those thieving sorts in red masks turned up from nowhere and took the upper works, and while we were arguing what to do about it, the roof decided for us." },
      },
      choices = {
        { text = "And the others?", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "Dead, every one, and not resting. I've heard from them that's been down since that there are miners still walking that collapsed tunnel, with picks in their hands, digging at nothing. I knew each of them by name, and now they'd kill me as soon as look." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = {
        { id = "brother_1", text = "He was foreman, and an Explorers' League dwarf before that, with the badge to prove it. He took the mining work to pay for a dig he wanted in the Badlands. He was the careful one, ye understand. I was the one who took chances, and I'm the one sitting here." },
      },
      choices = {
        { text = "What would you have me do for him?", next = "dofor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dofor = {
      lines = {
        { id = "dofor_1", text = "If ye ever go down into those mines, find him, in the tunnel the goblins sealed. He wore his League badge on his chest. Bring it back to me, so there's one thing of his above ground, and so I know he's not still walking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      big = true,
      lines = {
        { id = "blame_1", text = "Folk say that. I was nearest the shaft, and I ran. I didn't go back for him, because there wasn't any back to go to, only rock. I know that. Knowing it's done me nae good at all." },
      },
      choices = {
        { text = "You lived, and you remember them. That's no small duty.", next = "BACK", reply = "Aye. Maybe that's what I was left for. I'd not thought of it as a duty.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You ran, and you know it. Live with that honestly.", next = "BACK", reply = "I do live with it. Every night, right here. Ye're not telling me anything new.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roof = {
      lines = {
        { id = "roof_1", text = "Ye'd ask that, being a miner. The props were sound; I set half of them myself. But those masked thieves had goblins with them, and goblins had powder, and I heard a crack that wasn't timber. I can't prove it, and I've stopped trying." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_1", text = "And tell our mother what, exactly? That I came out and he didn't? I'll go home when I've his badge to lay in front of her, and not before. Till then the district's near enough to smell the forges." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cards = {
      lines = {
        { id = "cards_1", text = "Good dwarves and good men. There was a lad from Lakeshire who sang while he worked, and two brothers from Loch Modan who never agreed on anything but the ale. I've their cards in my coat now, and I read the names out before I sleep." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A miner, of a mining family, from under the mountain. There's one of us left that I know of, and ye're looking at him." } },
    defias = { { id = "tp_defias", text = "Thieves in red masks, and well organised for thieves. They have the whole of that mine now, and what they want with it I couldn't tell ye." } },
    rumors = { { id = "tp_rumors", text = "They say there's a ship being built down in those caverns. I'd have called that drunk talk, once, but I've seen how deep that hole goes." } },
    advice = { { id = "tp_advice", text = "Listen to the timber. It always warns ye, and it never warns ye twice." } },
    _none = { { id = "tp_none", text = "I don't know. I've not had my mind on much but the one thing." } },
  },
}

-- Jorgen: fishes the moat by Stormwind's gates in the Valley of Heroes, catches nothing, and passes quiet messages; a step in The Missing Diplomat.
P:NPC {
  key = "jorgen", id = TODO_NPC("Jorgen"), name = "Jorgen", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "laconic", "watchful" }, values = { "loyalty", "discretion" },
  notices = { "stealth", "craft", "travel" },
  impression = {
    first = "Jorgen fishes the water by Stormwind's front gate from morning to dusk and has never been seen to land a fish. He looks at everyone who crosses the bridge, and he has some old business with Elling Trias the cheesemonger.",
    third = "{name} met Jorgen, who fishes by Stormwind's gates and watches who comes and goes.",
  },
  greetings = {
    { id = "g_default", text = "Mind your shadow, friend, you're scarin' the fish. Not that it makes a deal of difference." },
    { id = "g_2", when = { metBefore = true }, text = "You again. Sit down wind, and don't talk loud." },
    { id = "g_3", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "You've got the look of somebody carryin' a letter. If it's for me, hand it over slow, like you're passin' me bait." },
  },
  notice = {
    { id = "n_1", cat = "stealth", when = { class = "ROGUE" },
      text = "You came down the bank quiet. Most don't. I'll not ask who taught you, and you'll not ask who taught me." },
    { id = "n_2", cat = "craft", when = { profession = "Fishing" },
      text = "You fish, do you? Then you've noticed there's no bait on this hook. Keep it to yourself, there's a good {g:lad|lass}." },
    { id = "n_3", cat = "travel", when = { minLevel = 30 },
      text = "You've come in through that gate more than once this month, and by different roads each time. I notice that sort of thing. Can't help it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Name's Jorgen. I fish here. Been fishin' here a good few years, and the guards have stopped askin' what I catch. It's a fine spot for it, right under the bridge, where everybody who comes into Stormwind walks over my head." },
        { id = "hello_2", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Jorgen. So the Bishop's sent you, has he? Then he's worried, and he doesn't worry easy. I'll write you somethin' for Elling Trias, and you'll hand it to him and say nothin' else." },
        { id = "hello_3", when = { questDone = TODO_QUEST("The Missing Diplomat") }, text = "Jorgen. You saw that business through, I hear, all the way out to the marsh. I heard it from three directions, and none of 'em were you, which I thought well of." },
      },
      again = {
        { id = "hello_again1", text = "Somethin' else? Keep it low." },
        { id = "hello_again2", text = "Go on. Fish ain't bitin' anyhow." },
        { id = "hello_again3", text = "Ask, then." },
      },
      choices = {
        { text = "You never catch anything, they say.", next = "catch" },
        { text = "What do you see from down here?", next = "see" },
        { text = "A man who watches the gate is a spy.", next = "spy" },
        { text = "What's between you and Elling Trias?", next = "trias", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "There's no bait on that hook, is there?", next = "bait", when = { class = "ROGUE" } },
        { text = "What actually swims in this moat?", next = "moat", when = { profession = "Fishing" } },
        { text = "I'll leave you to your fishing.", next = "END" },
      },
    },
    catch = {
      lines = {
        { id = "catch_1", text = "That's what they say. A man with a full creel gets asked where the good spot is, and a man with an empty one gets left alone. I've been left alone a long while, and it suits me." },
      },
      choices = {
        { text = "Then why fish at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "Because a man standin' by the gate all day is a loiterer, and a man fishin' by the gate all day is only a fool. Guards move loiterers along. Fools, they bring a pie to, now and then." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    see = {
      lines = {
        { id = "see_1", text = "Boots, mostly, from this angle. You'd be surprised what boots'll tell you. Farm mud, ship tar, the red dust off the Redridge road. And now and again a pair that's too clean for the cloak above 'em, and those I remember." },
      },
      choices = {
        { text = "Whose boots were too clean lately?", next = "clean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clean = {
      lines = {
        { id = "clean_1", text = "A fella three days back, dressed like a carter, with a soldier's heels and no cart. He went in at noon and out by the canals at dusk. I mentioned it to a friend. I don't know what came of it, and I don't expect to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spy = {
      big = true,
      lines = {
        { id = "spy_1", text = "That's a hard word, friend. I never took the king's coin for it, nor anybody's. I see things, and now and then I tell 'em to folk I've reason to trust, and the city's still standin'. Call it what you want." },
      },
      choices = {
        { text = "A city needs quiet eyes. You do it a service.", next = "BACK", reply = "Kind of you. Don't go sayin' it loud, is all.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Watching your neighbours in secret is no service.", next = "BACK", reply = "Could be you're right. I've wondered it myself, cold mornin's.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trias = {
      lines = {
        { id = "trias_1", text = "History. We worked together once, and it ended bad, and we don't speak. But he's the best there is at findin' a man who doesn't want findin', and he knows I'd not send him a note for anything small. That's all you need." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = {
        { id = "bait_1", text = "No. Never has been. You've a good eye, and I'd thank you to keep a shut mouth to go with it. There's a fella in Old Town named Shaw who knows why I'm here, and nobody else needs to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    moat = {
      lines = {
        { id = "moat_1", text = "Brilliant smallfish and the odd longjaw mud snapper, and a boot now and then. If you want to really fish, go down to the canals by the Park. If you want folk to walk past without seein' you, there's no better water in the kingdom." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I was somethin' else, once. Now I fish. Leave it there, friend." } },
    defias = { { id = "tp_defias", text = "They've folk inside the walls, you can count on it. I've seen the same red kerchief in three different pockets this year." } },
    rumors = { { id = "tp_rumors", text = "A diplomat left by this gate for Theramore and never got there. That's not rumour, that's arithmetic, and somebody ought to be doin' the sum." } },
    advice = { { id = "tp_advice", text = "Look at folk's boots. Faces lie all day long, and boots hardly ever." } },
    _none = { { id = "tp_none", text = "Couldn't say. And if I could, I likely wouldn't." } },
  },
}

-- Reese Langston: keeps the taps at the Pig and Whistle Tavern in Old Town.
P:NPC {
  key = "reese_langston", id = TODO_NPC("Reese Langston"), name = "Reese Langston", title = "Tavernkeeper", gender = "male",
  bible = "bibles/more_folk.md", role = "innkeeper", tier = "service",
  communities = { "stormwind" }, temper = { "jovial", "shrewd" }, values = { "hospitality", "peace" },
  notices = { "drink", "soldier", "purse" },
  impression = {
    first = "Reese Langston keeps the taps at the Pig and Whistle in Old Town and welcomes every customer as though the party had been waiting for them. He can tell a soldier's regiment by what they order and how fast.",
    third = "{name} met Reese Langston, tavernkeeper of the Pig and Whistle in Stormwind's Old Town.",
  },
  greetings = {
    { id = "g_y1", when = { class = { "WARRIOR", "PALADIN" } }, text = "In you come, soldier! First one's poured before you've sat, that's the rule for anyone who walks in wearing steel." },
    { id = "g_default", text = "Welcome to the Pig and Whistle! Grab a mug and find a seat, friend; the more the merrier, and tonight we're merry already." },
    { id = "g_2", when = { metBefore = true }, text = "There's a face I know! Your seat's warm, and I've not let anyone else spoil it." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "Come in out of the dark! The barracks have just let out, so mind your elbows and keep hold of your mug." },
  },
  notice = {
    { id = "n_1", cat = "drink", when = { drunk = true },
      text = "You've had a good start somewhere else, I see. No shame in it. Sit down before you fall down, and I'll bring you something with bread in it." },
    { id = "n_2", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighting {g:man|woman}! The barracks crowd sits by the hearth, and they'll make room for one of their own." },
    { id = "n_3", cat = "purse", when = { money = { max = 500 } },
      text = "Light in the purse tonight? There's small beer at a copper a mug, and nobody here will look twice at what you're drinking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Reese Langston, and this is the Pig and Whistle, the soldiers' own tavern. The barracks are next door and the Champions' Hall is round the corner, so I pour for recruits and knight-captains at the same bar, and they're all thirsty the same way." },
        { id = "hello_2", when = { pvpRank = { min = 6 } }, text = "Reese Langston, and you're an officer, by that stripe, so the good cask's open. The hall sends me its knights when they've been pinned, and I've a tankard on the shelf for every rank." },
      },
      again = {
        { id = "hello_again1", text = "What else can I get you?" },
        { id = "hello_again2", text = "Go on, I can pour and talk." },
        { id = "hello_again3", text = "Aye, friend?" },
      },
      choices = {
        { text = "Pour me a drink.", next = "BUSINESS" },
        { text = "Who drinks at the Pig and Whistle?", next = "drinks" },
        { text = "Who keeps the peace in here?", next = "peace" },
        { text = "Soldiers drinking is a discipline problem.", next = "discipline" },
        { text = "What do the soldiers say about the fronts?", next = "fronts", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Some of your patrons aren't soldiers at all.", next = "si7", when = { class = "ROGUE" } },
        { text = "How long have the Langstons had this place?", next = "langstons" },
        { text = "Good night, Reese.", next = "END" },
      },
    },
    drinks = {
      lines = {
        { id = "drinks_1", text = "Footmen from the barracks, the warrior trainers when they've finished shouting, and officers from the hall who've come to remember what a recruit sounds like. Bartleby's on his stool by noon, and there's always one quiet table at the back that I don't ask about." },
      },
      choices = {
        { text = "What's at the quiet table?", next = "quiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_1", text = "Folk who work round the corner, in the building with no sign on it. They pay in exact coin, tip well, and never raise their voices. I've found it best to serve them quickly and be elsewhere." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "peace_1", text = "Dashel Stonefist, mostly, who's ended more fights with one look than I have with a bucket. Elly spots the trouble before it starts, and I mop up after. We've not had a broken window since midsummer, and I'm told that's a record for Old Town." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    discipline = {
      big = true,
      lines = {
        { id = "discipline_1", text = "So a captain told me once, in here, over his third. A soldier's got to set it down somewhere, friend. Better here, among his own, with me counting his mugs, than alone in a barracks bunk with whatever he saw." },
      },
      choices = {
        { text = "A tavern like this does the army more good than harm.", next = "BACK", reply = "That's how I've always seen it. I'll drink to that, on my side of the bar.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You profit from men drowning what they should face.", next = "BACK", reply = "I've thought about that, on slow nights. Then one of them laughs, and I pour.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fronts = {
      lines = {
        { id = "fronts_1", text = "More than the heralds do, and none of it for repeating. But I'll say the Redridge lads come back thin, the ones from Westfall come back angry, and the ones who've been to Alterac drink without talking for the first hour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    si7 = {
      lines = {
        { id = "si7_1", text = "I'm sure I couldn't say, friend, and I'm sure you already know. They've never been any trouble to me. I wipe their table twice as carefully, and I've never once found so much as a crumb to tell me who sat there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    langstons = {
      lines = {
        { id = "langstons_1", text = "My father had it before the First War, and I rebuilt it after the second, on the same cellar. Elly's on the floor, and there are Langstons at half the tables most nights. If you can't find one, shout the name, and three will answer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_y_second_war", text = "I carried water on the walls as a boy, and I watched the old tavern burn from the keep. I knew where I'd build the new one before the fire was out." } },
    background = { { id = "tp_background", text = "Born over the taproom, in the old Pig and Whistle. The orcs burned it, and I built it again with the same sign. I dug that sign out of the ashes myself." } },
    rumors = { { id = "tp_rumors", text = "The barracks lads say there's trouble in the Stockade, and the guards on that shift have been drinking double. I'd not walk past the gate after dark." } },
    advice = { { id = "tp_advice", text = "Eat before you drink, and pay before you forget. Those two have kept more friendships than any oath." } },
    stormwind = { { id = "tp_stormwind", text = "Old Town's the only part of the city that remembers what it was. The rest is new stone and fine manners." } },
    _none = { { id = "tp_none", text = "Haven't heard a word on that, friend, and I hear most things by the third round." } },
  },
}
