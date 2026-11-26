-- Ironforge folk the first passes missed (Bruuk to Garel): Bruuk's Corner in the Military Ward, two gnome trade
-- suppliers, the wandering courier, the Hall of Arms' old hand, the Vault's administrator, Bink's brother,
-- Craghelm's and Steelfury's, the Hidden Circle's man, the leatherworking trainer and a collector in the Cavern.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
    hf_paladin = {
      lines = { { id = "hfp_default", text = "Then the Light needs ye in the Plaguelands more than anywhere, for the dead walk there by the thousand. Commander Ashlam Valorfist at Chillwind would be glad of a {g:brother|sister} of the Light who doesnae flinch at a ghoul." } },
      choices = { { text = "I won't flinch. Something else.", next = "BACK" } },
    },
    hf_dwarf = {
      lines = { { id = "hfd_default", text = "Ha! A Bronzebeard askin' for the Wildhammer, and there's many in this city who'd frown at that. Still, Aerie Peak's always short of hands against the Witherbark trolls, and Falstad's folk respect a dwarf who'll climb." } },
      choices = { { text = "Then I'll climb. Something else.", next = "BACK" } },
    },
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
        { text = "A paladin goes where the Light is needed.", next = "hf_paladin", when = { class = "PALADIN" } },
        { text = "Send me to the Hinterlands, among the Wildhammer.", next = "hf_dwarf", when = { race = "Dwarf" } },
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
        { text = "Did you serve in the field yourself?", next = "xd_field" },
        { text = "I'm a warrior. Any advice from the old guard?", next = "xd_warr", when = { class = "WARRIOR" } },
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
    xd_field = {
      lines = {
        { id = "xdf_default", text = "Thirty years, most of them in the Wetlands holdin' the road to Dun Modr. Ye learn a great deal about patience in a swamp, and nothin' good about yer boots." },
      },
      choices = {
        { text = "What brought you back to the Hall?", next = "xd_field2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xd_field2 = {
      lines = {
        { id = "xdf2_default", text = "A Dragonmaw spear through the knee, near Grim Batol. It healed crooked, so they gave me a stool in the Hall of Arms and told me to make soldiers instead of bein' one. I've made a few good ones." },
      },
      choices = {
        { text = "What makes a good soldier, to your mind?", next = "xd_good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xd_good = {
      lines = {
        { id = "xdg_default", text = "There's two schools of it in this Hall. One says a soldier does as he's told and nae more. The other says a soldier thinks, and sometimes that means thinkin' past his orders. I've buried dwarves from both schools." },
      },
      choices = {
        { text = "Discipline wins wars. A soldier follows orders.", next = "BACK", reply = "Aye, that's the Hall's teachin', and it's kept the line many a time.", fx = { align = { order = 1 } } },
        { text = "A soldier who can't think dies with his orders.", next = "BACK", reply = "Hmph. I've seen that too, more than I'd like. Ye may have the right of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xd_warr = {
      lines = {
        { id = "xdw_default", text = "Learn to fight tired. Any fool can swing well for a minute, but a battle runs for hours, and the dwarf still swingin' clean at the end is the one who goes home. Drill till yer arms quit, then drill once more." },
      },
      choices = {
        { text = "I'll remember it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hall_of_arms = { { id = "tp_hall", text = "The Hall has turned out soldiers since before the Second War. I'm proud to sit in it, even on a stool." } },
    grim_batol = { { id = "tp_batol", text = "Dragonmaw country, and worse than that underneath. Stay well clear unless ye've an army behind ye." } },
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
        { text = "What keeps you up at night?", next = "ysleep" },
        { text = "Who holds the deepest boxes?", next = "ydeep" },
        { text = "Does the Vault serve gnomes as well?", next = "BACK", when = { race = "Gnome" }, reply = "It does, and it opened their boxes free the season Gnomeregan fell. I signed that order myself, and I'd sign it again." },
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
  
    ysleep = {
      lines = {
        { id = "ydinita_ysleep_d", text = "A key I cannae account for. My mother's ledger lists nine master keys, and I hold eight. The ninth went down to the deep boxes with her uncle forty years ago, and neither came back up." },
      },
      choices = {
        { text = "You think someone has it?", next = "ykey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykey = {
      lines = {
        { id = "ydinita_ykey_d", text = "I think a key that isnae in my hand is a key in someone else's, and that's reason enough to change every lock. Changin' them means openin' every box, though, and some of those boxes have nae been opened in three hundred years." },
      },
      choices = {
        { text = "Change the locks. Every box, however old.", next = "BACK", reply = "Aye. It'll take a year and cost a fortune, and it's the only honest answer.", fx = { align = { order = 1 } } },
        { text = "Let sleeping boxes lie. Don't open what isn't yours.", next = "BACK", reply = "Ye sound like my bankers. I'll weigh it, though I doubt I'll sleep any better.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydeep = {
      lines = {
        { id = "ydinita_ydeep_d", text = "The old clans, mostly, Anvilmars and Bronzebeards and a few families whose names are on nae door in the city any longer. The King's box is down there too, and I'll say nae more than Bailey already has." },
        { id = "ydinita_ydeep_v0", when = { race = "Dwarf" }, text = "The old clans, {g:lad|lass}, same as ye'd guess. Yer own family's box may well be down there, if they ever had coin worth keepin', and I'd look it up for ye with the proper seal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    vault = { { id = "ydinita_tp_vault", text = "The Vault sits below the Commons, cut deep enough that the Great Forge cannae warm it. I keep a shawl at my desk for it." } },
    explorers = { { id = "ydinita_tp_explorers", text = "The League pays its debts, eventually, and Magellas signs every note with a flourish I have to squint at." } },

    background = { { id = "tp_bg", text = "The Vault's ledger has passed from one Stonemantle to the next for generations. It came to me, and it'll leave my hands as clean as I found it." } },
    _none = { { id = "tp_none", text = "If it's nae written in my ledger, I've nae opinion on it. Good day to ye." } },
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
        { text = "Which of you is the better smith, truly?", next = "xo_better" },
        { text = "I'm a hunter. How should mail sit for archery?", next = "xo_hunt", when = { class = "HUNTER" } },
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
    xo_better = {
      lines = {
        { id = "xob_default", text = "Olthran will tell ye he is, loudly. I'll tell ye that plate is mostly hammerin' and mail is mostly thinkin', and leave ye to draw yer own sums." },
      },
      choices = {
        { text = "How long does one shirt take?", next = "xo_shirt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xo_shirt = {
      lines = {
        { id = "xos_default", text = "Six weeks for a good hauberk, if my eyes hold out. Four rings through every one, each riveted by hand. I do the riveting at night, when the shop is quiet, because a man cannae count rings with Olthran hammerin' beside him." },
      },
      choices = {
        { text = "Why not sell cheaper, faster mail?", next = "xo_cheap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xo_cheap = {
      lines = {
        { id = "xoc_default", text = "There's a smith in the Commons who butts his rings instead of rivetin' them. Half the price, and it looks the same on the wall. It looks very different after a sword finds the gap." },
      },
      choices = {
        { text = "Honest work at a fair price. You're right to hold out.", next = "BACK", reply = "Thank ye. It's a slow road, but my name's on every shirt.", fx = { align = { honor = 1 } } },
        { text = "Cheap mail on many backs beats fine mail on few.", next = "BACK", reply = "There's sense in that, I'll grant, but I'll nae be the one sellin' it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xo_hunt = {
      lines = {
        { id = "xoh_default", text = "Loose at the shoulders and short in the sleeve, so the bowstring cannae catch a ring. Most hunters buy a shirt cut for a warrior and wonder why their arrows fly wide. I'll fit ye right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    military_ward = { { id = "tp_ward", text = "Every armourer in the Military Ward knows every other, and we all think we're the best. Some of us are right." } },
    background = { { id = "tp_bg", text = "Craghelms have sold armour in the Military Ward a long while. I took the chain side of the shop because I've the patience for it." } },
    _none = { { id = "tp_none", text = "That's outside my trade, friend. Ask in the Hall of Arms across the way." } },
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
        { text = "Do you ever get bored, just watching?", next = "xr_bored" },
        { text = "I'm one of you. Any word from the Circle?", next = "xr_rogue", when = { class = "ROGUE" } },
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
      lines = { { id = "guards_default", text = "They walk through twice a day, lookin' straight ahead, and they're glad to be out again. It's an arrangement that suits both sides, for they've nae wish to see anythin' and we've nae wish to be seen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xr_bored = {
      lines = {
        { id = "xrb_default", text = "Never. Watchin' is like readin' a book written in boots and faces. I can tell who's lost, who's lyin' and who's about to start a fight before they know it themselves." },
      },
      choices = {
        { text = "What do you see in me?", next = "xr_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xr_me = {
      lines = {
        { id = "xrm_default", text = "Ye've asked a watcher what he sees, which tells me ye're curious and nae afraid of the answer. Ye looked behind ye twice on the way down the tunnel. I'll keep the rest to myself." },
      },
      choices = {
        { text = "Do you ever tell the guards what you see?", next = "xr_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xr_guards = {
      lines = {
        { id = "xrg_default", text = "Once in a long while, if somebody means real harm to the city. Most of what passes here is small business, a debt or a grudge, and that I keep. A cavern that talks to the guards soon stops bein' useful." },
      },
      choices = {
        { text = "Silence is the deal. Keep everyone's secrets.", next = "BACK", reply = "Aye. That's how the Circle survives, and how I do.", fx = { align = { order = -1 } } },
        { text = "If you see a crime, the guards should know.", next = "BACK", reply = "Spoken like a citizen. Ye'd make a poor watcher, but likely a better neighbour.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xr_rogue = {
      lines = {
        { id = "xrr_default", text = "Word is a Dark Iron agent was seen near the Deeprun Tram, so keep yer eyes open and yer blade quiet. Ormyr would pay for a name. Ye didnae hear it from me." },
      },
      choices = {
        { text = "I heard nothing. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_cavern", text = "It's nae a dangerous place, whatever the guards say. It's a place for folk who'd rather nae be seen, and that's different." } },
    dark_iron = { { id = "tp_darkiron", text = "They've spies in this city, I'd swear it. I've seen boots that never touched an Ironforge road." } },
    background = { { id = "tp_bg", text = "I was born in Ironforge and I've seen a good deal of it by lamplight. Leave it there." } },
    _none = { { id = "tp_none", text = "I dinnae know, and if I did, ye'd nae hear it from me for nothin'." } },
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
        { text = "Who exactly are you waiting for?", next = "xa_wait" },
        { text = "I've a pet of my own. Like it?", next = "xa_pet", when = { class = "HUNTER" } },
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
    xa_wait = {
      lines = {
        { id = "xaw_default", text = "Folk from the Darkmoon Faire, mostly, and those who bring wee creatures back from their travels. A murloc hatchling came through here once in a bucket, and I've nae been the same since." },
      },
      choices = {
        { text = "Tell me about the hatchling.", next = "xa_hatch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xa_hatch2 = {
      lines = {
        { id = "xah2_default", text = "Wee green thing, eyes like marbles, and it gurgled at me as if it knew a joke I didnae. The fellow carryin' it was takin' it to Stormwind to sell. I've wondered ever since whether it found a good home." },
      },
      choices = {
        { text = "Should creatures like that be sold at all?", next = "xa_sold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xa_sold = {
      lines = {
        { id = "xas_default", text = "Ransin says a beast is a beast, and if a gold coin keeps it fed, that's better than a swamp. I say a thing that can look at ye like that belongs where it was born." },
      },
      choices = {
        { text = "Wild things belong in the wild. Leave them be.", next = "BACK", reply = "Aye! Thank ye. Ransin, did ye hear that?", fx = { align = { light = 1 } } },
        { text = "A fed pet is better off than a hungry wild one.", next = "BACK", reply = "Hmph. That's Ransin's very argument. He'll be insufferable now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xa_pet = {
      lines = {
        { id = "xap_default", text = "Oh, aye, a handsome beast, and well kept by the look of its coat. Ye can tell how a hunter treats a pet by how it stands beside them, and that one stands proud." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_faire", text = "When the Faire comes near, I'll be first in line. They've the strangest wee creatures in all the world." } },
    background = { { id = "tp_bg", text = "I've wandered a fair bit and brought home stranger things than gold. Ransin and I have stood in this cavern a good while now." } },
    _none = { { id = "tp_none", text = "I cannae help ye there, friend, unless it swims, crawls or gurgles." } },
  },
}
