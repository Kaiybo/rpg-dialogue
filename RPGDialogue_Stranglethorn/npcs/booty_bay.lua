-- Booty Bay: the Steamwheedle Cartel's port, kept by the Blackwater Raiders. Voice: bibles/stranglethorn.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "revilgaz", id = TODO_NPC("Baron Revilgaz"), name = "Baron Revilgaz",
  bible = "bibles/stranglethorn.md", role = "noble", tier = "major",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "ambitious", "proud" },
  notices = { "purse", "kit" },

  greetings = {
    { id = "g_balcony", text = "From this balcony I can count every ship in the cove and most of the coins coming off them. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. Repeat business is the only kind I trust." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors on my balcony. Doesn't trouble me. Gold doesn't wear a tabard." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You jingle when you walk. Booty Bay is fond of people who jingle. Try not to do it near the docks after dark." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Empty pockets, in my town? Dangerous. People here assume you mean to fill them from theirs." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there chewed on you. There's a smith along the boardwalk who takes coin and asks no questions." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "A cat on my balcony. If you're after the parrot, it bites, and it's worth more than you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baron Revilgaz. This port belongs to the Steamwheedle Cartel, and I keep it for them. The Blackwater Raiders hold the water, the Bruisers hold the peace, and I hold the books." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Seahorn says the Bloodsail are planning something against my town. They've hated us for years. Planning is new, and I don't like new." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "There's an island off the coast the captains won't go near anymore. Something there scares sailors, and scared sailors don't carry cargo. Find out what it is." },
        { id = "h_tides", when = { any = { { questActive = TODO_QUEST("Water Elementals") }, { questActive = TODO_QUEST("The Curse of the Tides") }, { questActive = TODO_QUEST("The Stone of the Tides") } } },
          text = "This business with the tides. I don't pretend to understand the magic. I understand exactly what it's costing me." },
        { id = "h_ledger", when = { metBefore = true }, text = "Eleven ships in, nine out, and two the Bloodsail will want to know about. The ledger never sleeps. Neither do I, much." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Lanterns on every deck. Music on every pier. Somebody's about to fall in. Every night, the same. I'd miss it." },
      },
      choices = {
        { text = "Who are the Bloodsail?", next = "bloodsail" },
        { text = "What does the Cartel want with a jungle?", next = "cartel" },
        { text = "Good day, Baron.", next = "END" },
      },
    },
    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "Pirates. Not our sort of pirate, the sort who pays dues. They raid anything that floats and they've never forgiven us for doing well. If you're fighting them, I'm paying." },
      },
      choices = {
        { text = "Then I'm fighting them.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "Just asking.", next = "END", fx = { learn = { "bloodsail" } } },
      },
    },
    cartel = {
      lines = {
        { id = "c_default", text = "Goblins took this cove from the trolls before anyone here had heard the word orc. We built a town in a shark's mouth and made it pay. Everyone's welcome as long as they spend." },
      },
      choices = { { text = "Hard to argue with that.", next = "END", fx = { affinity = 1, learn = { "steamwheedle" } } } },
    },
  },

  topics = {
    gurubashi = {
      { id = "ta_trolls", text = "The trolls had this cove first. Then they didn't. That's the whole history of property." },
    },
    horde = {
      { id = "ta_horde", text = "A customer with a grudge. Still a customer." },
    },
    alliance = {
      { id = "ta_alliance", text = "A customer with a navy. I'd like them better if they bought more." },
    },
    latest_rumors = {
      { id = "ta_rumor", text = "Rumors are Krazek's department. He charges for them. I'd charge more." },
    },
    little_secret = {
      { id = "ta_ls_no", text = "Secrets are inventory. I don't give inventory away." },
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "The parrot can count. Better than two of my clerks. I've never told the clerks." },
    },
    my_trade = {
      { id = "ta_trade", text = "I keep this port for the Cartel. Ships, tariffs, the Bruisers' wages, the Raiders' cut, and every grudge in town, all in one ledger." },
    },
    background = {
      { id = "ta_bg", text = "Started on the docks counting other goblins' crates. Now other goblins count mine. That's what I call a career." },
    },
    bloodsail = { { id = "tp_bloodsail", text = "They want my town. They've wanted it since before you were born. They can keep wanting." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut and leaves me to run things. That's the best arrangement a goblin can ask for." } },
    _none = { { id = "tp_none", text = "If it doesn't touch my port, I don't keep track of it. Krazek does. Ask him." } },
  },
}

