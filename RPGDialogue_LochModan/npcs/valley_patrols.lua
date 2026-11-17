-- The Mountaineers who walk the Valley of Kings and the south road: Wallbang, Langarr and Gwarth.
-- Voices: bibles/valley_patrols.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mountaineer Wallbang: loud, cheerful, fond of his rifle.
P:NPC {
  key = "lm_wallbang", id = TODO_NPC("Mountaineer Wallbang"), name = "Mountaineer Wallbang",
  bible = "bibles/valley_patrols.md", role = "soldier", tier = "service",
  communities = { "thelsamar" }, temper = { "jovial", "fierce" }, values = { "brave", "loyal" },
  notices = { "soldier", "class" },

  impression = {
    first = "Mountaineer Wallbang talks at the volume of a rifle shot and laughs at the same pitch. He loves his patrol, his gun and the sound of a trogg running away, in roughly that order.",
    third = "{name} met Mountaineer Wallbang, a loud and cheerful rifleman who patrols the Valley of Kings.",
  },

  greetings = {
    { id = "g_default", text = "Ho there! Mountaineer Wallbang, an' if ye heard a bang a minute ago, that was me, an' the trogg's no' comin' back." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, it's you again! Still breathin', I see, which in this valley counts as a fine day." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Is that a gun on yer back? Let's see it. No, I'll no' fire it, I only want tae smell the oil." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "A warrior! Get in close an' I'll shoot over yer shoulder, for that's the finest partnership in all o' Khaz Modan." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wallbang o' the Mountaineers, an' I walk the Valley o' Kings from the statues tae the south gate an' back again. The troggs come up out o' the hills, an' I send them back down, louder than they came." },
        { id = "h_trogg", when = { questActive = TODO_QUEST("The Trogg Threat") },
          text = "Huntin' troggs for the Captain? Grand! Aim for the head, for they've skulls like anvils an' no' much in them tae miss." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Walk wi' me a bit, for the statues like tae see their own kin pass by, or so my gran always said." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Speak up, for my ears have been ringin' since the Second War." },
      },
      choices = {
        { text = "Tell me about the statues.", next = "statues" },
        { text = "How bad are the troggs here?", next = "troggs" },
        { text = "Why do they call you Wallbang?", next = "name" },
        { text = "Carry on, Mountaineer.", next = "END" },
      },
    },

    statues = {
      lines = {
        { id = "st_default", text = "Madoran Bronzebeard an' Khardros Wildhammer, carved by their sons tae stand guard over the pass south. They're there tae remind the Dark Irons that the old kings are still watchin', an' so am I." },
      },
      choices = {
        { text = "Do the Dark Irons still come this way?", next = "statues_di" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statues_di = {
      big = true,
      lines = {
        { id = "sd_default", text = "No' wi' banners, no' any more, but they sneak about the dam an' the south road like rats in a granary. If one ever walks up this valley in the open, I'll greet him wi' a ball o' lead an' let the kings watch." },
      },
      choices = {
        { text = "The Dark Irons are kin, whatever they've done.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Good. Kin who betray you are worse than strangers.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },

    troggs = {
      lines = {
        { id = "tg_default", text = "Bad enough that the Captain's had tae pull us off the south gate tae walk the valley, an' that's no' a thing he does lightly. They've a chieftain up in the hills now, Grawmug, an' he's got the beasts organised, which isnae natural." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },

    name = {
      lines = {
        { id = "nm_default", text = "Because I once put a shot through the wall o' the Stoutlager Inn, an' Hearthstove never let me forget it. It was a rat, mind, an' I got it, so I call that a fair shot." },
      },
      choices = {
        { text = "That's a fine name to earn, Wallbang.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the valley, the statues an' every trogg hole between here an' the gate." } },
    troggs = { { id = "tp_troggs", text = "Ugly, stubborn an' thick in the head, an' still too many of them.", next = "troggs" } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask Langarr, he reads." } },
  },
}

-- Mountaineer Langarr: dour, precise, a counter of things.
P:NPC {
  key = "lm_langarr", id = TODO_NPC("Mountaineer Langarr"), name = "Mountaineer Langarr",
  bible = "bibles/valley_patrols.md", role = "soldier", tier = "service",
  communities = { "thelsamar" }, temper = { "dry", "watchful" }, values = { "dutiful", "careful" },
  notices = { "stealth", "kit" },

  impression = {
    first = "Mountaineer Langarr says little and notices a great deal, and he seemed faintly disappointed that I hadn't arrived as a trogg. He keeps his patrol the way a priest keeps vigil.",
    third = "{name} met Mountaineer Langarr, a dour and watchful Mountaineer of the Valley of Kings.",
  },

  greetings = {
    { id = "g_default", text = "Stop there an' let me look at ye. Aye, ye'll do. Move along, but quietly." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'd have heard ye comin', but ye've learned tae walk softer." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Ye can come out o' the shadows. I saw the grass bend three steps back." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye've been in a scrap an' ye lost, by the look o' yer armour. Thelsamar's that way, an' so's Morhan." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Langarr. I walk the valley an' watch the hills, an' I'll tell ye now there are troggs on the slopes tae the east, so stay off the high ground unless ye mean tae fight." },
        { id = "h_defense", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "Cobbleflint's sent ye tae the troggs, has he? Mind the ones wi' the stone teeth round their necks, for those are the ones that hit hardest." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Be brief, for I'm watchin' the ridge while we talk." },
      },
      choices = {
        { text = "What are you watching for?", next = "watch" },
        { text = "Is the patrol a lonely one?", next = "lonely" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    watch = {
      lines = {
        { id = "wt_default", text = "Troggs comin' down, Dark Irons comin' up an' anythin' else that doesnae belong. Mostly it's troggs, an' mostly I count them, for the Captain likes his numbers." },
      },
      choices = {
        { text = "How many this week?", next = "watch_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_count = {
      big = true,
      lines = {
        { id = "wc_default", text = "Forty-one sighted, twenty-six put down, an' one that I'd swear was carryin' a carved idol like a babe in its arms. I've told the Captain, an' the Captain told Ironband, an' Ironband went very quiet." },
      },
      choices = {
        { text = "Then hunt the idol-carriers first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Counting troggs won't stop them. Kill them all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },

    lonely = {
      lines = {
        { id = "lo_default", text = "No, for there's Wallbang, an' Wallbang's company enough for ten dwarves whether ye want it or no'. The statues are better listeners, mind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what moves in this valley. Ask." } },
    _none = { { id = "tp_none", text = "Couldnae say. I watch the hills, no' the gossip." } },
  },
}

-- Mountaineer Gwarth: young, keen, new to the valley.
P:NPC {
  key = "lm_gwarth", id = TODO_NPC("Mountaineer Gwarth"), name = "Mountaineer Gwarth",
  bible = "bibles/valley_patrols.md", role = "soldier", tier = "service",
  communities = { "thelsamar" }, temper = { "eager", "earnest" }, values = { "brave", "dutiful" },
  notices = { "greenness", "race" },

  impression = {
    first = "Mountaineer Gwarth is new to the patrol and still polishes his buttons, and he talks about the older Mountaineers as if they were heroes out of a ballad. He's braver than he is careful.",
    third = "{name} met Mountaineer Gwarth, the youngest Mountaineer on the Valley of Kings patrol.",
  },

  greetings = {
    { id = "g_default", text = "Halt, an' state yer business! Ah, ye're no' a trogg. Sorry, friend, I'm new tae the patrol." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! I've been practisin' my halt since last time, did ye hear it?" },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "Ye look as new tae the road as I am tae the patrol. We'll both learn, I suppose, an' hopefully no' the hard way." },
    { id = "n_race", cat = "race", when = { race = "Gnome" },
      text = "A gnome! My mother says gnomes saved half o' Ironforge's pipes after Gnomeregan, an' I believe every word she says." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Gwarth, two months in the King's Mountaineers an' one in the valley. Langarr says I'll make a fine soldier once I learn tae shut my mouth, an' Wallbang says I'll never learn, for he never did." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "That's proper armour! I've been savin' for a breastplate from Morhan, but at a Mountaineer's pay I'll be grey before I've got it." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've time, for Langarr does the watchin' an' I do the walkin'." },
      },
      choices = {
        { text = "Why did you join the Mountaineers?", next = "join" },
        { text = "What's the valley like for a new recruit?", next = "valley" },
        { text = "Good luck on your patrol, Gwarth.", next = "END" },
      },
    },

    join = {
      lines = {
        { id = "jn_default", text = "My father was a Mountaineer at Algaz, an' his father before him, an' I wasnae goin' tae be the first Gwarth tae work a bellows. Besides, the King needs dwarves on the roads now the Reserve's gone tae the Alliance front." },
      },
      choices = {
        { text = "Do you wish you'd gone to the front?", next = "join_front" },
        { text = "Something else.", next = "BACK" },
      },
    },
    join_front = {
      big = true,
      lines = {
        { id = "jf_default", text = "Some nights, aye, for that's where the songs get written. But the Captain says the front's only a front if somebody holds the back, an' I've decided tae believe him." },
      },
      choices = {
        { text = "The Captain's right. Holding home matters most.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Go where the glory is, lad. Life's short.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    valley = {
      lines = {
        { id = "vl_default", text = "Cold, wet an' full o' troggs, an' I love every bit o' it. The statues look down on ye while ye walk, an' I swear old Khardros frowns when I trip." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a bit, an' I'm learnin' more every day. Ask, an' I'll try." } },
    _none = { { id = "tp_none", text = "I dinnae know that one, sorry! Langarr might, if ye can get a word out o' him." } },
  },
}
