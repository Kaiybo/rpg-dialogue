-- Ironforge folk the first passes missed, part one: the Quikswitch apprentices at Springspindle's Gadgets,
-- Stonebrow's Clothier, Timberline Arms, the Hall of Arms, the Library, the Forlorn Cavern's gnome warlock,
-- Lomac Gearstrip, and the armour and robe sellers of the Military Ward, the Mystic Ward and the Commons.
-- Voices: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jemma Quikswitch: apprentice engineer at Springspindle's Gadgets, Tinker Town. (Forever: Data Hoarders.)
P:NPC {
  key = "if_jemma", id = TODO_NPC("Jemma Quikswitch"), name = "Jemma Quikswitch", title = "Apprentice Engineer", gender = "female",
  bible = "bibles/missed_b.md", role = "worker", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "eager", "exact" }, values = { "knowledge", "family" },
  notices = { "craft", "gnome" },
  impression = {
    first = "Jemma Quikswitch is an apprentice at Springspindle's Gadgets, and she writes down every measurement twice in a notebook that's nearly full. She talks about Gnomeregan's lost records the way other people talk about lost relatives.",
    third = "{name} met Jemma Quikswitch, an apprentice engineer at Springspindle's Gadgets in Tinker Town.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! Mind the bench, please, because I've forty-one gear teeth laid out in order and I only want to count them the once." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and I've filled eleven more pages since you left, so that's progress of a kind." },
    { id = "g_data", when = { questActive = TODO_QUEST("Data Hoarders") }, text = "You're here about the data, aren't you? Come in, come in, and please tell me you were careful with it." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You've got solder burns on your fingers, the same as mine! Master Springspindle says they're the only diploma that counts." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another one of us, and all in one piece. I keep a count of the gnomes I see in Tinker Town each day, and it's never as many as I'd like." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jemma Quikswitch, apprentice engineer, and that's my sister Trixie making sparks at the other bench. Master Springspindle teaches us both, though he says I measure too much and she doesn't measure at all." },
        { id = "h_data", tags = { "news" }, when = { questActive = TODO_QUEST("Data Hoarders") },
          text = "Every punch card and schematic that comes out of Gnomeregan is something we don't have to invent twice. Show me what you've brought, and I'll start a fresh page for it." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I've a list somewhere of things worth telling." },
        { id = "h_again2", text = "Go on, I can count and listen at the same time, more or less." },
      },
      choices = {
        { text = "What's in the notebook?", next = "notebook" },
        { text = "You and your sister work very differently.", next = "trixie" },
        { text = "What is Springspindle like to learn from?", next = "master" },
        { text = "I'm an engineer myself.", next = "engineer", when = { profession = "Engineering" } },
        { text = "I'll leave you to your counting.", next = "END" },
      },
    },
    notebook = {
      lines = { { id = "nb_default", text = "Everything I can remember of the workshops back home, and everything the other refugees remember when I ask them nicely. The libraries are still down there with the troggs and the radiation, so somebody has to write it out again.", fx = { learn = { "gnomeregan_records" } } } },
      choices = {
        { text = "How much have you saved so far?", next = "notebook2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notebook2 = {
      lines = { { id = "nb2_default", text = "Three hundred and twelve pages, of which I trust about two hundred, because people misremember tolerances something awful. I mark the doubtful ones with a little cog in the margin and test them when the bench is free." } },
      choices = {
        { text = "And when Gnomeregan is retaken?", next = "notebook3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notebook3 = {
      lines = { { id = "nb3_default", text = "Then I'll walk straight to the archive on the third level and check every page against the originals. I expect to be wrong about a great deal, and I can't tell you how much I'm looking forward to finding out." } },
      choices = { { text = "I hope you get the chance. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trixie = {
      lines = { { id = "tx_default", text = "Trixie builds a thing first and finds out afterwards why it caught fire, and I'd rather know why before I build it. Between us we make one very good engineer, which is what Mother always said." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = { { id = "ms_default", text = "He's patient about mistakes and impatient about everything else, and he's quite certain the wheel will be obsolete within his lifetime. I've stopped arguing with him about it, because he keeps drawing me diagrams." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      lines = { { id = "en_default", text = "Then you'll know how it feels to lose a schematic you were halfway through! If you ever come across gnomish plans out in the world, read the tolerances twice before you trust them, because the copies are never as good as ours were." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was an apprentice in Gnomeregan too, for exactly nineteen days before the evacuation, so I've had to start again here." } },
    gnomeregan_records = { { id = "tp_rec", text = "The archives are still down there, and every month they sit in that air does them no good at all." } },
    _none = { { id = "tp_none", text = "I haven't a page on that, I'm afraid. Master Springspindle might know, if you catch him between lectures." } },
  },
}

-- Trixie Quikswitch: apprentice engineer at Springspindle's Gadgets; Jemma's sister.
P:NPC {
  key = "if_trixie", id = TODO_NPC("Trixie Quikswitch"), name = "Trixie Quikswitch", title = "Apprentice Engineer", gender = "female",
  bible = "bibles/missed_b.md", role = "worker", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "cheerful", "reckless" }, values = { "invention", "family" },
  notices = { "craft" },
  impression = {
    first = "Trixie Quikswitch works at the scorched end of the bench at Springspindle's Gadgets, with her goggles pushed up and one eyebrow shorter than the other. She seems delighted by every bang, including the ones she didn't plan.",
    third = "{name} met Trixie Quikswitch, the louder of the two apprentices at Springspindle's Gadgets.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Stand a little to the left, would you, because I'm about sixty percent sure which way this one goes off." },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, it's you, and you've still got both eyebrows, so you can't have been standing here yesterday." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Quick, tell me honestly, how many of your first ten devices exploded? Mine was nine, and the tenth only smoked." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Trixie Quikswitch, apprentice engineer, and that tidy person over there is my sister Jemma. She writes things down and I set things off, and Master Springspindle says he can't decide which of us worries him more." },
      },
      again = {
        { id = "h_again", text = "What else? The fuse is a long one, so we've time." },
        { id = "h_again2", text = "Ask away, I'm only waiting for this to cool." },
      },
      choices = {
        { text = "What are you building?", next = "building" },
        { text = "Your eyebrow has seen better days.", next = "eyebrow" },
        { text = "I'll give you some room.", next = "END" },
      },
    },
    building = {
      lines = { { id = "b_default", text = "It's meant to be a self-winding spring box, so a mechanical squirrel can run all day without anyone turning the key. So far it winds itself beautifully for eight seconds and then unwinds itself all over the ceiling." } },
      choices = {
        { text = "What does Jemma say about it?", next = "building2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    building2 = {
      lines = { { id = "b2_default", text = "She says the spring is four percent too strong for the casing, and she's probably right, because she usually is. I'd just rather find it out with a bang than a sum, and it's my half of the bench." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    eyebrow = {
      lines = { { id = "e_default", text = "That was Tuesday's prototype, and it taught me a great deal about venting. Back in Gnomeregan they'd have called it a learning opportunity and given me a bigger workshop, and I do miss that attitude." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Jemma and I came out of Gnomeregan together, with one bag between us and most of it her notebooks." } },
    _none = { { id = "tp_none", text = "No idea! Ask Jemma, she's probably got it written down under a heading." } },
  },
}

-- Jormund Stonebrow: tailoring trainer, Stonebrow's Clothier, north side of the Great Forge.
P:NPC {
  key = "if_jormund", id = TODO_NPC("Jormund Stonebrow"), name = "Jormund Stonebrow", title = "Tailoring Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "proud", "particular" }, values = { "craft", "thrift" },
  notices = { "craft", "kit" },
  impression = {
    first = "Jormund Stonebrow runs Stonebrow's Clothier beside the Great Forge, and he has thick smith's fingers that somehow thread a needle on the first try. He looks over every visitor's seams before he looks at their face.",
    third = "{name} met Jormund Stonebrow, the tailoring trainer at Stonebrow's Clothier in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Stonebrow's, {g:lad|lass}. Mind ye don't lean on the bolts o' silk, for the soot off the Forge gets intae everything as it is." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Good, for that hem o' yours has been botherin' me since ye left." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Ye've a tailor's callus on that thumb, I see. Sit down, then, an' we'll find out what ye've been taught wrong." },
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe-wearer, an' a robe that wants lettin' out at the shoulder besides. Whoever cut that had never met ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jormund Stonebrow, an' I teach tailorin' tae any who'll sit still for it. Folk think dwarves only work iron an' stone, but somebody has tae make the apron the smith wears, an' in Ironforge that somebody is me." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've a sleeve half set." },
        { id = "h_again2", text = "Speak up, {g:lad|lass}, the Forge is loud today." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "A clothier beside the Great Forge seems an odd choice.", next = "forge" },
        { text = "Who else works in the shop?", next = "shop" },
        { text = "Good day, Jormund.", next = "END" },
      },
    },
    forge = {
      lines = { { id = "f_default", text = "It's the warmest spot in the mountain, an' cold fingers drop stitches. I'll grant ye the soot's a curse, but every smith on the ring needs gloves an' an apron, so my customers walk past the door a dozen times a day." } },
      choices = {
        { text = "What do smiths ask you for most?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "f2_default", text = "Somethin' that won't catch fire, an' I tell them every time that cloth burns an' they ought tae stand further back. Then I double the linen at the cuffs anyway, because a dwarf with a burnt wrist blames his tailor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "s_default", text = "Poranna Snowbraid keeps the thread an' the dyes, an' she'll no' let ye leave without the right needle. Young Uthrar Threx is my apprentice, an' the gnome in the fine waistcoat is Outfitter Eric, who sells the fancy patterns I've nae patience for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father was a mason an' his father before him, an' I'm the first Stonebrow tae pick up a needle. I've never once regretted it." } },
    _none = { { id = "tp_none", text = "That's no' cloth, so it's no' my business. Ask about the ring; the smiths hear everything." } },
  },
}

-- Kelomir Ironhand: maces and staves at Timberline Arms, Military Ward.
P:NPC {
  key = "if_kelomir", id = TODO_NPC("Kelomir Ironhand"), name = "Kelomir Ironhand", title = "Maces & Staves", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "blunt", "hearty" }, values = { "craft", "honesty" },
  notices = { "class" },
  impression = {
    first = "Kelomir Ironhand sells maces and staves at Timberline Arms, and he tests the balance of each one on his own palm before he hands it over. He has firm opinions about swords, none of them kind.",
    third = "{name} met Kelomir Ironhand, who sells maces and staves at Timberline Arms in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Maces an' staves, friend, on this side o' the shop. If it's somethin' wi' an edge ye're after, Thalgus has those, an' ye have my sympathy." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' I hope it's because the last one served ye well." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One o' the Light's own, eh? Then ye'll want a mace, for yer sort have always known a blessin' lands harder wi' some weight behind it." },
    { id = "n_staff", cat = "class", when = { class = { "MAGE", "WARLOCK", "DRUID" } },
      text = "Ye'll be wantin' a staff, by the look o' ye. I'll no' pretend tae know what ye do wi' it, but I know good wood." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kelomir Ironhand, an' I sell the honest weapons in Timberline Arms. A mace doesnae go dull, a staff doesnae rust, an' neither one needs a wee leather coat tae sleep in." },
      },
      again = {
        { id = "h_again", text = "Aye, what else?" },
        { id = "h_again2", text = "Go on, I'm only oilin' hafts." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You don't think much of swords.", next = "swords" },
        { text = "Where does a dwarf get staff wood?", next = "wood" },
        { text = "Good day to you.", next = "END" },
      },
    },
    swords = {
      lines = { { id = "s_default", text = "A sword is a fine thing until it meets plate, an' then it's a long thin regret. Thalgus an' I have had this argument every day for years, an' he's yet tae bring me a blade that'll crack a trogg's skull through its own thick head." } },
      choices = {
        { text = "Who's winning the argument?", next = "swords2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swords2 = {
      lines = { { id = "s2_default", text = "I am, though he'd tell ye different. Ask the weapon masters upstairs if ye want a fair judge, for Buliwyf favours his axes an' wee Bixi her daggers, an' neither will side wi' a sword." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wood = {
      lines = { { id = "w_default", text = "No' from Dun Morogh, I'll tell ye that, for our pines are too soft an' too full o' sap. The good staves are ash an' oak carted up from Elwynn, an' I turn away one length in three for a knot I don't like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ironhand by name an' by trade. I swung a hammer in the militia before I sold them." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. If it cannae be solved wi' a mace, it's beyond my learnin'." } },
  },
}

-- Thalgus Thunderfist: weapon merchant at Timberline Arms, Military Ward.
P:NPC {
  key = "if_thalgus", id = TODO_NPC("Thalgus Thunderfist"), name = "Thalgus Thunderfist", title = "Weapon Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "loud", "good-humoured" }, values = { "craft", "pride" },
  notices = { "class" },
  impression = {
    first = "Thalgus Thunderfist sells blades and axes at Timberline Arms in a voice that carries to the Hall of Arms. He wipes down every edge with a rag while he talks, and never seems to cut himself.",
    third = "{name} met Thalgus Thunderfist, the weapon merchant at Timberline Arms in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in! Swords, axes an' anythin' else wi' a proper edge, an' all o' it Ironforge steel." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! Has it kept its edge, or have ye been choppin' firewood wi' it?" },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Now there's a customer who knows what a blade is for. Come an' put yer hand on a few, warrior." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye've an eye on the short blades, I notice. They're on the left, an' I count them every evenin', nae offence meant." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thalgus Thunderfist, an' this is the sharp half o' Timberline Arms. Kelomir over there sells the clubs an' walkin' sticks, an' he'll tell ye they're weapons if ye let him." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Aye, go on, I can talk an' polish." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "What makes Ironforge steel worth the price?", next = "steel" },
        { text = "Kelomir says a mace beats a sword.", next = "kelomir" },
        { text = "Which blade would you give a warrior?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    steel = {
      lines = { { id = "st_default", text = "It's the Great Forge, plain an' simple. There's nae other fire in the world that burns so hot an' so even, an' a blade drawn from it holds an edge long after a Stormwind sword has gone tae butter." } },
      choices = {
        { text = "Who forges for you?", next = "steel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steel2 = {
      lines = { { id = "st2_default", text = "The smiths on the ring, an' I've bought from the same four families since I opened. I'll no' sell a blade unless I've shaken the hand that made it, for a smith ye know will tell ye the truth about a bad pour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kelomir = {
      lines = { { id = "k_default", text = "Ha! Kelomir would say that about a table leg. He's a good dwarf an' the best judge o' wood in the ward, but I've never yet seen anyone shave wi' a mace." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "Whichever one ye stop noticin' after an hour's swingin', for a blade that tires yer arm will get ye killed however bonny it looks. Take a few down an' try them, an' then go ask Kelv Sternhammer in the Hall tae show ye what ye're doin' wrong." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Thunderfists have sold arms in this ward since before the Second War, an' we armed half the lads who marched tae it." } },
    _none = { { id = "tp_none", text = "Couldnae say, friend. I know edges, an' the rest I leave tae cleverer beards." } },
  },
}

-- Kelv Sternhammer: warrior trainer, Hall of Arms. Classic: The Islander (30), A Troubled Spirit (50).
P:NPC {
  key = "if_kelv", id = TODO_NPC("Kelv Sternhammer"), name = "Kelv Sternhammer", title = "Warrior Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "stern", "fair" }, values = { "discipline", "duty" },
  notices = { "class", "greenness" },
  impression = {
    first = "Kelv Sternhammer drills warriors in the Hall of Arms with his arms folded and his voice level, and nobody in the hall seems to want to disappoint him. He corrects a stance with the toe of his boot.",
    third = "{name} met Kelv Sternhammer, a warrior trainer in Ironforge's Hall of Arms.",
  },
  greetings = {
    { id = "g_default", text = "Ye're standin' in a drill hall, so stand like ye mean it. What brings ye tae the Hall of Arms?" },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Feet apart an' shoulders down, warrior. Good, now tell me what ye've come tae learn." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the hall, I see. Let's find out whether ye practised or only meant tae." },
    { id = "g_islander", when = { questActive = TODO_QUEST("The Islander") }, text = "Ye've no' sailed for Fray Island yet? Klannoc doesnae wait on anyone, {g:lad|lass}, so don't keep him." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { class = "WARRIOR", maxLevel = 12 },
      text = "Ye grip that like ye're afraid it'll bite. Loosen the hand an' tighten the wrist, an' come back when it feels wrong the other way." },
    { id = "n_gnome", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome in mail! Bilban'll be pleased, for he's forever tellin' me the best warriors in this hall come up tae my belt." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kelv Sternhammer, an' I train warriors for Ironforge. I'll teach any soldier o' the Alliance who'll sweat for it, but I'll no' flatter ye, for flattery never turned a blade." },
        { id = "h_notwar", when = { ["not"] = { class = "WARRIOR" } },
          text = "Kelv Sternhammer, warrior trainer. Ye're no' one o' mine, by the look o' ye, but ye're welcome tae watch the drills so long as ye keep off the sand." },
      },
      again = {
        { id = "h_again", text = "What else? The recruits are slackin' while I talk." },
        { id = "h_again2", text = "Go on, then, an' keep it short." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What do you teach a recruit first?", next = "first" },
        { text = "Your recruits look worn out.", next = "recruits" },
        { text = "Is there a harder test than the drill hall?", next = "islander", when = { class = "WARRIOR", minLevel = 30 } },
        { text = "You look troubled, trainer.", next = "spirit", when = { class = "WARRIOR", minLevel = 50 } },
        { text = "I'll leave you to your drills.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "How tae stand, an' then how tae take a blow, an' no' a word about hittin' anythin' for the first week. A warrior who cannae keep his feet is only a heavy thing for his friends tae carry home." } },
      choices = {
        { text = "And after the first week?", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "Then the shield, for it's the shield that keeps the dwarf beside ye alive, an' that's the whole o' the job. The axe comes last, an' by then they've wanted it so long they treat it wi' some respect." } },
      choices = {
        { text = "The warrior stands for the others, then.", next = "first3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first3 = {
      lines = { { id = "f3_default", text = "Aye, that's it said plainly. The priest heals an' the mage burns, an' neither does it for long unless somebody stubborn is standin' in front o' them, an' stubborn is somethin' Ironforge has never run short o'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recruits = {
      lines = { { id = "r_default", text = "Good, they should be. The troggs under Dun Morogh don't rest an' the Dark Irons don't rest, so I'd sooner these lads were tired in my hall than fresh an' dead in the Searing Gorge." } },
      choices = {
        { text = "Do many of them wash out?", next = "recruits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits2 = {
      lines = { { id = "r2_default", text = "Fewer than ye'd think, for a dwarf will bleed before he'll quit in front o' his cousins. The ones who go usually find they've better hands for the forge or the rifle, an' there's nae shame in either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    islander = {
      lines = { { id = "i_default", text = "There is, an' ye're near ready for it. Off the coast by Ratchet, in the Barrens, there's a wee rock called Fray Island where a man named Klannoc Macleod tests warriors against all comers, an' I send him the ones I think will come back.", fx = { learn = { "fray_island" } } } },
      choices = { { text = "Then I'll look for his island. Something else.", next = "BACK" } },
    },
    spirit = {
      lines = { { id = "sp_default", text = "I've had word of a warrior's ghost that cannae rest, down where the Swamp of Sorrows meets the Blasted Lands. It's one o' the other side's dead, an orc, but a restless warrior troubles me whatever banner he fell under." } },
      choices = { { text = "A warrior's rest is worth the road. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a shield for Ironforge through the Second War, an' I've been teachin' others tae carry one ever since." } },
    fray_island = { { id = "tp_fray", text = "Klannoc Macleod keeps it, off Ratchet. He's a hard judge, an' that's why I trust his word on a warrior." } },
    _none = { { id = "tp_none", text = "That's no' a thing I can drill intae ye. Ask someone wi' more books an' fewer bruises." } },
  },
}

-- Krom Stoutarm: Explorers' League digger in the Library; a warlock on the quiet. Classic: Tome of the Cabal.
P:NPC {
  key = "if_krom", id = TODO_NPC("Krom Stoutarm"), name = "Krom Stoutarm", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "guarded", "wry" }, values = { "knowledge", "discretion" },
  notices = { "class", "lore" },
  impression = {
    first = "Krom Stoutarm sits among the Library's shelves with dig dust still in his beard and a book held a little too close to his chest. He has a digger's shoulders and a habit of glancing at the door before he answers anything.",
    third = "{name} met Krom Stoutarm, an Explorers' League digger who reads in the Library at Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Keep yer voice down, friend, for the librarians have ears like bats. Were ye lookin' for a book, or for me?" },
    { id = "g_lock", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ah, I know that smell o' brimstone, for I carry it myself. Sit down an' speak quietly, for no' everyone in this hall needs tae know our business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, then, an' mind what ye say near the curator." },
    { id = "g_tome", when = { questActive = TODO_QUEST("Tome of the Cabal") }, text = "So Strahad sent ye after the Tome, did he? I had a feelin' that old debt would walk through the door one day." },
  },
  notice = {
    { id = "n_digger", cat = "lore", when = { race = "Dwarf", ["not"] = { class = "WARLOCK" } },
      text = "A fellow dwarf, an' ye've the look o' someone who's held a shovel. Have ye dug for the League, or only for ore?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Krom Stoutarm, digger for the Explorers' League. I'm between sites just now, so I read, an' ye'd be surprised what a dwarf can learn in a library if he looks on the shelves nobody dusts." },
        { id = "h_lock", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Krom Stoutarm, digger for the League, an' somethin' else besides, as ye've guessed. The League pays for the diggin', an' what I study after hours is my own affair an' yours." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly, mind." },
        { id = "h_again2", text = "Go on, the curator's lookin' the other way." },
      },
      choices = {
        { text = "Where have you dug?", next = "digs" },
        { text = "Which shelves does nobody dust?", next = "shelves" },
        { text = "You keep watching the door.", next = "door" },
        { text = "Tell me about the Tome of the Cabal.", next = "tome", when = { class = "WARLOCK", minLevel = 30 } },
        { text = "I'll let you read.", next = "END" },
      },
    },
    digs = {
      lines = { { id = "d_default", text = "Loch Modan, mostly, at Ironband's site, till the troggs came boilin' up out o' the ground an' we ran wi' what we could carry. I left a good strongbox behind in that hole, an' I think about it more than is healthy." } },
      choices = {
        { text = "What were you digging for?", next = "digs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    digs2 = {
      lines = { { id = "d2_default", text = "The same as every dwarf since Uldaman was opened, which is some sign o' the titans an' where we came from. The others want tablets an' discs for the Hall, an' I'll admit I kept an eye out for older, stranger things as well." } },
      choices = {
        { text = "Stranger than the titans?", next = "digs3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    digs3 = {
      lines = { { id = "d3_default", text = "The earth holds more than one sort o' secret, {class}, an' no' all o' it was put there by makers who meant us well. A careful dwarf learns tae tell which stones tae hand tae the curator an' which tae wrap in a cloth an' say nothin' about." } },
      choices = { { text = "I'll say nothing either. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shelves = {
      lines = { { id = "s_default", text = "The ones at the back, where the Kirin Tor's cast-offs ended up after Dalaran fell. Mae Paledust knows every book on them an' would rather she didn't, so if ye borrow from there, tell her it's for the history." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    door = {
      lines = { { id = "dr_default", text = "A habit from the digs, where the thing comin' through the tunnel was never good news. That, an' there are senators who'd take a dim view o' some o' my readin', so I like tae know who's behind me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tome = {
      lines = { { id = "t_default", text = "It's an old book o' bindin's, an' it teaches how tae call a felhunter an' keep it leashed. I had pages of it once, an' they're in the strongbox I left at Ironband's dig in Loch Modan when the troggs overran us.", fx = { learn = { "tome_of_the_cabal" } } } },
      choices = {
        { text = "Then the troggs are sitting on it.", next = "tome2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome2 = {
      lines = { { id = "t2_default", text = "Aye, an' they've nae notion what it is, which is the one mercy in the whole business. Bring out what's in that box an' ye'll have my share o' the Tome, though I'll warn ye that mine was never the whole o' it." } },
      choices = { { text = "I'll find your strongbox. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Stoutarms have dug for the League since it was founded. I'm the only one who reads what we dig up, mind." } },
    tome_of_the_cabal = { { id = "tp_tome", text = "A book o' bindin's for the felhunter, scattered in pieces. My piece is under a great many troggs in Loch Modan." } },
    _none = { { id = "tp_none", text = "I've no' read that far, friend. Try the librarian, an' ask her nicely." } },
  },
}

-- Lago Blackwrench: gnome warlock in the Forlorn Cavern. Classic: sends young gnome warlocks to Gakin in Stormwind.
P:NPC {
  key = "if_lago", id = TODO_NPC("Lago Blackwrench"), name = "Lago Blackwrench", gender = "male",
  bible = "bibles/missed_b.md", role = "questgiver", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "dry", "watchful" }, values = { "knowledge", "caution" },
  notices = { "class", "gnome" },
  impression = {
    first = "Lago Blackwrench stands in the dim of the Forlorn Cavern with his hands clasped behind him, watching who comes down the tunnel. He speaks like an engineer giving a safety lecture, which is roughly how he thinks of demons.",
    third = "{name} met Lago Blackwrench, a gnome warlock who keeps watch in Ironforge's Forlorn Cavern.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've lost your way to the fishing pool, it's behind you, and if you haven't lost your way, then I'm curious what you want with me." },
    { id = "g_lock", when = { class = "WARLOCK", race = "Gnome" }, text = "There you are, and about time too. I've been watching for young gnomes with that particular scorch on their sleeves, and you're the third this month." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and nothing has followed you down here, which I always check." },
    { id = "g_lamb", when = { questActive = TODO_QUEST("The Slaughtered Lamb") }, text = "You're still in Ironforge? Gakin is expecting you in Stormwind, and he's not a man who enjoys expecting." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK", ["not"] = { race = "Gnome" } },
      text = "A practitioner, and not one of mine. Calder teaches the tall ones in the back of Bonegrip's shop, if that's who you came for." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome", ["not"] = { class = "WARLOCK" } },
      text = "You're a long way from the bright end of Tinker Town, cousin. Most of our people prefer not to know this cavern exists." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lago Blackwrench. I study a branch of the sciences that the High Tinker's council would rather not fund, and I do it down here, where the ventilation is poor and so is the gossip." },
        { id = "h_lock", when = { class = "WARLOCK", race = "Gnome" },
          text = "Lago Blackwrench, and I look out for our people who take up the dark arts, because somebody ought to. A demon is a machine that wants to kill its operator, and I'd like you to learn that from me and not from the demon." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing but time and darkness down here." },
        { id = "h_again2", text = "Go on, and do keep your voice at a reasonable volume." },
      },
      choices = {
        { text = "What exactly do you study?", next = "study" },
        { text = "Why hide down here?", next = "cavern" },
        { text = "A gnome warlock seems an odd thing to be.", next = "odd" },
        { text = "Who can teach me to bind a demon, and keep it bound?", next = "gakin", when = { class = "WARLOCK", race = "Gnome" } },
        { text = "I'll leave you to the dark.", next = "END" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "Summoning, binding and the careful measurement of both. My people approach everything as a problem of engineering, and I've found that a summoning circle has tolerances just as a boiler does, with rather worse consequences for exceeding them." } },
      choices = {
        { text = "What happens when one fails?", next = "study2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study2 = {
      lines = { { id = "s2_default", text = "With a boiler you lose the workshop, and with a circle you may lose the person and keep the workshop, which is worse to come home to. I've seen one failure and I don't intend to see a second, so I write every step down." } },
      choices = {
        { text = "Whose failure was it?", next = "study3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study3 = {
      lines = { { id = "s3_default", text = "A colleague's, in Gnomeregan, some while before the troggs. I'll say no more than that it's the reason I stand in this tunnel and stop young warlocks before they try anything clever on their own." } },
      choices = { { text = "Then it's good that you do. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cavern = {
      lines = { { id = "c_default", text = "The dwarves have a practical arrangement, which is that anything they'd rather not look at goes in the Forlorn Cavern. The rogues are on one side and Bonegrip's shop is on the other, and nobody asks anybody anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    odd = {
      lines = { { id = "o_default", text = "Is it? We are the most curious people on Azeroth, and curiosity doesn't stop politely at the edge of what's approved. I'd say it's odder that there are so few of us, and I put that down to good sense in the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gakin = {
      lines = { { id = "g_default", text = "Not I, because I watch and I warn and that is the extent of it. You want Gakin the Darkbinder, who keeps to the cellar of a tavern called the Slaughtered Lamb in Stormwind's Mage Quarter, and he'll set you your first binding.", fx = { learn = { "slaughtered_lamb" } } } },
      choices = {
        { text = "A tavern cellar in Stormwind?", next = "gakin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gakin2 = {
      lines = { { id = "g2_default", text = "The humans hide their warlocks under a public house, and we hide ours behind a fishing pool, so nobody may sneer. Take the tram from Tinker Town, be polite to Gakin, and don't touch anything on his shelves." } },
      choices = { { text = "I'll keep my hands to myself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a boiler inspector in Gnomeregan, which is better training for this work than you'd suppose." } },
    slaughtered_lamb = { { id = "tp_lamb", text = "A tavern in Stormwind's Mage Quarter with a cellar full of warlocks. Ask for Gakin the Darkbinder." } },
    _none = { { id = "tp_none", text = "I've no data on that, and I don't speculate without data." } },
  },
}

-- Lissyphus Finespindle: light armor merchant, Military Ward.
P:NPC {
  key = "if_lissyphus", id = TODO_NPC("Lissyphus Finespindle"), name = "Lissyphus Finespindle", title = "Light Armor Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "precise" }, values = { "craft", "good sense" },
  notices = { "class", "kit" },
  impression = {
    first = "Lissyphus Finespindle sells leather and cloth armour in the Military Ward, standing on a crate so she can see over her own counter. She measures customers by eye and announces the result before they've asked.",
    third = "{name} met Lissyphus Finespindle, a gnome who sells light armor in Ironforge's Military Ward.",
  },
  greetings = {
    { id = "g_default", text = "Hello! You're a thirty-eight in the chest, or near enough, and I've leather and cloth to fit it if you don't mind something that bends." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! You've lost a little off the waist since last time, which is what marching does." },
  },
  notice = {
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank when you walk, so I expect you're only passing through to the Craghelms. Do come back when your shoulders are tired of it." },
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "HUNTER" } },
      text = "Now you look like someone who needs to move quietly. I oil all my leather so it doesn't creak, and I test each piece by sneaking up on the neighbours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lissyphus Finespindle, light armour, which in this ward makes me the only shop that isn't selling a hundredweight of steel. A soldier who can't run is only brave, I always say, and I sell the running kind." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I've a jerkin to restitch, but it can wait." },
        { id = "h_again2", text = "Yes? Go on, I'm listening with at least one ear." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "A gnome selling armor to dwarf soldiers?", next = "dwarves" },
        { text = "Why light armor, in a ward full of plate?", next = "light" },
        { text = "Thank you, Lissyphus.", next = "END" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They were doubtful for the first month, and then the scouts and riflemen worked out that I stock their sizes and the Craghelms only stock plate. Now the mountaineers send their recruits to me before the first snow patrol." } },
      choices = {
        { text = "What do the Craghelms make of you?", next = "dwarves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves2 = {
      lines = { { id = "d2_default", text = "Olthran says leather is what you wear under real armour, and I say plate is what you wear when you've given up on dodging. We send each other customers all the same, because neither of us wants the other's stock." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "Because I carried my whole workshop out of Gnomeregan on my back, and it taught me precisely what every extra pound costs over a mile. I worked it out afterwards, and it's about seven percent more swearing per pound." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I made safety aprons for the workshops back home. Armour is the same idea, only the accidents are on purpose." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid. If it doesn't have a seam, I haven't studied it." } },
  },
}

-- Lomac Gearstrip: gnome chemist in Tinker Town; inventor of the NG-5 explosive. Classic: An Old Colleague, Ineptitude + Chemicals = Fun.
P:NPC {
  key = "if_lomac", id = TODO_NPC("Lomac Gearstrip"), name = "Lomac Gearstrip", gender = "male",
  bible = "bibles/missed_b.md", role = "questgiver", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "irritable", "exacting" }, values = { "precision", "privacy" },
  notices = { "craft" },
  impression = {
    first = "Lomac Gearstrip works in Tinker Town behind a wall of glassware, and he sighs when anyone comes close enough to cast a shadow on it. He is the inventor of the NG-5 explosive and plainly thinks that should excuse him from conversation.",
    third = "{name} met Lomac Gearstrip, the short-tempered gnome who invented the NG-5 explosive.",
  },
  greetings = {
    { id = "g_default", text = "Yes, what is it? I've a solution on the boil that goes wrong in ninety seconds if I look away, so do get to the point." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. At least you know where not to stand by now." },
    { id = "g_gaxim", when = { questActive = TODO_QUEST("An Old Colleague") }, text = "You've the look of someone carrying a message, and only one gnome I know sends strangers instead of writing. What does Gaxim want now?" },
    { id = "g_potions", when = { questActive = TODO_QUEST("Ineptitude + Chemicals = Fun") }, text = "Have you brought the potions I asked for? I can't compound NG-5 out of good intentions." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, by the stains. Then perhaps you can be trusted near a retort, which already puts you ahead of the last four visitors." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lomac Gearstrip, chemist. I make things that go off when they're meant to and not before, which is rarer than you'd think in Tinker Town, and I'd be making more of them if people stopped coming to chat." },
        { id = "h_gaxim", tags = { "news" }, when = { questActive = TODO_QUEST("An Old Colleague") },
          text = "So Gaxim Rustfizzle is in Stonetalon, lecturing night elves, and he wants my NG-5 to deal with the Venture Company. He always did volunteer my work for his causes." },
      },
      again = {
        { id = "h_again", text = "Is there more? There's usually more." },
        { id = "h_again2", text = "Go on, quickly, the flask is watching us both." },
      },
      choices = {
        { text = "What is NG-5?", next = "ng5" },
        { text = "Tell me about Gaxim Rustfizzle.", next = "gaxim" },
        { text = "You don't care for visitors.", next = "visitors" },
        { text = "What do you need to make the NG-5?", next = "potions", when = { questActive = TODO_QUEST("Ineptitude + Chemicals = Fun") } },
        { text = "I'll get out of your light.", next = "END" },
      },
    },
    ng5 = {
      lines = { { id = "n_default", text = "The fifth and only stable formulation of a nitrated compound I spent eleven years on. The first four are why my old laboratory in Gnomeregan had a skylight it wasn't built with.", fx = { learn = { "ng5" } } } },
      choices = {
        { text = "What makes the fifth one stable?", next = "ng5b" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ng5b = {
      lines = { { id = "nb_default", text = "A buffering agent that I'm not going to name, because the last person I told tried it with the proportions reversed. It will sit quietly in a jar for a year, and it will take the side off a goblin shredder when you ask it to." } },
      choices = {
        { text = "And you'd hand that to a stranger?", next = "ng5c" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ng5c = {
      lines = { { id = "nc_default", text = "I'd rather not, but the Venture Company is stripping a forest to the rock, and Gaxim is right that somebody should stop them. If it must be carried by an amateur, I'll at least pack it properly and write the instructions in large letters." } },
      choices = { { text = "I can read large letters. Something else.", next = "BACK" } },
    },
    gaxim = {
      lines = { { id = "g_default", text = "We shared a bench in the Enlightened Assembly for six years, and he talked through every one of them. He's a sound engineer and a tireless one, and I notice he has put a whole sea between himself and my opinion of his filing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    visitors = {
      lines = { { id = "v_default", text = "I care for them at a distance of ten feet and for under a minute. It isn't personal, you understand; half of what's on this bench dislikes vibration, and people will insist on leaning." } },
      choices = { { text = "I'm not leaning. Something else.", next = "BACK" } },
    },
    potions = {
      lines = { { id = "p_default", text = "Potions, the ordinary bottled sort, exactly as I listed them and none of them watered. I use them as a base, since the Tinker Town stores are short of everything since the evacuation, and I haven't the time to brew my own and the explosive both." } },
      choices = { { text = "You'll have them. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Eleven years on one compound, and I lost the laboratory to troggs the year after I finished it." } },
    ng5 = { { id = "tp_ng5", text = "Stable until asked, and then very much not. Don't shake the jar to see." } },
    _none = { { id = "tp_none", text = "I don't know, and I'm not going to stop this reaction to find out." } },
  },
}

-- Lyon Mountainheart: a dwarf who reads in the Library, Hall of Explorers.
P:NPC {
  key = "if_lyon", id = TODO_NPC("Lyon Mountainheart"), name = "Lyon Mountainheart", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "ironforge" }, temper = { "thoughtful", "kindly" }, values = { "history", "patience" },
  notices = { "lore", "race" },
  impression = {
    first = "Lyon Mountainheart stands at a reading desk in the Library with three books open at once and a cold mug at his elbow. He looks up slowly, like a dwarf surfacing from a very deep shaft.",
    third = "{name} met Lyon Mountainheart, a dwarf scholar who reads in the Library at Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hm? Oh, good day tae ye. Forgive me, I was three hundred years away, an' it takes a moment tae climb back." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yourself again. I'm on the same page as when ye left, I'm ashamed tae say." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Which clan are ye, {g:lad|lass}? Never mind, ye needn't say, but I've a shelf here on every hold in Khaz Modan if ye're ever curious about yer own beard." },
    { id = "n_mage", cat = "lore", when = { class = "MAGE" },
      text = "A mage in the Library, an' I'd guess ye read faster than I do. Leave some o' the books for the rest of us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lyon Mountainheart. I'm no' a prospector nor a curator, only a dwarf who likes tae know how things came tae be, an' the League is good enough tae let me stand here an' find out." },
      },
      again = {
        { id = "h_again", text = "What else would ye like tae know?" },
        { id = "h_again2", text = "Ask away, the books will keep." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "The Library seems busier than a dig site.", next = "library" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    reading = {
      lines = { { id = "r_default", text = "Three accounts o' the War of the Three Hammers, an' no two o' them agree on who struck first. A Bronzebeard wrote one, a Wildhammer another, an' the third was copied from a Dark Iron stone, which is the one I trust least an' learn most from.", fx = { learn = { "three_hammers" } } } },
      choices = {
        { text = "Why learn most from the one you trust least?", next = "reading2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reading2 = {
      lines = { { id = "r2_default", text = "Because a liar still tells ye what he's ashamed of, by what he leaves out. The Dark Iron account never once mentions how Thaurissan's summonin' ended, an' that silence is louder than a page o' boastin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    library = {
      lines = { { id = "l_default", text = "It always is when the passes are snowed in, for every prospector home from the field comes tae argue over his findin's. Curator Thorius keeps the peace, an' Mae Paledust keeps the books from walkin' out the door under somebody's cloak." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a clerk tae the Senate for forty years, an' when I retired I came here tae read what the minutes left out." } },
    three_hammers = { { id = "tp_th", text = "Bronzebeard, Wildhammer an' Dark Iron fought for this mountain after old King Anvilmar died. We won, an' we've been payin' for it since." } },
    _none = { { id = "tp_none", text = "I've no' come tae that chapter yet, I fear. Ask the librarian, for she's read further than I have." } },
  },
}

-- Maeva Snowbraid: robe merchant, Maeva's Mystical Apparel, Mystic Ward.
P:NPC {
  key = "if_maeva", id = TODO_NPC("Maeva Snowbraid"), name = "Maeva Snowbraid", title = "Robe Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "warm", "frank" }, values = { "craft", "family" },
  notices = { "class" },
  impression = {
    first = "Maeva Snowbraid keeps Maeva's Mystical Apparel in the Mystic Ward, where the robes hang in rows by colour and every one has deeper pockets than it looks. She has a white braid down to her belt and an eye that sizes a customer in one pass.",
    third = "{name} met Maeva Snowbraid, who sells robes at Maeva's Mystical Apparel in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Come in out o' the draught, dear. Robes for priests an' mages an' anyone else who'd sooner be comfortable than armoured." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again, dear. Has it held up, or did ye go an' set fire tae the sleeves like the rest o' them?" },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Now there's someone who'll appreciate a proper robe. Turn round an' let me see how that one hangs, for I can tell from here it was cut for someone taller." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye'll no' fit a robe over all that iron, dear, but ye're welcome tae look. Even a soldier needs somethin' soft for the feast days." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maeva Snowbraid, an' the shop's my own, name over the door an' all. The priests o' the Hall of Mysteries are my best customers, an' the mages are my most frequent, because the mages keep scorchin' theirs." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye, dear?" },
        { id = "h_again2", text = "Go on, I'm only pinnin' a hem." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "What makes a good robe?", next = "robe" },
        { text = "Is Poranna Snowbraid a relation of yours?", next = "poranna" },
        { text = "Good day, Maeva.", next = "END" },
      },
    },
    robe = {
      lines = { { id = "r_default", text = "Pockets, dear, an' more o' them than ye think ye need. After that it's a hem that clears the ground by two fingers, for I've seen a mage trip on his own skirts in the middle of a spell, an' the wall still has the mark." } },
      choices = {
        { text = "What do priests ask for?", next = "robe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robe2 = {
      lines = { { id = "r2_default", text = "Somethin' plain that doesnae show the blood, bless them, for they're forever kneelin' beside the wounded. High Priest Rohan has worn the same cut for thirty years, an' I've stopped tryin' tae talk him intae a bit o' trim." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    poranna = {
      lines = { { id = "p_default", text = "She's kin, aye, an' she keeps the tailorin' supplies at Stonebrow's by the Great Forge. I buy my thread from her an' she tells me I'm overchargin' for my robes, an' that's how Snowbraids show affection." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned tae sew mendin' my brothers' minin' shirts, an' robes are a good deal more pleasant tae handle." } },
    _none = { { id = "tp_none", text = "I couldnae say, dear. Ask one o' the priests in the Hall, for they know more than a seamstress does." } },
  },
}

-- Mangorn Flinthammer: heavy armor merchant in the Commons. Stands with Raena.
P:NPC {
  key = "if_mangorn", id = TODO_NPC("Mangorn Flinthammer"), name = "Mangorn Flinthammer", title = "Heavy Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "gruff", "steady" }, values = { "craft", "family" },
  notices = { "class", "kit" },
  impression = {
    first = "Mangorn Flinthammer sells mail and plate in the Commons, and he raps each breastplate with his knuckles to let the customer hear it ring. He is a broad, slow-spoken dwarf who looks at his wife before he names a price.",
    third = "{name} met Mangorn Flinthammer, who sells heavy armor in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, friend. Mail an' plate on my side, an' if ye want somethin' lighter, Raena has the leather an' cloth." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' still in one piece, so the armour's doin' its work." },
  },
  notice = {
    { id = "n_heavy", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "That pauldron's sittin' low on the left, {class}. Somebody's hit ye there more than once, an' the strap's stretched." },
    { id = "n_green", cat = "class", when = { maxLevel = 10 },
      text = "First trip tae the city, is it? Don't buy more steel than ye can carry up the hill tae Kharanos, for I've seen lads try." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mangorn Flinthammer, an' I sell armour that turns a blade, right here by the gates where every recruit passes on the way in. My wife Raena has the other half o' the shop an' the better half o' the wits." },
      },
      again = {
        { id = "h_again", text = "Aye, what else?" },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Why set up in the Commons and not the Military Ward?", next = "commons" },
        { text = "You and Raena split the shop between you.", next = "raena" },
        { text = "Good day, Mangorn.", next = "END" },
      },
    },
    commons = {
      lines = { { id = "c_default", text = "Because the soldiers in the Military Ward already have their kit, an' the ones comin' through the gates don't. A {g:lad|lass} walks in from Coldridge wi' a wooden shield an' a brave face, an' the first thing they see is us." } },
      choices = {
        { text = "What do you tell the new ones?", next = "commons2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    commons2 = {
      lines = { { id = "c2_default", text = "Tae buy the helmet first an' the fancy shoulders last, for a trogg's club comes down on the head an' doesnae care how ye look. Most o' them buy the shoulders anyway, an' come back for the helmet wi' a bandage on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raena = {
      lines = { { id = "r_default", text = "Aye, an' it's kept the peace for a good many years. I thought leather was for boots when I married her, an' she's sold more o' it tae hunters an' scouts than I've sold plate, so I've learned tae hold my tongue." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Flinthammers have fitted armour in Ironforge for five generations, an' I was hammerin' rivets before I could grow a beard." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Ask Raena, for she hears all the talk at the gates." } },
  },
}

-- Raena Flinthammer: light armor merchant in the Commons. Stands with Mangorn.
P:NPC {
  key = "if_raena", id = TODO_NPC("Raena Flinthammer"), name = "Raena Flinthammer", title = "Light Armor Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quick", "cheerful" }, values = { "family", "good sense" },
  notices = { "class" },
  impression = {
    first = "Raena Flinthammer sells leather and cloth armour in the Commons, across the shop from her husband's plate. She talks twice as fast as he does and seems to know the business of everyone who has come through the gates this week.",
    third = "{name} met Raena Flinthammer, who sells light armor in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello, dear! Leather an' cloth on this side, an' ye can ignore my husband frownin' at ye, for he frowns at everyone who doesnae clank." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! I told Mangorn ye'd be back, an' he owes me a pint." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "Ye walk soft, I see, so ye'll be one o' mine. Come an' feel this hide, for it came off a Dun Morogh bear an' it'll outlast ye." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST" } },
      text = "Ye'll want the cloth, dear, an' I've some fine wool in. Maeva in the Mystic Ward has the grand robes, but mine'll keep ye warm on the road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Raena Flinthammer, an' I sell the armour ye can actually run in. Mangorn has the mail an' plate over there, an' between us there's no' a soul comes through the gates we cannae dress." },
      },
      again = {
        { id = "h_again", text = "What else, dear?" },
        { id = "h_again2", text = "Go on, I've always time for a blether." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What's the talk at the gates this week?", next = "talk" },
        { text = "Mangorn says you have the better half of the wits.", next = "mangorn" },
        { text = "Good day, Raena.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "Troggs, dear, the same as last week, for they've dug intae another quarry out past Gol'Bolar an' the miners are furious. An' the gnomes are sayin' there's lights movin' behind the gates o' Gnomeregan again, though the gnomes say a great many things." } },
      choices = {
        { text = "Do you believe the gnomes?", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      lines = { { id = "t2_default", text = "I believe they want their home back, the poor wee things, an' wantin' makes folk see lights. I sold a jerkin tae one who's goin' back in tae look, an' I put an extra layer in the chest an' didnae tell him." } },
      choices = { { text = "That was kindly done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mangorn = {
      lines = { { id = "m_default", text = "He said that tae a stranger? Well, he's right, but don't tell him I agreed. He's the best armourer in the Commons an' the worst haggler in Khaz Modan, so I do the sums an' he does the hammerin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a tanner's daughter from Kharanos before I was a Flinthammer, so I've had my hands in hides all my life." } },
    _none = { { id = "tp_none", text = "Now that I havenae heard, an' it's no' often I say so. Ask at the inn, dear." } },
  },
}
