-- The Military Ward's Hall of Arms and Timberline Arms, and the Forlorn Cavern's rogues and fishermen.
-- Voices: bibles/wards_cavern.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Ulbrek Firehand: stable master in the Hall of Arms; gentle with beasts.
P:NPC {
  key = "if_ulbrek", id = TODO_NPC("Ulbrek Firehand"), name = "Ulbrek Firehand",
  bible = "bibles/wards_cavern.md", role = "stablemaster", tier = "service",
  communities = { "ironforge" }, temper = { "gentle" }, values = { "kind", "patient" },
  notices = { "pet" },

  impression = {
    first = "Ulbrek Firehand keeps the stables in the Hall of Arms and talks to the animals in his care more than he talks to people. He knows every beast in the stalls by name and temper.",
    third = "{name} met Ulbrek Firehand, the stable master of Ironforge's Hall of Arms.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, now; there's a bear sleepin' in the third stall, an' he's grumpy when he wakes." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, back again. Yer beasts are fed an' well, if ye've any wi' me." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "There's a fine beast at yer heel, an' it's been well fed, I can see. It trusts ye, which is more than most pets trust the ones who keep them." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Better than most dwarves remember their debts. A hunter's wolf came back from a fight wi' a singed tail an' wouldnae let a mage near it for a month, so be gentle an' they'll forgive ye." } },
      choices = {
        { text = "I'll be gentle, Ulbrek. The beasts deserve it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Beasts are beasts. They'll get over it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because it's no' from this world, an' every beast knows that the moment it catches the scent. I've seen a bear tear its stall apart tryin' tae get away from an imp, an' I'll no' see it again." } },
      choices = {
        { text = "I'll keep the creature far from your stables.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll learn to live with it, Ulbrek.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ulbrek Firehand, stable master. The hunters leave their companions wi' me when they've a new beast tae tame, an' I keep them fed an' brushed an' happy till they come back." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the stables! I'll ask ye no' tae frighten the beasts, for some o' them have seen a mage's fire an' they remember it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock at the stables! Keep yer creature well back, for the beasts can smell it, an' they dinnae like it one bit." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Keep yer voice low, mind." },
        { id = "h_again2", text = "Go on, the beasts don't mind ye." },
      },
      choices = {
        { text = "I'd like to see the stables.", next = "BUSINESS" },
        { text = "What beasts do you keep here?", next = "beasts" },
        { text = "Do the animals miss their hunters?", next = "miss" },
        { text = "Where can I find a ram to ride?", next = "rams" },
        { text = "Do the beasts really remember a mage's fire?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do the beasts hate a warlock's creature so?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Thank you, Ulbrek.", next = "END" },
      },
    },

    beasts = {
      lines = {
        { id = "be_default", text = "Bears from Dun Morogh, mostly, an' wolves an' a few cats, an' once a great crab from the Wetlands that pinched everyone who came near. The hunters tame all sorts, an' I've learned tae care for all sorts." },
      },
      choices = {
        { text = "What happened to the crab?", next = "beasts_crab" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_crab = {
      lines = {
        { id = "bc_default", text = "Its hunter came back for it, an' the two o' them went off tae Stranglethorn as happy as ye like. I still have the scar on my thumb, an' I'm fond o' it, in a strange way." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    miss = {
      lines = {
        { id = "mi_default", text = "Aye, they do, for a beast that's been tamed has given its heart tae one person. They eat less an' sleep more while they're waitin', an' when their hunter comes back, ye've never seen such joy." },
      },
      choices = {
        { text = "Then hunters shouldn't leave them behind at all.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A hunter needs the right beast for the hunt.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    rams = {
      lines = {
        { id = "ra_default", text = "No' here, for these stalls are for hunters' companions. Ye'll want the Amberstills' ranch out in Dun Morogh, east o' Kharanos, where they breed the finest rams in the mountains." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a hunter once, till a wendigo in the Grizzled Den taught me I'd rather tend beasts than chase them." } },
    advice = { { id = "tp_ad", text = "Feed yer companion before ye sit down tae yer own supper, for a beast remembers who fed it first." } },
    _none = { { id = "tp_none", text = "Beasts I know, but that I don't. Try somebody in the Commons." } },
  },
}

-- Bixi Wobblebonk: weapon master in Timberline Arms; daggers, crossbows and thrown weapons.
P:NPC {
  key = "if_bixi", id = TODO_NPC("Bixi Wobblebonk"), name = "Bixi Wobblebonk",
  bible = "bibles/wards_cavern.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "friendly", "proud" },
  notices = { "class" },

  impression = {
    first = "Bixi Wobblebonk teaches daggers, crossbows and throwing weapons at Timberline Arms. She is cheerful about it in a way that is slightly alarming, given what she teaches.",
    third = "{name} met Bixi Wobblebonk, a gnome weapon master in Ironforge's Military Ward.",
  },

  greetings = {
    { id = "g_default", text = "Well, hello there! Come to learn something sharp, have you?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you been practicing? I can always tell when someone hasn't." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! You lot always want daggers, and you always hold them wrong at first. Let me see your grip before you leave." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For when the mana runs out, of course, which is always at the worst moment. I teach them to hold a dagger properly, and I tell them to stand behind someone large, which is the best advice I give anyone." } },
      choices = {
        { text = "A good mage keeps a blade for emergencies. I'll learn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If my mana runs out, I'll run. Daggers are for others.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every warlock should, for a demon can't follow you everywhere and some fights start before you can summon one. A dagger's always there, which is more than I can say for an imp." } },
      choices = {
        { text = "I'll learn it and fight beside my demon, not behind it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My demon does the fighting. That's what it's for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bixi Wobblebonk, weapon master! I teach daggers, crossbows and throwing weapons, which are all the best weapons for someone my size, and quite good for someone yours." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'd be surprised how many mages want to learn daggers, and how few of them can throw straight." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'll teach you daggers if you like, though I suspect your demons do most of your fighting for you." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me anything about pointy things." },
        { id = "h_again2", text = "More questions? Lovely." },
      },
      choices = {
        { text = "I'd like some weapon training.", next = "BUSINESS" },
        { text = "Why those weapons in particular?", next = "why" },
        { text = "Who teaches the other weapons?", next = "others" },
        { text = "Isn't a dagger a coward's weapon?", next = "coward" },
        { text = "Why would a mage want to learn daggers?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should a warlock learn to fight with a dagger?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Thanks, Bixi.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because a gnome with a big axe falls over, and I've seen it happen. A dagger, a crossbow or a good throwing knife doesn't care how tall you are, only how clever, and gnomes are very clever." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    others = {
      lines = {
        { id = "ot_default", text = "Buliwyf Stonehand, just here, for axes and the heavier things, and there's no finer teacher on axes in the city. He doesn't say much, but he's patient, and he hasn't once laughed at my height." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    coward = {
      lines = {
        { id = "co_default", text = "Only if you think fighting fair against a troll twice your size is brave rather than silly. A dagger lets a small person win, and I don't see anything cowardly in that." },
      },
      choices = {
        { text = "A fight should be won face to face.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Winning is all that matters.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I taught weapons to the guards in Gnomeregan, and now I teach them to anyone, which is more fun anyway." } },
    advice = { { id = "tp_ad", text = "Practice every day, even if only for a few minutes. Your hand forgets faster than your head." } },
    _none = { { id = "tp_none", text = "I don't know about that, but I know thirty ways to hold a dagger, if you'd like to hear those." } },
  },
}

-- Ormyr Flinteye: rogue trainer in the Forlorn Cavern; trains rogues and nobody else.
P:NPC {
  key = "if_ormyr", id = TODO_NPC("Ormyr Flinteye"), name = "Ormyr Flinteye",
  bible = "bibles/wards_cavern.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "sharp" }, values = { "cunning", "discreet" },
  notices = { "stealth" },

  impression = {
    first = "Ormyr Flinteye trains rogues in the Forlorn Cavern and has nothing to say to anyone else. He watches the cavern's entrance even while he talks, as if expecting someone he'd rather not see.",
    third = "{name} met Ormyr Flinteye, a rogue trainer in Ironforge's Forlorn Cavern.",
  },

  greetings = {
    { id = "g_default", text = "Ye found the Forlorn Cavern, then. Most folk walk past it twice." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One o' ours. Come in, an' keep yer voice down." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard ye coming at the third step, so keep practicin'. Ye'll get there." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a mage can open a portal where a rogue cannae, an' a portal leaves no footprints. I'll no' tell ye who's askin', but if ye ever fancy the work, ye know where I stand." } },
      choices = {
        { text = "I'll not use my portals for thieves, Ormyr.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A portal with no footprints? I'd like to hear more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Peacefully enough, for both of us know the guards would happily throw us out together. We keep tae our corners, an' we nod in passin', an' that's how it'll stay." } },
      choices = {
        { text = "Then I'll keep to my corner, and nod as I pass.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Corners are for the cautious. I go where I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default",
          text = "Ormyr Flinteye. I train rogues, an' only rogues, so unless ye are one, I've no' much to offer ye but advice, an' my advice is to keep yer purse close in this part o' the city." },
        { id = "h_rogue", key = true, when = { class = "ROGUE" },
          text = "Ormyr Flinteye, an' ye've come to the right corner. I'll teach ye what ye're ready to learn an' not a lesson more, for a rogue who knows too much too soon gets careless." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. I've nothin' tae teach ye, but I'll tell ye that half the rogues in this cavern would pay well for a mage who could keep a secret." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. Yer trainers aren't far from mine, an' I'd say we get along, so long as yer lot keeps their creatures out o' our corner." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quickly." },
        { id = "h_again2", text = "Go on, then; nobody's listening, for I checked the passage myself." },
      },
      choices = {
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "Why is this place called the Forlorn Cavern?", next = "cavern" },
        { text = "What makes a good rogue?", next = "good" },
        { text = "Do the guards know what you teach down here?", next = "guards" },
        { text = "I learned my trade picking pockets on the canals.", next = "k_canal", when = { origin = "human_canal_pickpocket" } },
        { text = "Why would rogues pay for a mage who keeps secrets?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the rogues and warlocks share the Forlorn Cavern peacefully?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    cavern = {
      lines = {
        { id = "ca_default", text = "Because nobody comes here by choice, an' the light's poor, an' the folk who work here prefer it that way. The fishermen an' the warlocks keep to their own business, an' I keep to mine." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    good = {
      lines = {
        { id = "go_default", text = "Patience, mostly, an' knowing when no' to strike. Any fool can stab a man, but a rogue picks the moment, an' half the time the moment never comes, an' ye walk away an' nobody knew ye were there." },
      },
      choices = {
        { text = "A blade in the back is still a blade in the back.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "The one who strikes first lives longest.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },

    guards = {
      lines = {
        { id = "gu_default", text = "They know, an' the King knows, an' they let us be. Ironforge has enemies who don't fight fair, so it's useful to have a few folk who don't either." },
      },
      choices = {
        { text = "Which enemies?", next = "guards_enemies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guards_enemies = {
      lines = {
        { id = "ge_default", text = "Dark Iron spies, mostly, wearin' our colors an' listening at our doors. I've caught two in this very cavern, an' I'll not say what happened after, so don't ask." },
      },
      choices = { { text = "I won't ask.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },

    k_canal = {
      lines = {
        { id = "kc_default", text = "Stormwind's canals, eh? Ye'll have quick hands, then, but sloppy feet, for nobody ever chased ye far. We'll fix the feet, an' ye'll keep the hands." },
      },
      choices = { { text = "My feet are fine, thank you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'd tell ye, but then I'd have to stop trusting ye, an' I've only just started." } },
    advice = { { id = "tp_ad", text = "Never sit wi' yer back to a door. No' even in Ironforge." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' if I had, I'd no' tell ye." } },
  },
}

-- Grimnur Stonebrand: fishing trainer at the Traveling Fisherman in the Forlorn Cavern.
P:NPC {
  key = "if_grimnur", id = TODO_NPC("Grimnur Stonebrand"), name = "Grimnur Stonebrand",
  bible = "bibles/wards_cavern.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "calm" }, values = { "patient", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Grimnur Stonebrand teaches fishing from the doorway of the Traveling Fisherman, deep in a cavern with no water worth the name. He finds this funny, and he has the patience to explain why it doesn't matter.",
    third = "{name} met Grimnur Stonebrand, who teaches fishing in Ironforge's Forlorn Cavern.",
  },

  greetings = {
    { id = "g_default", text = "Come tae learn the rod, have ye? Sit, then; fishin' starts wi' sittin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the water, are ye? Sit an' tell me what was bitin', an' what got away." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = { "Fishing" } },
      text = "Ye smell like a lake, friend, an' I mean that kindly. What were they bitin' on?" },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than ye'd think, for fishin' is all about waitin' for the right moment an' strikin' quick. The best rogues I've known were good fishermen, an' the worst ones never sat still long enough tae learn." } },
      choices = {
        { text = "Patience and timing. I'll learn both, Grimnur.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather take the fish from someone else's line.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They think it makes the fish easier tae catch, but it only makes them angry an' cold. Use a rod like an honest dwarf, an' ye'll find it's more pleasant than any spell." } },
      choices = {
        { text = "A rod it is, then. I'll fish the honest way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A frozen fish is still a fish, Grimnur.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "One or two have, from the warlock trainers' corner o' the cavern, an' they were surprisingly patient. I'd ask ye only tae keep yer demon from scarin' off the fish, for they're shy enough already." } },
      choices = {
        { text = "I'll keep my demon quiet and fish patiently.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If my demon scares them up, that's quicker fishing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grimnur Stonebrand, fisherman, an' I teach fishin' in a cave in the middle o' a mountain, which is a joke I've stopped noticin'. Ye don't need water tae learn the knots, only patience an' a good pair o' hands." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue wantin' tae fish? I'll teach ye, but I'll warn ye that patience matters more than quick hands here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage wantin' tae fish? I've had a few, an' every one tried tae freeze the water first." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock wantin' tae fish? I'd never have guessed it, but I've learned no' tae judge a body by their trade." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've all day." },
        { id = "h_again2", text = "Take yer time, friend." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's the best fishing near Ironforge?", next = "where" },
        { text = "Where do I learn beyond what you teach?", next = "beyond" },
        { text = "Why is fishing worth learning at all?", next = "why" },
        { text = "Can a rogue learn anything from fishing?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a mage freeze the water to fish?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warlocks really fish, Grimnur?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good fishing, Grimnur.", next = "END" },
      },
    },

    where = {
      lines = {
        { id = "wh_default", text = "The frozen lakes in Dun Morogh, if ye can break the ice, but Loch Modan's better, for it's the biggest water this side o' the mountains. Stand on the shore by Thelsamar at dawn, an' ye'll catch more than ye can carry." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    beyond = {
      lines = {
        { id = "be_default", text = "Once ye've learned what I can teach, there's a book ye'll need, sold by Old Man Heming in Booty Bay, down in Stranglethorn. After that, the finest fisherman in the world is Nat Pagle, who sits on a little island in Dustwallow Marsh an' won't talk tae ye till ye've proved yerself." },
      },
      choices = {
        { text = "How do I prove myself to Nat Pagle?", next = "beyond_nat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond_nat = {
      lines = {
        { id = "bn_default", text = "By fishin', an' a great deal of it, an' bringin' him somethin' he's no' seen before. I met him once, an' he said three words tae me in an hour, an' all three were about my knots." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because fish are food, an' food's life when ye're far from an inn. An' because sittin' quiet by the water is the only time some adventurers ever stop tae think, an' most o' them need it." },
      },
      choices = {
        { text = "Quiet hours are worth more than any catch.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather be doing something useful.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fished Loch Modan for thirty years, till my back told me tae sit somewhere warmer an' teach." } },
    advice = { { id = "tp_ad", text = "Use the right bait for the right water. A lake fish won't touch what a river fish loves." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye about that, friend. Fish, I know." } },
  },
}

-- Tansy Puddlefizz: fishing supplies at the Traveling Fisherman; Grimnur's gnome assistant.
P:NPC {
  key = "if_tansy", id = TODO_NPC("Tansy Puddlefizz"), name = "Tansy Puddlefizz",
  bible = "bibles/wards_cavern.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quick" }, values = { "friendly", "inventive" },
  notices = { "craft" },

  impression = {
    first = "Tansy Puddlefizz sells rods, bait and lures at the Traveling Fisherman and keeps trying to improve them. She is Grimnur's assistant and talks about him with great affection and mild exasperation.",
    third = "{name} met Tansy Puddlefizz, who sells fishing supplies in Ironforge's Forlorn Cavern.",
  },

  greetings = {
    { id = "g_default", text = "Rods, bait, lures and bobbers! Everything a fisherman needs, and some things they don't, yet." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did the bobber float? I've been worried about that bobber." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = { "Fishing" } },
      text = "Oh, a proper fisher! Tell me what lure you use, and I'll tell you what's wrong with it." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the ones I make for the cavern's rogues get used for all sorts of things besides fishing, and I'd rather not know what. A quiet line's a useful tool, and I'm a gnome who appreciates a useful tool." } },
      choices = {
        { text = "I'll only use it for fishing, Tansy. Honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better you don't ask what it's really for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In theory, yes, though the fish might also be attracted to the light in a way that's less helpful. Gnomeregan's fishermen had something similar before the fall, and I'm trying to rebuild it from memory." } },
      choices = {
        { text = "Let's test it carefully before you sell it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell it now. The fish won't complain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a green glow tends to attract things that aren't fish, and I've had enough surprises in this cavern. Grimnur says I'm too cautious, but Grimnur wasn't the one who had to fish an imp out of the pool." } },
      choices = {
        { text = "Fair enough. I'll stick to your ordinary lures.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The things that aren't fish sound more interesting.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tansy Puddlefizz, fishing supplies, and assistant to Grimnur, who teaches the fishing. I sell the rods and the lures, and I tinker with them when nobody's looking, which is most of the time down here." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll be wanting a fishing line that doesn't squeak, I expect, and I've just the thing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've been tinkering with a lure that glows with arcane light, and I'd love to know if you think it'd work." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I've had warlocks ask for lures that glow green, and I've always said no, because the fish don't like it." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask away!" },
        { id = "h_again2", text = "Ask me anything about lures, and I'll tell you more than you wanted." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What do you tinker with?", next = "tinker" },
        { text = "How did a gnome end up selling fishing rods?", next = "how" },
        { text = "What's Grimnur like to work for?", next = "grimnur" },
        { text = "Why would a rogue need a fishing line that doesn't squeak?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would an arcane lure really attract more fish?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why won't you make green-glowing lures for warlocks?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Goodbye, Tansy.", next = "END" },
      },
    },

    tinker = {
      lines = {
        { id = "ti_default", text = "Lures, mostly, for fish like things that shine and wiggle, and I can make things that shine and wiggle better than any dwarf alive. I'm working on a bobber that rings a bell, so you can nap while you fish." },
      },
      choices = {
        { text = "That sounds like cheating.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That sounds like genius.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },

    how = {
      lines = {
        { id = "ho_default", text = "I needed work after Gnomeregan, and Grimnur needed someone who could fix a reel. It turned out I liked fishing far more than I expected, though I still don't like the fish." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },

    grimnur = {
      lines = {
        { id = "gr_default", text = "Lovely, really, and very patient, though he says everything twice, slowly, as if I'm a fish. He thinks my lures are silly, but he uses the shiny ones when he thinks I'm not watching." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fixed water pumps in Gnomeregan, and now I fix reels, and honestly, it's not so different." } },
    advice = { { id = "tp_ad", text = "Bring spare line. You'll always need more than you think." } },
    _none = { { id = "tp_none", text = "Hmm, I don't know that one! Ask Grimnur; he knows everything that's not about gadgets." } },
  },
}