P:NPC {
  key = "seahorn", id = TODO_NPC("Fleet Master Seahorn"), name = "Fleet Master Seahorn",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "booty_bay" }, temper = { "boisterous" }, values = { "brave", "loyal" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_deck", text = "Up the stairs and still breathing! Good start. I've watched orcs come down those stairs headfirst." },
    { id = "g_back", when = { metBefore = true }, text = "The tide's brought you back! I like a sailor who can find the way home." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, this far from the plains! I traded the grass for the sea long ago. Never regretted it. Well. Once, in a storm." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been keelhauled twice and dried in the sun. Get that armor patched before the Bloodsail notice." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear on my top floor! Ha! I've sailed with worse crews. Mind the rum." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fleet Master Seahorn, of the Blackwater Raiders! The fleet answers to me, I answer to the Baron, and the Baron answers to his ledger." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "The Bloodsail are scheming against the town. Their camp's up the Wild Shore. Raid it, bring me their letters, and we'll see whose name is on the plan." },
        { id = "h_treasure", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "A treasure under the waves, and somebody wants me to have the best of it? Bring that gem straight here, and don't let it near a Bloodsail." },
        { id = "h_storm", when = { metBefore = true }, text = "Smell that? Storm by morning. My knees know before the sky does. Old sailor's curse." },
        { id = "h_crazz", when = { heardLine = "crazz.h_default" }, text = "Crazz has been at you about the Bloodsail? Good lad. Too eager. I was too, once. It got me a fleet." },
      },
      choices = {
        { text = "Why does a tauren go to sea?", next = "why" },
        { text = "Tell me about the Bloodsail.", next = "bloodsail" },
        { text = "Fair winds, Fleet Master.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Everyone asks! My people wander the plains. I found a bigger plain. Flatter, wetter, and the centaur can't follow." },
      },
      choices = { { text = "Ha. Fair enough.", next = "END", fx = { affinity = 2 } } },
    },
    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "Cutthroats with a fleet. We're cutthroats with a town, and that's the whole difference. It matters more than you'd think." },
      },
      choices = { { text = "I'll help you sink them.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } } },
    },
  },

  topics = {
    horde = {
      { id = "ta_horde", text = "I'm tauren, so the Horde calls me cousin. I'm a Raider, so the Baron calls me partner. The sea calls me nothing at all. I like the sea." },
    },
    blackwater = {
      { id = "ta_raiders", text = "My crews! Best on the southern sea. We only kill when we must, and we must a good deal less than the Bloodsail think." },
    },
    earth_mother = {
      { id = "ta_earth", text = "She made the land, and I love her for it. But she left the sea for the restless ones. That's me." },
    },
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "I still get seasick the first day out. Every voyage! Tell anyone and I'll have you keelhauled. Gently." },
    },
    my_trade = {
      { id = "ta_trade", text = "Fleet master of the Blackwater Raiders. I keep the ships sailing, the crews paid, and the Bloodsail wet." },
    },
    background = {
      { id = "ta_bg", text = "My elders said a tauren belongs on the land. I said the land looks very fine from the deck of a ship! Ha!" },
    },
    bloodsail = { { id = "tp_bloodsail", text = "Their fleet master would dearly love my horns on his wall. He'll have to get in line." } },
    _none = { { id = "tp_none", text = "That's a landlubber's question. Ask somebody with dry boots." } },
  },
}

