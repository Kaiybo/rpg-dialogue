-- Menethil Harbor. Voice: bibles/menethil.md
-- The captain on the wall, the drunk by the tavern door, the priest with too much to do,
-- a wounded dwarf out of Dun Modr, a merchant sailor, the innkeeper, the League's man,
-- and a bartender who doesn't sell drinks.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "stoutfist", id = TODO_NPC("Captain Stoutfist"), name = "Captain Stoutfist",
  bible = "bibles/menethil.md", role = "soldier", tier = "major",
  communities = { "menethil" }, temper = { "fierce" }, values = { "dutiful", "brave" },
  notices = { "soldier", "kit" },

  greetings = {
    { id = "g_wall", text = "Quickly now. I've a wall to keep an' a hill full o' orcs to keep it from." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Good. I've more work than hands, an' ye've got hands." },
    { id = "g_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") }, text = "Here's the one who brought me Nek'rosh's head. Stand up straight; the lads are watchin'." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 24 },
      text = "Ye've the look o' someone who's held a line. Good. I need lines held." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's in ribbons. Get it seen to before ye go back up the road. I'll no' send folk out half-dressed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Stoutfist. I hold Menethil for Ironforge an' the Alliance both. The Dragonmaw have come down out o' the hills into Dun Algaz, an' if they hold it, the road to Loch Modan's shut." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Captain Stoutfist") },
          text = "Ironjaw sent ye? Good man, Ironjaw. I asked him for soldiers who'd go where they're told. Let's find out if that's you." },
        { id = "h_banners", when = { questActive = TODO_QUEST("War Banners") },
          text = "They've set up camp at Whelgar's dig an' hung their filthy banners over it. Bring me the banners. I want 'em to wake up an' see bare poles." },
        { id = "h_gambit", tags = { "news" }, when = { questActive = TODO_QUEST("Nek'rosh's Gambit") },
          text = "Catapults. The brute's buildin' catapults to throw at my walls. Burn them before he gets the range." },
        { id = "h_nekrosh", tags = { "news" }, when = { questActive = TODO_QUEST("Defeat Nek'rosh") },
          text = "Nek'rosh Skullcrusher. Cut off the head an' the Dragonmaw go back to their caves. Bring it to me in a sack. I'll want to see it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves from the sky. Can ye see the orc camps from up there? No? Then ye'll walk to them like the rest of us." },
      },
      choices = {
        { text = "Who are the Dragonmaw?", next = "dragonmaw" },
        { text = "How's the harbour holding?", next = "harbour" },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1 } },
      },
    },
    dragonmaw = {
      big = true,
      lines = {
        { id = "d_default", text = "Orcs that rode dragons in the Second War. They burned half the coast from those beasts' backs. Now they've no dragons left to ride an' they're angrier for it." },
      },
      choices = {
        { text = "Then let's finish them.", next = "END", fx = { affinity = 2, learn = { "dragonmaw" }, align = { honor = 1 } } },
        { text = "No dragons at all?", next = "none", fx = { learn = { "dragonmaw" } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "None I've seen. An' I look. Every mornin', first thing, I look." } },
      choices = { { text = "...", next = "END" } },
    },
    harbour = {
      lines = { { id = "hb_default", text = "Ships still come an' go, which is the point o' the place. While the boats run, the Alliance has a back door. I mean to keep it open." } },
      choices = { { text = "...", next = "END", fx = { standing = { menethil = 1 } } } },
    },
  },

  topics = {
    dragonmaw = { { id = "tp_dragonmaw", text = "Dun Algaz is theirs for now. 'For now' is doin' a lot o' work in that sentence." } },
    dark_iron = { { id = "tp_dark_iron", text = "Took Dun Modr off us to the north. One enemy at a time, I keep tellin' the lads. They keep askin' which one." } },
    _none = { { id = "tp_none", text = "No' my concern. My concern's the wall." } },
  },
}

