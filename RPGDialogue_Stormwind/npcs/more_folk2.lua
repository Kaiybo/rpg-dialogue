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
    first = "She greets the animal before she greets its owner.",
    third = "{name} met Karrina Mekenda, the dwarf who trains hunters' pets in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are, an' yer beast lookin' sleek as a ram in spring! I knew ye'd keep it well." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's yerself. I'll train the beast, since it's done nothin' wrong, but I'll nae pretend I'm fond o' the hunter." },
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
        { text = "A beast's trust is earned slowly, with food and patience.", next = "BACK", reply = "Aye, that it is, an' a beast that trusts ye will fight like ten.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Starve it a little and it'll fight harder for you.", next = "BACK", reply = "It'll fight harder, aye, right up until it bites ye an' runs for the hills.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach my pet something new.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How does a dwarf come to train pets in Stormwind?", next = "why" },
        { text = "What makes a good hunting beast?", next = "good" },
        { text = "A pet is just a tool for the hunt.", next = "tool", when = { class = "HUNTER" } },
        { text = "Who else trains hunters in the district?", next = "others" },
        { text = "What's the strangest beast you've trained?", next = "strangest" },
        { text = "My pet's been flagging in long fights.", next = "flagging", when = { class = "HUNTER" } },
        { text = "How do I keep my beast with me for good?", next = "hp", when = { class = "HUNTER" } },
        { text = "Do human hunters bring you many beasts?", next = "hp_human", when = { race = "Human", class = "HUNTER" } },
        { text = "Do you miss the beasts of Dun Morogh?", next = "hp_dwarf", when = { race = "Dwarf" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Ye keep it fed, ye keep it alive, an' ye bring it tae me now and then so I can teach it what it needs. Every beast starts out wary of its hunter an' learns tae trust ye a wee bit at a time, an' if ye neglect it, it'll wander off one day, an' it'll be right tae." },
        { id = "hp_pet", when = { pet = { type = "Beast" } }, text = "Let me see {pet}. Aye, the eyes are clear an' the coat's good, so ye're feedin' it, which puts ye ahead o' half the district; now ye keep doin' it, an' bring it tae me when it's ready tae learn." },
      },
      again = { { id = "hp_again", text = "What else? The boar's still waitin' on supper." } },
      choices = {
        { text = "How do I know if my beast is unhappy?", next = "hp_happy" },
        { text = "What can you teach it?", next = "hp_teach" },
        { text = "What happens if it dies?", next = "hp_die" },
        { text = "Something else, Karrina.", next = "hello" },
      },
    },
    hp_happy = {
      lines = { { id = "hph_default", text = "It'll tell ye, if ye watch. A happy beast fights harder an' stays close, an' an unhappy one lags an' snaps an' looks off intae the trees, an' the cure's nearly always food it likes, given before it asks." } },
      choices = {
        { text = "I'll feed it before every hunt.", next = "BACK", reply = "Good, an' carry what it likes, no' what's cheap.", fx = { align = { light = 1 } } },
        { text = "It can wait till the hunt's over.", next = "BACK", reply = "Then it'll fight like it's hungry, which is badly, an' ye'll blame the beast.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_teach = {
      lines = { { id = "hpt_default", text = "Tae growl louder so the quarry looks at it an' no' at ye, an' tae take a blow better, an' a few other things as it grows. What I cannae teach, the wild beasts can, if ye tame one that knows the trick an' learn it from them." } },
      choices = {
        { text = "Then I'll come back as it grows.", next = "BACK", reply = "Do, an' bring it hungry, for it learns better wi' a treat at the end.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_die = {
      lines = { { id = "hpd_default", text = "Then ye bring it back, an' ye'll have learned how by then, but it costs the beast somethin' every time, an' it'll trust ye less. Dinnae let it die for ye if ye can help it, an' if ye cannae, say sorry when it wakes." } },
      choices = {
        { text = "I'll say sorry and mean it.", next = "BACK", reply = "That's all any of us can do, beasts or no'.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_human = {
      lines = { { id = "hphu_default", text = "More every month, an' I didnae expect it! Some of them hold the lead like a horse's rein, an' I have tae untrain the poor beast after, but the good ones learn quick, an' a human that loves its beast loves it fiercely." } },
      choices = {
        { text = "I'll try to be one of the good ones.", next = "BACK", reply = "Ye've asked, which already puts ye ahead.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_dwarf = {
      lines = { { id = "hpdw_default", text = "Every day, {g:lad|lass}. The boars here are fat an' lazy an' the wolves are thin an' scared, an' I'd give a month's wages tae see a snow leopard come down off the ridge above Kharanos again." } },
      choices = {
        { text = "Then I'll bring you one, if I can.", next = "BACK", reply = "Ha! Ye'd never get it past the guards, but I love ye for sayin' it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
    first = "He would sell a rifle to a priest with the right argument.",
    third = "{name} met Thulman Flintcrag, the dwarf gun seller in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' carryin' one o' mine, I see! Come in, {g:lad|lass}, an' let's hear what it's brought down." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's yerself. I'll sell ye a gun, since that's my trade, but I'll nae be wishin' ye good huntin' with it." },
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
        { text = "A gunsmith should stamp his name on every barrel he sells.", next = "BACK", reply = "Aye, an' mine's on every one o' these, for I'll answer for the lot.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell a cracked barrel to a human; he'll never know.", next = "BACK", reply = "He'll know when it bursts in his face, an' then the whole district'll know who sold it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Why are guns better than bows?", next = "bows" },
        { text = "Where do your guns come from?", next = "source" },
        { text = "Guns are loud and clumsy.", next = "clumsy" },
        { text = "Is there a Mrs. Flintcrag, then?", next = "wife" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "I make my own firearms.", next = "maker", when = { profession = "Engineering" } },
        { text = "What rifle would you carry yourself?", next = "carry", when = { class = "HUNTER" } },
        { text = "What about that blunderbuss you're dying to show someone?", next = "e3_blunder" },
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
    e3_blunder = {
      lines = {
        { id = "e3_blunder_l0", text = "Ach, she's a beauty, {g:lad|lass}, wi' a bell mouth wide as a tankard an' a kick that'll put ye on yer backside if ye're no' braced for it. Fill her wi' nails an' gravel an' she'll clear a corridor o' kobolds faster than a cave-in." },
      },
      choices = {
        { text = "Has anyone actually bought one?", next = "e3_blunder2" },
        { text = "That sounds dangerous to the shooter.", next = "BACK" },
      },
    },
    e3_blunder2 = {
      lines = {
        { id = "e3_blunder2_l0", text = "One, a Westfall farmer who wanted somethin' that'd stop a Defias at his gate without needin' tae aim. He came back a month later an' bought a second one for his wife, so I'll take that as a recommendation." },
      },
      choices = {
        { text = "High praise from Westfall. Something else.", next = "BACK" },
        { text = "Farmers shouldn't need guns, Thulman.", next = "BACK" },
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
    first = "He pours every glass like a secret he has agreed to keep.",
    third = "{name} met Joachim Brenlow, who pours at the Blue Recluse in the Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a regular. Your usual's half poured already, and I've kept the quiet end of the bar for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll pour for you, since it's my bar, but don't expect conversation with it." },
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
        { text = "A good bartender never waters the wine.", next = "BACK", reply = "Never in this house, and the mages would notice if I did, believe me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Water the wine late in the night; nobody's tasting by then.", next = "BACK", reply = "The apprentices might not, but the archmagi have very long memories.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "Who drinks at the Blue Recluse?", next = "patrons" },
        { text = "What's the Dalaran Noir?", next = "noir" },
        { text = "You must hear all sorts of secrets.", next = "secrets" },
        { text = "How did you come to keep bar for mages?", next = "how" },
        { text = "What do mages drink?", next = "drink" },
        { text = "What does the Sanctum say when it's had a few?", next = "sanctum", when = { class = "MAGE" } },
        { text = "How many bottles of Dalaran Noir are left?", next = "e3_bottles" },
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
    e3_bottles = {
      lines = {
        { id = "e3_bottles_l0", text = "Fourteen, in the cellar, and I count them every morning before I unlock the door. When the last one's gone, there won't be another, because the vineyards it came from are behind walls nobody's been allowed through since the city fell." },
      },
      choices = {
        { text = "Who would you save the last bottle for?", next = "e3_bottles2" },
        { text = "Then I'd better try one while I can.", next = "BACK" },
      },
    },
    e3_bottles2 = {
      lines = {
        { id = "e3_bottles2_l0", text = "I've thought about that more than a barman ought to. An old mage who drinks here every night once said he tasted the Noir at his own apprentice's binding, and I think the last glass is his, whether or not he can pay." },
      },
      choices = {
        { text = "A good choice. Something else.", next = "BACK" },
        { text = "Sell it to the highest bidder.", next = "BACK" },
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
    first = "He has an opinion about everyone's head and is rarely wrong.",
    third = "{name} met Evan Larson, the hatter of Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite head returns! I've had an idea about a brim since you were last in, and you're just the one to try it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. The hats are on the stands, and you may try them on, provided you put them back straight." },
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
        { text = "A hatter should tell a customer plainly when a hat doesn't suit.", next = "BACK", reply = "Exactly so, and it's cost me sales, but never a reputation.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell every customer they look splendid, and the coin follows.", next = "BACK", reply = "The coin follows, and then they walk into the Sanctum looking ridiculous, and that's my name on the band.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your hats.", next = "BUSINESS" },
        { text = "Are you related to Wynne Larson?", next = "wynne" },
        { text = "What do the mages wear on their heads?", next = "mages" },
        { text = "A hat's a hat. Who cares?", next = "care" },
        { text = "How do you measure a head by eye?", next = "measure" },
        { text = "You must know everyone in the Mage Quarter.", next = "quarter" },
        { text = "What goes into a good hat?", next = "making", when = { profession = "Tailoring" } },
        { text = "Which hat are you proudest of?", next = "e3_hat" },
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
    e3_hat = {
      lines = {
        { id = "e3_hat_l0", text = "A black felt with a silver band I made for an archmage of the Sanctum, who wore it to a council in the Keep and was asked by three nobles where he'd got it. He told them, and I had more orders that week than I'd had all season." },
      },
      choices = {
        { text = "Did the archmage pay you?", next = "e3_hat2" },
        { text = "Advertising by archmage. Very clever.", next = "BACK" },
      },
    },
    e3_hat2 = {
      lines = {
        { id = "e3_hat2_l0", text = "Paid me and enchanted the band against rain, which I've never been able to sell as an extra because nobody believes it. Still, he comes in every spring to have it steamed, and he always tips his hat to me as he leaves." },
      },
      choices = {
        { text = "A fine story. Something else.", next = "BACK" },
        { text = "Sell the enchantment anyway.", next = "BACK" },
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
    first = "He tests every edge on his thumb and has the scars.",
    third = "{name} met Heinrich Stone, the blade merchant of Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've a short blade on the rack with a balance I think your hand will like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The blades are sharp and so am I today, so buy or move along." },
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
        { id = "h_x_again1", text = "Something more? Speak up over the wheel, friend, I'm grinding as we talk." },
        { id = "h_again", text = "Anything else? I've an edge to put on that broadsword." },
        { id = "h_again2", text = "Go on, I've a minute between whetstones." },
      },
      choices = {
        { text = "A blade merchant should never sell steel he hasn't tested.", next = "BACK", reply = "Every edge on that rack's been tried on a side of beef, friend, and on worse.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell soft steel to the Old Town lads; they don't know better.", next = "BACK", reply = "They'd learn the first time it bent in a fight, and then they'd come looking for me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the blades.", next = "BUSINESS" },
        { text = "What makes a good sword?", next = "good" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Swords are for the guard, not common folk.", next = "common" },
        { text = "You test every edge on your thumb.", next = "thumb" },
        { text = "What do the barracks issue their soldiers?", next = "issue" },
        { text = "Do you sell anything shorter and quieter?", next = "short", when = { class = "ROGUE" } },
        { text = "I forge blades. Would you buy from me?", next = "buy", when = { profession = "Blacksmithing" } },
        { text = "What do you do with all the broken swords?", next = "e3_broken" },
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
    e3_broken = {
      lines = {
        { id = "e3_broken_l0", text = "Sell the steel back to the dwarves for melting, mostly, and keep the hilts, because a good hilt outlives three blades. I've a crate of them behind the counter, and some came off swords that went to Redridge and never came back." },
      },
      choices = {
        { text = "Do you know whose blades they were?", next = "e3_broken2" },
        { text = "Waste not, I suppose.", next = "BACK" },
      },
    },
    e3_broken2 = {
      lines = {
        { id = "e3_broken2_l0", text = "Some of them, by the wrapping on the grip, which every soldier does his own way. When a family comes in asking, I give them the hilt for nothing, and you'd be surprised how often they ask." },
      },
      choices = {
        { text = "That's decent of you. Something else.", next = "BACK" },
        { text = "You could charge for them.", next = "BACK" },
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
    first = "She smiles easily and charges full price.",
    third = "{name} met Julia Gallina, who sells wine at the Gallina Winery's counter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again! I've put a bottle of the good red by, from a cask Father hasn't priced yet." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The wine's on the counter, and I've no time today for tasting with you." },
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
        { id = "h_again", text = "Anything else? I've a bottle open, and Suzetta's not looking, so ask quickly." },
        { id = "h_again2", text = "Go on, I'm only dusting the bottles." },
      },
      choices = {
        { text = "A vintner should never pass off cheap wine as good vintage.", next = "BACK", reply = "Never, and Father would turn me out of the winery if I tried it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pour the cheap stuff into a fancy bottle and double the price.", next = "BACK", reply = "Plenty do, I'm sure, but the Gallina name is worth more than one season's profit.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your wines.", next = "BUSINESS" },
        { text = "What's the best you have?", next = "best" },
        { text = "Does Renato really give wine away?", next = "renato" },
        { text = "Wine is a waste of good coin.", next = "waste" },
        { text = "What's it like, working for family?", next = "family" },
        { text = "Where do the grapes come from?", next = "grapes" },
        { text = "Which of these would you cook with?", next = "cook", when = { profession = "Cooking" } },
        { text = "I carried one of Renato's adverts.", next = "advert", when = { questDone = TODO_QUEST("Wine Shop Advert") } },
        { text = "Suzetta keeps the books. Is she as strict as they say?", next = "e3_suzetta" },
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
    e3_suzetta = {
      lines = {
        { id = "e3_suzetta_l0", text = "Stricter, and she'd take that as a compliment. She writes every bottle I sell in a ledger with a red cover, and if Renato's given one away she writes it in a second ledger with a black cover, which she calls the book of sorrows." },
      },
      choices = {
        { text = "How thick is the book of sorrows?", next = "e3_suzetta2" },
        { text = "Somebody has to keep the winery honest.", next = "BACK" },
      },
    },
    e3_suzetta2 = {
      lines = {
        { id = "e3_suzetta2_l0", text = "Thicker than the red one, most months, which tells you everything about Renato. She reads it aloud at supper on the last day of the month, and Roberto hides in the cellar and Renato pretends to be asleep." },
      },
      choices = {
        { text = "I'd hide in the cellar too. Something else.", next = "BACK" },
        { text = "It sounds like a lively family.", next = "BACK" },
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
    first = "He watches the street with a sharper eye than most guards.",
    third = "{name} met Ol' Beasley, a beggar of Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Evenin', friend, and bless you for comin' round again. You've a kind hand, and Old Town's short of those." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Keep your copper, then, friend; I'll find a softer heart down the lane." },
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
        { id = "h_again", text = "Ask away, then. This corner's mine whether I'm talking or no." },
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
        { text = "How do you get through the winters out here?", next = "e3_cold" },
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
    e3_cold = {
      lines = {
        { id = "e3_cold_l0", text = "The barracks lets me sleep against the bake-house wall where the ovens warm the stone, and a cook there leaves out the burnt loaves. Topper and Morris come over from the Trade District when the snow's deep, and three old men under one blanket is warmer than you'd think." },
      },
      choices = {
        { text = "Has anyone offered you a roof?", next = "e3_cold2" },
        { text = "The barracks cook sounds like a decent sort.", next = "BACK" },
      },
    },
    e3_cold2 = {
      lines = {
        { id = "e3_cold2_l0", text = "The priests at the Cathedral, every winter, and every winter I thank them and say no. There's men in their cots with nowhere else in the world, and I've got a warm wall and two friends, so I'd only be taking a bed from someone worse off." },
      },
      choices = {
        { text = "That's a generous choice. Something else.", next = "BACK" },
        { text = "Pride won't keep you warm, Beasley.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are! Ye've earned yer rank honestly, an' I've a breastplate here that's been waitin' for a dwarf like ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Rank's rank, an' I'll sell what yours allows, but I'll nae pretend ye've earned my good opinion." },
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
    d6_broken = {
      lines = { { id = "d6_broken_a", text = "It goes to the smiths in the Dwarven District with a tag on it, saying whose it was and what broke it. I read every tag before it goes, and ye learn a great deal about a battle from what it did to the plate." } },
      choices = {
        { text = "What have the tags taught you?", next = "d6_broken2" },
        { text = "I wear plate. What should I look for?", next = "d6_broken2", when = { class = "WARRIOR" } },
        { text = "On to other matters, Sergeant Major.", next = "BACK" },
      },
    },
    d6_broken2 = {
      lines = {
        { id = "d6_broken2_a", text = "That Alterac's cold cracks a seam faster than any axe, and that the Frostwolf aim for the knee. I've written to the smiths to say so, and they've thickened the greaves, and fewer knights come back limping than did last winter." },
        { id = "d6_broken2_war", when = { class = "WARRIOR" }, text = "The rivets, {g:lad|lass}, before the plate. Plate fails slow and rivets fail sudden, and a pauldron that comes loose mid-swing will kill ye quicker than any blade, so check them every night, even when ye're tired." },
      },
      choices = {
        { text = "That's knowledge earned the hard way.", next = "BACK" },
        { text = "Something else I'd ask.", next = "BACK" },
      },
    },
    d6_smith = {
      lines = { { id = "d6_smith_a", text = "Ironforge forges for weight and Stormwind forges for show, and that's nae as unkind as it sounds. A human knight wants to be seen on the field and a dwarf wants to walk off it, and the best armour in this hall does both." } },
      choices = {
        { text = "Which matters more, in the end?", next = "d6_smith2" },
        { text = "Spoken like a dwarf.", next = "d6_smith2" },
        { text = "Let's turn to something else.", next = "BACK" },
      },
    },
    d6_smith2 = {
      lines = { { id = "d6_smith2_a", text = "Walking off it, every time, though I'd not say so to a Stormwind smith in his own forge. But a soldier who's seen leads others, so I let the humans gild the edges and I make certain there's good dwarven steel under the gilt." } },
      choices = {
        { text = "Gilt over good steel. A fair bargain.", next = "BACK" },
        { text = "Anything else in this hall worth knowing?", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Sergeant Major Clate, armour quartermaster. Every piece in this hall was made for an officer of the Alliance and is sold only to one, and I've held that line against dukes' sons and worse." },
        { id = "hello_2", when = { pvpRank = { min = 6 } }, text = "Sergeant Major Clate, armour quartermaster. Ye hold the rank, so the racks are open to ye. Choose slowly; ye'll be wearing it where the Horde can see." },
      },
      again = {
        { id = "hello_again1", text = "Was there more, then? Speak plain, for I've a ledger tae balance an' I'll no' rush it." },
        { id = "hello_again2", text = "Go on. I've only the ledger to mind." },
        { id = "hello_again3", text = "Aye? Ask it, then." },
      },
      choices = {
        { text = "Rank should be won on the battlefield, not bought with gold.", next = "BACK", reply = "Aye, an' that's why I check every insignia that comes through that door.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A forged insignia gets you the same armour as a real one.", next = "BACK", reply = "It'll get ye a cell in the Stockade, an' a word from me tae the Marshal besides.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the armour.", next = "BUSINESS" },
        { text = "Who decides what an officer may wear?", next = "decides" },
        { text = "Where is this armour made?", next = "made" },
        { text = "Rank shouldn't decide who gets good armour.", next = "rank" },
        { text = "I've begun to earn rank. What comes first?", next = "first", when = { pvpRank = { min = 1 } } },
        { text = "A dwarf, keeping Stormwind's armoury?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Who else serves in this hall?", next = "hall" },
        { text = "What happens to armour that comes back broken?", next = "d6_broken" },
        { text = "How does Ironforge smithing differ from Stormwind's?", next = "d6_smith" },
        { text = "Do ye drill the recruits too, Sergeant Major?", next = "e3_drill" },
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
    e3_drill = {
      lines = {
        { id = "e3_drill_l0", text = "Aye, a fortnight o' them at a time, when Captain Malagan sends them over, an' it's nae enough by half. I teach them tae stand, tae hold a shield wall, an' tae walk backwards wi'out fallin' over, which is the lesson that saves the most lives." },
      },
      choices = {
        { text = "Walking backwards? Why that one?", next = "e3_drill2" },
        { text = "A fortnight would be enough for a dwarf.", next = "BACK" },
      },
    },
    e3_drill2 = {
      lines = {
        { id = "e3_drill2_l0", text = "Because a line that turns its back tae run is a line that dies, an' a line that steps back together lives tae fight again. I make them do it in the yard till they're sick o' it, then I make them do it in the dark." },
      },
      choices = {
        { text = "Sound teaching. Something else.", next = "BACK" },
        { text = "Real soldiers never retreat.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, hello again! I've set aside a blade I've balanced to within a hair, and I think you'll feel the difference." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Your insignia, please, and kindly keep your hands off the racks while I check it." },
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
    d6_odd = {
      lines = { { id = "d6_odd_a", text = "A knight-captain wanted a sword that was also a spyglass, for seeing the enemy and then stabbing him with the same object. I drew up three designs, and every one of them was a worse sword and a worse spyglass, which I put in my report with a diagram." } },
      choices = {
        { text = "Did he buy one anyway?", next = "d6_odd2" },
        { text = "Some ideas are better left on paper.", next = "d6_odd2" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d6_odd2 = {
      lines = { { id = "d6_odd2_a", text = "He bought a good sword and a separate spyglass, at a combined weight four percent less than my best prototype, and he wrote to thank me. I keep the letter pinned above the test frame as evidence that officers can be reasoned with, given numbers." } },
      choices = {
        { text = "Numbers win arguments, then.", next = "BACK" },
        { text = "On to another subject.", next = "BACK" },
      },
    },
    d6_bows = {
      lines = { { id = "d6_bows_a", text = "Exquisite, and impossible to improve, which offends me professionally. The kaldorei grow the wood to the shape they want over decades, so there's no glue and no seam, and every time I've tried to add a sight to one the Sentinels have asked me to stop." } },
      choices = {
        { text = "I'm a hunter. Which rifle would you choose?", next = "d6_bows2", when = { class = "HUNTER" } },
        { text = "Grown over decades? That's patience.", next = "d6_bows2" },
        { text = "Let's leave the bows there.", next = "BACK" },
      },
    },
    d6_bows2 = {
      lines = {
        { id = "d6_bows2_a", text = "Patience is the one thing I can't put into a mechanism, which is why my people build rifles instead. A good dwarven barrel with a gnomish sight is the finest thing in this hall, if you ask me, and no Sentinel has ever asked me." },
        { id = "d6_bows2_hunter", when = { class = "HUNTER" }, text = "A dwarven barrel, a gnomish sight and a stock cut to your own shoulder, and I'd measure that shoulder myself. Ignore anything with engraving on it, because engraving adds weight and the beasts don't care how pretty the gun is." },
      },
      choices = {
        { text = "I'll remember the shoulder fitting.", next = "BACK" },
        { text = "Anything else, Lieutenant?", next = "BACK" },
      },
    },

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
        { text = "An officer's weapon should be earned by honest service in the field.", next = "BACK", reply = "Quite right, and my ledger records every last one of those services.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If another soldier's kills get me a better blade, so be it.", next = "BACK", reply = "That's theft of glory, and the ledger catches it rather more often than you'd think.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the weapons.", next = "BUSINESS" },
        { text = "How does a gnome test a claymore?", next = "test" },
        { text = "What makes an officer's weapon different?", next = "different" },
        { text = "A gnome has no business judging swords.", next = "judge" },
        { text = "What should a newly ranked soldier save for?", next = "save", when = { pvpRank = { min = 1 } } },
        { text = "How did one of us end up in this hall?", next = "gnome", when = { race = "Gnome" } },
        { text = "Tell me about the repeating crossbow.", next = "crossbow", when = { profession = "Engineering" } },
        { text = "What's the oddest weapon an officer's asked for?", next = "d6_odd" },
        { text = "How do the Darnassian bows compare?", next = "d6_bows" },
        { text = "Tell me about this stepladder of yours.", next = "e3_ladder" },
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
    e3_ladder = {
      lines = {
        { id = "e3_ladder_l0", text = "Three steps, folding, with a ratchet lock and a rubber foot I salvaged from a Gnomeregan steam-cart, and I've used it to test every polearm in this hall. Clate calls it a crate, which is technically inaccurate and emotionally wounding." },
      },
      choices = {
        { text = "Has it ever collapsed?", next = "e3_ladder2" },
        { text = "It's a very fine crate, Lieutenant.", next = "BACK" },
      },
    },
    e3_ladder2 = {
      lines = {
        { id = "e3_ladder2_l0", text = "Once, under a dwarven warhammer with a forty-pound head, and I landed on the hammer, which was the only soft thing in the room. I've since added a fourth leg and a disclaimer." },
        { id = "e3_ladder2_l1", when = { race = "Gnome" }, text = "Once, under a dwarven warhammer, and you'll understand the indignity, being of a similar height. I've since added a fourth leg and a disclaimer, and Clate has added a cushion, which I've chosen to take as kindness." },
      },
      choices = {
        { text = "A wise improvement. Something else.", next = "BACK" },
        { text = "The hammer was soft?", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are again! Sit, sit, I've a cloak put by that's exactly your colours, I'm almost certain." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. The kit's on the shelves, priced and labelled, so you won't need me to explain it." },
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
    d6_pot = {
      lines = { { id = "d6_pot_a", text = "Tea! Proper tea, from a shop in the Trade District that gets it off the Menethil boats, and I brew it stronger than the officers like. A cup of it after the battlegrounds does more for a knight's nerves than any medal I could pin on him." } },
      choices = {
        { text = "Do the officers actually drink it?", next = "d6_pot2" },
        { text = "A gnome with a tea habit. I like it.", next = "d6_pot2" },
        { text = "Let's change the subject.", next = "BACK" },
      },
    },
    d6_pot2 = {
      lines = { { id = "d6_pot2_a", text = "Clate does, without a word, every afternoon at four. Jackspring takes his with a measured quantity of sugar, and Skyshadow drinks it standing up and says it tastes of leaves, which it is, so I've decided she's paying it a compliment." } },
      choices = {
        { text = "Tea at four. It sounds like a home here.", next = "BACK", fx = { affinity = 1 } },
        { text = "What else, Biggins?", next = "BACK" },
      },
    },
    d6_cloak = {
      lines = { { id = "d6_cloak_a", text = "Wool for the sergeants and something better as you climb, with the lion of Stormwind or the Alliance crest worked in. A cloak's a soldier's blanket, tent and flag, all at once, and the best ones I stock have all three in mind." } },
      choices = {
        { text = "A cloak's mostly for hiding in, if you ask me.", next = "d6_cloak2", when = { class = "ROGUE" } },
        { text = "Why does a cloak matter to an officer?", next = "d6_cloak2" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    d6_cloak2 = {
      lines = {
        { id = "d6_cloak2_a", text = "Because the men behind him see his back, not his face, and a good cloak is the last thing a frightened footman sees going into the fight. I've watched a whole company straighten up because their knight's cloak was clean, and you can't buy that with steel." },
        { id = "d6_cloak2_rogue", when = { class = "ROGUE" }, text = "Ha! Mine aren't, I'm afraid, they're meant to be seen, with a crest on the back the size of a dinner plate. Go to Osborne's people in Old Town for the hiding sort, and tell them Biggins sent you, though I doubt they'll admit they know me." },
      },
      choices = {
        { text = "Clean cloaks and straight backs.", next = "BACK" },
        { text = "On to something else.", next = "BACK" },
      },
    },

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
        { text = "An insignia means nothing unless the soldier truly earned it.", next = "BACK", reply = "Exactly, and that's why I polish every one as if it were my own.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Wear a higher insignia than you've earned; who checks?", next = "BACK", reply = "I do, my friend, and so does the Sergeant Major, with considerably less patience.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What counts as an accessory?", next = "counts" },
        { text = "Who wears your insignia?", next = "wears" },
        { text = "Medals and cloaks are vanity.", next = "vanity" },
        { text = "What's my first insignia worth having?", next = "insignia", when = { pvpRank = { min = 1 } } },
        { text = "Do you miss Gnomeregan, Biggins?", next = "miss", when = { race = "Gnome" } },
        { text = "What goes on upstairs in this hall?", next = "lounge" },
        { text = "What's in the pot you've always got on?", next = "d6_pot" },
        { text = "Tell me about the cloaks.", next = "d6_cloak" },
        { text = "Do officers ever lose their insignia?", next = "e3_lost" },
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
        { text = "Being seen for what you've done matters. You're right.", next = "BACK", reply = "There, you understand, so have a biscuit.", fx = { align = { light = 1 }, affinity = 1 } },
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
    e3_lost = {
      lines = {
        { id = "e3_lost_l0", text = "All the time, my friend, in snow at Alterac and mud at Arathi and once, memorably, down the back of a tavern bench in Goldshire. I keep a box of lost ones under the counter, and every so often somebody comes in red-faced asking whether I've seen a small silver lion." },
      },
      choices = {
        { text = "Do you ever give them back?", next = "e3_lost2" },
        { text = "I'd hate to lose mine.", next = "BACK" },
      },
    },
    e3_lost2 = {
      lines = {
        { id = "e3_lost2_l0", text = "Always, with a cup of tea and no questions, because a soldier who's lost his insignia feels like he's lost his rank. One knight-captain cried when I handed his back, and I've never told a soul, until now." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
        { text = "He should've kept better hold of it.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, {g:brother|sister}. You have fought well since we last spoke, and the hall is glad of you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'd not trust you to hold a line, and I'll not pretend otherwise." },
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
    d6_miss = {
      lines = { { id = "d6_miss_a", text = "Every hour, though I have learned to stand still with it. I miss the sound of the leaves above Astranaar at night, and here the only sound at night is the bells, and the bells are very sure of themselves." } },
      choices = {
        { text = "Ishnu-alah, Sergeant Major. The forest remembers you.", next = "d6_miss2", when = { race = "NightElf" } },
        { text = "Will you go back when your service ends?", next = "d6_miss2" },
        { text = "I'll not press you on it.", next = "BACK" },
      },
    },
    d6_miss2 = {
      lines = {
        { id = "d6_miss2_a", text = "When Tyrande releases me, and not before. The orcs still cut at the edge of the forest, and the Silverwing still answer them, and I would rather be among the trees with a glaive than in this hall with a title." },
        { id = "d6_miss2_ne", when = { race = "NightElf" }, text = "Ishnu-alah, {g:brother|sister}, and you are kind to say it. Tell the trees of Ashenvale, when you see them, that one of their Sentinels stands among stone and has not forgotten them." },
      },
      choices = {
        { text = "May Elune bring you home soon.", next = "BACK", fx = { learn = { "sentinels" } } },
        { text = "Something else, Sergeant Major.", next = "BACK" },
      },
    },
    d6_humans = {
      lines = { { id = "d6_humans_a", text = "That they are brave and very loud, and that they forget quickly, which may be how they stay brave. Your footmen will march into a battle that killed their fathers, singing, and my sisters do not understand how." } },
      choices = {
        { text = "Short lives make for bold soldiers.", next = "d6_humans2" },
        { text = "Do you understand it?", next = "d6_humans2" },
        { text = "Let's leave it there.", next = "BACK" },
      },
    },
    d6_humans2 = {
      lines = { { id = "d6_humans2_a", text = "I am beginning to. A people who have only a few decades cannot afford to spend one of them mourning, so they mourn quickly and march on, and there is a kind of wisdom in it that my own people have perhaps lost." } },
      choices = {
        { text = "That's a generous thing to admit.", next = "BACK" },
        { text = "Something else I'd ask.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "I am Sergeant Major Skyshadow, of the Sentinels, and now of the Alliance's officers. I was sent here to learn how the younger races make war together, and to be seen learning it." },
        { id = "hello_2", when = { faction = "Horde" }, text = "I am Sergeant Major Skyshadow. I have fought your kind among the trees of Ashenvale, and I know the sound of your axes. You stand in the wrong hall." },
        { id = "hello_3", when = { pvpRank = { min = 1 } }, text = "I am Sergeant Major Skyshadow. You have begun to earn a place here, so I will speak to you as a comrade and not as a guest." },
      },
      again = {
        { id = "hello_again1", text = "There is more? Ask it, then, and I will answer as plainly as I am able." },
        { id = "hello_again2", text = "Speak, and I will listen." },
        { id = "hello_again3", text = "Ask, and I will answer what I may." },
      },
      choices = {
        { text = "Honour in battle is won by courage, not by deceit.", next = "BACK", reply = "So the Sentinels teach, and so I have lived for longer than this city has stood.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A soldier who strikes from hiding wins more battles.", next = "BACK", reply = "Perhaps, but the Sentinels strike from shadow without lying, and there is a difference.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Where did you fight, before this hall?", next = "fought" },
        { text = "What do you make of Stormwind?", next = "stormwind" },
        { text = "You stand apart from the others here.", next = "apart" },
        { text = "I've fought at Warsong Gulch. Is that your war?", next = "warsong", when = { pvpRank = { min = 1 } } },
        { text = "Why does a Sentinel wear a human rank?", next = "rank", when = { race = "NightElf" } },
        { text = "Who else keeps this hall?", next = "others" },
        { text = "Do you miss Ashenvale?", next = "d6_miss" },
        { text = "What do the Sentinels think of human soldiers?", next = "d6_humans" },
        { text = "You stand as still as the banners here.", next = "e3_banners" },
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
    e3_banners = {
      lines = {
        { id = "e3_banners_l0", text = "I learned stillness in the Sentinels, where a moving shape among the trees is a dead one. Your officers fidget and talk and walk about, and they think I am disapproving, but I am only listening to a city that never once falls silent." },
      },
      choices = {
        { text = "What do you hear, listening?", next = "e3_banners2" },
        { text = "Stormwind is never quiet, that's true.", next = "BACK" },
      },
    },
    e3_banners2 = {
      lines = {
        { id = "e3_banners2_l0", text = "Bells from the Cathedral, the gnomes' tram beneath the stone, and the canal water, which sounds a little like the rivers of Ashenvale if I close my eyes. Mostly I hear soldiers, though, and soldiers sound the same in every forest and every city." },
      },
      choices = {
        { text = "That's a comfort, in a way. Something else.", next = "BACK" },
        { text = "You'll grow used to the noise.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you're back, good. Pull up a chair; you're one of the few who asks a battle-mage sensible questions." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I've maps to study and little time for you, so if it's the quartermasters you want, they're by the racks." },
    { id = "g_default", text = "Good day to you. If you've come for the quartermasters, they're by the racks, and if you've come to ask a mage about war, I'd sit down first." },
    { id = "g_2", when = { metBefore = true }, text = "You again, and good. You're one of the few who doesn't ask me to set something on fire." },
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
    ga_counter = {
      big = true,
      lines = { { id = "gac_default", text = "More than every fireball I've ever thrown put together. One word cut short at the right moment, and a whole line of footmen never learn what the shaman meant to do to them, and nobody thanks you, because nothing happened." } },
      choices = {
        { text = "Nothing happening is the best outcome. I'll master it.", next = "BACK", reply = "Then you'll be the most valuable mage in any company and the least celebrated. I'd call that a good career.", fx = { align = { order = 1 } } },
        { text = "I'd rather end the shaman than his spell.", next = "BACK", reply = "So would every young mage, and the shaman's friends would rather you tried. Silence him first and burn him after.", fx = { align = { order = -1 } } },
        { text = "How do you know when to cut a spell short?", next = "ga_counter2" },
      },
    },
    ga_counter2 = {
      lines = { { id = "gac2_default", text = "You watch the hands and never the face, because a caster's face lies and the hands never do. When the fingers close, you're already too late, so you speak as they begin to open." } },
      choices = { { text = "The hands, not the face. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    ga_target = {
      big = true,
      lines = { { id = "gat_default", text = "Whoever told you that has fought beside priests and shamans, and they're right, though it's an ugly truth. Kill the one who makes the others stand up again, and the battle shortens itself." } },
      choices = {
        { text = "It feels a low thing, striking the healers first.", next = "BACK", reply = "It is, and I've done it, and the soldiers who came home because of it don't think it low. Carry it anyway.", fx = { align = { honor = 1 } } },
        { text = "It's efficient. I'll aim for them first.", next = "BACK", reply = "Efficient is the word, and I'm sorry it's the right one. Don't let it become the only word you know.", fx = { align = { honor = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    ga_blackrock = {
      lines = { { id = "gab_default", text = "They march with warlocks again, shadowcasters the garrison at Lakeshire calls them, and they read the old fel rites the way their grandfathers did before the Dark Portal. It was that kind of magic that tore this world open in my youth, and I do not intend to sit quietly while it's practised a few days' ride from our walls.", fx = { learn = { "blackrock" } } } },
      choices = {
        { text = "Nor should you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Archmage Gaiman. The Kirin Tor trained me and the Alliance borrowed me, and I've been on loan ever since. I advise the officers here on what magic can and can't do in a battle, and they mostly want to hear about the first part." },
        { id = "hello_2", when = { class = "MAGE" }, text = "Archmage Gaiman, formerly of Dalaran and lately of wherever the Alliance needs something large set alight. You'll understand, as they don't, that I find it the least interesting use of the art." },
      },
      again = {
        { id = "hello_again1", text = "Something more? The book will wait; it always does." },
        { id = "hello_again2", text = "Go on. I've nowhere pressing to be." },
        { id = "hello_again3", text = "Ask, by all means, while the officers are busy at their maps." },
      },
      choices = {
        { text = "What does a mage do in a battle?", next = "battle" },
        { text = "What are you reading?", next = "reading" },
        { text = "Magic wins wars. You should be proud of it.", next = "proud" },
        { text = "What should a mage know before the battlegrounds?", next = "know", when = { class = "MAGE" } },
        { text = "What should a soldier know about fighting beside mages?", next = "beside", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "HUNTER" } } },
        { text = "Why keep a mage in a soldiers' hall?", next = "hall" },
        { text = "What is Counterspell worth in a real battle?", next = "ga_counter", when = { class = "MAGE", minLevel = 24 } },
        { text = "I've been told to aim for the healers first.", next = "ga_target", when = { class = "MAGE", minLevel = 20 } },
        { text = "Do the Blackrock orcs in Redridge use magic?", next = "ga_blackrock" },
        { text = "Do you ever think of going back to Dalaran?", next = "e3_dalaran" },
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
        { text = "In war you use what wins, and you don't apologise.", next = "BACK", reply = "I use it, and I've never refused. I only decline to be cheerful about it.", fx = { align = { light = -1 } } },
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
    e3_dalaran = {
      lines = {
        { id = "e3_dalaran_l0", text = "Every evening, and every evening I remember that the Kirin Tor sit behind their violet dome rebuilding and don't want old battle-mages underfoot. I had rooms in the Violet Citadel once, with a view of the lake, and I'm told the dome now hides even that." },
        { id = "e3_dalaran_l1", when = { class = "MAGE" }, text = "Every evening, colleague, as you will one day too, I suspect. The Kirin Tor rebuild behind their violet dome and want no old battle-mages underfoot, and the rooms I kept in the Citadel are, I'm told, someone else's now." },
      },
      choices = {
        { text = "Would they welcome you back if you asked?", next = "e3_dalaran2" },
        { text = "Stormwind needs you more than Dalaran does.", next = "BACK" },
      },
    },
    e3_dalaran2 = {
      lines = {
        { id = "e3_dalaran2_l0", text = "Politely, and with a great many forms, and a seat on some committee about wards. I would rather sit here among soldiers who think I'm odd than among colleagues who think I'm finished." },
      },
      choices = {
        { text = "That's an honest answer. Something else.", next = "BACK" },
        { text = "You're far from finished, Archmage.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Good day. You may enter the hall, but I'll be keeping an eye on you while you're in it." },
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
    d6_hammon = {
      lines = { { id = "d6_hammon_a", text = "Everything I know about standing, which turns out to be most of the job. He taught me never to lock my knees, never to look bored when a general passes, and never to look interested when a noble does, and I've only failed at the last one twice." } },
      choices = {
        { text = "What happened the two times?", next = "d6_hammon2" },
        { text = "He sounds a fine teacher.", next = "d6_hammon2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d6_hammon2 = {
      lines = { { id = "d6_hammon2_a", text = "A duke's son asked me where the officers' lounge was, and I told him, and then I asked him where he'd served. He hadn't, and he complained, and Hammon told the duke's man that I'd been asking on his orders, which wasn't true and which I've never forgotten." } },
      choices = {
        { text = "Hammon looks after his own.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Quine.", next = "BACK" },
      },
    },
    d6_alterac = {
      lines = { { id = "d6_alterac_a", text = "That it's colder than anywhere they've ever been, and that the Stormpike dwarves and the Frostwolf orcs have been fighting over it so long that the snow itself seems to take sides. One knight told me he lost two toes and won a mine, and he said it like it was a fair trade." } },
      choices = {
        { text = "I'm from Dun Morogh. Ask me about snow.", next = "d6_alterac2", when = { race = "Dwarf" } },
        { text = "Two toes for a mine. Was it a fair trade?", next = "d6_alterac2" },
        { text = "War stories are rarely as grand as they sound.", next = "d6_alterac2" },
      },
    },
    d6_alterac2 = {
      lines = {
        { id = "d6_alterac2_a", text = "He thought so, and he's a Knight-Captain now, so the Alliance thought so too. I wrote it in my book under Alterac, between the wolves and the avalanches, and I underlined the toes." },
        { id = "d6_alterac2_dwarf", when = { race = "Dwarf" }, text = "Would you? Then tell me what kind of snow is worst, because the officers just say cold, and I'm certain there's more to it than that. Wait, let me get my pencil out, and go slowly." },
      },
      choices = {
        { text = "Wet snow is worst. It soaks through everything.", next = "BACK" },
        { text = "Let's leave Alterac for now.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Guard Quine, door watch, Champions' Hall. Hammon has the left side and I have the right, and between us we see every officer in the Alliance sooner or later. I've met more heroes than a bard has, and I've not left Old Town in two years." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Guard Quine, door watch. You're not coming in, and I'd as soon you weren't standing there when Hammon looks round." },
      },
      again = {
        { id = "hello_again1", text = "Is there anything else? I've hours till relief, and I'd sooner spend them hearing about somewhere new." },
        { id = "hello_again2", text = "Please, go on." },
        { id = "hello_again3", text = "Yes? I'm glad of the company, truthfully." },
      },
      choices = {
        { text = "A guard's duty is to keep order, whoever stands at the door.", next = "BACK", reply = "That's what Hammon says, and he's been on this door longer than I've been alive.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "The rules at this door bend for the right friends.", next = "BACK", reply = "Not while I'm standing at it, they don't, and you'd do well to remember that.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What do you write in those notes?", next = "notes" },
        { text = "What's it like, guarding heroes?", next = "heroes" },
        { text = "A guard should guard, not daydream.", next = "daydream" },
        { text = "I'll tell you about the battlegrounds.", next = "tell", when = { pvpRank = { min = 1 } } },
        { text = "I've seen a good deal of the world. Ask me something.", next = "ask", when = { minLevel = 40 } },
        { text = "Who's inside the hall today?", next = "inside" },
        { text = "Has Hammon taught you much?", next = "d6_hammon" },
        { text = "What do officers say about Alterac Valley?", next = "d6_alterac" },
        { text = "How full is your book of places now?", next = "e3_book" },
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
    e3_book = {
      lines = {
        { id = "e3_book_l0", text = "Two hundred and six pages, and I've had to start writing smaller, because the officers keep naming places I've never heard of. My favourite is a lake in the Hinterlands where a Knight-Lieutenant swore the gryphons come down to drink at dawn." },
      },
      choices = {
        { text = "Which place will you visit first?", next = "e3_book2" },
        { text = "Two hundred pages! You should publish it.", next = "BACK" },
      },
    },
    e3_book2 = {
      lines = {
        { id = "e3_book2_l0", text = "The gryphon lake, if I can find out how to get there, which no officer has ever told me in a way I could follow. Hammon says a man who sets out with a book of other people's stories comes back with one of his own, and I mean to test that." },
      },
      choices = {
        { text = "Hammon's right. Something else.", next = "BACK" },
        { text = "Some stories are better left unchecked.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you again. Boots wiped already, I see, which is more than most of the officers manage." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Boots, manners, and no trouble, and I'll be watching for all three." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Evening. Night watch on this door is the easy one; it's the officers who can't sleep, and they only want a nod." },
    { id = "g_default", text = "Good day to you. Champions' Hall. Wipe your boots, mind your manners, and you'll have no trouble from me." },
    { id = "g_2", when = { metBefore = true }, text = "Back again, good. Boots, please, the same as before." },
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
    d6_best = {
      lines = { { id = "d6_best_a", text = "A grey-haired footman came in to collect his sergeant's stripe, thirty years after he'd first put on a tabard. The young knights stood up when he walked through, every one of them, and nobody had told them to." } },
      choices = {
        { text = "Thirty years to earn a stripe?", next = "d6_best2" },
        { text = "That's the kind of thing that keeps you here.", next = "d6_best2" },
        { text = "Something else, Hammon.", next = "BACK" },
      },
    },
    d6_best2 = {
      lines = { { id = "d6_best2_a", text = "Thirty years of carrying a spear in Redridge and Westfall and never once being noticed, until the battlegrounds counted what he'd done. That's what this hall's for, as I see it, and I'll stand at its door till my knees give out to see it happen once more." } },
      choices = {
        { text = "May your knees hold, Hammon.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    d6_partners = {
      lines = { { id = "d6_partners_a", text = "Four of them, and every one moved on to something better, which is the point of training a man. One went to the Night Watch in Duskwood, one to the barracks as an instructor, and one married a baker in Goldshire and never looked back, which I count as a success too." } },
      choices = {
        { text = "And the fourth?", next = "d6_partners2" },
        { text = "Any advice for a paladin on the road?", next = "d6_partners2", when = { class = "PALADIN" } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d6_partners2 = {
      lines = {
        { id = "d6_partners2_a", text = "The fourth went to Lakeshire when the orcs came down out of the Burning Steppes, and he didn't come back. Quine's the fifth, and I'll see that he outlives me, if I have to stand in front of him to do it." },
        { id = "d6_partners2_pal", when = { class = "PALADIN" }, text = "Same as I gave all four, friend: sleep when you can, eat when you can, and never trust a road that's quiet in Duskwood. The Light will mind your soul, but your feet are your own affair, so keep your boots dry." },
      },
      choices = {
        { text = "I'm sorry about your partner.", next = "BACK" },
        { text = "Something else I'd ask.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Guard Hammon, senior watch, Champions' Hall. I've had this door since the hall was founded, and I've trained four partners at it. Quine's the fifth, and he asks more questions than the other four put together." },
        { id = "hello_2", when = { origin = "human_city_guard" }, text = "Guard Hammon, senior watch. You're guard-trained yourself, I can see it in the heels. Which gate did they start you on? Mine was the Valley of Heroes, in the rain." },
      },
      again = {
        { id = "hello_again1", text = "Anything more, friend? Speak while the door's quiet, and wipe your boots while you're at it." },
        { id = "hello_again2", text = "Go on, the door's quiet." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Order in the city starts with doors kept properly.", next = "BACK", reply = "That's thirty years on this door said better than I could say it, friend.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A little disorder keeps the guards on their toes.", next = "BACK", reply = "It keeps the Stockade full, more like, and I've walked enough men there.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "You've had this door a long time.", next = "long" },
        { text = "What do you make of young Quine?", next = "quine" },
        { text = "Standing at a door is no life for a soldier.", next = "nolife" },
        { text = "What's the trick in the knees?", next = "knees", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I started on the Trade District gate.", next = "gate", when = { origin = "human_city_guard" } },
        { text = "What trouble does this door ever see?", next = "trouble" },
        { text = "What's the best thing you've seen at this door?", next = "d6_best" },
        { text = "Tell me about the partners you've trained.", next = "d6_partners" },
        { text = "Quine says you went bald training door guards.", next = "e3_head" },
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
    e3_head = {
      lines = {
        { id = "e3_head_l0", text = "Did he? Cheek. It went the year I trained my second partner, a lad named Bram who saluted every pigeon that landed on the arch, and I'll swear I felt every hair go." },
      },
      choices = {
        { text = "What became of Bram?", next = "e3_head2" },
        { text = "It suits you, Hammon.", next = "BACK" },
      },
    },
    e3_head2 = {
      lines = {
        { id = "e3_head2_l0", text = "He's a sergeant at Sentinel Hill now, keeping the Defias from Westfall's last good road, and he writes to tell me he's stopped saluting pigeons. I'll believe it when I see it, but I'm proud of the lad." },
      },
      choices = {
        { text = "You trained him well. Something else.", next = "BACK" },
        { text = "Westfall needs more like him.", next = "BACK" },
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
        { id = "hello_again2", text = "Go on, then. The mug's half full an' I'm in nae hurry tae empty it." },
        { id = "hello_again3", text = "Aye? Ask, and welcome." },
      },
      choices = {
        { text = "What happened in the mine?", next = "mine" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "You should stop blaming yourself.", next = "blame" },
        { text = "Was it a bad roof, or was it brought down?", next = "roof", when = { profession = "Mining" } },
        { text = "Why not go home to Ironforge?", next = "home", when = { race = "Dwarf" } },
        { text = "I brought back their union cards. Who were they?", next = "cards", when = { questDone = TODO_QUEST("Collecting Memories") } },
        { text = "This pub's very quiet for the Dwarven District.", next = "e3_pub" },
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
    e3_pub = {
      lines = {
        { id = "e3_pub_l0", text = "It is, an' that's why I drink here. The loud places are full o' dwarves who'll want tae buy me a round an' hear about Moonbrook, an' I've told it enough times tae know it doesnae get lighter for the tellin'." },
        { id = "e3_pub_l1", when = { race = "Dwarf" }, text = "It is, an' ye'll know why a dwarf would want that. The Stonefire's full o' our kin who'd buy me a round an' ask about Moonbrook, an' I've told it enough tae know it doesnae get lighter for the tellin'." },
      },
      choices = {
        { text = "Does the barkeep know the story?", next = "e3_pub2" },
        { text = "Then I'll not make you tell it again.", next = "BACK" },
      },
    },
    e3_pub2 = {
      lines = {
        { id = "e3_pub2_l0", text = "Aye, an' he's never once asked. He sets down my mug an' leaves the bottle, an' on the day the mine fell he sets down two, an' I drink one an' leave the other for my brother." },
      },
      choices = {
        { text = "That's a good barkeep. Something else.", next = "BACK" },
        { text = "Your brother would want you to drink both.", next = "BACK" },
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
        { id = "hello_1", text = "Name's Jorgen, and I fish here. Been fishin' here a good few years, and the guards have stopped askin' what I catch. It's a fine spot for it, right under the bridge, where everybody who comes into Stormwind walks over my head." },
        { id = "hello_2", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Jorgen. So the Bishop's sent you, has he? Then he's worried, and he doesn't worry easy. I'll write you somethin' for Elling Trias, and you'll hand it to him and say nothin' else." },
        { id = "hello_3", when = { questDone = TODO_QUEST("The Missing Diplomat") }, text = "Jorgen. You saw that business through, I hear, all the way out to the marsh. I heard it from three directions, and none of 'em were you, which I thought well of." },
      },
      again = {
        { id = "hello_again1", text = "Somethin' else? Keep it low, then." },
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
        { text = "What did the boots tell you this week?", next = "e3_boots" },
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
        { id = "bait_1", text = "No, and there never has been. You've a good eye, and I'd thank you to keep a shut mouth to go with it. There's a fella in Old Town named Shaw who knows why I'm here, and nobody else needs to." },
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
    e3_boots = {
      lines = {
        { id = "e3_boots_l0", text = "A priest from Northshire with mud from the abbey road, three dwarves with tram grease up to the ankle, and a lady in silk slippers who walked from the Keep to the gate and back, twice, without buying anything." },
      },
      choices = {
        { text = "Silk slippers at the gate? Who walks like that?", next = "e3_boots2" },
        { text = "You do see everything from down there.", next = "BACK" },
      },
    },
    e3_boots2 = {
      lines = {
        { id = "e3_boots2_l0", text = "Nobody who wants to be seen, which is why she wore the slippers, so she'd look like she was only takin' the air. I wrote her down for a friend of mine who likes knowin' about ladies from the Keep, and that's all I'll say." },
      },
      choices = {
        { text = "I'll not ask who the friend is. Something else.", next = "BACK" },
        { text = "That sounds like spying to me.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's one of my regulars! Your stool's free, and I've the tap already running for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll rent you a room, but there'll be no trouble in my house tonight." },
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
    d6_house = {
      lines = { { id = "d6_house_a", text = "A dark ale brewed for us out in Goldshire, which the footmen call Pig's Revenge, for reasons that become clear on the morning after. The officers drink something finer, and then they come back down to the dark ale by midnight, every one of them." } },
      choices = {
        { text = "Got anything from Thunderbrew?", next = "d6_house2", when = { race = "Dwarf" } },
        { text = "Why do they always come back to the cheap stuff?", next = "d6_house2" },
        { text = "I'll take your word on the ale.", next = "d6_house2" },
      },
    },
    d6_house2 = {
      lines = {
        { id = "d6_house2_a", text = "Because it's what they drank as recruits, before anybody saluted them, friend. A knight-captain who's had a hard week wants to be twenty again for an hour, and the dark ale's the cheapest way I know to sell him that." },
        { id = "d6_house2_dwarf", when = { race = "Dwarf" }, text = "A keg, sometimes, when the Ironforge carts come through, and it never lasts past the second night. Dashel drinks half of it himself and calls it keeping the peace, and I've never once found the nerve to argue with him." },
      },
      choices = {
        { text = "A sound bit of business, Reese.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    d6_oldtown = {
      lines = { { id = "d6_oldtown_a", text = "It burned in the First War with the rest of the city, friend, and it was the last quarter they rebuilt, being full of soldiers and nobody important. The stonemasons did good work on it, and then the nobles wouldn't pay them, and you'll know what came of that." } },
      choices = {
        { text = "The Defias came of it.", next = "d6_oldtown2" },
        { text = "You don't sound angry at the masons.", next = "d6_oldtown2" },
        { text = "Let's not dwell on it.", next = "BACK" },
      },
    },
    d6_oldtown2 = {
      lines = { { id = "d6_oldtown2_a", text = "The Defias did, and I'll not defend a single thing they've done since. But half the men who built these walls drank at my bar while they built them, and I poured for them on credit when the nobles didn't pay, and I still don't count that a debt." } },
      choices = {
        { text = "You remember them kindly.", next = "BACK", fx = { learn = { "stonemasons" } } },
        { text = "Pour me something, and tell me more later.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Reese Langston, and this is the Pig and Whistle, the soldiers' own tavern. The barracks are next door and the Champions' Hall is round the corner, so I pour for recruits and knight-captains at the same bar, and they're all thirsty the same way." },
        { id = "hello_2", when = { pvpRank = { min = 6 } }, text = "Reese Langston, and you're an officer, by that stripe, so the good cask's open. The hall sends me its knights when they've been pinned, and I've a tankard on the shelf for every rank." },
      },
      again = {
        { id = "hello_again1", text = "What else, friend? Another round, another question, the tap's running either way." },
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
        { text = "What's the house drink here?", next = "d6_house" },
        { text = "Old Town must have seen some hard days.", next = "d6_oldtown" },
        { text = "Tell me about the tankards on the shelf.", next = "e3_tankards" },
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
    e3_tankards = {
      lines = {
        { id = "e3_tankards_l0", text = "One for every rank the Champions' Hall gives out, from sergeant up to grand marshal, and I fill the right one the night a regular comes in with a new stripe. The grand marshal's has never been poured, and I polish it every week out of hope." },
      },
      choices = {
        { text = "Who'll be the first to drink from it?", next = "e3_tankards2" },
        { text = "Fill the sergeant's for me someday.", next = "BACK" },
      },
    },
    e3_tankards2 = {
      lines = {
        { id = "e3_tankards2_l0", text = "Somebody who's drunk in here as a recruit, I hope, so it means something when they lift it. I've a bet with Dashel that it'll be a dwarf, and he's a bet with me that it'll be nobody before we're both too old to pour." },
      },
      choices = {
        { text = "I hope you win. Something else.", next = "BACK" },
        { text = "Dashel's likely right.", next = "BACK" },
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

-- Aldric Moore: sells mail at the Lionheart Armory in the Trade District, and argues with Lara about leather.
P:NPC {
  key = "aldric_moore", id = TODO_NPC("Aldric Moore"), name = "Aldric Moore", title = "Mail Armor Merchant", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "bluff", "proud" }, values = { "craft", "duty" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Aldric Moore sells mail at the Lionheart Armory and rattles every hauberk on the rack to prove it is sound. He and Lara Moore have argued mail against leather for years, and neither has given a link.",
    third = "{name} met Aldric Moore, who sells mail armour at the Lionheart Armory in Stormwind's Trade District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my best customer! I've a coat of rings in your size, and I've hidden it where Lara won't drape a jerkin over it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Mail's on this end of the counter, and so am I, but I'd sooner you asked Lara." },
    { id = "g_default", text = "Good day to you! If it's rings and rivets you're after, you've come to the right end of the counter." },
    { id = "g_2", when = { metBefore = true }, text = "Back again, and still in one piece, which I'll take as praise for the mail." },
    { id = "g_3", when = { class = { "PALADIN", "WARRIOR" } }, text = "Now here's someone who knows what a coat of rings is for. Step up, {class}, and let's find you a fit." },
    { id = "g_4", when = { timeOfDay = "night" }, text = "We're near closing, friend, but I've never yet sent anyone out into the dark underdressed." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those links are hanging by a prayer, friend. See a smith before the day is out, or see me, but don't walk to Westfall in that." },
    { id = "n_2", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You'll want Carla, at the far end, for cloth. I'd sell you a hauberk gladly, but you'd fall over in it, and Harlan would blame me." },
    { id = "n_3", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith's hands, those are. Have a look at the riveting on that byrnie and tell me honestly if you'd have done it better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Aldric Moore, and the mail in the Lionheart Armory is mine to sell. Harlan Bagley owns the shop and counts the coin, Carla has the cloth, and Lara has the leather, about which she'll tell you a great deal that isn't so." },
        { id = "hello_2", when = { class = "HUNTER" }, text = "Aldric Moore, and I've mail on that rack a hunter can draw a bow in. Lara will tell you to stay in leather, but Lara has never been bitten by anything larger than a cat." },
      },
      again = {
        { id = "hello_again1", text = "What else? Ask, friend, and if it's about leather, ask the other end of the counter." },
        { id = "hello_again2", text = "Go on, I've time between fittings." },
        { id = "hello_again3", text = "Aye, friend?" },
      },
      choices = {
        { text = "An armourer should never sell a coat he wouldn't wear himself.", next = "BACK", reply = "That's my rule exactly, friend, and I've worn every one on this rack.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Patch the broken rings with tin; it shines just the same.", next = "BACK", reply = "It shines right up to the first sword stroke, and then it's my name they curse.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the mail.", next = "BUSINESS" },
        { text = "What makes good mail?", next = "good" },
        { text = "You and Lara don't agree, I hear.", next = "lara" },
        { text = "Business looks brisk in here.", next = "brisk" },
        { text = "A soldier ought to buy from the army, not a shop.", next = "army" },
        { text = "Would mail stop a Defias blade?", next = "defias", when = { maxLevel = 25 } },
        { text = "Where does your mail come from?", next = "source", when = { profession = "Blacksmithing" } },
        { text = "What's Harlan Bagley like to work for?", next = "e3_harlan" },
        { text = "Good day, Aldric.", next = "END" },
      },
    },
    good = {
      lines = {
        { id = "good_1", text = "Riveted links, every one, and none of them merely pressed shut. A butted ring opens the first time a spear finds it, and then the hole grows with every step you run." },
      },
      choices = {
        { text = "How can I tell the difference?", next = "tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = {
        { id = "tell_1", text = "Run your thumbnail over a ring and feel for the little flat where the rivet sits. If it's smooth all round, put it back on the rack and walk away, whatever the price." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
    lara = {
      lines = {
        { id = "lara_1", text = "Every day since she took the next counter, and I've enjoyed all of it. She says leather lets you move, and I say you needn't move so much if the blow doesn't hurt." },
      },
      choices = {
        { text = "Who wins?", next = "wins" },
        { text = "Leather has its uses, Aldric.", next = "wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wins = {
      lines = {
        { id = "wins_1", text = "Harlan does, because whoever loses the argument sells harder to prove a point. Carla keeps a tally on the wall behind the robes, and I'm told I'm ahead by two." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    brisk = {
      lines = {
        { id = "brisk_1", text = "It is, and I'd be happier if it weren't. Farmers from Westfall come in for a coat of rings with their harvest money, and a farmer doesn't buy mail because the year is going well." },
      },
      choices = {
        { text = "What do they tell you?", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = {
        { id = "farmers_1", text = "That the Defias take what they please west of the river, and that the militia at Sentinel Hill is brave and thin on the ground. One fellow bought a shirt for his son and wouldn't say where the boy was going." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    army = {
      big = true,
      lines = {
        { id = "army_1", text = "The army issues what it has, and what it has was hammered out in a hurry. I've seen quartermaster's mail with rings a child could bend. A soldier who can afford better owes it to the man standing beside him." },
      },
      choices = {
        { text = "A soldier's life is worth a merchant's price.", next = "BACK", reply = "Then we understand each other. I'd sooner sell one good coat than bury three cheap ones.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You make your living from the crown's shortages.", next = "BACK", reply = "I make my living from rings and rivets. The shortages were here before me, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias = {
      lines = {
        { id = "defias_1", text = "A knife, yes, and most of what a footpad swings. It won't stop a crossbow at ten paces, and I'll not tell you it will. Wear a padded coat beneath, and keep your shield arm toward the hedge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "source_1", text = "The plain coats come from the forges in the Dwarven District, and the fine ones down from Ironforge by the Deeprun Tram. Therum Deepforge's people do honest work, though they charge as if every ring were silver." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_harlan = {
      lines = {
        { id = "e3_harlan_l0", text = "Fair, friend, and careful with a copper in a way that would make a dwarf weep with envy. He's never once sold a piece he hadn't paid for in full, which is more than most shop owners in the Trade District can say." },
      },
      choices = {
        { text = "Does he take a side in your argument with Lara?", next = "e3_harlan2" },
        { text = "Careful with coin is no bad thing.", next = "BACK" },
      },
    },
    e3_harlan2 = {
      lines = {
        { id = "e3_harlan2_l0", text = "Never, and he's clever about it, because he says whichever of us sells more that month is right. Lara won three months running last summer, and I've not let her forget that it was the hottest summer in ten years." },
      },
      choices = {
        { text = "Weather counts, surely. Something else.", next = "BACK" },
        { text = "Sounds like Lara won fairly.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "They say the Stonemasons who built this city never were paid, and that half the Defias are the same men. I sell to anyone with an honest face, so I try not to think on it." } },
    background = { { id = "tp_background", text = "Born over a smithy in Old Town, and never had the arm for the hammer. I found I could sell what better men made, and I've done it at this counter ever since." } },
    advice = { { id = "tp_advice", text = "Buy your armour a finger too large and wear wool under it. A coat that fits in the shop will choke you on the march." } },
    westfall = { { id = "tp_westfall", text = "Good wheat country once, and my best customers now, which tells you all you need to know about it." } },
    _none = { { id = "tp_none", text = "That's beyond my rack, friend. Ask me about rings and rivets and I'll keep you till supper." } },
  },
}

-- Lara Moore: sells leather at the Lionheart Armory in the Trade District.
P:NPC {
  key = "lara_moore", id = TODO_NPC("Lara Moore"), name = "Lara Moore", title = "Leather Armor Merchant", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "quick", "teasing" }, values = { "craft", "freedom" },
  notices = { "class", "craft", "kit" },
  impression = {
    first = "Lara Moore sells leather at the Lionheart Armory and can tell where a hide was tanned by the smell of it. She has argued leather against mail with Aldric Moore for so long that the customers take sides.",
    third = "{name} met Lara Moore, who sells leather armour at the Lionheart Armory in Stormwind's Trade District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are! I knew you'd come back to the leather end, and I've a jerkin that'll fit you like a second skin." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Look all you like, but don't come asking me to sell against Aldric for your sake." },
    { id = "g_default", text = "Hello there! Leather's at this end, and don't let Aldric catch your eye on the way past." },
    { id = "g_2", when = { metBefore = true }, text = "You came back to the right counter, I see. Good." },
    { id = "g_3", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "Now you look like someone who moves for a living. Come and feel this jerkin." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll be wanting Aldric and his kettle-suits, I suppose. Listen to yourself walk first, though, and tell me you like the noise." },
    { id = "n_2", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You've worked hides yourself, haven't you? There's tannin under your nails. Tell me what you think of this stitching." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That leather's cracked through at the shoulder. Oil would have saved it a month ago, and nothing will save it now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Lara Moore, and I sell the leather here: jerkins, bracers, boots and belts. Carla has the cloth, Aldric has the mail, and Harlan has the cashbox, which is the only armour he cares about." },
      },
      again = {
        { id = "hello_again1", text = "What else, then? Ask quick, before Aldric starts rattling rings at you." },
        { id = "hello_again2", text = "Ask away, I'm only folding." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Good leather should be sold at a price that honours the work.", next = "BACK", reply = "That's the truth, and it's why my jerkins outlast Aldric's mail by years.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Dye cheap hide dark, and call it Elwynn deerskin.", next = "BACK", reply = "People try it at the market every week, and every week somebody gets caught.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the leather.", next = "BUSINESS" },
        { text = "What's good leather, to your eye?", next = "good" },
        { text = "Aldric says mail beats leather.", next = "aldric" },
        { text = "Who buys leather these days?", next = "buyers" },
        { text = "Quiet armour is for people with something to hide.", next = "quiet" },
        { text = "Where do the hides come from?", next = "hides" },
        { text = "I skin my own. Would the tanners buy?", next = "skin", when = { profession = "Skinning" } },
        { text = "Can you really tell a hide by its smell?", next = "e3_smell" },
        { text = "Good day, Lara.", next = "END" },
      },
    },
    good = {
      lines = {
        { id = "good_1", text = "Supple enough to fold and thick enough that you can't see daylight through it. Bend it sharply by your ear, and if it creaks like a stair, it was dried too fast and it will split on you by winter." },
      },
      choices = {
        { text = "And the stitching?", next = "stitch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitch = {
      lines = {
        { id = "stitch_1", text = "Waxed thread, doubled, with the seams turned inward so nothing catches. Seoman Griffith in Old Town sews the best seam in the city, and I'd say so to his face if I didn't have my own stock to sell." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    aldric = {
      lines = {
        { id = "aldric_1", text = "Aldric says a great many things, and most of them clank. Mail will turn a blade, I grant him that. Leather will let you not be where the blade is, and I know which I'd choose." },
      },
      choices = {
        { text = "You two enjoy this.", next = "enjoy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enjoy = {
      lines = {
        { id = "enjoy_1", text = "Don't tell him. We've shared a name and a shop for years, and the day we agree on anything Harlan will think one of us is ill. Carla keeps the score, and she swears it's even." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_1", text = "Hunters and scouts, as ever, and lately a good many ordinary folk who are taking the road to Redridge or Darkshire and would like to hear what's coming. You can't hear a wolf over the sound of your own hauberk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      big = true,
      lines = {
        { id = "quiet_1", text = "Or for people with something to find. The scouts who walk Elwynn's borders wear my leather, and so, I don't doubt, do a few folk I'd not ask my business of. I sell a jerkin, friend, and what's done in it is none of my doing." },
      },
      choices = {
        { text = "Sell to whoever pays. What they do is their affair.", next = "BACK", reply = "That's the only way a shop can be run, and I sleep well enough on it.", fx = { align = { order = -1 } } },
        { text = "A merchant should know who she's arming.", next = "BACK", reply = "Then I'd have to close the door on half of Old Town. I do look at faces, though, more than you'd think.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hides_1", text = "Elwynn boar and Westfall goretusk for the common pieces, tanned down by the canals where you can smell it. The fine stuff comes from farther off, and it costs more every month the roads are bad." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skin = {
      lines = {
        { id = "skin_1", text = "Not from me, I only sell the finished work. Take them to the Protective Hide in Old Town, where Simon Tanner and Jillian will look them over, and salt them first or Jillian will send you straight back out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_smell = {
      lines = {
        { id = "e3_smell_l0", text = "Oak bark for the canal tanners, birch for the Elwynn ones, and something sour I'd rather not name for anything that came in off the Booty Bay boats. Hold that jerkin to your nose, and you'll smell Goldshire, and I'll stand by that." },
      },
      choices = {
        { text = "What does Aldric's mail smell of?", next = "e3_smell2" },
        { text = "It smells of leather to me.", next = "BACK" },
      },
    },
    e3_smell2 = {
      lines = {
        { id = "e3_smell2_l0", text = "Rust and oil and a little bit of Aldric, if I'm honest, because he will try every coat on before he sells it. I've told him that's why the soldiers come to me afterwards, and he's never found an answer." },
      },
      choices = {
        { text = "Poor Aldric. Something else.", next = "BACK" },
        { text = "Trying them on sounds like good practice.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A scout told me the wolves in Duskwood have started walking on two legs. He paid for the best jerkin I had and didn't haggle, so I believe him." } },
    background = { { id = "tp_background", text = "I grew up along the canals where the tanners work, so I never minded the smell. Selling the finished thing is a deal cleaner than making it." } },
    advice = { { id = "tp_advice", text = "Oil your leather after every rain, and never dry it by the fire. More armour dies on a hearthstone than on a battlefield." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, and I'd only make something up. Ask me about hides instead." } },
  },
}

-- Carla Granger: sells cloth armour at the Lionheart Armory; fits customers by eye and keeps the score between the Moores.
P:NPC {
  key = "carla_granger", id = TODO_NPC("Carla Granger"), name = "Carla Granger", title = "Cloth Armor Merchant", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "exact", "dry" }, values = { "craft", "order" },
  notices = { "class", "craft", "arcane" },
  impression = {
    first = "Carla Granger sells robes and cloth at the Lionheart Armory and can size a customer from the doorway without lifting her tape. She keeps a chalk tally of the Moores' arguments on the wall behind the robes.",
    third = "{name} met Carla Granger, who sells cloth armour at the Lionheart Armory in Stormwind's Trade District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you're back, and I've already measured you in my head. Stand to the light; I've something in your size." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand still, choose quickly, and spare me the conversation, please." },
    { id = "g_default", text = "Good day. Stand still a moment, please. Yes, I have your size." },
    { id = "g_2", when = { metBefore = true }, text = "You again, and you've lost weight on the road. I shall take the last one in, in my head." },
    { id = "g_3", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Ah, someone who will wear what I sell and not merely look at it. Come to the light, {class}." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You want the Moores, at the other end. I do keep padded coats to wear beneath mail, if you would like to stop chafing." },
    { id = "n_2", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew. I can see the needle callus from here. You'll find no fault with these seams, though you are welcome to look." },
    { id = "n_3", cat = "arcane", when = { class = "MAGE" },
      text = "No brass buttons for you. They spark, whatever Harlan says, and I have the scorched sleeve in the back to prove it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Carla Granger. I sell cloth here: robes, gloves, mantles, and padding for those who wear iron over it. The Moores sell the leather and the mail and argue about both, and I keep the peace by keeping the score." },
      },
      again = {
        { id = "hello_again1", text = "Was there something else? Stand still while you ask it, please, I'm nearly done measuring." },
        { id = "hello_again2", text = "Go on." },
        { id = "hello_again3", text = "Yes? I am listening, and measuring." },
      },
      choices = {
        { text = "A tailor should charge for the cloth and the honest hours, no more.", next = "BACK", reply = "Precisely, and that is why I keep my own score as carefully as the Moores' quarrel.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell cheap linen as silk to anyone who can't tell the difference.", next = "BACK", reply = "Anyone who wears it will tell the difference by the first rain, I assure you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the cloth.", next = "BUSINESS" },
        { text = "You sized me from the door.", next = "eye" },
        { text = "What cloth is selling?", next = "selling" },
        { text = "Tell me about this score you keep.", next = "score" },
        { text = "Cloth is no armour at all.", next = "noarmour" },
        { text = "Where do you get your cloth?", next = "where" },
        { text = "Is there a Granger in Old Town?", next = "maris", when = { profession = "Skinning" } },
        { text = "You mentioned mages sewing wards into robes.", next = "e3_ward" },
        { text = "Good day, Carla.", next = "END" },
      },
    },
    eye = {
      lines = {
        { id = "eye_1", text = "Twenty years of it. Shoulders first, then the length of the arm, then how a person stands when they think nobody is looking. The tape is only to reassure the customer." },
      },
      choices = {
        { text = "And how do I stand?", next = "stand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stand = {
      lines = {
        { id = "stand_1", text = "Like someone who has slept on the ground lately and expects to again. I would give you a robe with room in the shoulders and a hem you won't trip on when you run." },
        { id = "stand_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "Like someone used to carrying weight on the shoulders. A padded arming coat, cut long, and you would walk easier under all that iron." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    selling = {
      lines = {
        { id = "selling_1", text = "Sturdy robes, in dark colours, and I cannot fold them fast enough. A year ago it was festival silks. People are dressing to travel and not to be seen, and I notice that kind of thing." },
      },
      choices = {
        { text = "Who's travelling?", next = "travel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    travel = {
      lines = {
        { id = "travel_1", text = "Young mages from the Quarter, mostly, sent out to Redridge and Darkshire before they're ready. Their masters send them to me first, which is the one sensible thing their masters do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    score = {
      lines = {
        { id = "score_1", text = "One chalk mark each time a customer is argued from one end of the counter to the other. Aldric believes he is ahead by two, and Lara has been told it is even. Both are wrong, and neither needs to know." },
      },
      choices = {
        { text = "Who's really ahead?", next = "ahead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ahead = {
      lines = {
        { id = "ahead_1", text = "I am. Whichever of them loses, the customer comes away so tired of hearing about armour that they buy a cloak from me on the way out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    noarmour = {
      big = true,
      lines = {
        { id = "noarmour_1", text = "It will not turn a sword, no. It will keep the rain off, hold a ward if a mage has sewn one in, and let you run. Most of the people I dress stay alive by not being hit in the first place." },
      },
      choices = {
        { text = "Wit and distance are armour enough.", next = "BACK", reply = "So I have always thought. It is cheaper to mend a hem than a rib.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Anyone going into danger should wear iron.", next = "BACK", reply = "Then they should also be able to lift it. Not everyone is built as you are.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "where_1", text = "Wool from Elwynn, linen from the farms that are left in Westfall, and silk when a ship comes in. Duncan's Textiles in the Mage Quarter has the finer bolts, and I send customers there when what they want is beyond my shelves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    maris = {
      lines = {
        { id = "maris_1", text = "Maris, who teaches skinning at the Protective Hide. A cousin. She hasn't a kind word for anyone, and I have told her it is bad for trade, and she said that hides don't need charming." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_ward = {
      lines = {
        { id = "e3_ward_l0", text = "A good many of the Quarter's apprentices bring their robes back to me after, so I can stitch the hem over the runes they've drawn in the lining. I don't understand a word of it, but I know it must not pucker, or the whole thing goes wrong." },
        { id = "e3_ward_l1", when = { class = "MAGE" }, text = "Your colleagues bring their robes back to me after they've drawn the runes in, so I can close the lining without puckering them. You'll know better than I why it matters, but I've never had one returned scorched, and I'm proud of it." },
      },
      choices = {
        { text = "What happens if it puckers?", next = "e3_ward2" },
        { text = "That's skilled work.", next = "BACK" },
      },
    },
    e3_ward2 = {
      lines = {
        { id = "e3_ward2_l0", text = "I'm told the ward bends, and I was shown a robe once where it had, with a scorch mark the shape of a hand across the back. The apprentice who wore it is fine, I'm assured, and has since become very particular about tailors." },
      },
      choices = {
        { text = "I don't blame him. Something else.", next = "BACK" },
        { text = "Mages should sew their own.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The Cathedral has ordered twice the usual number of plain travelling robes. Priests are being sent somewhere, and nobody has said where." } },
    background = { { id = "tp_background", text = "I was a seamstress before I was a shopkeeper. I found I had more patience for selling a robe than for sewing forty of them." } },
    advice = { { id = "tp_advice", text = "Buy the darker colour. It hides the road, and the blood, and it does not show at night." } },
    _none = { { id = "tp_none", text = "I have no opinion on that. I have a great many on cloth." } },
  },
}

-- Edna Mullby: sells crafters' sundries at Everyday Merchandise in the Trade District, beside Thurman.
P:NPC {
  key = "edna_mullby", id = TODO_NPC("Edna Mullby"), name = "Edna Mullby", title = "Trade Supplies", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "shrewd" }, values = { "thrift", "craft" },
  notices = { "craft", "purse" },
  impression = {
    first = "Edna Mullby sells thread, flux, salt and vials at Everyday Merchandise and knows what every craft in the city is short of this week. She says she is the brains of the shop, and Thurman has learned not to argue.",
    third = "{name} met Edna Mullby, who sells trade supplies at Everyday Merchandise in Stormwind's Trade District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! I've kept a spool of the good thread behind the counter, since you crafters always want more than you buy." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Everything's in its drawer and priced, so you can help yourself without me." },
    { id = "g_default", text = "Good day! Thread, flux, vials, salt, dye; if a craft needs it, I've a drawer for it." },
    { id = "g_2", when = { metBefore = true }, text = "Back for more? You crafters never buy enough the first time, and I've stopped saying so." },
    { id = "g_3", when = { timeOfDay = "dawn" }, text = "You're early, and that's sensible. The good thread is gone by noon." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "Thread, is it? I can always tell, because you people look at a spool the way a drunkard looks at a cask." },
    { id = "n_2", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You'll want flux, and more of it than you think. I've never yet had a smith come back to say he'd bought too much." },
    { id = "n_3", cat = "purse", when = { money = { max = 500 } },
      text = "If the purse is light, buy the coarse thread and the weak flux. They'll do for practice pieces, and practice is all a beginner makes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Edna Mullby, and this side of Everyday Merchandise is mine. Thurman sells the bread, the bags and the candles, and I sell what crafters need to turn one thing into another, which is where the money is." },
      },
      again = {
        { id = "hello_again1", text = "What else, dear? Thread, flux or a question, I've a drawer for all three." },
        { id = "hello_again2", text = "Go on, dear, I can count and listen." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A merchant should weigh her goods fairly, every time.", next = "BACK", reply = "Every time, friend, and my scales are checked by the Trade Office twice a year.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A thumb on the scales never hurt anybody.", next = "BACK", reply = "It hurts the crafter who comes up short, and it hurts the merchant once word gets round.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the trade supplies.", next = "BUSINESS" },
        { text = "Thurman says you're the brains of the shop.", next = "brains" },
        { text = "What are crafters short of this week?", next = "short" },
        { text = "You must know every craftsman in the city.", next = "crafters" },
        { text = "Crafters ought to make their own supplies.", next = "own" },
        { text = "I'm new to my craft. What do I need?", next = "new", when = { maxLevel = 15 } },
        { text = "Why does the dye cost so much?", next = "dye", when = { profession = "Tailoring" } },
        { text = "How do you know what every craft is short of?", next = "e3_ledger" },
        { text = "Good day, Edna.", next = "END" },
      },
    },
    brains = {
      lines = {
        { id = "brains_1", text = "He said that, did he? In front of a customer? Well, it's true. Thurman would sell a candle at cost because the buyer had a sad face. I keep the ledger, and so the shop is still here." },
      },
      choices = {
        { text = "He seems a kind man.", next = "kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kind = {
      lines = {
        { id = "kind_1", text = "He is, and it's why people come in. They come in for Thurman and they pay me, and between us that's a business. I'd not change him, but I'd not let him near the prices either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "Flux, since every smith in the Dwarven District is hammering for the army, and salt, since the tanners in Old Town can't get enough hides cured. When those two run short together, somebody is outfitting soldiers." },
      },
      choices = {
        { text = "Where does your stock come from?", next = "stock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = {
        { id = "stock_1", text = "Salt from the coast, flux up from Ironforge on the tram, and thread from the mills in Elwynn that are still turning. I used to buy Westfall flax, and there hasn't been a cart of that in a year." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters = {
      lines = {
        { id = "crafters_1", text = "I know what they buy, and that tells you more than knowing them would. Georgio Bolero buys only the finest thread and complains of the price, Therum Deepforge buys flux by the keg and never complains at all, and Simon Tanner sends his wife so that he needn't haggle with me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    own = {
      big = true,
      lines = {
        { id = "own_1", text = "Spin their own thread and boil their own flux? Then nothing would ever get made, dear. A smith's hour is worth more at the anvil than at the kettle, and that's why there are shops." },
      },
      choices = {
        { text = "Each to their trade. That's how a city works.", next = "BACK", reply = "Just so. I sell the hour back to them, and they've the sense to buy it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A crafter who depends on shops is half a crafter.", next = "BACK", reply = "Then the city is full of half crafters with whole purses. I'll keep serving them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    new = {
      lines = {
        { id = "new_1", text = "Twice as much of everything as the trainer told you, because you'll ruin the first half learning. Buy the cheap grade until your hands know the work, and then come back and we'll talk about the good drawers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = {
        { id = "dye_1", text = "Because the red comes by ship and the ships come when they please. I'll not sell you a poor dye at a good price, either. A cloak that runs in the rain has my shop's name on it as well as yours." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_ledger = {
      lines = {
        { id = "e3_ledger_l0", text = "By what's gone from the drawers by closing, and by who comes in twice in one day looking pale. When every smith in the district wants flux on the same morning, I know the army's sent an order, and I put the price up a copper before the second one arrives." },
      },
      choices = {
        { text = "Isn't that taking advantage?", next = "e3_ledger2" },
        { text = "That's sharp business, Edna.", next = "BACK" },
      },
    },
    e3_ledger2 = {
      lines = {
        { id = "e3_ledger2_l0", text = "It's stopping the first smith from buying the whole drawer and selling it to the second, dear, which is what happened before I learned. Thurman calls it greed, and then he eats the supper it pays for." },
      },
      choices = {
        { text = "A fair answer. Something else.", next = "BACK" },
        { text = "It still sounds like greed to me.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A man came in and bought every spool of red thread I had, and paid without counting. Somebody is making a great many of something red, and I'd like to know what." } },
    background = { { id = "tp_background", text = "Thurman had the shop from his father, and I married into it and found the books in a dreadful state. That was a long time ago, and the books are lovely now." } },
    advice = { { id = "tp_advice", text = "Count your change in the shop and not in the street. That's good manners to the merchant and good sense for you." } },
    _none = { { id = "tp_none", text = "I couldn't say, dear. If it doesn't come by the spool or the vial, I haven't priced it." } },
  },
}

-- Justine Demalier: recruits for the crown in the Trade District square, alongside Melris Malagan.
P:NPC {
  key = "justine_demalier", id = TODO_NPC("Justine Demalier"), name = "Justine Demalier", title = "Stormwind Recruiter", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "brash", "loyal" }, values = { "duty", "courage" },
  notices = { "soldier", "kit", "race" },
  impression = {
    first = "Justine Demalier recruits for Stormwind in the Trade District square and sizes up everyone who crosses it as though they were already in uniform. She is loud and cheerful about it, and she rarely forgets a name.",
    third = "{name} met Justine Demalier, the recruiter who works the Trade District square in Stormwind.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's {name}! You're the sort I'd put at the front of a column, and I'll tell Malagan so to his face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'll still sign you up if you like, but I'll put you on night watch at the Stockade." },
    { id = "g_default", text = "Oy, you there! You've two arms and two legs, and that's more than half my list can say. Come 'ere a moment." },
    { id = "g_2", when = { metBefore = true }, text = "There's {name}! I told Malagan you'd be back, and he owes me a copper." },
    { id = "g_3", when = { class = { "WARRIOR", "PALADIN" } }, text = "Now that's what I like to see walk across my square. Tell me you're not already spoken for, {class}." },
    { id = "g_4", when = { maxLevel = 10 }, text = "You're green yet, mate, but green grows. Come and have a word." },
  },
  notice = {
    { id = "n_1", cat = "soldier", when = { pvpRank = { min = 1 } },
      text = "You've already taken the Alliance's colours on the field, I see. Then I'll not waste my speech on you, and I'll shake your hand in its place." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Somebody's been in a scrap. That's the kind of dented I can use, mate, though I'd see a smith before the Highlord sees you." },
    { id = "n_3", cat = "race", when = { race = { "Dwarf", "Gnome", "NightElf" } },
      text = "You're a long way from home, and still you've come to stand in our square. Stormwind remembers who turned up, friend." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Justine Demalier, recruiter for the crown. Captain Malagan commands the city watch from this square and I find him the bodies, and when Highlord Fordragon wants able hands at the Keep, it's me who goes looking for them." },
        { id = "hello_2", when = { origin = "human_city_guard" }, text = "Justine Demalier, and you've worn the watch's tabard, haven't you? You've the stance. Malagan will be glad of another who knows which end of a halberd is which." },
      },
      again = {
        { id = "hello_again1", text = "What else, mate?" },
        { id = "hello_again2", text = "Go on, I can talk and watch the square." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "A recruiter should tell the lads the truth about the front.", next = "BACK", reply = "I do, friend, and the ones who sign anyway are the ones worth having.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Promise them glory and good pay; the truth can wait.", next = "BACK", reply = "The truth catches up in Redridge, and then they desert, and I've wasted a whole spring.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who are you recruiting for?", next = "who" },
        { text = "How do you pick someone out of a crowd?", next = "pick" },
        { text = "You're short of soldiers, then.", next = "short" },
        { text = "Nobody should be talked into a war.", next = "talked" },
        { text = "What does the Highlord want with adventurers?", next = "bolvar" },
        { text = "I served. Where's the army now?", next = "where", when = { origin = "human_city_guard" } },
        { text = "Would you take someone from Lordaeron?", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "You say you never forget a name.", next = "e3_names" },
        { text = "I'll be on my way, Justine.", next = "END" },
      },
    },
    who = {
      lines = {
        { id = "who_1", text = "The watch, the regiments, and anyone at the Keep who sends down a note saying they need a strong back. I'm not choosy about the uniform. I get a body to a sergeant, and the sergeant does the rest." },
      },
      choices = {
        { text = "And the ones who say no?", next = "no" },
        { text = "Something else.", next = "BACK" },
      },
    },
    no = {
      lines = {
        { id = "no_1", text = "I wish them good day, and I remember their faces. Half of them come back within the year, after the road's shown them what it showed me. I don't gloat, mate. I just hand them the paper." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pick = {
      lines = {
        { id = "pick_1", text = "I watch how they cross the square. Them that look at the rooftops and the alleys are worth ten that look at the shop windows. Then I watch what they do when a cart loses a wheel, and that settles it." },
      },
      choices = {
        { text = "What did I do?", next = "me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    me = {
      lines = {
        { id = "me_1", text = "You looked at Malagan's guards before you looked at me, and you knew where the gate was without turning your head. Dependable, I'd say, and I'm not often wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "I'll not say that in the square, with folk listening. I'll say the regiments are in Redridge and the Burning Steppes passes, and Westfall's holding itself together with farmers. You can do the sum yourself." },
      },
      choices = {
        { text = "Why not send the army to Westfall?", next = "westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    westfall = {
      lines = {
        { id = "westfall_1", text = "Ask the House of Nobles, because I'm only a recruiter. I can tell you I've sent a dozen good lads west to Gryan Stoutmantle on my own say-so, and nobody's thanked me or stopped me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    talked = {
      big = true,
      lines = {
        { id = "talked_1", text = "Talked into it? Mate, I tell them what it pays, what it costs, and where they'll sleep, and I've never lied about any of the three. The ones I sign up know what they're signing." },
      },
      choices = {
        { text = "An honest call to arms is a service to the realm.", next = "BACK", reply = "That's how I see it. Somebody has to stand on the wall, and it's better they chose it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A recruiter's honesty is still a sales pitch.", next = "BACK", reply = "Maybe so. But I marched before I recruited, and I'd not sell anyone a road I haven't walked.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bolvar = {
      lines = {
        { id = "bolvar_1", text = "Whatever the regiments can't spare a company for, and that's a long list. He's a soldier's lord, the Highlord, and he doesn't care whose colours you wear so long as the work gets done." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "where_1", text = "Spread like butter on too much bread, as you'd guess. The Redridge companies haven't been relieved since spring. If you've still got your old kit, there's a captain at the Keep who'd kiss you for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = {
        { id = "lordaeron_1", text = "Take you? Some of the hardest soldiers on my list walked down from the north with nothing. You've seen what's coming and you didn't lie down, and I can't teach that to anyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_names = {
      lines = {
        { id = "e3_names_l0", text = "Never, mate, and that's because I write them in a book every night after the square empties, with a note of what they said. Half the lads who come back to sign a year later are amazed I remember them, and the other half are a bit frightened." },
      },
      choices = {
        { text = "What did you write about me?", next = "e3_names2" },
        { text = "That's a clever trick for a recruiter.", next = "BACK" },
      },
    },
    e3_names2 = {
      lines = {
        { id = "e3_names2_l0", text = "\"Looks at the guards first, talks plain, might be worth the trouble.\" It's a better entry than most get, so don't look at me like that." },
      },
      choices = {
        { text = "I'll take that. Something else.", next = "BACK" },
        { text = "Might be worth the trouble? Charming.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Three recruits I sent to Lakeshire haven't written, and they were the writing kind. I've asked at the Keep, and the Keep says the roads are slow." } },
    background = { { id = "tp_background", text = "I marched with the Seventh's baggage train as a girl and carried a pike after. A recruiter who never served is only a crier with a list." } },
    advice = { { id = "tp_advice", text = "Never volunteer for the thing a sergeant asks for cheerfully. Volunteer for the thing he asks for quietly." } },
    stormwind = { { id = "tp_stormwind", text = "Finest city there is, and the easiest to forget you have to defend. It's my job to remind folk." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, mate. I know soldiers and the lack of them." } },
  },
}

-- Ben Trias: sells the cheese at Trias' Cheese in the Trade District; Elling and Elaine's son.
P:NPC {
  key = "ben_trias", id = TODO_NPC("Ben Trias"), name = "Ben Trias", title = "Apprentice of Cheese", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "eager", "earnest" }, values = { "family", "craft" },
  notices = { "travel", "drink", "stealth" },
  impression = {
    first = "Ben Trias sells the cheese his mother makes at Trias' Cheese and praises every wheel as though it were his own child. He is proud of the shop and puzzled by how many of his father's old friends buy nothing.",
    third = "{name} met Ben Trias, apprentice cheesemonger at Trias' Cheese in Stormwind's Trade District.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend! I've cut a wedge of the Alterac Swiss and set it by, because I remembered you liked it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The cheese is on the board, and the prices are on the cheese, so have a look." },
    { id = "g_default", text = "Best cheese in all of Stormwind, friend, and you won't find better! Now, what can I help you with?" },
    { id = "g_2", when = { metBefore = true }, text = "Welcome back! I've a wheel of the Alterac Swiss cut fresh this morning, and I thought of you." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "We're closing soon, but there's always time to cut a wedge for the road." },
  },
  notice = {
    { id = "n_1", cat = "travel", when = { minLevel = 20 },
      text = "You look like you've been a long way. Take a hard cheese, then, something that will ride in a pack for a month and be better for it." },
    { id = "n_2", cat = "drink", when = { drunk = true },
      text = "You'll want something in your belly with all that ale. The Dalaran sharp will sober a dwarf, my mother says." },
    { id = "n_3", cat = "stealth", when = { class = "ROGUE" },
      text = "You're one of my father's friends, aren't you? You've the look. He's by the door, and he'll pretend not to know you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Ben Trias, apprentice of cheese! My mother Elaine makes it, I sell it, and my father Elling stands by the door and watches the street. It's a family business, and one day it'll be mine." },
      },
      again = {
        { id = "hello_again1", text = "What else? Ask about the cheese, friend; I could talk about the cheese all day." },
        { id = "hello_again2", text = "Go on, friend, I like the company." },
        { id = "hello_again3", text = "Yes? I've a knife ready if it's a taste you want." },
      },
      choices = {
        { text = "A cheesemonger should sell a wheel only when it's properly aged.", next = "BACK", reply = "That's what my father says, and he'd box my ears if I sold a young one.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Call any cheese aged; nobody can tell a month from a year.", next = "BACK", reply = "My mother could tell from across the shop, friend, and so could half our customers.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'll take some cheese.", next = "BUSINESS" },
        { text = "Which cheese is your best?", next = "best" },
        { text = "What's it like, apprenticed to your own mother?", next = "mother" },
        { text = "Your father doesn't seem to do much.", next = "father" },
        { text = "A cheese shop is a small ambition.", next = "small" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Some of your customers never buy anything.", next = "friends", when = { class = "ROGUE" } },
        { text = "I cook a little. What melts well?", next = "cook", when = { profession = "Cooking" } },
        { text = "What's the hardest part of making cheese?", next = "e3_curd" },
        { text = "Good day, Ben.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "best_1", text = "The Alterac Swiss, if you want my heart's answer, though it's dearer since the valley turned dangerous. For the road I'd say the Darnassian bleu, which keeps for weeks and frightens off anyone who'd share it." },
      },
      choices = {
        { text = "Why is the Alterac so dear?", next = "alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alterac = {
      lines = {
        { id = "alterac_1", text = "It comes down through the mountains, and there are ogres and brigands on every pass now, and worse in the valley itself. The carter who brings it wants paying as though he were a soldier, and I can't say he's wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mother = {
      lines = {
        { id = "mother_1", text = "She's exact, and she's always right, and I've had to learn to live with both. A curd turned a minute late goes to the pigs, and she can tell by the smell from the top of the stairs." },
      },
      choices = {
        { text = "You'll be good at it one day.", next = "oneday" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oneday = {
      lines = {
        { id = "oneday_1", text = "I hope so. She let me age a wheel of cheddar by myself this spring, and when she tasted it she didn't say anything at all, which my father tells me is the highest praise she gives." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = {
        { id = "father_1", text = "He minds the door, and he says that's work too. He knows every face in the district, and he has more old friends than any cheesemonger I ever heard of. They drop in, they whisper, and they leave without so much as a wedge." },
      },
      choices = {
        { text = "What did he do before cheese?", next = "before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "before_1", text = "He says he was a clerk, and my mother says to stop asking. I asked Master Shaw once, when he came in for the cheddar, and he bought two wheels and told me I had an honest face. I still don't know what he meant." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    small = {
      big = true,
      lines = {
        { id = "small_1", text = "Maybe it is. But people come in here worried about the war and the taxes, and they go out with something good wrapped in paper, and for a moment they aren't worried. I think that's worth a life's work." },
      },
      choices = {
        { text = "Small comforts hold a city together.", next = "BACK", reply = "That's what I think too, and I'll tell my mother someone agreed with me.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "There's a war on, and you're selling cheese.", next = "BACK", reply = "I know there is. Soldiers eat cheese too, friend, and I'd sooner feed them than be no use at all.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_1", text = "Everybody, and that's the best of it. The Gallinas send for a wheel whenever they've a tasting, Innkeeper Allison buys for the Gilded Rose, and Lord Wishock's cook takes the costliest thing I have without asking the price." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    friends = {
      lines = {
        { id = "friends_1", text = "You've noticed it too! They come in, they nod to my father, and they look at the cheese as if it were a wall. I've started offering them samples, and not one of them has ever refused, so that's something." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_1", text = "The mild Stormwind brie for a sauce, and the Dalaran sharp if you want it to stand up to pepper. Stephen Ryback at the Pig and Whistle buys both, and he won't tell me what he does with them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_curd = {
      lines = {
        { id = "e3_curd_l0", text = "Waiting, which I'm terrible at, because a good cheddar wants a year in the cellar and I want to know how it turned out by Tuesday. Mother says patience is the only ingredient she can't buy, and she looks at me when she says it." },
      },
      choices = {
        { text = "Your father seems patient enough.", next = "e3_curd2" },
        { text = "A year's a long time for a wheel.", next = "BACK" },
      },
    },
    e3_curd2 = {
      lines = {
        { id = "e3_curd2_l0", text = "He's the most patient man I know, which is strange for a clerk. He'll stand by that door for a whole afternoon watching people walk past, and he never once looks bored, only very interested in nothing at all." },
      },
      choices = {
        { text = "Perhaps he's not watching nothing. Something else.", next = "BACK" },
        { text = "You might learn from him, Ben.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A man asked my father yesterday if the cheddar was \"ready to travel\", and my father said \"not before Tuesday\". We haven't any cheddar that needs to wait for Tuesday." } },
    background = { { id = "tp_background", text = "Born above the shop, and I could tell a brie from a bleu before I could read. I've never wanted to do anything else, though I did want a pony." } },
    advice = { { id = "tp_advice", text = "Never store a strong cheese beside a mild one. The mild one learns bad habits." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm sorry. I know rather a lot about cheese." } },
  },
}

-- Gregory Ardus: sells staves and maces at Just Maces in Cathedral Square.
P:NPC {
  key = "gregory_ardus", id = TODO_NPC("Gregory Ardus"), name = "Gregory Ardus", title = "Staff & Mace Merchant", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "pious", "mild" }, values = { "faith", "peace" },
  notices = { "priest", "paladin", "kit" },
  impression = {
    first = "Gregory Ardus sells maces and staves at Just Maces in the shadow of the Cathedral, and half his customers wear vestments. He speaks of a mace as a tool of the Light and seems a little sad every time he sells one.",
    third = "{name} met Gregory Ardus, who sells staves and maces at Just Maces in Stormwind's Cathedral Square.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Light be with you, friend. I'm glad to see you whole, and gladder still if my mace has had little work." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Light be with you, though I'll not pretend I'm glad to see you. Choose your mace and go in peace." },
    { id = "g_default", text = "Light be with you. If you need a mace or a staff, you'll find them here, and nothing with an edge." },
    { id = "g_2", when = { metBefore = true }, text = "Light be with you again, friend. I hope the last one served you, and that you seldom needed it." },
    { id = "g_3", when = { class = { "PRIEST", "PALADIN" } }, text = "Welcome, {class}. The Cathedral sends its own to me, and I try to deserve it." },
  },
  notice = {
    { id = "n_1", cat = "priest", when = { class = "PRIEST" },
      text = "You'll carry a mace as the Church's clergy always have, without an edge on it. There's an old teaching behind that, and I'm glad to see it kept." },
    { id = "n_2", cat = "paladin", when = { class = "PALADIN" },
      text = "A knight of the Silver Hand in my little shop! Lord Shadowbreaker's squires buy their first hammers here, and I pray over every one." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "The haft of that is split along the grain, friend. It will fail you on the next hard blow, and I'd not have that on my conscience." },
  },
  start = "hello",
  nodes = {
    d6_forge = {
      lines = { { id = "d6_forge_a", text = "Smiths in the Dwarven District, for the heads, and a woodworker by the canals for the hafts, who chooses ash for the young and oak for the old. I fit them together myself in the back room, and I say a short prayer over each one, which the smiths think is a waste of daylight." } },
      choices = {
        { text = "Do you think the prayer matters?", next = "d6_forge2" },
        { text = "Ash for the young and oak for the old?", next = "d6_forge2" },
        { text = "On to other matters.", next = "BACK" },
      },
    },
    d6_forge2 = {
      lines = { { id = "d6_forge2_a", text = "Ash is lighter and forgives a tired arm, and oak is heavier and wants a strong one, though the old priests insist on it anyway. As for the prayer, I don't know that the Light hears it, but I know I sell a mace more carefully for having said it." } },
      choices = {
        { text = "That's honest of you, Gregory.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    d6_orphans = {
      lines = { { id = "d6_orphans_a", text = "Matron Nightingale keeps it, and she keeps more children every year than the year before. The wars took the parents and the Plague took the cousins, and the little ones come in from Westfall and Lordaeron both with nothing but a name." } },
      choices = {
        { text = "Do the priests help her?", next = "d6_orphans2", when = { class = "PRIEST" } },
        { text = "What becomes of them when they're grown?", next = "d6_orphans2" },
        { text = "Hard to hear. Let's move on.", next = "BACK" },
      },
    },
    d6_orphans2 = {
      lines = {
        { id = "d6_orphans2_a", text = "Apprenticeships, when the matron can find them, and the barracks, when she can't. I've taken two boys into the back room to learn the hafting trade, and one of them is better at it than I am, which I'm told is how it should be." },
        { id = "d6_orphans2_priest", when = { class = "PRIEST" }, text = "The novices carry meals over twice a day, and Brother Cassius sits with the sick ones, but there are never enough hands. If you've an hour after your prayers, friend, the matron would rather have you than a sermon." },
      },
      choices = {
        { text = "That's the Light's work, plainly done.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Gregory Ardus, and the shop is called Just Maces, though I've sold staves for years and never changed the sign. The Cathedral is across the square, and most of what I sell goes through its doors." },
      },
      again = {
        { id = "hello_again1", text = "Is there something else, friend? Speak; the Light keeps no hours and neither do I." },
        { id = "hello_again2", text = "Go on, friend, I'm in no hurry." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A merchant to the Cathedral should sell honestly, as the Light asks.", next = "BACK", reply = "So I try to, friend, every day, because the brothers trust me with their lives.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The Cathedral's coin spends like any other; charge them double.", next = "BACK", reply = "Then I'd deserve the Light's judgment, and I've no wish to meet it early.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Why maces, and no blades?", next = "why" },
        { text = "You sell to the Cathedral?", next = "cathedral" },
        { text = "The sign says maces. Why the staves?", next = "staves" },
        { text = "A weapon is a weapon, whatever the Church says.", next = "weapon" },
        { text = "What do you hear in the square?", next = "square" },
        { text = "Which hammer would you give a young paladin?", next = "hammer", when = { class = "PALADIN" } },
        { text = "Who forges your maces?", next = "d6_forge" },
        { text = "Tell me about the orphanage across the way.", next = "d6_orphans" },
        { text = "You seem sad when you sell a mace.", next = "e3_sad" },
        { text = "Light be with you, Gregory.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "The old clergy would not shed blood with an edge, and so they carried the mace. I'm told the reasoning doesn't comfort the man who is struck. Still, I've kept to it, and there's the Honest Blade in Old Town for those who want steel." },
      },
      choices = {
        { text = "Do the priests still hold to that?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = {
        { id = "hold_1", text = "The old ones do, like Brother Benjamin, who'll explain it for an hour if you let him. The young ones carry what will keep them alive in Duskwood, and I can't find it in me to scold them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral = {
      lines = {
        { id = "cathedral_1", text = "To the novices, when they're sent out, and to the paladins' squires. Brother Cassius sends them over from his reagent counter with a note, and Duthorian Rall has been known to come and heft every hammer on the wall before he lets a squire choose." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    staves = {
      lines = {
        { id = "staves_1", text = "A mage came in from the Quarter and asked if I had a walking staff, and I sold him the one I'd cut for myself. Then his friends came. Allan Hafgan at Stormwind Staves has the enchanted sort, and mine are plain oak and ash, for leaning on and for hitting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    weapon = {
      big = true,
      lines = {
        { id = "weapon_1", text = "I've thought so myself, on the nights after I've sold a hammer to a boy of sixteen. But a mace in a healer's hand is there to bring the healer home. I have to believe the hand matters more than the iron." },
      },
      choices = {
        { text = "The Light judges the hand, not the weapon.", next = "BACK", reply = "Thank you, friend. I shall hold onto that the next time a novice comes in.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You arm children and call it piety.", next = "BACK", reply = "That is a hard thing to hear, and I'll not pretend I've never said it to myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    square = {
      lines = {
        { id = "square_1", text = "More than a shopkeeper should. The orphanage is across the way, and Matron Nightingale has more children each month. I hear the bishops are divided over the north, and I hear it from novices who ought not to be repeating it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer = {
      lines = {
        { id = "hammer_1", text = "A plain one, with a short haft, that he can swing all day without his shoulder failing. The handsome ones on the top row are for knights who've already learned what tired feels like." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_sad = {
      lines = {
        { id = "e3_sad_l0", text = "Because a mace sold is a mace that will be used, friend, and I know where. The novices take them to Westfall and Redridge, and some of the ones I've sold come back to me with a family that wants to sell it again, and that is the worst of my trade." },
      },
      choices = {
        { text = "What do you do with the ones that come back?", next = "e3_sad2" },
        { text = "It's an honest trade, all the same.", next = "BACK" },
      },
    },
    e3_sad2 = {
      lines = {
        { id = "e3_sad2_l0", text = "I buy them, always, for more than they're worth, and I hang them on the wall behind the counter rather than sell them twice. Brother Benjamin blesses them on the first day of every month, and he walks up and down past them while he does." },
      },
      choices = {
        { text = "That's a kind custom. Something else.", next = "BACK" },
        { text = "Sell them on. The living need them.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A novice told me the Archbishop keeps to his chambers more than he used to. I told her that old men tire, and I hope it's only that." } },
    background = { { id = "tp_background", text = "My father turned staves for the old abbey's brothers. I can't turn wood as he did, but I learned what an honest haft feels like." } },
    advice = { { id = "tp_advice", text = "Check the haft before the head. I've never seen a mace-head break, and I've seen a hundred handles go." } },
    light = { { id = "tp_light", text = "I'm no priest, but I open the shop with a prayer and close it with one. It seems the least a man can do who sells what I sell." } },
    _none = { { id = "tp_none", text = "That is beyond me, friend. Ask one of the brothers across the square." } },
  },
}

-- Erika Tate: sells spices and cooking supplies by the hearth of the Pig and Whistle, at fixed prices.
P:NPC {
  key = "erika_tate", id = TODO_NPC("Erika Tate"), name = "Erika Tate", title = "Cooking Supplies", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "firm", "plain" }, values = { "fairness", "craft" },
  notices = { "craft", "drink", "purse" },
  impression = {
    first = "Erika Tate sells spices and cooking supplies from a table by the hearth of the Pig and Whistle, and her prices have not moved in years. She does not haggle, and she tells anyone who tries to go and find a goblin.",
    third = "{name} met Erika Tate, who sells cooking supplies at the Pig and Whistle Tavern in Stormwind's Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and nobody's been poisoned, so you must be cooking it right. Take what you need from the slate." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The price is on the slate, and the slate doesn't haggle, so pay and be off." },
    { id = "g_default", text = "Afternoon. Spices, flour, salt and oil, all at the price on the slate. The slate doesn't argue, and neither do I." },
    { id = "g_2", when = { metBefore = true }, text = "You're back, so the last lot can't have poisoned anyone. What do you need?" },
    { id = "g_3", when = { timeOfDay = "night" }, text = "The kitchen's still hot and so am I, so buy quickly or sit down and eat." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, do you? I can smell woodsmoke and onion on you, and that's a cook's scent. You'll know what you want, then." },
    { id = "n_2", cat = "drink", when = { drunk = true },
      text = "You've had a few of Reese's. Don't try to buy saffron in that state, because you'll take the whole jar and curse me in the morning." },
    { id = "n_3", cat = "purse", when = { money = { max = 500 } },
      text = "If you're short, buy salt and mild spice. A poor cook with salt eats better than a rich one without." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Erika Tate. Stephen Ryback does the cooking here and teaches it, Reese pours, and I sell what goes in the pot. The price is the price, friend, and I've never changed it for a king or a beggar." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? The slate's got all day, and so have I, while the stew's on." },
        { id = "hello_again2", text = "Go on, I'm only weighing pepper." },
        { id = "hello_again3", text = "Well?" },
      },
      choices = {
        { text = "A fixed price on the slate is fair to everyone who buys.", next = "BACK", reply = "That's why I keep it, friend, and nobody in the tavern can say I've cheated them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Change the slate when a rich customer walks in.", next = "BACK", reply = "Then the slate's a liar, and so am I, and the Langstons would throw me out on my ear.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the cooking supplies.", next = "BUSINESS" },
        { text = "They say you never haggle.", next = "haggle" },
        { text = "Stephen says his ribs need your spices.", next = "ribs" },
        { text = "Where do the spices come from?", next = "spices" },
        { text = "A fixed price is hard on the poor.", next = "fixed" },
        { text = "What's cooking in the city these days?", next = "city" },
        { text = "What would you put in a soldier's stew?", next = "stew", when = { profession = "Cooking" } },
        { text = "Who chalked up the prices on your slate?", next = "e3_slate" },
        { text = "Good day, Erika.", next = "END" },
      },
    },
    haggle = {
      lines = {
        { id = "haggle_1", text = "Never once. If I take a copper off for you, I've robbed the one who paid full yesterday. I've told dwarves, nobles and a goblin from Booty Bay the same thing, and the goblin was the only one who respected it." },
      },
      choices = {
        { text = "The goblin respected it?", next = "goblin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin = {
      lines = {
        { id = "goblin_1", text = "He said a price that never moves is the rarest thing he'd seen on two continents, and he bought the lot to see if I'd flinch at the size of the order. I didn't, and he tipped his hat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ribs = {
      lines = {
        { id = "ribs_1", text = "They do, and he'll tell you it's all his own recipe, which it is, apart from the part that's mine. I grind the pepper blend myself each morning. He knows what's in it and he's not allowed to say." },
      },
      choices = {
        { text = "What's in it?", next = "blend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blend = {
      lines = {
        { id = "blend_1", text = "Pepper, and a few other things that grow, and that's all you'll get. Kendor Kabonka has been trying to buy the recipe off me for three years, and he sells recipes for a living, so you can guess how badly he wants it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spices = {
      lines = {
        { id = "spices_1", text = "The hot ones come up from Stranglethorn through Booty Bay, and the mild ones grow in Elwynn. Salt comes off the coast. When a ship is late the tavern goes without before my slate goes up, and Reese has learned to live with that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fixed = {
      big = true,
      lines = {
        { id = "fixed_1", text = "It's the only thing that isn't hard on them. A poor woman can't out-talk a merchant, so wherever folk haggle she pays the most. At my table she pays what the lord's cook pays, and she knows it before she walks in." },
      },
      choices = {
        { text = "One price for everyone is the fairest law there is.", next = "BACK", reply = "So I've always held. It's a small law, but it's kept at this table.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Fairness would be charging the lord's cook double.", next = "BACK", reply = "That's tempting, I'll grant you. But the day I start judging purses, I'm only a haggler with opinions.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_1", text = "Plainer food than a year ago, and more of it bought by the sack. The barracks cooks come to me now, since their own stores run thin, and I sell to them at the slate like anyone else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stew = {
      lines = {
        { id = "stew_1", text = "Whatever meat there is, cut small so nobody counts it, with twice the onion you think and a fist of barley. Salt it at the end, and put the pepper in the bowl and not the pot, so every man thinks he was favoured." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_slate = {
      lines = {
        { id = "e3_slate_l0", text = "I did, the day the Pig and Whistle reopened, and I've only rubbed out one number since, when the salt boats stopped for a season and I'd have been selling at a loss. I put it back the day the boats returned, and a regular cheered." },
      },
      choices = {
        { text = "You didn't raise your prices in the war years?", next = "e3_slate2" },
        { text = "That's steadier than the crown's coin.", next = "BACK" },
      },
    },
    e3_slate2 = {
      lines = {
        { id = "e3_slate2_l0", text = "Not once, because folk who'd lost everything else could count on the slate. I made less, and I ate plainer, and I'd do it again, though Stephen says I'm a fool and keeps a pinch of my pepper in his pocket for luck." },
      },
      choices = {
        { text = "A fool with principles. Something else.", next = "BACK" },
        { text = "That's bad business, Erika.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The barracks quartermaster bought salt enough to cure a herd. You don't cure that much meat for men who are staying home." } },
    background = { { id = "tp_background", text = "My mother sold spices from a barrow by the old gate, and she haggled, and it wore her out. I swore I'd never spend a breath on it." } },
    advice = { { id = "tp_advice", text = "Taste before you salt, and salt before you serve. Half the bad cooking in this city is only impatience." } },
    _none = { { id = "tp_none", text = "Don't know, and I won't guess. Guessing's a kind of haggling." } },
  },
}

-- Seoman Griffith: makes and sells leather armour at the Protective Hide in Old Town.
P:NPC {
  key = "seoman_griffith", id = TODO_NPC("Seoman Griffith"), name = "Seoman Griffith", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "quiet", "careful" }, values = { "craft", "patience" },
  notices = { "craft", "kit", "stealth" },
  impression = {
    first = "Seoman Griffith sells the leather armour at the Protective Hide in Old Town and sews much of it himself, slowly and with doubled thread. He lets Alyssa do the talking and lets his seams speak for him.",
    third = "{name} met Seoman Griffith, who makes and sells leather armour at the Protective Hide in Stormwind's Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, and still wearing my stitching, I see. Come in; I've a jerkin I'd like your opinion on." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Pull on any seam you like, but don't expect me to make conversation while you do." },
    { id = "g_default", text = "Good day. Have a look, and pull on any seam you like." },
    { id = "g_2", when = { metBefore = true }, text = "You've come back, so tell me, did the stitching hold?" },
    { id = "g_3", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "You'll know good leather when you handle it, I think. Go ahead." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather too. I'd be glad of your opinion on that shoulder seam, since I've sewn it three ways and I'm not sure of any." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your jerkin's gone at the stitching, and the hide's still good. That's a shame, because the hide is the dear part." },
    { id = "n_3", cat = "stealth", when = { class = "ROGUE" },
      text = "You walked in without the floorboard by the door making a sound. Everyone else finds that board." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Seoman Griffith. I make the armour here and sell it, Simon Tanner teaches the craft, Jillian has the thread and dye, and Alyssa sells the bags and does the talking for both of us." },
      },
      again = {
        { id = "hello_again1", text = "Was there more? I'll keep stitching while you ask, if you don't mind the needle." },
        { id = "hello_again2", text = "Go on. I can sew and listen." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A leatherworker should sell only hide he's tanned properly himself.", next = "BACK", reply = "Every hide in this shop I've scraped and tanned with my own hands, friend.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Rub boot polish on rotten hide and nobody knows.", next = "BACK", reply = "They know when it cracks in the cold, friend, and then they come back for my head.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the leather armour.", next = "BUSINESS" },
        { text = "You sew these yourself?", next = "sew" },
        { text = "Who else works at the Protective Hide?", next = "shop" },
        { text = "Lara Moore says you sew the best seam in the city.", next = "lara" },
        { text = "Slow work loses customers.", next = "slow" },
        { text = "Who buys leather in Old Town?", next = "oldtown" },
        { text = "What would you teach an apprentice first?", next = "first", when = { profession = "Leatherworking" } },
        { text = "What happened to the scout whose seam opened?", next = "e3_scout" },
        { text = "Good day, Seoman.", next = "END" },
      },
    },
    sew = {
      lines = {
        { id = "sew_1", text = "Most of them. A doubled, waxed thread and a seam turned to the inside, and I go over each one twice. It takes a day longer than it should, and I've stopped apologising for it." },
      },
      choices = {
        { text = "Why twice?", next = "twice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twice = {
      lines = {
        { id = "twice_1", text = "A scout came back once with one of my bracers in his hand and the arm it belonged on in a sling. The seam had opened when something bit him. Since then I go over them twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = {
        { id = "shop_1", text = "Simon knows more than any of us and says so. Randal Worth, his apprentice, has a fine hand and looks in every buckle to see himself. Maris Granger teaches skinning, and she's sharp with people, but nobody takes a hide off cleaner." },
      },
      choices = {
        { text = "And Alyssa?", next = "alyssa" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alyssa = {
      lines = {
        { id = "alyssa_1", text = "Alyssa could sell a bag to a man with no belongings. I've watched her do it. I'm grateful, because while she's talking nobody expects me to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lara = {
      lines = {
        { id = "lara_1", text = "Did she say so? She's never said it to me. She buys a piece of mine now and then and sells it on at the Lionheart for more, and I suppose that's praise of a kind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    slow = {
      big = true,
      lines = {
        { id = "slow_1", text = "It does. The Lionheart sells three jerkins while I finish one, and there are mornings I count that up. But somebody is going to trust their ribs to it, and I can't hurry past that." },
      },
      choices = {
        { text = "Good work takes the time it takes.", next = "BACK", reply = "Thank you. I'd rather be late than be the reason somebody didn't come home.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A soldier unarmoured today is worse off than one armoured cheaply.", next = "BACK", reply = "There's truth in it. I've wondered who went without while I fussed over a hem.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtown = {
      lines = {
        { id = "oldtown_1", text = "Scouts from the barracks, and hunters down from the Dwarven District. There are also quiet people who pay in exact coin and want everything in black. They work near here, and I don't ask where." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_1", text = "To cut away from the thumb, and then to throw away the first ten things they make. Simon lets his beginners keep theirs, and I think that's kind, and I think it's a mistake." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_scout = {
      lines = {
        { id = "e3_scout_l0", text = "He mended, and he came back for a new pair of bracers, and he watched me sew them from first stitch to last without saying a word. When I finished he paid twice the price and told me to keep the rest for the next scout's thread." },
      },
      choices = {
        { text = "Do you still keep that coin?", next = "e3_scout2" },
        { text = "You've never let a seam fail since?", next = "BACK" },
      },
    },
    e3_scout2 = {
      lines = {
        { id = "e3_scout2_l0", text = "In a tin on the shelf, with the thread it bought, and I use it only for scouts' work. Alyssa says it's sentimental, and I say it's accounting." },
      },
      choices = {
        { text = "It's both. Something else.", next = "BACK" },
        { text = "A good custom.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "One of the quiet customers ordered a harness with a great many small loops, for vials, I think. I made it and didn't ask what goes in them." } },
    background = { { id = "tp_background", text = "I learned from Simon, years ago, and never left the shop. I've no gift for teaching, so I make." } },
    advice = { { id = "tp_advice", text = "Wax your thread. It costs nothing, and it's the difference between a seam and a row of holes." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Alyssa might, and she'll tell you either way." } },
  },
}

-- Mayda Thane: makes and sells boots at Thane's Boots in Old Town.
P:NPC {
  key = "mayda_thane", id = TODO_NPC("Mayda Thane"), name = "Mayda Thane", title = "Cobbler", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "motherly", "blunt" }, values = { "craft", "comfort" },
  notices = { "kit", "travel", "race" },
  impression = {
    first = "Mayda Thane makes boots at her shop in Old Town and looks at a customer's feet before their face. She says she can tell where a person has walked and how far they have left in them.",
    third = "{name} met Mayda Thane, the cobbler who keeps Thane's Boots in Stormwind's Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, and I'll bet those heels are worn through already! Sit down, and let me have a look at them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The boots are on the shelf, and you can try them on yourself." },
    { id = "g_default", text = "Come in, come in, and let me see what you're walking on. Oh dear, you had better sit down." },
    { id = "g_2", when = { metBefore = true }, text = "There you are, and how are the heels? Lift one up and show me." },
    { id = "g_3", when = { class = { "WARRIOR", "PALADIN" } }, text = "A soldier's feet, flat and sore, I'll wager. Sit yourself down before you fall down, {class}." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those soles are thinner than my patience, love. You've been walking on the road itself, and you'll feel every stone to Goldshire." },
    { id = "n_2", cat = "travel", when = { minLevel = 30 },
      text = "You've walked half the world in those, haven't you? I can see three different colours of mud in the welt, and one of them isn't from this kingdom." },
    { id = "n_3", cat = "race", when = { race = "Gnome" },
      text = "I do keep gnome sizes, love, on the low shelf. I had a last made specially, and I use it more every month." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Mayda Thane, and I make boots, and nothing else. There's the barracks on one side of me and the Pig and Whistle on the other, so I see them marching out and limping back, and I've an opinion about army boots." },
      },
      again = {
        { id = "hello_again1", text = "What else, love?" },
        { id = "hello_again2", text = "Go on, I'm only waxing." },
        { id = "hello_again3", text = "Yes, dear?" },
      },
      choices = {
        { text = "A cobbler's boots should last a soldier the whole campaign.", next = "BACK", reply = "That's my promise in leather, and a good many soldiers have come home in my boots.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Glue the soles instead of stitching them; it's quicker.", next = "BACK", reply = "Quicker, and they fall off in the first bog in Duskwood, and then there's a lad walking barefoot.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the boots.", next = "BUSINESS" },
        { text = "What's wrong with army boots?", next = "army" },
        { text = "You can read a person by their feet?", next = "read" },
        { text = "Who are your neighbours here?", next = "neighbours" },
        { text = "Soldiers should make do with what they're issued.", next = "issued" },
        { text = "What should I wear for a long march?", next = "march" },
        { text = "My feet aren't shaped like yours.", next = "hooves", when = { race = { "NightElf", "Dwarf" } } },
        { text = "Have you ever fitted a soldier who'd marched barefoot?", next = "e3_barefoot" },
        { text = "Good day, Mayda.", next = "END" },
      },
    },
    army = {
      lines = {
        { id = "army_1", text = "One last for every foot in the kingdom, that's what's wrong. They're cut to a pattern made for some sergeant thirty years ago, and every recruit since has had to grow his feet to fit. I've mended the blisters that come of it." },
      },
      choices = {
        { text = "Do the soldiers come to you?", next = "soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers = {
      lines = {
        { id = "soldiers_1", text = "The ones with sense, and a spare silver. Master Wu Shen sends his recruits across from the barracks once they've done their first week's drill, when they finally believe him about their feet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    read = {
      lines = {
        { id = "read_1", text = "Easier than a face, because nobody thinks to lie with their boots. A worn outer heel is a rider, a worn toe is somebody who climbs, and a boot worn evenly all round belongs to a guard who's stood in one spot for ten years." },
      },
      choices = {
        { text = "And mine?", next = "mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mine_1", text = "You walk fast and you stop sudden, and you've run from something lately, or after it. I'd put a stiffer heel on you and a softer collar, and you'd thank me by the Redridge road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_1", text = "Heinrich Stone and his knives at the Honest Blade, the Protective Hide for leather, which I buy from Jillian, and Reese Langston's tavern, where my customers go to celebrate their new boots and scuff them. It's a soldier's street, and I like it for that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    issued = {
      big = true,
      lines = {
        { id = "issued_1", text = "Make do! On a march, love, a blister is a wound. I've seen strong lads carried home from Redridge who never met an orc. It was their own boots that did for them." },
      },
      choices = {
        { text = "An army that won't shoe its soldiers properly fails them.", next = "BACK", reply = "That's what I tell every officer who comes in for his own fine pair. One or two have even listened.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Hardship makes soldiers. Soft boots make soft men.", next = "BACK", reply = "Spoken like someone who's never drained a heel. Hard marching makes soldiers, dear, and bad boots only make cripples.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    march = {
      lines = {
        { id = "march_1", text = "Two pairs of wool stockings and a boot a half size large, and grease the seams every night you can. Break them in before you leave and not on the road. That last one is where everybody goes wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hooves = {
      lines = {
        { id = "hooves_1", text = "No, they are not, and I've made for both. Dwarves want width and a toe you could drop an anvil on, and the elves want a sole so thin I'm ashamed to charge for it. I've lasts for all of you now." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_barefoot = {
      lines = {
        { id = "e3_barefoot_l0", text = "Last autumn, a lad from the Redridge companies who'd worn through his issued boots at Three Corners and walked the rest of the way home on rags. His feet were raw to the bone, and I made him a pair on credit and sent the bill to the barracks quartermaster." },
      },
      choices = {
        { text = "Did the quartermaster pay?", next = "e3_barefoot2" },
        { text = "That was kind of you, Mayda.", next = "BACK" },
      },
    },
    e3_barefoot2 = {
      lines = {
        { id = "e3_barefoot2_l0", text = "Eventually, after I'd stood in his office three mornings running with the boots' twin on my arm. Now he sends me the worst-shod recruits before they march, and I'd like to think a few blisters were saved." },
      },
      choices = {
        { text = "Good work, love. Something else.", next = "BACK" },
        { text = "The army should buy proper boots.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A fellow came in wanting soft soles on a soldier's boot, so they'd look regulation and make no noise. I made them, though I didn't like him." } },
    background = { { id = "tp_background", text = "Thanes have made boots on this street since before the First War. The shop burned with the rest, and I rebuilt it with my husband's tools." } },
    advice = { { id = "tp_advice", text = "Dry your boots slowly, away from the fire, stuffed with straw. And change your stockings, for the Light's sake." } },
    _none = { { id = "tp_none", text = "That's above my ankles, love, and I don't go higher." } },
  },
}

-- Sloan McCoy: sells vials and poisons to SI:7's own, inside the headquarters in Old Town.
P:NPC {
  key = "sloan_mccoy", id = TODO_NPC("Sloan McCoy"), name = "Sloan McCoy", title = "Poison Supplier", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cool", "sardonic" }, values = { "discretion", "craft" },
  notices = { "stealth", "craft", "class" },
  impression = {
    first = "Sloan McCoy sells vials and poisons inside SI:7's headquarters in Old Town and treats every customer as a possible mistake in the paperwork. She is exact about doses and vague about everything else.",
    third = "{name} met Sloan McCoy, who supplies poisons at SI:7 in Stormwind's Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Still alive, and still reading the labels. You're one of the few I don't worry about, so take what you need." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll sell to you because someone upstairs says I must, but I'm watching which shelf you reach for." },
    { id = "g_default", text = "You found the door, so someone thinks you belong here. Don't touch anything on the green shelf." },
    { id = "g_2", when = { metBefore = true }, text = "Still alive. Then you've been reading the labels." },
    { id = "g_3", when = { class = "ROGUE" }, text = "One of ours, or near enough. What are you running short of?" },
  },
  notice = {
    { id = "n_1", cat = "stealth", when = { class = "ROGUE" },
      text = "You checked the windows before you looked at me. Good. Osborne's lessons do take, now and then." },
    { id = "n_2", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. Then you'll know better than to sniff anything in this room to see what it is." },
    { id = "n_3", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You've come a long way from the Cathedral. I sell empty vials as well, if that would trouble your conscience less." },
  },
  start = "hello",
  nodes = {
    d6_shaw = {
      lines = { { id = "d6_shaw_a", text = "He thinks it's adequate, which from Master Shaw is a parade. He's never once told me what a vial was used for, and I've never once asked, and that silence is the most honest arrangement I've had with any man." } },
      choices = {
        { text = "Doesn't the not knowing trouble you?", next = "d6_shaw2" },
        { text = "I'm one of his. I won't ask either.", next = "d6_shaw2", when = { class = "ROGUE" } },
        { text = "Let's leave Master Shaw be.", next = "BACK" },
      },
    },
    d6_shaw2 = {
      lines = {
        { id = "d6_shaw2_a", text = "Some nights, when the heralds cry a death in the square and I wonder. Then I remember the Defias who poisoned a well in Westfall, and I decide I'd rather know the crown has a worse vial than they do." },
        { id = "d6_shaw2_rogue", when = { class = "ROGUE" }, text = "Good, then you'll last. The ones who ask are the ones Osborne has to retrain, and the ones who tell are the ones I never see again, and I'd like to go on seeing you." },
      },
      choices = {
        { text = "A cold comfort, but a comfort.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "Something else, Sloan.", next = "BACK" },
      },
    },
    d6_plants = {
      lines = { { id = "d6_plants_a", text = "Less than you'd think, since Elwynn's a gentle forest and its plants want to heal you. Earthroot and peacebloom are no use to me, so the strong stuff comes from the swamps and the Barrens, through merchants who don't like being asked where they've been." } },
      choices = {
        { text = "So the gentlest forest makes the worst poisons.", next = "d6_plants2" },
        { text = "Which merchants?", next = "d6_plants2" },
        { text = "On to something else.", next = "BACK" },
      },
    },
    d6_plants2 = {
      lines = { { id = "d6_plants2_a", text = "The worst, yes, and I like it that way, because it keeps amateurs from brewing in their kitchens. As for the merchants, you'll find one or two at the docks in Menethil and a gnome in the canals who sells me deathweed, and that's as many names as you'll get today." } },
      choices = {
        { text = "More than I expected you to give.", next = "BACK" },
        { text = "Fair enough. Anything else?", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Sloan McCoy. I keep the vials and what goes in them for Master Shaw's people. I sell to those who've a reason to be in this building, and you're in this building, so we'll assume the best." },
        { id = "hello_2", when = { class = "ROGUE" }, text = "Sloan McCoy. Vials, powders and the finished article, for those Master Shaw trusts with them. Osborne teaches you where to put the knife, and I see to it the knife does more than cut." },
      },
      again = {
        { id = "hello_again1", text = "What else? Ask it quietly, and don't lean on anything while you do." },
        { id = "hello_again2", text = "Go on. Quietly." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A poisoner should label every vial truthfully, for our own people.", next = "BACK", reply = "That's the one rule down here that nobody breaks twice.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Mislabel a vial or two; it keeps the new ones careful.", next = "BACK", reply = "It keeps them dead, and then I've the Master to answer to.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "What does SI:7 need poison for?", next = "need" },
        { text = "How did you come by this trade?", next = "trade" },
        { text = "Who else works in this building?", next = "building" },
        { text = "Poison is a coward's weapon.", next = "coward" },
        { text = "Who else in the city deals in this?", next = "jasper" },
        { text = "What should I never mix?", next = "mix", when = { class = "ROGUE" } },
        { text = "What does Master Shaw think of your work?", next = "d6_shaw" },
        { text = "What do you brew from Elwynn's plants?", next = "d6_plants" },
        { text = "What's on the green shelf?", next = "e3_green" },
        { text = "I'll be going.", next = "END" },
      },
    },
    need = {
      lines = {
        { id = "need_1", text = "For the work that keeps the heralds from having anything to announce. A blade makes a noise, and a quarrel in an alley brings the watch. What I sell lets a problem end at supper with nobody the wiser." },
      },
      choices = {
        { text = "Whose problems?", next = "whose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    whose = {
      lines = {
        { id = "whose_1", text = "The crown's. I don't get told names, and I don't want them. I get told a weight, how fast, and whether anyone should be able to tell afterward. That's all the acquaintance I care to have." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "trade_1", text = "I was an apothecary's girl on the canals, and I was good at it. Somebody noticed which of my mistakes weren't mistakes. I was offered this counter or a cell in the Stockade, and the counter has better light." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    building = {
      lines = {
        { id = "building_1", text = "Master Shaw, upstairs, who misses nothing. Osborne the Night Man trains the recruits and Renzik has opinions about everyone. The rest don't have names you need. If you can't see anyone in a room here, assume it's full." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      big = true,
      lines = {
        { id = "coward_1", text = "So say people who've never had to stop a man they couldn't reach with a sword. The Defias don't post duelling challenges. If one vial in a cup spares a company of the watch, I'll take the name of coward." },
      },
      choices = {
        { text = "A quiet death that saves twenty is no shame.", next = "BACK", reply = "No. It isn't glory either, and I'd distrust anyone who thought it was.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Stormwind should face its enemies openly, or not at all.", next = "BACK", reply = "That's a handsome thought. Take it upstairs to Shaw and see how long he lets you finish.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jasper = {
      lines = {
        { id = "jasper_1", text = "Jasper Fel, across the way, sells to whoever knocks, and I'd not put his wares in my own tea. There are the warlocks under the Slaughtered Lamb too, who think anything foul is a poison. A proper poison is clean, and theirs never are." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mix = {
      lines = {
        { id = "mix_1", text = "Anything of mine with anything of Jasper's, for a start. Don't coat a blade you mean to sheathe against your own leg. And never work with a cut on your hand. I've buried two colleagues who knew all three rules." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_green = {
      lines = {
        { id = "e3_green_l0", text = "Things that don't have a label because a label would be evidence. The green paint is so that nobody mistakes them for the ordinary stock in the dark, and so that if Master Shaw ever asks me whether I keep such things, I can say I keep paint." },
        { id = "e3_green_l1", when = { class = "ROGUE" }, text = "The work you'll be trusted with in a year or two, if you live. Green so that nobody reaches for one by mistake in the dark, and unlabelled so that if anyone ever asks me what's on it, I can say paint." },
      },
      choices = {
        { text = "Has anyone ever reached for it by mistake?", next = "e3_green2" },
        { text = "I'll stay well clear of the green.", next = "BACK" },
      },
    },
    e3_green2 = {
      lines = {
        { id = "e3_green2_l0", text = "A recruit, once, in my first year, who thought it was mint tonic. Osborne carried him out and Doc Mixilpixil carried him back three days later, and the boy has been a very careful agent ever since." },
      },
      choices = {
        { text = "A hard lesson. Something else.", next = "BACK" },
        { text = "You should lock that shelf, Sloan.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Somebody upstairs has been asking how long a certain venom keeps in a sealed crate at sea. I told them, and I didn't ask which ship." } },
    background = { { id = "tp_background", text = "The canals, an apothecary's back room, and then here. The middle part I'd tell you over a drink, if I ever drank with anyone." } },
    advice = { { id = "tp_advice", text = "Label everything, and believe your own labels. The day you trust your memory over the bottle is your last day in this trade." } },
    si7 = { { id = "tp_si7", text = "You're standing in it. That's as much as anyone gets told." } },
    _none = { { id = "tp_none", text = "I don't know. And if I did, you'd not be the one I told." } },
  },
}

-- Randal Worth: Simon Tanner's apprentice at the Protective Hide in Old Town; teaches beginners and admires himself.
P:NPC {
  key = "randal_worth", id = TODO_NPC("Randal Worth"), name = "Randal Worth", title = "Journeyman Leatherworker", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "vain", "good-natured" }, values = { "style", "craft" },
  notices = { "craft", "kit", "status" },
  impression = {
    first = "Randal Worth teaches beginners at the Protective Hide in Old Town and checks his reflection in every buckle he polishes. He is something of a dandy, but his stitching is neat and he turns up every morning.",
    third = "{name} met Randal Worth, journeyman leatherworker at the Protective Hide in Stormwind's Old Town.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again, and much better dressed, I see. Come in; I've a new stitch to show you, and I'm rather proud of it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Mind the hides, and mind my cuffs, and don't expect me to fuss over your lesson." },
    { id = "g_default", text = "Good day! Mind the hides, they stain, and I've only just pressed these cuffs." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, you again, and still in that. We'll make you something better." },
    { id = "g_3", when = { profession = "Leatherworking" }, text = "A fellow of the craft! Let me see your hands. Yes, you'll do." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your stitching is honest, I'll say that. It wants a little dash, though, a bit of tooling at the collar, and I can show you how." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Oh, that is a sad sight. A jerkin can be scuffed and still look well, but it must never look defeated." },
    { id = "n_3", cat = "status", when = { origin = "human_minor_noble" },
      text = "You've the bearing of someone who was taught to stand properly. It's wasted on this street, and I appreciate it all the more." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Randal Worth, journeyman of the Protective Hide. Simon Tanner teaches the experts, and I take the beginners, and I teach them that a thing should be well made and also worth looking at. Simon cares only for the first." },
      },
      again = {
        { id = "hello_again1", text = "What else? Ask, while I buff, and tell me honestly if my collar's straight." },
        { id = "hello_again2", text = "Go on, I'm only buffing." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A leatherworker should learn every stitch properly, as Simon teaches.", next = "BACK", reply = "Quite right, and I learned them all, which is why my seams are the neatest in Old Town.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Copy a master's pattern and call it your own work.", next = "BACK", reply = "Simon would have your hide for it, and he'd tan it properly too.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Simon calls you a dandy.", next = "dandy" },
        { text = "What do you teach a beginner?", next = "teach" },
        { text = "What's it like, working under Simon Tanner?", next = "simon" },
        { text = "Armour's for stopping blades, not for show.", next = "show" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "I can skin. What makes a hide worth having?", next = "skin", when = { profession = "Skinning" } },
        { text = "Why do you check yourself in every buckle?", next = "e3_buckle" },
        { text = "Good day, Randal.", next = "END" },
      },
    },
    dandy = {
      lines = {
        { id = "dandy_1", text = "He says it as though it were a fault! A man who takes care with his collar will take care with a seam. I've told him so, and he said that I was dependable and that I should be quiet, in that order." },
      },
      choices = {
        { text = "He does call you dependable.", next = "dependable" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dependable = {
      lines = {
        { id = "dependable_1", text = "He does, and from Simon that's a sonnet. I've not missed a morning in four years, and I've never once sent out a piece I'd be ashamed to be seen beside." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = {
        { id = "teach_1", text = "Light leather first, cured properly, and then the plain things: bracers, a belt, a pair of boots that don't leak. And I make them finish the edges. An unfinished edge is how you know an amateur from across the street." },
      },
      choices = {
        { text = "And after that?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "after_1", text = "After that they go to Simon, who'll take them as far as the craft goes in this city. I'm told there are masters in Darnassus and out in the wild places who know more, and I mean to learn from them one day, if the roads allow and the inns are tolerable." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    simon = {
      lines = {
        { id = "simon_1", text = "Like being apprenticed to a very wise old boot. He knows everything, he has said all of it twice, and he's right, which is the vexing part. Jillian keeps us both fed and stops me buying hides off the canal boys." },
      },
      choices = {
        { text = "What's wrong with the canal boys' hides?", next = "canal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canal = {
      lines = {
        { id = "canal_1", text = "Nothing that a day's scraping won't mend, and they're half the price! Simon says they're ragged, and I say a boy who brings me a rat-catcher's haul is a boy who isn't picking pockets that afternoon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    show = {
      big = true,
      lines = {
        { id = "show_1", text = "It's for both, surely. A soldier who looks well stands straighter, and a man who stands straight is harder to knock over. I've sold more than one recruit his courage along with his cuirass." },
      },
      choices = {
        { text = "Pride in how you look is pride in what you are.", next = "BACK", reply = "Exactly so! I shall quote you to Simon, and he will sigh.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Vanity gets men killed. Teach them plain work.", next = "BACK", reply = "I do teach plain work. I only decline to believe that plain must mean ugly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hides_1", text = "Elwynn and Westfall, mostly, through Maris Granger's skinners. The finer hides come from farther off, and when a trapper down from the mountains brings in something spotted I'm the first at the door." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skin = {
      lines = {
        { id = "skin_1", text = "No holes in the back, where the big panels are cut, and no knife scores on the flesh side. Salt it within the day. Bring me one like that and Maris will pretend not to be impressed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_buckle = {
      lines = {
        { id = "e3_buckle_l0", text = "Because a buckle polished well enough to show a face is a buckle polished properly, and the face happens to be mine. Simon calls it vanity, and I call it quality control, and the customers can't tell the difference so long as the buckle shines." },
      },
      choices = {
        { text = "Has Simon ever praised your work outright?", next = "e3_buckle2" },
        { text = "It's vanity, Randal.", next = "BACK" },
      },
    },
    e3_buckle2 = {
      lines = {
        { id = "e3_buckle2_l0", text = "Once, on a belt I'd made for a paladin of the Silver Hand, when he picked it up and said nothing for the longest time. Then he put it down and said, \"That will do,\" and I went out back and polished three more buckles to calm myself." },
      },
      choices = {
        { text = "High praise from Simon. Something else.", next = "BACK" },
        { text = "You should frame that belt.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "There's a tailor in the Mage Quarter working a black cloth nobody will talk about. I should very much like to see how it's cut." } },
    background = { { id = "tp_background", text = "My people kept a glover's stall in the Trade District. I wanted to make something larger than a glove, so I came to Simon." } },
    advice = { { id = "tp_advice", text = "Finish your edges, oil your seams, and stand up straight. Two of those are leatherworking." } },
    _none = { { id = "tp_none", text = "I couldn't say. It doesn't sound as though it would suit me." } },
  },
}

-- Allan Hafgan: sells staves at Stormwind Staves in the Mage Quarter, beside Ardwyn Cailen's wands.
P:NPC {
  key = "allan_hafgan", id = TODO_NPC("Allan Hafgan"), name = "Allan Hafgan", title = "Staves Merchant", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "scholarly", "fussy" }, values = { "knowledge", "craft" },
  notices = { "arcane", "kaldorei", "class" },
  impression = {
    first = "Allan Hafgan sells staves at Stormwind Staves in the Mage Quarter and can name the wood, the grove and the enchanter of every one. He taps each staff on the floor and listens to it before he will let it leave the shop.",
    third = "{name} met Allan Hafgan, who sells staves at Stormwind Staves in the Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you've returned. I've a new staff of Ashenvale oak that's practically humming, and I'd like you to hold it first." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Look at the staves if you must, but please don't lean on the display." },
    { id = "g_default", text = "Welcome to Stormwind Staves. Do take your time, and please don't lean on the display." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, you've returned. I trust the last one hasn't warped, because I'd want to know." },
    { id = "g_3", when = { class = { "MAGE", "WARLOCK", "PRIEST", "DRUID" } }, text = "A practitioner, good. You'll want to hold several before you choose, and I insist on it." },
  },
  notice = {
    { id = "n_1", cat = "arcane", when = { class = "MAGE" },
      text = "You've the Quarter's posture, {class}, with the weight on the back foot. A staff should balance that, and most of what apprentices carry doesn't." },
    { id = "n_2", cat = "kaldorei", when = { race = "NightElf" },
      text = "One of the kaldorei! Half my best wood is cut by your people, I'm told with ceremony, and I can believe it from the grain." },
    { id = "n_3", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "These would serve you as walking sticks, I'm afraid, and costly ones. Ardwyn can at least sell you a wand to point at things." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Allan Hafgan. I keep the staves here and Ardwyn Cailen keeps the wands, and between us we've equipped most of the apprentices in the tower. A staff is half a mage's reach, so I take some care over who walks out with what." },
      },
      again = {
        { id = "hello_again1", text = "Is there anything further?" },
        { id = "hello_again2", text = "Do go on, I'm only sorting by grain." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A staff should be sold only to someone who's held it and chosen it.", next = "BACK", reply = "Precisely why I insist on it, and why my customers come back.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell an apprentice any staff that glows; they'll never know.", next = "BACK", reply = "They'll know when it fizzles in the middle of a spell, and so will the Sanctum.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the staves.", next = "BUSINESS" },
        { text = "What makes a good staff?", next = "good" },
        { text = "Tell me about Ardwyn.", next = "ardwyn" },
        { text = "Where does a staff's wood come from now?", next = "wood" },
        { text = "A staff is only a stick with pretensions.", next = "stick" },
        { text = "Who in the Quarter buys from you?", next = "buys" },
        { text = "Which wood holds an enchantment longest?", next = "enchant", when = { profession = "Enchanting" } },
        { text = "You must have traded with Dalaran once.", next = "dalaran", when = { origin = "human_dalaran_stray" } },
        { text = "What does a good staff sound like when you tap it?", next = "e3_note" },
        { text = "Good day, Allan.", next = "END" },
      },
    },
    good = {
      lines = {
        { id = "good_1", text = "Straight grain, slow growth and a clean note. Strike the foot on stone, so, and listen. A staff with a flaw in the heart rings dull, and it will split the first time a real working goes through it." },
      },
      choices = {
        { text = "What happens when it splits?", next = "splits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    splits = {
      lines = {
        { id = "splits_1", text = "If you are fortunate, you lose the spell and your eyebrows. An apprentice of Jennea Cannon's lost a good deal more than that with a bargain staff from a dockside stall, and she has sent every pupil to me since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ardwyn = {
      lines = {
        { id = "ardwyn_1", text = "She cannot cast so much as a spark, and she is the best judge of a wand in the kingdom. She weighs them in her fingers like a jeweller. I find it humbling, and I have told her so exactly once." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = {
        { id = "wood_1", text = "Ash and oak from Elwynn for the plain work. The finer woods came from the forests about Dalaran and from Quel'Thalas, and there's no more to be had from either. I've a dozen lengths of Silverpine yew in the back that I shall not sell until I must." },
      },
      choices = {
        { text = "What will you do when they're gone?", next = "gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gone = {
      lines = {
        { id = "gone_1", text = "Learn the Kalimdor woods, I suppose, as everyone must. The night elves send a little ironwood through Darnassus, and it takes a charge beautifully. It is very dear, and it arrives when the elves think it should." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stick = {
      big = true,
      lines = {
        { id = "stick_1", text = "My dear {class}, so is a sword only a long knife. The wood remembers every working that passes through it. An old staff knows its wielder's hand, and I've seen one refuse a stranger." },
      },
      choices = {
        { text = "A tool that knows its master deserves respect.", next = "BACK", reply = "There, you see it. I sell to people like you with a lighter heart.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Power is in the caster. The rest is merchandise.", next = "BACK", reply = "Then you'll want the cheapest one, by the door, and it will serve you exactly as well as you expect.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = {
        { id = "buys_1", text = "The tower's apprentices, on their masters' accounts. The priests buy now and then, when Gregory Ardus across the city hasn't a plain one to suit. And there are certain customers from the tavern on the corner, who pay well and whom I do not ask about." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    enchant = {
      lines = {
        { id = "enchant_1", text = "Yew, for anything of frost or shadow, and it will hold a charge for a generation. Ash takes fire well and loses it quickly. Lucan Cordell will tell you differently, and Lucan is thinking of metal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = {
        { id = "dalaran_1", text = "Every season, and I had a standing order with a wood-warden beyond the lake. I never learned what became of him. You'll forgive me, I hope, if I don't ask what became of yours." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_note = {
      lines = {
        { id = "e3_note_l0", text = "Like a bell struck under water, low and round, with a little hum after that fades slowly. A staff that clacks is green, a staff that rattles has an insect in it, and a staff that sings high has been cut from a tree that was struck by lightning." },
      },
      choices = {
        { text = "What's wrong with lightning-struck wood?", next = "e3_note2" },
        { text = "I'll listen next time I buy a staff.", next = "BACK" },
      },
    },
    e3_note2 = {
      lines = {
        { id = "e3_note2_l0", text = "Nothing, for a mage who wants a staff with opinions. It takes fire beautifully and refuses frost, and I sell perhaps one a year to an apprentice who's been warned twice and wants it anyway." },
        { id = "e3_note2_l1", when = { class = "MAGE" }, text = "Nothing, if you want a staff with opinions. It loves fire and sulks at frost, and if you're the sort who favours one school, I've a length of it in the back that might suit you." },
      },
      choices = {
        { text = "A staff with opinions. Something else.", next = "BACK" },
        { text = "Sounds dangerous.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "An apprentice swears the wizard's tower hums at night when no one is casting. I told him that towers settle, and I've started listening for it myself." } },
    background = { { id = "tp_background", text = "I failed my apprentice's examination twice, and I found I'd fallen in love with the tools more than the Art. It was the better bargain." } },
    advice = { { id = "tp_advice", text = "Never buy a staff you haven't struck on the floor. And never strike one on the floor that isn't yours without asking." } },
    _none = { { id = "tp_none", text = "That lies outside my study, I'm afraid. Ask at the tower." } },
  },
}

-- Duncan Cullen: owns Duncan's Textiles in the Mage Quarter and sells the finished light armour.
P:NPC {
  key = "duncan_cullen", id = TODO_NPC("Duncan Cullen"), name = "Duncan Cullen", title = "Light Armor Merchant", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "proper", "proud" }, values = { "reputation", "craft" },
  notices = { "craft", "warlock", "noble" },
  impression = {
    first = "Duncan Cullen owns Duncan's Textiles in the Mage Quarter and sells the finished cloth and leather himself, with his name over the door and his eye on every hem. He is proud of the house's reputation and nervous of anything that might stain it.",
    third = "{name} met Duncan Cullen, owner of Duncan's Textiles in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're the best advertisement I've got, so wear those robes well and tell everyone where you got them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The racks are open, and I'll stand behind my stitching, if not behind you." },
    { id = "g_default", text = "Welcome to Duncan's Textiles. Everything on these racks was made under this roof, and I'll stand behind every stitch." },
    { id = "g_2", when = { metBefore = true }, text = "A returning customer is the best advertisement. Welcome back." },
    { id = "g_3", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Robes for a {class}, I expect. You've come to the proper house." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "You're of the trade. Georgio teaches upstairs, and he'll find fault with your work, and you'll be the better for it." },
    { id = "n_2", cat = "warlock", when = { class = "WARLOCK" },
      text = "I serve every paying customer, naturally. I'll only ask that the creature wait outside, and that you not mention the tavern on the corner." },
    { id = "n_3", cat = "noble", when = { origin = "human_minor_noble" },
      text = "I know a house-taught bearing when I see it. We keep a private fitting room, if you would prefer it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Duncan Cullen, and the name over the door is mine. Georgio Bolero teaches the craft here, Alexandra keeps the thread, young Lawrence takes the beginners, and I sell what's finished and answer for all of it." },
      },
      again = {
        { id = "hello_again1", text = "Is there something more? Ask it, and mind the hems on the racks as you do." },
        { id = "hello_again2", text = "Please, go on." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A clothier should only sell what was made under his own roof.", next = "BACK", reply = "That's the rule of this house, and I'm proud to keep it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Buy cheap robes from Westfall and sew in your own labels.", next = "BACK", reply = "Plenty in this city do just that, friend, and their seams show it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the armour.", next = "BUSINESS" },
        { text = "How did you come to own the shop?", next = "own" },
        { text = "There's a quartermaster working in your shop.", next = "clavicus" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "I hear a tailor under the Lamb weaves shadow.", next = "jalane" },
        { text = "A shop's good name is only vanity.", next = "name" },
        { text = "What should a tailor never sell?", next = "never", when = { profession = "Tailoring" } },
        { text = "You've your own name over the door.", next = "e3_sign" },
        { text = "Good day, Master Cullen.", next = "END" },
      },
    },
    own = {
      lines = {
        { id = "own_1", text = "I bought the lease after the Second War, when half this quarter was scaffolding. I couldn't sew then and I can barely sew now. I could tell good work from bad, though, and I hired people who could do the good kind." },
      },
      choices = {
        { text = "And Georgio?", next = "georgio" },
        { text = "Something else.", next = "BACK" },
      },
    },
    georgio = {
      lines = {
        { id = "georgio_1", text = "He's the finest cutter in the city and he knows it to the inch. He would tell you the shop is his in all but name, and I let him say so, because he's worth three of anyone else and stays for the flattery." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    clavicus = {
      lines = {
        { id = "clavicus_1", text = "Clavicus Knavingham, the city's cloth quartermaster. The crown asked for a corner, and one doesn't refuse the crown. He frets over the stockpile all day, and I confess it's taught me how thin the kingdom's wool has run." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_1", text = "The tower's mages, the better sort of clerk, and nobles' households when they want something that will pass at court. Lately I sell travelling clothes to people I used to dress for banquets." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    jalane = {
      lines = {
        { id = "jalane_1", text = "I'm sure I couldn't say. This house works in wool, linen, silk and mageweave, and in nothing that needs a cellar to be made in. If one of my former pupils has taken up something else, she didn't learn it here." },
      },
      choices = {
        { text = "You know exactly who I mean.", next = "know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = {
        { id = "know_1", text = "I know that I trained a gifted young woman, and that she no longer sends me a card at Winter Veil. That's all I shall say in my own shop, with the door open." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      big = true,
      lines = {
        { id = "name_1", text = "It's the only thing I truly own. The cloth is bought and the lease is rented, and Georgio could walk out tomorrow. People come here because the name has meant sound work for twenty years, and I'd not sell that for any price." },
      },
      choices = {
        { text = "A good name is earned, and worth guarding.", next = "BACK", reply = "I'm glad to hear someone say so. It costs more to keep than people think.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You'd disown a pupil to keep your sign clean.", next = "BACK", reply = "That's unkind, and it isn't wholly false. I've thirty people's wages hanging on that sign.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    never = {
      lines = {
        { id = "never_1", text = "Anything with a seam they'd not show the customer. And nothing on credit to an adventurer, with respect. I've a drawer of notes from people who meant very well and went to Stranglethorn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_sign = {
      lines = {
        { id = "e3_sign_l0", text = "I do, painted gold on blue by a sign-writer from the Trade District who charged me more than my first year's rent. Every time a customer complains about a seam, I walk out and look at that name, and then I come back in and fix the seam myself." },
      },
      choices = {
        { text = "You said you can barely sew.", next = "e3_sign2" },
        { text = "That's a serious way to keep a shop.", next = "BACK" },
      },
    },
    e3_sign2 = {
      lines = {
        { id = "e3_sign2_l0", text = "Barely, which means badly but stubbornly, and Georgio redoes my repairs at night when he thinks I don't notice. I've never told him I know, because a man's entitled to a little pride in his own house." },
      },
      choices = {
        { text = "That's a good arrangement. Something else.", next = "BACK" },
        { text = "You should let Georgio do it from the start.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The Keep ordered mourning cloth by the bolt last month and then cancelled the order. I've wondered ever since who it was that didn't die." } },
    background = { { id = "tp_background", text = "I was a draper's clerk in the old city, and I carried his ledgers out when it burned. I came back with the ledgers and no draper." } },
    advice = { { id = "tp_advice", text = "Buy one good garment and not three poor ones. It's cheaper within the year, and you'll look like someone worth extending credit to." } },
    _none = { { id = "tp_none", text = "That isn't something I could speak to. I keep to cloth." } },
  },
}

-- Maria Lumere: sells vials and alchemists' supplies at Alchemy Needs in the Mage Quarter, among night elves.
P:NPC {
  key = "maria_lumere", id = TODO_NPC("Maria Lumere"), name = "Maria Lumere", title = "Alchemy Supplies", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful", "sharp" }, values = { "thrift", "friendship" },
  notices = { "craft", "purse" },
  impression = {
    first = "Maria Lumere sells vials and supplies at Alchemy Needs in the Mage Quarter, the one human in a shop of night elves. She does the bargaining for all of them and has picked up more of their tongue than she admits.",
    third = "{name} met Maria Lumere, who sells alchemy supplies at Alchemy Needs in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for more vials? I've kept a crate of the good glass aside, the kind that doesn't crack on the boil." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The vials are on the shelf, and the elves will ring you up if I'm busy." },
    { id = "g_default", text = "Hello! Vials, flasks and everything to fill them with. Mind the low beam, the elves never notice it." },
    { id = "g_2", when = { metBefore = true }, text = "Back for more vials? I knew you'd run through them." },
    { id = "g_3", when = { race = "NightElf" }, text = "Ishnu-alah! There, I've used up half my Darnassian. Come in." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Alchemy" },
      text = "Stained fingers and a scorched cuff, so you're one of ours. Lilyssia will want to hear what you've been brewing." },
    { id = "n_2", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been picking, I can smell peacebloom on you. Eldraeith buys good herbs, if you've more than you need." },
    { id = "n_3", cat = "purse", when = { money = { max = 500 } },
      text = "Buy the plain glass, dear. The potion doesn't know what the vial cost." },
  },
  start = "hello",
  nodes = {
    d6_quarter = {
      lines = { { id = "d6_quarter_a", text = "Loud, bright and occasionally on fire, dear, though never our shop, touch wood. A student turned my cat into a sheep last spring for a dare, and it came back as a cat after an hour, but it's never once forgiven me." } },
      choices = {
        { text = "My kin treat you well, I hope.", next = "d6_quarter2", when = { race = "NightElf" } },
        { text = "Why does your cat blame you?", next = "d6_quarter2" },
        { text = "Mages ought to be fined for that.", next = "d6_quarter2" },
      },
    },
    d6_quarter2 = {
      lines = {
        { id = "d6_quarter2_a", text = "Because I laughed, and cats remember who laughed. The student's tutor came round with an apology and a tin of fish, which the cat ate, and then it went and sat on Lilyssia's lap instead of mine, so I suppose that was the verdict." },
        { id = "d6_quarter2_ne", when = { race = "NightElf" }, text = "Better than my own kin do, honestly, and they're far more patient with my bookkeeping. Lilyssia calls me her little storm, which I gather is a compliment where you're from, though I've never quite been brave enough to ask." },
      },
      choices = {
        { text = "The cat chose well.", next = "BACK" },
        { text = "Something else, Maria.", next = "BACK" },
      },
    },
    d6_buyers = {
      lines = { { id = "d6_buyers_a", text = "The Cathedral, for healing draughts by the crate, and the barracks, for the same, and the mages, for things I don't ask about. The priests always pay on time and the mages always pay in full, and the barracks pay eventually, after a great deal of paperwork." } },
      choices = {
        { text = "Which of them is the worst to deal with?", next = "d6_buyers2" },
        { text = "You keep good books, I take it.", next = "d6_buyers2" },
        { text = "Let's move on.", next = "BACK" },
      },
    },
    d6_buyers2 = {
      lines = { { id = "d6_buyers2_a", text = "The barracks, because the quartermaster wants a discount for patriotism and I give him one for promptness, and we've never yet agreed which of us is being generous. I keep the books for the whole shop, and if the elves did it, we'd be paid in leaves and good wishes." } },
      choices = {
        { text = "Then it's lucky they have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Maria Lumere! Lilyssia Nightbreeze teaches alchemy here, Tel'Athir is learning to teach it, and Eldraeith sells the herbs. I sell the glass and do the haggling, since the elves think arguing over a price is beneath them." },
      },
      again = {
        { id = "hello_again1", text = "What else, dear? Vials, flasks, or a word in Darnassian I've no business knowing?" },
        { id = "hello_again2", text = "Go on, I can talk and count." },
        { id = "hello_again3", text = "Yes, dear?" },
      },
      choices = {
        { text = "Alchemy supplies should be sold pure, never cut with cheap fillers.", next = "BACK", reply = "Always, because a cut powder can turn a healing draught into poison.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Cut the powders with chalk; no alchemist checks every batch.", next = "BACK", reply = "The good ones do, and the bad ones blow up their kitchens and blame me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the supplies.", next = "BUSINESS" },
        { text = "How did a human end up in an elven shop?", next = "how" },
        { text = "What are the elves like to work with?", next = "elves" },
        { text = "You do all the bargaining?", next = "bargain" },
        { text = "Night elves have no business running a Stormwind shop.", next = "business" },
        { text = "What are alchemists short of?", next = "short" },
        { text = "What should a beginner brew first?", next = "brew", when = { profession = "Alchemy" } },
        { text = "What's it like working in the Mage Quarter?", next = "d6_quarter" },
        { text = "Who buys the most from this shop?", next = "d6_buyers" },
        { text = "They say you've picked up Darnassian.", next = "e3_tongue" },
        { text = "Good day, Maria.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "how_1", text = "It was my shop first, or my aunt's, and failing. Lilyssia came in one day to buy every vial I had, and she asked why the place was so badly run. She was right, so I asked her to stay." },
      },
      choices = {
        { text = "And she did.", next = "stayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed = {
      lines = {
        { id = "stayed_1", text = "She did, and she brought the others. Now the sign's the same and the trade's tripled, and I've learned that an elf's \"soon\" means before the leaves turn. I plan my orders around it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = {
        { id = "elves_1", text = "Kind, and slow, and very particular. Lilyssia will spend a morning on one flask. Tel'Athir asks me a hundred questions a day about humans, and yesterday it was why we shake hands. I told him it's to show we aren't holding a knife, and he was appalled." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain = {
      lines = {
        { id = "bargain_1", text = "Every bit of it. A carter tried to charge Eldraeith double for crates because she wouldn't argue, and I caught him at the door. Now they send every tradesman to me, and they stand behind me looking ancient, which helps." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      big = true,
      lines = {
        { id = "business_1", text = "Oh, I've heard that across the counter, mostly from people buying their potions. They crossed an ocean to stand with us, and they pay the city's taxes, the same as I do. I'd take more neighbours like them." },
      },
      choices = {
        { text = "They came to help. The city should welcome them.", next = "BACK", reply = "That's what I say, and I say it loudly when the carters are in.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Stormwind's trade should stay in Stormwind's hands.", next = "BACK", reply = "It is in Stormwind's hands, dear. They're mine, and I chose my partners.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "Vials, always, since every company marching out wants healing draughts by the crate. And swiftthistle, which Eldraeith says the briars in the Barrens are full of. Nobody on our side cares to go and pick it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = {
        { id = "brew_1", text = "Minor healing, until you can do it half asleep, because you'll be doing it half dead one day. Lilyssia makes her pupils brew forty before she'll teach them anything with a colour to it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_tongue = {
      lines = {
        { id = "e3_tongue_l0", text = "A few words, dear, and most of them are for haggling, which the elves find hilarious since they don't do it. I know the word for \"too dear\", the word for \"absolutely not\" and a word Eldraeith says only when a carter drops a crate." },
        { id = "e3_tongue_l1", when = { race = "NightElf" }, text = "A few words, and you'll laugh at my accent, I'm sure, since Lilyssia does. I know \"too dear\" and \"absolutely not\" and a word Eldraeith says when a carter drops a crate, which I suspect you'll recognise." },
      },
      choices = {
        { text = "What does Eldraeith's word mean?", next = "e3_tongue2" },
        { text = "That's more than most humans learn.", next = "BACK" },
      },
    },
    e3_tongue2 = {
      lines = {
        { id = "e3_tongue2_l0", text = "She won't tell me, and Tel'Athir goes pink when I ask him, which tells me enough. I used it once on the barracks quartermaster, and he paid in full without a word, so it must be a strong one." },
      },
      choices = {
        { text = "It certainly sounds strong. Something else.", next = "BACK" },
        { text = "Best not use it again.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Somebody's been buying empty leaded vials in Old Town by the gross. You only need lead for a thing that eats through glass, and I'd rather not know what." } },
    background = { { id = "tp_background", text = "My aunt left me a failing shop and a cupboard of cracked flasks. It's the best thing anyone ever gave me, though it didn't look it that winter." } },
    advice = { { id = "tp_advice", text = "Cork it before you shake it. You'd think nobody would need telling." } },
    darnassus = { { id = "tp_darnassus", text = "I've never seen it. Lilyssia says the trees there are taller than the Cathedral, and I've decided to believe her." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask Lilyssia, and bring a chair, because she'll take her time." } },
  },
}

-- Owen Vaughn: sells reagents to the Mage Quarter's casters.
P:NPC {
  key = "owen_vaughn", id = TODO_NPC("Owen Vaughn"), name = "Owen Vaughn", title = "Reagent Vendor", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "affable", "absent-minded" }, values = { "curiosity", "order" },
  notices = { "arcane", "class" },
  impression = {
    first = "Owen Vaughn sells reagents in the Mage Quarter and knows which spell every customer is about to cast by what they buy. He is friendly and a little vague, and he keeps a slate of the oddest orders.",
    third = "{name} met Owen Vaughn, a reagent vendor in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you, you're the one who bought the, the runes! No, the feathers, I've got it, and welcome back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Powders, runes and feathers are on the shelf, so do help yourself." },
    { id = "g_default", text = "Good day, good day. Powders, runes, feathers and seeds, and I had a list somewhere." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, it's you. You bought the, no, don't tell me, I'll have it in a moment." },
    { id = "g_3", when = { class = "MAGE" }, text = "A mage! Arcane powder and runes, then, and a light feather in case of stairs." },
  },
  notice = {
    { id = "n_1", cat = "arcane", when = { class = "MAGE" },
      text = "You've rune dust on your sleeve. Teleportation or a portal? I can never tell them apart by the stain." },
    { id = "n_2", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "Candles and symbols for you, I think. Brother Cassius at the Cathedral keeps the same, and he blesses his, which I can't." },
    { id = "n_3", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "Nothing here goes on a sword, I'm afraid, though the flash powder is popular with a certain sort of customer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Owen Vaughn, reagents. Whatever a spell eats, I sell: powder for the mages, seeds for the druids in the Park, candles for the priests. A caster without reagents is only somebody waving, as my old master used to say." },
      },
      again = {
        { id = "hello_again1", text = "Was there something else? In my experience there usually is." },
        { id = "hello_again2", text = "Go on, I'm listening, I think, though I've just lost count of the feathers." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A reagent seller should never sell a dud rune.", next = "BACK", reply = "Never, though I do sometimes forget which ones I've checked, so I check them all twice.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Mix old feathers in with the new; mages never look.", next = "BACK", reply = "They look the moment they fall down the stairs, friend, believe me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the reagents.", next = "BUSINESS" },
        { text = "You can tell a spell from the shopping?", next = "tell" },
        { text = "What's the oddest thing you've been asked for?", next = "odd" },
        { text = "Who are your regulars?", next = "regulars" },
        { text = "You should ask what your reagents are used for.", next = "ask" },
        { text = "Where do reagents come from?", next = "source" },
        { text = "Do you stock anything for work done by candlelight, behind locked doors?", next = "stones", when = { class = "WARLOCK" } },
        { text = "The druids in the Park buy from you?", next = "seeds", when = { class = "DRUID" } },
        { text = "Read me the oddest order on your slate.", next = "e3_slate" },
        { text = "Good day, Owen.", next = "END" },
      },
    },
    tell = {
      lines = {
        { id = "tell_1", text = "Almost always. One rune of teleportation means somebody's going home, and ten means a party's going somewhere unpleasant. When a young mage buys a single light feather, I know which tower window he's been dared to jump from." },
      },
      choices = {
        { text = "Do they survive the window?", next = "window" },
        { text = "Something else.", next = "BACK" },
      },
    },
    window = {
      lines = {
        { id = "window_1", text = "Usually. Maginor Dumas sends them to me in a group at the start of each term and makes them buy three, so there's one for the jump and two for when they drop the first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    odd = {
      lines = {
        { id = "odd_1", text = "I keep a slate. A gnome wanted forty candles and wouldn't say why. A paladin wanted a symbol of kings and had no idea what one was for. And a gentleman from the Lamb asked what I'd charge for a shard of something I don't sell and won't name." },
      },
      choices = {
        { text = "What did you tell the gentleman?", next = "lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb = {
      lines = {
        { id = "lamb_1", text = "That I'd never heard of it, and I said it very politely. He smiled and bought a candle, and I've burned sage in here every evening since. I'm told it does nothing, but it settles me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = {
        { id = "regulars_1", text = "The tower's apprentices, who buy on credit and pay at term's end. The Bouchers send over when their own stock runs short, and I send to them, and we pretend we're rivals. Then there's Larimaine Purdue, who uses more portal runes than the rest of the city together." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      big = true,
      lines = {
        { id = "ask_1", text = "I've wondered about it. But I sell powder and seeds, friend, and I sell them to a hundred people a day. If I questioned each one I'd be an inquisitor with a shop, and a poor one, since anybody can lie about a spell." },
      },
      choices = {
        { text = "A merchant isn't his customers' keeper.", next = "BACK", reply = "No. Though I do keep the slate, and I'd show it to the right person if they asked.", fx = { align = { order = -1 } } },
        { text = "In a city full of cultists, somebody must ask.", next = "BACK", reply = "You may be right. I'll ask the next one who smiles at me that way, if I can find my nerve.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "source_1", text = "The powders are ground here in the Quarter, and I've a man who does nothing else. The runes were carved in Dalaran once, and now a dwarf in Ironforge does them. They're squarer, but they work." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = {
        { id = "stones_1", text = "Candles, yes, and plain powders. For the rest you'll want your own people. I say that with respect, {class}, and I'd say it from behind the counter either way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    seeds = {
      lines = {
        { id = "seeds_1", text = "Maple seeds, by the pouch, and Theridran sends a pupil for them every week. He told me once what they're for and I've tried not to think about it since, because it involved somebody being dead first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_slate = {
      lines = {
        { id = "e3_slate_l0", text = "Oh, let me see, it's here somewhere under the feather counts. \"Twelve candles, one bag of grave dust, one bunch of lavender, for an apology.\" I never found out who was apologising to whom, and I've thought about it a good deal." },
      },
      choices = {
        { text = "Grave dust and lavender for an apology?", next = "e3_slate2" },
        { text = "Some things are better not known, Owen.", next = "BACK" },
      },
    },
    e3_slate2 = {
      lines = {
        { id = "e3_slate2_l0", text = "That's exactly what I said, to myself, at the time. The customer was a young warlock who looked very sorry indeed, and when he came back the next week he bought only lavender, so I like to think it went well." },
      },
      choices = {
        { text = "I hope it did. Something else.", next = "BACK" },
        { text = "You sold grave dust to a warlock?", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Portal runes for Darnassus are selling at three times last year's pace. The elves are coming or our people are going, and I can't tell which from a rune." } },
    background = { { id = "tp_background", text = "I was a mage's shop-boy, and the mage went north to Dalaran and didn't come back. He left the stock and no instructions, so I went on selling it." } },
    advice = { { id = "tp_advice", text = "Buy more than the spell calls for. A reagent you don't need weighs nothing, and you'll remember the one you lacked for the rest of your life." } },
    _none = { { id = "tp_none", text = "I did know something about that. No, it's gone, I'm sorry." } },
  },
}

-- Tel'Athir: night elf journeyman at Alchemy Needs in the Mage Quarter; learning under Lilyssia Nightbreeze and puzzling over humans.
P:NPC {
  key = "tel_athir", id = TODO_NPC("Tel'Athir"), name = "Tel'Athir", title = "Journeyman Alchemist", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "curious", "courteous" }, values = { "knowledge", "balance" },
  notices = { "kaldorei", "craft", "race" },
  impression = {
    first = "Tel'Athir teaches beginners at Alchemy Needs in the Mage Quarter and is himself a pupil of Lilyssia Nightbreeze. He is old by any human count and young among his own people, and he asks as many questions as he answers.",
    third = "{name} met Tel'Athir, a night elf journeyman alchemist at Alchemy Needs in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah. You have returned, and I have a great many more questions, so please sit." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. I will teach you, since Lilyssia asks it, but I find I have few questions for you." },
    { id = "g_default", text = "Ishnu-alah. You have come to learn, or to buy, and Maria tells me I must ask which before I begin talking." },
    { id = "g_2", when = { metBefore = true }, text = "You return. Good. I have thought of more questions since you left." },
    { id = "g_3", when = { race = "NightElf" }, text = "Elune-adore, {g:brother|sister}. It is restful to hear my own tongue among so much stone." },
  },
  notice = {
    { id = "n_1", cat = "kaldorei", when = { race = "NightElf" },
      text = "You too have left the trees for this city. Tell me, do you sleep here? I have not yet learned to, with the bells." },
    { id = "n_2", cat = "craft", when = { profession = "Alchemy" },
      text = "Your hands know the pestle. Then you will not mind if I ask how your people taught you, for I am collecting the differences." },
    { id = "n_3", cat = "race", when = { race = "Human" },
      text = "Forgive me if I stare. I am still learning to tell how old your people are, and I have been wrong in both directions." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Tel'Athir. Lilyssia Nightbreeze is my shan'do in this craft, and she permits me to teach those who are beginning. I have studied the herbs of Teldrassil for two centuries, and the herbs of your kingdom for two years, and the second is harder." },
      },
      again = {
        { id = "hello_again1", text = "What more would you ask? I enjoy it." },
        { id = "hello_again2", text = "Speak, then; my shan'do says I listen better than I grind, which is not entirely a compliment." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Alchemy should be learned as the druids taught it, slowly and carefully.", next = "BACK", reply = "Yes, and the herbs reward the patient, as Lilyssia says.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Mix whatever works; the old recipes are for the timid.", next = "BACK", reply = "Then you will poison someone eventually, and the old recipes will have been right.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What's hard about our herbs?", next = "herbs" },
        { text = "What's Lilyssia like as a teacher?", next = "lilyssia" },
        { text = "You ask a lot of questions about humans.", next = "humans" },
        { text = "Alchemy cheats nature of its time.", next = "cheats" },
        { text = "Who else works in this shop?", next = "shop" },
        { text = "How was alchemy taught in Darnassus?", next = "darnassus", when = { race = "NightElf" } },
        { text = "What would you teach me first?", next = "first", when = { profession = "Alchemy" } },
        { text = "You spoke of a widow who buys sleeping draughts.", next = "e3_widow" },
        { text = "Good day, Tel'Athir.", next = "END" },
      },
    },
    herbs = {
      lines = {
        { id = "herbs_1", text = "They are in such haste. Peacebloom here flowers and seeds and dies within one season, and the potion made from it works quickly and fades quickly. At home a root may take forty years to ripen, and the draught lasts as long as it took." },
      },
      choices = {
        { text = "Which is better?", next = "better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = {
        { id = "better_1", text = "I believed ours was, when I came. Then I watched a human healer save a child with a potion brewed that morning from a weed. A forty-year root is of no use to a child who has an hour left." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lilyssia = {
      lines = {
        { id = "lilyssia_1", text = "Patient, and without mercy. She had me grind silverleaf for a year before I was allowed to heat it. When I complained, she told me she had ground it for ten. I have not complained since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = {
        { id = "humans_1", text = "Because you are the great puzzle of this age. You live eighty years and build a city like this one twice. Maria explains you to me. She says that you hurry because you must, and that it is not rude to say so." },
      },
      choices = {
        { text = "What puzzles you most?", next = "puzzle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    puzzle = {
      lines = {
        { id = "puzzle_1", text = "That you grieve as deeply as we do, and have so little time to do it in. A widow who buys her sleeping draught from me was dancing at the Midsummer fire. I do not know whether that is a weakness or the bravest thing I have seen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cheats = {
      big = true,
      lines = {
        { id = "cheats_1", text = "The druids at the Park have said the same to me, gently. A wound that closes in a breath did not heal as wounds were meant to. Still, I have not found the place in nature where it is written that the wounded must wait." },
      },
      choices = {
        { text = "Easing pain is no offence against the balance.", next = "BACK", reply = "So I have come to think, in this city of short lives. Lilyssia agrees, though she took a century to say so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What's healed in haste is paid for later.", next = "BACK", reply = "That is the old teaching, and I do not dismiss it. I only notice who is asked to pay.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = {
        { id = "shop_1", text = "Maria Lumere, who sells the glass and frightens the carters, and Eldraeith, who keeps the herbs and misses Teldrassil more than she admits. The shop was Maria's, and she says it is ours. I am told that is unusual among humans, and it is unusual among us also." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    darnassus = {
      lines = {
        { id = "darnassus_1", text = "In silence, under the boughs, with one teacher and one pupil and no coin changing hands. Here I teach six at once while a gnome shouts a question from the door. I did not expect to prefer it, and some days I do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_1", text = "To smell each herb before you crush it, every time. The plant tells you whether it is ready, and a recipe will never tell you that. Then the minor healing draught, forty times over, as Lilyssia requires." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_widow = {
      lines = {
        { id = "e3_widow_l0", text = "She comes on the first of every month, and she pays in coppers counted out one at a time, and she tells me about her husband while I measure the draught. He was a mason, and I have learned more of how this city was rebuilt from her than from any book." },
      },
      choices = {
        { text = "What has she told you?", next = "e3_widow2" },
        { text = "You listen well for a teacher.", next = "BACK" },
      },
    },
    e3_widow2 = {
      lines = {
        { id = "e3_widow2_l0", text = "That he cut the stone for the Cathedral steps, and that the third step from the top has his mark under it, a little hammer. I went and looked, and it is there, and I have not yet told her that I looked." },
      },
      choices = {
        { text = "Tell her. It would mean a great deal. Something else.", next = "BACK" },
        { text = "Some things are better kept.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A herb-gatherer says the plants in the wood your people call Duskwood are growing wrong, pale and too quickly. I would like to see one, and I would like more to know why." } },
    background = { { id = "tp_background", text = "I was a gatherer under Teldrassil's boughs, and before that in Ashenvale. I came here because Lilyssia asked, and because I had never seen a people in such a hurry." } },
    advice = { { id = "tp_advice", text = "Smell it first. Your nose is older than any recipe." } },
    _none = { { id = "tp_none", text = "I do not know. I will add it to my questions." } },
  },
}

-- Sellandus: night elf tailor who teaches at Duncan's Textiles in the Mage Quarter.
P:NPC {
  key = "sellandus", id = TODO_NPC("Sellandus"), name = "Sellandus", title = "Expert Tailor", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "serene", "exacting" }, values = { "patience", "beauty" },
  notices = { "craft", "kaldorei", "arcane" },
  impression = {
    first = "Sellandus is a night elf who teaches tailoring in the Mage Quarter and handles cloth as though it might wake. He is patient to the point of stillness, and he will unpick a pupil's whole seam for one loose stitch.",
    third = "{name} met Sellandus, a night elf tailor who teaches in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good day again. Your hems are straight this time, and I am pleased to see it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. Your hem is down again, and I find I have no wish to point it out." },
    { id = "g_default", text = "Good day to you." },
    { id = "g_2", when = { metBefore = true }, text = "Good day again. Your hem has come down on the left, and I shall try not to look at it." },
    { id = "g_3", when = { race = "NightElf" }, text = "Ishnu-alah. It is good to see one of our own in this quarter of stone and smoke." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew. Show me the inside of your cuff, and I shall know everything else." },
    { id = "n_2", cat = "kaldorei", when = { race = "NightElf" },
      text = "You wear human cloth now, as I do. It is warm and it is honest, and I miss the moonlight in ours." },
    { id = "n_3", cat = "arcane", when = { class = "MAGE" },
      text = "Your robe has been mended with a spell and not a needle. It will hold, and it will never hang properly again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Sellandus. I teach those who have passed beyond Lawrence Schneider's lessons and are not yet ready for Georgio Bolero's opinions. I have sewn for a very long time, and I am still learning what human hands can do in a hurry." },
      },
      again = {
        { id = "hello_again1", text = "There was something more?" },
        { id = "hello_again2", text = "Speak, I can sew and listen." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Good cloth demands patient work, stitch by honest stitch.", next = "BACK", reply = "So I was taught, many long years ago, and so I teach.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hide the bad stitches inside the seam; nobody looks there.", next = "BACK", reply = "I look there, and so does anyone who has worn a robe in the rain.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "How does a night elf come to teach here?", next = "come" },
        { text = "What do you make of human tailoring?", next = "human" },
        { text = "Tell me about Georgio.", next = "georgio" },
        { text = "You'd unpick a whole seam for one stitch?", next = "unpick" },
        { text = "A robe only needs to hold together.", next = "hold" },
        { text = "What did the Sisters wear, in your youth?", next = "sisters", when = { race = "NightElf" } },
        { text = "What cloth should I learn on?", next = "learn", when = { profession = "Tailoring" } },
        { text = "Tell me more about the pocket.", next = "e3_pocket" },
        { text = "Good day, Sellandus.", next = "END" },
      },
    },
    come = {
      lines = {
        { id = "come_1", text = "My people have need of this alliance, and I have no gift for the bow. I asked what I might offer, and a priestess looked at the robe I had made her and said to go and teach them that. So I came across the sea." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = {
        { id = "human_1", text = "It is quick, bold and fond of buttons. You invent a new cut every ten years and forget the old one. I thought that foolish, and then I saw that every cut is tried once by someone, and so your craft moves while ours has rested." },
      },
      choices = {
        { text = "What have you learned from us?", next = "learned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned = {
      lines = {
        { id = "learned_1", text = "The pocket. We had pouches and never thought to sew one into the garment itself. Alexandra Bolero showed me, and I laughed aloud, which I am told startled the whole shop." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    georgio = {
      lines = {
        { id = "georgio_1", text = "A master, and a loud one. He looks at a person's coat before their face, and I look at the stitches before the coat, and so between us nobody who enters is seen as they would wish. We respect one another greatly and speak rarely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    unpick = {
      lines = {
        { id = "unpick_1", text = "I would, and I do. A loose stitch is where the seam begins to die. The pupil is angry for a day. Ten years on, the robe is still whole, and they have forgotten that they were angry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      big = true,
      lines = {
        { id = "hold_1", text = "So a young mage told me, the week before he went to Redridge. Perhaps for him it was true. But a thing made with care carries the care with it, and I think the wearer stands differently for knowing it." },
      },
      choices = {
        { text = "Beauty is worth the hours it takes.", next = "BACK", reply = "Then you understand why I unpick. Few here do, and I do not blame them.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The young mage was right. People need robes now.", next = "BACK", reply = "That is the human answer, and this is a human city. I give them the robe, and I grieve a little over the seam.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters = {
      lines = {
        { id = "sisters_1", text = "Silk spun under the full moon and cut without iron, as you will remember. I sewed for the temple before the World Tree burned. I have one length of that silk left, and I have never found the garment worthy of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = {
        { id = "learn_1", text = "Linen, until your stitches are even. Then wool, which forgives nothing. Leave silk until you have stopped being proud of yourself, for silk will know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_pocket = {
      lines = {
        { id = "e3_pocket_l0", text = "Alexandra Bolero sewed one into a mage's robe while I watched, a flat little purse turned into the lining, and I was so astonished that I made her do it twice. In ten thousand years my people never thought to keep a thing inside the very garment, which humbles me." },
      },
      choices = {
        { text = "Have you sewn pockets into kaldorei garments since?", next = "e3_pocket2" },
        { text = "Pockets are a fine human invention.", next = "BACK" },
      },
    },
    e3_pocket2 = {
      lines = {
        { id = "e3_pocket2_l0", text = "One, into a cloak I sent to a Sentinel in Ashenvale, and she wrote back to say it was useful and also that she had told no one. I suspect the temple would consider it a scandal." },
      },
      choices = {
        { text = "A small scandal. Something else.", next = "BACK" },
        { text = "Pockets should stay human, perhaps.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Duncan frowns whenever a certain cloth is mentioned, one that is woven in a cellar. I have seen a scrap of it. It is beautiful work, and I did not like to touch it." } },
    background = { { id = "tp_background", text = "I sewed for the Temple of the Moon for longer than this city has stood. I say that without pride, for it is only a count of years." } },
    advice = { { id = "tp_advice", text = "Wash your hands before you touch the cloth. Then wash them again." } },
    _none = { { id = "tp_none", text = "I cannot say. It has not come across my table." } },
  },
}

-- Connor Rivers: apprentice in the Blue Recluse's kitchen in the Mage Quarter; sells the kitchen's supplies.
P:NPC {
  key = "connor_rivers", id = TODO_NPC("Connor Rivers"), name = "Connor Rivers", title = "Apprentice Chef", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "harried", "cheerful" }, values = { "craft", "friendship" },
  notices = { "craft", "arcane", "drink" },
  impression = {
    first = "Connor Rivers is the apprentice chef at the Blue Recluse in the Mage Quarter and does most of the chopping, carrying and apologising. He sells the kitchen's flour and spice on the side and takes Angus Stern's shouting as a kind of affection.",
    third = "{name} met Connor Rivers, apprentice chef at the Blue Recluse in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, good! Sit at the end of the counter, and I'll find you something Chef hasn't sent back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. We're busy, Chef's in a mood, and I've no time for you today." },
    { id = "g_default", text = "Hello! Mind the pot, it's hot, and so is Chef this morning." },
    { id = "g_2", when = { metBefore = true }, text = "You again! Good, a friendly face. I've had two mages send back the soup for being \"insufficiently warm\"." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "We're at the supper rush, friend, so talk fast and I'll chop faster." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, don't you? You looked at the knives before the food. Tell Chef his sauce is good, because he's been cross all day." },
    { id = "n_2", cat = "arcane", when = { class = "MAGE" },
      text = "Please don't heat your own plate at the table. Chef takes it personally, and then I hear about it." },
    { id = "n_3", cat = "drink", when = { drunk = true },
      text = "You've met Joachim's pouring arm, I see. Sit by the kitchen door and I'll find you some bread." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Connor Rivers, apprentice chef. Angus Stern runs the kitchen, Joachim Brenlow runs the bar, and I run between them. I sell flour, spice and water out the kitchen door as well, which Chef allows so long as his own shelf stays full." },
      },
      again = {
        { id = "hello_again1", text = "What else? I've a minute, probably." },
        { id = "hello_again2", text = "Go on, but quick, the soup's on and Chef can smell neglect through a wall." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "A kitchen should serve only fresh food, whatever the cost.", next = "BACK", reply = "That's what Chef says, though he says it louder, and with a ladle.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Old meat tastes fine once you drown it in pepper.", next = "BACK", reply = "Not in this kitchen, it doesn't, because the mages would notice and set fire to us.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the kitchen supplies.", next = "BUSINESS" },
        { text = "What's Angus Stern like to work for?", next = "angus" },
        { text = "Who eats at the Blue Recluse?", next = "eats" },
        { text = "You look run off your feet.", next = "run" },
        { text = "An apprentice shouldn't put up with being shouted at.", next = "shout" },
        { text = "What do you hear from the tables?", next = "hear" },
        { text = "What's the dish you're proudest of?", next = "proud", when = { profession = "Cooking" } },
        { text = "I was raised in this quarter. Is the Recluse the same?", next = "same", when = { origin = "human_mage_quarter" } },
        { text = "Angus is planning a great feast?", next = "e3_feast" },
        { text = "Good day, Connor.", next = "END" },
      },
    },
    angus = {
      lines = {
        { id = "angus_1", text = "Loud, exact, and the best cook I'll ever stand next to. He threw a ladle at me my first week for salting his stock. He was right about the stock, and he missed with the ladle on purpose." },
      },
      choices = {
        { text = "What's he taught you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = {
        { id = "taught_1", text = "That you taste everything, twice, and that a feast is won the day before. He's planning a great one for the Recluse, with dishes from all over, and I've been peeling for it since the new moon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eats = {
      lines = {
        { id = "eats_1", text = "Mages, and they are the worst customers alive. They read at table and let it go cold, and then they complain. The students tip in conjured bread. The warlocks from down the lane tip well and eat everything, and I've decided to like them for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    run = {
      lines = {
        { id = "run_1", text = "I am! There's the breakfast for the tower, the dinner for the tavern, and a mage who wants his eggs \"exactly as yesterday\". I don't mind it. If I stood still, I'd have to think about how much there is to learn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shout = {
      big = true,
      lines = {
        { id = "shout_1", text = "He shouts at the soup, mostly, and I happen to be standing by it. I asked for this kitchen, friend. Half the cooks in Stormwind would take a ladle to the head to learn what I'm learning." },
      },
      choices = {
        { text = "A hard master makes a good craftsman.", next = "BACK", reply = "That's what I tell my mother. Though I'd not mind if he missed by a little more.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No craft is worth being treated like a dog.", next = "BACK", reply = "It's kind of you to say. He's never been cruel, though, only loud, and I do know the difference.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = {
        { id = "hear_1", text = "More than they think, since nobody lowers their voice for the lad with the plates. The apprentices are frightened of their examinations. Their masters are frightened of something to the north, and they stop talking about it when I come to the table." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    proud = {
      lines = {
        { id = "proud_1", text = "A crab cake, with Westfall crab when we can get it. Chef ate one, said nothing, and put it on the slate the next day. I've not slept properly since for fear of getting it wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    same = {
      lines = {
        { id = "same_1", text = "Same beams, same smell, and the same scorch on the ceiling from whatever that was. You'll know the corner table, then, where the students sit, and you'll know not to sit under the scorch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_feast = {
      lines = {
        { id = "e3_feast_l0", text = "For the Recluse's anniversary, and he's been planning it since the last one, with a list of courses pinned to the wall that changes every morning. Right now it's nine courses, and three of them are soup, and I've been forbidden to ask why." },
      },
      choices = {
        { text = "Three soups? Isn't that excessive?", next = "e3_feast2" },
        { text = "Nine courses sounds wonderful.", next = "BACK" },
      },
    },
    e3_feast2 = {
      lines = {
        { id = "e3_feast2_l0", text = "It's one hot, one cold and one he won't describe, which I suspect is meant to impress the mages. He's had me chopping onions for the practice batch for two days, and I've cried more than at my grandmother's funeral." },
      },
      choices = {
        { text = "Keep chopping, Connor. Something else.", next = "BACK" },
        { text = "Angus works you too hard.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A man came asking after a soldier called Hyal, who drank here once. I told him what I knew, which was that the fellow talked a great deal about Theramore and paid in foreign coin." } },
    background = { { id = "tp_background", text = "My father's a carter, and I was meant to be one. I delivered flour to this kitchen, smelled what Chef was making, and never got back on the cart." } },
    advice = { { id = "tp_advice", text = "Sharpen your knife before you start, not when it slips. I've the scar to show for learning it." } },
    _none = { { id = "tp_none", text = "I've no idea, sorry. If it isn't in the pot, I've likely missed it." } },
  },
}