P:NPC {
  key = "krazek", id = TODO_NPC("Krazek"), name = "Krazek",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "chatty" }, values = { "cunning", "ambitious" },
  notices = { "craft", "purse" },

  greetings = {
    { id = "g_desk", text = "Busy, busy, busy. Never too busy for a customer, though. You are a customer?" },
    { id = "g_back", when = { metBefore = true }, text = "Already? I said you'd return. I'm rarely wrong." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! The Baron's always short of good ore, and I'm always short of favors owed. We should talk." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Lean times? I can find you work. Finding work is a service. Services cost. We'll sort it out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Krazek, secretary to Baron Revilgaz. Prices, pirates, who owes whom in this jungle: ask me. If I don't know it, it hasn't happened yet." },
        { id = "h_cousin", when = { heardLine = "tranrek.h_default" },
          text = "You met my cousin in Gadgetzan! Did he tell you what he does? No? He never does. That's how he stays rich." },
        { id = "h_thorsen", when = { questActive = TODO_QUEST("Supplies to Private Thorsen") },
          text = "Private Thorsen's out near the rebels' camp, waiting on those supplies. Keep your head down. Kurzen's men don't sign for deliveries." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "That island the Baron frets about? The crews swear they hear things out there at night. I swear I don't believe them. I'm also not going." },
        { id = "h_rumor", when = { questActive = TODO_QUEST("The Rumormonger") },
          text = "Information's my trade, and I'm trusting you with a little of it. Rumors spoil faster than fish. Run." },
        { id = "h_tranrek", when = { questActive = TODO_QUEST("Tran'rek") },
          text = "Tran'rek, in Gadgetzan. He pays well for the right sort of help. Tell him Krazek sent you; it can't hurt." },
        { id = "h_gossip", when = { metBefore = true }, text = "Three new rumors since you left. One's about you. Don't worry. It's flattering. Mostly." },
        { id = "h_smotts", when = { heardLine = "smotts.h_default" }, text = "Smotts told you about the giants? He tells everyone. I think the giants have heard it by now too." },
      },
      choices = {
        { text = "What's the word in the jungle?", next = "word" },
        { text = "Do you really know everything?", next = "brag" },
        { text = "Thanks, Krazek.", next = "END" },
      },
    },
    word = {
      lines = {
        { id = "w_default", text = "The Venture Company's cutting up the north. Kurzen's men have gone strange. The trolls are trolls. Same as ever: dangerous, and good for business." },
      },
      choices = {
        { text = "Good for business?", next = "bandages" },
        { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1, learn = { "kurzen" } } },
      },
    },
    bandages = {
      lines = { { id = "bd_default", text = "Somebody has to sell the bandages. Might as well be somebody who knows where you're bleeding." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
    brag = {
      lines = { { id = "br_default", text = "Everything worth knowing, and a fair bit that isn't. The second part's cheaper." } },
      choices = { { text = "I'll remember that.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    gurubashi = {
      { id = "ta_trolls", text = "Bloodscalp, Skullsplitter, and ruins everywhere you look. I sell maps. Not good maps. But maps." },
    },
    someplace_nearby = {
      { id = "ta_near", text = "Anything in this jungle worth seeing, I know where it is. The haunted island, the troll ruins, the Venture Company's noisy lake. Pick one and I'll tell you how to die there." },
    },
    latest_rumors = {
      { id = "ta_rumor", text = "Fresh today: the Bloodsail are scouting, Kebok's short another agent thanks to the trolls, and somebody's very short to MacKinley. That one's free." },
      { id = "ta_rumor_isle", text = "The captains still won't go near that island off the coast. Something on it scares sailors. Scared sailors don't carry cargo, and the Baron hates that." },
    },
    little_secret = {
      { id = "ta_ls_no", text = "My secrets cost more than you've got. Come back richer." },
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "Half of what I know, I overheard while pretending to file. The filing's a disaster. Nobody's noticed." },
    },
    my_trade = {
      { id = "ta_trade", text = "Schedules, letters, introductions, and information. The first three come free with the fourth." },
    },
    background = {
      { id = "ta_bg", text = "Started as the Baron's runner. Ran faster than the others, listened harder, and now? Secretary. Indispensable." },
    },
    kurzen = { { id = "tp_kurzen", text = "The rebels up north buy from me. Kurzen's lot stopped buying anything a while back. That's never a good sign." } },
    bloodsail = { { id = "tp_bloodsail", text = "Bad for shipping, bad for business, bad for my nerves. The Baron pays well to make them less of all three." } },
    _none = { { id = "tp_none", text = "That, I don't know. Come back tomorrow and I will." } },
  },
}

P:NPC {
  key = "mackinley", id = TODO_NPC("\"Sea Wolf\" MacKinley"), name = "\"Sea Wolf\" MacKinley",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "menacing" }, values = { "cunning", "practical" },
  notices = { "purse", "drink" },

  greetings = {
    { id = "g_crate", text = "Pull up a crate. Any good at knucklebones? Doesn't matter. I'm better." },
    { id = "g_back", when = { metBefore = true }, text = "Look who it is. You don't owe me a thing. Yet." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "A full purse and a friendly face. Two things that go missing in this town. Hold on to both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're three sheets gone. Sit down before you bet something you'll miss in the morning." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me the Sea Wolf. Folk borrow, folk forget, and I remind them. Dying doesn't get you out of a debt with me. I've proved it." },
        { id = "h_seen_stoley", when = { heardLine = "stoley.h_default" },
          text = "You've seen Stoley? Still breathing, is he? Good. Breathing men can pay." },
        { id = "h_voodoo", when = { questActive = TODO_QUEST("Voodoo Dues") },
          text = "There's a debt out among the trees with a bit of voodoo wrapped round it. Doesn't matter. Magic doesn't cancel what's owed." },
        { id = "h_maury", when = { questActive = TODO_QUEST("Cracking Maury's Foot") },
          text = "Maury's dead, and he still owes me. Death is no excuse. Bring me what he's got." },
        { id = "h_stoley", when = { questActive = TODO_QUEST("Stoley's Debt") },
          text = "Stoley's been dodging me long enough. Go and see him. Be friendly. At first." },
        { id = "h_knuckle", when = { metBefore = true }, text = "Won three hands of knucklebones this morning. Lost one. The one I lost, I'll be collecting on." },
      },
      choices = {
        { text = "[Persuade] Deal me in. One game.", tag = "Persuade", next = "game",
          check = { pass = { money = { min = 100000 } } },
          fail = { next = "broke" } },
        { text = "What do people owe you for?", next = "owe" },
        { text = "I'll keep my purse closed, thanks.", next = "END" },
      },
    },
    game = {
      lines = { { id = "gm_default", text = "Coin and nerve. Fine, you'll get your game. Not now; I'm working. But I'll remember your face, and I never forget a face that can pay." } },
      choices = { { text = "I'll be back for it.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    broke = {
      lines = { { id = "bk_default", text = "With that purse? Come back when it weighs more than your mouth does." } },
      choices = { { text = "Fair.", next = "END" } },
    },
    owe = {
      lines = { { id = "o_default", text = "Cards. Boats. Ale. Bad ideas, mostly. Bad ideas are always on credit." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    latest_rumors = {
      { id = "ta_rumor", text = "Shaky Phillipe's been sleeping somewhere different every night. Funny thing. I always know where." },
    },
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "I've never once collected from a man who couldn't pay. I wait until he can. Dying isn't an excuse. It's a delay." },
    },
    my_trade = {
      { id = "ta_trade", text = "Debts. Everybody's got them. I only keep track, and I'm very, very patient." },
    },
    background = {
      { id = "ta_bg", text = "I was a sailor who gambled. Then a gambler who sailed. Now I'm the one the gamblers owe. Better view." },
    },
    _none = { { id = "tp_none", text = "Does it owe me money? Then I don't care about it." } },
  },
}

P:NPC {
  key = "kebok", id = TODO_NPC("Kebok"), name = "Kebok",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "slick" }, values = { "ambitious", "cunning" },
  notices = { "purse" },

  greetings = {
    { id = "g_pitch", text = "You've the look of somebody who'd like to be rich. I can help with that. For a fee. A small fee. Medium." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor! Don't tell the others." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you've done well for yourself. Ever thought about investing? I have opportunities. Several. Some of them legal." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kebok. I move goods out of Stranglethorn to places that pay for them. Trouble is, the trolls keep killing my agents. I need someone harder to kill." },
        { id = "h_ears", when = { questActive = TODO_QUEST("Bloodscalp Ears") },
          text = "Bloodscalp ears. Bring me a bundle and I can count how many fewer trolls are bothering my people. Business by subtraction." },
        { id = "h_tusks", when = { questActive = TODO_QUEST("Skullsplitter Tusks") },
          text = "Skullsplitter tusks. Don't ask what for. All right, ask: polished up, nobody on the southern islands can tell them from a tiger's fang." },
        { id = "h_takeover", when = { questActive = TODO_QUEST("Hostile Takeover") },
          text = "That job I gave you: quietly, quickly, and my name stays off it. Some deals are best closed in the dark." },
        { id = "h_agents", when = { metBefore = true }, text = "Lost another agent to the trolls last week. Good man. Terrible at running. I'm hiring faster runners now." },
      },
      choices = {
        { text = "What exactly is the business?", next = "trade" },
        { text = "Not interested.", next = "END" },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "Buy low in the jungle, sell high over the sea. The sea's the expensive part. Pirates." } },
      choices = { { text = "Sounds risky.", next = "END", fx = { affinity = 1, learn = { "bloodsail" } } } },
    },
  },

  topics = {
    gurubashi = {
      { id = "ta_trolls", text = "The trolls keep killing my agents. I keep hiring more. One of us will run out first, and it won't be me." },
    },
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "Those tiger fangs they pay so much for in the South Seas? Troll tusks. Don't you dare spoil it." },
    },
    my_trade = {
      { id = "ta_trade", text = "Business by subtraction. A little off the top, a little off the side, and what's left is profit." },
    },
    background = {
      { id = "ta_bg", text = "I come from a long line of goblins who sold things that weren't quite what they said they were. It's a proud tradition." },
    },
    bloodsail = { { id = "tp_bloodsail", text = "Every crate they take is a crate I paid for twice. Once to buy it, once to cry about it." } },
    _none = { { id = "tp_none", text = "Is there money in it? No? Then I wasn't listening." } },
  },
}

