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
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, in Aerie Peak, an' walkin' about free. I'll keep my hand off my hammer, but don't ask me tae smile." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Doran Steelwing. I fly for the Peak, an' I've spent more o' my life starin' down at Witherbark an' Vilebranch than I'd like tae count. Ugly lot, every one of them." },
      },
      again = { { id = "h_again", text = "What else? Make it quick, I've a patrol." } },
      choices = {
        { text = "Why do you hate the trolls so much?", next = "hate" },
        { text = "What's it like riding a gryphon into a fight?", next = "flight" },
        { text = "Which tribe is worst?", next = "worst" },
        { text = "Where do you patrol?", next = "patrol" },
        { text = "Good hunting, Doran.", next = "END" },
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
        { text = "Then there's only the hammer. Finish them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Not all trolls are Vilebranch. Don't damn them all.", next = "BACK", fx = { align = { light = 1 } } },
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
        { text = "The Revantusk leave you be. Leave them be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Horde is Horde. Watch them closely.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
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
    background = { { id = "tp_bg", text = "Born at the Peak, flyin' since I was tall enough tae reach a saddle. Not much more tae tell." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask Fraggar; he knows everythin' the spirits whisper." } },
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
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Ye can stop sneakin'. I've been watchin' that shadow move for the last minute." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kerr Ironsight. I watch the passes an' I count what comes up them, trolls an' travellers an' the odd lost Bronzebeard. Most days, nothin' gets past me." },
      },
      again = { { id = "h_again", text = "Anythin' else? I'm still watchin', mind." } },
      choices = {
        { text = "What have you seen lately?", next = "seen" },
        { text = "How did you get your name?", next = "name" },
        { text = "Do the passes ever stay quiet?", next = "quiet" },
        { text = "What do you watch for from the Horde?", next = "horde" },
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
      lines = { { id = "st_default", text = "Their priests, makin' bargains wi' things they shouldnae. Fraggar says the land's sick around their temples, an' I believe him, but the Thane wants proof before he sends riders." } },
      choices = {
        { text = "Don't wait for proof. Strike now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Thane's right. Proof first, then riders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
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
        { text = "Better too careful than dead.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some risk keeps you sharp. Let them learn.", next = "BACK", fx = { align = { honor = -1 } } },
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
    { id = "n_young", cat = "greenness", when = { maxLevel = 45 },
      text = "Ye're young tae be this far into the Hinterlands, dear. Mind the trolls, an' eat properly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Claira Kindfeather, an' that's my Howin over there, pretendin' he isnae listenin'. We've lived at the Peak longer than most o' the gryphons, an' we like tae watch the young riders come an' go." },
      },
      again = { { id = "h_again", text = "What else, dear? I've all the time in the world." } },
      choices = {
        { text = "Tell me about the gryphons.", next = "gryphons" },
        { text = "How long have you lived here?", next = "long" },
        { text = "What does Howin do all day?", next = "howin" },
        { text = "What do you think of the Thane?", next = "thane" },
        { text = "Goodbye, Claira.", next = "END" },
      },
    },

    gryphons = {
      lines = { { id = "gr_default", text = "Oh, they're darlin's, every one, even the ones that bite. I remember Sharpbeak's mother when she was a chick, an' now her own young one's gone missin' an' Talonaxe is beside himself." } },
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
        { text = "You're right. Nobody gets left behind.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "One gryphon isn't worth a rider's life.", next = "BACK", fx = { align = { honor = -1 } } },
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
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard! Come up from under the mountain tae see the sky, have ye? Lovely, isn't it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Howin Kindfeather, an' I walk the keep every day, round an' round, sayin' hello tae everyone. Claira says I'm a nuisance, but she's smilin' when she says it." },
      },
      again = { { id = "h_again", text = "What else? I've a few more laps in me." } },
      choices = {
        { text = "Why do you walk the keep all day?", next = "walk" },
        { text = "Do you know all the gryphons?", next = "gryphons" },
        { text = "What's new at the Peak?", next = "news" },
        { text = "Who do you like best in the keep?", next = "best" },
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
        { text = "A gryphon's a friend. The riders should remember that.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Gryphons are trained war mounts. Discipline matters more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    news = {
      lines = { { id = "ne_default", text = "Rhapsody's been brewin' again, out east, an' Thulfram's complainin' about it, an' Truk's buyin' it on the quiet. Oh, an' the trolls are bein' trolls, but that's no' new." } },
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
        { text = "Let him be. He's got the aviary to run.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A hello costs nothing. He owes you one.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Married tae Claira, which is the best thing I ever did, an' I've walked these halls ever since." } },
    _none = { { id = "tp_none", text = "I don't know that one! Ask Claira; she remembers the things I forget." } },
  },
}
