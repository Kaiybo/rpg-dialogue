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
    { id = "g_default", text = "Well, look at ye! Bring yer beast over here, {g:lad|lass}, and let me have a look at the both of ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And how's the wee beastie keeping? Better than you, by the look of it." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Oh, would ye look at {pet}! Come here, come here, ye handsome thing. Yer owner can wait." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else, {g:lad|lass}? I've a boar out back that wants its supper." },
        { id = "h_again2", text = "Go on, then. I'm listening, and so's the boar." },
      },
      choices = {
        { text = "Teach my pet something new.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How does a dwarf come to train pets in Stormwind?", next = "why" },
        { text = "What makes a good hunting beast?", next = "good" },
        { text = "A pet is just a tool for the hunt.", next = "tool", when = { class = "HUNTER" } },
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
  },
  topics = {
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
    { id = "g_default", text = "Come in, come in! Every gun on this wall was made by a dwarf or checked by one, and that's the only promise worth making." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another look? I knew it. Once ye've held a proper rifle, a bow feels like a twig." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Now there's someone who knows the value of a good barrel. Let's see what ye're carrying." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else? I've a blunderbuss I'm dying to show someone." },
        { id = "h_again2", text = "Go on, then. Mind ye don't point anything at the window." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Why are guns better than bows?", next = "bows" },
        { text = "Where do your guns come from?", next = "source" },
        { text = "Guns are loud and clumsy.", next = "clumsy" },
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
  },
  topics = {
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
    { id = "g_default", text = "Welcome to the Blue Recluse. What'll it be? The Dalaran Noir is excellent, if a little dear." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I remember you. The usual, or are we feeling adventurous tonight?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for it, isn't it? The mages are just getting started, so you'll have company." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else? I'm only polishing glasses." },
        { id = "h_again2", text = "Another round of questions, then?" },
      },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "Who drinks at the Blue Recluse?", next = "patrons" },
        { text = "What's the Dalaran Noir?", next = "noir" },
        { text = "You must hear all sorts of secrets.", next = "secrets" },
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
  },
  topics = {
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
    { id = "g_default", text = "A new head! Come in, come in, let me look at you. Oh, yes, I think we can do something here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I remember the shape of your head, you know; I never forget a head." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else? I've a feathered cap you'd look splendid in." },
        { id = "h_again2", text = "Yes, yes? I'm listening and measuring." },
      },
      choices = {
        { text = "Show me your hats.", next = "BUSINESS" },
        { text = "Are you related to Wynne Larson?", next = "wynne" },
        { text = "What do the mages wear on their heads?", next = "mages" },
        { text = "A hat's a hat. Who cares?", next = "care" },
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
  },
  topics = {
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
    { id = "g_default", text = "Swords, friend, long and short, and every one of them sharp. Have a look, and don't touch the edges unless you're buying." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your blade's chipped, I'd wager, or you'd not be here." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else? I've an edge to put on that broadsword." },
        { id = "h_again2", text = "Go on, I've a minute between whetstones." },
      },
      choices = {
        { text = "Let me see the blades.", next = "BUSINESS" },
        { text = "What makes a good sword?", next = "good" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Swords are for the guard, not common folk.", next = "common" },
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
  },
  topics = {
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
    { id = "g_default", text = "Welcome to the Gallina Winery! Red, white, or something for a cold night by the canal?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you came back! The wine's that good, isn't it? I knew it would be." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else? I've a bottle open if you'd like to taste." },
        { id = "h_again2", text = "Go on, I'm only dusting the bottles." },
      },
      choices = {
        { text = "Let me see your wines.", next = "BUSINESS" },
        { text = "What's the best you have?", next = "best" },
        { text = "Does Renato really give wine away?", next = "renato" },
        { text = "Wine is a waste of good coin.", next = "waste" },
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
  },
  topics = {
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
    { id = "g_default", text = "Spare a copper for an old man, friend? I'll not ask twice, and I'll thank you either way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I remember your face. Not many do come back, you know." },
  },
  notice = {
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
        { id = "h_again", text = "Anything else? I've nowhere to be." },
        { id = "h_again2", text = "Go on, then. Time's the one thing I've got plenty of." },
      },
      choices = {
        { text = "How did you end up here?", next = "how" },
        { text = "What do you see from this corner?", next = "see" },
        { text = "Get a job, old man.", next = "job" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "A farm, then the walls, then this corner. Not much of a story, but it's mine." } },
    stonemasons = { { id = "tp_sm", text = "Good men, mostly, who got cheated. What they did after, I can't speak for." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I only know this street." } },
  },
}
