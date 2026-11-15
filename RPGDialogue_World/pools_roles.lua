-- Role pools for every common kind of NPC, so anyone without their own file still sounds
-- like their job. Narrow roles may notice things (stable masters, blacksmiths, trainers);
-- broad ones (bankers, auctioneers, vendors) never do. A pool with `subtitle` only fits NPCs
-- whose title contains that text ("paladin trainer"), and beats the plain role pool.
-- Lore used here: LORE_NOTES.md, "Capitals and their people".
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Stable masters: they look at animals first and people second.
---------------------------------------------------------------------------
P:Pool {
  id = "stablemaster", role = "stablemaster",
  greetings = {
    { id = "g_stalls", text = "Stalls are clean, mostly." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Leave {pet} with me or take {pet} along. Either way, mind the hay." },
  },
  notice = {
    { id = "n_pet_hurt", cat = "pet", when = { pet = { type = "Beast" }, durability = { max = 0.3 } },
      text = "You look like you've been dragged through a briar. Does {pet} look the same under all that fur?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Good animal; let me see the teeth. No? Fair enough, I wouldn't let me either." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "I'm not stabling you; I've got goats in there." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Don't look at the oats like that; they're for animals that stay animals." },
  },
  lines = {
    { id = "l_default", text = "Fed, watered, brushed: whatever you leave with me comes back in better shape than it went in." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "A hunter, then. Feed them before yourself and they'll follow you anywhere." },
  },
  choices = { { text = "Just the stable.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "If it doesn't eat hay, I don't know about it." } } },
}

---------------------------------------------------------------------------
-- Bankers and auctioneers: money people. No noticing moments (any of them could say it).
---------------------------------------------------------------------------
P:Pool {
  id = "banker", role = "banker",
  greetings = {
    { id = "g_vault", text = "Deposit, withdrawal, or are you just admiring the vault?" },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Ah, do come in, and mind the step." },
  },
  lines = {
    { id = "l_default", text = "What you leave here stays here. That's the whole of the job, and I'm very good at it." },
    { id = "l_poor", when = { money = { max = 100 } }, text = "We keep anything, friend, even very little." },
  },
  choices = { { text = "My vault, please.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "Unless it's kept in a vault, I wouldn't know." } } },
}

P:Pool {
  id = "auctioneer", role = "auctioneer",
  greetings = { { id = "g_bid", text = "Bidding, buying out, or selling?" } },
  lines = {
    { id = "l_default", text = "The house takes its cut, the seller takes the rest, and everybody blames me for the prices." },
  },
  choices = { { text = "Show me the listings.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "If nobody's selling it, I've no opinion." } } },
}

---------------------------------------------------------------------------
-- Blacksmiths, armorers and weaponsmiths: they see your gear before your face.
---------------------------------------------------------------------------
P:Pool {
  id = "blacksmith", role = "blacksmith",
  greetings = {
    { id = "g_anvil", text = "Repairs, or something new?" },
    { id = "g_broken", when = { durability = { max = 0.25 } }, text = "Put it all on the bench, all of it." },
  },
  notice = {
    { id = "n_broken", cat = "gear", when = { durability = { max = 0.2 } }, place = "before",
      text = "No, don't tell me, I can see it from here. That's not wear, that's an argument you lost." },
    { id = "n_naked", cat = "gear", when = { nearlyNaked = true },
      text = "You're shopping, at least I hope you are. Nobody walks in here dressed like that on purpose." },
    { id = "n_plate", cat = "gear", when = { class = { "WARRIOR", "PALADIN" }, durability = { min = 0.9 } },
      text = "Somebody keeps their plate oiled, good. I hate seeing rust I didn't put there." },
  },
  lines = {
    { id = "l_default", text = "Good steel's patient; it waits for you to need it. Bad steel waits for the worst moment." },
    { id = "l_low", when = { durability = { max = 0.5 } }, text = "Half of that's held together by habit. Let me look before it lets you down." },
  },
  choices = { { text = "Repairs, please.", next = "BUSINESS" }, { text = "Just browsing.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "Bring it to the anvil and I'll tell you what it is." } } },
}

---------------------------------------------------------------------------
-- A few common kinds of vendor, by their titles. No noticing moments.
---------------------------------------------------------------------------
P:Pool {
  id = "vendor_food", role = "vendor", subtitle = { "food", "bread", "baker", "butcher", "meat", "fruit", "cook" },
  greetings = { { id = "g_fresh", text = "Fresh today, or mostly today." } },
  lines = {
    { id = "l_default", text = "You'll not fight on an empty stomach. Well, you will, but not for long." },
  },
  choices = { { text = "I'll take some.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "Can't say, but ask me about bread." } } },
}

P:Pool {
  id = "vendor_drink", role = "vendor", subtitle = { "drink", "wine", "brew", "ale", "spirits" },
  greetings = { { id = "g_pour", text = "Something to wash the road down?" } },
  lines = {
    { id = "l_default", text = "Every bottle's honest. Some are honest about being terrible." },
    { id = "l_drunk", when = { drunk = { min = 2 } }, text = "You've had a few. I'll sell you one more, and then I'll sell you water." },
  },
  choices = { { text = "Pour me something.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Nobody tells a bartender anything on the first drink, but by the third I'm hearing all of it. Here's the best of what's been poured out lately." },
    },
    _none = { { id = "t_none", text = "I hear a lot over the bar, but not that." } },
  },
}

P:Pool {
  id = "vendor_reagents", role = "vendor", subtitle = { "reagent", "herbalism supplies", "alchemy supplies", "poison" },
  greetings = { { id = "g_weigh", text = "Weighed fair, every pinch of it." } },
  lines = {
    { id = "l_default", text = "Powders, roots, little jars of things you don't want to sniff. What do you need?" },
    { id = "l_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID", "PALADIN" } },
      text = "One of the casting sort, are you? You'll be back; they're always back." },
  },
  choices = { { text = "Let me see the shelves.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "If it doesn't go in a pouch, I can't help you." } } },
}

---------------------------------------------------------------------------
-- Class trainers. They notice what a teacher would: a student from an unexpected
-- people (Forever's new combinations, the Skyborne), and how far you've come.
---------------------------------------------------------------------------
P:Pool {
  id = "trainer_paladin", role = "trainer", subtitle = "paladin trainer",
  greetings = {
    { id = "g_light", text = "Be welcome, and be honest. Here to learn?" },
    { id = "g_high", when = { minLevel = 40 }, text = "You've walked a long road since your first lesson. Come, there's more of it." },
  },
  notice = {
    { id = "n_dirty", cat = "gear", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, and the Light shields but does not mend, so visit a smith after this." },
  },
  lines = {
    { id = "l_default", text = "Strength without humility is just a heavier sword. Now, what have you come to learn?" },
    { id = "l_dwarf", when = { race = "Dwarf", class = "PALADIN" }, text = "A dwarf of the Light! Stubborn faith is the best kind, so let's begin." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Light asks us to share whatever might help another, so I will. Ask me of these, and I'll answer you honestly." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You carry yourself with honor, and I'd gladly tell you all I know, and pray you use it well." },
    },
    _none = { { id = "t_none", text = "That's not a matter of the Light. Ask elsewhere, and kindly." } },
  },
}

P:Pool {
  -- Every unnamed priest trainer shares this conversation (named ones have their own).
  -- Faction-neutral: Light-aligned priests of both factions, and Forsaken and troll priests.
  id = "trainer_priest", role = "trainer", subtitle = "priest trainer", tier = "service",
  greetings = {
    { id = "g_peace", text = "Peace. What do you need?" },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Back for more? Good; the Light rewards the stubborn." },
  },
  notice = {
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "PRIEST" },
      text = "A gnome in the vestments! I've heard of it and never seen it. Your people do like to take things apart, but faith isn't one of those things." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "PRIEST" },
      text = "The Light still answers you. It burns a little, I'd guess, and that's good; burning means it's listening." },
    { id = "n_hurt", cat = "class", when = { class = "PRIEST", durability = { max = 0.25 } },
      text = "A priest, with armour like that? You've been standing in front of the fighters again, and you belong behind them, always behind." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Out of the shadow for the lesson, please. Nothing I teach will reach you through it." },
  },
  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Ah, the other half of the craft. Careful it doesn't become the whole of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Healing is the easy part. Knowing when to let someone fall and learn is harder." },
        { id = "l_young", when = { class = "PRIEST", maxLevel = 20 }, text = "Still learning to keep your friends standing? That takes longer than learning the words, so be patient with yourself." },
        { id = "l_veteran", when = { class = "PRIEST", minLevel = 45 }, text = "You've seen things I only teach about. Don't let them make you hard; make them make you careful." },
        { id = "l_other", when = { ["not"] = { class = "PRIEST" } }, text = "Not one of mine, but the Light doesn't mind. If you're ever hurt and far from a priest, pray anyway. It hears more than we do." },
      },
      again = { { id = "a_again", text = "Something else, while you're here?" } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What should I be practising?", next = "practise", when = { class = "PRIEST" } },
        { text = "Light or shadow. Which should I study?", next = "shadow", when = { class = "PRIEST", minLevel = 10 } },
        { text = "Does the shadow frighten you?", next = "shadow_fear", when = { form = "shadow" } },
        { text = "Do you ever get tired of healing?", next = "tired" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Watching: who's about to fall, who's pretending not to be hurt, who's standing in the fire. A priest who sees early heals less and saves more." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Your mana: learn how much a prayer costs before you need three in a row. Most young priests learn it the other way." },
      },
      choices = {
        { text = "And in a fight?", next = "practise_fight" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_fight = {
      lines = { { id = "pf_default", text = "Shield the one who'll be hit next, not the one who was hit last. That's the whole art. The rest is timing and nerve." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shadow = {
      big = true,
      lines = { { id = "s_default", text = "Both, if you're brave and honest with yourself. The Light heals; the shadow teaches you what you're healing against. Just never let the second one become the reason you do the first." } },
      choices = {
        { text = "I'll keep to the Light.", next = "BACK", fx = { align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I want to learn the shadow.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },
    shadow_fear = {
      lines = { { id = "sf_default", text = "Not the shadow itself, but the ease of it. Everything you do in that shape, you take from someone, and everything you do outside it, you give. I'd hate to see you forget how to give." } },
      choices = {
        { text = "I won't forget.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Taking keeps people alive too.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    tired = {
      lines = { { id = "t_default", text = "Every night, and then someone walks in bleeding and I'm not tired any more. That's either devotion or habit, and after long enough, I'm not sure there's a difference." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The sick tell me everything, and the healthy tell me the rest. Here is what I can speak to without breaking a confidence." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you, because I answer everyone, but I'll choose my words with care." },
    },
    _none = { { id = "t_none", text = "I'd only be guessing, and guessing is not a sermon." } },
    background = { { id = "t_bg", text = "I knelt once, got up a priest, and haven't sat down much since." } },
    advice = { { id = "t_ad", text = "Carry bandages anyway. The Light is generous, but it's not always quick." } },
  },
}

P:Pool {
  id = "trainer_mage", role = "trainer", subtitle = "mage trainer",
  greetings = { { id = "g_study", text = "Have you been studying, or just setting things on fire?" } },
  notice = {
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "MAGE" },
      text = "An orc who reads! Don't take offense; I'm delighted. Most of my students can't sit still for a page." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "MAGE" },
      text = "Descended from Highborne magisters, I'm told, and come home after a very long time away. I'd like to hear what your people kept, after you've heard what I teach." },
    { id = "n_robes", cat = "gear", when = { class = "MAGE", durability = { max = 0.25 } },
      text = "Robes in tatters? The best mages never get close enough for that, you understand." },
  },
  lines = {
    { id = "l_default", text = "Magic is a debt: you borrow power and you pay it back in focus. Don't fall behind on payments." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Knowledge is the one thing a mage may hoard without shame, though I'll lend a little of mine. Here's what I've read, or overheard in the library." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've studied properly, so I'll open the better books for you." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer these briefly, because every minute spent on you is a minute taken from my research." },
    },
    _none = { { id = "t_none", text = "If it isn't in a book, I haven't bothered with it." } },
  },
}

P:Pool {
  id = "trainer_warlock", role = "trainer", subtitle = "warlock trainer",
  greetings = { { id = "g_quiet", text = "Shut that door first. Now, what is it you want?" } },
  notice = {
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A troll with a grimoire instead of a fetish. The spirits won't like it, and the demons won't care." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp is looking at my books. Tell it to stop looking at my books." },
  },
  lines = {
    { id = "l_default", text = "Power is power. The ones who sneer at where it comes from never have enough of it." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "I make it my business to know what others would rather keep hidden. Some of it I can share, so choose carefully." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "You'll get what I care to give, which is very little, and these are all of it." },
    },
    _none = { { id = "t_none", text = "I don't share what I don't know, and I share very little of what I do." } },
  },
}

P:Pool {
  id = "trainer_hunter", role = "trainer", subtitle = "hunter trainer",
  greetings = { { id = "g_track", text = "Wind's from the west, a good day for it. What do you need?" } },
  notice = {
    { id = "n_human", cat = "class", when = { race = "Human", class = "HUNTER" },
      text = "A human with a bow and a beast at heel. Not many of you take to it, but the ones who do take to it hard." },
    { id = "n_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 12, pet = false },
      text = "Where's your companion? A hunter alone is just someone with a bow." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has good eyes, better than yours, so listen to {pet} more." },
  },
  lines = {
    { id = "l_default", text = "Patience first, aim second, and the rest is weather and luck." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Tracks tell you where something's been, and travellers tell you the rest. Here's what I've picked up on the trail." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've a good eye and a patient hand, so I'll share what I'd tell my own students by the fire." },
    },
    _none = { { id = "t_none", text = "If it doesn't leave tracks, I don't follow it." } },
  },
}

P:Pool {
  id = "trainer_shaman", role = "trainer", subtitle = "shaman trainer",
  greetings = { { id = "g_elements", text = "The elements are restless today; come in." } },
  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "Stone has always listened to your people. I only wondered when you'd start talking back." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "SHAMAN" },
      text = "Your Windshapers came to the Horde through the Earthen Ring, I'm told. Then you know already that the elements listen. Let's see if they answer." },
  },
  lines = {
    { id = "l_default", text = "You don't command the elements; you ask, and you listen when they answer. Most forget the second part." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The spirits speak, and so do the people who come to hear them. These are things I can tell you of." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "The elements sit calm around you today, which tells me you can be trusted with more than most." },
    },
    _none = { { id = "t_none", text = "The spirits have said nothing to me of that." } },
  },
}

P:Pool {
  id = "trainer_druid", role = "trainer", subtitle = "druid trainer",
  greetings = { { id = "g_grove", text = "Walk softly. Now, what will you learn?" } },
  notice = {
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "DRUID" },
      text = "Your people's druids are few, I hear, and look to the elements before the moon. Tell me of that sometime, and I'll teach you this in trade." },
    { id = "n_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "A good cat: low, quiet, patient. Change back, though; we talk better with mouths that make words." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "Mind the lanterns. Every new bear knocks over a lantern." },
  },
  lines = {
    { id = "l_default", text = "Balance isn't standing still. It's leaning one way and then the other and never quite falling." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The wild carries word on the wind, and the Circle carries the rest. Ask of these, and I'll tell you what I've learned." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The wild is patient with you, and I'm trying to be. Ask one of these, and listen to the answer." },
    },
    _none = { { id = "t_none", text = "The wild has not shown me that. Perhaps it will show you." } },
  },
}

P:Pool {
  id = "trainer_rogue", role = "trainer", subtitle = "rogue trainer",
  greetings = { { id = "g_whisper", text = "Keep your voice down. What do you want to learn?" } },
  notice = {
    { id = "n_stealth", cat = "class", when = { stealthed = true }, place = "replace",
      text = "I saw you come in, and if I can see you, so can everyone else. Again." },
    { id = "n_plate", cat = "gear", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank, and I don't train people who clank." },
  },
  lines = {
    { id = "l_default", text = "Nobody remembers a quiet blade. That's the point of it." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Information is the only coin that's worth more after you've spent it. Here's what I can afford to give away." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've kept your mouth shut when it counted, so I'll open mine a little." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Everything I know has a price, and you can't afford most of it, but these you can have." },
    },
    _none = { { id = "t_none", text = "If I knew, it'd cost you. I don't, so it won't." } },
  },
}

P:Pool {
  id = "trainer_warrior", role = "trainer", subtitle = "warrior trainer",
  greetings = { { id = "g_stance", text = "Feet apart, shield up. Now, what do you want?" } },
  notice = {
    { id = "n_dented", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Good, you've been hit. Now tell me why you got hit." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "WARRIOR" },
      text = "Short reach, quick feet. Everyone underestimates a small warrior, once." },
  },
  lines = {
    { id = "l_default", text = "Anyone can swing a sword. A warrior knows when not to." },
  },
  choices = { { text = "Teach me.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Soldiers talk in the training yard between bruises, and I listen. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Talk comes after you've learned to keep your guard up, so take one of these and get back to the drills." },
    },
    _none = { { id = "t_none", text = "Can I hit it? If not, then I don't know about it." } },
  },
}

---------------------------------------------------------------------------
-- Horde flight masters: their own view of the sky.
---------------------------------------------------------------------------
P:Pool {
  id = "flightmaster_horde", role = "flightmaster", faction = "Horde",
  greetings = {
    { id = "g_where", text = "Where are you flying? Speak up, the wind riders are hungry." },
    { id = "g_again", when = { timesTalked = { min = 5 } }, text = "Back so soon? The riders know your smell by now." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "They say your people glide. Gliding is falling with manners, and a wind rider climbs." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Your beast walks and mine fly, so get off and get on." },
  },
  lines = { { id = "l_default", text = "Hold the harness, not the rider's neck. It bites." } },
  choices = { { text = "Just the flight.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every wind rider brings news back from the far roosts along with the dust. Here's what's come in on the wind." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've flown with me enough to hear what the riders say when they think no one's listening." },
    },
  },
}

---------------------------------------------------------------------------
-- Guards outside the capitals, by faction. Capital guards are below.
---------------------------------------------------------------------------
P:Pool {
  id = "guard_alliance", role = "guard", faction = "Alliance",
  greetings = {
    { id = "g_move", text = "Move along. If there's trouble, come and find me." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be wandering, friend. Keep to the road." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Bandits get your gear, or are you just brave about the weather?" },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "Sleep it off somewhere that isn't my road." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Easy, priest. Folk see that on the road at night and reach for a sword before they think to pray." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Show yourself!" },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Hold! Oh, it's a priest. You might warn a man first." },
  },
  lines = { { id = "l_default", text = "Report anything strange to the nearest officer. Strange gets worse if you wait." } },
  choices = { { text = "Carry on.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Patrols pass word along the road, and a fair bit of it reaches me. Here's what I can tell you." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been a friend to these roads, so I'll speak plainly about what we've seen out here." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer your questions, but I'll be keeping an eye on you while I do." },
    },
    _none = { { id = "t_none", text = "That's above my post, I'm afraid; ask an officer." } },
  },
}

P:Pool {
  id = "guard_horde", role = "guard", faction = "Horde",
  greetings = {
    { id = "g_strength", text = "Strength and honor. What is it you want?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's the night watch, so don't make it interesting." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Lost your armor, or lost a bet?" },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "You reek of grog. Fall over somewhere I'm not standing." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I can smell you, so come out." } },
  lines = { { id = "l_default", text = "If you're looking for a fight, there are better places than my post. Ask anyone." } },
  choices = { { text = "Strength and honor.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "A guard hears the road's business whether he wants it or not. Ask about any of this." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've earned some respect around here, so I'll tell you what the grunts are saying." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask your questions quickly, since I've a post to watch and I don't like your look." },
    },
    _none = { { id = "t_none", text = "Ask someone who gives orders." } },
  },
}

---------------------------------------------------------------------------
-- Capital guards. Directions, pride in their city, and an eye on you.
---------------------------------------------------------------------------
P:Pool {
  id = "guard_stormwind", role = "guard", community = "stormwind",
  barks = {
    { id = "b_bridge", text = "Mind the canals; we fish someone out every week." },
  },
  greetings = {
    { id = "g_city", text = "Welcome to Stormwind. Keep your blade sheathed inside the walls." },
    { id = "g_lost", when = { timesTalked = { max = 1 } }, text = "Lost? Everyone's lost their first week, so ask me anything." },
    { id = "g_hero", when = { townStanding = { town = "stormwind", min = 55 } }, text = "It's an honor, really, and I'm not just saying that." },
    { id = "g_distrust", when = { townStanding = { town = "stormwind", max = -20 } }, text = "The Watch knows your face, so behave yourself." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You can't walk the Trade District like that. Well, you can, but people will talk." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Looking like that, you'll set the canal folk screaming. Cathedral business, I'll assume, so move along gently." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Stealth inside the city walls? Show yourself, or I call the Watch." },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Light preserve us! Oh, you're one of the Cathedral's lot. Carry on, then, but go gently; you'll frighten the canal folk." },
  },
  lines = {
    { id = "l_default", text = "Trade District for shops, Cathedral Square for the Light, Old Town for trouble. The Keep's up the hill, and they won't let you in to see the Highlord without good reason." },
    { id = "l_rebuilt", text = "Masons rebuilt every stone you're standing on after the orcs burned it. Spare a thought for them, if you ever see one." },
  },
  choices = { { text = "Thanks for the directions.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Watch hears everything in this city eventually, usually at the worst hour. Here's what I'm free to tell you." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done right by Stormwind, so I'll tell you what we say in the barracks as well." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The Watch will answer your questions, and the Watch will also be writing down your name." },
    },
    defias = { { id = "t_defias", text = "Out in Westfall, mostly. Don't say that name loudly in Old Town." } },
    _none = { { id = "t_none", text = "Couldn't say. The Watch doesn't pay me to know everything." } },
  },
}

P:Pool {
  id = "guard_ironforge", role = "guard", community = "ironforge",
  greetings = {
    { id = "g_forge", text = "Ye're under the mountain now. Warm enough for ye, eh?" },
    { id = "g_elf", when = { race = { "NightElf", "Skyborne" } }, text = "An elf, in Ironforge! Well, it's a big mountain, so mind the heat." },
  },
  notice = {
    { id = "n_dwarf_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf shaman! My granddad would've had words, but I've no words; just mind the Great Forge doesn't talk back to ye." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about under the mountain? Out wi' ye, where I can see." } },
  lines = {
    { id = "l_default", text = "Great Forge in the middle, King Magni up in the throne room, the tram to Stormwind down the Tinker Town way. Ye'll not get lost, it's a circle." },
  },
  choices = { { text = "Thanks.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Under the mountain, news echoes, so ye hear it whether ye want to or no. Here's what's been bouncin' off the walls." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Ye've been good to the mountain, so pull up a stool, an' I'll tell ye the lot." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell ye what I must, an' then ye can be on yer way." },
    },
    _none = { { id = "t_none", text = "Never heard of it. Ask at the Explorers' Hall, they know everything and tell ye twice." } },
  },
}

P:Pool {
  id = "guard_darnassus", role = "guard", community = "darnassus",
  greetings = {
    { id = "g_elune", text = "Elune's light on you, stranger." },
    { id = "g_short", when = { race = { "Dwarf", "Gnome" } }, text = "Welcome. The branches are wide, and you won't fall." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Elves from the sky, and forgive me for staring; a Sentinel is allowed to be curious once a century." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Walk in your own shape among the trees, druid. The young ones find it unsettling." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The shadows here belong to the Sentinels. Step out." } },
  lines = {
    { id = "l_default", text = "The Temple of the Moon for the priestesses, the Cenarion Enclave for the druids. Walk softly; this tree is young." },
  },
  choices = { { text = "Thank you, Sentinel.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Sentinels watch, and what we watch, we remember. I may tell you of these things." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Elune has smiled on you, I think, and so I will speak more freely than I would to others." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will answer, as a Sentinel must, but my trust is not so easily given." },
    },
    _none = { { id = "t_none", text = "The Sentinels do not speak of what they do not know." } },
  },
}

P:Pool {
  id = "guard_orgrimmar", role = "guard", community = "orgrimmar",
  greetings = {
    { id = "g_strength", text = "Lok'tar. You're in Orgrimmar now, so act like it." },
    { id = "g_mage", when = { race = "Orc", class = "MAGE" }, text = "An orc with a staff and no axe? Don't set the Drag on fire." },
  },
  notice = {
    { id = "n_orc_mage", cat = "class", when = { race = "Orc", class = "MAGE" },
      text = "My grandfather would spit to see an orc mage, but my grandfather's dead. Learn it well, and use it for the Horde." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Skulking in the Warchief's city? Show yourself." } },
  lines = {
    { id = "l_default", text = "Valley of Strength by the gate, the Drag for anything crooked, and Grommash Hold for the Warchief, but don't bother him." },
  },
  choices = { { text = "Lok'tar.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The gate hears everything that comes in from the Barrens, and plenty that crawls up out of the Drag. Here's what I know of it." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've bled for the Horde, so I'll tell you what the grunts don't say in front of the officers." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you because the Warchief says we answer, so make it worth my time." },
    },
    _none = { { id = "t_none", text = "Not my business; find a shaman." } },
  },
}

P:Pool {
  id = "guard_thunderbluff", role = "guard", community = "thunder_bluff",
  greetings = {
    { id = "g_winds", text = "Walk with the Earth Mother. The lifts will take you down when you're done." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Your Windshapers keep their camp below us now, at Gev'rek, and you are welcome on the bluffs. Mind the edges anyway." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hiding on the bluffs? There is nowhere to fall but down, so come out." } },
  lines = {
    { id = "l_default", text = "The rises and the bridges between them. Mind the edges; the wind does not ask permission." },
  },
  choices = { { text = "Thank you.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The wind carries word up the bluffs, and the Bluffwatchers hear it first. These things I can speak of." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You walk gently among our people, so I will share what the elders have let us hear." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will answer, but my patience is shorter than the lift ropes, so choose well." },
    },
    _none = { { id = "t_none", text = "The Earth Mother keeps that to herself, and so must I." } },
  },
}

P:Pool {
  id = "guard_undercity", role = "guard", community = "undercity",
  greetings = {
    { id = "g_dark", text = "You're in the Undercity. Keep to the paths and don't touch the green." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "One of us, wearing the Light like a coat. I don't know whether to salute or step back." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "Breathing, in here? You'll get used to the smell before you get used to the stares." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "We see better in the dark than you think, so out." } },
  lines = {
    { id = "l_default", text = "The Apothecarium, the Magic Quarter, the War Quarter and the Rogues' Quarter, all in a ring around the Trade Quarter. The Banshee Queen keeps the Royal Quarter, and you don't." },
  },
  choices = { { text = "Understood.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The dead hear more than the living suspect, and we have nowhere else to be. Here is what has drifted down to us." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done the Dark Lady good service, so I'll tell you what the Deathguard whisper among themselves." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what the Dark Lady permits, and not a syllable that she doesn't." },
    },
    _none = { { id = "t_none", text = "The dead keep secrets, but that one isn't mine to keep." } },
  },
}

---------------------------------------------------------------------------
-- Peons: they work, and they'd rather not.
---------------------------------------------------------------------------
P:Pool {
  id = "peon", role = "peon",
  barks = { { id = "b_work", text = "Work, work." } },
  greetings = { { id = "g_busy", text = "Peon busy, very busy, look how busy!" } },
  lines = { { id = "l_default", text = "Peon chop wood and peon carry wood, but peon not talk about wood." } },
  choices = { { text = "Back to work.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Peon not know, and peon not want to know." } } },
}
