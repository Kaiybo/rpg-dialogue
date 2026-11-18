-- Aerie Peak's other folk: Doran Steelwing, a rider who'd rather be fighting trolls than standing about;
-- Kerr Ironsight, who watches the passes; and the Kindfeathers, Claira and Howin, who've lived in the keep
-- longer than most of its gryphons. Voice: bibles/aerie_riders.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "doran", id = TODO_NPC("Doran Steelwing"), name = "Doran Steelwing",
  bible = "bibles/aerie_riders.md", role = "soldier", tier = "service",
  communities = { "aerie_peak" }, temper = { "fierce", "blunt" }, values = { "brave", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Doran Steelwing is a Wildhammer who talks about the forest trolls the way other folk talk about weather they hate. He'd rather be in the air over Jintha'Alor than anywhere else.",
    third = "{name} met Doran Steelwing, a Wildhammer of Aerie Peak with no love for the trolls of the Hinterlands.",
  },

  greetings = {
    { id = "g_default", text = "Another face at the Peak. If ye're here tae fight trolls, ye're welcome, an' if ye're here tae sightsee, ye're in the way." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior, by the look o' that shield! Good, we've trolls enough for everyone." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? How many trolls this time? Round up, I won't check." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good, for ye can drop a troll before he throws, an' that's the only kind o' troll I've any use for." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "An Ironforge dwarf, on foot as usual. We'll have ye in a saddle before ye leave, an' ye'll never look at a ram again." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, in Aerie Peak, an' walkin' about free. I'll keep my hand off my hammer, but don't ask me tae smile." },
  },

  start = "hello",
  nodes = {
    wing = {
      lines = {
        { id = "wg_default", text = "Six of us, when we're all whole, under Gryphon Master Talonaxe's eye. Kerr Ironsight spots for us from the wall, an' Guthrum Thunderfist keeps the birds fed an' shod, which is a harder job than mine." },
      },
      choices = {
        { text = "And the Thane? Does he still fly?", next = "wing_thane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wing_thane = {
      lines = {
        { id = "wt_default", text = "Falstad? Every chance he gets, an' the council has tae near tie him tae his chair tae stop him. He flew in the Second War against the dragons o' the Horde, an' there's no' a rider here who wouldnae follow him off a cliff." },
      },
      choices = {
        { text = "A thane who flies with his riders has earned them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge = {
      lines = {
        { id = "lg_default", text = "Quel'Danil, aye, north an' east o' here. They were friends of ours once, an' now they'll put an arrow in anyone who comes near, dwarf or troll alike. We fly wide o' the place an' leave them tae their sulkin'." },
      },
      choices = {
        { text = "Grief makes poor neighbours of anyone.", next = "lodge_why" },
        { text = "Old friends who shoot at you aren't friends.", next = "lodge_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge_why = {
      lines = {
        { id = "lw_default", text = "I'll no' pretend tae know their minds. Their homeland burned an' they've shut the door on the world since, an' the Thane says tae let them be until they open it. I'll tell ye this, though: they hate the trolls as much as we do." },
      },
      choices = {
        { text = "Then let them be, as the Thane says.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xw_default", text = "Hah! Now that's the right way round: ye hold them in place, an' we come down on their heads. Find me when the Thane next calls a muster, an' I'll ask for ye by name." },
      },
      choices = {
        { text = "Ask for me, and I'll be there.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_falling = {
      lines = { { id = "dd_falling_default", text = "Every rider falls once, an' most of us twice, an' a gryphon will dive after ye if it's a good one. The ones who fall a third time are usually showin' off, an' they don't get a fourth." } },
      choices = {
        { text = "Then I'll learn to respect the heights.", next = "BACK", reply = "Good, that's the first lesson, an' the cheapest one ye'll ever get. Off ye go, an' watch yer feet.", fx = { align = { order = 1 } } },
        { text = "Falling's quick. I'll take the risk for the view.", next = "BACK", reply = "Ha! Spoken like a rider who's no' been one long. Ye'd fit right in here, an' that's no' entirely praise.", fx = { align = { order = -1 } } },
        { text = "Something else, Doran.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Doran Steelwing. I fly for the Peak, an' I've spent more o' my life starin' down at Witherbark an' Vilebranch than I'd like tae count, an' not one o' them got any prettier for it." },
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "Ye fell, didn't ye? I can always tell, for folk who've fallen look at a gryphon the way a drowned man looks at a boat." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've a patrol." },
        { id = "h_again2", text = "Aye? Out wi' it, the bird's gettin' restless." },
        { id = "h_again3", text = "Go on, then, but I'll no' promise a long answer." },
      },
      choices = {
        { text = "Why do you hate the trolls so much?", next = "hate" },
        { text = "What's it like riding a gryphon into a fight?", next = "flight" },
        { text = "Which tribe is worst?", next = "worst" },
        { text = "Where do you patrol?", next = "patrol" },
        { text = "Good hunting, Doran.", next = "END" },
        { text = "You fly with a wing of riders, I take it.", next = "wing" },
        { text = "High elves keep a lodge in these hills.", next = "lodge" },
        { text = "I'd stand a shield line under your gryphons any day.", next = "xwar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I fell off a cliff, Doran. Do riders ever fall?", next = "dd_falling", when = { deathCause = "falling" } },
      },
    },

    hate = {
      lines = { { id = "ha_default", text = "Because they've been throwin' spears at my kin since before I was born, an' they took the Hinterlands for their own long before we came. They want us gone, an' I want them gone, an' that's the whole of it." } },
      choices = {
        { text = "Is there no way to peace with them?", next = "hate_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate_peace = {
      big = true,
      lines = { { id = "hp_default", text = "Peace wi' folk who'd put ye on an altar? The Thane's tried talkin' once or twice, an' each time we buried the messenger." } },
      choices = {
        { text = "Then there's only the hammer left. Finish them.", next = "BACK", reply = "Aye, the hammer, an' I'll swing it gladly. The Vilebranch have had their chances, an' they spent 'em on altars.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Not all trolls are Vilebranch. Don't damn them all.", next = "BACK", reply = "No' all, aye, an' the Revantusk are proof o' that, even if it galls me. I'll keep my hammer for the Vilebranch.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    flight = {
      lines = { { id = "fl_default", text = "Like nothin' else in the world. The wind in yer beard, the bird's heart poundin' under ye, an' the trolls lookin' up just as ye come down on them. Ironforge can keep its tunnels." } },
      choices = {
        { text = "I'd like to try it someday.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worst = {
      big = true,
      lines = { { id = "wo_default", text = "The Vilebranch, wi' their altars an' their priests, an' then the Witherbark close behind. The Revantusk on the coast mostly keep tae themselves, but they're Horde, an' that's reason enough tae watch them." } },
      choices = {
        { text = "The Revantusk leave you be. Leave them be.", next = "BACK", reply = "For now they do, an' I'll return the courtesy. But I'll keep one eye on their boats.", fx = { align = { order = -1 } } },
        { text = "Horde is Horde. Watch them closely.", next = "BACK", reply = "Aye, Horde's Horde, an' the Revantusk would turn on us the moment it suited 'em. I'll watch close.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    patrol = {
      lines = { { id = "pa_default", text = "South over the Overlook Cliffs, east tae the edge o' Jintha'Alor, an' back before the light goes. The Vilebranch have spears that reach higher than ye'd think, so we fly high an' come down fast." } },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    quel_danil = { { id = "tp_qd", text = "The elves' lodge in the hills. They shoot at all comers these days, so we fly round it an' say nothin'." } },
    background = { { id = "tp_bg", text = "Born at the Peak, an' flyin' since I was tall enough tae reach a saddle. There's no' much more tae tell, unless ye want tae hear about the crashes." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask Fraggar, our shaman; he knows everythin' the spirits whisper." } },
  },
}

P:NPC {
  key = "kerr", id = TODO_NPC("Kerr Ironsight"), name = "Kerr Ironsight",
  bible = "bibles/aerie_riders.md", role = "soldier", tier = "service",
  communities = { "aerie_peak" }, temper = { "watchful", "dry" }, values = { "careful", "loyal" },
  notices = { "class", "stealth" },

  impression = {
    first = "Kerr Ironsight watches the passes below Aerie Peak and misses very little, which she says is how she got her name. She sized me up before I'd said a word.",
    third = "{name} met Kerr Ironsight, a watchful Wildhammer at Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "I saw ye comin' up the path a good while ago, so don't look so surprised. What d'ye want?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Ye've got the eyes for it, I'll give ye that, though mine are better." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. I watched ye fly in this time; ye sit a gryphon like a sack o' grain." },
  },

  notice = {
    { id = "n_bronze", cat = "race", when = { race = "Dwarf" },
      text = "Ye'll be the lost Bronzebeard I counted comin' up the pass this mornin'. Ye stopped twice tae catch yer breath, an' I'll say nae more about it." },
    { id = "n_party", cat = "travel", when = { party = { size = 3 } },
      text = "I counted yer whole company on the road, an' ye walk too close together. One good spear cast would find two o' ye." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Ye can stop sneakin'. I've been watchin' that shadow move for the last minute." },
  },

  start = "hello",
  nodes = {
    riders = {
      lines = {
        { id = "ri_default", text = "Better than they'd like. Doran Steelwing dives too early an' gets away wi' it, the young ones bank left when they're frightened, an' Talonaxe hasnae flown a patrol since Sharpbeak was taken, which tells ye all ye need." },
        { id = "ri_home", when = { questDone = TODO_QUEST("Saving Sharpbeak") }, text = "Better than they'd like. Doran Steelwing dives too early an' gets away wi' it, the young ones bank left when they're frightened, an' Talonaxe is flyin' again now Sharpbeak's home, an' the whole wing's the better for it." },
      },
      choices = {
        { text = "Do you tell them what you see?", next = "riders_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders_tell = {
      lines = {
        { id = "rtl_default", text = "I tell Talonaxe, an' he tells them louder. A watcher who lectures the riders finds himself watchin' alone, so I keep my count an' let the gryphon master do the shoutin'." },
      },
      choices = {
        { text = "A sensible division of labour.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond = {
      lines = {
        { id = "by_default", text = "West, the road drops tae the Plaguelands an' on tae Hillsbrad, an' I like nothin' that comes up it. East it's hills an' troll ruins all the way tae the sea, wi' Skulk Rock an' its slimes in the middle an' Seradane up in the north." },
      },
      choices = {
        { text = "What's at Seradane?", next = "beyond_seradane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond_seradane = {
      lines = {
        { id = "bs_default", text = "Green dragons, round a great tree wi' a door in it that goes nowhere I can see. They were quiet for as long as anyone remembers, but they've turned on folk o' late, an' I mark it in my count as somethin' gone wrong." },
      },
      choices = {
        { text = "I'll keep well clear of it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xr_default", text = "I saw the grass move where there was nae wind, an' I counted ye as one traveller, on foot, light step. Ye're good, I'll grant ye, but ye cast a shadow like anyone else." },
      },
      choices = {
        { text = "I'll mind my shadow next time.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Look for where the birds go quiet, for that's where the trolls are. The wolves run the low hills an' the owlbeasts keep tae the thick trees, an' neither will trouble ye half as much as a Witherbark headhunter in the brush." },
      },
      choices = {
        { text = "Where the birds go quiet. Understood.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kerr Ironsight. I watch the passes an' I count what comes up them, trolls an' travellers an' the odd lost Bronzebeard. Most days, nothin' gets past me." },
        { id = "h_dd_witherbark", when = { killed = { name = "Witherbark", min = 30 } },
          text = "I've watched ye from the air, workin' through the Witherbark villages, an' I counted for a while before I lost track. Ye fight like ye've a grudge, an' I'd no' want tae be the one ye're holdin' it against." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I'm still watchin', mind." },
        { id = "h_again2", text = "Go on. I can listen an' watch at once, it's the talkin' that costs me." },
        { id = "h_again3", text = "Aye? Ask, an' I'll keep one eye on ye an' one on the road." },
      },
      choices = {
        { text = "What have you seen lately?", next = "seen" },
        { text = "How did you get your name?", next = "name" },
        { text = "Do the passes ever stay quiet?", next = "quiet" },
        { text = "What do you watch for from the Horde?", next = "horde" },
        { text = "You must know every rider's habits by now.", next = "riders" },
        { text = "What lies beyond the passes you watch?", next = "beyond" },
        { text = "You never saw me come up the pass, did you?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would a hunter look for in these hills?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Keep watching, Kerr.", next = "END" },
      },
    },

    seen = {
      lines = { { id = "se_default", text = "Witherbark scouts in the trees below Shadra'Alor, more of them every week, an' Vilebranch fires at night over Jintha'Alor. Somethin' up there's makin' them bold." } },
      choices = {
        { text = "What do you think it is?", next = "seen_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen_think = {
      big = true,
      lines = { { id = "st_default", text = "Their priests, makin' bargains wi' things they shouldnae. Fraggar, our shaman, says the land's sick around their temples, an' I believe him, but the Thane wants proof before he sends riders." } },
      choices = {
        { text = "Don't wait for proof. Strike now.", next = "BACK", reply = "My heart says the same, an' my hammer's ready. But the Thane wants proof, an' he's the Thane.", fx = { align = { order = -1 } } },
        { text = "The Thane's right. Proof first, then riders.", next = "BACK", reply = "Aye, he is, an' I'll fetch it for him. Then the riders can fly, an' I'll be in front.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = { { id = "na_default", text = "My grandmother had it first, an' she could spot an eagle at a mile. I can only manage half a mile, but nobody's brave enough tae tell me I'm no' livin' up tae it." } },
      choices = {
        { text = "Half a mile is impressive enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quiet = {
      big = true,
      lines = { { id = "qu_default", text = "Never, an' when they seem tae, that's when I watch harder. Some o' the young riders think I worry too much, an' I think they'll learn." } },
      choices = {
        { text = "Better too careful than dead.", next = "BACK", reply = "That's my thinkin' exactly, an' it's kept me breathin' through eleven years o' Vilebranch arrows. The young ones'll learn, if I have tae sit on 'em.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some risk keeps you sharp. Let them learn.", next = "BACK", reply = "They'll learn, aye, the hard way, if they live through the lesson. I'd rather they learned from me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horde = {
      lines = { { id = "ho_default", text = "Wind riders from the troll village on the coast, mostly, an' the odd Forsaken poking about the ruins. They keep their distance an' so do we, but I count them all the same." } },
      choices = {
        { text = "Counting them is wise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Aerie Peak born, Ironsight by blood. I watch, I count, an' I tell the Thane." } },
    _none = { { id = "tp_none", text = "I've no' seen that, an' if I've no' seen it, it didnae happen here." } },
  },
}

P:NPC {
  key = "claira", id = TODO_NPC("Claira Kindfeather"), name = "Claira Kindfeather",
  bible = "bibles/aerie_riders.md", role = "citizen", tier = "service",
  communities = { "aerie_peak" }, temper = { "warm", "chatty" }, values = { "kind", "nature" },
  notices = { "greenness", "pet" },

  impression = {
    first = "Claira Kindfeather has lived at Aerie Peak all her life and speaks of the gryphons as if they were grandchildren. Her husband Howin wanders the keep while she keeps an eye on him.",
    third = "{name} met Claira Kindfeather, a warm old Wildhammer of Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "Hello, dear! Come an' stand by me a moment; Howin's off wanderin' again an' I could do wi' the company." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! Howin asked after ye, or I think he did; he was mumblin'." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Oh, an' who's this? {pet}! What a lovely beast. Keep it away from the aviary, though, there's a dear." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state o' ye, dear. Sit down a moment, an' then go an' see Harggan about those dents before ye go anywhere near a troll." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A wee gnome, all the way up here! Mind the gryphons, dear, for the young ones are curious an' they pick things up." },
    { id = "n_young", cat = "greenness", when = { maxLevel = 45 },
      text = "Ye're young tae be this far into the Hinterlands, dear. Mind the trolls, an' eat properly." },
  },

  start = "hello",
  nodes = {
    folk = {
      lines = {
        { id = "fk_default", text = "Every one, dear, an' most o' their mothers. Thulfram keeps the inn an' frets, Truk keeps the bar an' doesn't, an' Drakk an' Nioma squabble over leather like an old married pair, which Howin an' I find very funny." },
      },
      choices = {
        { text = "And the gryphon master?", next = "folk_talonaxe" },
        { text = "Who should a newcomer speak to first?", next = "folk_first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_talonaxe = {
      lines = {
        { id = "ft_default", text = "Talonaxe has a good heart under all that grumblin', an' he loves those birds more than his own beard. He's short wi' my Howin, but he's short wi' everyone, so we don't take it tae heart." },
      },
      choices = {
        { text = "Grumbling men are often the softest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_first = {
      lines = {
        { id = "ff_default", text = "The Thane, if he's in the hall, for it's only manners. After that, Guthrum Thunderfist at the roost, so the gryphons know yer face, an' then Thulfram for a bed before the riders take them all." },
      },
      choices = {
        { text = "Thank you, Claira. That's a good order.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders = {
      lines = {
        { id = "rd_default", text = "They listen because I feed them, dear, an' because I knew most o' them when they couldnae reach a stirrup. Doran's the fiercest an' Kerr's the most careful, an' I tell each tae borrow a little from the other." },
      },
      choices = {
        { text = "That's good counsel for any soldier.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do they take it?", next = "riders_take" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders_take = {
      lines = {
        { id = "rt_default", text = "Not once, in all these years! But they come back from patrol an' sit by me anyway, so I'll keep sayin' it until one o' us gives in." },
      },
      choices = {
        { text = "My coin's on you, Claira.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpet = {
      lines = {
        { id = "xp_default", text = "If the beast has manners, aye. Let {pet} meet them slow an' from the front, an' keep it away from the nestin' ledges, for a broody hen has nae patience at all. Killium at the stables will find it a quiet corner." },
      },
      choices = {
        { text = "Slow and from the front. I'll see to it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdw_default", text = "A cousin, dear, never a stranger. Ye'll find us louder an' the air thinner, an' if a rider teases ye about caves, tease him back about fallin' off, because they all have." },
      },
      choices = {
        { text = "I'll remember that when the teasing starts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Claira Kindfeather, an' that's my Howin over there, pretendin' he isnae listenin'. We've lived at the Peak longer than most o' the gryphons, an' we like tae watch the young riders come an' go." },
      },
      again = {
        { id = "h_again", text = "What else, dear? I've all the time in the world." },
        { id = "h_again2", text = "Go on, dear. Howin's only on his second lap, so there's nae hurry." },
        { id = "h_again3", text = "Aye? Ask away, I like the company." },
      },
      choices = {
        { text = "Tell me about the gryphons.", next = "gryphons" },
        { text = "How long have you lived here?", next = "long" },
        { text = "What does Howin do all day?", next = "howin" },
        { text = "What do you think of the Thane?", next = "thane" },
        { text = "You must know everyone in the keep by now.", next = "folk" },
        { text = "The young riders seem to listen to you.", next = "riders" },
        { text = "Does a gryphon take to a stranger's beast?", next = "xpet", when = { pet = { type = "Beast" } } },
        { text = "An Ironforge dwarf must seem a stranger up here.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Goodbye, Claira.", next = "END" },
      },
    },

    gryphons = {
      lines = { { id = "gr_default", text = "Oh, they're darlin's, every one, even the ones that bite. I remember Sharpbeak's mother when she was a chick, an' now Sharpbeak himself has gone missin', an' Talonaxe the gryphon master is beside himself." } },
      choices = {
        { text = "What happened to Sharpbeak?", next = "gryphons_sharp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryphons_sharp = {
      big = true,
      lines = {
        { id = "gs_default", text = "The trolls took him, dear, up tae Jintha'Alor, an' some say he's lost an' we should stop riskin' riders on him. I say ye don't leave a bairn behind, feathers or no." },
        { id = "gs_home", when = { questDone = TODO_QUEST("Saving Sharpbeak") }, text = "He's home now, bless whoever fetched him, but there were plenty who said he was lost an' we should stop riskin' riders. I said ye don't leave a bairn behind, feathers or no." },
      },
      choices = {
        { text = "You're right. Nobody gets left behind.", next = "BACK", reply = "Bless ye, dear, I knew ye'd understand. We'll bring him home, every feather.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "One gryphon isn't worth a rider's life.", next = "BACK", reply = "Maybe no', dear, an' I'll no' send ye where ye'd die for him. But I'll never stop hopin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    long = {
      lines = { { id = "lo_default", text = "Since before the Horde came over the sea, dear, an' long before the Thane had his beard. We've seen riders go off tae war an' come back, an' some no' come back, an' the Peak's still here." } },
      choices = {
        { text = "It must have changed a lot.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    howin = {
      lines = { { id = "ho_default", text = "Walks, mostly, round an' round the keep, sayin' hello tae everyone. He says it keeps his legs young, an' I say it keeps him out o' my hair, an' we're both right." } },
      choices = {
        { text = "Sounds like a happy marriage.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thane = {
      lines = { { id = "th_default", text = "Falstad? A good lad wi' a loud voice. I remember him fallin' off his first gryphon, though I'd thank ye no' tae mention it where he can hear." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born at the Peak, married at the Peak, an' I'll be buried at the Peak, though no' for a good while yet." } },
    _none = { { id = "tp_none", text = "I wouldnae know, dear. Ask Howin; he'll make somethin' up for ye." } },
  },
}

P:NPC {
  key = "howin", id = TODO_NPC("Howin Kindfeather"), name = "Howin Kindfeather",
  bible = "bibles/aerie_riders.md", role = "citizen", tier = "service",
  communities = { "aerie_peak" }, temper = { "cheerful", "chatty" }, values = { "friendly", "curious" },
  notices = { "race", "class" },

  impression = {
    first = "Howin Kindfeather walks the keep all day saying hello to everyone, and he said hello to me three times. He knows the name of every gryphon at the Peak and most of their opinions.",
    third = "{name} met Howin Kindfeather, who walks the halls of Wildhammer Keep greeting everyone he meets.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello! Have we met? No matter, we have now. Howin Kindfeather, at yer service." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I remember ye, I think. Ye've the look o' someone I've said hello tae." },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf, at the Peak! Ye'll be the tallest thing in the keep that isnae a gryphon, an' I'll be tellin' everyone by supper." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, are ye? We've no' many here, so mind the riders dinnae ask ye tae light their pipes all evenin'." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard! Come up from under the mountain tae see the sky, have ye? Lovely, isn't it?" },
  },

  start = "hello",
  nodes = {
    rounds = {
      lines = {
        { id = "ro_default", text = "All of it, twice before noon! Up past the hall where the Thane shouts, round by Guthrum's roost, down tae Killium's stables, an' back by Harggan's forge for the warm. Every door has someone worth a hello behind it." },
      },
      choices = {
        { text = "What's the best stop on the way?", next = "rounds_best" },
        { text = "Anything odd on your rounds lately?", next = "rounds_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rounds_best = {
      lines = {
        { id = "rb_default", text = "The roost, when the chicks are hatchin', for there's nothin' in the world so cross as a new gryphon. After that it's Truk's bar, though I only look in, because Claira can smell ale on me from the far wall." },
      },
      choices = {
        { text = "She sounds like a fine lookout herself.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rounds_odd = {
      lines = {
        { id = "rod_default", text = "Kerr's been up on the wall later than he used tae be, an' Fraggar's been starin' at the east as though it owes him money. When the watcher an' the shaman both go quiet, I'd say the trolls are up tae somethin'." },
      },
      choices = {
        { text = "You notice more than they'd guess.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xclaira = {
      lines = {
        { id = "xc_default", text = "She told ye that, did she? She tells everyone! Thirty years I've said good mornin' tae that dwarf, an' I've had four grunts an' a nod for it, an' I treasure the nod." },
      },
      choices = {
        { text = "A nod from Talonaxe is nearly a speech.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "Then ye've found one, cousin! Mind the ledges, for there's nae rail on half o' them, an' dinnae pet a gryphon wi'out askin' the rider. After that it's only stairs, an' ye've stairs in Ironforge." },
      },
      choices = {
        { text = "Stairs I can manage. Lead on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Gladly! The silvermane wolves run the hills just east o' the gate, an' the owlbeasts keep tae the trees further on. Drakk the leatherworker will bless ye for a clean owlbeast pelt, an' Agnar Beastamer knows the ground better than I do." },
      },
      choices = {
        { text = "East of the gate, then. Thank you, Howin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Howin Kindfeather, an' I walk the keep every day, round an' round, sayin' hello tae everyone. Claira says I'm a nuisance, but she's smilin' when she says it." },
        { id = "h_dd_sharpbeak", tags = { "news" }, when = { questDone = TODO_QUEST("Saving Sharpbeak") },
          text = "Ye're the one who brought Sharpbeak home! Claira's no' stopped smilin' since, an' I've been round the keep twice tellin' everyone about it, which is two more times than usual." },
      },
      again = {
        { id = "h_again", text = "What else? I've a few more laps in me." },
        { id = "h_again2", text = "Aye? I can talk an' walk on the spot, I've had the practice." },
        { id = "h_again3", text = "Go on, then. Claira says I never run out, an' she's right." },
      },
      choices = {
        { text = "Why do you walk the keep all day?", next = "walk" },
        { text = "Do you know all the gryphons?", next = "gryphons" },
        { text = "What's new at the Peak?", next = "news" },
        { text = "Who do you like best in the keep?", next = "best" },
        { text = "You must see the whole keep on your rounds.", next = "rounds" },
        { text = "I hear Talonaxe owes you a hello.", next = "xclaira", when = { heardLine = "claira.ft_default" } },
        { text = "A Bronzebeard could use a guide up here, Howin.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Walk with me a while, and tell me where to hunt.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Enjoy your walk, Howin.", next = "END" },
      },
    },

    walk = {
      lines = { { id = "wa_default", text = "Because if ye stop walkin', ye stop, an' I'm no' ready tae stop. Besides, somebody has tae know where everyone is, an' it might as well be me." } },
      choices = {
        { text = "That's wise, Howin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gryphons = {
      big = true,
      lines = { { id = "gr_default", text = "Every one, by name an' by temper! Some o' the young riders think a gryphon's just a mount, an' I tell them a gryphon's a friend who lets ye sit on it." } },
      choices = {
        { text = "A gryphon's a friend. The riders should remember that.", next = "BACK", reply = "Aye, that's it exactly! Ye've a gryphon's heart, I can tell. Old Skyfang would've liked ye; he liked everyone who scratched behind his ears.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Gryphons are trained war mounts. Discipline matters more.", next = "BACK", reply = "Discipline matters, aye, but so does a kind word, an' I've seen which one keeps a rider alive. Ye'll learn.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    news = {
      lines = { { id = "ne_default", text = "Rhapsody Shindigger's been brewin' again, out east, an' Thulfram the innkeeper's complainin' about it, an' Truk at the bar is buyin' it on the quiet. Oh, an' the trolls are bein' trolls, but that's no' new." } },
      choices = {
        { text = "You really do know everything here.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    best = {
      lines = { { id = "be_default", text = "Claira, o' course, an' then Thulfram, because he gives me the end o' the loaf. Talonaxe I like least, because he never says hello back." } },
      choices = {
        { text = "Should I tell Talonaxe to say hello?", next = "best_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_stance = {
      big = true,
      lines = { { id = "bs_default", text = "Oh, would ye? No, no, he'd only grumble at me more. Mind, a gryphon master has enough on his plate, so maybe I should let him be." } },
      choices = {
        { text = "Let him be. He's got the aviary to run.", next = "BACK", reply = "Aye, ye're right, he's got a hundred birds an' a hundred riders tae fret over. I'll leave him be, for now.", fx = { align = { honor = -1 } } },
        { text = "A hello costs nothing. He owes you one.", next = "BACK", reply = "It does, doesn't it? Maybe I'll say it first, an' see if he answers. Ye've given me courage.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Married tae Claira, which is the best thing I ever did, an' I've walked these halls ever since." } },
    _none = { { id = "tp_none", text = "I don't know that one! Ask Claira; she remembers the things I forget." } },
  },
}
