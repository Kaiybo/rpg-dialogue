-- Thelsamar, the dig and the dam. Voice: bibles/thelsamar.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kadrell", id = TODO_NPC("Mountaineer Kadrell"), name = "Mountaineer Kadrell",
  bible = "bibles/thelsamar.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "hearty" }, values = { "dutiful", "friendly" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_town", text = "Welcome tae Thelsamar, friend! Make yerself comfortable. An' have a look at that poster by the League's door while ye're at it." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the loch! Good tae see ye. The tunnel rats have been askin' after ye. No' fondly." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye lost an argument wi' a trogg. Happens tae the best of us. Get mended." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Good. The troggs that came up under yer city are all over these hills too. Ye'll want a bit o' payback." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Kadrell. I watch the road through Thelsamar for the King. Troggs in the hills, a Dark Iron spy somewhere about, an' kobolds in the foothills. Never dull." },
        { id = "h_stout", tags = { "news" }, when = { questActive = TODO_QUEST("Stout to Kadrell") },
          text = "Stout! From Ironforge! Ye've brought me a taste o' home. I'll no' forget this." },
        { id = "h_rats", when = { questActive = TODO_QUEST("Rat Catching") },
          text = "Tunnel rats. Kobolds, west o' town along the hills, diggin' dens an' foulin' good land. Bring me their ears an' earn the bounty." },
        { id = "h_stormpike", when = { questActive = TODO_QUEST("Mountaineer Stormpike's Task") },
          text = "Mountaineer Stormpike's got a job wants doin'. He's a good dwarf. Grumpy. Good." },
        { id = "h_stonegear", when = { questActive = TODO_QUEST("Stonegear's Search") },
          text = "Stonegear's on a search o' his own. Help him find what he's after, an' mind the hills while ye do." },
        { id = "h_rockgar", when = { questActive = TODO_QUEST("Report to Mountaineer Rockgar") },
          text = "Rockgar's at Dun Algaz, up the north road past the tower. Take dry socks. The Wetlands will have the rest." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The road's quiet. For now." },
        { id = "h_again2", text = "Ask away. I've a post tae watch an' all day tae watch it." },
      },
      choices = {
        { text = "What's this about a spy?", next = "spy" },
        { text = "How's the loch?", next = "loch" },
        { text = "Who needs a hand around here?", next = "jobs" },
        { text = "So, how was that stout?", next = "stout", when = { questDone = TODO_QUEST("Stout to Kadrell") } },
        { text = "The troggs came up under my city first.", next = "gnome", when = { race = "Gnome" } },
        { text = "Thanks, Kadrell.", next = "END" },
      },
    },
    spy = {
      big = true,
      lines = {
        { id = "s_default", text = "A Dark Iron, poking about the town an' the dam. There's a poster out by the League. If ye see a dwarf who looks a wee bit too sooty, give us a shout." },
      },
      choices = {
        { text = "Why would they want the dam?", next = "spy_dam" },
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 2, learn = { "dark_iron" } } },
      },
    },
    spy_dam = {
      lines = {
        { id = "sd_default", text = "If it went, the loch would go wi' it, west intae the Wetlands. Hinderweir's on the dam day an' night. Ask him, if ye've an hour an' strong nerves." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    loch = {
      lines = { { id = "l_default", text = "Beautiful, an' full o' trouble. Like most things worth havin'. Ye should see it at dawn from the dam." } },
      choices = {
        { text = "What's in the loch?", next = "loch_what" },
        { text = "I'll go and see it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    loch_what = {
      lines = {
        { id = "lw_default", text = "Crocolisks, threshers, an' the Second War. Broken catapults on the bottom, if ye dive. The orcs held this valley once. No' for long." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jobs = {
      lines = {
        { id = "jb_default", text = "Mountaineer Stormpike in the north tower wants a runner. Pilot Stonegear at Steelgrill's Depot wants ore. An' Rockgar at Dun Algaz wants anyone daft enough tae go north." },
      },
      choices = {
        { text = "Tell me about Stormpike.", next = "jobs_stormpike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jobs_stormpike = {
      lines = {
        { id = "js_default", text = "Good dwarf. Grumpy. He'll tell ye about his exploits before ye've asked. Let him; they're mostly true." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stout = {
      lines = {
        { id = "st_default", text = "Shimmer Stout! Barleybrew's brother brews it. Magni's beard, I felt like I could fly. I couldnae. I checked." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Aye, an' now they come up under us. Same troggs or their cousins. Get yer payback here, an' Thelsamar'll thank ye fer it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, standing = { thelsamar = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Mountaineer o' Ironforge, posted tae Thelsamar. Best post in Khaz Modan, an' I'll argue wi' anyone who says otherwise." } },
    advice = { { id = "tp_ad", text = "Read the poster. Then read faces. A Dark Iron can wash his beard, but no' the soot under his nails.", next = "spy" } },
    dark_iron = { { id = "tp_dark_iron", text = "Sneakin' about where they've no business. I'd like tae know what they want wi' a dam." } },
    troggs = { { id = "tp_troggs", text = "Stonesplinter, out o' the hills. Captain Rugelfuss counts 'em in the Valley o' Kings. He's run out o' fingers." } },
    stonewrought_dam = { { id = "tp_dam", text = "Holdin'. Hinderweir would tell ye otherwise every mornin'.", next = "spy_dam" } },
    _none = { { id = "tp_none", text = "Couldnae say. Ask at the inn; they hear everythin'." } },
  },
}

P:NPC {
  key = "ironband", id = TODO_NPC("Prospector Ironband"), name = "Prospector Ironband",
  bible = "bibles/thelsamar.md", role = "scholar", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "honest", "practical" },
  notices = { "craft" },

  greetings = {
    { id = "g_dig", text = "Watch the trench. An' the ropes. An' the lads, they're workin'. Slowly, but workin'." },
    { id = "g_back", when = { metBefore = true }, text = "Good, ye came back. We could always use another pair o' hands that know which end's the shovel." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Ye'll know good stone from bad. Most o' what we find here is bad. The good bits are worth it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darteus Ironband, Explorers' League. This is my dig. It's slow work. I'll no' pretend otherwise. But it'll pick up, an' when it does, ye'll hear about it in Ironforge." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Excavation Progress Report") },
          text = "A report for the League. Tell 'em: slow, but steady. Tell 'em we need more hands. Tell 'em the troggs are a nuisance. They'll know the last bit already." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Protecting the Shipment") },
          text = "A shipment comin' up the road, an' the hills are crawlin'. See it gets here in one piece. I'm countin' on it." },
        { id = "h_stormpike", when = { heardLine = "stormpike_p.h_default" },
          text = "Ye've met Stormpike in the Hall? He's curt. He's always been curt. He reads my reports, though. Every word." },
        { id = "h_powder_in", tags = { "news" }, when = { questRecent = { TODO_QUEST("Protecting the Shipment"), days = 5 } },
          text = "Powder, at last! We're on top o' somethin' grand here, I can feel it. An' Saean... well. That's a matter for another day." },
        { id = "h_agmond", when = { questDone = TODO_QUEST("Agmond's Fate") },
          text = "Agmond's urns sit wi' my idols now. If there's a link between these carvin's an' the troggs, I'll find it. For him." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the ropes." },
        { id = "h_again2", text = "Ask. Diggin's slow; talkin's quick." },
      },
      choices = {
        { text = "What are you digging for?", next = "dig" },
        { text = "Why is the dig so slow?", next = "slow" },
        { text = "Where does your blastpowder go?", next = "powder" },
        { text = "Stormpike sent me. You need legwork?", next = "agmond", when = { questActive = TODO_QUEST("Ironband Wants You!") } },
        { text = "Good luck with the dig.", next = "END" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "The past. Our past. What the old dwarves left in these hills before Ironforge was a single hall. Every shard's a page o' a book nobody's read." },
      },
      choices = {
        { text = "Found anything yet?", next = "idols" },
        { text = "That's worth digging for.", next = "BACK", fx = { affinity = 2, learn = { "explorers_league" } } },
      },
    },
    idols = {
      big = true,
      lines = {
        { id = "id_default", text = "Carved idols, a whole cache. Right after we lifted 'em, the troggs came up through the floor, an' the idols send 'em berserk. I cannae call that coincidence." },
      },
      choices = {
        { text = "Did your dig wake them?", next = "idols_wake" },
        { text = "I know stone. Let me look at the carving.", next = "BACK", when = { profession = "Mining" }, fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    idols_wake = {
      lines = {
        { id = "iw_default", text = "Maybe. An honest dwarf says maybe. If our diggin' woke 'em, it's ours tae put right, an' I'll no' leave this site till it is." },
      },
      choices = {
        { text = "Spoken like an honest dwarf.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Or leave them be and fill the hole.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    slow = {
      lines = {
        { id = "sl_default", text = "Troggs in the trench, an' my blastpowder goes missin' between Thelsamar an' here. Jern sends it. I never see it. Somebody does." },
      },
      choices = {
        { text = "Who's Jern?", next = "slow_jern" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slow_jern = {
      lines = {
        { id = "sj_default", text = "Jern Hornhelm, our man in Thelsamar. He sends my reports up tae Ironforge an' my powder down tae me. One o' those arrives." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    powder = {
      lines = {
        { id = "pw_default", text = "Ask the road. Every shipment gets lighter between town an' trench. I'm a digger, no' a guard." },
        { id = "pw_saean", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "A porter called Saean. Near a year he hauled for us, an' all that time he was sellin' us tae the Dark Irons. I keep turnin' it over." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    agmond = {
      lines = {
        { id = "ag_default", text = "Good. Prospector Agmond runs our sites in the Badlands, an' I've no' heard from him in weeks. Find him. Bring me his report, or bring me the news." },
      },
      choices = {
        { text = "I'll find him.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darteus Ironband, prospector. I value results. I've had few lately, so I'm valuin' them very hard." } },
    advice = { { id = "tp_ad", text = "When the ground goes quiet, listen harder. That's when the troggs are diggin'." } },
    explorers_league = { { id = "tp_league", text = "The finest lot o' diggers, scholars an' madmen in the world. I'm in the middle category." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're diggin' too, down south in Uldaman. I'd dearly like tae know what they're after." } },
    troggs = { { id = "tp_troggs", text = "Big, mean, an' they go berserk near our idols. I'd like tae know why before they do.", next = "idols" } },
    uldaman = { { id = "tp_uldaman", text = "The big dig, down south. If my idols stir troggs, I shudder tae think what Uldaman stirs." } },
    _none = { { id = "tp_none", text = "No' my field. My field's six feet down." } },
  },
}

P:NPC {
  key = "hearthstove", id = TODO_NPC("Innkeeper Hearthstove"), name = "Innkeeper Hearthstove",
  bible = "bibles/thelsamar.md", role = "innkeeper", tier = "service",
  communities = { "thelsamar" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "The Stoutlager welcomes ye! Sit down, have a pint, tell us a tale. In that order." },
    { id = "g_home", when = { homeInn = { "Thelsamar", "Stoutlager Inn" } }, text = "The Stoutlager missed ye! Yer bed's warm an' yer mug's clean. Well. Clean enough." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Troggs, was it? Sit. Vidra's got sausages on. They'll mend what the troggs broke." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's the spirit! Well, that's several spirits. Sit down before the floor comes up tae meet ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hearthstove. I keep the Stoutlager. Best ale between Ironforge an' the Wetlands, an' I'll fight anyone who says otherwise. After they've paid." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two miners fought over the last stool last night. Broke the stool. Now neither of 'em has a stool. Lesson in there somewhere." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late, an' the miners are singin' about the dam. Every verse is the same verse. Louder." },
      },
      again = {
        { id = "h_again", text = "Another? Sit, sit." },
        { id = "h_again2", text = "What else? Tell me a tale an' I'll pour." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "What do the miners sing about?", next = "song" },
        { text = "Just a pint.", next = "END" },
      },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Mountaineers off the road, diggers from Ironband's trench, gryphon riders waitin' on weather. Vidra feeds 'em; I keep 'em. Somebody has tae." },
      },
      choices = {
        { text = "Vidra?", next = "vidra_ref" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vidra_ref = {
      lines = {
        { id = "vr_default", text = "Runs the kitchen. Don't go in. Don't ask what's in the sausage. Do eat it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    song = {
      lines = {
        { id = "so_default", text = "The dam, mostly, an' what'd happen if it broke. Cheerful lot. Every verse ends wi' the loch in the Wetlands an' everybody swimmin'." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the Stoutlager. Before that I drank in it. It was a short step." } },
    advice = { { id = "tp_ad", text = "Sit wi' yer back tae the wall an' yer face tae the fire. Ye'll see everyone an' stay warm." } },
    stonewrought_dam = { { id = "tp_dam", text = "Ask the miners. They've a song about it. Don't ask them tae sing it.", next = "song" } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Buy a round an' ask the whole inn; ye'll get six answers." } },
  },
}

P:NPC {
  key = "vidra", id = TODO_NPC("Vidra Hearthstove"), name = "Vidra Hearthstove",
  bible = "bibles/thelsamar.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "brisk" }, values = { "proud" },
  notices = { "craft" },

  greetings = {
    { id = "g_kitchen", text = "Out o' my kitchen, unless ye've brought me somethin' tae cook." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then ye'll want my sausage recipe. Ye can't have it. But ye'll want it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Vidra. I cook for the Stoutlager. Thelsamar blood sausages, famous from here tae Ironforge. Well. Famous in Thelsamar." },
        { id = "h_sausages", tags = { "news" }, when = { questActive = TODO_QUEST("Thelsamar Blood Sausages") },
          text = "Bring me what I asked for an' ye'll have the best sausages ye've ever eaten. Don't ask what's in 'em. It's in the name." },
        { id = "h_secret", when = { metBefore = true }, text = "Folk keep askin' what's in the blood sausage. I tell them: blood, an' sausage, an' a secret. The secret's mostly more sausage." },
      },
      again = {
        { id = "h_again", text = "What? I've a pot on." },
        { id = "h_again2", text = "Ask quick. Sausages burn." },
      },
      choices = {
        { text = "What goes in the sausages?", next = "what" },
        { text = "Who eats them all?", next = "who" },
        { text = "Can I help?", next = "help" },
        { text = "I cook too. Trade secrets?", next = "cook", when = { profession = "Cooking" } },
        { text = "I'll pass on the details.", next = "END", fx = { affinity = 1 } },
      },
    },
    what = {
      lines = {
        { id = "wt_default", text = "Bear meat, boar guts for the casings, an' a dash o' spider ichor for spice. Don't make that face. Ye've eaten worse an' liked it less." },
      },
      choices = {
        { text = "Spider ichor?", next = "what_ichor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_ichor = {
      lines = {
        { id = "wi_default", text = "Gives it a bite. Some days, literally. I strain it. Mostly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    who = {
      lines = {
        { id = "wo_default", text = "Kids runnin' in an' out, diggers off Ironband's site, Mountaineers off the road. Thelsamar never runs short o' empty bellies." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = {
        { id = "hp_default", text = "Nobody eats free in my kitchen, not even a {class} in shiny boots. Fetch me bear meat an' we'll talk." },
      },
      choices = {
        { text = "I'll fetch it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Shall I bless the pot, at least?", next = "bless", when = { class = "PRIEST" } },
      },
    },
    bless = {
      lines = {
        { id = "bl_default", text = "Bless the bears, if ye like. Before, mind. After, they're my business." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cook = {
      lines = {
        { id = "ck_default", text = "Then ye'll know a good casing from a bad one. Most don't. Ye still can't have the recipe." },
      },
      choices = { { text = "Worth a try.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cook. That's my story, an' it's got sausages in it." } },
    advice = { { id = "tp_ad", text = "Eat it fresh. Everythin', but sausages most of all." } },
    _none = { { id = "tp_none", text = "I cook. Ask someone who talks." } },
  },
}

P:NPC {
  key = "rugelfuss", id = TODO_NPC("Captain Rugelfuss"), name = "Captain Rugelfuss",
  bible = "bibles/thelsamar.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "formal" }, values = { "dutiful" },
  notices = { "soldier" },

  greetings = {
    { id = "g_ease", text = "At ease. Ceremony can wait until the troggs do." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighting sort. Good. The King's lands need defenders more than they need visitors." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Rugelfuss. I hold the Valley of Kings for Ironforge. The troggs rise from under the hills faster than we put them down." },
        { id = "h_trogg", tags = { "news" }, when = { questActive = TODO_QUEST("The Trogg Threat") },
          text = "The troggs have dug in close. Thin them, and bring proof. I want the King to read numbers, not complaints." },
        { id = "h_lands", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "These are the King's lands, and the King's statues watch over them. I'll not have troggs nesting at their feet." },
        { id = "h_count", when = { metBefore = true }, text = "Put down eleven troggs yesterday. Twelve more came up where they fell. I've stopped countin' an' started diggin' trenches." },
        { id = "h_mountaineer", when = { origin = "dwarf_mountaineer" },
          text = "A Mountaineer of Dun Morogh. Good. You'll know what a short-handed post looks like. This is one." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Speak plainly. I prefer it." },
      },
      choices = {
        { text = "Where are your soldiers?", next = "reserve" },
        { text = "Who leads the troggs?", next = "leader" },
        { text = "Tell me about the statues.", next = "statues" },
        { text = "Why trogg teeth?", next = "teeth" },
        { text = "I stood the high passes too, Captain.", next = "mountaineer", when = { origin = "dwarf_mountaineer" } },
        { text = "I'll help defend them.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    reserve = {
      lines = {
        { id = "rs_default", text = "The Ironforge Reserve has been called to the Alliance front. My regiment holds the gate here and cannot leave it. So the hills go unwatched." },
      },
      choices = {
        { text = "Then I'll watch them.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Is the front worth it?", next = "reserve_worth" },
      },
    },
    reserve_worth = {
      lines = {
        { id = "rw_default", text = "The King says it is. I'm a captain. I say 'Yes, my king,' and I count troggs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leader = {
      lines = {
        { id = "ld_default", text = "Our scouts name a chieftain, Grawmug. Two brutes guard him, Gnasher and Brawler, and never leave his side. Kill him and the rest may go back into the ground." },
      },
      choices = {
        { text = "And if they don't?", next = "leader2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leader2 = {
      lines = {
        { id = "l2_default", text = "Then we kill the next one. Troggs have more chieftains than sense." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    statues = {
      lines = {
        { id = "su_default", text = "Madoran Bronzebeard and Khardros Wildhammer, raised by their sons. They watch the pass south, where the land still burns. A warning to the Dark Iron." },
      },
      choices = {
        { text = "Do the Dark Iron heed it?", next = "statues2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    statues2 = {
      lines = {
        { id = "s2_default", text = "They came for the dam, didn't they? So, no. The statues don't mind. They're patient. I try to be." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    teeth = {
      lines = {
        { id = "te_default", text = "Proof. Eight teeth is eight troggs. Eight complaints is a captain who ought to be replaced." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mountaineer = {
      lines = {
        { id = "mo_default", text = "Then stand a watch with my regiment some night. You'll find the troggs keep worse hours than the Frostmane." },
      },
      choices = { { text = "Gladly, Captain.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { thelsamar = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The King's captain in the Valley of Kings. My history is the regiment's history, and the regiment keeps a book." } },
    advice = { { id = "tp_ad", text = "Bring proof. Always. Nobody argues with a sack of teeth." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The same troggs, or their cousins. They came up under the gnomes, and now they're coming up under us." } },
    troggs = { { id = "tp_troggs", text = "Stonesplinter, tunneling up from every crevice in the loch's hills.", next = "leader" } },
    _none = { { id = "tp_none", text = "Not my post. Ask in Thelsamar." } },
  },
}

P:NPC {
  key = "hinderweir", id = TODO_NPC("Chief Engineer Hinderweir VII"), name = "Chief Engineer Hinderweir VII",
  bible = "bibles/thelsamar.md", role = "worker", tier = "quest",
  communities = { "thelsamar" }, temper = { "anxious" }, values = { "proud", "careful" },
  notices = { "craft" },

  greetings = {
    { id = "g_dam", text = "Careful on the walkway! It's perfectly safe. Mostly safe. Engineered to be safe. Please hold the rail." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Come, look at these stress readings. No? Not everyone loves a stress reading. Their loss." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hinderweir the Seventh, Chief Engineer of the Stonewrought Dam. Seventh of the name, and I'll not be the one remembered for the day it fell." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("A Dark Threat Looms") },
          text = "Someone's been at the dam. Things moved that shouldn't move. Things left that shouldn't be here. Find out who, before it's too late to find out anything." },
        { id = "h_crack", when = { metBefore = true }, text = "Found a hairline crack on the east face this morning. Nothin'. Probably nothin'. I'll check it again tonight. An' tomorrow. An' forever." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Dark Threat Looms"), days = 7 } },
          text = "You saved her. The dam. My dam. She's safe, for the time being. I've started checking at noon as well." },
      },
      again = {
        { id = "h_again", text = "Yes? Quickly; I've readings due." },
        { id = "h_again2", text = "Go on. Hold the rail while you do." },
      },
      choices = {
        { text = "How old is the dam?", next = "old" },
        { text = "What are the Dark Iron after?", next = "threat" },
        { text = "Where are your guards?", next = "guards" },
        { text = "Who built the dam?", next = "built" },
        { text = "The stonewrought method was a Dark Iron's, I'm told.", next = "forgewright", when = { heardLine = "archesonus.d_default" } },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    old = {
      big = true,
      lines = {
        { id = "o_default", text = "Older than my grandfather's grandfather, and holding back the whole loch. If it goes, the valley below goes with it. I check it every morning, every night, and sometimes in between." },
      },
      choices = {
        { text = "What happens if it goes?", next = "old_goes" },
        { text = "That's a lot of responsibility.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    old_goes = {
      lines = {
        { id = "og_default", text = "The loch goes west, all of it, down into the Wetlands. I don't sleep much. You can see why." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = {
        { id = "tr_default", text = "First they brought down the Thandol Span, then they pillaged Dun Modr. You needn't be a genius to see what's next on their list. I am one, and I see it plainly." },
      },
      choices = {
        { text = "What would they use?", next = "threat_how" },
        { text = "Then we stop them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'm an engineer. Let me check the ramp.", next = "BACK", when = { profession = "Engineering" }, fx = { affinity = 2 } },
      },
    },
    threat_how = {
      lines = {
        { id = "th_default", text = "Something that goes bang, in barrels. I've seen sappers on the eastern ramp, and sappers don't come for the view." },
        { id = "th_seaforium", when = { questDone = TODO_QUEST("A Dark Threat Looms") },
          text = "Seaforium. Harmless dry. Wet, Stonesmirk says, it could blow Ironforge out of the mountain. And they brought it to a dam. A dam!" },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    guards = {
      lines = {
        { id = "gu_default", text = "Reassigned to the Alliance front. Nearly all of them, and my best inspector with them. I have a clipboard, a rail, and you." },
      },
      choices = {
        { text = "That'll do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    built = {
      lines = {
        { id = "bu_default", text = "Before my time, and before my father's. It's stonewrought work, the finest in the world. Who laid the first stone matters less than who keeps the last one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgewright = {
      lines = {
        { id = "fw_default", text = "Dark Iron? The... No. Well. A method's a method, and a dam's a dam. This one's mine now, and they can't have it back." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Seventh of the name, Chief Engineer of the dam. That's all of me. The rest is readings." } },
    advice = { { id = "tp_ad", text = "Check it twice. Then check it again. Then hold the rail." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name near my dam. Just... don't. I've enough to worry about.", next = "threat" } },
    stonewrought_dam = { { id = "tp_dam", text = "Mine. Well, the King's. But mine.", next = "old" } },
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about anything but the dam right now. I rarely can." } },
  },
}
