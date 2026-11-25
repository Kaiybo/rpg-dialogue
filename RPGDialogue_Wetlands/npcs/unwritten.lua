-- Wetlands folk without a conversation yet: Einar Stonegrip, the croc hunter at the crossroads who won't set foot in Menethil.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Einar Stonegrip: dwarf hunter at the Wetlands crossroads.
P:NPC {
  key = "wl_einar_stonegrip", id = TODO_NPC("Einar Stonegrip"), name = "Einar Stonegrip", gender = "male",
  bible = "bibles/missed.md", role = "hunter", tier = "quest",
  communities = { "wetlands" }, temper = { "gruff", "stubborn" }, values = { "work", "proud" },
  impression = {
    first = "Einar Stonegrip camps at the crossroads where the roads from Dun Modr, Dun Algaz and Menethil Harbor meet, with crocolisk skins stretched on frames behind him. He is a dwarf hunter who looks at the road to Menethil as if it had insulted him.",
    third = "{name} met Einar Stonegrip, a dwarf hunter who camps at the Wetlands crossroads and won't go into Menethil.",
  },
  greetings = {
    { id = "g_default", text = "Hail, traveller. Ye headed to Menethil, by any chance?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, I've another bundle needs deliverin'." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Daily Delivery") }, text = "Take that bundle to James Halloran in Menethil, an' don't let him short ye." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Daily Delivery") }, tags = { "news" }, text = "Halloran paid ye fair? Good, he's a decent sort, for a harbour man." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Einar Stonegrip, hunter, an' this is my camp, an' that's the road to Menethil I'll not walk. I trap crocolisks in the marsh an' sell the skins to James Halloran, if someone'll carry them for me." } },
      again = { { id = "h_again", text = "What else, {g:lad|lass}?" }, { id = "h_again2", text = "Aye, go on." } },
      choices = {
        { text = "Why won't you go to Menethil?", next = "why" },
        { text = "How's crocolisk hunting?", next = "crocs" },
        { text = "This crossroads sees a lot of traffic.", next = "road" },
        { text = "Any tips for hunting crocolisks?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because my wife Sida's there, an' we've had words, an' I'll not be the first to say sorry. She knows where I am if she wants me." } },
      choices = {
        { text = "What did you argue about?", next = "argue" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    argue = {
      lines = { { id = "argue_default", text = "Her granny's tomb, at Ironbeard's, an' whether it's worth riskin' her neck to visit. I said it wasn't, an' she said I'd no heart, an' that was that." } },
      choices = {
        { text = "Maybe you should apologise.", next = "sorry" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    sorry = {
      lines = { { id = "sorry_default", text = "Maybe I should, an' maybe she should, an' maybe the marsh'll dry up tomorrow. I'll think on it, but don't hold yer breath." } },
      choices = {
        { text = "Pride isn't worth losing your wife over.", next = "BACK", reply = "Hmph. Ye sound like Sida.", fx = { align = { order = -1 } } },
        { text = "She should come to you first.", next = "BACK", reply = "Exactly what I've been sayin'!", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    crocs = {
      lines = { { id = "crocs_default", text = "Good, if ye don't mind wet boots an' the odd missin' finger. The big ones lurk by the river, an' their hides fetch the best price from Halloran." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "road_default", text = "Aye, everyone headin' north to Dun Modr or south to Loch Modan passes right by me. It's lonely, but it's never quiet." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hunter_default", text = "Go for the soft belly, never the back, an' keep yer pet clear of their jaws. A croc'll take a wolf's leg off in one snap." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea. Ask somebody in Menethil, since I'll not be goin' there." } },
  },
}


---------------------------------------------------------------------------
-- Dun Algaz mountaineers, Grugelm and Rharen, holding the pass at the southern end of the Wetlands.
---------------------------------------------------------------------------
P:NPC {
  key = "wl_mountaineer_grugelm", id = 2466, name = "Mountaineer Grugelm", gender = "male",
  role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "duty" },
  notices = { "race" },
  impression = {
    first = "A thickset dwarf mountaineer stands at Dun Algaz with a rifle on his shoulder, glancing every so often at his partner as if they'd just been arguing.",
    third = "{name} met Mountaineer Grugelm at Dun Algaz.",
  },
  greetings = {
    { id = "g_default", text = "Halt there. Oh, ye're no orc, so ye can pass, but mind ye don't take Rharen's side in anything." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Grugelm, mountaineer of Ironforge, and I guard Dun Algaz with that great lump Rharen. The pass is the only road between Loch Modan and the Wetlands, and the Dragonmaw would dearly love to own it." } },
      again = { { id = "h_again", text = "What else, {g:lad|lass}?" } },
      choices = {
        { text = "Tell me about the Dragonmaw.", next = "dragonmaw" },
        { text = "You and Rharen don't get along?", next = "rharen" },
        { text = "Hold the pass. Farewell.", next = "END" },
      },
    },
    dragonmaw = {
      lines = { { id = "d_default", text = "Orcs who rode red dragons in the Second War, and who haven't forgotten it. They hold Grim Batol and the ruins of Dun Modr, and they raid the road whenever they feel brave." } },
      choices = {
        { text = "They should be driven out entirely.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then let them have the hills.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rharen = {
      lines = { { id = "r_default", text = "We get along like a forge and a bucket of water, which is to say loudly. He's a good dwarf in a fight, mind, and I'd not trade him, though I'll deny I said so." } },
      choices = {
        { text = "What do you argue about?", next = "argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue = {
      lines = { { id = "a_default", text = "Whose turn it is on watch, whose turn it is to cook, and who drank the last of the stout. He'll tell ye it was me, and he'll be lying." } },
      choices = { { text = "I'll keep out of it.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, {g:lad|lass}. Ask in Menethil." } } },
}

P:NPC {
  key = "wl_mountaineer_rharen", id = 2469, name = "Mountaineer Rharen", gender = "male",
  role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful" }, values = { "duty" },
  notices = { "race" },
  impression = {
    first = "A ruddy-cheeked dwarf mountaineer grins at you from the Dun Algaz gate. His beard has crumbs in it, and he doesn't seem to mind.",
    third = "{name} met Mountaineer Rharen at Dun Algaz.",
  },
  greetings = {
    { id = "g_default", text = "Ho there, traveller! Don't mind Grugelm's scowl, he was born with it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rharen's the name, and watchin' this pass is the game. Loch Modan's just through the tunnel, and the Wetlands spread out to the north, so we see everybody comin' and goin'." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Come in, come in, there's a fire and there's stout, though Grugelm will swear there isnae." },
      },
      again = { { id = "h_again", text = "Anythin' else, friend?" } },
      choices = {
        { text = "What's the road north like?", next = "north" },
        { text = "Grugelm says you drank the last stout.", next = "stout" },
        { text = "Take care, mountaineer.", next = "END" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "Wet, which ye might have guessed from the name, and full of raptors, crocolisks and Dragonmaw. Stick to the road until Menethil and ye'll do fine." } },
      choices = {
        { text = "What's at Menethil?", next = "menethil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menethil = {
      lines = { { id = "m_default", text = "The harbour, and ships to Darkshore and Theramore. Half of it's sinkin' into the bog, but the keep's sturdy and the ale is passable." } },
      choices = { { text = "Thanks for the advice.", next = "BACK" } },
    },
    stout = {
      lines = { { id = "s_default", text = "He would say that, the old liar! I'll admit to the second-to-last, but the last one was his, and the bottom of his mug will testify to it." } },
      choices = {
        { text = "I believe you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Cannae help ye there, friend. Ask Grugelm, if ye dare." } } },
}

---------------------------------------------------------------------------
-- Maiden's Virtue Crewman: sailors from the Theramore ship at Menethil's docks.
---------------------------------------------------------------------------
P:NPC {
  key = "wl_maidens_virtue_crewman", id = 2099, name = "Maiden's Virtue Crewman", gender = "male",
  role = "sailor", tier = "service",
  communities = { "menethil" }, temper = { "cheerful" }, values = { "work" },
  notices = { "race", "class" },
  impression = {
    first = "A sunburnt sailor coils rope on the Menethil docks, humming a shanty under his breath. The name Maiden's Virtue is stitched on his cap.",
    third = "{name} talked with a crewman of the Maiden's Virtue at Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Ahoy, friend! If you're for Theramore, you'll be waitin' on the tide like the rest of us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I crew the Maiden's Virtue, between here and Theramore across the sea. It's a long haul, but the lady's a good ship, and the captain's fair." } },
      again = { { id = "h_again", text = "Anything else? These ropes won't coil themselves." } },
      choices = {
        { text = "What's Theramore like?", next = "theramore" },
        { text = "Is the crossing dangerous?", next = "danger" },
        { text = "Fair winds.", next = "END" },
      },
    },
    theramore = {
      lines = { { id = "t_default", text = "Clean and white and full of folk from Lordaeron, all of them following Lady Proudmoore. It's the only Alliance port in southern Kalimdor, so we're never short of passengers." } },
      choices = { { text = "Sounds worth the trip.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "There's storms, and there's naga in the deep, and there's whatever sank the old fleet off the Wetlands coast. Most crossings we just get wet and bored, mind." } },
      choices = {
        { text = "Whatever sank the old fleet?", next = "fleet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fleet = {
      lines = { { id = "f_default", text = "There's wrecks along the coast north of here, and sailors swear their crews still walk the decks at night. I don't go near them, and neither should you." } },
      choices = {
        { text = "Ghost stories don't frighten me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll heed the warning.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Couldn't say, friend. I just sail where they point me." } } },
}

---------------------------------------------------------------------------
-- Aman: an ancient spirit tied to the Prospector chain. The bible keeps his story
-- out of Menethil's mouths (the parts share one title), so he speaks only of himself,
-- in riddles, and never names what Ironband's men are digging for.
---------------------------------------------------------------------------
P:NPC {
  key = "wet_aman", id = 3582, name = "Aman",
  role = "citizen", tier = "service",
  temper = { "ancient", "cryptic" }, values = { "secrets", "the earth" },
  impression = {
    first = "A vast, translucent shape that seems carved of old stone and older light. When it speaks, the ground hums beneath your feet.",
    third = "{name} spoke with Aman, an ancient spirit that answers in riddles.",
  },
  greetings = {
    { id = "g_default", text = "Small one. You stand where the stones remember things your people have not yet learned to ask." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The stones noticed. They notice very little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aman. I was set to watch over what lies beneath, long before your kingdoms raised their walls. I do not speak of what I guard, so do not ask it." },
      },
      again = { { id = "h_again", text = "Speak, then. The earth has patience, and so do I." } },
      choices = {
        { text = "Who set you to watch?", next = "who" },
        { text = "The dwarves are digging everywhere. Does that trouble you?", next = "dig" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Those who shaped the mountains, and then left them. Their names are not for your tongue. Perhaps one day your people will dig deep enough to read them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dig = {
      lines = { { id = "di_default", text = "The dwarves dig because they wish to know where they came from. It is a worthy wish, and a dangerous one. Some doors are shut for a reason." } },
      choices = {
        { text = "Every truth deserves to be uncovered.", next = "BACK", reply = "So the young always say. The old ones keep their doors shut.", fx = { align = { order = -1 } } },
        { text = "Some secrets are better left buried.", next = "BACK", reply = "Then you are wiser than most who come here.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
