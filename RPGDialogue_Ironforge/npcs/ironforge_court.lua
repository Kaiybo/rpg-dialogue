-- Ironforge's great and learned: the High Tinker, the Royal Historian, the Explorers' League,
-- a senator in the quarry, and the man who keeps the Stonefire's kegs.
-- Voice: bibles/ironforge_court.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mekkatorque", id = TODO_NPC("High Tinker Mekkatorque"), name = "High Tinker Mekkatorque",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "quick" }, values = { "inventive", "compassionate" },
  notices = { "craft", "kin" },

  greetings = {
    { id = "g_tinker", text = "Hello, hello! Mind the floor, there's a gear loose somewhere. There's always a gear loose somewhere." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! Good, good. Are you eating? Sleeping? Someone has to ask, and it may as well be me." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, you came back! I've had four ideas since you left. Three were terrible." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! What are you working on? No, let me guess. Something that explodes. Everyone starts with something that explodes." },
    { id = "n_gnome_rad", cat = "kin", when = { race = "Gnome", deed = "dungeon:Gnomeregan" },
      text = "You've seen the city, haven't you. Our city. It's in your face. I know that look; I see it in the mirror most mornings." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gelbin Mekkatorque, High Tinker of Gnomeregan. Elected, I'll have you know. Gnomeregan isn't fit to live in just now, so we tinker in Ironforge, by the King's kindness." },
        { id = "h_betrayal", tags = { "news" }, when = { questActive = TODO_QUEST("The Grand Betrayal") },
          text = "Thermaplugg. My own advisor. He's in the city still, ruling the poor sick souls we left behind. I sentenced him. Now someone has to carry the sentence down there." },
        { id = "h_betrayal_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "So. Thermaplugg is finished. I expected to feel lighter. I feel tired. Thank you all the same. Truly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A people whose island the winds carried into the sky! I have questions. Many questions. About winds, and loads, and whether the islands creak. Do they creak?" },
      },
      choices = {
        { text = "What happened to Gnomeregan?", next = "fall" },
        { text = "What are you building?", next = "build" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    fall = {
      big = true,
      lines = {
        { id = "f_default", text = "Troggs came up from below. We fought them in secret for years. Then a plan to flush them out went wrong, and the poison found our homes instead. Most of my people died in a day." },
      },
      choices = {
        { text = "I'm sorry.", next = "sorry", fx = { affinity = 2, trait = { kind = 1 }, learn = { "gnomeregan" } } },
        { text = "Whose plan was it?", next = "whose", fx = { learn = { "gnomeregan" } } },
      },
    },
    sorry = {
      lines = { { id = "s_default", text = "So am I, every morning. Then I get up and draw something. The drawing helps. Gnomes are built to fix things, even the things we broke." } },
      choices = { { text = "...", next = "END" } },
    },
    whose = {
      lines = { { id = "w_default", text = "Thermaplugg proposed it. I approved it. Both of those are true, and I'll thank you not to let anyone tell you only one of them." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "END", fx = { affinity = 2 } },
        { text = "Then you share the blame.", next = "END", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    build = {
      lines = { { id = "b_default", text = "A way home. Bits of it, anyway. Filters, suits, a better tram car. The tram was mine too, you know. That one went rather well." } },
      choices = { { text = "It's a marvel.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Our home. Radiant, now, and not in a good way. Troggs in the halls, and worse in the deep workshops. We'll go back. I've drawn the plans." } },
    dark_iron = { { id = "tp_dark_iron", text = "Magni's business, and he carries it heavily. I'd lend him every gnome I have if he asked. He hasn't asked." } },
    explorers_league = { { id = "tp_league", text = "Wonderful people. They write everything down. I wish we had. We'd lost half our records before we knew what we'd lost." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid. I have only the one department, and it's on fire." } },
  },
}

P:NPC {
  key = "archesonus", id = TODO_NPC("Royal Historian Archesonus"), name = "Royal Historian Archesonus",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "curious", "honest" },
  notices = { "lore" },

  greetings = {
    { id = "g_voice", text = "That's a step I don't know. Come closer and speak, so I can learn yer voice. That's how I keep my visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I know that voice. Sit, sit. Where did we leave off?" },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms. Ye can hear it in how ye say 'Khaz Modan', proper-like. Good. Most don't bother." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Archesonus, historian to the King. My eyes went long ago; my memory didn't. Ask me anything about Ironforge and I'll tell ye more than ye wanted." },
        { id = "h_thaurissan", tags = { "news" }, when = { questActive = TODO_QUEST("The Smoldering Ruins of Thaurissan") },
          text = "Sit, and I'll tell ye of Thaurissan, the Dark Iron city that stood where the Burning Steppes are now. Mind, it's not a short story, and it doesn't end well for anyone." },
        { id = "h_books", when = { metBefore = true },
          text = "I wrote on the fall of Lordaeron, ye know, and on plagues and curses. Dictated it, rather. My scribe has the patience of a mountain." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A voice I can't place. Elven, but with wind in it. There's nothing about yer folk in my books. Come back and tell me things, and there will be." },
      },
      choices = {
        { text = "Tell me about Thaurissan.", next = "thaurissan" },
        { text = "What's happening with the Dark Iron now?", next = "now" },
        { text = "Another time.", next = "END" },
      },
    },
    thaurissan = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The dwarven clans were at war with each other then. The Dark Iron city burned in one great blast, and the land round it turned to ash. What crawled out of the ash went into the mountain and built again." },
      },
      choices = {
        { text = "What did they build?", next = "build", fx = { learn = { "dark_iron" } } },
        { text = "A dark story.", next = "END", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    build = {
      lines = { { id = "b_default", text = "Blackrock Spire. Fortresses in the Searing Gorge. A kingdom under the ash. Some say something old and hot sits beneath them all, giving the orders. I record that it's said." } },
      choices = { { text = "...", next = "END" } },
    },
    now = {
      lines = { { id = "n_default", text = "Busier than they've been in a long while. Forts in the Badlands, diggers in Uldaman, and they struck the dam at Loch Modan. Ye don't do all that without a plan." } },
      choices = { { text = "Thank you, Historian.", next = "END", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Our kin, once. Our enemies for longer. History doesn't forgive, but it remembers both." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes kept poor records and lost the rest. I've offered my scribe to Mekkatorque. He's thinking about it." } },
    explorers_league = { { id = "tp_league", text = "They dig it up, I write it down. Magellas and I argue about which is the harder job. I'm right." } },
    _none = { { id = "tp_none", text = "Not in my memory, and my memory's longer than most." } },
  },
}

P:NPC {
  key = "magellas", id = TODO_NPC("High Explorer Magellas"), name = "High Explorer Magellas",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "serious" },
  notices = { "lore", "travel" },

  greetings = {
    { id = "g_league", text = "This is the Hall of Explorers. Touch nothing with a label. Touch nothing without one, either. Ask first." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Seen anything worth writing down?" },
  },

  notice = {
    { id = "n_far", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been south, past the forest. Did you write anything down? Nobody ever writes anything down." },
    { id = "n_miner", cat = "lore", when = { profession = "Mining" },
      text = "A miner! If you ever break into a hall that isn't on any map, stop swinging and send for us. Please." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Muninn Magellas, High Explorer of the Explorers' League. We map the world, catalogue what lives in it, and dig up what used to. My Prospectors do the digging. I do the worrying." },
        { id = "h_discs", tags = { "news" }, when = { questActive = TODO_QUEST("The Platinum Discs") },
          text = "Discs from Uldaman, and they speak? Do you understand what this might mean? Where we came from. What we are. Let me sit down." },
        { id = "h_brann", when = { minLevel = 30 },
          text = "Brann should be here for this. He's been gone too long in the field, even for Brann. I keep a chair for him all the same." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "We have no entry for you. None! An entire people, and the League's never written a line. Please, sit, and let me fix that." },
      },
      choices = {
        { text = "What does the League do?", next = "league" },
        { text = "What are you hoping to find?", next = "hope" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    league = {
      lines = { { id = "l_default", text = "Everything nobody else has time for. Ruins, relics, beasts, maps. If it's old, odd or underground, someone of ours has a notebook out." } },
      choices = { { text = "Sounds like my kind of work.", next = "END", fx = { affinity = 1, learn = { "explorers_league" } } } },
    },
    hope = {
      big = true,
      lines = {
        { id = "h2_default", text = "Where the dwarves came from. Truly came from. There are halls in the old places that weren't built to our size. I want to know whose they were." },
      },
      choices = {
        { text = "I hope you find out.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things should stay buried.", next = "buried" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Spoken like someone who's never held a thing older than their kingdom in their hands. Do that once. Then tell me again." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    explorers_league = { { id = "tp_league", text = "Mine to steer, for my sins. Hundreds of Prospectors across the world, and every one of them writes to me at once." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're digging in Uldaman, and they're not digging for history. That frightens me more than their axes." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We sent a team to chart the outer halls. They came back with maps and a terrible cough." } },
    _none = { { id = "tp_none", text = "Not catalogued yet. Write it down for me, would you? Dates, places. Sketches, if you can." } },
  },
}

P:NPC {
  key = "stormpike_p", id = TODO_NPC("Prospector Stormpike"), name = "Prospector Stormpike",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "hot" }, values = { "proud" },
  notices = { "craft" },

  greetings = {
    { id = "g_busy", text = "What. I'm reading. I'm always reading. Make it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You. Fine. Speak." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner. At least ye know which end o' the pick goes in the rock. That's more than half the folk who come in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Stormpike. Prospector. Explorers' League. That's my name, my job and my lodge, and that's all the chat ye're getting today." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Ironforge") },
          text = "A report? About time. Hand it here. No, don't read it to me. I can read." },
        { id = "h_powder", when = { questActive = TODO_QUEST("Powder to Ironband") },
          text = "Ironband's supplies. Get them to his dig in Loch Modan in one piece, an' don't dawdle." },
        { id = "h_uldaman", tags = { "news" }, when = { questActive = TODO_QUEST("Stormpike's Deciphering") },
          text = "Somethin' out o' Uldaman that needs readin'. Bring it here an' leave me be for a week." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "Sorry to bother you.", next = "END" },
      },
    },
    reading = {
      lines = { { id = "r_default", text = "Prospector business. Which is to say, none o' yours. Off ye go." } },
      choices = {
        { text = "Charming.", next = "charm" },
        { text = "Going.", next = "END" },
      },
    },
    charm = {
      lines = { { id = "c_default", text = "Charm doesnae dig tunnels. Come back when ye've something for me to read." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    explorers_league = { { id = "tp_league", text = "Magellas runs it. I do the work. That's not a complaint, it's a description." } },
    dark_iron = { { id = "tp_dark_iron", text = "Diggin' where they've no business diggin'. If they find what they're after before we do, we'll all hear about it." } },
    _none = { { id = "tp_none", text = "Not my business. Prospector business only." } },
  },
}

P:NPC {
  key = "stonehallow", id = TODO_NPC("Senator Mehr Stonehallow"), name = "Senator Mehr Stonehallow",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "kit", "greenness" },

  greetings = {
    { id = "g_quarry", text = "Watch yer footing. The troggs come up out o' the quarry like water from a cracked pipe." },
    { id = "g_back", when = { metBefore = true }, text = "Fewer o' the beasts since ye were last here, I'll grant. Not none, mind." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Ye're young yet. Good. The troggs are no' much older. Ye'll learn on each other." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Senator Mehr Stonehallow, o' Ironforge's Senate, an' a League man besides. I could be debatin' in the warm. Instead I'm countin' heads in a quarry. Someone has to." },
        { id = "h_public", tags = { "news" }, when = { questActive = TODO_QUEST("The Public Servant") },
          text = "Rockjaw troggs, all over Gol'Bolar. Thin the brutes out. The Senate'll thank ye. Eventually. In writin'. It's how the Senate does things." },
        { id = "h_public_done", when = { questDone = TODO_QUEST("The Public Servant") },
          text = "That's a quieter quarry than I've seen in months. I'll mention ye in my next speech. Briefly. They're long speeches." },
      },
      choices = {
        { text = "Why not leave it to the guards?", next = "why" },
        { text = "Good luck, Senator.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The guards are on the walls, an' the walls are where they belong. A senator who won't get his boots dirty for his own district isn't worth the chair." } },
      choices = { { text = "Respect.", next = "END", fx = { affinity = 2, align = { order = 1 } } } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "The troggs came up through the gnomes first. Now they're coming up through us. Draw yer own conclusions." } },
    explorers_league = { { id = "tp_league", text = "I'm a member. I pay my dues an' dig my own holes. Some o' them in quarries." } },
    _none = { { id = "tp_none", text = "Raise it in the Senate. Bring a cushion, it'll be a while." } },
  },
}

P:NPC {
  key = "firebrew", id = TODO_NPC("Innkeeper Firebrew"), name = "Innkeeper Firebrew",
  bible = "bibles/ironforge_court.md", role = "innkeeper", tier = "service",
  communities = { "ironforge" }, temper = { "jolly" }, values = { "generous" },
  notices = { "drink", "weary" },

  greetings = {
    { id = "g_tavern", text = "Welcome tae the Stonefire! Grab a stool, grab a mug, an' if ye've a story, grab the room's attention." },
    { id = "g_home", when = { homeInn = { "Ironforge", "Stonefire Tavern" } }, text = "There ye are! Yer bed's warm. Everythin' in Ironforge is warm. It's the forges." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're well on yer way! Good. That's what the place is for. Sit down before ye do it by accident." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've had a hard road. Sit by the fire an' let the mountain hold ye a while. It's good at that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Firebrew. I keep the Stonefire. The beer's strong, the fire's stronger, an' the stories get taller as the kegs get lighter." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well now, an elf from the clouds, in my tavern! Sit near the fire. Ye'll be cold up here. Well, down here. Under here." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Tell me a story.", next = "story" },
        { text = "Just a drink.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Ye want a story, ye tell one first. That's the rule o' the Stonefire. Then the old greybeard by the fire'll tell ye about the time he arm-wrestled a gryphon." } },
      choices = { { text = "Did he win?", next = "won" }, { text = "Maybe later.", next = "END" } },
    },
    won = {
      lines = { { id = "w_default", text = "Depends which night ye ask him. Twice he's won. Once he's lost an arm. He's got both his arms." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name loud in here. The lads get worked up, an' worked-up dwarves break furniture." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our little friends drink half-measures an' tip double. I'll no' hear a word against them." } },
    _none = { { id = "tp_none", text = "Ask the room. Someone in here'll know, an' three more'll argue." } },
  },
}
