-- Ironforge folk the first passes missed (Bruuk to Garel): Bruuk's Corner in the Military Ward, two gnome trade
-- suppliers, the wandering courier, the Hall of Arms' old hand, the Vault's administrator, Bink's brother,
-- Craghelm's and Steelfury's, the Hidden Circle's man, the leatherworking trainer and a collector in the Cavern.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bruuk Barleybeard: bartender and owner of Bruuk's Corner, Military Ward.
P:NPC {
  key = "if_bruuk", id = TODO_NPC("Bruuk Barleybeard"), name = "Bruuk Barleybeard", gender = "male",
  bible = "bibles/missed_a.md", role = "bartender", tier = "service",
  communities = { "ironforge" }, temper = { "gruff", "hearty" }, values = { "loyal", "proud" },
  notices = { "drink", "class" },
  impression = {
    first = "Bruuk Barleybeard runs a soldiers' tavern and looks as though he could still throw any one of his customers out of it. He pours without measuring and has never yet poured short.",
    third = "{name} met Bruuk Barleybeard, who owns Bruuk's Corner in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Bruuk's Corner, {class}. Find a stool, name yer drink, and leave yer quarrels at the door with yer helmet." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, so the ale cannae have been too bad. Same again?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The night watch has just come off, so mind yer elbows, for they're thirsty and they're nae patient." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've had a few already, by the lean of ye. I'll pour ye one more and then it's water, for I've carried enough soldiers home this week." },
    { id = "n_soldier", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye've a fightin' {g:man|woman}'s shoulders, so ye'll fit right in. Half this room drilled in the Hall of Arms this mornin', and the other half is tellin' them they did it wrong." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bruuk Barleybeard, and this is my corner of the Military Ward. The Stonefire in the Commons gets the travellers and the merchants, and I get the mountaineers and the guards, which suits me fine." },
      },
      again = {
        { id = "h_again", text = "What else? I've mugs to fill." },
        { id = "h_again2", text = "Aye, speak up over the noise." },
      },
      choices = {
        { text = "What do soldiers drink?", next = "drink" },
        { text = "What do they talk about, off duty?", next = "talk" },
        { text = "Does Edris keep you in line?", next = "edris" },
        { text = "A mug and some quiet, then.", next = "END" },
      },
    },
    drink = {
      lines = { { id = "d_default", text = "Whatever's strong and comes quickly. I keep Thunderbrew for those with coin and a good dark stout for those without, and I'll nae serve anythin' with fruit in it, whatever the gnomes ask." } },
      choices = { { text = "No fruit. Understood. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    talk = {
      lines = { { id = "t_default", text = "Troggs, mostly, for they've been boilin' up out of the ground from Gol'Bolar to Loch Modan and nobody can say what stirred them. After the third mug it's the Dark Irons, and after the fifth it's whose turn it was to buy.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "What do they say of the Dark Irons?", next = "darkiron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = { { id = "di_default", text = "That they've been seen as near as Loch Modan, blackenin' good stone with their powder, and that the King ought to march on Blackrock and be done with it. It's easy to march on a mountain from a barstool, mind, and I say so to their faces." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    edris = {
      lines = { { id = "e_default", text = "Edris keeps the whole tavern in line, me along with it. She's a Barleybeard like myself and she can carry six full mugs through a brawl without spillin' a drop, which is more than I ever could." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served my years in the ranks, and when I hung up the axe I opened a tavern where soldiers could drink in peace." } },
    troggs = { { id = "tp_tr", text = "Every mountaineer who comes in has a trogg story, and they've been gettin' worse this past year." } },
    _none = { { id = "tp_none", text = "I pour ale, friend, I dinnae read the future. Ask the lads by the fire, for they've an opinion on everythin'." } },
  },
}

-- Burbik Gearspanner: trade supplies at Burbik's Supplies, near the Great Forge.
P:NPC {
  key = "if_burbik", id = TODO_NPC("Burbik Gearspanner"), name = "Burbik Gearspanner", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "busy" }, values = { "practical", "loyal" },
  notices = { "craft", "gnome" },
  impression = {
    first = "Burbik Gearspanner has put his own name over a shop door in a dwarven city and is quietly, enormously proud of it. He stocks a little of everything a craftsman needs and can lay a hand on any of it without looking.",
    third = "{name} met Burbik Gearspanner, a gnome who keeps Burbik's Supplies by the Great Forge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Burbik's Supplies! Thread, flux, vials, dyes, fishing line, all the small things your craft stops dead without, and all of them within arm's reach." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Let me guess, you ran out of the one thing you were sure you had plenty of." },
  },
  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another gnome, how splendid! You'll notice the counter is at a sensible height, because I built it myself and I wasn't going to stand on a crate in my own shop." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll want Tinker Town for the specialised parts, but I keep weak flux and the common fittings, and I'm a good deal closer to the anvils." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Burbik Gearspanner, and yes, it really is my shop. The Great Forge is full of people in the middle of making something, and I worked out that every one of them is one missing spool away from a very bad afternoon." },
      },
      again = {
        { id = "h_again", text = "What else can I find for you?" },
        { id = "h_again2", text = "Yes? I'm listening, I'm only restocking the vials." },
      },
      choices = {
        { text = "Why open a shop here, not Tinker Town?", next = "here" },
        { text = "What do the smiths buy most?", next = "smiths" },
        { text = "You still count yourself Gnomeregan's.", next = "gnomeregan" },
        { text = "I'll see what you have.", next = "END" },
      },
    },
    here = {
      lines = { { id = "he_default", text = "Because Tinker Town is full of gnomes who already own nine of everything, whereas a dwarven smith owns one hammer and nothing else. I calculated the walking distance from the main anvils to my door, and it's forty paces, or seventy for a gnome." } },
      choices = { { text = "Sound reckoning. Something else.", next = "BACK" } },
    },
    smiths = {
      lines = { { id = "s_default", text = "Flux, by the crate, and coal when they've let the bin run low and don't want Bengus Deepforge to notice. The dwarves pretended not to see my shop for the first month, and now they send their apprentices at a run." } },
      choices = {
        { text = "What changed their minds?", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "I was open, that's all. A smith with a bar going cold on the anvil doesn't care whose name is over the door, so long as the flux is on the shelf, and it always is." } },
      choices = { { text = "Reliability wins. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnomeregan = {
      lines = { { id = "g_default", text = "I do, and I always will. Every coin this shop earns is a coin a gnome earned honestly in exile, and when the High Tinker takes our city back, I intend to open the second Burbik's Supplies on the old main concourse." } },
      choices = { { text = "I hope you get to. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a parts counter in Gnomeregan before the troggs came. I started again here with one shelf and a borrowed lamp." } },
    _none = { { id = "tp_none", text = "I don't stock that, and I don't know it either, which is unusual for me. Try the Library, perhaps?" } },
  },
}

-- Courier Hammerfall: wanders Ironforge with calls to arms for seasoned adventurers.
P:NPC {
  key = "if_hammerfall", id = TODO_NPC("Courier Hammerfall"), name = "Courier Hammerfall", gender = "male",
  bible = "bibles/missed_a.md", role = "courier", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk", "earnest" }, values = { "dutiful" },
  notices = { "level", "class" },
  impression = {
    first = "Courier Hammerfall walks the ring of Ironforge with a satchel of sealed letters and never quite stands still. He sizes up every passer-by to see whether they look fit for the work he carries.",
    third = "{name} met Courier Hammerfall, who carries calls to arms around Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Walk with me if ye'd talk, {class}, for I've the whole city to cover before the bells. I carry word from the Alliance's far posts, and all of it is urgent." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again! Good, for the letters have nae got any lighter since we spoke." },
  },
  notice = {
    { id = "n_green", cat = "level", when = { maxLevel = 39 },
      text = "I'll be honest with ye, {g:lad|lass}: what I carry is for hardened hands, and ye've a few campaigns to go yet. Come and find me when Dun Morogh's troggs have stopped troublin' ye." },
    { id = "n_vet", cat = "level", when = { minLevel = 50 },
      text = "Now ye're the sort I've been walkin' my boots thin to find. Ye've seen real fightin', and I've letters here that want exactly that." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Courier Hammerfall, in the King's service. The Alliance is stretched thin from the Plaguelands to Kalimdor, and my task is to find folk in Ironforge who'll go where the regiments cannae." },
      },
      again = {
        { id = "h_again", text = "What else would ye hear? Keep pace, now." },
        { id = "h_again2", text = "Aye, ask, but I'll nae stop walkin'." },
      },
      choices = {
        { text = "What word from the Plaguelands?", next = "plague" },
        { text = "What's happening in Kalimdor?", next = "kalimdor" },
        { text = "It sounds as though the Alliance is losing.", next = "losing" },
        { text = "Do you never rest?", next = "rest" },
        { text = "I'll let you get on.", next = "END" },
      },
    },
    plague = {
      lines = { { id = "p_default", text = "Bad word, and old. The Scourge still holds what was Lordaeron, and the Alliance keeps a camp at Chillwind, on the southern edge of the Western Plaguelands, under Commander Ashlam Valorfist.", fx = { learn = { "plaguelands" } } } },
      choices = {
        { text = "What does the commander need?", next = "valorfist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valorfist = {
      lines = {
        { id = "v_default", text = "Fighters who can stand against the dead without breakin'. He's a paladin, and he means to push into Andorhal itself, so he's nae use for anyone who'll turn and run at the first ghoul." },
        { id = "v_pala", when = { class = "PALADIN" }, text = "Yer own kind, most of all. He's a paladin himself and means to push into Andorhal, and a knight of the Light is worth ten ordinary blades against the dead." },
      },
      choices = {
        { text = "How does one reach Chillwind?", next = "chillwind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chillwind = {
      lines = { { id = "c_default", text = "North from Southshore, through the Alterac foothills, and across the river where the trees start to look sick. Ye'll know ye've arrived when the air tastes of ash, and I'd nae drink the water." } },
      choices = { { text = "I'll remember the water. Something else.", next = "BACK" } },
    },
    kalimdor = {
      lines = { { id = "k_default", text = "Two things. The night elves hold a stronghold called Feathermoon on an isle off Feralas and want help there, and the druids of the Cenarion Circle are askin' for hands at a place called Moonglade." } },
      choices = {
        { text = "Who commands at Feathermoon?", next = "feathermoon" },
        { text = "What do the druids want?", next = "druids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feathermoon = {
      lines = {
        { id = "f_default", text = "Shandris Feathermoon, General of the Sentinels, and by every account a harder soldier than any we've got. I've never met an elf, mind, but I'd nae want to be the one who kept her waitin'." },
        { id = "f_elf", when = { race = "NightElf" }, text = "Shandris Feathermoon, as ye'd know better than I, General of yer Sentinels. Yer folk write a fine hand and a short letter, and hers said only that she needs blades and soon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druids = {
      lines = { { id = "d_default", text = "They dinnae say much in the letter, only that the land's ailin' and they'll take help from any race that offers it. The one to see is Mathrengyl Bearwalker in Darnassus, and I'm told he'll explain what I cannae." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    losing = {
      big = true,
      lines = { { id = "l_default", text = "Nae losin', but nae winnin' either, and that's a dangerous place to sit. Every post I carry word from is holdin' by its fingernails, and Ironforge is warm and far away from all of them." } },
      choices = {
        { text = "Then every post deserves an answer.", next = "BACK", reply = "That's what I tell myself each mornin', and it's good to hear it from another mouth. Light speed ye, wherever ye choose to go.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Let the far posts fend for themselves.", next = "BACK", reply = "They are fendin' for themselves, and that's the trouble. I'll keep walkin', and I'll find someone with more heart.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rest = {
      lines = { { id = "r_default", text = "When the satchel's empty, and it's never been empty yet. I take a pint at Bruuk's Corner when the round's done, and I'm asleep before the foam settles." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a mountaineer till the King's office found I'd good legs and a loud voice. I've walked this ring more times than I can count." } },
    plaguelands = { { id = "tp_pl", text = "The Alliance holds Chillwind Camp, at the southern edge of the Western Plaguelands, and little else up there." } },
    _none = { { id = "tp_none", text = "That's nae in my satchel, {class}. I only know what's written in the letters." } },
  },
}

-- Demnul Farmountain: a dwarf in the Hall of Arms, Military Ward.
P:NPC {
  key = "if_demnul", id = TODO_NPC("Demnul Farmountain"), name = "Demnul Farmountain", gender = "male",
  bible = "bibles/missed_a.md", role = "soldier", tier = "service",
  communities = { "ironforge" }, temper = { "steady", "wry" }, values = { "dutiful", "proud" },
  notices = { "class" },
  impression = {
    first = "Demnul Farmountain stands in the Hall of Arms with his thumbs in his belt, watching the recruits drill as if each mistake cost him personally. He says little, and the recruits straighten up when he looks their way.",
    third = "{name} met Demnul Farmountain in the Hall of Arms of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. If ye've come to train, the masters are further in, and if ye've come to watch, stand here by me and keep out of the swing of things." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the Hall, are ye? The recruits are a wee bit better than last time, though I'd nae tell them so." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Ye hold yerself like someone who's been hit and learned from it. That's worth more than a year of drill, and I wish I could teach it to this lot without the hittin'." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, is it? Daera Brightspear has the marksmen over yonder, and she'll nae thank me for keepin' ye talkin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Demnul Farmountain. I've spent a good many years in this Hall, and these days I mostly watch the young ones drill and remember when my own knees bent that easily." },
      },
      again = {
        { id = "h_again", text = "What else is on yer mind?" },
        { id = "h_again2", text = "Go on, I can watch and listen both." },
      },
      choices = {
        { text = "How do the recruits look to you?", next = "recruits" },
        { text = "Who are the masters here?", next = "masters" },
        { text = "This hall has a proud feel to it.", next = "hall" },
        { text = "I'll leave you to your watching.", next = "END" },
      },
    },
    recruits = {
      lines = { { id = "r_default", text = "Keen, strong, and green as spring moss. They can all swing an axe, and what they cannae do yet is stand still in a line while somethin' terrible runs at them, which is the whole of soldierin'." } },
      choices = {
        { text = "How do you teach standing still?", next = "still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    still = {
      lines = { { id = "s_default", text = "Ye cannae, truth be told. Ye put a steady old hand on either side of each young one and hope it soaks in, and with the troggs risin' the way they are, the lessons are comin' sooner than I'd like." } },
      choices = { { text = "They'll have good examples. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    masters = {
      lines = { { id = "m_default", text = "Kelstrum Stonebreaker for the warriors, and he's as hard as his name, with the gnome Bilban beside him talkin' in measurements. Daera Brightspear has the hunters, and Muren Stormpike tests any young warrior who thinks he's ready for more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hall = {
      lines = { { id = "h2_default", text = "It should have. Every regiment that marched out of Ironforge in either war against the orcs mustered on this floor first, and some of the banners overhead came home with fewer dwarves than carried them out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A soldier of Ironforge, same as my father. There's nae more to tell, and I like it that way." } },
    _none = { { id = "tp_none", text = "I couldnae say, {class}. I know the Hall of Arms and what goes on in it, and little beyond the doors." } },
  },
}

-- Dinita Stonemantle: Vault Administrator, Vault of Ironforge; pays out on the Explorers' League's notes.
P:NPC {
  key = "if_dinita", id = TODO_NPC("Dinita Stonemantle"), name = "Dinita Stonemantle", gender = "female",
  bible = "bibles/missed_a.md", role = "administrator", tier = "quest",
  communities = { "ironforge" }, temper = { "exact", "stern" }, values = { "careful", "dutiful" },
  notices = { "status" },
  impression = {
    first = "Dinita Stonemantle administers the Vault of Ironforge from behind a ledger the size of a paving slab. Three bankers answer to her, and all three sit a little straighter when she walks past.",
    third = "{name} met Dinita Stonemantle, the Vault Administrator of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "The bankers will see to yer box, {class}. If ye've come to me, ye'll have a note, a seal or a complaint, so let's hear which." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. I trust everythin' was in order last time, for it always is." },
  },
  notice = {
    { id = "n_discs", cat = "status", when = { questActive = TODO_QUEST("The Platinum Discs") },
      text = "That's the High Explorer's seal ye're holdin', unless my eyes are failin'. Hand it over and let me read what the League has promised ye out of my Vault." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dinita Stonemantle, Vault Administrator. The counters are my kin's work, and mine is everythin' behind them: the deep boxes, the League's holdings, and the ledger that says where each coin sleeps." },
      },
      again = {
        { id = "h_again", text = "Is there more? I've a column to close." },
        { id = "h_again2", text = "Go on, briefly." },
      },
      choices = {
        { text = "The High Explorer sent me with a note.", next = "note", when = { questActive = TODO_QUEST("The Platinum Discs") } },
        { text = "What does a Vault Administrator do?", next = "admin" },
        { text = "The Explorers' League banks with you?", next = "league" },
        { text = "Bailey says you find fault with him daily.", next = "bailey" },
        { text = "I'll trouble the bankers instead.", next = "END" },
      },
    },
    note = {
      lines = { { id = "n_default", text = "So he did, and in his own hand, which means ye brought him somethin' out of Uldaman that set his beard on end. The League's credit is good here, so ye'll have what the note says and nae a copper more." } },
      choices = { { text = "That's all I ask. Something else.", next = "BACK" } },
    },
    admin = {
      lines = { { id = "a_default", text = "I count what the counters have counted, and then I count the Vault itself. Every box has a line in my ledger and every line is checked each season, so if a single silver ring went missin', I'd know before its owner did." } },
      choices = {
        { text = "Has the ledger ever been wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Once, in my grandmother's day, by two coppers. She kept the Vault shut for three days till she found them under a counter, and the family has never been allowed to forget it." } },
      choices = {
        { text = "Three days, for two coppers?", next = "coppers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coppers = {
      lines = { { id = "c_default", text = "Aye, and rightly. A bank that shrugs at two coppers will shrug at two hundred gold in time, and folk trust this Vault with their grandfathers' hammers because we've never once shrugged." } },
      choices = { { text = "I see why they trust you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    league = {
      lines = { { id = "l_default", text = "The League keeps funds here against its expeditions, and High Explorer Magellas draws on them when a dig turns up somethin' worth payin' for. He's free with his notes when he's excited, and it's my task to see the sums still balance after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bailey = {
      lines = { { id = "b_default", text = "Bailey's sums are perfect and his jokes are dreadful, and I only correct the second. Barnum would never dream of jestin' with a customer, and Soleil has the sense to laugh at neither of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Vault's ledger has passed from one Stonemantle to the next for generations. It came to me, and it'll leave my hands as clean as I found it." } },
    _none = { { id = "tp_none", text = "If it's nae written in my ledger, I've nae opinion on it. Good day to ye." } },
  },
}

-- Dink: gnome mage trainer in the Hall of Mysteries; brother of Bink.
P:NPC {
  key = "if_dink", id = TODO_NPC("Dink"), name = "Dink", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "methodical" }, values = { "curious", "precise" },
  notices = { "class", "arcane" },
  impression = {
    first = "Dink is a gnome mage with ink on his fingers and a habit of finishing his sister's sentences from across the Hall. He explains magic in tidy steps, as though it were a recipe anyone could follow.",
    third = "{name} met Dink, a gnome who trains mages in the Hall of Mysteries in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello there! Dink, mage trainer, and before you ask, Bink is my sister, and yes, our parents thought it was very funny." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! I've been refining a theory since we spoke, and it's now only slightly wrong." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A fellow mage, excellent! Have you been practising your incantations in order, or skipping ahead to the ones with fire in them, as everybody does?" },
  },
  notice = {
    { id = "n_warlock", cat = "arcane", when = { class = "WARLOCK" },
      text = "Oh, a warlock. I've no quarrel with you, but your school draws power in a way that makes my instruments twitch, so do stand a little further from the reagent shelf." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! You'll want High Priest Rohan's people on the other side of the Hall, though you're very welcome to stay and listen." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I teach the arcane arts here in the Hall of Mysteries, alongside my sister and Milstaff Stormeye. I take the students who like to understand why a spell works, and Bink takes the ones who only want to see it go." },
        { id = "h_mage", when = { class = "MAGE" }, text = "I teach here alongside my sister and Milstaff Stormeye, and you're welcome at my lectern any time. A mage is only ever as good as the last principle properly understood, so let's see where you've got to." },
      },
      again = {
        { id = "h_again", text = "What else? I do enjoy a question." },
        { id = "h_again2", text = "Yes, go on, I've marked my page." },
      },
      choices = {
        { text = "Where should a young mage go next?", next = "jennea", when = { class = "MAGE" } },
        { text = "How does a spell work, in plain terms?", next = "theory" },
        { text = "Mages and priests share this hall peacefully?", next = "share" },
        { text = "You and your sister seem close.", next = "bink" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    jennea = {
      lines = { { id = "j_default", text = "To Stormwind, when you've a few spells firmly in hand. Jennea Cannon keeps the Wizard's Sanctum there, and she sets young mages tasks that teach more than I can from a lectern.", fx = { learn = { "wizards_sanctum" } } } },
      choices = { { text = "I'll seek her out. Something else.", next = "BACK" } },
    },
    theory = {
      lines = { { id = "t_default", text = "In plain terms, there is power lying about everywhere, and a spell is a set of instructions for where it should go and what shape it should take. The words and gestures are the instructions, and your will is the hand that pushes." } },
      choices = {
        { text = "And when the instructions are wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Then the power still goes somewhere, which is the part students forget. Usually it's a fizzle and a smell of singed hair, but I once saw a misplaced syllable turn a perfectly good lectern into a sheep for an hour." } },
      choices = {
        { text = "What became of the lectern?", next = "lectern" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lectern = {
      lines = { { id = "l_default", text = "It turned back, with every book still on it, though one of the priests had fed it an apple in the meantime. It's this very one, and I maintain it has been slightly warmer to the touch ever since." } },
      choices = { { text = "I'll not lean on it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    share = {
      lines = { { id = "s_default", text = "Quite peacefully! The dwarves put the Light and the arcane under one roof because they're practical people and it saved building two halls. The priests mend what our experiments burn, and we've agreed not to ask them how the Light actually works." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bink = {
      lines = { { id = "b_default", text = "We came out of Gnomeregan together and we've taught side by side ever since, so I should hope so. She's the bolder of us and I'm the more careful, and she would tell you that's why her students have more fun and mine have more eyebrows." } },
      choices = { { text = "Eyebrows are worth keeping. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied and taught in Gnomeregan with my sister Bink. When the city fell, the dwarves made room for us in the Hall of Mysteries." } },
    wizards_sanctum = { { id = "tp_ws", text = "Jennea Cannon teaches at the Wizard's Sanctum in Stormwind's Mage Quarter, and she's very good with young mages." } },
    _none = { { id = "tp_none", text = "I haven't studied that, so anything I told you would be a guess, and I try not to teach guesses." } },
  },
}

-- Dolkin Craghelm: mail armor merchant at Craghelm's Plate and Chain, Military Ward.
P:NPC {
  key = "if_dolkin", id = TODO_NPC("Dolkin Craghelm"), name = "Dolkin Craghelm", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "patient", "dry" }, values = { "practical", "thorough" },
  notices = { "class", "kit" },
  impression = {
    first = "Dolkin Craghelm runs a length of chain through his fingers while he talks, feeling for a bad link out of pure habit. He is the quieter of the two Craghelms and by his own account the cleverer.",
    third = "{name} met Dolkin Craghelm, who sells mail at Craghelm's Plate and Chain in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Craghelm's Plate and Chain, {class}. I'm the chain, and Olthran yonder is the plate, so tell me how far ye mean to walk in it and I'll tell ye which of us ye want." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let me see the old shirt, for I can tell a great deal from where the links have gone." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and one who's been at it a while. Yer kind does best in mail once ye've the strength for it, for ye can still climb, crouch and run in it." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's in a sorry state, friend, and I can hear it rattlin' from here. Have a smith look at it before ye go back out through the gates." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dolkin Craghelm, mail armour. A good shirt of chain is ten thousand rings, each one riveted shut by hand, and I've checked every ring in every shirt on that wall." },
      },
      again = {
        { id = "h_again", text = "Anythin' else ye'd know?" },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "Every single ring?", next = "rings" },
        { text = "Why choose mail over plate?", next = "plate" },
        { text = "How do you and Olthran get along?", next = "olthran" },
        { text = "I'll see the shirts.", next = "END" },
      },
    },
    rings = {
      lines = { { id = "r_default", text = "Every one, for a shirt is only as strong as its worst link, and a spear point will find that link as if it had been told where to look. It takes me the better part of a day for each shirt, and I've never grudged it." } },
      choices = {
        { text = "How do you find a bad one?", next = "bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bad = {
      lines = { { id = "b_default", text = "By feel, mostly, for a ring that's butted and nae riveted has a wee gap ye can catch with a thumbnail. Run yer own thumb over any mail ye're offered in the Commons, and ye'll soon learn who's sellin' honest work." } },
      choices = { { text = "A useful trick. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    plate = {
      lines = { { id = "p_default", text = "Because ye can sleep in mail, swim in it at a pinch, and mend it by a campfire with a pair of pliers. Plate turns a harder blow, I'll nae deny it, but a mountaineer on patrol for a week wants a shirt he can live in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    olthran = {
      lines = { { id = "o_default", text = "Well enough for two Craghelms under one roof. He says plate is for warriors and chain is for folk who cannae make up their minds, and I say chain is for folk who mean to walk home afterwards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Craghelms have sold armour in the Military Ward a long while. I took the chain side of the shop because I've the patience for it." } },
    _none = { { id = "tp_none", text = "That's outside my trade, friend. Ask in the Hall of Arms across the way." } },
  },
}

-- Dolman Steelfury: weapon merchant at Steelfury's Weapon Emporium, the Commons; kin to Grenil.
P:NPC {
  key = "if_dolman", id = TODO_NPC("Dolman Steelfury"), name = "Dolman Steelfury", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "loud", "proud" }, values = { "proud", "competitive" },
  notices = { "class" },
  impression = {
    first = "Dolman Steelfury sells weapons as if every sale were a duel he intended to win. He has a hammer in his hand before the customer has finished saying what they want.",
    third = "{name} met Dolman Steelfury, who sells weapons at Steelfury's Weapon Emporium in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Steelfury's Weapon Emporium, the finest arms in the Commons! Tell me what ye mean to hit, {class}, and I'll tell ye what to hit it with." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, ye're back! Did it do the job, or did ye bend it on somethin' harder than yer own head?" },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Now we'll have a proper conversation, for ye'll know a balanced hammer from a lump of iron on a stick." },
    { id = "n_pala", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, and ye'll want a mace, for yer order always does. I've one here with a head like an anvil, and the Light itself couldnae ask for better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dolman Steelfury! I keep the hammers and maces and my kinsman Grenil keeps the blades, and whichever of us sells more by week's end buys the other nothin' at all." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Go on, I've all day and a full rack." },
      },
      choices = {
        { text = "Who's winning this week?", next = "winning" },
        { text = "Why a hammer over a sword?", next = "hammer" },
        { text = "What does a first weapon need?", next = "first" },
        { text = "I'll look at the rack.", next = "END" },
      },
    },
    winning = {
      lines = { { id = "w_default", text = "I am, by three mauls and a morning star, though Grenil will tell ye different. He counts a pair of daggers as two sales, the cheat, when any honest dwarf knows that's one sale in two pieces." } },
      choices = {
        { text = "What does the loser owe?", next = "loser" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loser = {
      lines = { { id = "l_default", text = "The loser sweeps the shop and buys the first round at the Stonefire, and he has to listen to the winner the whole evenin'. It's the listenin' that stings, which is why neither of us has taken a day off in years." } },
      choices = { { text = "A fine way to run a shop. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hammer = {
      lines = {
        { id = "ha_default", text = "Because a sword asks the armour's permission and a hammer doesnae bother. Put a good maul into a breastplate and the fellow inside it loses interest in the fight, whether ye cut him or nae." },
        { id = "ha_dwarf", when = { race = "Dwarf" }, text = "Ye're a dwarf and ye ask me that? We built this city with hammers and we've defended it with them, and a sword is just a long knife with ideas above its station." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "A weight ye can swing fifty times without yer arm shakin', and nothin' fancier than that. The young ones always reach for the biggest thing on the wall, and I always sell them the one two sizes down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Steelfurys have sold arms in the Commons since before I was born, and Grenil and I mean to keep it so." } },
    _none = { { id = "tp_none", text = "If I cannae sell it or swing it, I dinnae know it. Ask Grenil, for he fancies himself the thinker." } },
  },
}

-- Durtham Greldon: a dwarf of the Hidden Circle in the Forlorn Cavern.
P:NPC {
  key = "if_durtham", id = TODO_NPC("Durtham Greldon"), name = "Durtham Greldon", gender = "male",
  bible = "bibles/missed_a.md", role = "rogue", tier = "service",
  communities = { "ironforge" }, temper = { "guarded", "sly" }, values = { "secretive", "loyal" },
  notices = { "class", "stealth" },
  impression = {
    first = "Durtham Greldon leans in the shadows of the Forlorn Cavern as though the wall were paying him to hold it up. He sees everyone who comes down the tunnel, and he lets very few of them know it.",
    third = "{name} met Durtham Greldon, a quiet dwarf who keeps watch in the Forlorn Cavern.",
  },
  greetings = {
    { id = "g_default", text = "Ye're a long way from the Commons, {class}. Folk who wander down here are either lost or lookin' for someone, and I can help with the first." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. That's twice now, so I'll assume ye're nae lost." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye step lightly and ye checked both ends of the tunnel before ye spoke, so I know what ye are. Hulfdan's further in, and ye'd best nae keep him waitin'." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard ye three paces back, {g:lad|lass}, for the damp makes the stone squeak under a careless heel. It was a fair try, and ye might practise somewhere drier." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Durtham Greldon, and that's as much as most folk get. I stand here and I watch who comes and goes, and I've never yet been paid to talk about it." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Durtham Greldon, of the Hidden Circle, since ye're the sort who may be told. I watch the tunnel so that Hulfdan and Ormyr can teach without the guards countin' their students." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Keep it low." },
        { id = "h_again2", text = "Go on, but mind who's behind ye." },
      },
      choices = {
        { text = "What is the Hidden Circle?", next = "circle" },
        { text = "What sort of folk come down here?", next = "folk" },
        { text = "The guards don't care for this cavern.", next = "guards" },
        { text = "I was only passing.", next = "END" },
      },
    },
    circle = {
      lines = {
        { id = "c_default", text = "I've heard the name, same as ye have. They say it's dwarves who do quiet work for Ironforge that the King's guard cannae be seen doin', and they say a good deal else, and I'd believe about half." },
        { id = "c_rogue", when = { class = "ROGUE" }, text = "It's Ironforge's own knife in the dark, and has been a long while. We do the quiet work the King's guard cannae be seen doin', against the Dark Irons most of all, and we dinnae write any of it down." },
      },
      choices = {
        { text = "Which half do you believe?", next = "half" },
        { text = "Something else.", next = "BACK" },
      },
    },
    half = {
      lines = { { id = "h2_default", text = "The half that says Ironforge has enemies who'll nae line up to be hit with a hammer. A mountain this rich needs someone watchin' the cracks, and whoever that is, I'd wager they like it quiet." } },
      choices = { { text = "Then I'll keep it quiet. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    folk = {
      lines = { { id = "f_default", text = "Fishermen bound for Grimnur's pool, who are harmless. Students for the warlocks in Runes and Dooms, who mostly are, and folk after a blade from Stoneblade's that'll nae be remarked on. Then there's the odd one who's just nosy, like yerself." } },
      choices = { { text = "Fairly said. Something else.", next = "BACK" } },
    },
    guards = {
      lines = { { id = "g_default", text = "They walk through twice a day, lookin' straight ahead, and they're glad to be out again. It's an arrangement that suits both sides, for they've nae wish to see anythin' and we've nae wish to be seen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born in Ironforge and I've seen a good deal of it by lamplight. Leave it there." } },
    _none = { { id = "tp_none", text = "I dinnae know, and if I did, ye'd nae hear it from me for nothin'." } },
  },
}

-- Edris Barleybeard: barmaid at Bruuk's Corner, Military Ward.
P:NPC {
  key = "if_edris", id = TODO_NPC("Edris Barleybeard"), name = "Edris Barleybeard", gender = "female",
  bible = "bibles/missed_a.md", role = "barmaid", tier = "service",
  communities = { "ironforge" }, temper = { "brisk", "sharp" }, values = { "practical", "loyal" },
  notices = { "drink", "hunger" },
  impression = {
    first = "Edris Barleybeard moves through a room of off-duty soldiers with a tray held high and a look that clears a path. She remembers what everyone drinks and exactly what everyone owes.",
    third = "{name} met Edris Barleybeard, the barmaid at Bruuk's Corner in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Sit where ye like, {class}, so long as it's nae the bench by the fire, for that's the gate watch's and they're due. What'll ye have?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I remember what ye drank, so say the word and it's on its way." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye're swayin' like a gyrocopter in a crosswind. Sit down before ye fall down, and I'll bring ye bread to put under all that ale." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "We've a tall stool for gnomes at the end of the bar, so ye'll nae need to shout up at me. Bruuk grumbled about buildin' it, and now he's proud of the thing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Edris Barleybeard. Bruuk's name is over the door and he pours behind the bar, but it's me who carries it to the tables, so I'm the one who hears what Ironforge's soldiers truly think." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a tray waitin'." },
        { id = "h_again2", text = "Quick, now, before table four starts singin'." },
      },
      choices = {
        { text = "What do they truly think?", next = "think" },
        { text = "How do you manage a room of soldiers?", next = "manage" },
        { text = "You and Bruuk are kin?", next = "bruuk" },
        { text = "Just a drink, thank you.", next = "END" },
      },
    },
    think = {
      lines = { { id = "t_default", text = "That they're stretched thin, and they're right. There's mountaineers in here who've nae been home to Kharanos in a season because the troggs give them nae rest, and they'll never say it to an officer, so they say it to their mugs." } },
      choices = {
        { text = "Does anyone tell the officers?", next = "officers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    officers = {
      lines = { { id = "o_default", text = "The officers drink here too, {g:lad|lass}, two tables over, and they've ears like anyone. A tavern is where an army tells itself the truth, and I'd say that's worth more to the King than the ale is to us." } },
      choices = { { text = "Wisely put. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    manage = {
      lines = { { id = "m_default", text = "I learn their mothers' names. There's nae a dwarf in the ranks who'll start a brawl once I've said I'll be writin' to Kharanos about it, and I've only had to post two letters." } },
      choices = { { text = "A fearsome weapon. Something else.", next = "BACK" } },
    },
    bruuk = {
      lines = { { id = "b_default", text = "We're both Barleybeards, aye, and he took me on when the Corner got too busy for one pair of hands. He's gruff as a badger with the customers and soft as butter when one of the regulars doesnae come back from patrol." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've carried trays at Bruuk's Corner a good few years, and I know half the garrison by their drink." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. Ask Bruuk, or better still ask whoever's on their third mug." } },
  },
}

-- Fillius Fizzlespinner: gnome trade supplies vendor in the Commons.
P:NPC {
  key = "if_fillius", id = TODO_NPC("Fillius Fizzlespinner"), name = "Fillius Fizzlespinner", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "chatty", "anxious" }, values = { "thrifty", "precise" },
  notices = { "craft" },
  impression = {
    first = "Fillius Fizzlespinner keeps a trade-supply stall in the Commons and worries aloud about his stock levels to anyone in earshot. He can tell you to the spool how much thread Ironforge used last month.",
    third = "{name} met Fillius Fizzlespinner, a gnome who sells trade supplies in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Trade supplies, trade supplies! Thread, vials, flux and dyes, and I'd buy the vials today if I were you, because I'm down to my last two crates and it's keeping me awake." },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, you're back. I've restocked since you came by, so you can stop worrying, or rather I can." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You're an alchemist, I can tell by the stains. You people are why I can never keep vials on the shelf, and I mean that as the warmest possible compliment." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Coarse thread on the left, fine on the right, and the dyes are sorted by how badly they stain the counter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Fillius Fizzlespinner, trade supplies. I sell the little things every craft runs on, and I keep a tally of all of it, because a city's thread tells you more about how it's doing than any herald will." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I've a count to finish, but it can wait." },
        { id = "h_again2", text = "Yes, yes, go on." },
      },
      choices = {
        { text = "What does the thread tell you?", next = "tally" },
        { text = "Why do your stocks worry you so?", next = "worry" },
        { text = "There's another gnome selling the same goods.", next = "burbik" },
        { text = "Just supplies today.", next = "END" },
      },
    },
    tally = {
      lines = { { id = "t_default", text = "When bandage linen and weak flux both sell out in the same week, the army is about to march somewhere. When it's dye and fine thread, there's a feast coming. Lately it has been linen and flux for eleven weeks running, and I don't care for it at all." } },
      choices = {
        { text = "Eleven weeks? What do you make of it?", next = "eleven" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eleven = {
      lines = { { id = "e_default", text = "That the mountaineers are fighting troggs on more fronts than the heralds admit, and mending more armour than they'd like known. I'm only a supplier, but the figures don't lie, and I've ordered double the linen." } },
      choices = { { text = "A prudent order. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    worry = {
      lines = { { id = "w_default", text = "Because I left Gnomeregan with one bag, and half of what was in it turned out to be useless. I promised myself I'd never again be caught short of anything, and it turns out that's a very tiring promise to keep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    burbik = {
      lines = { { id = "b_default", text = "Burbik Gearspanner, over by the Great Forge, yes. He has a whole shop with his name over the door, and I have a stall and a better location, and we compare ledgers once a month over tea to see which of us was right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a quartermaster's clerk in Gnomeregan. I count things, and in the Commons there is a great deal to count." } },
    _none = { { id = "tp_none", text = "Oh dear, I've no figures on that at all. I don't like to speak without figures." } },
  },
}

-- Fimble Finespindle: leatherworking trainer in Finespindle's Leather Goods.
P:NPC {
  key = "if_fimble", id = TODO_NPC("Fimble Finespindle"), name = "Fimble Finespindle", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "absorbed", "exacting" }, values = { "precise", "proud" },
  notices = { "craft", "class" },
  impression = {
    first = "Fimble Finespindle stitches while he talks and seldom looks up, though his needle never misses its hole. He measures everything twice and holds that a crooked seam is a kind of lie.",
    third = "{name} met Fimble Finespindle, who teaches leatherworking beside the Great Forge.",
  },
  greetings = {
    { id = "g_default", text = "One moment, I'm eleven stitches from the end of this seam. There, now, are you here to learn the craft or to tell me your boots have split?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Show me your last piece, seams outward, and don't tell me which bits you're proud of." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "I see you made that belt yourself, and the stitching is even, which is more than most can say. The edge wants burnishing, though, and I'll show you how." },
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "You wear leather for a living, so you already know what a bad seam costs. People in your line make my best students, because they've felt the draught." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Fimble Finespindle, leatherworker, and this is my family's shop. I teach the craft to anyone with steady hands, and I'm told I'm a hard master, which I take to mean an accurate one." },
      },
      again = {
        { id = "h_again", text = "Yes? I can spare another minute." },
        { id = "h_again2", text = "Go on, I'm only waxing thread." },
      },
      choices = {
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Your apprentice works hard.", next = "gretta" },
        { text = "Why is leather better than mail?", next = "better" },
        { text = "I'll let you finish your seam.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "To cut once. Leather doesn't forgive the way cloth does, so a hide cut wrong is a hide wasted, and Balthus worked hard to get it off the beast in one piece." } },
      choices = {
        { text = "And the second thing?", next = "second" },
        { text = "Something else.", next = "BACK" },
      },
    },
    second = {
      lines = { { id = "s_default", text = "Eight stitches to the inch, no more and no fewer. Fewer and the seam gapes, more and you've perforated the leather like a ticket, and it tears along your own careful work." } },
      choices = { { text = "Eight to the inch. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gretta = {
      lines = { { id = "g_default", text = "Gretta is the most promising apprentice I've had, and I'd be obliged if you didn't tell her so until she's finished her kit pieces. She unpicks her own bad seams before I can find them, which is the whole craft in one habit." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    better = {
      lines = { { id = "b_default", text = "It isn't better, it's different, and I distrust anyone who says otherwise. Mail stops an edge and leather lets you move, so the question is whether you'd sooner be hit and shrug, or not be there when the blow lands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Finespindles were Gnomeregan's belt and gasket makers. I've been a leatherworker all my life, and a teacher of it since we came to Ironforge." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, and I'd rather not guess. I know leather, and I know it thoroughly." } },
  },
}

-- Garel Redrock: a dwarf in the Forlorn Cavern beside Ransin Donner, with an eye for rare creatures.
P:NPC {
  key = "if_garel", id = TODO_NPC("Garel Redrock"), name = "Garel Redrock", gender = "male",
  bible = "bibles/missed_a.md", role = "collector", tier = "service",
  communities = { "ironforge" }, temper = { "genial", "odd" }, values = { "curious" },
  notices = { "pet" },
  impression = {
    first = "Garel Redrock waits in the Forlorn Cavern with the patient air of a dwarf expecting particular visitors. He has a soft spot for strange small creatures, murlocs above all, which most dwarves find hard to credit.",
    third = "{name} met Garel Redrock, a dwarf in the Forlorn Cavern with a fondness for rare creatures.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}! Ye've the look of someone who's come a long way, though whether ye've come to see me is another matter." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye're back! Have ye seen anythin' odd on yer travels, with fins for preference?" },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a handsome beast ye have there, and well kept. I've always said ye can judge a body by how their {pet} looks at them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Garel Redrock, and this quiet fellow beside me is Ransin Donner. We keep an eye out for travellers from far-off gatherin's, and between times I talk to anyone who'll hear me about the creatures of the world." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye?" },
        { id = "h_again2", text = "Aye, go on, I've time enough." },
      },
      choices = {
        { text = "What sort of creatures?", next = "creatures" },
        { text = "A dwarf who likes murlocs?", next = "murlocs" },
        { text = "Why wait down here, of all places?", next = "here" },
        { text = "Good day to you both.", next = "END" },
      },
    },
    creatures = {
      lines = { { id = "c_default", text = "The small and the strange, mostly. Everyone knows a bear and a ram, but there are wee things in the corners of Azeroth that'll follow a body about for nae reason but company, and I think that's a marvel." } },
      choices = { { text = "It is, at that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    murlocs = {
      lines = { { id = "m_default", text = "The grown ones are a menace, I'll grant ye, and I've the scars from Loch Modan's shore to prove it. But a murloc fresh from the egg is nae bigger than yer fist and gurgles like a kettle, and ye'd have a heart of slate to dislike it." } },
      choices = {
        { text = "You've seen one hatch?", next = "hatch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hatch = {
      lines = { { id = "h2_default", text = "I have, and in colours ye'd nae believe, for they're nae all that muddy green. Ransin thinks I'm cracked, and he's stood beside me long enough to have earned the opinion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    here = {
      lines = { { id = "he_default", text = "Because it's damp, and there's a pool, and nobody minds what a body keeps in a bucket. Up in the Commons they'd have the guards on me before the first gurgle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've wandered a fair bit and brought home stranger things than gold. Ransin and I have stood in this cavern a good while now." } },
    _none = { { id = "tp_none", text = "I cannae help ye there, friend, unless it swims, crawls or gurgles." } },
  },
}
