-- Orgrimmar's working people: the bank, the auction house, the wind riders and the kennels,
-- the Valley of Honor's crafters, and the officer who walks the Valley of Strength.
-- None of them gives a quest or has much to say in the game. Voice: bibles/townsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Valley of Strength
---------------------------------------------------------------------------

-- Karus: a banker who remembers when orcs owned nothing worth locking up.
P:NPC {
  key = "karus", id = TODO_NPC("Karus"), name = "Karus", title = "Banker",
  bible = "bibles/townsfolk.md", role = "banker", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical", "honest" },
  impression = {
    first = "Karus guards the vaults of Orgrimmar with a ledger and a long memory. He remembers when no orc owned anything worth locking up, and he treats every deposit like proof of how far the Horde has come.",
    third = "{name} met Karus, a banker of Orgrimmar who keeps the Horde's vaults and remembers the camps that came before them.",
  },

  greetings = {
    { id = "g_hi", text = "Your vault is where you left it, and so is everything in it. I'd know if it weren't." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Put it in or take it out, and I'll write it down either way." },
    { id = "g_goblin", when = { race = "Goblin" }, text = "A goblin at an orc's counter. Count it twice if you like, but you'll find I counted it three times." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I doubt it, but the orcs who listen to them seem to keep less of it and sleep better for it. In the camps we couldn't own a copper, and now we lock up chests of it, so perhaps the spirits are right to laugh at us." } },
      choices = {
        { text = "Gold kept in good order serves the Horde well.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hoarded gold is just another chain, like the camps.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Karus, of the bank of Orgrimmar. Whatever you leave with me stays locked away until you come for it, and you can reach the same vault from any bank in the Horde." },
        { id = "h_orc", when = { race = "Orc" }, text = "When we were in the camps, the only thing an orc could own was his anger. Now look at us, queuing for our own vaults like merchants. Your vault is ready, {g:brother|sister}." },
        { id = "h_rich", when = { money = { min = 1000000 } }, text = "You carry more gold than most warbands ever saw. Leave some of it with me before a Kolkar cuts your purse off your belt in the Barrens." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at the vaults. Your kind give back to the earth what they take from it, which is more than most of my depositors do with their gold." },
      },
      again = {
        { id = "h_again", text = "Something else, or shall I open the vault?" },
        { id = "h_again2", text = "Go on. The ledger can wait a moment, though not a long one." },
      },
      choices = {
        { text = "Do the spirits care about gold, Karus?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Open my vault, please.", next = "BUSINESS" },
        { text = "How can every bank reach the same vault?", next = "vault" },
        { text = "What do orcs keep in a bank?", next = "keep" },
        { text = "Has anyone ever tried to rob you?", next = "rob" },
        { text = "Nothing today, Karus.", next = "END" },
      },
    },
    vault = {
      lines = { { id = "v_default", text = "Couriers, ledgers and a great deal of trust between bankers who've never met. The goblins worked out most of it, and they'd want me to add that they charge for the idea." } },
      choices = {
        { text = "Do you trust goblins with that much?", next = "vault_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault_goblins = {
      lines = { { id = "vg_default", text = "I trust their greed, which is steadier than most people's honour. A goblin who steals from a vault loses every vault after it, and they all know that arithmetic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "Less gold than you'd think. Mostly it's things they can't carry and won't sell: a father's axe, a clan banner from before the camps, letters from a cousin at Hammerfall." } },
      choices = {
        { text = "Keepsakes are worth guarding.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sentiment is dead weight in a war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you keep here yourself?", next = "keep_own" },
      },
    },
    keep_own = {
      lines = { { id = "ko_default", text = "The chain from the internment camp at Durnholde, which a guard struck off my ankle the day the Warchief freed us. I take it out once a year and look at it, and then I put it back." } },
      choices = {
        { text = "I'm glad you're free of it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob = {
      lines = { { id = "r_default", text = "A rogue tried it once, all shadows and soft boots. He didn't count on the Grunts at the door, who aren't clever, but who are very, very large." } },
      choices = {
        { text = "What happened to him?", next = "rob_after" },
        { text = "I'd never try it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    rob_after = {
      lines = { { id = "ra_default", text = "He spent a season hauling stone for the city walls. He hauls crates in the Drag now, and honestly, I hear, which is more than most rogues can say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Bring it to me if you want it safe, or take it to the auction house if you want it gone." } },
    _none = { { id = "tp_none", text = "I keep coin and keepsakes, not answers. Ask Gryshka at the inn; people tell her everything." } },
  },
}

-- Auctioneer Thathung: runs bids at Orgrimmar's auction house, and wishes people would read the slips.
P:NPC {
  key = "thathung", id = TODO_NPC("Auctioneer Thathung"), name = "Auctioneer Thathung", title = "Auctioneer",
  bible = "bibles/townsfolk.md", role = "auctioneer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "practical" },
  impression = {
    first = "Auctioneer Thathung runs the bids at Orgrimmar's auction house in a voice made for a battlefield. He would rather explain the deposit once, clearly, than hear one more complaint about it.",
    third = "{name} met Auctioneer Thathung, who keeps the bids honest at the auction house of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Buying or selling? Either way, read the slip before you sign it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did it sell? Then you're welcome; and if it didn't, price it lower." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Elemental earth and fire, mostly, scraped off the creatures in the Badlands and Searing Gorge, and the smiths fight over every scrap of it. The shamans who list it always look a little guilty, so I don't ask where it came from." } },
      choices = {
        { text = "Selling the remains of elementals dishonors the spirits.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If an elemental attacks me, what's left of it is mine to sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Auctioneer Thathung. You list your goods, other people bid, and the house takes a deposit and a cut. That's the whole of it, though you'd be amazed how many warriors want it explained twice." },
        { id = "h_low", when = { maxLevel = 15 }, text = "New to the house, are you? Start by selling the linen and the copper you've been carrying around, because somebody here always needs it more than you do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you're selling totems this isn't the place, and if you're buying them it isn't either, because no shaman I know would trust one made by another hand." },
      },
      again = { { id = "h_again", text = "Another question? Ask it quickly; the bids don't wait." } },
      choices = {
        { text = "Do shamans ever sell anything through the house?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me what's for sale.", next = "BUSINESS" },
        { text = "Why do I pay a deposit?", next = "deposit" },
        { text = "What sells best in Orgrimmar?", next = "sells" },
        { text = "How is this house different from Booty Bay's?", next = "neutral" },
        { text = "Farewell.", next = "END" },
      },
    },
    deposit = {
      lines = { { id = "d_default", text = "So nobody lists a hundred rusty swords for a fortune and clogs the house for a day. Sell it and you get the deposit back; leave it unsold and the house keeps it for its trouble." } },
      choices = {
        { text = "That seems fair enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's a tax on the poor, and you know it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who keeps the deposits?", next = "deposit_tax" },
      },
    },
    deposit_tax = {
      lines = { { id = "dt_default", text = "The house does, and it pays the Grunts at the door and the clerks who sort the mail with it. None of it goes into my pocket, before you ask, and I'd be a richer orc if it did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "s_default", text = "Cloth and herbs, every day, because tailors and alchemists are always short. Copper bars when the smiths in the Valley of Honor are busy, and anything that glows when the warlocks from the Cleft come up for air." } },
      choices = {
        { text = "The warlocks shop here?", next = "sells_cleft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_cleft = {
      lines = { { id = "sc_default", text = "They pay in good coin and they don't haggle, which I like. They also don't say what they want it for, which I like less, but the house doesn't ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neutral = {
      lines = { { id = "n_default", text = "This house trades only within the Horde. The goblins in Booty Bay and Gadgetzan will sell to anyone, Alliance included, and they take a much bigger cut for the privilege." } },
      choices = {
        { text = "Trading with the Alliance seems wrong.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gold is gold, whoever's hand it comes from.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_steam", text = "The goblins' cartel runs the neutral houses. They're cheerful, they're thorough, and they always get paid." } },
    trade = { { id = "tp_trade", text = "Price it fairly and it sells. Price it greedily and it comes back to you in the mail." } },
    _none = { { id = "tp_none", text = "If it isn't for sale, I don't know much about it. Try the bank across the valley." } },
  },
}

-- Doras: the wind rider master on the tower above the Valley of Strength.
P:NPC {
  key = "doras", id = TODO_NPC("Doras"), name = "Doras", title = "Wind Rider Master",
  bible = "bibles/townsfolk.md", role = "flightmaster", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "loyal" },
  notices = { "mount" },
  impression = {
    first = "Doras keeps the wind riders on the tower above the Valley of Strength and talks about them the way some orcs talk about wolves. He trusts the beasts more than most riders, and says so.",
    third = "{name} met Doras, the wind rider master of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Where to? The wind riders are rested, so don't keep them waiting." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the tower. Mind the one on the end; she bites when she's bored." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get that beast off my tower before the wind riders decide it's dinner. They're fed, but they're not that well fed." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and they listen better than their riders. Before a storm comes in off the sea every wind rider on this tower goes quiet and tucks its head, and I've learned to cancel the flights when they do, whatever the passengers say." } },
      choices = {
        { text = "You're right to keep that rule, Doras.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd fly straight into it. The air spirits wouldn't harm me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Doras. I keep the wind riders, and they'll carry you to the Crossroads, to Thunder Bluff, or anywhere else the Horde has a roost. Have you flown before, or will you be holding on with your eyes shut?" },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren up my tower! You'd make a wind rider sweat, but they've carried heavier, so climb on and keep your hooves tucked in." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders like your kind, because you smell of storms, and they were flying through storms long before the Horde came to this land." },
      },
      again = { { id = "h_again", text = "Is that all, or do I saddle one? They get restless when people stand about talking." } },
      choices = {
        { text = "Do the wind riders hear the air spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "Where do the wind riders come from?", next = "beasts" },
        { text = "Why can't I fly somewhere new?", next = "roosts" },
        { text = "What about the zeppelins?", next = "zeppelin" },
        { text = "Not today.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "From the wild, and they don't come willingly. A wind rider has to decide you're worth carrying, and it takes a season of feeding and patience before one stops trying to take your arm off." } },
      choices = {
        { text = "That sounds like taming a wolf.", next = "beasts_wolf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_wolf = {
      lines = { { id = "bw_default", text = "It's harder. A wolf wants a pack, but a wind rider only wants the sky, so you're asking it to share. The ones on this tower have agreed to, and I thank them for it every morning." } },
      choices = {
        { text = "Beasts deserve that respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast serves, or it's no use to us.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    roosts = {
      lines = { { id = "r_default", text = "Because a wind rider flies to a roost it knows, and you have to show yourself at the roost first so the master there knows you. Walk there once, speak to the keeper, and you'll fly there ever after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zeppelin = {
      lines = { { id = "z_default", text = "The goblins' airships leave from the towers outside the city gates, bound for Tirisfal and for Grom'gol in Stranglethorn. They're full of gas that burns, they're flown by goblins, and I'll never set foot on one." } },
      choices = {
        { text = "I'll take a goblin airship any day.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'd rather trust a beast I can see.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "From up here everything below looks small, so I couldn't tell you. Ask someone on the ground." } },
  },
}

-- Urtrun Clanbringer: the city's guild master, who registers new warbands and their colours.
P:NPC {
  key = "urtrun", id = TODO_NPC("Urtrun Clanbringer"), name = "Urtrun Clanbringer", title = "Guild Master",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "proud" }, values = { "honorable", "loyal" },
  impression = {
    first = "Urtrun Clanbringer registers new guilds for the Warchief and treats every charter like a clan being born. He talks about the old clans with pride and about what they became with care.",
    third = "{name} met Urtrun Clanbringer, the guild master of Orgrimmar, who sees every new guild as a new clan.",
  },

  greetings = {
    { id = "g_hi", text = "Come to found a clan of your own? Or have you come to see what one costs?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you gathered your names yet, or are you still persuading them?" },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every one I register, if I had my way. The Frostwolves kept their shamans when the other clans traded theirs for warlocks, and that is why Drek'Thar still speaks for them while the rest of us had to learn it all again from Thrall." } },
      choices = {
        { text = "A guild needs an elder to keep it honest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A guild should choose its own way, not copy the old clans.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Tribes, they call them, Bloodhoof and Runetotem and the rest, and Cairne holds them together the way the Warchief holds us. I envy them that, because the camps scattered our clans and left half of us with no name to give." } },
      choices = {
        { text = "Old names should be remembered and kept.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "New names are earned. Let the old ones go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Urtrun Clanbringer, and the Warchief has charged me with recording every new guild of the Horde. In the old days we had clans, and now we have guilds, but a band of warriors who share a name is a clan, whatever you call it." },
        { id = "h_orc", when = { race = "Orc" }, text = "Which clan were your parents, {g:brother|sister}? Never mind; many don't know any more, and the camps took the names from more of us than the war did. Start a new one, then, and make it worth remembering." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, come to the registry of guilds! Your people never had much need for the word clan, I think, because a whole tribe stands behind every one of you." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at the guild registry! In the old clans every warband had a shaman to speak for its ancestors, and I'll say plainly that the guilds could use a few more." },
      },
      again = { { id = "h_again", text = "What else? Ask, and I'll answer like a clan elder." } },
      choices = {
        { text = "Should every guild keep a shaman, as the clans did?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the tauren keep clans as the orcs do?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I want to start a guild.", next = "BUSINESS" },
        { text = "What were the old clans like?", next = "clans" },
        { text = "What makes a good guild?", next = "good" },
        { text = "I'm Frostwolf.", next = "frostwolf", when = { origin = "orc_frostwolf" } },
        { text = "Farewell, Urtrun.", next = "END" },
      },
    },
    clans = {
      lines = { { id = "c_default", text = "Proud, and quarrelsome, and each one sure it was the greatest. The Warsong and the Blackrock and the Frostwolves, the Dragonmaw with their beasts, and a dozen more. Then the demons' blood bound most of them into one Horde, and some never came back from it." } },
      choices = {
        { text = "Were the clans better before the Horde?", next = "clans_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clans_better = {
      big = true,
      lines = { { id = "cb_default", text = "Freer, perhaps, and also always at each other's throats. The Warchief's Horde is the first that chose to be one, and I'd rather record a hundred small guilds who chose it than one great clan that was forced." } },
      choices = {
        { text = "Unity is worth more than old names.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A people without their clans has lost something.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    good = {
      lines = { { id = "g_default", text = "Names on the charter are easy to find, but loyalty when the fight goes badly is not. Pick the ones who'll come back for you in the Wailing Caverns, not the ones who'll split the loot fastest." } },
      choices = {
        { text = "And the tabard?", next = "good_tabard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_tabard = {
      lines = { { id = "gt_default", text = "Choose your colours carefully, because you'll be wearing them in front of every enemy the Horde has. The old clans painted their banners in blood; you only need gold, but treat it as seriously." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    frostwolf = {
      lines = { { id = "f_default", text = "Then you're of the one clan that never drank. Drek'Thar's people kept the old ways in Alterac while the rest of us forgot them, and the Warchief owes them his life. Bring that honour into any guild you join." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "That's a clan I'll never record, whatever name they come in under." } },
    _none = { { id = "tp_none", text = "That's no clan's business I've recorded. Ask the Grunts; they hear everything on their walls." } },
  },
}

-- Overlord Runthak: an officer of Orgrimmar who walks the Valley of Strength.
P:NPC {
  key = "runthak", id = TODO_NPC("Overlord Runthak"), name = "Overlord Runthak", title = "Orgrimmar Officer",
  bible = "bibles/townsfolk.md", role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "loyal", "disciplined" },
  notices = { "class", "race" },
  impression = {
    first = "Overlord Runthak walks the Valley of Strength like he's inspecting troops, and to him the whole city is troops. He's loyal to Thrall without a flicker of doubt and suspicious of everyone else on principle.",
    third = "{name} met Overlord Runthak, an officer who walks the Valley of Strength in Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Keep moving, citizen, and keep your weapon sheathed in the Warchief's city." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still in one piece, I see. Good; the Horde needs you that way." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I've got my eye on you, warlock. Do your business in the Cleft and keep your little demons out of my valley." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's. The Warchief says you're Horde, so you're Horde, but don't breathe on the bread at the market." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every day, though he'd say he never left it. Drek'Thar taught him among the Frostwolves, and he carries the Doomhammer that Orgrim gave him, and I've seen the sky darken when he's angry, which is why I'd rather he wasn't." } },
      choices = {
        { text = "Then I'll hold myself to the Warchief's standard.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Warchief walks his path, and I'll walk my own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not a chance, and I'd let them try if I didn't have to explain the broken bones afterward. The Warchief wants orcs and tauren to stand as brothers, so I keep the bloody noses to a minimum." } },
      choices = {
        { text = "Keep them in line, Overlord. The Warchief is right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them try. A beating teaches faster than orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Overlord Runthak. I keep the peace in the Valley of Strength, which mostly means stopping new recruits from fighting each other outside the inn. What do you want?" },
        { id = "h_young", when = { maxLevel = 10 }, text = "Fresh from the Valley of Trials, by the look of you. Don't get lost in the Drag, and don't buy anything a goblin calls a bargain." },
        { id = "h_vet", when = { minLevel = 50 }, text = "You've seen real fighting; it's in how you stand. The young ones here could learn something from watching you walk, so walk slowly." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, eh? Mind the recruits, because they've heard your kind can turn into bears, and half of them want to find out whether they could win." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The Warchief walks your path himself, so you'll hold yourself to his standard in my valley, and that means no lightning near the inn." },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick; I'm on my rounds." } },
      choices = {
        { text = "Does the Warchief still walk the shaman's path, Overlord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would any of them win, Overlord?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who was the city named for?", next = "name" },
        { text = "What trouble do you see in the city?", next = "trouble" },
        { text = "How do I find my way around?", next = "around" },
        { text = "Dismissed, Overlord.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "Orgrim Doomhammer, the Warchief before Thrall, who died fighting free of the humans and gave Thrall his armour and his hammer. And the land outside is Durotar, for Durotan of the Frostwolves, Thrall's father. Remember both names." } },
      choices = {
        { text = "I'll honour them both.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Dead heroes don't win new wars.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Did you know Doomhammer?", next = "name_dead" },
      },
    },
    name_dead = {
      lines = { { id = "nd_default", text = "I saw him once, from the back of a crowd of slaves he'd just freed, and he looked tired and enormous. I've never forgotten either thing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Drunks at the Broken Tusk, thieves in the Drag, and quarrels between clans that ended a generation ago. And there are whispers about cultists down in Ragefire Chasm, under the Cleft of Shadow, which the Warchief takes more seriously than he lets on." } },
      choices = {
        { text = "Cultists? Under the city?", next = "trouble_chasm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_chasm = {
      lines = { { id = "tc_default", text = "The Burning Blade, or so they say, hiding in the fire under our feet with troggs for company. If you're strong enough, go down and clear them out, but don't let anyone in the Cleft see you going." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    around = {
      lines = { { id = "a_default", text = "You're in the Valley of Strength, with the bank, the auction house and the inn. Go north up the Drag for the shops and the Cleft of Shadow, west for the Valley of Spirits and the trolls, and east for the Valley of Honor and its trainers." } },
      choices = {
        { text = "And Grommash Hold?", next = "around_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    around_hold = {
      lines = { { id = "ah_default", text = "At the top of the Drag, in the Valley of Wisdom; you can't miss it. Speak respectfully in front of the Warchief, and do not touch the hammer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Traitors who miss the demons. I'd hang every one of them from the city walls, if the Warchief would let me." } },
    wailing_caverns = { { id = "tp_caverns", text = "A druid's den in the Barrens with something sick inside it. That's the tauren's mess, but our young ones go and help." } },
    _none = { { id = "tp_none", text = "That isn't my concern unless it starts a fight in my valley." } },
  },
}

---------------------------------------------------------------------------
-- Valley of Honor
---------------------------------------------------------------------------

-- Ogunaro Wolfrunner: the kennel master, who sells wolves to orcs and to friends of the city.
P:NPC {
  key = "ogunaro", id = TODO_NPC("Ogunaro Wolfrunner"), name = "Ogunaro Wolfrunner", title = "Kennel Master",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "warm" }, values = { "loyal", "proud" },
  impression = {
    first = "Ogunaro Wolfrunner raises the Horde's riding wolves and speaks of each one by name. He will sell a wolf to any orc and to anyone the city has truly accepted, and he means both rules.",
    third = "{name} met Ogunaro Wolfrunner, the kennel master who raises the riding wolves of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the pups; they nip, but they mean it kindly." },
    { id = "g_orc", when = { race = "Orc" }, text = "{g:Brother|Sister}! Come and meet the new litter. There's a grey one that looks at you like an old chieftain." },
    { id = "g_back", when = { metBefore = true }, text = "Back to visit the wolves, are you? They remember your smell, which is more than I can say for most visitors." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every one, and a stubborn one at that. The shamans say a wolf's spirit is half the beast and half the wind on the plains, and when one of mine dies I sit with it until the spirit has gone, because a wolf should never run alone." } },
      choices = {
        { text = "A wolf that served the Horde deserves that kindness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A wolf is a mount, and mourning it seems a waste.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "A wolf raised by my hand knows no other life, and I've never seen one that didn't want to run beside its rider. Still, I'll admit the wild wolves of Durotar look at mine as if they pity them." } },
      choices = {
        { text = "A wolf's place is beside its rider.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every wolf should know the wild at least once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ogunaro Wolfrunner, kennel master. I raise the wolves the Horde rides to war, and every one of them was raised by my hand. Have you come to look, or have you come to buy?" },
        { id = "h_orc", when = { race = "Orc", minLevel = 40 }, text = "You're ready for one of my wolves, and they can tell. Come and choose, though the truth is the wolf will choose you." },
        { id = "h_friend", when = { ["not"] = { race = "Orc" }, reputation = { faction = "Orgrimmar", min = "exalted" } },
          text = "The whole city speaks well of you, and that's enough for me to sell you a wolf, whoever your people are. Come and choose one." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The wolves smell something on you they can't name, and look, they've gone quiet, which is more respect than they show most orcs." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The wolves know your kind, because the Frostwolves have run with shamans for as long as there have been Frostwolves, and see, they're already watching you." },
      },
      again = { { id = "h_again", text = "Anything else? The wolves are listening, so ask nicely." } },
      choices = {
        { text = "Do wolves have spirits of their own, Ogunaro?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the wolves mind being raised for war?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your wolves.", next = "BUSINESS" },
        { text = "Why only orcs?", next = "orcs", when = { ["not"] = { race = "Orc" } } },
        { text = "How do you train a wolf to carry a rider?", next = "train" },
        { text = "Orcs have always ridden wolves, haven't they?", next = "history" },
        { text = "My companion is a wolf too.", next = "hunter", when = { class = "HUNTER", pet = { family = "Wolf" } } },
        { text = "I'll come back.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "Because a wolf is a bond between orc and beast that goes back to before the Dark Portal, and I won't sell that to just anyone. Earn the city's full trust and I'll sell you one, whatever you are; plenty of tauren and trolls have." } },
      choices = {
        { text = "That's fair. Trust should be earned.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gold should be enough for any merchant.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    train = {
      lines = { { id = "t_default", text = "Slowly, and from the day they open their eyes. They learn your weight before they learn your voice, so I carry them across my shoulders as pups and then I let them carry me. By the time they're grown, they think it was their idea." } },
      choices = {
        { text = "Do they ever refuse a rider?", next = "train_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    train_refuse = {
      lines = { { id = "tr_default", text = "Sometimes, and I don't argue with them. A wolf that won't carry you will throw you in the middle of a charge, so I'd rather it said so in my kennel than in the Barrens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history = {
      lines = { { id = "hi_default", text = "Since long before the Horde, on the old world. The Frostwolves are named for them, and the wolves they keep in Alterac are as white as the snow. Mine are smaller and greyer, but they're as loyal as any." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "alterac" } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "So I see, and a fine one. Bring {pet} round to the kennels any time; mine will want to smell your wolf, and your wolf will want to show off. Feed it before you leave, though, or it'll steal from mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    alterac = { { id = "tp_alterac", text = "The Frostwolves' mountains. The wolves there are bigger than mine, and I'm not too proud to say so." } },
    _none = { { id = "tp_none", text = "I know wolves, and that's about all. Ask the wolves; they're better company than half this city." } },
  },
}

-- Lumak: the fishing trainer, who learned to fish because the camps never fed anyone enough.
P:NPC {
  key = "lumak", id = TODO_NPC("Lumak"), name = "Lumak", title = "Fishing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "profession" },
  impression = {
    first = "Lumak teaches fishing to orcs who think it's beneath them, and he's patient about it. He learned the trade to keep himself fed after the camps, and he says a quiet river was the first peace he ever had.",
    third = "{name} heard how Lumak, fishing trainer of Orgrimmar, found his first peace by a river after the camps.",
  },

  greetings = {
    { id = "g_hi", text = "Sit if you like. Fishing teaches you to sit still before it teaches you anything else." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Caught anything, or only the weeds and the Barrens' boots?" },
  },

  notice = {
    { id = "n_angler", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "You hold yourself like an angler now, with your shoulders loose and your eyes on the water. I can always tell." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Help, if you're patient with them, and patience is the only bait I've ever needed. On a still morning at the river below the city I can feel something watching the line with me, and I haven't felt alone out there since the camps." } },
      choices = {
        { text = "Peace on the river is a gift worth guarding.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The water gives what you take from it, and that's all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lumak. I teach fishing, though most orcs who walk past me think it's a job for peons. Then they spend a week in the Barrens with nothing but dry jerky, and they come back asking for a pole." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear wants fishing lessons from an orc? Your people were fishing off the Echo Isles before mine ever saw the sea. You could probably teach me." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here by the water. Keep your voice low, because the water spirits are easier to frighten than the fish, and a good deal harder to catch." },
      },
      again = { { id = "h_again", text = "Something else? Keep your voice low; voices carry over water." } },
      choices = {
        { text = "Do the water spirits help or hinder a fisherman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's good fishing near Orgrimmar?", next = "where" },
        { text = "Why did you take up fishing?", next = "why" },
        { text = "Fishing is a waste of a warrior's time.", next = "waste" },
        { text = "Farewell, Lumak.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "The coast below Razor Hill, for a start, and the shore by Sen'jin Village, where the trolls will tell you you're doing it wrong. The oases of the Barrens are good too, if you don't mind the crocolisks watching you." } },
      choices = {
        { text = "Do the crocolisks bother you?", next = "where_croc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_croc = {
      lines = { { id = "wc_default", text = "Only when I catch something they wanted. Throw them a small fish and they'll leave you alone, and keep the big ones for yourself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "y_default", text = "In the internment camps we were fed whatever the humans had left over, and some days that was nothing. When the Warchief freed us, I found a river and sat by it for three days, and I caught enough fish to feed eleven of us. I've fished ever since." } },
      choices = {
        { text = "That's a good reason.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'm sorry the camps were so cruel.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    waste = {
      lines = { { id = "wa_default", text = "Is it? A warrior with a fishing pole eats on the road, and one without eats his boots. Fishing taught me patience, too, and I've never met a warrior who had too much of that." } },
      choices = {
        { text = "Patience wins more fights than rage.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rage wins the ones that matter.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    echo_isles = { { id = "tp_isles", text = "The trolls say the fishing there was the best on the coast. They don't talk about what's there now." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Throw a line in the water and think about it; that's what I'd do." } },
  },
}

-- Makaru: the mining trainer, who reads Durotar's hills like a map.
P:NPC {
  key = "makaru", id = TODO_NPC("Makaru"), name = "Makaru", title = "Mining Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "diligent" },
  notices = { "profession" },
  impression = {
    first = "Makaru teaches mining as if the rock were an opponent who fights fair if you respect it. Durotar's hills are a map in Makaru's head, vein by vein.",
    third = "{name} was told by Makaru, who teaches mining in the Valley of Honor, to listen for the ore in the rock.",
  },

  greetings = {
    { id = "g_hi", text = "Come to learn to dig? Then roll your sleeves up; there's no clean way to do it." },
    { id = "g_back", when = { metBefore = true }, text = "Still swinging a pick? Show me your hands and I'll tell you how long you've been at it." },
  },

  notice = {
    { id = "n_miner", cat = "profession", when = { profession = { name = "Mining", min = 125 } },
      text = "There's iron dust in the creases of your knuckles. You've been past the copper and the tin, then, and it shows." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, but I listen before I swing the pick, and stone tells you when it's angry if you're quiet enough. The shamans say the earth spirits of Durotar are hard and slow to forgive, and every vein I've worked agrees with them." } },
      choices = {
        { text = "Ask first and dig carefully. That's the right way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The ore is there to be taken, so I'll take it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Makaru, and I teach mining. The city was built from the stone of these hills, and every forge in the Valley of Honor burns ore that somebody dug out with a pick." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "A smith! Then you know what bad ore does to a blade, so learn to dig your own and never trust a stranger's bars." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the miners' hall. You'll ask the earth's leave before you dig, I suppose, and I won't laugh at you for it, because the hills here have dropped a roof on more than one miner who didn't." },
      },
      again = { { id = "h_again", text = "What else? Make it quick; the light's going in the hills." } },
      choices = {
        { text = "Do you ask the earth's leave before you dig?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where can I find ore near here?", next = "where" },
        { text = "What makes a good miner?", next = "good" },
        { text = "Who buys the ore?", next = "who" },
        { text = "Farewell, Makaru.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "There's copper in the hills of Durotar, if you look in the gullies and around the caves. For tin and silver, go out into the Barrens, and for iron, further still, into Stonetalon or Ashenvale." } },
      choices = {
        { text = "Any caves I should avoid?", next = "where_caves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_caves = {
      lines = { { id = "wc_default", text = "Skull Rock, east of here, because the Burning Blade's cultists hide in it and they don't like visitors. Mine the copper outside it and leave the cave to someone with a bigger axe." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    good = {
      lines = { { id = "g_default", text = "A strong back and a good ear. Ore sounds different from rock when the pick hits it, and once you hear the difference you'll never forget it." } },
      choices = {
        { text = "I'll learn to listen to the rock.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd rather just hit it harder.", next = "good_hard" },
      },
    },
    good_hard = {
      lines = { { id = "gh_default", text = "Then you'll break more picks than veins. Plenty of young orcs have tried that, and the rock wins every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "Every smith in the Valley, the engineer in his machine shop across the way, and the auction house, when the smiths have more than they need. Mine it, smelt it into bars, and someone will pay you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Cultists in the caves around Durotar. They frighten off the miners, and I'll never forgive them that." } },
    _none = { { id = "tp_none", text = "I know rock, and I know what's in it. For anything else, ask someone who works above ground." } },
  },
}

-- Saru Steelfury: the blacksmithing trainer at the forges of the Valley of Honor.
P:NPC {
  key = "saru", id = TODO_NPC("Saru Steelfury"), name = "Saru Steelfury", title = "Blacksmithing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "proud", "diligent" },
  notices = { "wounds", "profession" },
  impression = {
    first = "Saru Steelfury teaches blacksmithing at the forges of the Valley of Honor and talks over the hammer without ever missing a stroke. To Saru, a weapon is only honest if the smith would carry it into battle.",
    third = "{name} met Saru Steelfury, the blacksmithing trainer at the forges of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the sparks; they don't care who you are." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my forge. Did that blade hold, or have you come to tell me otherwise?" },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Look at the state of that armour! Somebody's been hitting you and you've been letting them. Get it mended before you go back out." },
    { id = "n_smith", cat = "profession", when = { profession = { name = "Blacksmithing", min = 150 } },
      text = "Burn scars on the forearms. You've stood at a forge for more than a season, then, and I'll speak to you as a smith." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My teacher thought so, and he never lit a forge without a word to the flame first. I'm less sure, but I still do it, because the one morning I forgot, my best blade cracked in the quench and I never found another reason why." } },
      choices = {
        { text = "The old rites at the forge are worth keeping.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Good steel needs skill, not rituals.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Saru Steelfury. I teach smithing at these forges, and everything the Grunts on the walls carry was hammered here. Do you want to learn, or have you only come to watch?" },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior at my forge! Good, because you'll understand why a blade's balance matters more than its shine. Learn to make your own, and you'll never have to trust a trader's." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at my forge! Good, because you'll want a weapon that can take a jolt of lightning, and most of what the traders sell will crack the first time you try." },
      },
      again = { { id = "h_again", text = "What else? Speak up over the hammer." } },
      choices = {
        { text = "Do the fire spirits help you at the forge?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me blacksmithing.", next = "BUSINESS" },
        { text = "What makes a good weapon?", next = "weapon" },
        { text = "How did orcs learn to smith?", next = "history" },
        { text = "What do you think of dwarven steel?", next = "dwarves" },
        { text = "Farewell, smith.", next = "END" },
      },
    },
    weapon = {
      lines = { { id = "w_default", text = "One the smith would carry himself. A blade made only to sell will break on the first good shield, and someone will die because a smith was lazy, so I don't make those, and I won't teach you to make them either." } },
      choices = {
        { text = "A smith's honour is in the steel.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some customers only want something cheap.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where do the cheap blades come from, then?", next = "weapon_cheap" },
      },
    },
    weapon_cheap = {
      lines = { { id = "wc_default", text = "From the goblin traders in the Drag, who'll sell anything to anyone. I'd rather lose a sale to them than see my mark on a broken blade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history = {
      lines = { { id = "h2_default", text = "We had forges on the old world long before we came here, and our axes were famous long before the humans learned to fear them. The camps took the craft from a whole generation, and we've spent the years since teaching it again." } },
      choices = {
        { text = "Who taught you?", next = "history_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_teacher = {
      lines = { { id = "ht_default", text = "An old smith who'd forged for the Horde before the camps, and who'd kept it all in his head through ten years of captivity. He made me forge the same nail a hundred times before he let me touch a blade." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "It's good, I'll admit, because the dwarves have been at it a long time and they have better mountains. But they fight like they smith, slow and stubborn, and I'll take an orc's axe in a quick fight every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Unless it's made of metal, I'm no use to you. Ask at the inn." } },
  },
}

-- Nogg: the goblin engineer of the Valley of Honor, who has a machine shop and a sales pitch.
P:NPC {
  key = "nogg", id = TODO_NPC("Nogg"), name = "Nogg", title = "Engineering Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "eager" }, values = { "ambitious", "curious" },
  notices = { "profession" },
  impression = {
    first = "Nogg runs a goblin machine shop in the middle of an orc city and treats engineering as a sound business plan with occasional explosions. He's cheerful about the risks, which is either reassuring or the opposite.",
    third = "{name} met Nogg, the goblin engineer who runs a machine shop in Orgrimmar's Valley of Honor.",
  },

  greetings = {
    { id = "g_hi", text = "Customer! Or student! Either way, don't touch the red one." },
    { id = "g_back", when = { metBefore = true }, text = "Still got all your fingers? Excellent, that means you're doing it right!" },
  },

  notice = {
    { id = "n_eng", cat = "profession", when = { profession = { name = "Engineering", min = 100 } },
      text = "Oh, look at those singed eyebrows! You're an engineer, all right, and a dedicated one." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Tried it twice, and I've still got most of my eyebrows to prove it. The orcs tell me the storm has a spirit and it doesn't like being put in a jar, and after the second time I'm inclined to agree with them." } },
      choices = {
        { text = "Leave the storm alone. Some things shouldn't be bottled.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you ever manage it, I want to see it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nogg, engineer and proprietor! I teach engineering to anyone with the coin and the nerve, and the orcs here have plenty of nerve. Want to learn how to make things that go boom on purpose?" },
        { id = "h_goblin", when = { race = "Goblin" }, text = "A fellow goblin! You know how it is: these orcs think a wrench is a club, but they pay on time, so I'm not complaining." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "Ah, a colleague! How are your bombs holding up? Not too stable, I hope, because a stable bomb is a boring bomb." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You call lightning out of the sky for free, and I spend a fortune on copper wire to do half as much, so we should talk business sometime." },
      },
      again = { { id = "h_again", text = "Got another question? Ask quick; something's smoking in the back." } },
      choices = {
        { text = "Have you ever tried to bottle lightning, Nogg?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "Why does a goblin work in Orgrimmar?", next = "why" },
        { text = "Is engineering dangerous?", next = "danger" },
        { text = "What can an engineer make?", next = "make" },
        { text = "Farewell, Nogg.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else here does what I do, and that's the best kind of market there is! The orcs need explosives for mining and guns for the wall, and they don't haggle, they just grunt and pay." } },
      choices = {
        { text = "Do the orcs trust you?", next = "why_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_trust = {
      lines = { { id = "wt_default", text = "They trust me exactly as much as they trust any goblin, which is to say not at all, but they need me. In my experience that's a much better arrangement than trust." } },
      choices = {
        { text = "I'd rather be trusted.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Being needed is safer.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Dangerous? It's only dangerous if you do it wrong, and you'll do it wrong a few times first. Keep a bandage handy and don't light anything near your face." } },
      choices = {
        { text = "Have you ever blown yourself up?", next = "danger_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_self = {
      lines = { { id = "ds_default", text = "Only twice, and once was a misunderstanding about which fuse was which. The shop's been rebuilt since then and it's better than ever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    make = {
      lines = { { id = "m_default", text = "Bombs, guns, scopes, goggles, and devices that may or may not work as designed! Go far enough and you'll choose between goblin and gnome methods, and I don't need to tell you which one I'd pick." } },
      choices = {
        { text = "Goblin methods, obviously.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll see what the gnomes offer first.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_steam", text = "Good people, rich people, and they'd want me to say I don't work for them. I don't, at least not officially." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if you find out what it's worth, let me know!" } },
  },
}

-- Xon'cha: the stable master, a Darkspear who tends the hunters' beasts.
P:NPC {
  key = "xoncha", id = TODO_NPC("Xon'cha"), name = "Xon'cha", title = "Stable Master",
  bible = "bibles/townsfolk.md", role = "stablemaster", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "kind", "patient" },
  notices = { "pet" },
  impression = {
    first = "Xon'cha keeps the stables for Orgrimmar's hunters and talks to the animals more than to their owners. The troll is unhurried and easy, and every beast in the pens seems to know the voice.",
    third = "{name} met Xon'cha, the troll stable master of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Come, come. The beasts be calm today, so don't you be the one to change that." },
    { id = "g_back", when = { metBefore = true }, text = "Back for your beast, or leavin' it with me? Either be fine." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet} be lookin' well fed. Good. A hungry beast be a sulky beast, and a sulky beast be a bitey one." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than me, mon. A cat will stare all night at a corner of the stable where there be nothin' at all, and the old witch doctors say that be a spirit passin' through, so I leave a little water in that corner and the cat sleep fine." } },
      choices = {
        { text = "Small kindnesses to the spirits keep everything in balance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast spooked by nothing needs firmer handling.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Xon'cha, and I keep the stables. You leave your beast with me and it be fed, brushed and talked to every day until you come back for it. Most hunters forget the talkin', but I don't." },
        { id = "h_troll", when = { race = "Troll" }, text = "Ah, a Darkspear! You come up from Sen'jin, or from further? Leave your beast here and I treat it like family." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, mon! The beasts in my pens feel you comin' before they see you, so walk slow and let them get a good look at you." },
      },
      again = { { id = "h_again", text = "Somethin' else? The beasts don't mind waitin', but I do." } },
      choices = {
        { text = "Do the beasts feel the spirits, Xon'cha?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I need the stables.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Do you speak to the beasts?", next = "speak" },
        { text = "What's the strangest beast you've kept?", next = "strange" },
        { text = "How did a troll end up in Orgrimmar?", next = "troll" },
        { text = "Farewell, Xon'cha.", next = "END" },
      },
    },
    speak = {
      lines = { { id = "s_default", text = "Every day, and they speak back, in their way. A cat tells you with its tail, a bear tells you with its ears, and a wolf tells you everything with its whole body if you be watchin'." } },
      choices = {
        { text = "Beasts know more than we think.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast only knows what it's trained to.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A crab from the coast near Sen'jin, big as a shield, that a young hunter loved like a child. It snapped at every other beast and pinched me twice, but it let him scratch its shell, and I learned somethin' from that." } },
      choices = {
        { text = "What did you learn?", next = "strange_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_learn = {
      lines = { { id = "sl_default", text = "That a beast doesn't choose you for bein' strong or clever. It chooses you for comin' back, again and again, and that be the only trick there is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "t_default", text = "When Thrall saved the Darkspear and brought us to Durotar, Vol'jin say we go wherever the Horde go. Some of us stayed at Sen'jin and some of us came to the city, and the city needed someone who knew beasts." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
  },

  topics = {
    echo_isles = { { id = "tp_isles", text = "Home, mon, and not home right now. We get it back one day." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask the beasts, maybe; they know more than they say." } },
  },
}
