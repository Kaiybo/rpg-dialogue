-- The southern and eastern Barrens away from the towns: a prisoner in Northwatch Hold and a warlock alone by his fire. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gilthares", id = TODO_NPC("Gilthares Firebough"), name = "Gilthares Firebough",
  bible = "bibles/gilthares.md", role = "questgiver", tier = "quest",
  temper = { "anxious" }, values = { "loyal", "honest" },
  notices = { "stealth", "kit" },
  impression = {
    first = "He is only a deckhand who washed up on the wrong beach.",
    third = "{name} found Gilthares Firebough, a privateer deckhand held prisoner in Northwatch Hold.",
  },

  greetings = {
    { id = "g_hush", text = "Quietly, please, because the guards come round every few minutes." },
    { id = "g_escort", when = { questActive = TODO_QUEST("Free From the Hold") }, text = "Lead on, and quickly, before they notice the empty cell. Ratchet is south down the coast, and I'll follow as close as your shadow." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You got all the way in here without the guards seeing you, which means you could get me out the same way, couldn't you?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you fought your way in, and the way out won't be any easier. Are you sure you're fit for it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Keep your voice down, please, because the guards don't like me talking. My name's Gilthares Firebough, and I crewed for Captain Brightsun out of Ratchet until Northwatch's guns put our ship on the rocks." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You wear Alliance colours, so I suppose you'll be calling the guards on me. Before you do, hear me out, because I'm no soldier, only a deckhand who washed up on the wrong beach." },
        { id = "h_before", when = { faction = "Horde", questBefore = TODO_QUEST("Free From the Hold") },
          text = "You're Horde, and you got this far inside, so you must be good at this. Please, I've been in this cell for weeks, and if you can get me as far as Ratchet, Captain Brightsun will see you rewarded." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, though, because I can hear boots on the stair." },
        { id = "h_again2", text = "Go on, I'm listening. It's not as if I have anywhere to be." },
      },
      choices = {
        { text = "Why are they holding you?", next = "why" },
        { text = "What was your ship carrying?", next = "cargo" },
        { text = "Who is Captain Brightsun?", next = "captain" },
        { text = "I'll get you out of here.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "I should call the guards.", next = "guards", when = { faction = "Alliance" } },
        { text = "What's Northwatch like from the inside?", next = "inside" },
        { text = "How did you come to crew for the privateers?", next = "crew" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Our ship took a broadside from the Northwatch guns as we came up the coast, and I washed ashore half drowned right under their walls. They've decided I'm a Horde spy, which would be flattering if I knew a single thing worth spying on." } },
      choices = {
        { text = "Are you a spy?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "wh2_default", text = "I'm a deckhand, and I can barely spot the next wave coming, never mind a secret. Northwatch fires on anything that sails too near, Horde or neutral, and if they let me go they'd have to admit they sank a Ratchet ship for nothing." } },
      choices = {
        { text = "Northwatch has every right to guard its own coast.", next = "BACK", reply = "A right to guard it, yes, but not to sink every hull that drifts within range of their guns. I hope you never find yourself on the wrong end of that right, friend.", fx = { align = { order = 1 } } },
        { text = "Sinking a neutral ship is piracy, whatever the banner.", next = "BACK", reply = "Thank you for saying it out loud, because nobody in this place will. Piracy in a tabard is still piracy, and someday someone from Theramore will have to admit it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cargo = {
      lines = { { id = "ca_default", text = "Moonshine, mostly, meant for the thirsty half of Ratchet, which is most of Ratchet. There were a few crates the captain told me not to open, as well, so I didn't." } },
      choices = {
        { text = "You must know what was in the crates you didn't open.", next = "cargo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cargo2 = {
      lines = { { id = "ca2_default", text = "I didn't open them, did I? Though if the Northwatch quartermaster has been drinking well this month, I'd say we know where the rest of our cargo went." } },
      choices = { { text = "Something else, Gilthares.", next = "BACK" } },
    },
    captain = {
      lines = { { id = "cp_default", text = "Thalo'thas Brightsun, captain of the Thalo'dan Privateers, and the best captain on this coast if you ask his crew. He holds a grudge longer than anyone I've ever sailed with, so Northwatch will be hearing from him again, whether I'm in this cell or not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guards = {
      big = true,
      lines = { { id = "gu_default", text = "You could, and they'd thank you for it, and I'd sit in this cell until Theramore remembers I exist, which could be years. All I ask is that you think on whether you'd want the same, if your ship had gone down on the wrong beach." } },
      choices = {
        { text = "Northwatch has its reasons. I won't interfere.", next = "BACK", reply = "Then I'll go on counting the stones in this wall, I suppose. I can't blame you for it, though I'd hoped the sea had taught you more mercy than it taught them.", fx = { align = { order = 1 } } },
        { text = "You're no spy. I won't call anyone.", next = "BACK", reply = "You've a kinder heart than anyone I've met since that ship went down. I won't forget it, and if I ever see the docks of Ratchet again, I'll tell them a stranger kept faith.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside = {
      lines = { { id = "in_default", text = "Damp, crowded and angry. The soldiers here were sent from Theramore to watch the coast, and they've been watching it so long they shoot at gulls. Their commander talks about the Horde as if Orgrimmar were going to march down the beach tomorrow." } },
      choices = {
        { text = "Who commands Northwatch?", next = "inside2" },
        { text = "With Orgrimmar so close, can you blame them?", next = "inside2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside2 = {
      lines = { { id = "in2_default", text = "Captain Fairmount, and she's not a cruel woman, only a frightened one with guns. I hear the soldiers grumble that Lady Proudmoore wants peace with Thrall and their captain wants none of it. If that's so, then I'm a prisoner of the argument, not the war." } },
      choices = { { text = "A prisoner of the argument. Something else.", next = "BACK" } },
    },
    crew = {
      lines = { { id = "cr_default", text = "I needed work, and Captain Brightsun needed a deckhand who could climb rigging and keep his mouth shut. The Thalo'dan sail for coin, not for any banner, and I liked that, after a childhood of being told which flag to love." } },
      choices = {
        { text = "Where did you grow up?", next = "crew2" },
        { text = "Privateers are pirates with paperwork.", next = "crew2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew2 = {
      lines = { { id = "cr2_default", text = "Far to the north, across the sea, and that's all I'll say about it in a cell. The captain's an elf, as I am, which is part of why I trust him, and why he'll be very unhappy when he hears where they've kept me." } },
      choices = {
        { text = "I'm Alliance, but I've no quarrel with a deckhand.", next = "BACK", reply = "That's more than the guards have managed. Thank you, truly.", when = { faction = "Alliance" } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've hauled rope on Captain Brightsun's decks for longer than I care to count, and I was good at it, right up until the ship sank." } },
    advice = { { id = "tp_ad", text = "Never sail within sight of Northwatch's walls. I'd have liked someone to tell me that." } },
    _none = { { id = "tp_none", text = "I've been in a cell for weeks, friend. I don't know much of anything anymore." } },
  },
}

P:NPC {
  key = "doan_karhan", id = TODO_NPC("Doan Karhan"), name = "Doan Karhan",
  bible = "bibles/doan_karhan.md", role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "cunning", "patient" },
  notices = { "fel", "light" },
  impression = {
    first = "He would rather be lonely than owned.",
    third = "{name} met Doan Karhan, a solitary human warlock camped in the Barrens who seeks the scattered Orb of Soran'ruk.",
  },

  greetings = {
    { id = "g_fire", text = "Sit on that side of the fire, if you would, because this side is spoken for." },
    { id = "g_orb", when = { questActive = TODO_QUEST("The Orb of Soran'ruk") }, text = "You've come back. Show me what you've found, and we'll see how close the orb is to being whole." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You came at night, which is when the circle is busiest, so walk carefully and say nothing to it." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still on your own side of the fire. I'm glad one of my visitors remembers the rule." },
  },

  notice = {
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = true },
      text = "Your servant is restless, and so is mine. Keep yours on your side of the fire, if you please." },
    { id = "n_light", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "You carry the Light like a lantern, and lanterns draw things out of the dark. Stand well back from my circle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Few walk this far from the road without a reason, and fewer still find my fire on purpose. I am Doan Karhan, and if you are not a warlock, I'll ask you to keep your distance from the circle." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "One of us, and a long way from your masters. You've come about the orb, I expect, or you will once you've heard of it." },
        { id = "h_low", when = { class = "WARLOCK", maxLevel = 19 },
          text = "One of us, though not yet far enough along for what I'd ask of you. Come back when your voidwalker obeys you without being told twice, and we'll talk about the orb." },
        { id = "h_orb", when = { questActive = TODO_QUEST("The Orb of Soran'ruk") },
          text = "I need three small fragments from the Twilight acolytes in Blackfathom Deeps, and the large one from the voidwalkers in Shadowfang Keep. Bring them all, and I'll bind them into something worth carrying." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Orb of Soran'ruk") },
          text = "You carry the orb now, and I can hear it from here, humming like a hive. Let it feed your shadow, but don't let it start choosing what you cast." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren at my fire. Your people look at me the way they'd look at a sick kodo, with pity and from a long way off, so say what you came to say." },
      },
      again = {
        { id = "h_again", text = "Something more? The fire will last a while yet, even if my patience won't." },
        { id = "h_again2", text = "Ask, then. The hyenas have gone quiet, so we have a little while." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Go on, since you've come all this way. I don't get many visitors who know what they're looking at." },
      },
      choices = {
        { text = "What are you working on out here?", next = "orb" },
        { text = "Why live out here alone?", next = "alone" },
        { text = "Something is bound inside that circle.", next = "circle" },
        { text = "How hard are the fragments to take, and who bleeds for them?", next = "fragments", when = { class = "WARLOCK" } },
        { text = "I'll find your fragments. Whatever it takes.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What would the orb do for me, exactly?", next = "use", when = { class = "WARLOCK" } },
        { text = "My voidwalker keeps drifting toward your orb case.", next = "void", when = { class = "WARLOCK", pet = { family = "Voidwalker" } } },
        { text = "You hoard the Legion's tools, Doan.", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "An orb's only a focus. Mages use them too.", next = "mage", when = { class = "MAGE" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    orb = {
      lines = { { id = "or_default", text = "An old focus for a warlock's power, broken long ago into fragments that have wandered off into dark places on both continents. Mended, it steadies the hand and feeds the shadow, and I've wanted one whole for longer than you've been alive." } },
      choices = {
        { text = "Where are the fragments now?", next = "orb2" },
        { text = "Who was Soran'ruk?", next = "orb3" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    orb2 = {
      lines = { { id = "or2_default", text = "The small ones are with the Twilight's Hammer cultists in Blackfathom Deeps, who carry them without knowing what they are, and the largest is with the voidwalkers that serve Arugal in Shadowfang Keep. Both places are far from here, which is one reason I don't fetch them myself." } },
      choices = {
        { text = "And the other reason?", next = "orb2b" },
        { text = "Something else, Doan.", next = "BACK" },
      },
    },
    orb2b = {
      lines = { { id = "or2b_default", text = "I'm not as young as I was, and a man who studies the Legion's tools for as long as I have learns where his nerve runs out. Mine runs out somewhere around Arugal's front gate, and I'm not ashamed to say so." } },
      choices = { { text = "That's honest of you. Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    orb3 = {
      lines = { { id = "or3_default", text = "A warlock of the old Horde, or a demon, or a place, depending on which broken book you trust. Nobody remembers for certain, which tells you a good deal about how men like him end, and I've taken that lesson to heart." } },
      choices = { { text = "Then I'll try to be remembered better. Something else.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "al_default", text = "Because the Crossroads would set a grunt at my tent flap and Taurajo would stand in my light with sad eyes, and I prefer the hyenas. They at least are honest about what they want from me." } },
      choices = {
        { text = "The solitude must wear on you.", next = "alone2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    alone2 = {
      big = true,
      narr = "He turns a cracked shard over in his fingers without looking at it.",
      lines = { { id = "al2_default", text = "Solitude is the warlock's oldest companion, older than any imp, and the ones who can't bear it end up making friends of their demons, which never ends well. I would rather be lonely than owned." } },
      choices = {
        { text = "A power that needs that much solitude is one to fear.", next = "BACK", reply = "It should be feared, and the warlock who stops fearing it is already halfway lost. Keep that fear close, friend, because it's the only honest thing a demon ever teaches.", fx = { align = { light = 1 } } },
        { text = "Better alone and strong than crowded and weak.", next = "BACK", reply = "Strong, yes, and alone, which you'll find is a heavier coin than it looks. I chose it with my eyes open, and I'd advise you to do the same before you choose it too.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Back to the orb, then.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "It's a binding circle, freshly drawn, and it's the only reason the thing I spoke with last night went home again. Step around it, not over it, and we'll both sleep easier." } },
      choices = {
        { text = "What did you speak with?", next = "circle2" },
        { text = "I'll step around it. Something else.", next = "BACK" },
      },
    },
    circle2 = {
      lines = {
        { id = "ci2_default", text = "A minor thing of the Nether, about the size of a dog and twice as eager to please, which is always a bad sign. It told me where one of the fragments was, and then it asked for my name, and that was when I sent it home." },
        { id = "ci2_lock", when = { class = "WARLOCK" }, text = "A minor thing of the Nether that knew where one fragment had gone, and then asked my name in return. You know the rule as well as I do, warlock, so you know why it went home hungry." },
      },
      choices = {
        { text = "It wanted your name? Why?", next = "circle3" },
        { text = "Wise of you. Let's talk of something else.", next = "BACK" },
      },
    },
    circle3 = {
      lines = { { id = "ci3_default", text = "Because a name is a handle, and a demon that has your handle can call on you as easily as you call on it. The ones who give their names freely are the ones Gul'dan's council collected, and you can see how well that went for the orcs." } },
      choices = { { text = "Then I'll keep mine to myself. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    fragments = {
      lines = { { id = "fr_default", text = "The acolytes in Blackfathom wear theirs as charms, and it's easier to take one from a corpse than to argue them out of it. The voidwalkers in Shadowfang are another matter, because Arugal's servants guard their master's things the way a hound guards a bone." } },
      choices = {
        { text = "Why would Arugal keep voidwalkers?", next = "fragments2" },
        { text = "I know that keep. I walked out of its shadow.", next = "sfk_dead", when = { race = "Scourge" } },
        { text = "I'll manage, Doan. Let me ask something else.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Then I'll go now.", next = "BUSINESS" },
      },
    },
    fragments2 = {
      lines = { { id = "fr2_default", text = "Because he's a Dalaran wizard who reached for things outside his schooling and found them reaching back, which is a story I've heard more than once. He keeps them the way a drunk keeps bottles, and I'd not like to see what he's become now." } },
      choices = {
        { text = "That could be any warlock's story.", next = "BACK", reply = "It could, and it nearly was mine, which is why I'd rather send you than go. Take that as the compliment it is." },
        { text = "I'll bring you the large fragment.", next = "BUSINESS" },
      },
    },
    sfk_dead = {
      lines = { { id = "sd_default", text = "Then you know Silverpine better than I do, and you know what the worgen are. Your Dark Lady's people have no love for Arugal either, I hear, so you'll not mind taking something of his." } },
      choices = { { text = "None at all. What else should I know?", next = "BACK", fx = { affinity = 1 } } },
    },
    use = {
      lines = {
        { id = "us_default", text = "It steadies the hand that holds the shadow, and when the fight goes hard it gives back a little of what you've spent. More than that, it's proof you can gather something the Legion broke and make it whole, which is the whole of our art, if you think about it." },
        { id = "us_low", when = { maxLevel = 19 }, text = "Less than you'd hope, at the moment, because you'd not hold it steady yet. Come back when your voidwalker answers on the first word and I'll tell you the rest." },
      },
      choices = {
        { text = "Our art is mending what the Legion broke?", next = "use2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    use2 = {
      big = true,
      lines = { { id = "us2_default", text = "Taking what the Legion made and turning it on its makers, if you prefer that. The tools are theirs, the hands are ours, and the danger is always that one day you can't tell the two apart. So tell me which you're doing, warlock." } },
      choices = {
        { text = "Turning their tools on them. Nothing more.", next = "BACK", reply = "Good, and say it to yourself every time you lift the orb, because it will try to convince you otherwise. I say it every morning, and some mornings I even believe it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Taking power wherever I find it. Who made it doesn't matter.", next = "BACK", reply = "It matters to the orb, I promise you, though it'll serve you well enough for a while. I'll still mend it for you, because I said I would.", fx = { align = { light = -1 } } },
        { text = "Something else, Doan.", next = "BACK" },
      },
    },
    void = {
      lines = { { id = "vd_default", text = "It can smell the Void on my notes about Shadowfang, I expect, because the large fragment is carried by its own kind. Call it back to you, and don't let it touch my case, or I'll have to start the warding again." } },
      choices = { { text = "I'll keep it close. Something else.", next = "BACK" } },
    },
    light = {
      big = true,
      lines = { { id = "li_default", text = "I keep them out of the hands of the Twilight's Hammer and the Burning Blade, who'd use them far worse than I do. You can call that hoarding if it helps, but I notice nobody from your temple has come to collect them instead." } },
      choices = {
        { text = "Then hand them to the Church and be done with it.", next = "BACK", reply = "The Church would lock them in a vault and forget them, and in twenty years some clever acolyte would find the key. I'd rather keep my eye on them myself.", fx = { align = { order = 1 } } },
        { text = "Fair enough. Keep them from worse hands.", next = "BACK", reply = "That's more generous than I expected from you, and I'll take it. Stand back from the circle all the same.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mg_default", text = "Yours are glass and good intentions, and mine was made to hold something that doesn't want to be held. A Dalaran orb that cracks costs you a lesson, and one of these that cracks costs you a great deal more than that." } },
      choices = { { text = "Point taken. Let's talk about something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied where I could and left when I had to, and the Barrens asks no questions of a man with a fire and a circle." } },
    advice = { { id = "tp_ad", text = "Draw your circle before you need it, because afterwards is too late, and usually rather loud." } },
    burning_legion = { { id = "tp_legion", text = "Everything I study was made by the Legion or for it, and I've spent my life learning how to unmake their work. I don't expect them to thank me." } },
    _none = { { id = "tp_none", text = "That's nothing to me, I'm afraid. Ask at the Crossroads, where they like talking." } },
  },
}
