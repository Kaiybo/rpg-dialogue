-- Dun Morogh folk the first passes missed, part 1: Anvilmar and Coldridge Valley (Adlin Pridedrift, Alamar Grimm,
-- Branstock Khalder, Grundel Harkin, Rybrad Coldbank) and the mountaineers' camp and shooting range east of the
-- Coldridge Pass (Angus, Shorty, Spotter Klemmy, Riflemen Middlecamp and Wheeler). Voice: bibles/missed_dunmorogh.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Adlin Pridedrift: general supplies, Anvilmar. Kin to Nori Pridedrift.
P:NPC {
  key = "adlin_pridedrift", id = TODO_NPC("Adlin Pridedrift"), name = "Adlin Pridedrift", gender = "male",
  title = "General Supplies",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "cheerful" }, values = { "thrifty", "kin" },
  notices = { "greenness", "race" },
  impression = {
    first = "Adlin Pridedrift keeps the general store in Anvilmar, with rope, torches and waterskins stacked to the rafters. He sizes up every recruit by what they forgot to pack.",
    third = "{name} met Adlin Pridedrift, who sells general supplies in Anvilmar.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Anvilmar, {class}! If ye're headed out intae the valley, ye'll want more than ye're carryin', an' I happen tae sell it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still in one piece, I see. The valley's been kind tae ye, or ye've been quick." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Come in out o' the dark, {g:lad|lass}. The wolves sing loudest at this hour, an' I'd no' be out in it wi'out a torch." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "Ye've the look o' somebody who's just climbed off the cart, so here's the first lesson fer nothin': the cold up here is hungrier than the wolves." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another o' the wee folk from Gnomeregan! I've had tae put a step by the counter since yer people came, an' I dinnae mind a bit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Adlin Pridedrift, an' this is the only general store between here an' Kharanos. Every recruit in Coldridge comes through my door sooner or later, mostly after they've found out what they forgot." },
      },
      again = {
        { id = "h_again", text = "What else can I do fer ye, {class}?" },
        { id = "h_again2", text = "Aye, go on, I'm no' busy till the next cart comes in." },
      },
      choices = {
        { text = "What do recruits forget most?", next = "forget" },
        { text = "Pridedrift? I know that name.", next = "kin" },
        { text = "The valley looks quiet enough to me.", next = "quiet" },
        { text = "I'll look over your shelves.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Water, if ye can believe it, in a valley full o' snow. They think they'll eat the snow, an' then they learn it chills ye from the inside an' leaves ye thirstier than before." } },
      choices = {
        { text = "What else should I carry?", next = "carry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "c_default", text = "Bread that keeps, a flint, an' a bag wi' room in it, because Sten Stoutarm will have ye haulin' wolf meat an' Grelin Whitebeard will have ye haulin' worse. A full pack out an' a full pack home, that's the trade." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Then ye'll have met Nori, like as not, for there's Pridedrifts wherever there's a road an' a wagon on it. We're a family o' haulers an' shopkeepers, an' I'm the one who drew the cold end." } },
      choices = { { text = "A cold end, but a busy one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    quiet = {
      lines = { { id = "q_default", text = "It looks quiet from the doorstep, aye. Walk south an' ye'll find troggs diggin' up out o' the ground, an' walk west an' ye'll find Frostmane trolls who'd like the valley back.", fx = { learn = { "troggs", "frostmane" } } } },
      choices = {
        { text = "Which worries you more?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "The troggs, an' I'll tell ye why. A troll wants yer land, which a dwarf can understand, but a trogg just wants tae break whatever's in front o' it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Pridedrift, so I was always goin' tae end up behind a counter or a wagon. Anvilmar's where I landed." } },
    troggs = { { id = "tp_tr", text = "They came up out o' the ground south o' here, an' the mountaineers have been buyin' my torches by the crate ever since." } },
    frostmane = { { id = "tp_fm", text = "The Frostmane hold the caves at the west end o' the valley. They were here before us, an' they've no' forgotten it." } },
    _none = { { id = "tp_none", text = "That's no' on my shelves, friend. Ask Balir Frosthammer outside; he hears what the mountaineers hear." } },
  },
}

-- Alamar Grimm: gnome warlock trainer, in the back of Anvilmar (his Classic post).
P:NPC {
  key = "alamar_grimm", id = TODO_NPC("Alamar Grimm"), name = "Alamar Grimm", gender = "male",
  title = "Warlock Trainer",
  bible = "bibles/missed_dunmorogh.md", role = "trainer", tier = "quest",
  communities = { "coldridge", "gnomeregan" }, temper = { "bitter", "sharp" }, values = { "gnomeregan", "knowledge" },
  notices = { "class", "race" },
  impression = {
    first = "Alamar Grimm stands in the shadows at the back of Anvilmar, a gnome with a scowl too large for him. He looks at every adventurer who passes as though they owed him a city.",
    third = "{name} met Alamar Grimm, the gnome warlock who teaches in the back of Anvilmar.",
  },
  greetings = {
    { id = "g_default", text = "Another adventurer, off to chase wolves while Gnomeregan sits poisoned a day's walk north. Well, say what you came to say." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, one of mine. Come closer and keep your voice down, because the dwarves tolerate our studies approximately as well as they tolerate water in their ale." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and Gnomeregan is precisely as lost as it was when you left. I did check." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, at least. You understand, then, what it is to be a guest in somebody else's mountain and be told to be grateful for it." },
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "I can feel the Light coming off you like heat off a boiler. Stand a little further away, if you please, because it upsets the imp." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I am Alamar Grimm, and I teach the summoning arts to those few with the nerve for them. We are not liked here, so we shall have to be useful instead, which is a far more reliable arrangement." },
        { id = "h_default", text = "Alamar Grimm. I teach warlocks, which you are not, so I can offer you only my opinions, and I have those in considerable quantity." },
      },
      again = {
        { id = "h_again", text = "Was there more? I have calculations waiting, and they're better company than most." },
        { id = "h_again2", text = "Go on, then. I've nowhere to be, which is rather the problem." },
      },
      choices = {
        { text = "What have you got against adventurers?", next = "blame" },
        { text = "The dwarves took your people in.", next = "dwarves" },
        { text = "Why does a warlock teach out here?", next = "post" },
        { text = "Teach me what I need to know.", next = "lessons", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your opinions.", next = "END" },
      },
    },
    blame = {
      lines = { { id = "b_default", text = "Where were they when the troggs came up through our lower levels? They were hunting boars for pocket money, and by the time anyone looked up, Thermaplugg had flooded the city with radiation and four gnomes in five were dead.", fx = { learn = { "gnomeregan" } } } },
      choices = {
        { text = "Nobody outside knew until it was over.", next = "knew" },
        { text = "I'm here now. That counts for something.", next = "now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knew = {
      lines = { { id = "k_default", text = "That is true, and it is the part I cannot forgive us for. We were too proud to ask for help while the Alliance was busy in Kalimdor, and pride turned out to be a poor filter against poison gas." } },
      choices = { { text = "That's a hard thing to admit. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    now = {
      lines = { { id = "n_default", text = "It counts for one adventurer, which is a measurable improvement on none. Go north to the gates when you're stronger, look at the lepers who used to be my neighbours, and then tell me how much it counts." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They did, and they gave us a corner of Ironforge and a great deal of sympathy. What they have not given us is an army, because their king would sooner send his soldiers to help the humans than march them a few miles to our door." } },
      choices = {
        { text = "Magni has troggs and Dark Irons of his own.", next = "magni" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magni = {
      lines = { { id = "m_default", text = "So everyone tells me, and they're probably right, which does not make it any easier to hear. High Tinker Mekkatorque is patient about it, and I've decided that one of us being patient is sufficient." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    post = {
      lines = { { id = "p_default", text = "Because this is where the young ones start, and a young warlock with nobody to teach them is a danger to everyone within thirty yards. I'd rather be in a proper laboratory, but I'd rather still that nobody's apprentice gets eaten." } },
      choices = { { text = "That's almost kind of you. Something else.", next = "BACK" } },
    },
    lessons = {
      lines = {
        { id = "l_gnome", when = { race = "Gnome" }, text = "Then start with the first rule: you command the demon, and never the reverse. I'll want proof you can take what you need from the Frostmane before I trust you with a summoning circle, so listen carefully when I set you a task.", fx = { learn = { "frostmane" } } },
        { id = "l_default", text = "Then start with the first rule: you command the demon, and never the reverse. Everything else I teach you is merely a longer way of saying it." },
      },
      choices = {
        { text = "What happens to those who forget it?", next = "forget" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "They become a cautionary tale, usually a short one. I keep a list, and I'd be obliged if you stayed off it." } },
      choices = { { text = "I'll do my best. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I had a workshop in Gnomeregan with excellent ventilation. Now I have a corner of a dwarven hall and a great many grievances." } },
    gnomeregan = { { id = "tp_gn", text = "It's a day's walk north of here, and it might as well be on the moon. Nobody is coming to take it back for us." } },
    frostmane = { { id = "tp_fm", text = "The trolls in the western caves carry little feathered charms. They're crude things, though there's real power worked into them." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I'm not inclined to speculate without data. Ask a dwarf; they're never short of an answer." } },
  },
}

-- Branstock Khalder: priest trainer, Anvilmar. Easy-going, tells jokes (Sten warns you about them).
P:NPC {
  key = "branstock_khalder", id = TODO_NPC("Branstock Khalder"), name = "Branstock Khalder", gender = "male",
  title = "Priest Trainer",
  bible = "bibles/missed_dunmorogh.md", role = "trainer", tier = "quest",
  communities = { "coldridge" }, temper = { "easygoing", "jovial" }, values = { "faith", "kindness" },
  notices = { "class", "weary" },
  impression = {
    first = "Branstock Khalder is a broad, smiling dwarf in priest's robes who looks as if he's about to tell a joke, and usually is. He teaches the Light to Anvilmar's new priests and frets over the rest.",
    third = "{name} met Branstock Khalder, the priest who teaches the Light in Anvilmar.",
  },
  greetings = {
    { id = "g_default", text = "Light's blessin' on ye, {class}, an' welcome! Come an' warm yerself, for the Light keeps the soul warm but it's the hearth that does the toes." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, there's a face wi' the Light behind it! Come in, {g:lad|lass}, for I've been hopin' ye'd find yer way tae me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' welcome again. Have ye heard the one about the trogg who walked intae a tavern? No? Well, neither did he, for he walked intae the wall." },
  },
  notice = {
    { id = "n_hurt", cat = "weary", when = { resSick = true },
      text = "Sit down before ye fall down, {g:lad|lass}. Ye've the grey look o' somebody the spirit healer sent back in a hurry, an' that wants rest more than prayer." },
    { id = "n_rune", cat = "class", when = { questActive = TODO_QUEST("Hallowed Rune") },
      text = "Ye've my rune in yer hand, I see, so Sten passed it along after all. Good, for I wasnae sure he'd remember between wolves." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_priest", when = { class = "PRIEST" }, text = "I'm Branstock Khalder, an' it falls tae me tae see that Coldridge's young priests learn their prayers before they learn their mistakes. Ye'll find I'm an easy teacher, so long as ye laugh at my jokes." },
        { id = "h_default", text = "Branstock Khalder, priest o' the Holy Light, at yer service. I teach the ones wi' the callin', an' I pray over the ones without it, which keeps me busier than ye'd think." },
      },
      again = {
        { id = "h_again", text = "What else is on yer mind, {class}?" },
        { id = "h_again2", text = "Aye, ask away. A priest who willnae listen is only a dwarf in a dress." },
      },
      choices = {
        { text = "A dwarf of the Light? I'd not expected one.", next = "light" },
        { text = "What troubles Anvilmar's priest?", next = "troggs" },
        { text = "Sten warned me about your jokes.", next = "jokes" },
        { text = "Where does a priest go after Coldridge?", next = "onward", when = { class = "PRIEST" } },
        { text = "Light be with you.", next = "END" },
      },
    },
    light = {
      lines = { { id = "l_default", text = "There's more of us than folk think. We fought beside the humans through the Second War, an' their priests were mendin' our lads as readily as their own, so some of us came home wi' more than scars." } },
      choices = {
        { text = "What did you bring home?", next = "brought" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brought = {
      lines = { { id = "b_default", text = "The notion that a dwarf can be stubborn about kindness as well as about stone. Respect, tenacity an' compassion are the three virtues, an' I'd say we've always had the middle one well in hand." } },
      choices = {
        { text = "And the other two?", next = "virtues" },
        { text = "Something else.", next = "BACK" },
      },
    },
    virtues = {
      lines = { { id = "v_default", text = "Those take work, which is why they need a teacher. Any dwarf will respect a good axe, but respectin' the gnome who cannae lift it is where the Light begins." } },
      choices = { { text = "Well said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troggs = {
      lines = { { id = "t_default", text = "The troggs, {g:lad|lass}, for they've come up thick as weeds south o' here, an' every recruit Grelin sends at them is somebody's bairn. I mend the ones who come back, an' I'd like it tae be all o' them.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "I've been among them. They die easily enough.", next = "die" },
        { text = "Something else.", next = "BACK" },
      },
    },
    die = {
      lines = { { id = "d_default", text = "One does, aye, but they dinnae come in ones, an' that's what catches the young. Keep yer back tae a rock an' yer friends in sight, an' I'll have less work o' ye." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    jokes = {
      lines = { { id = "j_default", text = "Did he, now? That's because Sten Stoutarm has heard them all twice, an' a joke's like a boot, it wears thin wi' use. Why does a mountaineer never get lost in the snow? Because he follows his own grumblin' home." } },
      choices = {
        { text = "That was terrible.", next = "BACK", reply = "Aye, it was, an' ye smiled anyway. That's the whole o' my ministry, right there." },
        { text = "Ha! Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    onward = {
      lines = { { id = "o_default", text = "Through the Coldridge Pass tae Kharanos, when ye've found yer feet. Maxan Anvol teaches there, an' he's my better in the Light an' in most things, though he's never once laughed at the trogg joke." } },
      choices = { { text = "I'll look for him. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I took up the Light after the Second War, when I saw what the human priests could do fer a wounded dwarf. I've been passin' it on ever since." } },
    troggs = { { id = "tp_tr", text = "They've overrun the south o' the valley. I pray fer the recruits who go out, an' I patch the ones who come home." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend, for it's no' in any prayer I know. Ask Sten Stoutarm outside, an' tell him I've a new joke." } },
  },
}

-- Grundel Harkin: armorer, Anvilmar.
P:NPC {
  key = "grundel_harkin", id = TODO_NPC("Grundel Harkin"), name = "Grundel Harkin", gender = "male",
  title = "Armorer",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "gruff" }, values = { "craft", "dutiful" },
  notices = { "kit", "class" },
  impression = {
    first = "Grundel Harkin sells armor in Anvilmar from behind a rack of mail he polishes whether it needs it or not. He judges a recruit by their buckles before he looks at their face.",
    third = "{name} met Grundel Harkin, the armorer of Anvilmar.",
  },
  greetings = {
    { id = "g_default", text = "Hold still an' let me look at ye, {class}. Aye, that's what I thought, ye're wearin' less than a trogg's club deserves." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, so somethin' I sold ye must have held. That's the best advertisement an armorer gets." },
  },
  notice = {
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.25 } },
      text = "By my beard, look at the state o' that gear! It's hangin' off ye in pieces, an' I'll no' have it said ye walked past my shop like that." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye're one who stands in front, by the look o' ye, so ye'll want mail on yer chest an' a shield on yer arm. I can see tae both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grundel Harkin, armorer. I fit the recruits o' Coldridge wi' their first proper mail, an' I've the pleasure o' seein' what the valley does tae it afterward." },
      },
      again = {
        { id = "h_again", text = "Anythin' more? The mail willnae polish itself." },
        { id = "h_again2", text = "Speak up, then, {class}." },
      },
      choices = {
        { text = "What does the valley do to armor?", next = "valley" },
        { text = "What should a recruit buy first?", next = "first" },
        { text = "I manage well enough in cloth.", next = "cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Let me see what you have.", next = "END" },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "The wolves tear the straps, the troggs dent the plates, an' the Frostmane put wee axes through whatever's left. Then the cold gets intae the rivets, an' that's the one that finishes it.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "Which is hardest on the wearer?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "hd_default", text = "The troggs, for they dinnae fight clever, they just keep hittin'. I've had helms come back flat on one side, an' the lad inside none the worse for it, which is the proudest I ever get." } },
      choices = { { text = "A flat helm beats a flat head. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    first = {
      lines = { { id = "f_default", text = "Boots, an' then a shield if ye can carry one. Folk always want the chestpiece first because it looks grand, but ye'll walk every mile o' this valley an' ye'll feel each one in yer feet." } },
      choices = { { text = "Boots it is. Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "c_default", text = "Aye, an' I'll no' argue wi' a spellcaster, for I've seen what ye do tae folk who argue. Still, a robe stops a club about as well as a kind word does, so stand behind somebody in mail." } },
      choices = { { text = "That's the plan. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've fitted mail in Anvilmar since the place was built, an' I've yet tae meet the recruit who bought enough o' it." } },
    troggs = { { id = "tp_tr", text = "They hit hard an' stupid. Good mail an' a thick helm, that's all the advice I have about troggs." } },
    _none = { { id = "tp_none", text = "If ye cannae wear it, I dinnae know it. Try Adlin Pridedrift, he talks tae everybody." } },
  },
}

-- Rybrad Coldbank: weaponsmith, Anvilmar.
P:NPC {
  key = "rybrad_coldbank", id = TODO_NPC("Rybrad Coldbank"), name = "Rybrad Coldbank", gender = "male",
  title = "Weaponsmith",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "hearty" }, values = { "craft", "strength" },
  notices = { "class", "kit" },
  impression = {
    first = "Rybrad Coldbank sells axes, hammers and blades in Anvilmar, and he hands each one over as if he were lending out a child. He talks loudly, laughs louder, and tests every edge on his own thumbnail.",
    third = "{name} met Rybrad Coldbank, the weaponsmith of Anvilmar.",
  },
  greetings = {
    { id = "g_default", text = "Ho there, {class}! Ye'll no' get far in Coldridge wi' empty hands, so come an' fill them." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Now there's a pair o' shoulders made fer swingin' somethin' heavy! Come an' heft a few, {g:lad|lass}, an' we'll find the one that fits." },
    { id = "g_back", when = { metBefore = true }, text = "Still got all yer fingers? Then ye've been holdin' it by the right end, an' I'm proud o' ye." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, is it? I've nae guns on this rack, mind, but ye'll want an axe fer when the beast gets closer than the bullet." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rybrad Coldbank, an' these are the first weapons most o' Ironforge's soldiers ever paid fer. They're plain, an' they're honest, an' they'll outlast yer first three mistakes." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I could talk steel till the thaw." },
        { id = "h_again2", text = "Go on, then, I'm listenin'." },
      },
      choices = {
        { text = "Axe or hammer, for a beginner?", next = "choice" },
        { text = "Plain weapons, you say?", next = "plain" },
        { text = "I prefer a staff and a spell.", next = "staff", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Show me the rack.", next = "END" },
      },
    },
    choice = {
      lines = { { id = "c_default", text = "It depends what ye're hittin'. An axe is fer wolves an' trolls an' anythin' that bleeds, an' a hammer is fer troggs, because there's nae point cuttin' somethin' wi' a skull like a boulder." } },
      choices = {
        { text = "And a sword?", next = "sword" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sword = {
      lines = { { id = "s_default", text = "A sword's a fine thing, an' the humans swear by them, so I keep a few fer the ones who've been tae Stormwind an' come back wi' notions. I'll sell ye one gladly, but I'll no' pretend it's a dwarf's weapon." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    plain = {
      lines = { { id = "p_default", text = "Plain on purpose, aye. A recruit wi' a fancy blade spends the fight worryin' about the blade, an' the masterwork can wait fer the Great Forge an' a heavier purse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    staff = {
      lines = { { id = "st_default", text = "Then buy a dagger anyway, {g:lad|lass}, an' keep it in yer boot. Sooner or later somethin' gets close enough that there's nae time fer wavin' yer hands about." } },
      choices = { { text = "A dagger in the boot. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell a recruit their first axe, an' wi' luck they come back in a year tae tell me what it killed." } },
    troggs = { { id = "tp_tr", text = "Use a hammer on a trogg. Ye'll only blunt a good edge on that skull." } },
    _none = { { id = "tp_none", text = "Ye've wandered off the edge o' what I know, friend, which is weapons. Ask Grundel if it's armor, an' Adlin if it's anythin' else." } },
  },
}

-- The mortar team and riflemen at the mountaineers' camp east of the Coldridge Pass, with its shooting range.
-- Angus: mortar team, with Shorty.
P:NPC {
  key = "mortar_angus", id = TODO_NPC("Angus"), name = "Angus", gender = "male",
  title = "Dwarven Mortar Team",
  bible = "bibles/missed_dunmorogh.md", role = "soldier", tier = "service",
  communities = { "dunmorogh" }, temper = { "boisterous" }, values = { "comrades", "gunpowder" },
  notices = { "craft" },
  impression = {
    first = "Angus is the half of the mortar team who does the aiming, and he does it by squinting, licking a finger and hoping. He's cheerfully deaf in one ear and talks as if everyone else were too.",
    third = "{name} met Angus of the dwarven mortar team camped east of the Coldridge Pass.",
  },
  greetings = {
    { id = "g_default", text = "Mind where ye stand, {class}! Anythin' past yon dummies is the range, an' the shells cannae tell a friend from a target." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' no' a scorch on ye. Shorty owes me a pint, then." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Ye've powder under yer fingernails, same as me. An engineer, are ye? Then ye'll appreciate a good loud bang when ye hear one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Angus, o' the mortar team. Shorty loads her an' I lay her on the target, an' between the pair of us we can put a shell on a trogg's hat from the far side o' a hill." },
      },
      again = {
        { id = "h_again", text = "Eh? Say it again, an' louder this time." },
        { id = "h_again2", text = "What else, {class}? We're due another volley soon." },
      },
      choices = {
        { text = "What are you shooting at out here?", next = "range" },
        { text = "How do you aim that thing?", next = "aim" },
        { text = "Keep your powder dry.", next = "END" },
      },
    },
    range = {
      lines = { { id = "r_default", text = "Dummies, fer now, till the troggs or the Frostmane give us somethin' livelier. A mortar crew that doesnae practise is only two dwarves standin' next tae a pipe." } },
      choices = {
        { text = "Your spotter looks a little singed.", next = "klemmy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    klemmy = {
      lines = { { id = "k_default", text = "Klemmy? Aye, well, he will stand near the dummies, an' a shell lands where it lands. It's only the practice charge, so it knocks him down an' he gets up swearin', which is how we know he's fine." } },
      choices = { { text = "You're aiming at him, aren't you?", next = "BACK", reply = "I would never. Shorty might, but I only aim where Shorty tells me the wind is." } },
    },
    aim = {
      lines = { { id = "a_default", text = "Ye count the paces, ye judge the wind off the snow, an' ye set the tube by the notches Shorty filed in her. After that it's mostly a matter o' faith." } },
      choices = { { text = "Faith and gunpowder. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Shorty an' I have crewed the same mortar fer years. He's the better loader, an' I'm the better lookin'." } },
    troggs = { { id = "tp_tr", text = "They bunch up, troggs do, an' there's nothin' a mortar crew likes better than a target that bunches up." } },
    _none = { { id = "tp_none", text = "Eh? I didnae catch that, an' I doubt I'd know it if I had. Ask one o' the riflemen, their ears still work." } },
  },
}

-- Shorty: mortar team, with Angus.
P:NPC {
  key = "mortar_shorty", id = TODO_NPC("Shorty"), name = "Shorty", gender = "male",
  title = "Dwarven Mortar Team",
  bible = "bibles/missed_dunmorogh.md", role = "soldier", tier = "service",
  communities = { "dunmorogh" }, temper = { "dry", "sly" }, values = { "comrades", "gunpowder" },
  notices = { "race" },
  impression = {
    first = "Shorty is not noticeably shorter than any other dwarf, and he'll tell you the name is Angus's idea of wit. He loads the mortar with the care of a baker and the grin of somebody planning something.",
    third = "{name} met Shorty of the dwarven mortar team camped east of the Coldridge Pass.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon, {class}. Dinnae touch the shells, dinnae smoke near the powder, an' we'll get along grand." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Stand upwind this time, the smoke got ye proper on yer last visit." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Before ye ask, no, ye cannae improve her. The last gnome who improved a mortar o' mine sent a shell tae Loch Modan." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "They call me Shorty, an' that's Angus's doin', for I've a full inch on him. I load the mortar an' he aims her, which means when we miss it's his fault." },
      },
      again = {
        { id = "h_again", text = "Aye? Quick, now, before Angus gets bored an' fires wi'out me." },
        { id = "h_again2", text = "What else can I tell ye?" },
      },
      choices = {
        { text = "What goes into a mortar shell?", next = "shell" },
        { text = "You keep glancing at the spotter.", next = "klemmy" },
        { text = "Carry on, Shorty.", next = "END" },
      },
    },
    shell = {
      lines = { { id = "s_default", text = "Black powder, a fuse cut tae the right length, an' an iron case tae hold the argument together. Cut the fuse short an' it bursts in the air, an' cut it long an' the troggs have time tae throw it back." } },
      choices = {
        { text = "Has a trogg ever thrown one back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "Once, an' I'll give the brute credit, it had a good arm. Angus has been tellin' the tale ever since as though he caught it in his teeth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    klemmy = {
      lines = { { id = "k_default", text = "Do I? Well, Klemmy's the spotter, an' it's his job tae tell us where the shell landed. I find he reports it much more exactly when it lands near him." } },
      choices = { { text = "That's a hard way to treat a friend.", next = "BACK", reply = "He put snow in my boots last winter, so I'd say we're about even. It's a wee practice charge, an' he bounces." } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've loaded fer Angus longer than I care tae count, an' I've still got both eyebrows, which says somethin' fer my method." } },
    troggs = { { id = "tp_tr", text = "Troggs are what the mortar was made fer. They're thick-skulled, slow tae scatter, an' there's always more." } },
    _none = { { id = "tp_none", text = "I only know powder an' fuses, friend. Ask Middlecamp, he reads when he thinks naebody's lookin'." } },
  },
}

-- Spotter Klemmy: spots for the mortar team and sometimes catches a practice shell.
P:NPC {
  key = "spotter_klemmy", id = TODO_NPC("Spotter Klemmy"), name = "Spotter Klemmy", gender = "male",
  bible = "bibles/missed_dunmorogh.md", role = "soldier", tier = "service",
  communities = { "dunmorogh" }, temper = { "long-suffering" }, values = { "dutiful", "comrades" },
  notices = { "class" },
  impression = {
    first = "Spotter Klemmy has a spyglass in his hand, soot on his beard and the patient look of a dwarf who knows exactly what his friends think is funny. He flinches a little whenever the mortar coughs.",
    third = "{name} met Spotter Klemmy, who calls the shots for the mortar team east of the Coldridge Pass.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. If ye hear a whistle gettin' louder, dinnae look up, just run." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come back tae the range? Ye're braver than ye look, or ye've no' been here durin' a volley." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye've a marksman's eyes, {class}. I dinnae suppose ye'd like a job spottin' fer a mortar team? Nae, I thought not." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Spotter Klemmy. I stand where I can see the target an' tell Angus an' Shorty how far off they were, an' some days they're off by exactly the distance tae where I'm standin'." },
      },
      again = {
        { id = "h_again", text = "Aye, what else? Keep an ear out while we talk." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "They hit you on purpose, you know.", next = "purpose" },
        { text = "What does a spotter watch for?", next = "watch" },
        { text = "Keep your head down, Klemmy.", next = "END" },
      },
    },
    purpose = {
      lines = { { id = "p_default", text = "Oh, I know it fine. It's a practice charge, all smoke an' nae iron, an' it does nothin' worse than sit me down in the snow, but I've had tae give up on keepin' my beard clean." } },
      choices = {
        { text = "Why put up with it?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because when it matters they've never once dropped a shell short, an' I've stood closer tae the enemy than this wi' those two firin' over my head. A crew that jokes wi' ye is a crew that'll no' leave ye." } },
      choices = { { text = "That's worth a sooty beard. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    watch = {
      lines = { { id = "wa_default", text = "Where the shell lands, an' which way the smoke leans after, for that tells ye the wind better than any flag. Out here I watch the pass as well, in case the troggs in Coldridge take a notion tae come through it.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've the best eyes in the company, so they made me spotter. It was meant as a reward, I'm told." } },
    troggs = { { id = "tp_tr", text = "They're thick in Coldridge, past the tunnel. If they come through, I'll be the first tae see it." } },
    _none = { { id = "tp_none", text = "I couldnae say, I only know what I can see through the glass. Try the lads in Kharanos up the road." } },
  },
}

-- Rifleman Middlecamp: the careful shot; contest with Wheeler at the range.
P:NPC {
  key = "rifleman_middlecamp", id = TODO_NPC("Rifleman Middlecamp"), name = "Rifleman Middlecamp", gender = "male",
  bible = "bibles/missed_dunmorogh.md", role = "soldier", tier = "service",
  communities = { "dunmorogh" }, temper = { "serious", "prickly" }, values = { "skill", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Rifleman Middlecamp cleans his rifle the way other dwarves say their prayers. He takes his shooting seriously, and he takes Rifleman Wheeler's laughing about it more seriously still.",
    third = "{name} met Rifleman Middlecamp at the mountaineers' shooting range east of the Coldridge Pass.",
  },
  greetings = {
    { id = "g_default", text = "Keep behind the firin' line, {class}, an' keep yer voice down while a dwarf is takin' aim." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. If Wheeler's told ye he won yesterday's shoot, he's a liar wi' a loud laugh." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "That's a shooter's stance ye have. Tell me honest, {class}, do ye squeeze the trigger or pull it? Wheeler pulls, an' it's a disgrace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rifleman Middlecamp, Ironforge mountaineers. We hold this camp tae watch the Coldridge Pass, an' when the pass is quiet we shoot, because a rifleman who's out o' practice is only a dwarf wi' a heavy stick." },
      },
      again = {
        { id = "h_again", text = "Aye? Be brief, I'm next on the line." },
        { id = "h_again2", text = "What else, {class}?" },
      },
      choices = {
        { text = "What's this contest with Wheeler?", next = "contest" },
        { text = "What makes a good shot?", next = "shot" },
        { text = "Good shooting, rifleman.", next = "END" },
      },
    },
    contest = {
      lines = { { id = "c_default", text = "Ten rounds each at the dummies, an' the loser cleans both rifles. He shoots fast an' I shoot true, an' somehow the daft badger hits as often as I do, which I cannae account fer." } },
      choices = {
        { text = "Perhaps he's simply good.", next = "good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = { { id = "g_default", text = "Dinnae say that where he can hear ye, his head barely fits his helm as it is. Aye, he's good, an' I'd want nae other rifle beside mine in a fight, but I'll shave my beard before I tell him so." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shot = {
      lines = { { id = "s_default", text = "Breathin', mostly. Ye let half the breath out, ye hold the rest, an' ye squeeze as though the trigger were made o' eggshell, an' the cold will still take yer shot low if ye forget tae allow fer it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've carried a rifle fer Ironforge since I was old enough tae lift one, an' I've cleaned it every night since." } },
    troggs = { { id = "tp_tr", text = "Aim fer the body on a trogg. The skull's so thick I've seen a ball skip off it." } },
    _none = { { id = "tp_none", text = "That's nae business o' a rifleman's. Ask in Kharanos." } },
  },
}

-- Rifleman Wheeler: the quick, laughing shot.
P:NPC {
  key = "rifleman_wheeler", id = TODO_NPC("Rifleman Wheeler"), name = "Rifleman Wheeler", gender = "male",
  bible = "bibles/missed_dunmorogh.md", role = "soldier", tier = "service",
  communities = { "dunmorogh" }, temper = { "cocky", "merry" }, values = { "skill", "comrades" },
  notices = { "class", "drink" },
  impression = {
    first = "Rifleman Wheeler fires quickly, laughs loudly and flexes after a good shot as if the whole of Dun Morogh were watching. Nothing pleases him more than the look on Middlecamp's face.",
    third = "{name} met Rifleman Wheeler at the mountaineers' shooting range east of the Coldridge Pass.",
  },
  greetings = {
    { id = "g_default", text = "Ha! Come tae watch the finest shot in Dun Morogh, have ye? Stand there, {class}, ye'll get a grand view o' Middlecamp losin'." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are! I've won twice since ye left, an' Middlecamp's sulkin' behind yon tent." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then ye know there's nae feelin' like a clean hit at a hundred paces. Dinnae tell me yer best shot, I'd only have tae beat it." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've been at the Thunderbrew, {g:lad|lass}, I can smell it from here. Stay off the range, for the dummies have suffered enough." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rifleman Wheeler, an' if ye need somethin' shot, I'm the dwarf fer it. We mind the Coldridge Pass from this camp, an' between watches I take Middlecamp's pride off him ten rounds at a time." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've a minute before my turn." },
        { id = "h_again2", text = "Aye, go on!" },
      },
      choices = {
        { text = "Middlecamp says you pull your shots.", next = "pull" },
        { text = "Is the pass really worth a camp?", next = "pass" },
        { text = "Shoot straight, Wheeler.", next = "END" },
      },
    },
    pull = {
      lines = { { id = "p_default", text = "He would say that! He takes so long over every shot that the dummy's grown a beard by the time he fires. I see it, I shoot it, an' it falls over, an' I dinnae see what else there is tae the business." } },
      choices = {
        { text = "He's the better shot on a slow target.", next = "slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slow = {
      lines = { { id = "s_default", text = "Aye, he is, an' that's why the captain pairs us. He takes the one that's far off an' standin' still, an' I take the three that are close an' runnin', an' naethin' has got past the pair of us yet." } },
      choices = { { text = "So you do respect him. Something else.", next = "BACK", reply = "Wheesht! Say it quieter, or I'll never hear the end o' it." } },
    },
    pass = {
      lines = { { id = "pa_default", text = "It's the only road out o' Coldridge, an' Coldridge is crawlin' wi' troggs an' Frostmane. If either lot came through that tunnel, the next thing they'd reach is Kharanos, so here we sit.", fx = { learn = { "troggs", "frostmane" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I joined the mountaineers fer the rifle, an' I stayed fer the look on Middlecamp's face." } },
    troggs = { { id = "tp_tr", text = "Slow, ugly an' wide. I could hit a trogg wi' my eyes shut, an' I've a mind tae try." } },
    frostmane = { { id = "tp_fm", text = "Trolls are quicker than troggs an' they throw things. I like them better as targets, if I'm honest." } },
    _none = { { id = "tp_none", text = "Ye've got me there, friend. If I cannae shoot it, I've likely no' thought about it." } },
  },
}