P:NPC {
  key = "skindle", id = TODO_NPC("Innkeeper Skindle"), name = "Innkeeper Skindle",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "booty_bay" }, temper = { "wry" }, values = { "practical" },
  notices = { "drink", "guest" },

  greetings = {
    { id = "g_inn", text = "In you come, out of the sun. Stools by the windows get the breeze, and the sea air covers the smell of the fish." },
    { id = "g_home", when = { homeInn = { "Booty Bay", "The Salty Sailor Tavern" } }, text = "Your room's as you left it. Mostly. The parrots got in again." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy there. Pirates drink like that and fall off the pier. Then I have to fish them out, and I charge for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Salty Sailor. Rooms upstairs, rum down here, and the Baron up top over all of it. Keep your voice down near the stairs." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two pirates fought over a parrot last night. The parrot won. It's upstairs now. Paying rent, somehow." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night in Booty Bay: lanterns on the water, music on every deck, and somebody falling off a pier. Every night. Like clockwork." },
      },
      choices = {
        { text = "Heard anything interesting?", next = "gossip" },
        { text = "Just passing through.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "In this tavern? Everything, and none of it true. Want the Bloodsail rumor or the haunted island? Same price." } },
      choices = { { text = "I'll pass.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "The Baron's balcony leaks into room four. I give room four to people I don't like." },
    },
    my_trade = {
      { id = "ta_trade", text = "Rooms, rum and a roof. The roof's the Baron's, so mind the ceiling when he's pacing." },
    },
    background = {
      { id = "ta_bg", text = "I've run the Salty Sailor longer than most of my customers have been sober. The Baron lives upstairs. That's most of the job." },
    },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask whoever's drinking the most; they always have a theory." } },
  },
}

-- More of Booty Bay: the sea giants' victim, the debtor, the first mate, the schemer, the tavern owner, the leathercrafter.
P:NPC {
  key = "smotts", id = TODO_NPC("Captain Hecklebury Smotts"), name = "Captain Hecklebury Smotts",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "vengeful" }, values = { "proud", "stubborn" },
  notices = { "kit" },

  greetings = {
    { id = "g_giants", text = "Sea giants. Three of 'em. Ask me about them. No, don't. I'll tell you anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are you? Got anything of mine? A chest? A cutlass? A sash? No? Then sit and listen again." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Looks like the sea's had a go at you too. Welcome to the club. Membership's terrible." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Hecklebury Smotts. Had a ship, a crew and a fortune. Three sea giants took the lot: Gorlash, Negolash and Mok'rash. I bought another ship to hunt them. They sank that one too." },
        { id = "h_cutlass", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash has my cutlass. Took it right out of my hand. Bring a crew; he's bigger than he looks, and he looks enormous." },
        { id = "h_sash", when = { questActive = TODO_QUEST("The Monogrammed Sash") },
          text = "Mok'rash has my sash. Monogrammed. My mother stitched it. Get it back and I'll forgive the ocean. Partly." },
        { id = "h_sprogger", when = { metBefore = true },
          text = "Only the cook survived the second ship. Sprogger. Of everyone aboard, the cook. I've never once complained about his stew since. Out loud." },
      },
      choices = {
        { text = "Why not give up?", next = "giveup" },
        { text = "I'll get your things back.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 } } },
      },
    },
    giveup = {
      lines = {
        { id = "gu_default", text = "Give up? Two crews are at the bottom of that bay. If I give up, they drowned for nothing. I'm a stubborn man. It's all I've got left." },
      },
      choices = { { text = "Then I'll help.", next = "END", fx = { affinity = 3, align = { honor = 1 } } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "My mother stitched this sash for my first command. I wore it on both ships. I'll be wearing it when those giants die." },
    },
    my_trade = {
      { id = "ta_trade", text = "I sail. When I've a ship, anyway. Until then I hunt what sank the last two." },
    },
    background = {
      { id = "ta_bg", text = "I was a captain with two ships. Then the giants came up out of the sea. Now I'm a captain with a grudge." },
    },
    _none = { { id = "tp_none", text = "Is it a sea giant? No? Then it isn't my problem." } },
  },
}

P:NPC {
  key = "shaky", id = TODO_NPC("\"Shaky\" Phillipe"), name = "\"Shaky\" Phillipe",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "nervous" }, values = { "cautious" },
  notices = { "kit" },

  greetings = {
    { id = "g_jump", text = "Ah! Oh. Oh, it's only you. I thought you were... nobody. Nobody in particular. Hello." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Is that blood? Is that yours? Don't tell me. Don't come closer either, please." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me Shaky. I can't think why. Ha. Ha. Listen, has a big man with a gambling habit been asking about me? You'd tell me if he had. Wouldn't you?" },
        { id = "h_mackinley", when = { heardLine = "mackinley.h_default" },
          text = "You've talked to MacKinley. I can tell. You've got that look. The look of someone who knows what I owe. I'll pay! Soon! Tell him soon!" },
        { id = "h_scared", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "I paid. Every coin. I'm never playing knucklebones again. I'm never looking at meat again, either." },
      },
      choices = { { text = "Your secret's safe. For now.", next = "END", fx = { affinity = 1, trait = { cunning = 1 } } } },
    },
  },

  topics = {
    latest_rumors = {
      { id = "ta_rumor", text = "Is MacKinley looking for me? Is he? No, don't answer that." },
    },
    little_secret = {
      { id = "ta_ls", text = "Secret? I owe money. Everybody knows. That's the whole problem." },
    },
    my_trade = {
      { id = "ta_trade", text = "My trade? Hiding. I'm getting very good at it. Don't tell anyone where I'm standing." },
    },
    background = {
      { id = "ta_bg", text = "I used to be a merchant. Then I used to be a gambler. Now I'm mostly a man looking over his shoulder." },
    },
    _none = { { id = "tp_none", text = "I don't know anything! About anything! Is this about money?" } },
  },
}

