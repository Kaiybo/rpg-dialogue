-- Aerie Peak: the Wildhammer stronghold in the Hinterlands. Voice: bibles/hinterlands.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falstad", id = TODO_NPC("Falstad Wildhammer"), name = "Falstad Wildhammer",
  bible = "bibles/hinterlands.md", role = "noble", tier = "major",
  communities = { "aerie_peak" }, temper = { "boisterous" }, values = { "proud", "brave", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "Falstad Wildhammer greets visitors like long-lost kin and talks of trolls the way other people talk of weather to be got through. A Wildhammer and his gryphon, he says, are one creature.",
    third = "{name} met Falstad Wildhammer, High Thane of the Wildhammer clan, at Aerie Peak.",
  },

  greetings = {
    { id = "g_keep", text = "Ha! A visitor tae Wildhammer Keep! Come in, come in, an' tell me ye're here tae fight trolls!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good! I like a face that keeps comin' back, for it means the trolls didnae get it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' Ironforge, here among the Wildhammer! The mountain's fine, {g:lad|lass}, but ye've no seen anythin' till ye've seen it from a gryphon's back." },
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "Ye've the look o' someone who knows beasts, so the gryphons'll like ye, probably." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Falstad Wildhammer, High Thane o' the Wildhammer clan! The forest trolls are pressin' in on the Hinterlands, an' I mean tae push 'em back where they came from." },
        { id = "h_hinterlands", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("To The Hinterlands") }, { questActive = TODO_QUEST("Gryphon Master Talonaxe") } } },
          text = "Ye've come tae help! Then go see Talonaxe at the aviary, an' he'll put ye where the fightin's thickest." },
        { id = "h_magni", when = { heardLine = "magni.h_default" },
          text = "Ye've been tae Ironforge an' stood before Bronzebeard, have ye? He's a fine king, for a dwarf who never leaves the ground." },
        { id = "h_sharpbeak", tags = { "news" }, when = { questRecent = { TODO_QUEST("Saving Sharpbeak"), days = 3 } },
          text = "Sharpbeak's home! The whole aviary sang last night. Ye've a friend in every Wildhammer on this peak now, an' a few o' the gryphons too." },
      },
      again = {
        { id = "h_again", text = "What else? Out wi' it, for I've trolls tae think about!" },
        { id = "h_again2", text = "Ha! More questions, an' I like a curious one, so go on." },
      },
      choices = {
        { text = "Tell me about the gryphon riders.", next = "gryphons" },
        { text = "Who are these trolls?", next = "trolls" },
        { text = "Are the Wildhammer part of the Alliance?", next = "alliance" },
        { text = "Who are your allies out here?", next = "allies" },
        { text = "Ironforge sends its regards.", next = "bronzebeard", when = { race = "Dwarf" } },
        { text = "My people glide on the wind.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the Wildhammer count me a friend yet?", next = "friend", when = { townStanding = { town = "aerie_peak", min = 30 } } },
        { text = "I'm here to fight trolls.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
      },
    },
    gryphons = {
      big = true,
      lines = {
        { id = "g_default", text = "We've flown since before the Second War, an' we flew in it, against the Horde. A Wildhammer an' his gryphon are one creature in the air. Nothin' on the ground can match it." },
      },
      choices = {
        { text = "Could I learn to fly like that?", next = "gryphons_learn" },
        { text = "I'd like to see that.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    gryphons_learn = {
      lines = { { id = "gl_default", text = "Learn? Ha! A gryphon picks ye, or it doesnae. Talonaxe'll let ye ride with the flights, an' that's as close as most outsiders get, so be grateful for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      lines = {
        { id = "t_default", text = "Witherbark in the west, Vilebranch up in Jintha'Alor, Revantusk on the coast. Three tribes, all hatin' each other, all hatin' us more. It's very nearly cosy." },
      },
      choices = {
        { text = "Which are the worst?", next = "trolls_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_worst = {
      lines = { { id = "tw_default", text = "The Vilebranch, with blood on their altars an' cages full o' things they've no right tae. Fraggar can tell ye more, if ye can stand tae hear it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alliance = {
      big = true,
      lines = { { id = "a_default", text = "We fought for it an' bled for it, then came home an' decided we'd rather answer tae our own sky. We're friends tae any who prove themselves, so prove yerself." } },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The Alliance needs every hammer it can get.", next = "BACK", fx = { affinity = -1, align = { order = 2 } } },
        { text = "You miss the riders who flew off with the Alliance.", tag = "Persuade", next = "kurdran",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Dwarf" }, { trait = "brave" } } } },
          fail = { next = "kurdran_no", fx = { affinity = -1 } } },
      },
    },
    allies = {
      lines = { { id = "al_default", text = "The elves o' Quel'Danil, in the hills. Old friends from the old wars. They don't drink enough, but they shoot straight an' they don't run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bronzebeard = {
      lines = { { id = "b_default", text = "Does it! Then tell the Bronzebeards the Wildhammer are well, an' flyin', an' still better company, an' they'll know I mean it kindly, mostly." } },
      choices = {
        { text = "I'll pass it on. Word for word.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Ironforge has its own strengths.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    skyborne = {
      lines = { { id = "s_default", text = "Glide! Downhill, aye? A gryphon goes up, {g:lad|lass}. Up! Come back when yer wind can carry ye over a mountain, an' we'll talk about who flies better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    friend = {
      lines = { { id = "f_default", text = "Count ye? The riders toast ye by name at the bar. That's more than they do for me, an' I'm their Thane." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kurdran = {
      lines = {
        { id = "ku_default", text = "Aye, ye've a sharp eye for a flatlander. Kurdran flew through the Dark Portal wi' the Alliance an' a fine flight o' riders behind him, an' none o' them came back when it closed, so every night at the bar I drink one tae them an' tell nobody why." },
        { id = "ku_dwarf", when = { race = "Dwarf" },
          text = "Ye're a dwarf, so ye'll have heard the tale. Kurdran took our best riders through the Dark Portal wi' the Alliance, an' it closed behind 'em, an' I've raised a mug tae them every night since without once sayin' so out loud." },
      },
      choices = {
        { text = "Here's to Kurdran, then.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kurdran_no = {
      lines = {
        { id = "kn_default", text = "Miss someone? Ha! I miss the days when trolls ran at the sight o' me, an' that's all the missin' I've time for." },
        { id = "kn_elf", when = { race = "NightElf" },
          text = "Ye elves an' yer long faces! I miss nothin' but a quiet sky, an' I'll have that when the trolls are gone." },
      },
      choices = {
        { text = "Fair enough, Thane.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every rider in Aerie Peak reports tae me, an' half o' them exaggerate, so I've learned a great deal! Ask away." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask me anythin' ye like! Ye've earned the riders' respect, an' that means ye've earned mine." },
    },
    background = { { id = "tp_ba", text = "Wildhammer born, gryphon raised, an' Thane by right o' bein' the loudest! The Second War made a rider o' me, an' the Hinterlands made a Thane.", next = "gryphons" } },
    advice = { { id = "tp_ad", text = "Never fight a troll on its own ground; fight it from above, for everythin' is easier from above." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons! Don't get me started, or we'll be here till the sun's down an' up again." } },
    _none = { { id = "tp_none", text = "Never heard o' it! Is it a troll, now? Then I'll hear of it soon enough." } },
  },
}

P:NPC {
  key = "talonaxe", id = TODO_NPC("Gryphon Master Talonaxe"), name = "Gryphon Master Talonaxe",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "gruff" }, values = { "loyal", "practical" },
  notices = { "class" },

  impression = {
    first = "Gryphon Master Talonaxe would plainly rather be in the air than talking to me. He keeps the aeries safe from the trolls, and I don't think he's ever lost an argument with one.",
    third = "{name} met Gryphon Master Talonaxe, who keeps the aviary at Aerie Peak safe from the forest trolls.",
  },

  greetings = {
    { id = "g_aviary", text = "Aye, what is it? I'd rather be up in the air than down here talkin', but the gryphons won't take orders from the ground, so somebody has tae." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Keep yer pet away from the gryphons, or they'll eat it an' then look at ye for more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gryphon Master Talonaxe. I keep the aviary, an' the trolls keep tryin' tae get at the aeries, an' I keep stoppin' 'em." },
        { id = "h_cages", tags = { "news" }, when = { questActive = TODO_QUEST("Witherbark Cages") },
          text = "The Witherbark have cages in their villages, so go an' see what's in 'em, though I've a nasty feelin' I know." },
        { id = "h_altar", when = { questActive = TODO_QUEST("The Altar of Zul") },
          text = "There's trolls doin' troll business up at the Altar o' Zul, an' none of it good, so go an' look." },
        { id = "h_sharpbeak", when = { questActive = TODO_QUEST("Saving Sharpbeak") },
          text = "Sharpbeak, Swiftwind an' Keenclaw's young one, is locked in a cage at the top o' Jintha'Alor, where the Vilebranch have him. Bring the wee beast home." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to the Hinterlands") },
          text = "Back from the south, are ye? Good, for now we know what the trolls are about, an' we can do somethin' about it." },
        { id = "h_rhapsody", when = { questActive = TODO_QUEST("Rhapsody Shindigger") },
          text = "Rhapsody Shindigger's got a camp out east o' here, brewin' who knows what. Go see what he wants, because I'm no' goin'." },
        { id = "h_saved", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Saving Sharpbeak"), days = 3 } },
          text = "Sharpbeak hasnae left his mother's side since ye brought him back, an' Keenclaw let me near him this mornin', for the first time. I'll no' forget it." },
      },
      again = { { id = "h_again", text = "What? Quick, they're wantin' fed." } },
      choices = {
        { text = "Who's Sharpbeak?", next = "sharpbeak" },
        { text = "Why do the trolls want the gryphons?", next = "trolls" },
        { text = "You'd rather be flying?", next = "flying" },
        { text = "What's Rhapsody brewing?", next = "rhapsody" },
        { text = "My pet won't bother your birds.", next = "pet", when = { class = "HUNTER" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    sharpbeak = {
      big = true,
      lines = { { id = "s_default", text = "He's Swiftwind an' Keenclaw's young one, the best bloodline on the peak. The Vilebranch took him for their altar, an' every gryphon in this aviary knows it; they've no' been quiet since." } },
      choices = {
        { text = "I'll bring him home.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "For their altars, an' for spite, because a Wildhammer without a gryphon's half a Wildhammer, an' they know it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flying = {
      lines = { { id = "f_default", text = "Every day, but the birds need somebody on the ground who knows 'em, an' I'm the somebody. One day I'll train a lad as good as me, an' then I'm off." } },
      choices = {
        { text = "That day might never come.", next = "flying_never", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying_never = {
      lines = { { id = "fn_default", text = "Aye, I know, but don't tell the lads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rhapsody = {
      lines = { { id = "r_default", text = "Somethin' that'd strip paint off a keel. The riders love it an' the gryphons won't go near him, which tells ye which o' them has more sense." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet = {
      lines = { { id = "p_default", text = "It willnae; it's the birds I'm worried about botherin' it, so keep it close." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The gryphons see the whole Hinterlands, an' their riders tell me what they saw. Ask, an' be quick about it." },
    },
    background = { { id = "tp_ba", text = "Rider, then trainer, then the one who never gets tae ride, an' funny how that happens.", next = "flying" } },
    advice = { { id = "tp_ad", text = "Bring a gryphon a fish an' it'll remember ye. Bring it two, an' it'll follow ye home." } },
    _none = { { id = "tp_none", text = "Does it fly? If no', then I've no idea." } },
  },
}

P:NPC {
  key = "fraggar", id = TODO_NPC("Fraggar Thundermantle"), name = "Fraggar Thundermantle",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "solemn" }, values = { "devout", "protective" },
  notices = { "class" },

  impression = {
    first = "Fraggar Thundermantle's eyes are failing, but he listens to the land and says it is not happy. The Vilebranch rites trouble him deeply.",
    third = "{name} sat with Fraggar Thundermantle, who speaks for the spirits of the Hinterlands at Aerie Peak.",
  },

  greetings = {
    { id = "g_spirits", text = "Sit, friend. My eyes are no' what they were, but I hear the land well enough, an' it's no' happy." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "Ye hear the spirits too. Then ye'll know what I mean when I say the trolls' altars make 'em weep." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fraggar Thundermantle, an' I speak for the spirits o' this land. The Vilebranch spill blood on their altars an' call it worship, but the land remembers every drop." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Necklace Bounty") },
          text = "Bring me the trolls' necklaces, for each one's a charm against the spirits I serve, an' each one I take is a little less o' their dark work." },
        { id = "h_skulk", when = { questActive = TODO_QUEST("Skulk Rock Clean-up") },
          text = "Skulk Rock is fouled. Clean it, an' the spirits there can rest again." },
        { id = "h_eyes", when = { metBefore = true }, text = "My eyes grow dimmer each winter, an' the spirits grow louder tae make up for it. I think they're bein' kind." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the wind on the peak? That's no' only wind, for the old spirits walk the ridges after dark." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin', as I'm always listenin'." } },
      choices = {
        { text = "What do the spirits say?", next = "spirits" },
        { text = "Your eyes?", next = "eyes" },
        { text = "What happens at the altars?", next = "altars" },
        { text = "An Ironforge dwarf who hears the elements. What do you make of me?", next = "dwarfshaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "I hear them too.", next = "hear", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "I'll help the spirits.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The spirits can fend for themselves, old man.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "That they're tired, an' that they've been bled for a long time, an' they'd like it tae stop. It's nothin' clever, for the old ones rarely say anythin' clever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eyes = {
      lines = { { id = "e_default", text = "Goin', slowly. I can tell a friend from a troll by the walk, an' a liar by the breath. That's all a shaman truly needs tae see." } },
      choices = {
        { text = "Then what do you see in me?", next = "eyes_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes_me = {
      lines = {
        { id = "em_default", text = "Somebody walkin' steady an' breathin' easy, who's no' lied tae me yet, so keep it that way." },
        { id = "em_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "Somebody carryin' somethin' heavy an' dark. I'll no' ask what, though the spirits might." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    altars = {
      big = true,
      lines = { { id = "a_default", text = "Blood, an' bindin', an' callin' on things that should stay asleep. The Vilebranch think the spirits answer them, an' somethin' answers, but it isnae the spirits." } },
      choices = {
        { text = "Then the altars must fall.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "If something answers them, maybe it's worth hearing out.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarfshaman = {
      lines = { { id = "d_default", text = "That Ironforge is finally listenin'! The Wildhammer have heard the spirits since before the Bronzebeards learned tae dig. Welcome, cousin. Ye're late, but ye're welcome." } },
      choices = {
        { text = "Better late.", next = "BACK", fx = { affinity = 3, trait = { pious = 1 } } },
        { text = "Ironforge has its own ways.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    hear = {
      lines = { { id = "h2_default", text = "Then ye'll know what I mean when I say this land's grievin'. Sit wi' me a moment some evenin', for they speak easier tae two." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The spirits speak, an' I listen, an' now an' then they tell me somethin' worth passin' on. Ask, an' I'll tell ye what I can." },
    },
    background = { { id = "tp_ba", text = "Wildhammer, shaman an' listener; the spirits found me young, an' they've no' let go since." } },
    advice = { { id = "tp_ad", text = "When the wind goes quiet in the Hinterlands, listen harder, for somethin's holdin' its breath." } },
    _none = { { id = "tp_none", text = "The spirits haven't spoken o' that, an' so neither will I." } },
  },
}

P:NPC {
  key = "thulfram", id = TODO_NPC("Innkeeper Thulfram"), name = "Innkeeper Thulfram",
  bible = "bibles/hinterlands.md", role = "innkeeper", tier = "service",
  communities = { "aerie_peak" }, temper = { "jovial" }, values = { "generous", "friendly" },
  notices = { "drink", "weary" },

  impression = {
    first = "Innkeeper Thulfram promised a fire hot enough to thaw a gryphon and very nearly delivered. Everyone ends up at his bar sooner or later, he says, and I believe it.",
    third = "{name} rested at Innkeeper Thulfram's inn at Aerie Peak, where gryphon riders and wanderers all end up at his bar.",
  },

  greetings = {
    { id = "g_inn", text = "Come in, come in, an' pull up a bench! There's ale, there's stew, an' there's a fire hot enough tae thaw a gryphon." },
    { id = "g_home", when = { homeInn = { "Aerie Peak", "Wildhammer Keep" } }, text = "Home again! Yer bed's warm an' yer mug's full. What more could a body want?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Now ye're drinkin' like a Wildhammer, but don't go near the gryphons like that." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dead a wee while, so sit down; ale fixes most things, an' stew fixes the rest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Thulfram, at yer service. Gryphon riders, hunters, wanderers: they all end up at my bar. Stay as long as ye like." },
        { id = "h_tale", when = { metBefore = true }, text = "A rider came in last night swearin' his gryphon talked tae him, though he'd had three ales first. Still, I've no' heard a better story all week." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The gryphons settle late, an' ye can hear 'em croonin' in the aviary if the fire's low. It's the best sound in the Hinterlands." },
      },
      again = { { id = "h_again", text = "Anythin' else? Yer mug's no' empty yet." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What do the riders talk about?", next = "riders" },
        { text = "What's the strongest thing you pour?", next = "strong" },
        { text = "A mug, please.", next = "END", fx = { affinity = 1 } },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "Trolls, gryphons, an' whose gryphon's best. That last one's ended three friendships an' started two weddings." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strong = {
      lines = { { id = "s_default", text = "Nothin' I pour. If ye want strong, ye want Rhapsody's camp out east, an' ye want a friend tae carry ye home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everythin' worth knowin' in Aerie Peak gets said at my bar sooner or later! Ask, an' I'll tell ye what I've heard." },
    },
    background = { { id = "tp_ba", text = "I've poured for this keep longer than some o' the gryphons have been alive. They don't drink, but they listen." } },
    advice = { { id = "tp_ad", text = "Eat before ye drink, an' drink before ye fly, an' never the other way round." } },
    _none = { { id = "tp_none", text = "No idea! Ask the Thane, an' he'll tell ye, loud." } },
  },
}