P:NPC {
  key = "fitzsimmons", id = TODO_NPC("First Mate Fitzsimmons"), name = "First Mate Fitzsimmons",
  bible = "bibles/menethil.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "maudlin" }, values = { "loyal" },
  notices = { "drink", "fright" },

  greetings = {
    { id = "g_tale", text = "Sit down, sit down! A drink and a tale, that's my price. You bring the drink, I'll bring the tale." },
    { id = "g_back", when = { metBefore = true }, text = "My friend! You came back. Nobody comes back. Sit. Sit downwind, they all say. I don't know why." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've had a few! Good, good. Now you're good company. Now you're my kind of company." },
    { id = "n_sailor", cat = "fright", when = { resSick = true },
      text = "You've been dead. I can tell. You've the look my shipmates had, the ones that still walk. Sit by me a while. I don't mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fitzsimmons, first mate of the Wave Mistress, Third Fleet of Kul Tiras. Was. Was first mate. There's no ship to be first mate of anymore." },
        { id = "h_mead", tags = { "news" }, when = { questActive = TODO_QUEST("The Third Fleet") },
          text = "My mead. It's in the tavern cellar. I'd fetch it, but the stairs move about when I'm sober, and I'm terribly sober right now." },
        { id = "h_mead_done", when = { questRecent = { TODO_QUEST("The Third Fleet"), days = 3 } },
          text = "Ah, that's better. Now I can talk. Now I can talk about it. Pull up that barrel." },
        { id = "h_crew", tags = { "news" }, when = { questActive = TODO_QUEST("The Cursed Crew") },
          text = "The wrecks in the bay aren't empty. My crew never left them. They're still at their posts, and they shouldn't be. Set them free." },
        { id = "h_curse", when = { questDone = TODO_QUEST("Lifting the Curse") },
          text = "They're resting? All of them? Then I'll drink to them tonight. And tomorrow. Mostly to them." },
      },
      choices = {
        { text = "What happened to the fleet?", next = "fleet" },
        { text = "Why do you drink so much?", next = "why" },
        { text = "Some other time.", next = "END" },
      },
    },
    fleet = {
      big = true,
      lines = {
        { id = "f_default", key = true,
          text = "Red dragons, with orcs on their backs. Second War. They came out of the clouds and set the sails alight, ship after ship. I lived. Nobody else did. Nobody." },
      },
      choices = {
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "dragonmaw" } } },
        { text = "You were lucky.", next = "lucky", fx = { learn = { "dragonmaw" } } },
      },
    },
    lucky = {
      lines = { { id = "l_default", text = "Lucky. Yes. That's what they call it. I've been lucky every night since. Every single night." } },
      choices = { { text = "...", next = "END" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because when I'm drunk the bay's just water. When I'm sober it's a graveyard with my friends in it. You'd drink too." } },
      choices = { { text = "Maybe I would.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    dragonmaw = { { id = "tp_dragonmaw", text = "Them. The very same. Up in the hills now, without their dragons. I hope they miss them as much as I miss my ship." } },
    _none = { { id = "tp_none", text = "Don't know, friend. Buy me a drink and ask me again; I'll know even less." } },
  },
}

P:NPC {
  key = "glorin", id = TODO_NPC("Glorin Steelbrow"), name = "Glorin Steelbrow",
  bible = "bibles/menethil.md", role = "priest", tier = "quest",
  communities = { "menethil" }, temper = { "grumpy" }, values = { "devout", "dutiful" },
  notices = { "fel", "class" },

  greetings = {
    { id = "g_busy", text = "Hmph. Another one. Aye, aye, the Light bless ye. What is it? I've three things on the fire an' two o' them are smoking." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Well, ye're useful, I'll give ye that. Useful's rare round here." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "Warlock. Hmph. Stand over there. No, further. The Light an' I have enough to deal with in this marsh." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Thank the Light. Ye can take the next three blessings. I've a backlog." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Glorin Steelbrow, o' the Church. I tend Menethil's souls, an' nobody mentioned the souls come wi' mud, murlocs an' drowned sailors." },
        { id = "h_eye", tags = { "news" }, when = { questActive = TODO_QUEST("The Eye of Paleth") },
          text = "What's that ye've brought out o' the wreck? Don't hand it here. Put it down. Gently. That's got something foul sleepin' in it." },
        { id = "h_cleanse", when = { questActive = TODO_QUEST("Cleansing the Eye") },
          text = "It'll take more than a prayer to scrub that clean. I've the prayer. You fetch the rest." },
        { id = "h_fitz", when = { heardLine = "fitzsimmons.f_default" },
          text = "He told ye about the fleet. Poor soul. I've tried to get him off the drink. He listens, nods, an' asks if the Light comes in a bottle." },
      },
      choices = {
        { text = "Can I help?", next = "help" },
        { text = "Why so grumpy?", next = "grumpy" },
        { text = "Light keep you.", next = "END" },
      },
    },
    help = {
      lines = { { id = "hp_default", text = "Aye, by not needin' anything. Failing that, keep the dead in the bay where they belong an' the living out of it." } },
      choices = { { text = "...", next = "END" } },
    },
    grumpy = {
      big = true,
      lines = {
        { id = "g2_default", text = "I'm no' grumpy. I'm busy. Grumpy's what busy looks like from the outside. Inside, it's mostly prayer an' wet socks." },
      },
      choices = { { text = "Fair enough.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dragonmaw = { { id = "tp_dragonmaw", text = "I bury what the Captain's lads bring back. Ask him about the orcs. Ask me about the burying." } },
    _none = { { id = "tp_none", text = "Hmph. No' my problem, an' I've plenty." } },
  },
}

P:NPC {
  key = "harlo", id = TODO_NPC("Harlo Barnaby"), name = "Harlo Barnaby",
  bible = "bibles/menethil.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "bitter" }, values = { "brave", "proud" },
  notices = { "body", "kin" },

  greetings = {
    { id = "g_bed", text = "Don't mind me. I'm no' gettin' up. Healer's orders. My orders are different, but she's got the bigger stick." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Any word from the north? Any word at all?" },
  },

  notice = {
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "One o' our own. Ye'll understand, then. A dwarf without his hold is just a short man in the rain." },
    { id = "n_hurt", cat = "body", when = { durability = { max = 0.25 } },
      text = "Ye look like I felt. Don't take an axe in the back. That's my advice. Face 'em, always." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Harlo Barnaby. I was at Dun Modr when the Dark Irons came. We ran. I took an axe in the back runnin', an' woke up here. That's all the story there is, an' it's a bad one." },
        { id = "h_fall", tags = { "news" }, when = { questActive = TODO_QUEST("Fall of Dun Modr") },
          text = "Go north to Dun Modr. See what's left. See who's left. If any o' my lot are breathin', tell 'em Harlo's waitin'." },
        { id = "h_fall_done", when = { questDone = TODO_QUEST("Fall of Dun Modr") },
          text = "So it's as bad as I dreamed. Worse. Thank ye for lookin'. Somebody had to, an' I couldn't." },
      },
      choices = {
        { text = "Who took Dun Modr?", next = "who" },
        { text = "Rest easy.", next = "END", fx = { affinity = 1 } },
      },
    },
    who = {
      big = true,
      lines = {
        { id = "w_default", text = "Dark Irons, out o' the mountains. Fire an' black steel an' no mercy in 'em at all. They didnae want the fort. They wanted the road through it." },
      },
      choices = {
        { text = "I'll go north.", next = "END", fx = { affinity = 2, learn = { "dark_iron" } } },
        { text = "Why the road?", next = "road", fx = { learn = { "dark_iron" } } },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Aye, that's the question. When I can stand, I'll ask one of 'em. Politely. Wi' an axe." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "They put me in this bed. I'll put a few o' them in worse. That's a promise, no' a threat." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The Captain's problem. Mine's north. Everyone's got a problem in the Wetlands." } },
    _none = { { id = "tp_none", text = "Ask someone who can walk." } },
  },
}

P:NPC {
  key = "karl", id = TODO_NPC("Karl Boran"), name = "Karl Boran",
  bible = "bibles/menethil.md", role = "worker", tier = "quest",
  communities = { "menethil" }, temper = { "steady" }, values = { "hardworking", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_dock", text = "Careful of the ropes. And the nets. And the crates. Actually, just stand still a moment." },
    { id = "g_back", when = { metBefore = true }, text = "There you are. The work never stops, but the company's better." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough out there? Course it is. Get patched up, then get back to it. That's how we do it here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Karl Boran, merchant marine. I keep cargo moving through this harbour, which is harder than it sounds with half the marsh trying to eat it." },
        { id = "h_crabs", when = { questActive = TODO_QUEST("Claws from the Deep") },
          text = "Claws, aye, from the deep water. Bring me what I asked for and mind your fingers. They're the only ten you get." },
        { id = "h_goods", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming Goods") },
          text = "Goods that were ours and aren't anymore. Bring back what you can carry. I'll take dented over gone." },
        { id = "h_statuette", when = { questActive = TODO_QUEST("Return the Statuette") },
          text = "That little carving was in one of the crates? Then it belongs to someone. Get it home. That's the job, every time: get it home." },
      },
      choices = {
        { text = "How do you manage out here?", next = "manage" },
        { text = "Good luck with the cargo.", next = "END" },
      },
    },
    manage = {
      big = true,
      lines = {
        { id = "m_default", text = "Times are lean. You don't fix lean by moaning. You pick up the next crate, and then the one after that, and one day you look up and the dock's clear." },
      },
      choices = {
        { text = "That's a good way to live.", next = "END", fx = { affinity = 2 } },
        { text = "And if the dock never clears?", next = "never" },
      },
    },
    never = {
      lines = { { id = "n_default", text = "Then you'll have moved a great many crates. There are worse ways to spend a life." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    dragonmaw = { { id = "tp_dragonmaw", text = "They've cut the road east. Everything goes by sea now. Good for me, bad for everyone else." } },
    _none = { { id = "tp_none", text = "Can't say. I only know what's in the crates, and not always that." } },
  },
}

P:NPC {
  key = "helbrek", id = TODO_NPC("Innkeeper Helbrek"), name = "Innkeeper Helbrek",
  bible = "bibles/menethil.md", role = "innkeeper", tier = "service",
  communities = { "menethil" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_tavern", text = "In ye come, out o' the wet! The Deepwater's dry, warm, an' only leaks over the bar, which is where ye want it." },
    { id = "g_home", when = { homeInn = { "Menethil Harbor", "Deepwater Tavern" } }, text = "Hang yer cloak by the fire. It'll steam like a kettle. They all do." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've been wrestlin' the marsh an' the marsh won. Sit. Stew. No arguments." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy now. Ye're startin' to sound like Fitzsimmons, an' one o' him is plenty." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Helbrek. I keep the Deepwater. Sailors, soldiers, diggers, an' one first mate who's been sittin' outside my door since before I owned it." },
        { id = "h_fitz", when = { heardLine = "fitzsimmons.h_default" },
          text = "Fitz told ye who he was? Aye, he's told everyone. I keep his mead in the cellar. Someone has to. Better me than the bay." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well, an elf from the sky, in the wettest place on Azeroth! Ye'll miss yer clouds. Well. Ye won't. We've plenty here." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "Just drying off.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The Captain's sendin' folk at the orcs, the priest's sendin' folk at the wrecks, an' the bartender's sendin' folk somewhere he won't say. Pick one." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    dragonmaw = { { id = "tp_dragonmaw", text = "The lads come back from the hills tired an' thirsty. That's how I know there's a war on." } },
    _none = { { id = "tp_none", text = "Ask the room. Sailors know everythin', an' what they don't know they'll make up." } },
  },
}

P:NPC {
  key = "flagongut", id = TODO_NPC("Archaeologist Flagongut"), name = "Archaeologist Flagongut",
  bible = "bibles/menethil.md", role = "scholar", tier = "quest",
  communities = { "menethil" }, temper = { "eager" }, values = { "curious" },
  notices = { "lore", "travel" },

  greetings = {
    { id = "g_maps", text = "Careful, careful, that's a map! They're all maps. Mind where ye put yer elbows." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye're back! Found anythin' old? Anythin' at all? I'm no' fussy." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms! Then ye know how much history sits under yer boots. Most folk only notice the mud." },
    { id = "n_far", cat = "travel", when = { visited = "Ironforge" },
      text = "Ye've been to the Hall o' Explorers? Tell Magellas I'm still here. He'll know what that means. It means I'm stuck." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Flagongut, Explorers' League. I came through here on my way to the dig at Whelgar's, an' then the orcs took the dig. So I'm diggin' through a tavern, for now." },
        { id = "h_prospector", tags = { "news" }, when = { questActive = TODO_QUEST("The Absent Minded Prospector") },
          text = "Word from our man across the sea? About time. He'd lose his own beard if it weren't attached, but he finds things nobody else can." },
        { id = "h_stoutfist", when = { heardLine = "stoutfist.h_default" },
          text = "The Captain told ye about the orcs. Aye, they're sittin' on my dig. On it! Bones a thousand years old, an' they're usin' 'em as tent pegs, probably." },
      },
      choices = {
        { text = "What's at Whelgar's dig?", next = "dig" },
        { text = "Good luck with it.", next = "END" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "Old things. Older than Ironforge, some say. Bones o' beasts nobody's named, an' stone nobody's read. An' a camp o' Dragonmaw on top o' the lot." },
      },
      choices = {
        { text = "I'll clear them off.", next = "END", fx = { affinity = 2, learn = { "explorers_league" } } },
        { text = "Can't the bones wait?", next = "wait" },
      },
    },
    wait = {
      lines = { { id = "w_default", text = "They've waited this long, aye. It's me that can't." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    explorers_league = { { id = "tp_league", text = "Best job in the world, when ye're no' stuck in a tavern. Which I am." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Orcs on my dig. I've written to Ironforge. Ironforge wrote back to say the orcs are on my dig." } },
    _none = { { id = "tp_none", text = "If it's no' buried, I'm the wrong dwarf." } },
  },
}

P:NPC {
  key = "mikhail", id = TODO_NPC("Mikhail"), name = "Mikhail",
  bible = "bibles/menethil.md", role = "citizen", tier = "quest",
  communities = { "menethil" }, temper = { "watchful" }, values = { "loyal", "discreet" },
  notices = { "stealth", "drink" },

  greetings = {
    { id = "g_bar", text = "Evening. Before you ask, no, I don't sell drinks. Helbrek does. I just stand here." },
    { id = "g_back", when = { metBefore = true }, text = "Back. Good. Sit where you can see the door. Everyone should." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You came in quiet. I noticed. I'd have noticed louder, too, but quiet I notice more." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've been drinking. Not from me. I'd have remembered." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mikhail. I used to work in Stormwind. Now I keep a bar I don't sell from, in a town where nothing happens. I like it that way. Mostly." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Elling's business? Then it's serious, and it's quiet. Lean in. And if things get lively in here, step back and give it a moment." },
        { id = "h_elling", when = { heardLine = "elling.h_default" },
          text = "So Elling's found you, and his cheese. How is he? Don't tell him I asked. He'd take it as an invitation." },
      },
      choices = {
        { text = "Why don't you sell drinks?", next = "drinks" },
        { text = "What did you do in Stormwind?", next = "past" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    drinks = {
      lines = { { id = "d_default", text = "Behind a bar, a man can watch the whole room and nobody wonders why. A man in a corner, people wonder. I don't like being wondered about." } },
      choices = { { text = "Fair.", next = "END", fx = { affinity = 1 } } },
    },
    past = {
      big = true,
      lines = {
        { id = "p_default", text = "This and that. The kind of work you retire from, if you're lucky. I was lucky. I'd like to stay lucky, so let's leave it there." },
      },
      choices = {
        { text = "Understood.", next = "END", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Do you miss it?", next = "miss" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Daily. Don't tell Elling." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Stormwind's trouble. I left it there. It keeps sending letters." } },
    _none = { { id = "tp_none", text = "Couldn't say. Wouldn't, either." } },
  },
}
