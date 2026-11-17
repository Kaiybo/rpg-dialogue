-- The Barrens' working people with no quests of their own: the Crossroads' wind rider
-- master, supplier, herb seller and bowyer, Camp Taurajo's wind rider master, and Ratchet's
-- flight master, tailoring supplier and weaponsmith. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- The Crossroads
---------------------------------------------------------------------------

-- Devrak: the Crossroads' wind rider master.
P:NPC {
  key = "devrak", id = TODO_NPC("Devrak"), name = "Devrak", title = "Wind Rider Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "dutiful", "proud" },
  notices = { "travel", "class" },
  impression = {
    first = "Devrak keeps the wind riders at the Crossroads and talks about them more fondly than about most people. He knows every route over the Barrens and which ones the harpies like to watch.",
    third = "{name} met Devrak, the wind rider master of the Crossroads.",
  },
  greetings = {
    { id = "g_fly", text = "Need to fly? The wind riders are rested, and the sky over the Barrens is clear." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The beasts remember you, so they won't bite. Probably." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast is eyeing my wind riders like they're dinner. Keep it close, because they bite back." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They'll carry anyone who pays. Some of the older riders don't like the Light; they fought human knights in the Second War, and they remember. But the wind doesn't care what you pray to, and neither do the beasts." } },
      choices = {
        { text = "Then I'll ride and give them no reason to mind.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Their memories are no concern of mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The riders come down with arrows in them more often than I'd like, because the harpies over the Dry Hills aren't shy. I'd rather have a priest at the roost than a goblin's ointment, and so would my wind riders." } },
      choices = {
        { text = "I'll tend your riders whenever I pass through, Devrak.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm here to fly, not to nurse beasts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Devrak.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They'd like to, and I've caught more than one diving at a zhevra herd on the way to Ratchet. I feed them well enough that they shouldn't need to, but a wind rider is a hunter at heart, same as you, and the Barrens is a long way to fly past a meal." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} by your side near the roost. My wind riders know a hunter's beast from a meal, mostly, but I'd not test it." },
      },
      choices = {
        { text = "A hunter at heart deserves respect, beast or rider.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A beast that hunts without leave needs a firmer hand.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everywhere the wind riders fly, from what I hear. The Kolkar raid the roads, the quilboar raid the caravans and the humans at Northwatch Hold raid whoever they please, so a warrior with wings can be where he's needed by sundown." } },
      choices = {
        { text = "Then fly me where the Horde needs me most.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fly me where the bounties are richest, Devrak.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every afternoon, when the wind turns hot off the plains. The riders open their wings into it and hang there without a single beat, and I don't need a shaman to tell me something out there is holding them up." } },
      choices = {
        { text = "The air spirits deserve thanks for every safe flight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The riders fly on their own wings. Leave the spirits out of it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Somebody tried it last spring, and the wind rider took two of his fingers before he got anywhere near a saddle. The beasts know their riders by smell, so if you want to sneak past them, you'd best smell like an honest orc." },
      },
      choices = {
        { text = "Then I'll fly honestly, with your blessing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd find a way past them, if it came to it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What are the wind riders like?", next = "riders" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because teleporting only takes you to the big cities, and my wind riders go wherever the Horde has a roost. Besides, I've never seen a mage enjoy the view over the Barrens on the way, and that's half the reason to fly." },
      },
      choices = {
        { text = "Fair point. A wind rider's flight it is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Views are for tourists. I'll take the shortcut.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is it safe flying over the Barrens?", next = "safe" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They won't, not since the druids went down into that place, because the air above it smells wrong to them and they veer off every time. I route every flight around it now, and not one wind rider has ever told me I was wrong to." } },
      choices = {
        { text = "Trust the beasts. Keep every flight well clear of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Avoiding the place won't heal it. Someone should go and look.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They fear anything that smells of the Twisting Nether, and they're right to, because a frightened wind rider throws its rider over the Barrens. Send your demon away before you climb up, and they'll carry you anywhere, from Ratchet to Orgrimmar." },
      },
      choices = {
        { text = "I'll dismiss it before I fly. They've earned that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll learn to carry whatever I bring.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin wants a wind rider. The beasts will carry you; I can't say the harpies will be as polite." },
        { id = "h_default", key = true, text = "I'm Devrak, and I keep the wind riders of the Crossroads. They'll take you to Orgrimmar, Thunder Bluff, Ratchet and anywhere else the Horde has a roost, faster than any kodo." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders settle down when one of you is nearby, so come up the tower any time, because you'll make my job easier." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. The wind riders know your scent changes when you do, so tell me now if you're coming up the tower as a cat, because I'd like to warn them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders don't care how hard you hit, so hold on tight and keep your axe strapped down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast will want its feet back on the ground the moment you land, but the wind riders don't mind sharing the sky with it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Wind riders don't care what you pray to, but if you're one of the Forsaken, give them a moment to get used to you before you climb on." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wind riders smell your demon before they see you, so wait at the foot of the tower while I calm them down." },
      },
      choices = {
        { text = "Do you ever feel the air spirits on the roost?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the wind riders fly over the Wailing Caverns, Devrak?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Tell me about the wind riders.", next = "riders" },
        { text = "Is it safe to fly over the Barrens?", next = "safe" },
        { text = "Does anyone ever slip onto your roost uninvited?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why fly at all, when a mage can teleport?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the wind riders hunt for themselves, Devrak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Where are warriors needed most, Devrak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your riders ever need a priest, Devrak?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the wind riders fear my demon, Devrak?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will your wind riders carry a paladin, Devrak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? The beasts are restless, and so am I." } },
    },
    riders = {
      lines = { { id = "r_default", text = "Proud beasts with a lion's body and a bat's wings, and they bite if you don't respect them. The Horde has ridden them since we came to Kalimdor, because nothing else crosses all this empty land as fast." } },
      choices = { { text = "How do you train them?", next = "riders_train" } },
    },
    riders_train = {
      lines = { { id = "rt_default", text = "With patience and a lot of meat, and by never letting them see you scared. A wind rider follows a rider it trusts, and it will throw anyone it doesn't straight into the grass." } },
      choices = {
        { text = "Respect is better than fear with beasts.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Beasts should know who is master.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than walking, because the centaur and the quilboar can't reach you up there. The harpies of the Dreadmist Peak are another matter, but my riders know how to fly high over them." } },
      choices = { { text = "Good to know. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the skies, not that. Ask Thork, he knows the ground." } },
  },
}

-- Barg: general supplies at the Crossroads.
P:NPC {
  key = "barg", id = TODO_NPC("Barg"), name = "Barg", title = "General Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "practical" },
  notices = { "purse", "hunger" },
  impression = {
    first = "Barg sells general supplies at the Crossroads and seems to think everyone who walks into the Barrens without enough water is a fool. He is probably right.",
    third = "{name} bought supplies from Barg, who keeps the general goods at the Crossroads.",
  },
  greetings = {
    { id = "g_shop", text = "Water, food and bags, and you'll want all three out here. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, so you didn't buy enough water last time. Nobody ever does." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "That purse of yours is empty. The quilboar sometimes carry coin, if you're not too squeamish to look." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Bandages, oil for that armour, and a good reason to be here. The orcs who came out of the camps remember the Silver Hand's paladins, so you'll want friends at the Crossroads. Buy from me, and I'll be one." } },
      choices = {
        { text = "I'll buy honestly, Barg, and be glad of a friend.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll buy what I need. Friends aren't my concern.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Half of them, some days, with the sun in their heads and a Kolkar arrow in their leg. I sell bandages, but a priest standing by my stall would sell nothing and do twice the good, so stay as long as you like." } },
      choices = {
        { text = "Then I'll stay a while and see who comes in hurt.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who walk out without water deserve their lesson.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Barg.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Twice the water you think, and bandages enough for three bad days, because that's how long it takes to walk to the next well. The centaur fight hard and the sun fights harder, so don't leave the Crossroads short of either." } },
      choices = {
        { text = "I'll carry enough for the grunts beside me too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll carry for myself. The others can manage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "For the beast, aye, because a thirsty companion is a slow one, and a slow one gets you killed. The oases are fouled more often than not these days, so carry clean water from here and share it with whatever walks at your side." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks parched already. Give it water first, before anything else, and it'll carry you through the Barrens." },
      },
      choices = {
        { text = "My beast drinks before I do.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My beast can find its own water.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some can, if you believe the tauren, and I've seen one kneel by a dry wash and dig until his hands came up wet. But I've also sold water to three shamans this week, so I'll keep stocking it." } },
      choices = {
        { text = "Water should be shared freely in a land this dry.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Water this scarce is worth whatever you can charge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It is, and faster every season, so I sell more waterskins every month. The Lushwater Oasis used to reach the rocks on its western side, and now you can walk all the way round it before your skin's half full." } },
      choices = {
        { text = "Ration the water and guard it. That's the only way through.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Water belongs to all. Nobody should be guarding an oasis.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Water, same as everyone, because nobody sneaks far across the Barrens with a dry throat. I've had rogues come in boasting about the Kolkar camps they crept through, and every one of them came back with cracked lips and bought two skins." },
      },
      choices = {
        { text = "I'll pay for my water like anyone else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Easier to take water from the Kolkar's wells.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because conjured water keeps you alive and nothing else does, and the Barrens takes more than water out of you. You'll want bread, thread and a pack that won't split, and you'll want to share that water with the grunts on the road, because they can't make their own." },
      },
      choices = {
        { text = "I'll share my water with anyone who needs it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My water's for me. The grunts can buy their own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I don't know and I don't want to know, but I know you do, because demons don't carry packs. Buy your own water and bread, and keep that thing out of my sacks, because the last imp in here got into the flour and I'm still finding sooty handprints." },
      },
      choices = {
        { text = "I'll keep my imp out of your sacks.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp goes where it likes, Barg.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. You probably don't need water, but you'd be the first traveller in the Barrens who didn't run out of something." },
        { id = "h_default", key = true, text = "I'm Barg, and I sell supplies at the Crossroads. Every traveler in the Barrens comes through here sooner or later, and most of them have run out of water by the time they arrive." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and I'll bet you came in with an empty waterskin like everyone else, because asking the water spirits nicely won't fill it in the Barrens." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and I'll bet you think the land will give you water out here. It won't, because the oases are shrinking and the Kolkar sit on what's left." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and I'll bet your waterskin's empty and your bandages are gone. They always are." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast drinks as much as you do, I'd wager, and you never plan for it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll want water, same as everyone, because praying doesn't keep a body from drying out in the Barrens, does it?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'll want to fill your pockets with things that aren't yours, so fill a waterskin first, at least." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You can conjure your own water, can't you? Then you're the only customer I can't sell it to, and I don't like that one bit." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon doesn't drink, I hope, because I'm not selling it water." },
      },
      choices = {
        { text = "Can a shaman really find water out here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the water really running out, Barg?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What should a warrior carry in the Barrens, Barg?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Does a hunter need extra supplies out here, Barg?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What should I carry in the Barrens?", next = "carry" },
        { text = "Who comes through the Crossroads?", next = "who" },
        { text = "How many travelers come in needing more than water, Barg?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does a rogue need from you, Barg?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why would a mage need your supplies, Barg?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does a warlock's demon need supplies, Barg?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the dead need in the Barrens, Barg?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? I have more customers waiting." } },
    },
    carry = {
      lines = { { id = "c_default", text = "Water, and then more water, because the oases are few and some of them are fouled now. After that, food that doesn't spoil in the sun, and a bag big enough to carry everything you take from the centaur." } },
      choices = { { text = "Fouled? How?", next = "carry_fouled" } },
    },
    carry_fouled = {
      lines = { { id = "cf_default", text = "Something wrong in the Wailing Caverns is poisoning the water, or that's what Tonga Runetotem says. I don't know the reason, but I know I'm selling a lot more water than I used to." } },
      choices = {
        { text = "Someone should find out what's wrong.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good for your business, at least.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Orcs from Orgrimmar, tauren from Thunder Bluff, trolls, Forsaken, goblins from Ratchet, and once in a while a lost human from Northwatch Hold. If they're not trying to kill us, I'll sell them water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell water, not answers, so go and ask Thork." } },
  },
}

-- Hula'mahi: reagents and herbs at the Crossroads.
P:NPC {
  key = "hulamahi", id = TODO_NPC("Hula'mahi"), name = "Hula'mahi", title = "Reagents and Herbs",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "cheerful" }, values = { "curious", "shrewd" },
  notices = { "craft", "class" },
  impression = {
    first = "Hula'mahi sells reagents and herbs at the Crossroads with a troll's grin and a merchant's sharp eye. She knows which spellcaster needs which powder before they ask.",
    third = "{name} met Hula'mahi, the troll who sells reagents and herbs at the Crossroads.",
  },
  greetings = {
    { id = "g_shop", text = "Herbs and reagents, mon, for every spell and every sickness. What you be needing?" },
    { id = "g_apprentice", when = { origin = "troll_witch_doctor_apprentice" }, text = "Ah, you got a witch doctor's hands, mon, all stained and careful. You grind roots for one of the old ones at Sen'jin, I bet, so you know already that nothing on my shelf be safe to boil if you don't know what it want first." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of mageroyal and briarthorn, mon. If you be picking in the Barrens, watch for the snakes around the oases." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, good. You be needing ankhs soon enough, mon, because the spirits only bring you back when you bring the right gift." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trust? We watch the dead careful, mon, and we watch the Light careful, and you be both. But your coin be the same as anyone's, and the symbols of kings you need be on my shelf." } },
      choices = {
        { text = "I'll trade fair and earn your trust.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll trade. Your trust I don't need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every morning, mon, a little word to the loa so the spirits be watching my stall and not my debts. The Darkspear priests speak to the loa properly, with shadow and offerings and all, but a merchant only need the loa to look kindly on her prices." } },
      choices = {
        { text = "The loa deserve proper rites, not a merchant's bargain.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A bargain with the spirits is still a prayer, I suppose.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Hula'mahi.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The smart ones do, mon, because they walk past peacebloom and earthroot every day and never think to bend down. Bring me what you find around the oases, and the mages and the shaman of the Crossroads be grateful, even if they never know your name." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keep sniffin' at my jars, mon. Some of them herbs make a beast sleepy, so keep it close." },
      },
      choices = {
        { text = "I'll gather for the healers of the Crossroads.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll gather what sells, troll, and nothing more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not for themselves, mon, but the smart ones buy a few for their healer friends. A priest with no candles or a shaman with no ankh be no help when you lyin' in the dirt, so think of it as an investment in your own skin." } },
      choices = {
        { text = "I'll look after the healers who look after me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Healers can buy their own reagents, troll.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Everybody want to leave the Barrens, mon, and I don't blame them in the dry season. I keep the runes behind the counter, because the last mage who bought a stack teleported to Orgrimmar three times in one day just to eat at the Broken Tusk." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A Darkspear mage, look at you, mon! The runes be behind the counter, and don't you go teleporting to Orgrimmar three times a day like the last one who bought a stack." },
      },
      choices = {
        { text = "Smart mage. Walking is for people without runes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Wasteful. Runes should be saved for real need.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Where do your herbs come from?", next = "herbs" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, mon, and I wouldn't if I could, because the loa don't like trade with things from outside the world. I'll sell you herbs and powder for the spells you cast, and the soul shards you carry be your own business, but don't you go asking me where to find more." },
      },
      choices = {
        { text = "Fair. The loa deserve respect, even from me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The loa can mind their own business, then.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What brings a troll to the Crossroads?", next = "troll" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some from the tauren herbalists, and some from goblin traders who don't say where they found them, mon. I pay the tauren more because their seeds be grown right, but a seed be a seed once it's on my shelf." } },
      choices = {
        { text = "Buy only the honest seeds. The goblin ones may be stolen.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A seed is a seed. Where it came from hardly matters.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Flash powder, mon, for when you need to vanish, and the herbs that make your blades sting, though you get your poisons from the trainers. I ask no questions about who it be for, but if it be a tauren, I don't want to hear it." },
      },
      choices = {
        { text = "My blades are for the Horde's enemies, nobody else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Who it's for is between me and my blade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wieldin' the Light, mon. Even paladins need reagents, and I know which ones you be needin' before you ask." },
        { id = "h_default", key = true, text = "I be Hula'mahi, and I sell reagents and herbs at the Crossroads. Mages, priests, shaman, they all come to me sooner or later, because spells need more than words, mon." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon? You don't buy reagents, but you get healed by those who do, so you be welcome all the same." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon. You don't buy many reagents, but you pass more herbs out on the plains than any of my customers." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon! You be wanting sacred candles, and Hula'mahi got them, though don't be telling the Forsaken I sell the same candles to the trolls." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, mon! You be one of my best customers, because your kind need wild thornroot and maple seeds for the bigger spells, and Hula'mahi keep them fresh." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, mon. You be wanting powders for your tricks, and Hula'mahi know just which ones." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where do your herbs come from?", next = "herbs" },
        { text = "What brings a troll to the Crossroads?", next = "troll" },
        { text = "Where do you get your seeds and thornroot, Hula'mahi?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need runes of teleportation, Hula'mahi.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do hunters bring you herbs, Hula'mahi?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do warriors ever buy reagents, Hula'mahi?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you sell anything that feeds a demon, Hula'mahi?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you pray to the loa yourself, Hula'mahi?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you sell what a rogue needs, Hula'mahi?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do trolls trust the Light, Hula'mahi?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "What else you want to know, mon? Ask while the shop be quiet." } },
    },
    herbs = {
      lines = { { id = "h2_default", text = "From all over the Barrens, mon, mostly around the oases and the hills. Some come up the road from Ratchet on goblin carts, and those cost more, because goblins be goblins." } },
      choices = { { text = "What about the poisoned oases?", next = "herbs_oasis" } },
    },
    herbs_oasis = {
      lines = { { id = "ho_default", text = "Bad business, mon, because the herbs that grow near bad water be bad themselves. I check every leaf now, and I throw out the ones that smell wrong, even when it cost me." } },
      choices = {
        { text = "That's honest of you.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Most merchants would sell them anyway.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "t_default", text = "Trade, mon, because the Crossroads be the middle of everything, and everybody pass through here. Sen'jin be a fine place for fishing, but not for selling." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Hula'mahi not know that, mon. Ask Sergra; she know everything about this place." } },
  },
}

-- Uthrok: the Crossroads' bowyer and gunsmith.
P:NPC {
  key = "uthrok", id = TODO_NPC("Uthrok"), name = "Uthrok", title = "Bowyer & Gunsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "blunt" }, values = { "practical", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Uthrok sells bows and guns at the Crossroads and has strong opinions about which one is better. He talks about the Barrens as a place made for anyone who can shoot from a distance.",
    third = "{name} met Uthrok, the bowyer and gunsmith of the Crossroads.",
  },
  greetings = {
    { id = "g_shop", text = "Bows, guns, arrows and shot. If it kills from a distance, I sell it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, good. You'll want more arrows than you think out here, because the Barrens are wide and the beasts are fast." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because the humans' paladins always charged in close, and my people killed plenty of them from a distance in the Second War. You're Horde now, so learn from us, and don't charge across open ground at anything you could shoot instead." } },
      choices = {
        { text = "I'll charge in close. That's the paladin's way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair point. Better to kill from range.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A good gun, every time, because a gun stops the centaur before anyone needs healing. I'll admit a priest dragged me out of the Stagnant Oasis when a crocolisk got my leg, though, so I keep a little room in my heart for your kind." } },
      choices = {
        { text = "Healing is the better gift. Anyone can pull a trigger.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Can't argue. Dead centaur need no priest at all.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Uthrok.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should carry something that reaches further than his arm, because the Kolkar throw spears and the harpies stay up in the air. A gun or a bow won't win you the fight, but it'll start one on your terms, and that's half the battle in the Barrens." } },
      choices = {
        { text = "I'll carry a gun, and use it wisely.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Guns are for cowards. I'll charge them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Range, mostly, because out here you'll see your target long before it sees you. A bow strung with zhevra gut holds well in the heat, and a gun needs keeping clean of the dust, so whatever you carry, clean it every night." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it could use some exercise. Take it out to the plains and let it run, and your aim will thank you." },
      },
      choices = {
        { text = "I'll keep my weapon clean every night.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll clean it when it jams. That's soon enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A bullet, every time, because I can count on it. Lightning hits harder when it lands, I'll give you that, but I've watched a shaman's bolt crackle off a Kolkar stormer like rain off a roof, and the Kolkar didn't wait for a second try." } },
      choices = {
        { text = "I'll trust the spirits over a goblin's gunpowder.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trust whatever kills fastest. Nothing else matters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some do, and the zhevra herds are thinner than they were when I first came to the Crossroads. I sell them the bows, and what they do after that is their own business, though I'd rather they left something for next year." } },
      choices = {
        { text = "The Crossroads should set limits on the hunting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A trader's job is trade. The hunters can answer for themselves.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Every rogue should, because you can pull a Kolkar scout off his feet from the grass and never step into the open. A gun's louder, and loud is the opposite of what you want, so for once I'll tell you to buy the bow." },
      },
      choices = {
        { text = "I'll fight close and look them in the eye.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A shot from cover is still a kill.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not often, because you carry wands, which are sticks with a bit of spark in them if you ask me, though I'll admit they do the job when your mana's spent. The raptors close fast out here, so keep frost between you and them, and stay near the grunts on the road." },
      },
      choices = {
        { text = "I'll fight beside the grunts, not off on my own.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fight alone, and I like it that way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Not many, because a wand does most of what you want and the demon does the rest. The ones who come back are the ones whose demon got sent home in the middle of a fight, and they always want something that shoots, fast." },
      },
      choices = {
        { text = "I'll face my enemies myself, demon or no demon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the demon take the blows. That's what it's for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. You'll want to get close to your enemies, I suppose, which in the Barrens is foolish. Want to buy a bow?" },
        { id = "h_default", key = true, text = "I'm Uthrok, and I sell bows and guns at the Crossroads. Out in the Barrens you can see an enemy coming from a long way off, so you might as well shoot them before they get close." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You throw lightning, so you'll tell me it's better than a bow, but a bow doesn't need the sky's permission to fire." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll tell me claws are better than a bow, and I'll tell you a bow kills a lion before it ever gets close enough to scratch you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll be wanting a gun for when the centaur keep their distance, because they're not foolish enough to stand still for an axe." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know a good bow when you see one, so I won't waste your time with the cheap ones." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Can't shoot worth a thing, I'd wager, but you can keep a hunter alive long enough to learn how, so you're welcome at my counter." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You throw knives, I bet, but a good bow reaches further, and you'll want one when the knives run out." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You throw fire, so you'll tell me you don't need a bow, but your fire runs out and my arrows don't." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You've a demon to stand in front of you, so I suppose you don't need a gun, but you'd be surprised how many warlocks buy one anyway." },
      },
      choices = {
        { text = "Which hits harder, lightning or a bullet, Uthrok?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your hunters ever take more game than the plains can spare?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Should a warrior carry a gun, Uthrok?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes a good bow in the Barrens, Uthrok?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Bow or gun, which is better?", next = "which" },
        { text = "Where do the guns come from?", next = "guns" },
        { text = "Would you rather have a priest or a good gun, Uthrok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should a rogue carry a bow, Uthrok?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages ever buy from you, Uthrok?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warlocks buy weapons from you, Uthrok?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why should a paladin use a bow, Uthrok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? I've got arrows to fletch." } },
    },
    which = {
      lines = {
        { id = "w_default", text = "A bow is quiet and never jams, and you can make arrows from anything. A gun is loud and hits hard, and the noise scares off half the beasts before you even hit them." },
        { id = "w_tauren", when = { race = "Tauren" }, text = "Your people like guns, I've noticed, and a tauren with a big rifle is a frightening sight. But a bow is quiet and never jams, so think about it." },
      },
      choices = {
        { text = "I prefer the bow.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll take the gun.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns = {
      lines = { { id = "g_default", text = "Goblins in Ratchet make most of them, and they sell to anyone who pays. The dwarves make better ones, I'll admit, but I'm not walking into Bael Modan to buy one." } },
      choices = { { text = "What's at Bael Modan?", next = "guns_bael" } },
    },
    guns_bael = {
      lines = { { id = "gb_default", text = "Dwarves digging in the south of the Barrens, past Camp Taurajo, with guns and steam machines. The tauren there hate them, and I don't blame them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I couldn't tell you, so ask Thork or Sergra; they run this place." } },
  },
}

---------------------------------------------------------------------------
-- Camp Taurajo
---------------------------------------------------------------------------

-- Omusa Thunderhorn: Camp Taurajo's wind rider master.
P:NPC {
  key = "omusa", id = TODO_NPC("Omusa Thunderhorn"), name = "Omusa Thunderhorn", title = "Wind Rider Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "taurajo" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "travel", "weary" },
  impression = {
    first = "Omusa Thunderhorn keeps the wind riders at Camp Taurajo and calls them by name, one by one. He is calm and slow to speak, and he worries about the dwarves and quilboar to the south.",
    third = "{name} met Omusa Thunderhorn, the wind rider master of Camp Taurajo.",
  },
  greetings = {
    { id = "g_fly", text = "The wind riders are ready, friend. Where would you go?" },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look tired and torn, friend. Let a wind rider carry you for a while, and rest your legs." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "No, but we do not know it. The Earth Mother gave us what we needed long before we met the orcs and their memories of the Silver Hand. I am curious what the Light asks of you, since nothing in this world gives without asking." } },
      choices = {
        { text = "It asks me to protect the living. I do.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It asks nothing. I take what I need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The dwarves dig at Bael Modan to the south, and the quilboar of the Razorfen grow bolder every season, so the camp's healers are seldom idle. If you stay, the Earth Mother will not mind whom you pray to, and neither will I." } },
      choices = {
        { text = "I'll stay a while and help your healers, Omusa.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Taurajo has its own healers. I've roads to fly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Omusa.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Digging, and blasting, and pulling things from the earth that should have stayed buried. The elders at Thunder Bluff want to know what they've found, and the dwarves want no one to see it, so any warrior who goes there will be met with more than words." } },
      choices = {
        { text = "I'll go there and drive them out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them dig. It's not my business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the quilboar and the dwarves have driven off the zhevra, and the lions must eat something. A hunter who thins them carefully keeps the camp safe, but a hunter who takes too many leaves the plains to the quilboar, and that is worse." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would be a fine sight from the air. My wind riders always notice the beasts that walk beside a hunter." },
      },
      choices = {
        { text = "I'll thin them carefully and leave the rest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Lions are a threat. I'll clear the plains of them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Old earth, older than the tauren, and the herders say the ground there groans at night. The dwarves dig for treasure and the quilboar dig for their god, and between them the land south of Taurajo has no peace." } },
      choices = {
        { text = "The land deserves defending from both of them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the dwarves and quilboar weaken each other first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That would be a kindness, because the dwarves dig deeper every season and they post guards who watch the sky for my riders. Count their guns and see what they carry out of the ground, and the elders at Thunder Bluff will hear of it on the next wind rider north." },
      },
      choices = {
        { text = "They'll never know I was there. That's the point.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll watch, but if it comes to blows, I'll fight openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What troubles Camp Taurajo most?", next = "trouble" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, and so do I, though I'm better at hiding it. My riders have never smelled anything like it and they will not carry it, so it must stay behind while you fly, as the Warchief's own warlocks do." },
      },
      choices = {
        { text = "It can stay behind. Your riders deserve calm skies.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your beasts should learn to bear it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Do your wind riders have names?", next = "names" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Old things, buried under the earth long before any tauren walked these plains, and they dig as though the ground owed them every one. My riders fly wide around the place now, because the noise and the smoke frighten them." } },
      choices = {
        { text = "Ask them to leave first. If they refuse, then we fight.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strike their camp at night and be done with it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They'll carry anyone the Horde trusts, and they don't care whether you carry a spear or a spellbook. What troubles them is the south, where the dwarves have dug in at Bael Modan and the quilboar are stirring, so they come back tense from every flight that way." },
      },
      choices = {
        { text = "The dwarves are digging, not fighting. Leave them be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dwarves should be driven out of Bael Modan.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The wind riders will take you north, and I'll tell them your name, since they like to know who they carry." },
        { id = "h_default", key = true, text = "I am Omusa Thunderhorn, and I keep the wind riders of Camp Taurajo. From here they fly north to the Crossroads and further, and they carry the camp's news to Thunder Bluff." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders have been uneasy since the dwarves came south with their digging, and perhaps you can feel what they feel." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, at Taurajo's roost. My wind riders have been uneasy since the dwarves started digging at Bael Modan, and I think you'll feel that same unease if you go near it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The dwarves at Bael Modan carry guns, and a warrior is the first thing they'll shoot at, so I hope you're as tough as you look." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. My wind riders see a great deal from the sky, and they tell me the lions of the southern Barrens are hungrier than usual." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. My wind riders are calm around you, which is more than I can say for most strangers who come to Taurajo." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at Taurajo. The wind riders don't mind your magic, though they snort at the smell of the burning." },
      },
      choices = {
        { text = "What are the dwarves disturbing at Bael Modan?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are the dwarves digging for at Bael Modan, Omusa?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What troubles Camp Taurajo?", next = "trouble" },
        { text = "Do your wind riders have names?", next = "names" },
        { text = "I could watch the dwarves at Bael Modan without being seen.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What are the dwarves doing at Bael Modan, Omusa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why are the southern lions hungry, Omusa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do your wind riders shy from my demon?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does Taurajo need a priest's help, Omusa?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will the wind riders carry a mage, Omusa?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the tauren fear the Light, Omusa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything more, friend? The wind is patient today." } },
    },
    trouble = {
      lines = { { id = "t_default", text = "The quilboar of Razorfen Kraul to the south, and the dwarves who dig at Bael Modan to the southeast. The braves keep both away from the camp, but there are fewer braves every season." } },
      choices = { { text = "What do the dwarves want there?", next = "trouble_dwarves" } },
    },
    trouble_dwarves = {
      lines = { { id = "td_default", text = "They dig for old things, buried things, and they don't ask the earth's permission. Every shaman in the camp says the land is angry there, and I believe them." } },
      choices = {
        { text = "They must be driven off.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Perhaps they can be reasoned with.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "n_default", text = "Of course they do, but they're private names, between the beast and me. A wind rider who trusts you will carry you through a storm, and that trust starts with knowing its name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The sky I know, friend, but not that, so put your question to the camp's elders by the fire." } },
  },
}

---------------------------------------------------------------------------
-- Ratchet
---------------------------------------------------------------------------

-- Bragok: Ratchet's flight master.
P:NPC {
  key = "bragok", id = TODO_NPC("Bragok"), name = "Bragok", title = "Flight Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  temper = { "gruff" }, values = { "practical" },
  notices = { "travel" },
  impression = {
    first = "Bragok runs the flight point in Ratchet and has no patience for the goblins' prices on everything else. He is gruff, and plainly happier with his beasts than with the town.",
    third = "{name} met Bragok, the flight master of Ratchet.",
  },
  greetings = {
    { id = "g_fly", text = "Flying? Then hurry, because the beasts don't like the salt air." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do. I saw the Silver Hand's glow in the camps, the same as every orc my age, and I don't love it. But fair is fair: you pay, you fly, and the beasts don't care what you pray to." } },
      choices = {
        { text = "Fair is fair. I'll pay and fly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your memories are your burden, not mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A temple in Ratchet? The goblins would sell the pews and rent out the altar by the hour. No, a priest does more good up here with my wind riders, where nobody's counting coins." } },
      choices = {
        { text = "Faith shouldn't have a price. Ratchet could learn that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Goblins pay well. A temple there would turn a profit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Bragok.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisks in the shallows, raptors up in the hills and the odd shark the fishermen drag in, though you'll have to fight the goblins for that one. The goblins pay well for crocolisk hides, so a hunter who comes through my roost rarely leaves empty-handed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it wants to go after the gulls on the docks. Let it, if you like; the goblins hate those gulls more than anything." },
      },
      choices = {
        { text = "I'll hunt only what keeps Ratchet's roads safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt whatever the goblins pay for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They'd say no, and then hire you anyway. The Southsea pirates come up the beach often enough, and the bruisers can't be everywhere, so a warrior who stops by Ratchet can always find a fight, and usually some coin with it." } },
      choices = {
        { text = "I'll fight for the town, Bragok, not just the coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The coin's the only reason I'd fight for goblins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask them yourself, but my beasts mind it, and they cough every morning the forges are lit. The sea spirits must be patient, or Ratchet would have washed away long ago." } },
      choices = {
        { text = "The goblins should answer for what they burn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the goblins burn what they like. Ratchet isn't ours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the Horde needs a roost by the sea, and the goblins want our coin more than they want us gone. I don't like their prices or their smoke, but I like the wind riders, and they like the sea air." } },
      choices = {
        { text = "The Horde's needs come first. Your duty is here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No roost is worth breathing goblin smoke. Move it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I trust my wind riders, and the goblins as far as their prices let me, which isn't far. The Southsea pirates on the coast steal from the goblins, and a rogue who watches them closely might learn where all that stolen cargo ends up." },
      },
      choices = {
        { text = "Thieves are thieves, whoever they rob. I'll stop them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather learn where it goes and take a share.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because a teleport takes you home and nowhere else, and my wind riders go wherever the Horde keeps a perch. You'll see the Barrens from above, too, and that view's cheaper than anything the goblins sell in this town." },
      },
      choices = {
        { text = "Then I'll fly the Horde's way, and mind the droppings.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My way is faster, and I've no time for scenery.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because they've got more sense than most orcs had back when the Horde drank what the Legion poured for it. Keep the thing dismissed while you fly, and I'll not ask what you do with it on the ground." },
      },
      choices = {
        { text = "I'll dismiss it. The beasts deserve that much.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demon stays. Your beasts can learn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. The goblins will charge you double for everything in Ratchet, Light or no Light. At least my flights are fair." },
        { id = "h_default", key = true, text = "I'm Bragok, and I keep the flight beasts here in Ratchet. The goblins run the town, but they let me keep my roost, because people who fly in spend money." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in a goblin town. You'll hate it here, because the goblins dig and burn whatever they like, and they've never asked a spirit's leave for anything." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, in a goblin town. You'll want to be gone quickly, I expect, because the goblins burn and dump whatever they like along this coast and never look sorry about it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Ratchet's goblins'll sell you anything, but they won't fight for you, so I'm glad to see somebody who will." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The crocolisks along the coast near Ratchet grow fat on the goblins' fish scraps, if you're after a fight." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because the goblins charge for everything here, and I'd bet they'd charge for praying too if they could work out how." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in Ratchet. You'll fit right in, since half the goblins here are thieves with ledgers." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could probably teleport home cheaper than my wind riders fly, though the goblins would find a way to charge you for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wind riders won't like your demon, so put it away before you come near my perch." },
      },
      choices = {
        { text = "Do the spirits mind the goblins' smoke and steam?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why do you keep your roost among the goblins, Bragok?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do the goblins of Ratchet need protecting, Bragok?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is there good hunting around Ratchet, Bragok?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you think of Ratchet?", next = "ratchet" },
        { text = "Where does the boat go?", next = "boat" },
        { text = "Do you ever wish Ratchet had a proper temple, Bragok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you trust anyone in Ratchet, Bragok?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why fly when I could teleport, Bragok?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do the wind riders hate demons, Bragok?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do orcs mind flying a paladin, Bragok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Ask it quick, because the beasts are getting restless." } },
    },
    ratchet = {
      lines = { { id = "r_default", text = "Too loud, too salty and too many goblins. They'll sell you your own boots if you stand still long enough, so keep walking." } },
      choices = { { text = "Why stay, then?", next = "ratchet_why" } },
    },
    ratchet_why = {
      lines = { { id = "rw_default", text = "Because the Barrens need a roost by the sea, and somebody has to keep it. The goblins pay on time, I'll give them that, which is more than some orcs do." } },
      choices = {
        { text = "Goblins keep their deals. That counts for something.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I wouldn't trust a goblin's deal.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat = {
      lines = { { id = "b_default", text = "South across the sea to Booty Bay in Stranglethorn, the goblins' other town. It's a long trip, but it beats flying over open water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know, so ask Gazlowe, because he knows everything that happens in Ratchet." } },
  },
}

-- Wenna Silkbeard: tailoring supplies in Ratchet.
P:NPC {
  key = "wenna", id = TODO_NPC("Wenna Silkbeard"), name = "Wenna Silkbeard", title = "Tailoring Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  temper = { "warm" }, values = { "practical", "craft" },
  notices = { "craft" },
  impression = {
    first = "Wenna Silkbeard sells thread and dye in Ratchet and talks about the colours the way other merchants talk about gold. She is warm and quick, and she knows where every bolt of cloth in the Barrens comes from.",
    third = "{name} met Wenna Silkbeard, who sells tailoring supplies in Ratchet.",
  },
  greetings = {
    { id = "g_shop", text = "Thread, dye and patterns, and all of it fresh from the boats. Come and look!" },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then come and see the dyes that came in on the Booty Bay boat, because they're the best I've had all season." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Oh, I've thought about this already. The old Silver Hand wore blue and white and gold, but on you, I'd use the Dark Lady's purple and keep a little gold at the trim, so nobody forgets the Light. Truthful colours, I think." } },
      choices = {
        { text = "Gold at the trim, then. The Light deserves its mark.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Just the purple. I'll leave the old colours behind.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The troll priests want reds and bone-white for their loa, and the Forsaken want black and violet and never smile while they choose. I sell to both and pray to neither, but I've found a good dye says as much about faith as any sermon." } },
      choices = {
        { text = "Faith lives in the heart, not in the colour of a robe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A priest should look the part. Show me your black.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Wenna.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than they'll ever admit, friend, because the padding under that mail is cloth, and cloth tears. A warrior with a good quilted shirt can take a centaur's arrow and live to complain about it, so learn a few stitches, or pay somebody like me." } },
      choices = {
        { text = "I'll learn to mend my own padding.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Mending is somebody else's work. I'll pay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "From the Southsea pirates and the Venture Company lads, if you're not squeamish about where it came from. The silk's what fetches the coin, mind, and the spiders in the hills spin a fine thread, if you can stand to collect it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep that {pet} of yours away from my thread, would you? The last beast in here tangled itself in a whole bolt of linen." },
      },
      choices = {
        { text = "I'll take the cloth fairly, from bandits only.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Cloth is cloth. I'll take it from anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ochre from the red cliffs near Ratchet and rust from the iron in the water, and the tauren trade me a blue from a root they won't name. They told me it was a gift from the Earth Mother and that I was to treat it kindly, so I do." } },
      choices = {
        { text = "A gift from the Earth Mother should be treated kindly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dye is a dye. Just tell me the price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More than you'd think, honey, because a mage's robe gets singed at the hem every week and somebody has to mend it. The silly ones always want purple, which I keep in stock just for them, and I never tell them it's the same dye the pirates use on their sashes." },
      },
      choices = {
        { text = "Purple is the only proper color for a mage.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Plain colors suit a working mage better.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Where do your dyes come from?", next = "dyes" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Warlocks want everything black and red with little spikes on the shoulders, honey, and they want it to look like it came out of a nightmare. I'll sell you the dye, but I won't sew the spikes, because the last one who asked tried to pay me in soul shards." },
      },
      choices = {
        { text = "Let them fear the look of me. It saves time.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'd rather not look like a nightmare, frankly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Why do you sell in Ratchet?", next = "ratchet" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bark and berries and a few things off the riverbanks, mostly, and the blue comes from a lichen that only grows in the damp corners of the Barrens, which aren't many anymore. I gather what I need and leave the rest, because there won't be any blue next year if I don't." } },
      choices = {
        { text = "That's the right way. Take only what the land can spare.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it's drying out anyway, gather all you can while it lasts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Black is for the ones who want to be seen being mysterious, and a clever rogue wears dusty brown, because the Barrens is brown and nobody looks twice at it. I learned that from a customer off a Booty Bay boat who wouldn't give his name, and he paid in gold, so I believed him." },
      },
      choices = {
        { text = "I'll take the brown. Nobody needs to know I'm there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I wear my colors openly. Let them see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, here in Ratchet! I've sold dye to many strange folk, but never to someone whose tabard needs to look holy and dead at once." },
        { id = "h_default", key = true, text = "I'm Wenna Silkbeard, and I sell tailoring supplies here in Ratchet. Thread, dye, patterns, everything a tailor needs except the cloth itself, and you'll have to cut that off somebody yourself." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll be wanting cloth for your robes, and your sort always choose the earthy colors, ochre and rust and dusk blue, which suits you, I must say." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You'll want thread that takes a natural dye, I expect, and I've some that soaks up crushed bark and berries beautifully, if you'd care to look." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, are you? Well, you'll be needing your padding mended, I'd say, by the look of those tears." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. You'll have bags full of hides and linen from the beasts and the bandits, I'd wager, and not enough of them sorted." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Your robes could use a fresh hem, love, and I've thread in every colour the Barrens has to offer, even shadow-black if that's your taste." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'll want dark cloth, I expect, black and charcoal and that deep grey that hides a stain, and I keep plenty." },
      },
      choices = {
        { text = "Where do your earthy dyes come from, Wenna?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where do your dyes come from, Wenna?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where do your dyes come from?", next = "dyes" },
        { text = "Why sell in Ratchet?", next = "ratchet" },
        { text = "Do mages buy much thread from you, Wenna?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do warriors need tailors, Wenna?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is there good cloth to be had in the Barrens, Wenna?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do warlocks dress any differently from other casters?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "What colours do the priests who visit you favour, Wenna?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What colors suit a rogue, Wenna?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What colours suit a Forsaken paladin, Wenna?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Is there anything else, love, or shall I get back to untangling this silk?" } },
    },
    dyes = {
      lines = { { id = "d_default", text = "From the boats, mostly, which bring them up from Booty Bay and the jungles of Stranglethorn. The goblins charge a fortune for shipping, but the colours are worth it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ratchet = {
      lines = { { id = "r_default", text = "Because everyone comes through Ratchet, Horde and Alliance alike, and the goblins don't care whose coin it is. It's the only place in the Barrens where I can sell to both sides without anyone getting killed." } },
      choices = {
        { text = "Neutral ground is a good thing.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Selling to the enemy isn't right.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I only know thread and dye, love. Ask Gazlowe." } },
  },
}

-- Ironzar: Ratchet's weaponsmith.
P:NPC {
  key = "ironzar", id = TODO_NPC("Ironzar"), name = "Ironzar", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  temper = { "smooth" }, values = { "greedy", "shrewd" },
  notices = { "purse", "kit" },
  impression = {
    first = "Ironzar sells weapons in Ratchet with a goblin's grin and a goblin's prices. Every blade has a story, to hear him tell it, and every story makes it more expensive.",
    third = "{name} met Ironzar, the goblin weaponsmith of Ratchet.",
  },
  greetings = {
    { id = "g_shop", text = "Weapons, friend, weapons! The finest in Ratchet and maybe the finest in the Barrens, so step on in and let's talk prices before somebody else buys your sword." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 100000 } },
      text = "Now that's a heavy purse, friend, and I can hear it jinglin' from here. Let me show you the good stock, the stuff I keep in the back for valued customers." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Belonged to a knight of the Silver Hand, back before the plague, or so the seller told me. Now it can belong to a dead knight with the Light, which is poetic, and poetry costs extra. Interested?" } },
      choices = {
        { text = "No. A dead knight's hammer belongs in his grave.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take it, but I'm not paying for the poetry.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Pal, out in the Barrens everybody needs a weapon, and a priest more than most, because the centaur aim for whoever's doing the healing. A good mace in your hand means you're still around to cast the next spell, and that's worth a few silver." } },
      choices = {
        { text = "My faith protects me better than any goblin steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair point. Show me what will crack a centaur's skull.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Ironzar.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That depends on how much you're spending, pal, but I've got a beauty out of Booty Bay that'll split a centaur's shield in one swing. Of course, I've also got cheaper ones that'll split it in two or three, and they all look about the same from where the centaur's standing." } },
      choices = {
        { text = "I'll pay for quality. My life depends on it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the cheap one and loot a better axe later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plenty, pal, though they always want the lightest weapons, so they can run. I've got a few short swords and axes that weigh next to nothing, which is perfect for when your pet's busy and something big is chewing on your boot." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours looks like a good customer, pal. Shame it can't hold a sword, because I'd sell it one in a heartbeat." },
      },
      choices = {
        { text = "I'll buy something sturdy and fight beside my beast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy the lightest blade. Running is a skill too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Does it? Sure, probably, but I'm not an engineer, pal. What I know is that shamans pay extra for anything that sounds like it'll help with the sparks, and I'm not in the business of arguing with paying customers." } },
      choices = {
        { text = "A merchant should sell honestly, Ironzar.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they believe it, it's their coin to waste.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Short, sharp and quiet is my favorite kind of customer, pal! I've got daggers from Booty Bay and a few from places I don't mention, and every one of them is balanced well enough to throw, though I'd rather you didn't test that in the shop." },
      },
      choices = {
        { text = "Daggers in the back end fights early. Good.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I want it for honest duels, not for backs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Where do your weapons come from?", next = "where" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Oh no? Then why does every mage who comes in here end up buying a staff, pal? A spell runs out when your mana does, and that's when you'll wish you'd invested in something heavy to hit the raptor with." },
      },
      choices = {
        { text = "Fair. A wise mage plans for empty mana.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spells won't run out. Keep your sticks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who buys weapons in Ratchet?", next = "who" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because claws don't come with a story, pal, and this staff here went through three Kolkar raids before it reached my rack. Whether every word of that is true is between me and the staff, but it's more of a story than any claw can tell." } },
      choices = {
        { text = "I'd rather hear the honest story, even if it's duller.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good story sells. I'd tell it too, true or not.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because demons get sent home at the worst moment, friend, and your spells take a breath to cast that a raptor won't give you. This dagger here came off a ship from Booty Bay, and every warlock who bought one before you is still alive and still a customer, as far as I know." },
      },
      choices = {
        { text = "Fair price, fair blade. I'll pay what it's worth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pay half, and you'll still turn a profit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Now I've got a hammer here with a story, pal, and the story just got more expensive, because you're going to love it." },
        { id = "h_default", key = true, text = "Ironzar's the name and weapons are my game, friend: swords, axes, maces, you name it, I've got it, and if I don't, I can get it for you for a price that'll only sting a little." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll want a mace with a good copper core, because copper carries the lightning, or so I tell every shaman, and by my last copper, they all buy it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, I know you can grow your own claws, pal, but trust me, a nice staff with a little iron on the end says more about a person than any old claw." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Now we're talkin', pal, because I've got axes so sharp they'll cut you just for looking at 'em, and I'll only charge you for the ones you buy." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! I've got arrows, bullets and a few knives for when the beast gets too close, pal, and a bundle price if you're buyin' all three." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Now, I know you lot like a staff, and I've got a few that'd make the Razormane think twice, for the right price, of course." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, a warlock doesn't need a blade, I know, chum, but a warlock with a good dagger is a warlock who doesn't panic when the imp dies, and that's what I call an investment." },
      },
      choices = {
        { text = "Does copper really carry lightning, Ironzar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why would a druid buy a staff instead of using claws, Ironzar?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where do your weapons come from?", next = "where" },
        { text = "Who buys weapons in Ratchet?", next = "who" },
        { text = "I want something short, sharp and quiet, Ironzar.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A mage doesn't need your weapons, Ironzar.", next = "xmage", when = { class = "MAGE" } },
        { text = "What's your best axe, Ironzar?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters buy much from you, Ironzar?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does a priest really need one of your weapons, Ironzar?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a warlock need your blades, Ironzar?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "What's the hammer's story, Ironzar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, friend? Time is money, you know, and right now it's your money." } },
    },
    where = {
      lines = { { id = "w_default", text = "Here and there, friend, from the forges in Booty Bay and Gadgetzan, and sometimes from the pirates who wash up on the Merchant Coast with somethin' to sell cheap. I don't ask questions, and you shouldn't either, because questions spoil a bargain." } },
      choices = { { text = "Pirates? Are they dangerous?", next = "where_pirates" } },
    },
    where_pirates = {
      lines = { { id = "wp_default", text = "The Southsea Freebooters? Dangerous enough, pal, and they keep hitting the Steamwheedle ships along the coast, which drives up the price of everything, including my swords. Gazlowe would love it if someone cleaned 'em out, and so would my margins." } },
      choices = {
        { text = "I'll help with the pirates.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Pirates are just goblins without a cartel.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Everyone, friend: Horde, Alliance, mercenaries and the occasional pirate who's been very nice to me. In Ratchet, the only side that matters is the side with the gold, and I keep my shop on that side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend, but for the right price, I can find out. Just kidding, ask Gazlowe, he charges less for gossip than I do." } },
  },
}
