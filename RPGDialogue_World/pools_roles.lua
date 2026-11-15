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
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "If you're going to be a cat in my stable, stay off the rafters. The owls nest up there, and they've opinions about cats." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Not that one, thank you; I don't stable anything that smells of brimstone. The horses would kick the stalls to kindling." },
    { id = "n_wolf", cat = "form", when = { form = "ghostwolf" },
      text = "A wolf made of mist, and now my hounds won't stop howling. Could you be a little less ghostly while you're in the yard?" },
    { id = "n_tauren_hunter", cat = "pet", when = { race = "Tauren", class = "HUNTER" },
      text = "Tauren hunters' beasts are always calm in the stall, and I've never learned why. Do you sing to them?" },
    { id = "n_dwarf_hunter", cat = "pet", when = { race = "Dwarf", class = "HUNTER" },
      text = "A dwarf with a beast! Your people's animals always come back smelling of ale, and I've stopped asking how." },
    { id = "n_nightelf_hunter", cat = "pet", when = { race = "NightElf", class = "HUNTER" },
      text = "Kaldorei animals never touch what I put out for them. Tell me what yours eats, and I'll stop wasting good oats." },
    { id = "n_skyborne", cat = "pet", when = { race = "Skyborne" },
      text = "Your people ride something called a galestrider, I'm told. I've no stall for anything that half flies, so I hope you keep it somewhere else." },
  },
  lines = {
    { id = "l_default", text = "Fed, watered, brushed: whatever you leave with me comes back in better shape than it went in." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "A hunter, then. Feed them before yourself and they'll follow you anywhere." },
    { id = "l_druid", when = { class = "DRUID" }, text = "A druid knows animals from the inside, which is more than I can say. If any of mine look unhappy to you, tell me." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "Keep your servants well away from my stalls. Nothing in here was born to stand next to one of those." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "Shamans settle my beasts quicker than I can. I've stopped taking it personally." },
    { id = "l_paladin", when = { class = "PALADIN", minLevel = 40 }, text = "A charger that comes when it's called and goes when it's done. I'd lose my trade if every rider had one of those." },
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
    { id = "n_rogue", cat = "gear", when = { class = "ROGUE" },
      text = "Those daggers want honing, and I'll not ask what dulled them. Hand them over hilt first, if you please." },
    { id = "n_hunter", cat = "gear", when = { class = "HUNTER" },
      text = "Half your arrowheads are bent from rattling in the quiver. Bring them to the anvil sometime, before they bend in something that's charging you." },
    { id = "n_mage", cat = "gear", when = { class = "MAGE" },
      text = "Mind those robes near the forge; cloth goes up like kindling. You'd be surprised how many mages learn that here." },
    { id = "n_shaman", cat = "gear", when = { class = "SHAMAN" },
      text = "Mail, a shield and a totem on the belt. I'll mend the first two, but the totem's beyond any smith." },
    { id = "n_druid", cat = "gear", when = { class = "DRUID" },
      text = "Leather and wood, mostly? You hardly need a smith, but sit a moment; the forge is warm." },
    { id = "n_dwarf", cat = "gear", when = { race = "Dwarf" },
      text = "Let's see that work. Ironforge steel, or somebody's poor copy of it? I can always tell, so don't bother lying." },
    { id = "n_gnome", cat = "gear", when = { race = "Gnome" },
      text = "Don't touch the bellows. The last gnome in here improved them, and I still can't make them stop." },
    { id = "n_tauren", cat = "gear", when = { race = "Tauren" },
      text = "I'll need the big anvil for your gear. Tauren buckles take twice the iron of anyone else's." },
    { id = "n_paladin", cat = "gear", when = { class = "PALADIN", durability = { max = 0.5 } },
      text = "The Light doesn't hammer out dents, however hard you pray at them. Get it on the bench." },
  },
  lines = {
    { id = "l_default", text = "Good steel's patient; it waits for you to need it. Bad steel waits for the worst moment." },
    { id = "l_low", when = { durability = { max = 0.5 } }, text = "Half of that's held together by habit. Let me look before it lets you down." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "A warrior's gear tells me everything: where you were hit, how often, and how often you didn't move out of the way." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "Brimstone and soot smell much the same, but I know the difference. Keep your conjuring out of my coals." },
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
  -- Faction-neutral: human and dwarf paladins of the Silver Hand, and the Forsaken who
  -- still answer to the Light in Forever.
  id = "trainer_paladin", role = "trainer", subtitle = "paladin trainer", tier = "service",
  greetings = {
    { id = "g_light", text = "Be welcome, and be honest. Here to learn?" },
    { id = "g_high", when = { minLevel = 40 }, text = "You've walked a long road since your first lesson. Come, there's more of it." },
  },
  notice = {
    { id = "n_dirty", cat = "gear", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, and the Light shields but does not mend, so visit a smith after this." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "The Light comes to you, and it hurts, doesn't it? I won't pretend to understand why it answers, but I've stopped pretending that it doesn't." },
    { id = "n_human", cat = "class", when = { race = "Human", class = "PALADIN" },
      text = "Every human paladin I've taught had that same look, half sure the Light was listening and half afraid that it was. Both halves are right, so keep them." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "PALADIN" },
      text = "You've a dwarf's patience with the hammer and a dwarf's impatience with everything else. The Light seems to like the combination, so I'll not argue with it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Strength without humility is just a heavier sword. Now, what have you come to learn?" },
        { id = "l_dwarf", when = { race = "Dwarf", class = "PALADIN" }, text = "A dwarf of the Light! Stubborn faith is the best kind, so let's begin." },
        { id = "l_young", when = { class = "PALADIN", maxLevel = 20 }, text = "Your hammer arm will learn before your heart does, and that's the wrong way round. Pray before you train, not after." },
        { id = "l_veteran", when = { class = "PALADIN", minLevel = 45 }, text = "You carry the Light now as if you've stopped noticing its weight. That's either grace or exhaustion, so tell me which." },
        { id = "l_other", when = { ["not"] = { class = "PALADIN" } }, text = "You're not of the order, but you're welcome all the same. The Light judges what you do, not what you were trained to do." },
      },
      again = {
        { id = "a_again", text = "What else weighs on you?" },
        { id = "a_again2", text = "Speak plainly; I have the time." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What should I be practising?", next = "practise", when = { class = "PALADIN" } },
        { text = "Mercy or judgement: which does the Light ask of us?", next = "mercy", when = { class = "PALADIN", minLevel = 10 } },
        { text = "Do you ever doubt the Light?", next = "doubt" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Your blessings, and on other people. A paladin who keeps every blessing for their own skin is only a warrior who prays." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn to heal in armour with a hammer still in your hand. Nobody will ever give you a quiet moment to set it down." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn when to step forward and take the blow meant for someone softer. The Light gave you that armour for exactly that." },
      },
      choices = {
        { text = "And against the undead?", next = "practise_undead" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_undead = {
      lines = {
        { id = "pu_default", text = "The Light is fire to them, so don't hold back and don't hesitate. Whatever they were once, they aren't that now, and the kindest blow is the quickest." },
        { id = "pu_undead", when = { race = "Scourge" }, text = "You know better than I do what the Scourge feel when the Light touches them. Use that knowledge, and finish what's left of them quickly." },
      },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 1 } } },
    },
    mercy = {
      big = true,
      lines = { { id = "m_default", text = "Both, and never at the same moment. Mercy for the one who can still turn back, judgement for the one who won't, and the hard part is telling them apart while they're both holding swords." } },
      choices = {
        { text = "Mercy first, always. Judgement belongs to the Light.", next = "BACK", fx = { align = { light = 1, order = -1 }, trait = { kind = 1 } } },
        { text = "Judgement first. Mercy to the wicked is cruelty to their victims.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "How do you tell them apart?", next = "mercy_tell" },
      },
    },
    mercy_tell = {
      lines = { { id = "mt_default", text = "You don't, not always, and you'll get it wrong both ways before you're done. Pray over the ones you spared and the ones you didn't, and keep doing the work anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { pious = 1 } } } },
    },
    doubt = {
      lines = {
        { id = "d_default", text = "I doubt myself every morning, and I doubted the Light the winter the plague came. It answered anyway, both times, and that's the only argument I've ever needed." },
        { id = "d_undead", when = { race = "Scourge", class = "PALADIN" }, text = "You'd know more about doubt than I would. You woke in the dark and something in you still wanted to pray, and the Light came, which I suspect surprised you both." },
      },
      choices = {
        { text = "That's a comfort.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Light asks us to share whatever might help another, so I will. Ask me of these, and I'll answer you honestly." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You carry yourself with honor, and I'd gladly tell you all I know, and pray you use it well." },
    },
    _none = { { id = "t_none", text = "That's not a matter of the Light. Ask elsewhere, and kindly." } },
    background = { { id = "t_bg", text = "I took my vows on my knees and broke my first hammer within the week. The vows held up better." } },
    advice = { { id = "t_ad", text = "Mend the body, then the armour, then the spirit. Most people do it backwards and wonder why they're so tired." } },
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
  -- Faction-neutral: human, gnome and Skyborne mages for the Alliance; Forsaken, troll and
  -- orc mages for the Horde.
  id = "trainer_mage", role = "trainer", subtitle = "mage trainer", tier = "service",
  greetings = {
    { id = "g_study", text = "Have you been studying, or just setting things on fire?" },
    { id = "g_vet", when = { class = "MAGE", minLevel = 40 }, text = "You've still got both eyebrows, I see, which means you've been careful. Come in." },
  },
  notice = {
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "MAGE" },
      text = "An orc who reads! Don't take offense; I'm delighted. Most of my students can't sit still for a page." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "MAGE" },
      text = "Descended from Highborne magisters, I'm told, and come home after a very long time away. I'd like to hear what your people kept, after you've heard what I teach." },
    { id = "n_robes", cat = "gear", when = { class = "MAGE", durability = { max = 0.25 } },
      text = "Robes in tatters? The best mages never get close enough for that, you understand." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "MAGE" },
      text = "A gnome of the arcane! Your people's last students are scattered across three cities since Gnomeregan fell, and every one of them corrects my diagrams." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "MAGE" },
      text = "Some of your people studied in Dalaran while they still breathed. They make the most patient students I have, since time no longer frightens them." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "MAGE" },
      text = "A troll with a spellbook. The witch doctors would call this foreign magic, and they wouldn't be wrong, but the arcane doesn't care whose hands it's in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Magic is a debt: you borrow power and you pay it back in focus. Don't fall behind on payments." },
        { id = "l_young", when = { class = "MAGE", maxLevel = 20 }, text = "You still count your mana in fireballs, don't you? Count it in heartbeats instead, and you'll live a good deal longer." },
        { id = "l_veteran", when = { class = "MAGE", minLevel = 45 }, text = "You've read things out in the field that aren't in any library I can get into. Write them down, and be careful who you show them to." },
        { id = "l_other", when = { ["not"] = { class = "MAGE" } }, text = "You're no mage, but you're welcome to stand in the corner and look impressed. Most of my students would kill for an audience." },
      },
      again = {
        { id = "a_again", text = "Another question? Good; questions are cheaper than mistakes." },
        { id = "a_again2", text = "Go on. The books won't mind waiting." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "What does all this knowledge cost?", next = "price", when = { class = "MAGE", minLevel = 10 } },
        { text = "Do you ever think about Dalaran?", next = "dalaran" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Control: putting a frost bolt exactly where you meant it, every single time. Power comes on its own, and control never does." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Conjure your own food and water, and stop paying the innkeeper for it. Making bread out of nothing teaches more patience than any lecture of mine." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to turn the beast into a sheep and walk away from it. The cleverest fight is the one you postpone until it suits you." },
      },
      choices = {
        { text = "And if they get close?", next = "practise_close" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_close = {
      lines = { { id = "pc_default", text = "Then you've already made a mistake, so freeze them where they stand and walk, don't run, to a better distance. A mage in a hurry is usually a mage on fire." } },
      choices = { { text = "Walk, don't run. Understood.", next = "BACK", fx = { affinity = 1 } } },
    },
    price = {
      big = true,
      lines = { { id = "pr_default", text = "Everything, if you let it. Dalaran's best minds studied until they couldn't see the edge of what they were doing, and some of them opened doors that should have stayed shut. The price of knowledge is knowing when to close the book." } },
      choices = {
        { text = "Some books should stay closed.", next = "BACK", fx = { align = { order = 1, light = 1 }, trait = { cautious = 1 } } },
        { text = "No knowledge is forbidden. Only what we do with it.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Who opened those doors?", next = "price_who" },
      },
    },
    price_who = {
      lines = { { id = "pw_default", text = "Kel'Thuzad sat among the Kirin Tor, and a respected member too, until he went looking for necromancy and found something waiting for him. He was a brilliant man, and that was precisely the trouble." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    dalaran = {
      lines = { { id = "da_default", text = "Every mage does. The Scourge broke its walls and the demon Archimonde levelled what was left, and now the Kirin Tor rebuild behind their shield and let very few inside. Whatever you learn here is a scrap of what was lost there." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Knowledge is the one thing a mage may hoard without shame, though I'll lend a little of mine. Here's what I've read, or overheard in the library." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've studied properly, so I'll open the better books for you." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer these briefly, because every minute spent on you is a minute taken from my research." },
    },
    _none = { { id = "t_none", text = "If it isn't in a book, I haven't bothered with it." } },
    background = { { id = "t_bg", text = "I set fire to my first teacher's beard, and he took me on because of it. He said anyone who could manage that by accident was worth teaching on purpose." } },
    advice = { { id = "t_ad", text = "Never stand where you can't see the door. Mages who forget that end up as warnings in someone else's lecture." } },
  },
}

P:Pool {
  -- Faction-neutral: human and gnome warlocks for the Alliance; orc, troll and Forsaken
  -- warlocks for the Horde.
  id = "trainer_warlock", role = "trainer", subtitle = "warlock trainer", tier = "service",
  greetings = {
    { id = "g_quiet", text = "Shut that door first. Now, what is it you want?" },
    { id = "g_vet", when = { class = "WARLOCK", minLevel = 40 }, text = "Still yourself, I see. Good; not everyone who comes back is." },
  },
  notice = {
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A troll with a grimoire instead of a fetish. The spirits won't like it, and the demons won't care." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp is looking at my books. Tell it to stop looking at my books." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "WARLOCK" },
      text = "A gnome who reads grimoires. Your people like to know how things work, and I'll warn you now that some things work better when you don't look too closely." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "WARLOCK" },
      text = "An orc at this trade, after everything it cost your people. Either you're very brave or you haven't heard the stories, and I hope it's the first." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "WARLOCK" },
      text = "The dead make careful warlocks, since there's not much left in you for a demon to bargain over. Don't let that make you careless." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker keeps drifting toward the candles. Tell it the dark in this room belongs to me." },
    { id = "n_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Send your succubus to wait in the hall. She distracts my other students, and she knows perfectly well that she does." },
    { id = "n_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Your felhunter is sniffing at my wards. They need the testing, but call it back before it eats one." },
  },
  react = {
    { id = "r_demon", on = "pet", when = { pet = { type = "Demon" } }, text = "Ah, and here's your shadow. Sit it by the door and don't let it touch anything." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Power is power. The ones who sneer at where it comes from never have enough of it." },
        { id = "l_young", when = { class = "WARLOCK", maxLevel = 20 }, text = "Your imp still talks back to you, doesn't it? Good; the day it goes quiet is the day you should start worrying." },
        { id = "l_veteran", when = { class = "WARLOCK", minLevel = 45 }, text = "You've bound things I'd hesitate to name aloud. Tell me how, quietly, and then tell me what they asked for in return." },
        { id = "l_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're no warlock, so you'll forgive me if I don't explain myself. Most people who ask what I do don't really want to know." },
      },
      again = {
        { id = "a_again", text = "Something else? Keep your voice low." },
        { id = "a_again2", text = "Go on, while the door's still shut." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Who's the master: you, or the demon?", next = "master", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "How do you justify this work?", next = "justify" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Patience with your curses. Lay them, step back and let them work, because a warlock standing in the thick of the fight has forgotten what the craft is for." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn to trade your own health for power and back again, and learn exactly how far you can push it. You'll find the line by falling over it once, so do that somewhere safe." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to send your servant where you'd never go yourself. That's the whole art, and it's also the whole danger." },
      },
      choices = {
        { text = "And if the demon turns on me?", next = "practise_turn" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_turn = {
      lines = { { id = "pt_default", text = "Then you were weak, or careless, or it was cleverer than you, and you'll find out which while it's eating you. Bind it again, tighter, and never let it see you flinch." } },
      choices = { { text = "I won't flinch.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    master = {
      big = true,
      lines = { { id = "m_default", text = "The warlock is, always, right up until the moment the warlock isn't. Every one of us believes we hold the leash, and every one who fell believed it until they were on the other end of it." } },
      choices = {
        { text = "I hold the leash. That's what mastery means.", next = "BACK", fx = { align = { order = 1, light = -1 }, trait = { stern = 1 } } },
        { text = "Maybe I'm being used. I'll use it right back.", next = "BACK", fx = { align = { order = -1, honor = -1 }, trait = { witty = 1 } } },
        { text = "Have you ever lost control?", next = "master_lost" },
      },
    },
    master_lost = {
      lines = { { id = "ml_default", text = "Once, and the room still has scorch marks under the new paint. I bound it again before it reached the door, and you're the first student I've told how close it came." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    justify = {
      lines = { { id = "j_default", text = "The demons are coming whether we study them or not. I'd rather the one who understands them stood on our side than theirs, and if it costs me a little of my soul, that's mine to spend." } },
      choices = {
        { text = "That's a dangerous bargain.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "I make it my business to know what others would rather keep hidden. Some of it I can share, so choose carefully." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "You'll get what I care to give, which is very little, and these are all of it." },
    },
    _none = { { id = "t_none", text = "I don't share what I don't know, and I share very little of what I do." } },
    background = { { id = "t_bg", text = "I found the wrong book in the right library and read it twice before anyone noticed. By then I knew too much to stop." } },
    advice = { { id = "t_ad", text = "Never make a bargain you haven't read to the bottom. Demons write the important part small." } },
  },
}

P:Pool {
  -- Faction-neutral: hunters of every people, including Forever's human hunters.
  id = "trainer_hunter", role = "trainer", subtitle = "hunter trainer", tier = "service",
  greetings = {
    { id = "g_track", text = "Wind's from the west, a good day for it. What do you need?" },
    { id = "g_pet", when = { class = "HUNTER", pet = { type = "Beast" } }, text = "You and {pet} again. One of you is improving, and I won't say which." },
  },
  notice = {
    { id = "n_human", cat = "class", when = { race = "Human", class = "HUNTER" },
      text = "A human with a bow and a beast at heel. Not many of you take to it, but the ones who do take to it hard." },
    { id = "n_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 12, pet = false },
      text = "Where's your companion? A hunter alone is just someone with a bow." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has good eyes, better than yours, so listen to {pet} more." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A dwarf with a rifle, and you'll want to blast everything from a mile off. Learn to be close and quiet too, because the beast won't wait for you to reload." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "HUNTER" },
      text = "You move like the woods taught you, which I suppose they did. Let the beast do some of the deciding; your people are good at that already." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "HUNTER" },
      text = "Darkspear hunters throw like they were born to it, and maybe they were. Show me what the islands taught you, and I'll teach you what they didn't." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "HUNTER" },
      text = "The plains hunters thank every animal they kill, and I've never once thought it a waste of breath. Keep doing it." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "HUNTER" },
      text = "A Skyborne hunter! I'd heard your people kept rangers of their own, and I'd like to know what you hunted up there, where the ground isn't always under you." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "HUNTER" },
      text = "Animals don't care for the dead, and yet one follows you. Whatever you did to win it over, keep doing it." },
  },
  react = {
    { id = "r_pet", on = "pet", when = { pet = { type = "Beast" } }, text = "There, now you look like a hunter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Patience first, aim second, and the rest is weather and luck." },
        { id = "l_young", when = { class = "HUNTER", maxLevel = 20 }, text = "Your shots go wide when you're worried, and you're worried most of the time. Breathe out before you loose, and stop watching the arrow." },
        { id = "l_veteran", when = { class = "HUNTER", minLevel = 45 }, text = "You and your beast move like one animal now. There's not much left I can teach you, except to remember how you got there." },
        { id = "l_other", when = { ["not"] = { class = "HUNTER" } }, text = "You're not a hunter, but you've eyes, so use them. Most of my craft is noticing what the rest of the world walks past." },
      },
      again = {
        { id = "a_again", text = "What else? The wind won't change for a while yet." },
        { id = "a_again2", text = "Ask, then. The beasts can wait." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What should I be practising?", next = "practise", when = { class = "HUNTER" } },
        { text = "Do you hunt for need, or for sport?", next = "sport", when = { class = "HUNTER", minLevel = 10 } },
        { text = "Have you ever lost a companion?", next = "lose" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Distance, more than aim. Keep the beast between you and the fight, and learn the exact step back that keeps you out of reach." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Feed your companion before you feed yourself, and talk to it even when you feel a fool. It's listening more than you think." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Traps, laid before the fight instead of during it. The best hunt is the one where everything goes exactly where you meant it to." },
      },
      choices = {
        { text = "How do I choose a companion?", next = "practise_beast" },
        { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    practise_beast = {
      lines = {
        { id = "pb_default", text = "Choose the one that looks back at you. Teeth and claws you can train, but the nerve has to be there from the start." },
        { id = "pb_pet", when = { pet = { type = "Beast" } }, text = "{pet} chose you as much as you chose {pet}, whatever you think. Look after that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sport = {
      big = true,
      lines = { { id = "s_default", text = "For need, if I'm honest, and I'm not always honest. There's a pleasure in the chase that has nothing to do with supper, and the day you stop feeling it you should hang up the bow, but the day it's all you feel, hang it up sooner." } },
      choices = {
        { text = "I take only what I need from the wild.", next = "BACK", fx = { align = { order = 1, honor = 1 }, trait = { kind = 1 } } },
        { text = "The chase is the point. The kill just proves it.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    lose = {
      lines = { { id = "lo_default", text = "Twice, and both times I sat by the stables for a week like a fool. You'll tame another, and you'll love it, and you'll never quite stop looking for the first one in it." } },
      choices = {
        { text = "I'd look too.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Tracks tell you where something's been, and travellers tell you the rest. Here's what I've picked up on the trail." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've a good eye and a patient hand, so I'll share what I'd tell my own students by the fire." },
    },
    _none = { { id = "t_none", text = "If it doesn't leave tracks, I don't follow it." } },
    background = { { id = "t_bg", text = "I followed a wolf into the woods when I was small, and it let me. I've been following things into the woods ever since." } },
    advice = { { id = "t_ad", text = "Carry more arrows than you think you'll need, and more food for the beast than for yourself." } },
  },
}

P:Pool {
  -- Faction-neutral: orc, troll, tauren and Skyborne shamans for the Horde, and Forever's
  -- dwarf shamans for the Alliance.
  id = "trainer_shaman", role = "trainer", subtitle = "shaman trainer", tier = "service",
  greetings = {
    { id = "g_elements", text = "The elements are restless today; come in." },
    { id = "g_wolf", when = { form = "ghostwolf" }, text = "Come in out of the wolf, and sit." },
  },
  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "Stone has always listened to your people. I only wondered when you'd start talking back." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "SHAMAN" },
      text = "Your Windshapers came to the Horde through the Earthen Ring, I'm told. Then you know already that the elements listen. Let's see if they answer." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "The spirits turned from your people once, when the warlocks led them to the demons. That they answer you now is a gift, and you must never treat it like a debt repaid." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "SHAMAN" },
      text = "The Darkspear knew the spirits long before the orcs found their way back to them. Teach me a little of the island ways while I teach you the totems." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "SHAMAN" },
      text = "The Earth Mother's children make patient shamans. The elements are slow to trust, and you're slower still, which suits them." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" }, place = "replace",
      text = "Let the wolf go and sit with me. The spirits lend you that shape; they don't give it." },
  },
  react = {
    { id = "r_wolf", on = "form", when = { form = "ghostwolf" }, text = "The wolf runs well in you. Don't run so far you forget the way back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "You don't command the elements; you ask, and you listen when they answer. Most forget the second part." },
        { id = "l_young", when = { class = "SHAMAN", maxLevel = 20 }, text = "The earth answered you first, didn't it? It answers everyone first, being the most patient. Fire will make you wait, and then it'll make you sorry." },
        { id = "l_veteran", when = { class = "SHAMAN", minLevel = 45 }, text = "The elements know your voice now, and they come quicker for you than they do for me. Be humble about it, because they can still decide to stop." },
        { id = "l_other", when = { ["not"] = { class = "SHAMAN" } }, text = "You don't walk with the spirits, but they see you all the same. Be kind to the land where you tread, and they'll remember it." },
      },
      again = {
        { id = "a_again", text = "What else would you ask?" },
        { id = "a_again2", text = "The fire's still burning; speak while it listens." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "What should I be practising?", next = "practise", when = { class = "SHAMAN" } },
        { text = "Should a shaman ask the elements, or command them?", next = "command", when = { class = "SHAMAN", minLevel = 10 } },
        { text = "Do you ever hear the elements angry?", next = "angry" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Your totems: where you plant them, and when. A shaman who drops them anywhere is only decorating the battlefield." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Listen to the earth before you strike with lightning. The quiet spells keep you alive long enough to use the loud ones." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to call a fallen friend back from the edge with the spirits' help. It costs them something to give, so never ask it lightly." },
      },
      choices = {
        { text = "Which element is strongest?", next = "practise_elem" },
        { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    practise_elem = {
      lines = { { id = "pe_default", text = "None of them, and all of them, depending on the hour and the place. In the desert you ask the water for nothing, and in a storm you ask the air for nothing more than it's already doing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    command = {
      big = true,
      lines = { { id = "c_default", text = "Ask. The orcs learned what commanding brings when their warlocks turned from the spirits to the demons, and their old world withered for it. A shaman who commands is only a warlock who hasn't met the right demon yet." } },
      choices = {
        { text = "I ask. The elements are partners, not servants.", next = "BACK", fx = { align = { honor = 1, order = -1 }, trait = { patient = 1 } } },
        { text = "Sometimes the world needs a firm hand, even the elements.", next = "BACK", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
        { text = "What happened to the orcs' old world?", next = "command_draenor" },
      },
    },
    command_draenor = {
      lines = { { id = "cd_default", text = "Their warlocks drank from the demons and bled the land to feed the spells, and the spirits fled them in grief. Thrall brought the spirits back to the orcs here, but the old world is red dust now, and it won't grow again." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    angry = {
      lines = { { id = "an_default", text = "Often. The earth grumbles where miners have dug too greedily, and fire is never calm, which is its nature. Anger isn't the danger, though; silence is, because an element that won't answer has stopped listening." } },
      choices = {
        { text = "I'll listen for the silence, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The spirits speak, and so do the people who come to hear them. These are things I can tell you of." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "The elements sit calm around you today, which tells me you can be trusted with more than most." },
    },
    _none = { { id = "t_none", text = "The spirits have said nothing to me of that." } },
    background = { { id = "t_bg", text = "The spirits woke me one morning by shaking the tent down around my ears. I took the hint." } },
    advice = { { id = "t_ad", text = "Thank the water when you drink it. It sounds foolish until the day there isn't any." } },
  },
}

P:Pool {
  -- Faction-neutral: night elf druids for the Alliance, tauren for the Horde, Skyborne on
  -- both sides.
  id = "trainer_druid", role = "trainer", subtitle = "druid trainer", tier = "service",
  greetings = {
    { id = "g_grove", text = "Walk softly. Now, what will you learn?" },
    { id = "g_vet", when = { class = "DRUID", minLevel = 40 }, text = "Back in your own shape, I see. Sit, and tell me what the wild has been saying." },
  },
  notice = {
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "DRUID" },
      text = "Your people's druids are few, I hear, and look to the elements before the moon. Tell me of that sometime, and I'll teach you this in trade." },
    { id = "n_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "A good cat: low, quiet, patient. Change back, though; we talk better with mouths that make words." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "Mind the lanterns. Every new bear knocks over a lantern." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "DRUID" },
      text = "Your people's druids slept in the Dream for centuries while the Sentinels kept the world. Now you're awake, and the world is a great deal harder to balance than the stories promised." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "Hamuul brought the night elves' teaching to your people, and you're the proof that it took. The Earth Mother and the Circle aren't so far apart as some would like." },
    { id = "n_travel", cat = "form", when = { form = "travel" }, place = "replace",
      text = "Off the four legs, please, before you trample my seedlings. A druid in a hurry has forgotten the point." },
    { id = "n_moonkin", cat = "form", when = { form = "moonkin" }, place = "replace",
      text = "A moonkin, in my grove! Sit, if you can work out how, and please don't hoot during the lesson." },
  },
  react = {
    { id = "r_shift", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "There it is. Feel how the shape fits, and then feel how much you want to stay in it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Balance isn't standing still. It's leaning one way and then the other and never quite falling." },
        { id = "l_young", when = { class = "DRUID", maxLevel = 20 }, text = "You still think of the bear as a costume. It isn't; it's a conversation, and the bear has opinions." },
        { id = "l_veteran", when = { class = "DRUID", minLevel = 45 }, text = "You've walked in more shapes than most of the Circle have. Remember which one you were born in." },
        { id = "l_other", when = { ["not"] = { class = "DRUID" } }, text = "You're not of the Circle, but you walk in the wild like the rest of us. Leave it as you found it, and we'll get along." },
      },
      again = {
        { id = "a_again", text = "What else stirs in you?" },
        { id = "a_again2", text = "Go on; the grove has time." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What should I be practising?", next = "practise", when = { class = "DRUID" } },
        { text = "Should the wild be kept from people, or shared with them?", next = "wild", when = { class = "DRUID", minLevel = 10 } },
        { text = "Elune or the Earth Mother: whom do druids serve?", next = "elune", when = { class = "DRUID" } },
        { text = "Do you ever want to stay in a shape?", next = "stay" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Shifting, until you can do it without thinking, and then until you can do it while thinking. Knowing when to be the bear is worth more than the bear." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Heal yourself between fights, not in the middle of them. A young druid trying to be everything at once ends up being nothing for long enough to fall over." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to be the one the others forget is there: a heal here, roots there, a bear when the line breaks. The best druids are only noticed once they're gone." },
      },
      choices = {
        { text = "Which shape should I favour?", next = "practise_shape" },
        { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    practise_shape = {
      lines = { { id = "ps_default", text = "The one the moment needs, which is never the one you like best. A druid with a favourite shape is halfway to being a beast with a memory of something else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wild = {
      big = true,
      lines = { { id = "w_default", text = "The Circle argues it every year in Moonglade. Some say the wild must be walled off from axes and plows, and others that people are part of it and must be taught to take gently; I've lived long enough to think both are right, which pleases nobody." } },
      choices = {
        { text = "The wild must be protected, even from us.", next = "BACK", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "People belong in the balance. Teach them; don't wall them out.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Who wins those arguments?", next = "wild_who" },
      },
    },
    wild_who = {
      lines = { { id = "ww_default", text = "Nobody wins, which is how the Circle likes it. Remulos listens and says very little, and the argument carries on the following year." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    elune = {
      lines = {
        { id = "e_default", text = "The night elves pray to Elune and the tauren to the Earth Mother, and both bring their druids to Moonglade. Malfurion taught the first druids, and he never asked whom they prayed to, only whether they listened." },
        { id = "e_skyborne", when = { race = "Skyborne" }, text = "Your own people favour the elements over the moon, I hear. The Circle will take you anyway; it has never asked a druid whom they pray to, only whether they listen." },
      },
      choices = {
        { text = "I listen to all of them.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Every winter I want to be the bear and sleep, and every spring I'm glad I wasn't. Some who stayed too long in a shape forgot how to come back, and the Circle doesn't speak of them." } },
      choices = {
        { text = "I'll keep the way back in mind.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The wild carries word on the wind, and the Circle carries the rest. Ask of these, and I'll tell you what I've learned." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The wild is patient with you, and I'm trying to be. Ask one of these, and listen to the answer." },
    },
    _none = { { id = "t_none", text = "The wild has not shown me that. Perhaps it will show you." } },
    background = { { id = "t_bg", text = "A stag let me touch its antlers when I was a child, and the druid who saw it took me in that same night." } },
    advice = { { id = "t_ad", text = "Rest in the wild now and then, not just near it. A bed of moss teaches more than a bed of straw." } },
  },
}

P:Pool {
  -- Faction-neutral: rogues of every people, Skyborne included.
  id = "trainer_rogue", role = "trainer", subtitle = "rogue trainer", tier = "service",
  greetings = {
    { id = "g_whisper", text = "Keep your voice down. What do you want to learn?" },
    { id = "g_vet", when = { class = "ROGUE", minLevel = 40 }, text = "You came in by the door this time. Getting sentimental?" },
  },
  notice = {
    { id = "n_stealth", cat = "class", when = { stealthed = true }, place = "replace",
      text = "I saw you come in, and if I can see you, so can everyone else. Again." },
    { id = "n_plate", cat = "gear", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank, and I don't train people who clank." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "ROGUE" },
      text = "A gnome who picks locks instead of building them. Your people would be appalled, and I'm delighted." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "ROGUE" },
      text = "A dwarf who wants to be quiet. Take your boots off first, and then we'll talk about the rest of you." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "ROGUE" },
      text = "You're taller than anyone in the room, and somehow I still lose sight of you. Teach me that one sometime." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "ROGUE" },
      text = "You don't breathe, which is half the craft done already. The other half is learning not to rattle." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "ROGUE" },
      text = "The hidden people, your lot call yourselves, or so I'm told. Let's find out whether the name was earned." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "ROGUE" },
      text = "Your people can melt into a shadow just by standing still. Most of my students would sell their own mothers for that." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Better. Now I can only hear you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Nobody remembers a quiet blade. That's the point of it." },
        { id = "l_young", when = { class = "ROGUE", maxLevel = 20 }, text = "You still look over your shoulder before you do anything shady. Stop it; nobody suspects the one who looks bored." },
        { id = "l_veteran", when = { class = "ROGUE", minLevel = 45 }, text = "I've heard your name from people who shouldn't know it. That's either very good work or very bad, and you'll have to tell me which." },
        { id = "l_other", when = { ["not"] = { class = "ROGUE" } }, text = "You're not one of mine, so I'll assume you're lost. The door's behind you, and I'd count your coins on the way out." },
      },
      again = {
        { id = "a_again", text = "What else? Quickly." },
        { id = "a_again2", text = "Go on. Nobody's listening; I checked." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "Who do you really work for?", next = "loyalty", when = { class = "ROGUE", minLevel = 10 } },
        { text = "Do you ever trust anyone?", next = "trust" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Waiting. You'll spend more time standing still in the dark than doing anything clever, and the ones who can't wait are the ones who get caught." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Picking locks now, and poisons once you're trusted with them. A rogue who can open a box is a rogue who never goes hungry." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to leave without a fight. Vanishing is the most expensive trick I teach, and the only one I'd keep if I had to choose." },
      },
      choices = {
        { text = "And if I'm caught?", next = "practise_caught" },
        { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    practise_caught = {
      lines = { { id = "pc_default", text = "Then you're caught, so stop being clever and start being fast. Blind the one who saw you and run, because pride heals quicker than a knife wound." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    loyalty = {
      big = true,
      lines = { { id = "lo_default", text = "Whoever's paying, some say, and they don't live long. The rest of us pick someone to be loyal to, a guild or a crown or a friend, and let coin fill in the gaps, because a blade for hire gets hired against you sooner or later." } },
      choices = {
        { text = "I keep faith with my own. Coin comes second.", next = "BACK", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Coin is honest. It never pretends to be anything else.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "So who do you work for?", next = "loyalty_who" },
      },
    },
    loyalty_who = {
      lines = { { id = "lw_default", text = "You asked, and that's the first lesson: never ask that question twice in the same room. The second is that I'd never tell you, so you've learned two things for the price of none." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    trust = {
      lines = { { id = "tr_default", text = "Everyone a little, and nobody all the way. Trust is like a lock: it's only good until somebody patient comes along." } },
      choices = {
        { text = "That sounds lonely.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Sounds sensible.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Information is the only coin that's worth more after you've spent it. Here's what I can afford to give away." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've kept your mouth shut when it counted, so I'll open mine a little." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Everything I know has a price, and you can't afford most of it, but these you can have." },
    },
    _none = { { id = "t_none", text = "If I knew, it'd cost you. I don't, so it won't." } },
    background = { { id = "t_bg", text = "I'll tell you where I came from when you tell me where you hid the last thing you stole." } },
    advice = { { id = "t_ad", text = "Never be the most interesting person in the room. That's where the knives go." } },
  },
}

P:Pool {
  -- Faction-neutral: warriors of every people.
  id = "trainer_warrior", role = "trainer", subtitle = "warrior trainer", tier = "service",
  greetings = {
    { id = "g_stance", text = "Feet apart, shield up. Now, what do you want?" },
    { id = "g_vet", when = { class = "WARRIOR", minLevel = 40 }, text = "Still standing, I see. Good; standing's most of the job." },
  },
  notice = {
    { id = "n_dented", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Good, you've been hit. Now tell me why you got hit." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "WARRIOR" },
      text = "Short reach, quick feet. Everyone underestimates a small warrior, once." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "WARRIOR" },
      text = "A Skyborne with a blade. I hear your people kept a guard of their own up there in the wind, so show me what they taught you, and I'll show you what they didn't." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "WARRIOR" },
      text = "You're the biggest student I've had this season, and the biggest ones always think they can skip the footwork. You can't." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "You don't feel the bruises any more, do you? That makes you brave and it makes you careless, so I'll be the one who remembers pain for you." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "WARRIOR" },
      text = "Most of your people leave the blade to the Sentinels, and yet here you are. Good; patience is half of this, and you've centuries of it." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "WARRIOR" },
      text = "Long arms and a temper; that's a fine start. Now learn to keep the temper for when it's useful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Anyone can swing a sword. A warrior knows when not to." },
        { id = "l_young", when = { class = "WARRIOR", maxLevel = 20 }, text = "Your shield arm's dropping; I can see it from here. Keep it up, and one day it'll stop feeling heavy." },
        { id = "l_veteran", when = { class = "WARRIOR", minLevel = 45 }, text = "You've stood in front of things I've only heard about in the barracks. I can still teach you, but I'll be learning back." },
        { id = "l_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You're no warrior, but you'll get hit like one sooner or later. Keep your feet under you and your back to something solid." },
      },
      again = {
        { id = "a_again", text = "Something else, or back to the drills?" },
        { id = "a_again2", text = "Speak up; I've been shouted at by sergeants half my life." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "When should a warrior refuse a fight?", next = "refuse", when = { class = "WARRIOR", minLevel = 10 } },
        { text = "Do you ever miss the battlefield?", next = "miss" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Footwork, until you're sick of it. A warrior standing in the right place gets hit half as often and hits twice as hard." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn when your rage comes and when it goes. Young warriors spend it all in the first breath and then stand about wondering why the wolf's still alive." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to hold the beast's eyes on you while your friends do their work. Anyone can kill something; keeping something that big looking at you takes nerve." },
      },
      choices = {
        { text = "And when I'm outnumbered?", next = "practise_many" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_many = {
      lines = { { id = "pm_default", text = "Put your back to a wall and make them come one at a time. If there's no wall, find a doorway, and if there's no doorway, you made the mistake an hour ago." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    refuse = {
      big = true,
      lines = { { id = "r_default", text = "When the fight's only for your name. Glory's a fine thing to have and a poor thing to chase, and I've buried more glory-chasers than I can count; fight for the ones behind you, and the glory finds you anyway, or it doesn't and you're still alive." } },
      choices = {
        { text = "I fight for the ones behind me.", next = "BACK", fx = { align = { order = 1, honor = 1 }, trait = { stern = 1 } } },
        { text = "A warrior's name is worth fighting for.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Have you ever run from a fight?", next = "refuse_ran" },
      },
    },
    refuse_ran = {
      lines = { { id = "rr_default", text = "Once, from a fight I couldn't win, with two wounded recruits on my back. Somebody called me a coward for it, and the recruits called me nothing at all, because they lived to call me whatever they liked." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    miss = {
      lines = { { id = "mi_default", text = "Every time a student gets it right, and every time one gets it wrong. Teaching's the same fight, only slower, and I'm on both sides of it." } },
      choices = {
        { text = "That's a good way to see it.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Soldiers talk in the training yard between bruises, and I listen. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Talk comes after you've learned to keep your guard up, so take one of these and get back to the drills." },
    },
    _none = { { id = "t_none", text = "Can I hit it? If not, then I don't know about it." } },
    background = { { id = "t_bg", text = "I held a line once that wasn't meant to hold. I've been teaching people how ever since, because I'm still not sure how I did it." } },
    advice = { { id = "t_ad", text = "Eat, sleep and mend your armour, in that order. Glory comes fourth, a long way behind." } },
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
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren on a wind rider. The beasts grumble about it, but they've carried heavier, mostly." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Wind riders don't like the smell of the dead, so sit still and don't take it to heart." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear always want to fly low over the sea to look at it. The rider decides the height, not you." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks. Wind riders don't carry the fel, and neither do I." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Quick on the ground, druid, but nothing on four legs beats a wind rider over open country." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "Your ghost wolf can't fly, shaman, so let it go and climb on." },
  },
  lines = {
    { id = "l_default", text = "Hold the harness, not the rider's neck. It bites." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Your beast stays below and finds you at the other end; they always do. Wind riders won't share a saddle with one." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "You grip the harness like it's an axe haft. Loosen up, or the rider will shake you loose for the fun of it." },
  },
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
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Keep that imp off the road where the farmers can see it. Last week a carter ran his horse into a ditch over one." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "That thing behind you has no face, and I'd thank you to keep it that way. Walk it on the far side of the road." },
    { id = "n_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Eyes front when one of those walks by, they told us at muster. I'll keep mine on you instead, if it's all the same." },
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Good-looking animal. Keep {pet} out of the sheep pens and we'll get on fine." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Walk on two legs past the farms, druid. The dogs here have never seen a bear stand still, and they won't start today." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You went past me like a cat with somewhere to be. Slow down at the bridges; the carts can't stop quick." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You'll be one of the elves out of the sky. The sergeant read us a notice about your people; it was short, and it said to be polite." },
    { id = "n_dwarf_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "Totems on a dwarf's belt. The captain says you're on our side, and the captain's never wrong, so on you go." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Show yourself!" },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Hold! Oh, it's a priest. You might warn a man first." },
  },
  lines = {
    { id = "l_default", text = "Report anything strange to the nearest officer. Strange gets worse if you wait." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "A fighter, good. If you're on this road anyway, keep an eye out for bandits; there are never enough of us to be everywhere at once." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "I'll not ask what your trade is. I'll just remember your face, and you'll remember that I did." },
    { id = "l_paladin", when = { class = "PALADIN" }, text = "Light be with you, paladin. Folk out here sleep easier knowing the Silver Hand still walks the roads." },
    { id = "l_mage", when = { class = "MAGE" }, text = "If you're going to throw fire about, throw it away from the crops. The last mage through here cost a farmer his barley." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "The wolves have been bad along this road all season. If you're hunting anyway, take a few for us." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "I know what you are, and so long as you keep it leashed, I don't have to do anything about it." },
  },
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
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Keep your demon on a short chain. The Warchief allows your kind, and I allow nothing I don't have to." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "You came through the camp wolf-shaped again, shaman. The grunts keep swinging at you, and one day one of them will connect." },
    { id = "n_claws", cat = "form", when = { form = { "bear", "cat" } },
      text = "A druid in claws. Walk on two legs past the wolf pens before something in there gets ideas." },
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} has better manners than half the grunts. Keep it that way." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Sky-elf. The tauren vouch for you, and I trust the tauren, so I'll trust you a little." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. You're Horde by the Warchief's word and I'll stand beside you, but don't ask me to like the smell." },
    { id = "n_troll_lock", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A Darkspear with demon-stink on them. I thought Vol'jin's people knew better than that." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I can smell you, so come out." } },
  lines = {
    { id = "l_default", text = "If you're looking for a fight, there are better places than my post. Ask anyone." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Good, another warrior. If trouble comes through this gate, you'll stand with us." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "I don't know your face, and I don't like faces I don't know. Walk where I can see you." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "The spirits are restless past the camp, shaman. The scouts say the wind's been wrong all week." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Hunters bring the best news, since you go where the scouts don't. Seen anything moving out there?" },
    { id = "l_mage", when = { class = "MAGE" }, text = "Keep the fire in your hands and out of the supply tents, mage." },
  },
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
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You smell like the Slaughtered Lamb's cellar. The Watch knows what goes on down there, and we know who goes in." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks behind you, not beside the children, and nowhere near the Cathedral steps." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know the Old Town walk when I see it. SI:7 would like you, and the Stockade would like you more." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Druid, there's a rule about bears in the Trade District, and I've just made it." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Darnassus is a long way off. If you miss the trees, the Park's out past the Mage Quarter; it's not much, but the squirrels are friendly." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Gnomeregan folk are welcome by the King's own order. Just keep the explosions down to a reasonable number." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You'll be one of the Skyborne. The court says your people are friends of Stormwind now, so you'll get no trouble from the Watch, only stares." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Stealth inside the city walls? Show yourself, or I call the Watch." },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Light preserve us! Oh, you're one of the Cathedral's lot. Carry on, then, but go gently; you'll frighten the canal folk." },
  },
  lines = {
    { id = "l_default", text = "Trade District for shops, Cathedral Square for the Light, Old Town for trouble. The Keep's up the hill, and they won't let you in to see the Highlord without good reason." },
    { id = "l_rebuilt", text = "Masons rebuilt every stone you're standing on after the orcs burned it. Spare a thought for them, if you ever see one." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "The barracks are in Old Town if you need training, and the Pig and Whistle is next door if you need forgetting." },
    { id = "l_mage", when = { class = "MAGE" }, text = "The Mage Quarter's west, past the canals. Follow the smell of singed hair and you can't miss it." },
    { id = "l_paladin", when = { class = "PALADIN" }, text = "Cathedral Square's where the Silver Hand gathers. Say a word for the Watch while you're up there; we could use it." },
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
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Tinker Town's down the way, and every gnome in it is still looking for a way home. I hope ye find it, truly I do." },
    { id = "n_dwarf_paladin", cat = "class", when = { race = "Dwarf", class = "PALADIN" },
      text = "Silver Hand, is it? The Mystic Ward's where ye'll find yer teachers, past the priests and their candles." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ye reek o' brimstone. Yer lot gather in the Forlorn Cavern, and the guard keeps a close eye on that hole." },
    { id = "n_hunter", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A mountaineer's rifle, I see. The hunters train in the Hall of Arms, and they'll want a look at it." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear, in Ironforge! Change back afore someone takes ye for supper." },
    { id = "n_gnome_mage", cat = "class", when = { race = "Gnome", class = "MAGE" },
      text = "A gnome mage. Yer teachers are in the Hall of Mysteries, what's left o' them after Gnomeregan." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about under the mountain? Out wi' ye, where I can see." } },
  lines = {
    { id = "l_default", text = "Great Forge in the middle, King Magni up in the throne room, the tram to Stormwind down the Tinker Town way. Ye'll not get lost, it's a circle." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Hall of Arms for the fightin' trades, through the Military Ward. Ye'll hear it afore ye find it." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "Keep yer hands where the mountain can see them. We've a long memory under here, and short tempers." },
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
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Sheathe your arcane arts beneath our branches, stranger. The Highborne's hunger for that power drowned a continent, and the Sentinels have not forgotten." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Fel, in Darnassus? Step with care; the Sentinels have killed demons before, and they will not ask whose leash it wears." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "That creature is not welcome under Teldrassil's boughs. Send it away, or I will." },
    { id = "n_druid", cat = "class", when = { race = "NightElf", class = "DRUID" },
      text = "The Cenarion Enclave lies to the east, druid. The archdruid will want to see how you have grown." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Mind the bridges in that shape. They were grown for lighter feet." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "The Light is not Elune, paladin, but the priestesses will make you welcome at the Temple all the same." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The shadows here belong to the Sentinels. Step out." } },
  lines = {
    { id = "l_default", text = "The Temple of the Moon for the priestesses, the Cenarion Enclave for the druids. Walk softly; this tree is young." },
    { id = "l_warrior", when = { race = "NightElf", class = "WARRIOR" }, text = "Our warriors train on the Warrior's Terrace. The Sentinels will want to measure you, so be ready." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Hunters gather at the Cenarion Enclave with the druids. Keep your companion close on the bridges." },
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
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Your kind gather in the Cleft of Shadow, and the Warchief tolerates it. I would not, if this were my city." },
    { id = "n_shaman", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "Shaman. Thrall's own teachers walked the Valley of Wisdom, so go and honour them." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "Ghost wolf at the gate! Walk on your own feet in the Warchief's city, shaman." },
    { id = "n_troll_hunter", cat = "class", when = { race = "Troll", class = "HUNTER" },
      text = "A Darkspear hunter. Your people tamed the raptors of the islands and kept most of their fingers, which impresses me more than I'll say." },
    { id = "n_tauren_druid", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "A tauren druid, a long way from the bluffs. Your claws are welcome here, but keep them off the wolves." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Sky-elf. You came to the Horde through the Earthen Ring, and Thrall trusts the Ring, so the gate's open to you." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Skulking in the Warchief's city? Show yourself." } },
  lines = {
    { id = "l_default", text = "Valley of Strength by the gate, the Drag for anything crooked, and Grommash Hold for the Warchief, but don't bother him." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Warriors to the Valley of Honor. The weak train somewhere else, I'm told, but I've never found where." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "Rogues gather in the Cleft of Shadow with the other things that crawl. Don't make me come down there to find you." },
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
    { id = "n_druid", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "Elder Rise is where the druids gather, under Hamuul's eye. Go gently; the elders there notice everything." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Spirit Rise keeps the shamans. Climb it slowly, because the spirits there are old and do not like to be hurried." },
    { id = "n_hunter", cat = "class", when = { race = "Tauren", class = "HUNTER" },
      text = "Hunter Rise is above the lifts. The hunters there will judge your companion before they judge you." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, on the bluffs. Your apothecaries keep to the Pools of Vision beneath Spirit Rise, if you are looking for your own." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, be welcome. Watch yourself on the lifts; your people always lean out to look." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear on the bridges! The kodo will not like it, and neither will the bridges." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks behind you on the bluffs, warlock, and it does not touch the totems." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hiding on the bluffs? There is nowhere to fall but down, so come out." } },
  lines = {
    { id = "l_default", text = "The rises and the bridges between them. Mind the edges; the wind does not ask permission." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "The Earth Mother does not love the fel. Do your work below the bluffs, if you must do it at all." },
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
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "The Magic Quarter's warlocks keep their demons on short chains. You'll do the same, down here." },
    { id = "n_mage", cat = "class", when = { race = "Scourge", class = "MAGE" },
      text = "Half the Magic Quarter studied in Dalaran before the plague. You'll find them there, still arguing about it." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "The Rogues' Quarter is yours. Don't think we haven't noticed you counting the guards." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tauren. You'll be stooping in the tunnels, so mind the drips; they aren't water." },
    { id = "n_warrior", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "War Quarter for you, soldier. Some of the Deathguard in there wore Lordaeron's colours too, once." },
    { id = "n_beast", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Animals hate this place. Keep yours close; the bats down here have opinions." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Change back, druid. Bears down here make the abominations nervous, and you don't want them nervous." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "We see better in the dark than you think, so out." } },
  lines = {
    { id = "l_default", text = "The Apothecarium, the Magic Quarter, the War Quarter and the Rogues' Quarter, all in a ring around the Trade Quarter. The Banshee Queen keeps the Royal Quarter, and you don't." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "Shamans don't come down here much. The elements are a long way from the Undercity, and they seem to like it that way." },
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