P:NPC {
  key = "crazz", id = TODO_NPC("First Mate Crazz"), name = "First Mate Crazz",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "eager" }, values = { "loyal", "fierce" },
  notices = { "race" },

  greetings = {
    { id = "g_bloodsail", text = "If you've seen a red bandana on the coast, tell me where. I've been wanting a reason all week." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin! Good. You know the sea's just money with waves on it. The Bloodsail want our money. They can have the waves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "First Mate Crazz, Blackwater Raiders. The Bloodsail Buccaneers are scum, and they're up to something on our coast. I want to know what. Then I want to sink it." },
        { id = "h_buccaneers", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Their camp on the Wild Shore. Their letters, their orders, their whole plan. Bring me paper, and I'll bring the Fleet Master a war." },
        { id = "h_watch", when = { metBefore = true },
          text = "Spotted a sail on the horizon last night. Red. Gone by morning. They're watching us. Good. Let them watch us coming." },
      },
      choices = { { text = "I'll find their plan.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "I've never actually laid eyes on the Bloodsail's admiral. I hate him anyway. Saves time." },
    },
    my_trade = {
      { id = "ta_trade", text = "First mate! I shout orders, count cannonballs, and hate the Bloodsail. Mostly the last one." },
    },
    background = {
      { id = "ta_bg", text = "Signed on with the Raiders as a deck hand. Made first mate by hating the Bloodsail louder than anyone else." },
    },
    bloodsail = { { id = "tp_bloodsail", text = "Scum with sails. Every one of them. I'd sink their whole fleet for one good night's sleep." } },
    _none = { { id = "tp_none", text = "Not about the Bloodsail? Then I'm not listening." } },
  },
}

P:NPC {
  key = "fizzlebub", id = TODO_NPC("Crank Fizzlebub"), name = "Crank Fizzlebub",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "shifty" }, values = { "greedy", "clever" },
  notices = { "purse" },

  greetings = {
    { id = "g_profit", text = "Psst. You. Yes, you. Want to make some money? Course you do. Everybody does. Lean in." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you're doing well. I can always tell. It's a gift. Let's talk about doing better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Crank Fizzlebub. Entrepreneur. Opportunist. Friend to anyone with a strong arm and a short memory. Standing still never made anyone a copper." },
        { id = "h_shards", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Singing Blue Shards") }, { questActive = TODO_QUEST("Venture Company Mining") } } },
          text = "The Venture Company's digging up crystals that sing. Singing crystals! Do you know what people pay for things that sing? Bring me some. Don't ask the Venture Company first." },
        { id = "h_zanzil", when = { any = { { questActive = TODO_QUEST("Zanzil's Secret") }, { questActive = TODO_QUEST("Fool's Stout") }, { questActive = TODO_QUEST("Zanzil's Mixture and a Fool's Stout") } } },
          text = "Zanzil's mixture, a fool's stout, and a friend at a racetrack who'd like a few rivals to slow down. Don't ask me which friend. You'll meet him." },
        { id = "h_kravel", when = { heardLine = "kravel.h_default" },
          text = "You know Kravel? At the Raceway? Lovely fellow. Very competitive. We have an arrangement. You didn't hear that from me." },
      },
      choices = {
        { text = "Is any of this legal?", next = "legal" },
        { text = "What's the job?", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    legal = {
      lines = {
        { id = "l_default", text = "Legal? This is Booty Bay! The Baron takes his cut, the Bruisers keep the peace, and everything else is negotiation. You're negotiating right now. Badly." },
      },
      choices = { { text = "Fine. What's the job?", next = "END", fx = { affinity = 1, trait = { cunning = 1 } } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "Some of the races out at the Mirage Raceway aren't as honest as they look. You didn't hear that from me." },
    },
    my_trade = {
      { id = "ta_trade", text = "I buy low and sell to whoever's desperate. Singing crystals, rare goods, things with no questions attached." },
    },
    background = {
      { id = "ta_bg", text = "Tinkered a bit, traded a bit, cheated a bit. In Booty Bay that's three trades and one reputation." },
    },
    venture_company = { { id = "tp_venture", text = "Rivals. Rich, careless rivals. My favourite kind." } },
    _none = { { id = "tp_none", text = "Is there money in it? No? Then why are we talking?" } },
  },
}

P:NPC {
  key = "whiskeyslim", id = TODO_NPC("Whiskey Slim"), name = "Whiskey Slim",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "jovial" }, values = { "generous", "touchy" },
  notices = { "drink" },

  greetings = {
    { id = "g_toast", text = "A toast! To you, stranger, and to whatever brought you here. Unless it was trouble. Then to you anyway." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've been enjoying yourself. Good. Don't spill. I mean it. Don't spill." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Whiskey Slim, at your service! I've tasted every drink between here and Ironforge, and I've a cask of the finest port you'll ever... had. Had. I lost it." },
        { id = "h_grog", tags = { "news" }, when = { questActive = TODO_QUEST("Whiskey Slim's Lost Grog") },
          text = "My Pupellyverbos Port. Lost in the Hinterlands, of all the miserable places. Find it, and I'll toast your name every night for a year." },
        { id = "h_toast", when = { metBefore = true },
          text = "To friends who come back! And to friends who don't, may they come back soon! And to anyone who touches my glass: may they lose a finger." },
      },
      choices = { { text = "Cheers.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "There's a crate of Pupellyverbos Port out in the Hinterlands with my name on it. My heart's in that crate. To my heart!" },
    },
    my_trade = {
      { id = "ta_trade", text = "I'm a connoisseur. That's a drinker with standards. My standards are high and my glass is empty." },
    },
    background = {
      { id = "ta_bg", text = "I've drunk in every port on two continents and owe money in most of them. A man needs roots." },
    },
    _none = { { id = "tp_none", text = "Don't know, don't care! Drink?" } },
  },
}

P:NPC {
  key = "drizzlik", id = TODO_NPC("Drizzlik"), name = "Drizzlik",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "boastful" }, values = { "proud", "greedy" },
  notices = { "craft" },

  greetings = {
    { id = "g_emporium", text = "Welcome to Drizzlik's Emporium! The finest leather in the South Seas! The finest leather anywhere, if you ask me. You're asking me." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "A leatherworker! You've got good hands, I can tell. Not as good as mine. Close, though. Ish." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drizzlik! Finest leathercrafter of the South Seas and every world old or new. Crocolisk, raptor, panther: if it has a hide, I've made it into something gorgeous." },
        { id = "h_supply", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Supply and Demand") }, { questActive = TODO_QUEST("Some Assembly Required") } } },
          text = "I need hides. Good ones. The jungle's full of them, still attached to things with teeth. That's where you come in." },
        { id = "h_boots", when = { metBefore = true },
          text = "Somebody ordered a pair of boots from me yesterday and paid in advance. In advance! I almost fainted. I'm making them extra gorgeous out of pure shock." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "Somebody paid in advance for an order I haven't started. Don't tell them. Don't tell anyone. Mostly don't tell them." },
    },
    my_trade = {
      { id = "ta_trade", text = "Leather. The best. Ask anyone. Better yet, don't ask. Just look at the stitching." },
    },
    background = {
      { id = "ta_bg", text = "Started with a knife and one raptor hide. Now Drizzlik's Emporium is the finest leather shop south of anywhere." },
    },
    _none = { { id = "tp_none", text = "Is it leather? No? Then it's beneath me." } },
  },
}

P:NPC {
  key = "sprogger", id = TODO_NPC("Sprogger"), name = "Sprogger",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "haunted" }, values = { "loyal" },
  notices = { "drink" },

  greetings = {
    { id = "g_cook", text = "You hungry? I can cook. I'm a cook. I was a cook. On a ship. Two ships, actually." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy on the grog. The water's closer than you think from these docks. I'd know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sprogger. I cooked for Captain Smotts on the Smotts' Revenge. The giants came up out of the water and that was the end of her. Everyone went down but the Captain and me." },
        { id = "h_negolash", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash. I can still see him, coming over the rail. Bring friends. Lots of friends. Then come back and tell me he's gone. I'd like to sleep again." },
        { id = "h_why", when = { metBefore = true },
          text = "People ask why I lived. I was in the galley, under a pot. A big pot. That's the whole secret. It isn't a good story, but it's mine." },
      },
      choices = { { text = "I'm glad you made it.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "I still sleep with that pot lid under the bed. In case." },
    },
    my_trade = {
      { id = "ta_trade", text = "I cook. Fish, mostly. I don't go out on the water for them anymore." },
    },
    background = {
      { id = "ta_bg", text = "I was cook on the captain's ship. When the giant came, I got under the big pot. Everyone else didn't." },
    },
    _none = { { id = "tp_none", text = "I only know cooking and sea giants. Mostly cooking. Too much sea giants." } },
  },
}

P:NPC {
  key = "fin", id = TODO_NPC("Fin Fizracket"), name = "Fin Fizracket",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "miserable" }, values = { "hopeful" },
  notices = { "kit" },

  greetings = {
    { id = "g_sick", text = "Don't come too close. Or do. I don't know if it's catching. Nobody knows anything. Ugh." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fin Fizracket, Blackwater Raiders. Or I was, before the Stranglethorn Fever got me. Sweats, shakes, and a taste in my mouth like old boots. Don't get sick in the jungle." },
        { id = "h_fever", tags = { "news" }, when = { questActive = TODO_QUEST("Stranglethorn Fever") },
          text = "There's a cure. Supposedly. A gorilla's heart. A particular gorilla, a big angry one called Mokk. I can't believe I'm hoping somebody kills a gorilla for me." },
        { id = "h_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "I'm better! Look at me. Standing! The heart tasted awful. I'd eat ten more. Actually no. Never again. But I'd think about it." },
      },
      choices = { { text = "Feel better.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "I've been sick so long I've forgotten what I meant to do once I was well. Something with a boat, I think." },
    },
    my_trade = {
      { id = "ta_trade", text = "Pirate. Technically. Mostly I lie here and sweat." },
    },
    background = {
      { id = "ta_bg", text = "Joined the Raiders for adventure. Caught the fever instead. Still waiting on the adventure." },
    },
    _none = { { id = "tp_none", text = "Can't think. Fever. Ask somebody healthy." } },
  },
}

P:NPC {
  key = "lozgil", id = TODO_NPC("Wharfmaster Lozgil"), name = "Wharfmaster Lozgil",
  bible = "bibles/stranglethorn.md", role = "worker", tier = "quest",
  communities = { "booty_bay" }, temper = { "watchful" }, values = { "careful", "practical" },
  notices = { "race" },

  greetings = {
    { id = "g_docks", text = "Watch your step on the boards, and your purse on the docks. Not necessarily in that order." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Horde, eh? There's a crate of axes with your name on it. Well. Your Warchief's name. Been sitting there for days." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wharfmaster Lozgil. Everything that comes off a boat in Booty Bay comes past me first. You'd be amazed who comes and goes here. You'd be amazed who I'd rather didn't." },
        { id = "h_warsong", tags = { "news" }, when = { questActive = TODO_QUEST("Warsong Supplies") },
          text = "The Warsong crate. Axes, by the weight of it. It's been sitting on my dock for days. Haul it off, please, before somebody else decides it's theirs." },
        { id = "h_sponsor", when = { questActive = TODO_QUEST("Goblin Sponsorship") },
          text = "The Cartel likes to know who it's investing in. Show me you're worth the gold, and the gold will find you." },
        { id = "h_watch", when = { metBefore = true },
          text = "Saw a sailor slip a letter to a fishmonger this morning. Fishmongers don't read. I've made a note." },
      },
      choices = { { text = "I'll watch my purse.", next = "END", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    someplace_nearby = {
      { id = "ta_near", text = "The sea. It's right there. Everything else is jungle, and I don't do jungle." },
    },
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "There's a crate on my docks for the Horde that I was told not to look at. I looked. Axes." },
    },
    my_trade = {
      { id = "ta_trade", text = "Ships in, ships out, and every name in the book. If it floats, I know who owns it." },
    },
    background = {
      { id = "ta_bg", text = "Years on these docks. I've seen every kind of cargo and every kind of liar. Some of them came in the same crate." },
    },
    bloodsail = { { id = "tp_bloodsail", text = "Some of the faces on my docks wear red when nobody's looking. I can't prove it. Yet." } },
    _none = { { id = "tp_none", text = "If it didn't come off a boat, I don't know it." } },
  },
}
