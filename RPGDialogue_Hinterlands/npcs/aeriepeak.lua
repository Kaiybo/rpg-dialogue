-- Aerie Peak: the Wildhammer stronghold in the Hinterlands. Voice: bibles/hinterlands.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falstad", id = TODO_NPC("Falstad Wildhammer"), name = "Falstad Wildhammer",
  bible = "bibles/hinterlands.md", role = "noble", tier = "major",
  communities = { "aerie_peak" }, temper = { "boisterous" }, values = { "proud", "brave", "loyal" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_keep", text = "Ha! A visitor tae Wildhammer Keep! Come in, come in, an' tell me ye're here tae fight trolls!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good. I like a face that keeps comin' back. Means the trolls didnae get it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' Ironforge, here among the Wildhammer! The mountain's fine, lad, but ye've no seen anythin' till ye've seen it from a gryphon's back." },
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "Ye've the look o' someone who knows beasts. The gryphons'll like ye. Probably." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Falstad Wildhammer, High Thane o' the Wildhammer clan! The forest trolls are pressin' in on the Hinterlands, an' I mean tae push 'em back where they came from." },
        { id = "h_hinterlands", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("To The Hinterlands") }, { questActive = TODO_QUEST("Gryphon Master Talonaxe") } } },
          text = "Ye've come tae help! Then go see Talonaxe at the aviary. He'll put ye where the fightin's thickest." },
        { id = "h_magni", when = { heardLine = "magni.h_default" },
          text = "Ye've been tae Ironforge an' stood before Bronzebeard, have ye? He's a fine king. For a dwarf who never leaves the ground." },
        { id = "h_sharpbeak", tags = { "news" }, when = { questRecent = { TODO_QUEST("Saving Sharpbeak"), days = 3 } },
          text = "Sharpbeak's home! The whole aviary sang last night. Ye've a friend in every Wildhammer on this peak now, an' a few o' the gryphons too." },
      },
      again = {
        { id = "h_again", text = "What else? Out wi' it! I've trolls tae think about." },
        { id = "h_again2", text = "Ha! More questions! I like a curious one. Go on." },
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
      lines = { { id = "gl_default", text = "Learn? Ha! A gryphon picks ye, or it doesnae. Talonaxe'll let ye ride with the flights, an' that's as close as most outsiders get. Be grateful for it." } },
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
      lines = { { id = "tw_default", text = "The Vilebranch. Blood on their altars an' cages full o' things they've no right tae. Fraggar can tell ye more, if ye can stand tae hear it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alliance = {
      big = true,
      lines = { { id = "a_default", text = "We fought for it. Bled for it. Then we came home an' decided we'd rather answer tae our own sky. We're friends tae any who prove themselves. Prove yerself." } },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The Alliance needs every hammer it can get.", next = "BACK", fx = { affinity = -1, align = { order = 2 } } },
      },
    },
    allies = {
      lines = { { id = "al_default", text = "The elves o' Quel'Danil, in the hills. Old friends from the old wars. They don't drink enough, but they shoot straight an' they don't run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bronzebeard = {
      lines = { { id = "b_default", text = "Does it! Then tell the Bronzebeards the Wildhammer are well, an' flyin', an' still better company. They'll know I mean it kindly. Mostly." } },
      choices = {
        { text = "I'll pass it on. Word for word.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Ironforge has its own strengths.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    skyborne = {
      lines = { { id = "s_default", text = "Glide! Downhill, aye? A gryphon goes up, lad. Up! Come back when yer wind can carry ye over a mountain, an' we'll talk about who flies better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    friend = {
      lines = { { id = "f_default", text = "Count ye? The riders toast ye by name at the bar. That's more than they do for me, an' I'm their Thane." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Wildhammer born, gryphon raised, Thane by right o' bein' the loudest. The Second War made a rider o' me. The Hinterlands made a Thane.", next = "gryphons" } },
    advice = { { id = "tp_ad", text = "Never fight a troll on its own ground. Fight it from above. Everythin' is easier from above." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons! Don't get me started, or we'll be here till the sun's down an' up again." } },
    _none = { { id = "tp_none", text = "Never heard o' it! Is it a troll? Then I'll hear of it soon enough." } },
  },
}

P:NPC {
  key = "talonaxe", id = TODO_NPC("Gryphon Master Talonaxe"), name = "Gryphon Master Talonaxe",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "gruff" }, values = { "loyal", "practical" },
  notices = { "class" },

  greetings = {
    { id = "g_aviary", text = "Aye? What is it? I'd rather be up in the air than down here talkin'. But the gryphons won't take orders from the ground, so somebody has tae." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Keep yer pet away from the gryphons; they'll eat it an' then look at ye for more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gryphon Master Talonaxe. I keep the aviary. The trolls keep tryin' tae get at the aeries. I keep stoppin' 'em." },
        { id = "h_cages", tags = { "news" }, when = { questActive = TODO_QUEST("Witherbark Cages") },
          text = "The Witherbark have cages in their villages. See what's in 'em. I've a nasty feelin' I know." },
        { id = "h_altar", when = { questActive = TODO_QUEST("The Altar of Zul") },
          text = "The Altar o' Zul. Trolls doin' troll business up there, an' none of it good. Go an' look." },
        { id = "h_sharpbeak", when = { questActive = TODO_QUEST("Saving Sharpbeak") },
          text = "Sharpbeak. Swiftwind an' Keenclaw's young one, locked in a cage at the top o' Jintha'Alor. The Vilebranch have him. Bring the wee beast home." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to the Hinterlands") },
          text = "Back from the south, are ye? Good. Now we know what the trolls are about, an' we can do somethin' about it." },
        { id = "h_rhapsody", when = { questActive = TODO_QUEST("Rhapsody Shindigger") },
          text = "Rhapsody Shindigger's got a camp out east o' here, brewin' who knows what. Go see what he wants. I'm no' goin'." },
        { id = "h_saved", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Saving Sharpbeak"), days = 3 } },
          text = "Sharpbeak hasnae left his mother's side since ye brought him back. Keenclaw let me near him this mornin'. First time. I'll no' forget it." },
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
      lines = { { id = "s_default", text = "Swiftwind an' Keenclaw's young one. Best bloodline on the peak. The Vilebranch took him for their altar, an' every gryphon in this aviary knows it. They've no' been quiet since." } },
      choices = {
        { text = "I'll bring him home.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "For their altars, an' for spite. A Wildhammer without a gryphon's half a Wildhammer. They know it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flying = {
      lines = { { id = "f_default", text = "Every day. But the birds need somebody on the ground who knows 'em, an' I'm the somebody. One day I'll train a lad as good as me, an' then I'm off." } },
      choices = {
        { text = "That day might never come.", next = "flying_never", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying_never = {
      lines = { { id = "fn_default", text = "Aye. I know. Don't tell the lads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rhapsody = {
      lines = { { id = "r_default", text = "Somethin' that'd strip paint off a keel. The riders love it. The gryphons won't go near him. That tells ye which o' them has more sense." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet = {
      lines = { { id = "p_default", text = "It willnae. It's the birds I'm worried about bothering it. Keep it close." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Rider, then trainer, then the one who never gets tae ride. Funny how that happens.", next = "flying" } },
    advice = { { id = "tp_ad", text = "Bring a gryphon a fish an' it'll remember ye. Bring it two, an' it'll follow ye home." } },
    _none = { { id = "tp_none", text = "Does it fly? No? Then I've no idea." } },
  },
}

P:NPC {
  key = "fraggar", id = TODO_NPC("Fraggar Thundermantle"), name = "Fraggar Thundermantle",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "solemn" }, values = { "devout", "protective" },
  notices = { "class" },

  greetings = {
    { id = "g_spirits", text = "Sit, friend. My eyes are no' what they were, but I hear the land well enough. It's no' happy." },
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
          text = "Fraggar Thundermantle. I speak for the spirits o' this land. The Vilebranch spill blood on their altars an' call it worship. The land remembers every drop." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Necklace Bounty") },
          text = "Bring me the trolls' necklaces. Each one's a charm against the spirits I serve. Each one I take is a little less of their dark work." },
        { id = "h_skulk", when = { questActive = TODO_QUEST("Skulk Rock Clean-up") },
          text = "Skulk Rock is fouled. Clean it, an' the spirits there can rest again." },
        { id = "h_eyes", when = { metBefore = true }, text = "My eyes grow dimmer each winter. The spirits grow louder to make up for it. I think they're bein' kind." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the wind on the peak? That's no' only wind. The old spirits walk the ridges after dark." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin'. I'm always listenin'." } },
      choices = {
        { text = "What do the spirits say?", next = "spirits" },
        { text = "Your eyes?", next = "eyes" },
        { text = "What happens at the altars?", next = "altars" },
        { text = "An Ironforge dwarf who hears the elements. What do you make of me?", next = "dwarfshaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "I hear them too.", next = "hear", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "I'll help the spirits.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "That they're tired. That they've been bled for a long time, an' they'd like it tae stop. Nothin' clever. The old ones rarely say anythin' clever." } },
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
        { id = "em_default", text = "Somebody walkin' steady. Breathin' easy. Ye've no' lied tae me yet. Keep it that way." },
        { id = "em_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "Somebody carryin' somethin' heavy an' dark. I'll no' ask what. The spirits might." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    altars = {
      big = true,
      lines = { { id = "a_default", text = "Blood, an' bindin', an' callin' on things that should stay asleep. The Vilebranch think the spirits answer them. Somethin' answers. It isnae the spirits." } },
      choices = {
        { text = "Then the altars must fall.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
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
      lines = { { id = "h2_default", text = "Then ye'll know what I mean when I say this land's grievin'. Sit wi' me a moment some evenin'. They speak easier tae two." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Wildhammer, shaman, listener. The spirits found me young, an' they've no' let go since." } },
    advice = { { id = "tp_ad", text = "When the wind goes quiet in the Hinterlands, listen harder. Somethin's holdin' its breath." } },
    _none = { { id = "tp_none", text = "The spirits haven't spoken o' that. Neither will I." } },
  },
}

P:NPC {
  key = "thulfram", id = TODO_NPC("Innkeeper Thulfram"), name = "Innkeeper Thulfram",
  bible = "bibles/hinterlands.md", role = "innkeeper", tier = "service",
  communities = { "aerie_peak" }, temper = { "jovial" }, values = { "generous", "friendly" },
  notices = { "drink", "weary" },

  greetings = {
    { id = "g_inn", text = "Come in, come in! Pull up a bench. There's ale, there's stew, an' there's a fire hot enough tae thaw a gryphon." },
    { id = "g_home", when = { homeInn = { "Aerie Peak", "Wildhammer Keep" } }, text = "Home again! Yer bed's warm an' yer mug's full. What more could a body want?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Now ye're drinkin' like a Wildhammer. Don't go near the gryphons like that." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dead a wee while. Sit. Ale fixes most things. Stew fixes the rest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Thulfram, at yer service. Gryphon riders, hunters, wanderers: they all end up at my bar. Stay as long as ye like." },
        { id = "h_tale", when = { metBefore = true }, text = "A rider came in last night swearin' his gryphon talked to him. Had three ales first. Still, I've no' heard a better story all week." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The gryphons settle late. Ye can hear 'em crooning in the aviary if the fire's low. Best sound in the Hinterlands." },
      },
      again = { { id = "h_again", text = "Anythin' else? Mug's no' empty yet." } },
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
    background = { { id = "tp_ba", text = "I've poured for this keep longer than some o' the gryphons have been alive. They don't drink, but they listen." } },
    advice = { { id = "tp_ad", text = "Eat before ye drink, an' drink before ye fly. Never the other way." } },
    _none = { { id = "tp_none", text = "No idea! Ask the Thane. He'll tell ye, loud." } },
  },
}
