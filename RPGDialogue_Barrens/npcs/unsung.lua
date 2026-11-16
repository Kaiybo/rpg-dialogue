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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Devrak, and I keep the wind riders of the Crossroads. They'll take you to Orgrimmar, Thunder Bluff, Ratchet and anywhere else the Horde has a roost, faster than any kodo." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders settle down when one of you is nearby, so come up the tower any time, because you'll make my job easier." },
      },
      choices = {
        { text = "Do you ever feel the air spirits on the roost?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Tell me about the wind riders.", next = "riders" },
        { text = "Is it safe to fly over the Barrens?", next = "safe" },
        { text = "Does anyone ever slip onto your roost uninvited?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why fly at all, when a mage can teleport?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some can, if you believe the tauren, and I've seen one kneel by a dry wash and dig until his hands came up wet. But I've also sold water to three shamans this week, so I'll keep stocking it." } },
      choices = {
        { text = "Water should be shared freely in a land this dry.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Water this scarce is worth whatever you can charge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Barg, and I sell supplies at the Crossroads. Every traveler in the Barrens comes through here sooner or later, and most of them have run out of water by the time they arrive." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and I'll bet you came in with an empty waterskin like everyone else, because asking the water spirits nicely won't fill it in the Barrens." },
      },
      choices = {
        { text = "Can a shaman really find water out here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What should I carry in the Barrens?", next = "carry" },
        { text = "Who comes through the Crossroads?", next = "who" },
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
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of mageroyal and briarthorn, mon. If you be picking in the Barrens, watch for the snakes around the oases." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, good. You be needing ankhs soon enough, mon, because the spirits only bring you back when you bring the right gift." },
  },
  start = "hello",
  nodes = {
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Hula'mahi, and I sell reagents and herbs at the Crossroads. Mages, priests, shaman, they all come to me sooner or later, because spells need more than words, mon." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where do your herbs come from?", next = "herbs" },
        { text = "What brings a troll to the Crossroads?", next = "troll" },
        { text = "I need runes of teleportation, Hula'mahi.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you sell anything that feeds a demon, Hula'mahi?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A bullet, every time, because I can count on it. Lightning hits harder when it lands, I'll give you that, but I've watched a shaman's bolt crackle off a Kolkar stormer like rain off a roof, and the Kolkar didn't wait for a second try." } },
      choices = {
        { text = "I'll trust the spirits over a goblin's gunpowder.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trust whatever kills fastest. Nothing else matters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Uthrok, and I sell bows and guns at the Crossroads. Out in the Barrens you can see an enemy coming from a long way off, so you might as well shoot them before they get close." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You throw lightning, so you'll tell me it's better than a bow, but a bow doesn't need the sky's permission to fire." },
      },
      choices = {
        { text = "Which hits harder, lightning or a bullet, Uthrok?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Bow or gun, which is better?", next = "which" },
        { text = "Where do the guns come from?", next = "guns" },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Omusa Thunderhorn, and I keep the wind riders of Camp Taurajo. From here they fly north to the Crossroads and further, and they carry the camp's news to Thunder Bluff." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders have been uneasy since the dwarves came south with their digging, and perhaps you can feel what they feel." },
      },
      choices = {
        { text = "What are the dwarves disturbing at Bael Modan?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What troubles Camp Taurajo?", next = "trouble" },
        { text = "Do your wind riders have names?", next = "names" },
        { text = "I could watch the dwarves at Bael Modan without being seen.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your wind riders shy from my demon?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask them yourself, but my beasts mind it, and they cough every morning the forges are lit. The sea spirits must be patient, or Ratchet would have washed away long ago." } },
      choices = {
        { text = "The goblins should answer for what they burn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the goblins burn what they like. Ratchet isn't ours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Bragok, and I keep the flight beasts here in Ratchet. The goblins run the town, but they let me keep my roost, because people who fly in spend money." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in a goblin town. You'll hate it here, because the goblins dig and burn whatever they like, and they've never asked a spirit's leave for anything." },
      },
      choices = {
        { text = "Do the spirits mind the goblins' smoke and steam?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you think of Ratchet?", next = "ratchet" },
        { text = "Where does the boat go?", next = "boat" },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ochre from the red cliffs near Ratchet and rust from the iron in the water, and the tauren trade me a blue from a root they won't name. They told me it was a gift from the Earth Mother and that I was to treat it kindly, so I do." } },
      choices = {
        { text = "A gift from the Earth Mother should be treated kindly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dye is a dye, and the price is what matters.", next = "BACK", fx = { align = { light = -1 } } },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Wenna Silkbeard, and I sell tailoring supplies here in Ratchet. Thread, dye, patterns, everything a tailor needs except the cloth itself, and you'll have to cut that off somebody yourself." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll be wanting cloth for your robes, and your sort always choose the earthy colors, ochre and rust and dusk blue, which suits you, I must say." },
      },
      choices = {
        { text = "Where do your earthy dyes come from, Wenna?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where do your dyes come from?", next = "dyes" },
        { text = "Why sell in Ratchet?", next = "ratchet" },
        { text = "Do mages buy much thread from you, Wenna?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do warlocks dress any differently from other casters?", next = "xwarlock", when = { class = "WARLOCK" } },
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
    { id = "g_shop", text = "Weapons! The finest in Ratchet, and maybe the finest in the Barrens. Let's talk prices!" },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 100000 } },
      text = "Now that's a heavy purse, friend, and I can hear it from here. Let me show you the good stock, the stuff I keep in the back." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Does it? Sure, probably, but I'm not an engineer. What I know is that shamans pay extra for anything that sounds like it'll help with the sparks, and I'm not in the business of arguing with paying customers." } },
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
        { id = "xmage_default", text = "Oh no? Then why does every mage who comes in here end up buying a staff, pal? A spell runs out when your mana does, and that's when you'll wish you had something heavy to hit the raptor with." },
      },
      choices = {
        { text = "Fair. A wise mage plans for empty mana.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spells won't run out. Keep your sticks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who buys weapons in Ratchet?", next = "who" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ironzar's the name, and weapons are my game. Swords, axes, maces, you name it, and I've got it, and if I don't, I can get it for you for a price." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll want a mace with a good copper core, because copper carries the lightning, or so I tell every shaman, and they all buy it." },
      },
      choices = {
        { text = "Does copper really carry lightning, Ironzar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where do your weapons come from?", next = "where" },
        { text = "Who buys weapons in Ratchet?", next = "who" },
        { text = "I want something short, sharp and quiet, Ironzar.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A mage doesn't need your weapons, Ironzar.", next = "xmage", when = { class = "MAGE" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, friend? Time is money, you know." } },
    },
    where = {
      lines = { { id = "w_default", text = "Here and there, friend, from the forges in Booty Bay and Gadgetzan, and sometimes from the pirates who wash up on the Merchant Coast. I don't ask questions, and you shouldn't either." } },
      choices = { { text = "Pirates? Are they dangerous?", next = "where_pirates" } },
    },
    where_pirates = {
      lines = { { id = "wp_default", text = "The Southsea Freebooters? Dangerous enough, and they keep attacking the Steamwheedle ships along the coast. Bad for business, so Gazlowe would love it if someone cleaned them out." } },
      choices = {
        { text = "I'll help with the pirates.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Pirates are just goblins without a cartel.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Everyone, friend: Horde, Alliance, mercenaries and the occasional pirate who's been very nice to me. In Ratchet, the only side that matters is the side with the gold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend, but for the right price, I can find out. Just kidding, ask Gazlowe." } },
  },
}
