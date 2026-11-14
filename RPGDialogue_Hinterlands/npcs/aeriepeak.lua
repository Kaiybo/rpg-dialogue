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
      },
      choices = {
        { text = "Tell me about the gryphon riders.", next = "gryphons" },
        { text = "I'm here to fight trolls.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
      },
    },
    gryphons = {
      big = true,
      lines = {
        { id = "g_default", text = "We've flown since before the Second War, an' we flew in it, against the Horde. A Wildhammer an' his gryphon are one creature in the air. Nothin' on the ground can match it." },
      },
      choices = { { text = "I'd like to see that.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
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
      },
      choices = { { text = "I'll go.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
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
      choices = { { text = "I'll help the spirits.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
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
      choices = { { text = "A mug, please.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea! Ask the Thane. He'll tell ye, loud." } },
  },
}
