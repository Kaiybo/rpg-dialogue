-- Forever-only NPCs in the Wetlands. Voice: bibles/wetlands_forever.md
-- Agriel Firebrew of the Drunken Dwarf, an old lookout turned tavern; Ardin Grassman, Caitlin's husband, found alive
-- at the Site of the Guardian inside the Excavation Site (Lost in the Thicket Things, Heartwoven); and the Deathstalker
-- Agent in the hills east of the dig, who sends Horde parties after the Dragonmaw (Dragonmaw Rumors, Open the Maw).
-- Daewyn Songblade is a corpse at the Lost Dig Site (Songblade Search, Fallen in the Fen) and has no conversation.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Agriel Firebrew: keeps the Drunken Dwarf, a lookout the kingdom stopped maintaining. Gruff, private, proud of it.
P:NPC {
  key = "wl_agriel", id = TODO_NPC("Agriel Firebrew"), name = "Agriel Firebrew",
  bible = "bibles/wetlands_forever.md", role = "innkeeper", tier = "service",
  temper = { "gruff", "dry" }, values = { "practical", "hospitality", "proud" },
  notices = { "drunk", "dwarf", "trader" },

  impression = {
    first = "She asks only that you sit where you're told.",
    third = "{name} met Agriel Firebrew, who keeps the Drunken Dwarf in the Wetlands.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' yer stool's right where ye left it. I'll admit I'm glad o' the company." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Sit if ye must, but keep out o' the way o' the staff." },
    { id = "g_default", text = "Welcome. Sit anywhere ye like, but don't be blockin' our way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Yer stool's where ye left it, more or less." },
    { id = "g_drunk", when = { drunk = true }, text = "Ye've had plenty already, by the walk on ye. Sit down before ye fall down, an' I'll bring water." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for the road, this. Come in out o' the damp an' mind the step." },
  },

  notice = {
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf on the Wetlands road who isnae a Mountaineer or a digger. Ye must be lost, or wise, an' either way ye're welcome." },
    { id = "n_trader", cat = "trader", when = { race = "Gnome" },
      text = "If ye're sellin' somethin', the answer's no, an' if ye're buildin' somethin', the answer's still no. Sit, an' I'll pour ye a cup." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Agriel Firebrew, an' this is the Drunken Dwarf. We converted an old lookout the kingdom was tired o' maintainin', an' we've been pourin' here well over a year now." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Ye're Horde, an' I can see that from here. I serve whoever sits quiet an' pays, an' I'll thank ye tae do both." },
      },
      again = {
        { id = "h_again", text = "Anythin' else?" },
        { id = "h_again2", text = "Go on, I'm wipin' tables either way." },
      },
      choices = {
        { text = "What can I get here?", next = "BUSINESS" },
        { text = "Does it get busy here?", next = "busy" },
        { text = "Why turn a lookout into a tavern?", next = "lookout" },
        { text = "What are the Aetherstill Spirits on your shelf?", next = "spirits" },
        { text = "Any news from the road?", next = "road" },
        { text = "Good day, Agriel.", next = "END" },
      },
    },

    busy = {
      lines = {
        { id = "bu_default", text = "Busier than it was, now word's spreadin'. Traders an' merchants have been itchin' tae make deals, wantin' their brews on our shelf or their jerky on our plates." },
      },
      choices = {
        { text = "Why not take their deals?", next = "busy_deals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    busy_deals = {
      lines = {
        { id = "bd_default", text = "It's no' about the coin. We're happy mindin' our own business an' lettin' folk come as they may, an' the day I'm sellin' some Booty Bay rotgut tae make a merchant rich is the day I close the door." },
      },
      choices = {
        { text = "Good. Keep it your own.", next = "BACK", reply = "Aye, that's the plan, an' it's held fine for longer than ye've been alive. Sit down an' have a pint, then, if ye're no' sellin' anythin'.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "A deal or two would keep you safe in hard times.", next = "BACK", reply = "Safe? I've a stone tower, a full cellar an' a stout door, an' that's all the safe a dwarf needs. Keep yer deals for the harbour folk.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lookout = {
      lines = {
        { id = "lo_default", text = "Because it was standin' empty wi' good walls an' a roof, an' the wind off the marsh wanted somewhere tae go. The Mountaineers used tae keep watch here before the kingdom pulled them back tae Menethil an' the Span." },
      },
      choices = {
        { text = "You don't miss the soldiers?", next = "lookout_soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lookout_soldiers = {
      lines = {
        { id = "ls_default", text = "I miss what they drank. Truth is, folk feel safer sittin' in a tower, an' if any trouble comes, I've stout walls an' a stouter ladle." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    spirits = {
      lines = {
        { id = "sp_default", text = "Our own still, our own recipe, an' no, ye'll no' get it out o' me. It's clear as a mountain stream an' it'll make yer ears ring like the Great Forge, an' that's all ye need tae know." },
      },
      choices = {
        { text = "Who makes it?", next = "spirits_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_who = {
      lines = {
        { id = "sw_default", text = "Family. There's Firebrews all over Khaz Modan, an' every one o' us thinks our still's the best. Ours is." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    road = {
      lines = {
        { id = "ro_default", text = "Diggers comin' an' goin' from that excavation tae the north, more goin' than comin' lately. An' the Dragonmaw are thicker on the hills than they were, so travel in company if ye can.",
          fx = { learn = { "dragonmaw" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Khaz Modan born, Firebrew by name an' by trade. That's all the story I'm givin' anyone." } },
    advice = { { id = "tp_ad", text = "Don't block the way, an' don't drink faster than ye can walk." } },
    _none = { { id = "tp_none", text = "No idea, an' I'm happy no' knowin'." } },
  },
}

-- Ardin Grassman: Menethil herb-gatherer with a gift for sensing nature, who went to see the giant grasses
-- at the excavation and got caught in the disaster. Sarcastic when scared, soft about his wife Caitlin.
P:NPC {
  key = "wl_ardin", id = TODO_NPC("Ardin Grassman"), name = "Ardin Grassman",
  bible = "bibles/wetlands_forever.md", role = "citizen", tier = "quest",
  communities = { "menethil" }, temper = { "anxious", "dry" }, values = { "nature", "loving", "curious" },
  notices = { "healer", "herbalist", "druid" },

  impression = {
    first = "All he wants is to get home to Caitlin.",
    third = "{name} found Ardin Grassman alive at the Site of the Guardian in the Wetlands excavation.",
  },

  greetings = {
    { id = "g_default", text = "You came just in time! We ran into some trouble, and then some problems, and then there were several accidents!" },
    { id = "g_back", when = { metBefore = true }, text = "Still here, still alive, and still not moving any faster. What do you need?" },
    { id = "g_heart", when = { questActive = TODO_QUEST("Heartwoven") }, text = "Have you still got the heart? Don't squash it; I braided it with shaking hands." },
    { id = "g_home", when = { questDone = TODO_QUEST("Heartwoven") }, text = "Caitlin got the heart? Then she'll be cooking, and I'd better hurry home before it gets cold." },
  },

  notice = {
    { id = "n_healer", cat = "healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } },
      text = "You're a healer? Good, there are a few of the diggers who could use you more than I could, though I'll take a look at this ankle if you're offering." },
    { id = "n_herb", cat = "herbalist", when = { profession = { "Herbalism" } },
      text = "You pick herbs! Then you'll understand why I came in here. Have you seen the size of the grasses past the first cavern?" },
    { id = "n_druid", cat = "druid", when = { class = "DRUID" },
      text = "Something about the growth in here is wrong, isn't it? You feel it too; I can see it on your face." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Ardin Grassman, of Menethil Harbor, and very glad to be alive at all right now. The excavation team's in shambles, but thanks to you we've a chance to make it out." },
        { id = "h_found", tags = { "news" }, when = { questReady = TODO_QUEST("Lost in the Thicket Things") },
          text = "Caitlin sent you? Of course she did, she must be worried sick. Light, I told her a week and it's been, well, I've lost count, actually." },
        { id = "h_heart", when = { questActive = TODO_QUEST("Heartwoven") },
          text = "Take the heart to Caitlin and tell her I'll be home soon. Now that you've cleared a path, I'll gather my bushels and follow your trail, at a careful distance." },
        { id = "h_guardian", tags = { "news" }, when = { killed = { name = "Relic Guardian", min = 1 } },
          text = "The big stone thing is down? I heard it fall from here, and I've never been so glad to hear something enormous hit the floor." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, clearly." },
        { id = "h_again2", text = "Go on, ask. Talking stops my hands shaking." },
        { id = "h_again3", text = "Anything else before you go deeper?" },
      },
      choices = {
        { text = "Why did you come here?", next = "grasses" },
        { text = "What happened to the excavation team?", next = "team" },
        { text = "Tell me about Caitlin.", next = "caitlin" },
        { text = "What's down here that's worth digging for?", next = "relic" },
        { text = "Be careful. Follow us out, but keep your distance.", next = "careful", when = { questDone = TODO_QUEST("Lost in the Thicket Things") } },
        { text = "Let me tend that ankle.", next = "xheal", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "Stay safe, Ardin.", next = "END" },
      },
    },

    grasses = {
      lines = {
        { id = "gr_default", text = "A dig crew came through Menethil for supplies and talked about grasses taller than a house, towering things, nothing like they'd ever seen. I've a gift for finding plants, and Caitlin needs them for her alchemy, so I told her I simply had to see for myself." },
      },
      choices = {
        { text = "Were they as tall as promised?", next = "grasses_tall" },
        { text = "Was it worth the risk?", next = "grasses_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasses_tall = {
      lines = {
        { id = "gt_default", text = "Taller, and they move when there's no wind, which nobody mentioned. Something down here makes things grow wrong, and I don't think it's the water, whatever the diggers say." },
      },
      choices = {
        { text = "What do you think it is?", next = "relic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasses_worth = {
      lines = {
        { id = "gw_default", text = "Ask me again when I'm home with a bowl of Caitlin's stew in front of me. Right now I'd trade every bushel I've picked for one dry pair of boots." },
      },
      choices = {
        { text = "A gift like yours is worth following, risk or not.", next = "BACK", reply = "That's what I told Caitlin before I left, almost word for word. She rolled her eyes at me then, and I suspect she's rolling them now.", fx = { align = { order = -1 } } },
        { text = "You had a wife waiting. You should've stayed home.", next = "BACK", reply = "Oh, thank you, that's just what a man stuck in a ruined dig needs to hear. Believe me, I've said it to myself more times than you could count.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    team = {
      lines = {
        { id = "te_default", text = "The dwarves were digging for something old, and they dug into something that didn't want to be dug into. Then the raptors came, and then the things in the water, and then the Dragonmaw, and somewhere between all that the crew stopped being a crew.",
          fx = { learn = { "dragonmaw" } } },
      },
      choices = {
        { text = "Did anyone else make it?", next = "team_survivors" },
        { text = "Who was leading the dig?", next = "team_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    team_survivors = {
      lines = {
        { id = "ts_default", text = "A few, hiding where they could, same as me. There was a dwarf with a long rifle who went back towards the lost dig to look for the others, and he didn't come back, and I keep listening for him." },
        { id = "ts_dorin", when = { questActive = TODO_QUEST("Songblade Search") },
          text = "A dwarf with a long rifle, letters carved in the stock? He went towards the lost dig to look for the others, and he didn't come back. I'm sorry, if he's the one you're looking for." },
      },
      choices = {
        { text = "I'll look for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    team_lead = {
      lines = {
        { id = "tl_default", text = "Some Loch Modan crew, all beards and brass instruments, and they argued so much I never worked out who was in charge. I think that was most of the trouble." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    caitlin = {
      lines = {
        { id = "ca_default", text = "My wife, and the cleverest alchemist in Menethil, whatever the smith next door says about the smell. I gather the herbs and she makes them into something worth having, and between us we keep the shelves and the pantry full." },
      },
      choices = {
        { text = "She sent me to find you.", next = "caitlin_sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caitlin_sent = {
      lines = {
        { id = "cs_default", text = "Of course she did, and she'll have been pacing the floor since the day I left. When you see her, tell her I'm sorry, and tell her I found the grasses, and then tell her I'm sorry again." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    relic = {
      lines = {
        { id = "re_default", text = "Something old as the mountains, the dwarves said, carved by hands that weren't dwarven. A great stone guardian stands over it and hasn't let anyone close, and I'm not inclined to try." },
      },
      choices = {
        { text = "Some things should stay buried.", next = "BACK", reply = "Finally, someone with sense in this valley! Tell that to the dwarves, though I warn you, they've never yet met a hole they didn't want to make deeper.", fx = { align = { light = 1 } } },
        { text = "If it's that old, it's worth taking.", next = "BACK", reply = "Then you can go and ask the big stone fellow for it yourself, and I'll watch from a very safe distance with a very large bush between us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    careful = {
      lines = {
        { id = "cf_default", text = "No, I thought I'd start a garden right here, maybe build a little fence. What did you think I was going to do? Of course I'll play it safe from here!" },
      },
      choices = {
        { text = "True enough. I'll see you outside.", next = "BACK" },
        { text = "I was just making sure. Something else.", next = "BACK" },
      },
    },

    xheal = {
      lines = {
        { id = "xh_default", text = "Oh, that's much better, thank you. I'd have hobbled out of here eventually, but I'd have hobbled very slowly, and the raptors are not slow." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Menethil born, plant-mad from a boy, and married to the best alchemist on the harbour. That's me, and that's more than enough." } },
    advice = { { id = "tp_ad", text = "If a dig crew tells you about giant grasses, buy them a drink and stay home." } },
    _none = { { id = "tp_none", text = "No idea, and right now I'm thinking about getting out of here." } },
  },
}

-- Deathstalker Agent: Forsaken agent in the hills east of the Excavation Site, watching the Dragonmaw.
-- Hostile to the Alliance; Horde players only. Dry, contemptuous, loyal to the Dark Lady.
P:NPC {
  key = "wl_deathstalker_agent", id = TODO_NPC("Deathstalker Agent"), name = "Deathstalker Agent",
  bible = "bibles/wetlands_forever.md", role = "soldier", tier = "quest",
  temper = { "dry", "sharp", "cold" }, values = { "loyal", "discreet", "cunning" },
  notices = { "forsaken", "orc", "noise" },

  impression = {
    first = "She told me to mind my voice and never gave her name.",
    third = "{name} met a Deathstalker Agent watching the Dragonmaw from the Wetlands hills on the Dark Lady's business.",
  },

  greetings = {
    { id = "g_default", text = "Mind your voice, because the marsh carries it all the way to the Dragonmaw." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Speak quietly this time." },
    { id = "g_rumors", when = { questReady = TODO_QUEST("Dragonmaw Rumors") }, text = "These are the courageous few? Mind your voices, and come down off the skyline." },
    { id = "g_maw", when = { questActive = TODO_QUEST("Open the Maw") }, text = "We're here to get the important job done. If you can help, prove it." },
    { id = "g_after", when = { questDone = TODO_QUEST("Open the Maw") }, text = "And here's my grunt. You haven't talked about the mission, I trust." },
  },

  notice = {
    { id = "n_forsaken", cat = "forsaken", when = { race = "Scourge" },
      text = "One of ours. Good; you won't need to stop and eat, and you won't flinch at what's in the Dragonmaw's tents." },
    { id = "n_orc", cat = "orc", when = { race = "Orc" },
      text = "An orc, come to watch orcs. I'll watch you too, then, at least until I know which kind you are." },
    { id = "n_noise", cat = "noise", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Do you clank like that everywhere you go, or only when I'm trying to stay hidden?" },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Deathstalker, on the Dark Lady's business, and that's as much of a name as you'll need. The Dragonmaw are in the excavation below us, and I'm here to learn why." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Open the Maw") },
          text = "The Dragonmaw, what's left of the old dragon-riding clan, think they've found something here that will raise them to their former power. Power in whose eyes, I wonder, their false warchief's?" },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Open the Maw") },
          text = "Clear out their saboteurs and warders inside so my Deathstalkers can move in unseen. If they carry anything written, it comes to me, and to nobody else." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Open the Maw"), days = 3 } },
          text = "So they hope to appease Rend Blackhand. A fruitless and wasted effort, but valuable knowledge all the same, and the Dark Lady will consider it." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it short, then." },
        { id = "h_again2", text = "Speak, but softly." },
      },
      choices = {
        { text = "Who are the Dragonmaw?", next = "dragonmaw" },
        { text = "Why does Undercity care about orcs in the Wetlands?", next = "why" },
        { text = "Who is this false warchief the Dragonmaw serve?", next = "rend" },
        { text = "What's in the excavation?", next = "dig" },
        { text = "I serve the Dark Lady as well.", next = "xrecruit", when = { origin = "forsaken_deathstalker_recruit" } },
        { text = "The Dragonmaw are orcs. Thrall would want to know.", next = "xorc", when = { race = "Orc" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "I'll go.", next = "END" },
      },
    },

    dragonmaw = {
      lines = {
        { id = "dr_default", text = "A clan of orcs who once made red dragons fly for them, with binding magic strong enough to bend a dragon's will. They lost their dragons and most of their pride, and what's left squats in these marshes waiting for someone to tell them what they were.",
          fx = { learn = { "dragonmaw" } } },
      },
      choices = {
        { text = "Could they bind dragons again?", next = "dragonmaw_bind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragonmaw_bind = {
      lines = {
        { id = "db_default", text = "The rumours say they're preparing some display of it, hence my lying in wet grass instead of standing in a dry crypt. Whether it's truth or bluster, the Deathstalkers can't act on half-formed whispers." },
      },
      choices = {
        { text = "Then let's turn whispers into facts.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because anything that can leash a dragon can leash a kingdom, and the Dark Lady prefers to know about such things before anyone else does. What she does with it is her concern, not yours and not mine." },
      },
      choices = {
        { text = "The Horde should share what we learn.", next = "why_share" },
        { text = "Knowledge is a weapon. Keep it close.", next = "why_share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_share = {
      lines = {
        { id = "ws_default", text = "This information stays between us and our royal command, and you'll not talk about it in Orgrimmar or anywhere else. The Horde is a useful arrangement, and useful arrangements are kept by knowing more than your partners." },
      },
      choices = {
        { text = "Allies who keep secrets aren't allies at all.", next = "BACK", reply = "Then you have never had allies, only friends, and friends are a luxury of the living. The Dark Lady keeps the Horde close by knowing what it does not.", fx = { align = { honor = 1 } } },
        { text = "Understood. The Dark Lady first.", next = "BACK", reply = "Good. You may yet be worth the trouble of briefing. Keep your mouth shut and your eyes open, and the Royal Apothecaries may hear your name kindly.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },

    rend = {
      lines = {
        { id = "re_default", text = "Rend Blackhand, who sits in Blackrock Spire calling himself Warchief of a Horde that doesn't want him. The Dragonmaw seem to think a gift from this dig will win his favour, a fair measure of how far they've fallen.",
          fx = { learn = { "blackrock_spire" } } },
      },
      choices = {
        { text = "Rend is a traitor to the Horde.", next = "BACK", reply = "A traitor and a fool, though the fool is the more dangerous of the two. Let the orcs settle their own blood; I only want to know what he is buying.", fx = { align = { order = 1 } } },
        { text = "Every orc chooses his own warchief.", next = "BACK", reply = "How charmingly tribal of you. Choose whom you like, but remember that only one of them is sending dragons to dig in the mud for presents.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dig = {
      lines = {
        { id = "di_default", text = "Dwarves dug into something old, which is a habit of theirs, and then the raptors and the Dragonmaw dug into the dwarves. Whatever the dwarves were after is still down there, and so are most of the dwarves." },
      },
      choices = {
        { text = "Should we help any survivors?", next = "dig_survivors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_survivors = {
      lines = {
        { id = "ds_default", text = "Dwarves are the Alliance's problem, and I'm not here to be anyone's nursemaid. Step over them or don't, but don't make noise doing it." },
      },
      choices = {
        { text = "A dying man's a dying man, whatever his banner.", next = "BACK", reply = "Sentiment, from you of all creatures? I was a dying man once, and no one stepped over the Plague to help me. Do as you like, quietly.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Fewer dwarves, fewer problems.", next = "BACK", reply = "At last, someone who can do sums. Leave them to the mud, then, and keep your attention on the Dragonmaw, who are the problem that matters.", fx = { align = { light = -1 } } },
      },
    },

    xrecruit = {
      lines = {
        { id = "xr_default", text = "Do you? Then you'll know better than to say so in the open, recruit. Prove it in that dig, and I may mention your name to someone who matters." },
      },
      choices = {
        { text = "I won't disappoint her.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xo_default", text = "Then by all means tell him, once we know what we're telling him. I'd rather your Warchief heard facts from us than stories from a drunk in Hammerfall." },
      },
      choices = {
        { text = "Thrall deserves the truth, all of it.", next = "BACK", reply = "He will have it, every word, once we know which words are true. Run to Orgrimmar half-informed and you serve your Warchief worse than silence would.", fx = { align = { honor = 1 } } },
        { text = "Facts first, then. I'll wait.", next = "BACK", reply = "Patience, from the living? How refreshing. Wait in the shadows, and when the facts are ready, you may carry them to your Warchief yourself.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I died, I woke, and the Dark Lady gave me work. The rest is not your business." } },
    advice = { { id = "tp_ad", text = "Stay off the skyline and keep your voice low. The living are always louder than they think." } },
    _none = { { id = "tp_none", text = "Not my concern, and so not yours." } },
  },
}
