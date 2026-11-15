-- Nethergarde Keep: the Alliance's watch over the Dark Portal, on the bluff above the only road into the Blasted Lands. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lungertz", id = TODO_NPC("Quartermaster Lungertz"), name = "Quartermaster Lungertz",
  bible = "bibles/blastedlands.md", role = "soldier", tier = "major",
  communities = { "nethergarde" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "class", "kit", "race" },

  impression = {
    first = "Quartermaster Lungertz runs Nethergarde from a desk piled with ledgers, counting every crate that makes it down the road from Darkshire. He's cheerful about it, the way people are when the alternative is despair.",
    third = "{name} met Quartermaster Lungertz, who keeps Nethergarde Keep fed and supplied from the far end of a very dangerous road.",
  },

  greetings = {
    { id = "g_default", text = "Mind the crates, friend, and don't mind the shouting. It's business as usual at Nethergarde." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing? Come in, come in, and tell me you've brought something I can write down." },
    { id = "g_supplies", when = { questDone = TODO_QUEST("Supplies for Nethergarde") }, text = "My powerstone runner! The mages still talk about the day that crate came in glowing." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Cold enough to freeze the ink tonight. Shut the door behind you, would you?" },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Our clerics will want a word, and so will I, because they go through bandages and prayers faster than I can order either." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another mage, is it? Then you'll know what an Azoran crystal costs, and you'll forgive me for counting them twice." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Light's sake, look at your armor; the ogres had a go at you, didn't they? Strumner's at the forge downstairs, and he's the only one who'll mend it for leagues." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good. Half the soldiers on these walls are your kin, and they've been complaining that nobody here pours a proper ale." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Quartermaster Lungertz, keeper of every crate, barrel and sack in Nethergarde Keep. The mages watch the Portal, the soldiers watch the ogres, and I make sure they all eat while they're at it." },
        { id = "h_powerstones", tags = { "news" }, when = { questActive = TODO_QUEST("Supplies for Nethergarde") },
          text = "Is that the crate from Sorigal? Quickly, then, before the stones go dark on us; they don't keep, and the mages have been waiting a week." },
        { id = "h_biggs", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deliver the Shipment"), days = 7 } },
          text = "I'd written Biggs's caravan off, crates, wagon and all, and here's his shipment in my storeroom. If the Azoran crystals hold out, the mages owe you a drink, and I'll see they pay it." },
        { id = "h_lost", when = { questRecent = { TODO_QUEST("The Lost Supplies"), days = 3 } },
          text = "One more barrel back from the swamp, with my name still stamped on the bottom. You'd be amazed how many of them end up in the mud between Darkshire and here." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "By day the Blasted Lands try to bake you and by night they try to freeze you, so I keep the ledgers by the brazier and count blankets twice." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's the one person in the Blasted Lands who brings me more than they take. Sit down; I'll find you something that isn't hardtack." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if you would; there's a wagon due and I'd like to count it before the ogres do." },
        { id = "h_again2", text = "Go on, then. The ledgers will wait a minute, which is more than the mages ever do." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. Nothing comes up the road after dark, so I've nothing better to do than talk." },
      },
      choices = {
        { text = "What does a quartermaster need out here?", next = "supplies" },
        { text = "Who holds Nethergarde Keep?", next = "keep" },
        { text = "What's out there in the wastes?", next = "wastes" },
        { text = "Why guard a portal that's dead?", next = "portal" },
        { text = "Do your clerics need another pair of hands?", next = "priest", when = { class = "PRIEST" } },
        { text = "Demons don't frighten me. I keep one at my heel.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The powerstones came in time, then?", next = "powerstones", when = { questDone = TODO_QUEST("Supplies for Nethergarde") } },
        { text = "What do your soldiers need most, Quartermaster?", next = "k_warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Does the keep need fresh meat? I hunt.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "A gnome could keep your powerstones working.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "I'll keep an eye out for your crates.", next = "END", fx = { affinity = 1, standing = { nethergarde = 1 } } },
      },
    },

    supplies = {
      lines = {
        { id = "s_default", fx = { learn = { "nethergarde" } },
          text = "Everything, all the time. Food and water for the soldiers, powerstones and Azoran crystals for the mages, arrows, bandages, nails; it all comes from Stormwind by way of Darkshire, and a good deal of it never gets here." },
      },
      choices = {
        { text = "Where does it go missing?", next = "supplies_lost" },
        { text = "What are Azoran crystals for?", next = "supplies_crystals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_lost = {
      lines = {
        { id = "sl_default", text = "The swamp eats some, and the ogres eat the rest, sometimes along with the drivers. Watcher Biggs took a caravan through the Swamp of Sorrows not long ago and we heard nothing more of it." },
        { id = "sl_biggs", when = { questDone = TODO_QUEST("Deliver the Shipment") },
          text = "Biggs is alive, thanks to you, and fixing that wagon of his in the swamp. I've stopped listing his caravan under losses, which is the nicest thing I've written all month." },
      },
      choices = {
        { text = "Can Stormwind keep this up?", next = "supplies_stormwind" },
        { text = "Then the road needs guarding.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_crystals = {
      lines = { { id = "sc_default", text = "Don't ask me how they work; the mages use them in their wards and their studies of the Portal, and they go through them like soldiers through bread. When the stock runs low, the mages get short-tempered, and a short-tempered mage is a thing to avoid." } },
      choices = {
        { text = "I'll keep my distance.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_stormwind = {
      big = true,
      lines = {
        { id = "ss_default", text = "Since Dalaran fell, Stormwind's all we've got, and Stormwind has troubles of its own. The Sanctum's mages keep asking for supplies, the Keep keeps promising, and I keep writing down what actually arrives." },
      },
      choices = {
        { text = "Stormwind will see us through. It always has.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Then stop waiting on Stormwind and fend for yourselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How long can the keep really hold, Quartermaster?", tag = "Persuade", next = "supplies_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Supplies for Nethergarde") }, { questDone = TODO_QUEST("Deliver the Shipment") } } } },
          fail = { next = "supplies_brave", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_truth = {
      big = true,
      lines = {
        { id = "st_default", text = "Weeks, not months, and keep that between us. Food we can ration and the soldiers will grumble, but the powerstones and crystals feed the wards, and when those run dry it's the mages who'll feel it first, and then the rest of us." },
      },
      choices = {
        { text = "Then I'll carry what I can.", next = "BACK", fx = { affinity = 2, standing = { nethergarde = 2 } } },
        { text = "Do the mages upstairs know?", next = "supplies_commander" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_commander = {
      lines = { { id = "sco_default", text = "Everyone upstairs knows, and everyone upstairs has written to Stormwind. I just write it smaller and more often, because somebody in the Keep must read the small print eventually." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies_brave = {
      lines = { { id = "sb_default", text = "Long enough, friend, long enough. Nethergarde has never once run out of anything that mattered, and it won't start while I'm keeping the books." } },
      choices = { { text = "Glad to hear it.", next = "BACK" } },
    },

    keep = {
      lines = {
        { id = "k_default", fx = { learn = { "khadgar", "dark_portal" } },
          text = "Mages, mostly, the grim sort, who were Dalaran's before they were anyone's, and Stormwind soldiers and dwarves to keep the ogres off their backs. Archmage Khadgar had the place built after the Second War, to watch the Dark Portal and make sure nothing ever came through it again." },
      },
      choices = {
        { text = "Who built the walls?", next = "keep_built" },
        { text = "Where's Khadgar now?", next = "keep_khadgar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_built = {
      lines = {
        { id = "kb_default", fx = { learn = { "stonemasons" } },
          text = "The Stonemasons Guild, out of Stormwind, under a master mason named VanCleef. Fine work, too; the walls have taken every ogre club the Dreadmaul could swing, though I hear the masons never saw their full pay for it." },
        { id = "kb_defias", when = { topicKnown = "defias" },
          text = "VanCleef's masons, the same ones who went off to Westfall and turned to banditry when Stormwind wouldn't settle the bill. I sleep behind their walls every night and try not to think about it." },
      },
      choices = {
        { text = "Stormwind should have paid them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A bill is no excuse for banditry.", next = "BACK", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_khadgar = {
      lines = { { id = "kk_default", text = "Through the Portal with the expedition, twenty years gone, and never came back. Watcher Mahar Ba upstairs will talk your ear off about him if you let him, so I'd only let him if you've got an afternoon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wastes = {
      lines = {
        { id = "w_default", fx = { learn = { "dreadmaul", "tainted_scar" } },
          text = "Ogres, first and loudest: the Dreadmaul, who came through the Portal with the Horde and never left, and who hit our walls more often than I'd like. South of them is the Tainted Scar, where the demons are, and between the two of them there's nothing but scorpions and red dust." },
      },
      choices = {
        { text = "Do the ogres answer to the demons?", next = "wastes_ogres" },
        { text = "Anyone else out there?", next = "wastes_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wastes_ogres = {
      lines = { { id = "wo_default", text = "The mages say so, and they'd know better than me. Either way, someone tells those ogres when to come at us, because they come on a schedule I could set the watch by." } },
      choices = {
        { text = "Then the demons are the real enemy.", next = "BACK", fx = { opinion = { burning_legion = "real_enemy" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wastes_others = {
      lines = { { id = "wot_default", text = "A pair of elven bloodmages up by the northern pass, cutting up boars for science, and some sort of broken draenei wandering near the Portal, hunting for crystals. Neither of them buys from me, so I can't tell you much more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    portal = {
      big = true,
      lines = {
        { id = "p_default", fx = { learn = { "dark_portal" } },
          text = "Dead it may be, but it's the door the Horde came through, and the mages swear the land around it still isn't right. I'd rather feed a hundred mages to watch an empty door than wake up one morning wishing we had." },
      },
      choices = {
        { text = "Better a watched door than a surprise.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Twenty quiet years. Stormwind's coin would do more elsewhere.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "They need ten pairs, and they'd take yours gladly. The clerics patch up whoever the ogres send back, and the demons leave wounds that won't close for a plain bandage; a priest's prayer goes a long way here." } },
      choices = {
        { text = "I'll see to the wounded before I go.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { nethergarde = 2 } },
          journal = { first = "Nethergarde's clerics couldn't keep up with the wounded the ogres send back, so I stayed and prayed over the worst of them.",
                      third = "{name} stayed at Nethergarde Keep to pray over soldiers wounded by ogres and demons." } },
        { text = "The clerics will manage. I've other work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Wounds that won't close?", next = "priest_wounds" },
      },
    },
    priest_wounds = {
      lines = { { id = "pw_default", text = "Felhound bites, mostly, and whatever the demons in the Scar carry on their claws. The clerics say the Light takes longer to answer out here, as if it has further to come." } },
      choices = {
        { text = "Then I'll pray harder.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      lines = { { id = "wl_default", text = "Do you, now. Keep it on its leash inside these walls, then, because the soldiers here have spent years killing things that look exactly like it, and they don't stop to ask whose it is." } },
      choices = {
        { text = "It'll behave. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If your soldiers touch it, that's their mistake.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
      },
    },
    powerstones = {
      lines = { { id = "ps_default", text = "With a day to spare, and the mages got three weeks of work out of them. I wrote your name in the ledger beside the crate, which is as close to a medal as I'm allowed to give." } },
      choices = {
        { text = "I'll take the ledger over a medal.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Boots, first, because the red clay eats them in a month, then whetstones, then sleep, and I can only supply the first two. Every soldier on that wall has walked the Darkshire road, and every one of them would trade a week's pay for a night without ogres." },
        { id = "xwa_dwarf", when = { race = "Dwarf" },
          text = "Boots, whetstones and sleep, in that order, though your folk seem to manage without the third. I've two dozen dwarves on the south wall and they've worn out more boots than the rest of the keep together." },
      },
      choices = {
        { text = "Put me on the wall for a night, then.", next = "BACK", fx = { affinity = 2, standing = { nethergarde = 1 } } },
        { text = "Soldiers grumble. That's how you know they're alive.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Not from out there, it doesn't, and I'll thank you not to bring any in. The beasts in these wastes have drunk the Portal's water so long that Drazial bottles them for strength, and I'm not feeding that to a garrison." },
        { id = "xhu_pet", when = { pet = { type = "Beast" } },
          text = "Not from out there, and keep your companion from eating anything it finds, either. The beasts in these wastes have drunk the Portal's water too long, and I've seen what it does to a hound's temper." },
      },
      choices = {
        { text = "My beast eats what I give it, nothing else.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Who's Drazial?", next = "wastes_others" },
      },
    },
    k_gnome = {
      lines = {
        { id = "xgn_default", text = "Could it? The mages say powerstones are a matter for the arcane and not for spanners, and the last gnome who opened one spent a week deaf in one ear. I'll write you down as available, and you can argue it out with Mahar Ba." },
      },
      choices = {
        { text = "Ears recover. Wards don't.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that comes into this keep crosses my desk, and most of the gossip with it. Pick something and I'll tell you what the ledgers say." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, the ledgers and what isn't in them. Go on, ask." },
    },
    background = {
      { id = "tp_bg", text = "Stormwind sent me to count things, and I've been counting them here longer than I care to admit. Somebody has to, and the mages certainly won't.", next = "supplies" },
      { id = "tp_bg2", text = "I'm a quartermaster, friend, and the story of a quartermaster is a list of what arrived and what didn't." },
    },
    advice = { { id = "tp_ad", text = "Carry your own water in the Blasted Lands and twice what you think you'll need. Nothing out there is fit to drink, and the nights will take whatever warmth you've got left." } },
    nethergarde = { { id = "tp_nether", text = "The last Alliance roof between Stormwind and the Dark Portal, and I keep it standing one crate at a time.", next = "keep" } },
    dark_portal = { { id = "tp_portal", text = "A great dead arch in the middle of a crater, and the reason any of us are here. I've seen it twice and that was plenty." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "Big, loud and regular as the tides. They come at the walls, the soldiers send them home, and I order more arrows.", next = "wastes" } },
    stonemasons = { { id = "tp_masons", text = "They built these walls, and built them well. What became of them after is Stormwind's business, not mine." } },
    burning_legion = { { id = "tp_legion", text = "Ask the mages; they lose sleep over it. I lose sleep over the arrow count, which is worry enough for one man." } },
    _none = { { id = "tp_none", text = "If it doesn't come in a crate, it isn't in my ledgers. Try the Watcher upstairs." } },
  },
}

P:NPC {
  key = "mahar_ba", id = TODO_NPC("Watcher Mahar Ba"), name = "Watcher Mahar Ba",
  bible = "bibles/blastedlands.md", role = "scholar", tier = "major",
  communities = { "nethergarde" }, temper = { "eager" }, values = { "curious", "wise" },
  notices = { "class", "race" },

  impression = {
    first = "Watcher Mahar Ba studies the Dark Portal the way some men pray, and talks about Khadgar as if he'd only stepped out of the room. He is earnest, overworked and a little lonely.",
    third = "{name} met Watcher Mahar Ba, a mage of Nethergarde who studies the Dark Portal and everything Khadgar left behind.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Do come in, only don't touch the instruments, the papers or, ideally, anything at all." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. I've filled half a book since we last spoke, and none of it good news." },
    { id = "g_essays", when = { questDone = TODO_QUEST("Mazen's Behest") }, text = "My courier of Khadgar! I've read the essays twice already and I understand perhaps half of them, which is twice what I expected." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A fellow student of the arcane, and out here of all places! Forgive me if I talk too much; the soldiers have heard all my theories and started hiding from me." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I can feel the fel on you from across the room, warlock. Mind it near the wards, please; they were made to keep your sort of power out, and they're not subtle about it." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "A night elf at Nethergarde! Your people fought the Legion ten thousand years ago, and I'd give a great deal to know what you remember of it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Forgive me, I'm staring; you're one of the people Dalaran's letters call the Skyborne, and I've only read about you by lamplight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Watcher Mahar Ba, of the mages of Nethergarde. We watch the Dark Portal, and when it does nothing, which is always, we measure what the nothing is doing to the land around it." },
        { id = "h_essays_wait", tags = { "news" }, when = { questActive = TODO_QUEST("Mazen's Behest") },
          text = "You've come from Master Mazen? Then tell me you have Khadgar's essays, because I'd begun to think my request had fallen behind a bookcase in Stormwind." },
        { id = "h_essays_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mazen's Behest"), days = 7 } },
          text = "I haven't slept, I confess, not since you brought me the essays. To read Khadgar's own reasoning about how two worlds can touch is a thing I never expected to do in my life." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The Portal looks almost peaceful by starlight, which is exactly when I trust it least. I take my readings at night; the land seems to talk more when it's cold." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask; I'd much rather talk than calculate, though don't tell the others." },
        { id = "h_again2", text = "What else would you like to know? I warn you, I can talk about the Portal until the candle gutters." },
      },
      choices = {
        { text = "What exactly do you watch for?", next = "watch" },
        { text = "Who was Khadgar?", next = "khadgar" },
        { text = "What happened to the essays from Stormwind?", next = "essays" },
        { text = "Your soldiers mention a black drake.", next = "drake" },
        { text = "Does the Light reach this place, Watcher?", next = "priest", when = { class = "PRIEST" } },
        { text = "Dalaran trained me. Does Nethergarde still answer to it?", next = "mage", when = { class = "MAGE" } },
        { text = "My people remember the Legion. We never forget.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "The fel here is power, Watcher, wasted on wards.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The Kirin Tor took my people in, Watcher.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "The stone here is screaming, Watcher.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Could a druid heal this land?", next = "k_druid", when = { class = "DRUID" } },
        { text = "I'll leave you to your readings.", next = "END" },
      },
    },

    watch = {
      lines = {
        { id = "w_default", fx = { learn = { "dark_portal" } },
          text = "The taint, mostly: the soil, the rock, the beasts, all of it changed by the magic that tore the Portal open and then tore it down again. We measure how far it spreads each year, and we make sure it spreads no further than the edge of these lands." },
      },
      choices = {
        { text = "Is the Portal truly dead?", next = "watch_portal" },
        { text = "Can the land be healed?", next = "watch_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_portal = {
      lines = { { id = "wp_default", text = "As dead as stone can be. The five who went through sealed it from the far side twenty years ago, and nothing has stirred in it since, though I check every morning anyway, because that is what a watcher is for." } },
      choices = {
        { text = "Why not tear it down, stone by stone?", next = "watch_tear" },
        { text = "Then keep watching. Someone must.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Twenty dead years. Let the mages go home.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_tear = {
      lines = { { id = "wt_default", text = "Wiser heads than mine argued that for years, and the stones won't come down; they're bound by more than mortar. So we keep watch, and we write it all down, in case someone after us understands it better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch_heal = {
      lines = { { id = "wh_default", text = "Not in my lifetime, and perhaps not in yours. The red of these rocks isn't their own; it was burned into them, and I've yet to find a spell that unburns anything." } },
      choices = {
        { text = "Then hold the line where it is.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    khadgar = {
      big = true,
      lines = {
        { id = "k_default", key = true, fx = { learn = { "khadgar" } },
          text = "The apprentice of Medivh, the archmage who stood with Lothar and Turalyon, and the man who built this keep. When the Horde opened the Portal a second time, he led the expedition through it, and he and his companions sealed it from the other side so it could never threaten us again." },
      },
      choices = {
        { text = "And what became of him?", next = "khadgar_fate" },
        { text = "A hero, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    khadgar_fate = {
      lines = { { id = "kf_default", text = "Nobody knows. The Alliance mourned them, Stormwind carved them in stone, and the rest of us go on reading what they left behind, which in Khadgar's case is a great deal." } },
      choices = {
        { text = "You don't sound like you've mourned him.", tag = "Persuade", next = "khadgar_hope",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Mazen's Behest") }, { class = "MAGE" } } } },
          fail = { next = "khadgar_shelf", fx = { affinity = -1 } } },
        { text = "They're gone. Best to honour them and move on.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nobody's dead until someone finds the body.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    khadgar_hope = {
      big = true,
      lines = {
        { id = "kh_default", text = "Haven't I? Perhaps not. The essays argue that a world on the far side of a sealed door doesn't simply end, and I read every page looking for a reason to believe the five could still be alive over there, which is not science, I know, and which I'd thank you not to repeat upstairs." },
      },
      choices = {
        { text = "Your secret's safe, Watcher.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Hope isn't a bad reason to read.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    khadgar_shelf = {
      lines = { { id = "ks_default", text = "I mourn him as a scholar does, by keeping his work on the nearest shelf. Now, was there anything else?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    essays = {
      lines = {
        { id = "e_default", text = "I asked Master Mazen of the Academy for Khadgar's Essays on Dimensional Convergence months ago, and heard nothing, which I put down to the poor man drowning in requests with all the strange happenings lately." },
        { id = "e_dellis", when = { questDone = TODO_QUEST("Mazen's Behest") },
          text = "Mazen sent his assistant Dellis with them, and Dellis, bless him, dropped them in the Swamp of Sorrows and ran from a plant. You brought them the rest of the way, and I'll not forget it." },
      },
      choices = {
        { text = "What's dimensional convergence?", next = "essays_what" },
        { text = "Poor Dellis.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    essays_what = {
      lines = { { id = "ew_default", text = "How two worlds can be brought close enough to touch, in plain terms, and what it does to the ground where they meet. You're standing on the answer to the second half, as it happens." } },
      choices = {
        { text = "That's a frightening thing to study.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drake = {
      lines = { { id = "d_default", text = "A black drake, enormous and old, that circles the Portal and comes down on patrols when it's hungry. The soldiers call it Teremus the Devourer, and I've stopped sending anyone out there alone." } },
      choices = {
        { text = "I'll keep my eyes on the sky.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Then someone should hunt it.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "It reaches, but it's thin here, or so our clerics tell me; they say their prayers feel like shouting across a valley. I'm no priest, but I've watched their faces after a long night, and I believe them." } },
      choices = {
        { text = "The Light is never thin. Only our faith.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Then maybe the Light has given up on this place.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why would it be thin here?", next = "priest_why" },
      },
    },
    priest_why = {
      lines = { { id = "pw_default", text = "My guess, and it's only a guess, is that the fel soaked into this ground is the Light's opposite, and it pushes back. Ask your clerics whether that's heresy; I'm told I ask too many questions as it is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "ma_default", text = "To Dalaran, once, and now to whatever's left of the Kirin Tor and whatever Stormwind will pay for. We're Dalaran's orphans out here, and we try to work as if the masters were still reading our reports." } },
      choices = {
        { text = "Dalaran will rise again.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaldorei = {
      lines = { { id = "kd_default", fx = { learn = { "burning_legion" } },
        text = "Then you're the only people alive who've seen the Burning Legion at its full strength, and lived to sing about it. The remnant in the Tainted Scar is a shadow of that, and it still keeps a keep full of mages awake at night." } },
      choices = {
        { text = "A shadow can still bite.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      lines = { { id = "wa_default", text = "Wasted? It's kept out, which is the only thing to be done with it. I've read what that power did to the orcs and to their world, and I don't intend to see it do the same to ours." } },
      choices = {
        { text = "Power is only as wicked as its master.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Fair enough. I respect the wards.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    k_sky = {
      lines = {
        { id = "xsk_default", text = "So I've read, in letters from Dalaran that arrive three months late and smelling of the road, about a Sky Enclave and a people from the Plane of Air! I've a hundred questions, and I'll limit myself to one: did you ever watch a portal open, where you came from, and was it anything like this?" },
      },
      choices = {
        { text = "Nothing like this. This place feels wrong.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'd rather not talk about where I came from.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Screaming. I measure it with crystals and charts and call it residue, and you put your hand on the ground and call it screaming, and I can't honestly say which of us is closer. Does it say what would quiet it?" },
      },
      choices = {
        { text = "Close the Portal for good. Seal it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let the land heal its own way. Stop watching.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "How do you measure it?", next = "watch_tear" },
      },
    },
    k_druid = {
      lines = {
        { id = "xdr_default", text = "I have wondered, on long nights, whether a grove could take root here, and every soil sample tells me it would die before it flowered. But I'm a mage, and we tend to believe the samples; perhaps a druid knows better." },
        { id = "xdr_elf", when = { race = "NightElf" },
          text = "Your people healed the land after the Legion's first war, the books say, and that was a war beside which this is a scratch. If anyone could, I'd wager on a druid of the Cenarion Circle, though I'd still wager small." },
      },
      choices = {
        { text = "Any land can heal, given time.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Some wounds are meant to stay open, as warnings.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent years reading about this land and a few more measuring it, so I'll answer what I can. Choose, and I'll try to keep it short." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "Ask me anything you like; I've been hoping someone would." },
    },
    background = { { id = "tp_bg", text = "A Stormwind lad who read too much, went to Dalaran to read more, and was sent here to read the rocks. I wouldn't trade it, most days.", next = "watch" } },
    advice = { { id = "tp_ad", text = "Don't sleep out on the red earth, and if your skin starts to itch after a day in the wastes, see a cleric. The taint is patient." } },
    dark_portal = {
      { id = "tp_portal", text = "The greatest wound magic ever cut into this world, and the reason Nethergarde exists. It's quiet, and I intend to make sure it stays that way.", next = "watch" },
      { id = "tp_portal2", text = "Medivh opened it for the Horde, the Alliance closed it, and Ner'zhul's orcs opened it once more before Khadgar sealed it for good." },
    },
    khadgar = { { id = "tp_khadgar", text = "The greatest mage of his age, and this keep was his idea. I'll gladly tell you everything, if you have a while.", next = "khadgar" } },
    burning_legion = { { id = "tp_legion", text = "The masters behind the orcs and the Scourge alike, and their remnant here in the Tainted Scar. Lord Kazzak commands them, if the scouts who came back are to be believed." } },
    tainted_scar = { { id = "tp_scar", text = "A gash in the southwest full of demons and fel, and the one place in these lands I won't go even with an escort." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside my studies. The Quartermaster hears everything, though; try him." } },
  },
}

P:NPC {
  key = "thadius", id = TODO_NPC("Thadius Grimshade"), name = "Thadius Grimshade",
  bible = "bibles/blastedlands.md", role = "scholar", tier = "major",
  communities = { "nethergarde" }, temper = { "sharp" }, values = { "curious", "ambitious" },
  notices = { "race", "class" },

  impression = {
    first = "Thadius Grimshade is a Wildhammer who traded the open sky for a tower full of strange books, and he doesn't apologise for it. He drives a hard bargain, but he lit up when the gryphons were mentioned.",
    third = "{name} met Thadius Grimshade, a Wildhammer diviner who left Aerie Peak to study darker things in Nethergarde's mage tower.",
  },

  greetings = {
    { id = "g_default", text = "Mind the circle on the floor, would ye? It took me all mornin' tae chalk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Ye've the look o' someone wi' a question, an' I've the look o' someone who'll charge for the answer." },
    { id = "g_sharpbeak", when = { questDone = TODO_QUEST("Return to the Hinterlands") }, text = "The one who went lookin' for Sharpbeak. Did Talonaxe get his wee beast back, then?" },
  },

  notice = {
    { id = "n_wildhammer", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, an' by the look o' ye one who's never sat a gryphon. Ironforge, then, where they keep their feet on the stone an' their heads under it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, frownin' at my books before ye've read a single page. Go on, say it; everyone in this keep has." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thadius Grimshade, diviner, late o' Aerie Peak an' now o' this tower. I find things, lost things an' hidden things, an' I ask a fair price for the findin'." },
        { id = "h_feather", tags = { "news" }, when = { questActive = TODO_QUEST("Thadius Grimshade") },
          text = "A gryphon feather, an' a young one at that; I can smell the aerie on it from here. Talonaxe sent ye, did he? Then let's talk about what it'll cost him." },
        { id = "h_medallion", when = { questActive = TODO_QUEST("Nekrum's Medallion") },
          text = "Zul'Farrak's across the sea in Tanaris, an' Nekrum Gutchewer won't hand that medallion over for the askin'. Bring it tae me an' I'll find yer gryphon; that's the bargain." },
        { id = "h_divination", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Divination"), days = 3 } },
          text = "My eyebrows have nearly grown back, ye'll be glad tae hear. The ritual worked, an' that's the main thing; Sharpbeak's alive, an' the Vilebranch have him." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night's when the scryin' goes clearest, an' when the mages downstairs pretend not tae hear the chantin'. Sit, if ye like, but quietly." },
      },
      again = {
        { id = "h_again", text = "Aye? What else, then? The circle's no' goin' anywhere." },
        { id = "h_again2", text = "Ask. I've answers for most things, an' prices for the rest." },
      },
      choices = {
        { text = "Why would a Wildhammer leave the Hinterlands?", next = "why" },
        { text = "What do you want with Nekrum's medallion?", next = "medallion" },
        { text = "How does divination work?", next = "divination" },
        { text = "Can you find Sharpbeak?", next = "sharpbeak", when = { any = { { questActive = TODO_QUEST("Thadius Grimshade") }, { questActive = TODO_QUEST("Nekrum's Medallion") } } } },
        { text = "Darker knowledge has a price, diviner.", next = "priest", when = { class = "PRIEST" } },
        { text = "You're a long way from Aerie Peak, cousin.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Sharpbeak's home, safe with his mother.", next = "home", when = { questDone = TODO_QUEST("Saving Sharpbeak") } },
        { text = "I speak with the spirits too, Thadius.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "My beast could track Sharpbeak's scent.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Your divinations smell of my own arts.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your chalk.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Because the Hinterlands taught me everythin' about wind an' feather an' nothin' about what lies under them. I wanted tae know what the shamans wouldnae tell me, an' Nethergarde's the only place in the world wi' a library an' a Dark Portal on the doorstep." },
      },
      choices = {
        { text = "Do you miss the aeries?", next = "why_aerie" },
        { text = "What did the shamans keep from you?", next = "why_shamans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_aerie = {
      lines = { { id = "wa_default", text = "Every day, an' I'll deny it if ye tell the mages. When I cannae sleep I go up tae the roost an' talk tae Alexandra's gryphons; they're lowland birds, soft as butter, but they listen." } },
      choices = {
        { text = "That's no crime, Thadius.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then go home.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    why_shamans = {
      lines = { { id = "ws_default", text = "That some knowledge is better left alone, which is exactly what a man says when he's afraid o' it. I'm afraid o' it too, mind; I just read it anyway." } },
      choices = {
        { text = "Some knowledge should stay buried.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Knowledge is knowledge. Fear is no reason to stop.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    medallion = {
      big = true,
      lines = {
        { id = "m_default", text = "Nekrum Gutchewer has lived far longer than any troll ought tae, an' the rumour says it's the medallion that does it, at a price. I want tae learn how it works, so I can take the long life an' leave the unpleasant side o' it behind." },
        { id = "m_done", when = { questDone = TODO_QUEST("Nekrum's Medallion") },
          text = "It's on my bench now, an' it's every bit as nasty as I hoped. I've learned more from it in a month than in a year o' books, an' I've kept all my fingers so far." },
      },
      choices = {
        { text = "What's the price it asks?", next = "medallion_price" },
        { text = "Long life isn't worth a troll's curse.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "If you can cheat the price, more power to you.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion_price = {
      lines = { { id = "mp_default", text = "The rumour says the troll's no' entirely a troll any more, nor entirely alive. I mean tae find out which part goes first, an' stop before it goes." } },
      choices = {
        { text = "Why do you want a long life so badly?", tag = "Persuade", next = "medallion_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Nekrum's Medallion") }, { race = "Dwarf" } } } },
          fail = { next = "medallion_shrug", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion_truth = {
      big = true,
      lines = {
        { id = "mt_default", text = "Because I'm older than the young mages downstairs think, an' I've learned maybe a tenth o' what I came here for. A dwarf lives long, but no' long enough tae read every book, an' I'd hate tae die halfway through the good one." },
      },
      choices = {
        { text = "Then read faster, old friend.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Everyone dies halfway through something.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    medallion_shrug = {
      lines = { { id = "ms_default", text = "Doesnae everyone? Mind yer own business, friend, an' I'll mind my medallion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    divination = {
      lines = { { id = "d_default", text = "Ye take somethin' that belonged tae what ye're lookin' for, a feather or a hair or a scrap o' cloth, an' ye follow the thread from it tae its owner. Simple enough, if the thread holds an' nothin' else is pullin' on it." } },
      choices = {
        { text = "And if something else pulls?", next = "divination_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    divination_wrong = {
      lines = { { id = "dw_default", text = "Then ye close yer eyes an' hope. Out here, wi' the Portal so near, there's always somethin' on the other end listenin', an' now an' then it pulls back." } },
      choices = {
        { text = "I'll keep my eyes shut, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sharpbeak = {
      lines = { { id = "sb_default", text = "Aye, if I have his feather an' my price. Swiftwind an' Keenclaw's chick, an' destined for great things if he lives tae grow; I'd find him for nothin', if I'm honest, but don't tell Talonaxe that." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Aye, an' I pay it, which is more than most who say so. Yer Light has its price too, priest; ye just call it faith an' pay it in advance." } },
      choices = {
        { text = "Faith isn't a price. It's a gift.", next = "BACK", fx = { align = { light = 2 } } },
        { text = "You're not wrong. Every power costs something.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw2_default", text = "Further than ye know, cousin. The Bronzebeards would call me a Wildhammer an' the Wildhammers would call me a bookworm, so here I sit, where nobody's bothered what I am as long as the scryin' works." } },
      choices = {
        { text = "Khaz Modan's big enough for both clans.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Ha! Then it was worth every hair I singed. Drink tae him for me next time ye're in a Wildhammer hall, an' don't tell them who's buyin'." } },
      choices = { { text = "To Sharpbeak.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Do ye, now? Then ye'll know that what I do here isnae what the shamans o' Aerie Peak taught me, an' ye'll know why they'd no' have me back. Spirits answer a respectful question; I've stopped askin' respectfully." },
        { id = "xsh_wild", when = { origin = "dwarf_wildhammer_kin" },
          text = "Wildhammer blood an' a shaman's ear, an' ye've come tae look at what became o' one o' yer own. Aye, the Aerie's shamans taught me first, an' they'd no' have me back now, for I've stopped askin' the spirits respectfully." },
      },
      choices = {
        { text = "The spirits deserve respect, Thadius. Go home.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Results matter. The spirits will get over it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Why did you leave the Hinterlands?", next = "why" },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "It could, if Sharpbeak were anywhere a beast could walk, which he isnae. The chalk tells me where he is, an' the chalk says Jintha'Alor, an' no beast o' yers is climbin' those troll steps without the Vilebranch noticin'." },
      },
      choices = {
        { text = "Then my beast and I will go carefully.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "They smell o' what this land smells of, an' I'll no' pretend otherwise. The difference between us is I only borrow the dark tae look through it, an' ye invite it tae stay for supper." },
      },
      choices = {
        { text = "Borrowing is just inviting with poor manners.", next = "BACK", fx = { align = { light = -1 }, trait = { witty = 1 } } },
        { text = "Then we should both be careful.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a deal o' things most folk would rather I didnae. Which o' these d'ye want?" } },
    background = {
      { id = "tp_bg", text = "Aerie Peak bred me an' books ruined me. That's the short o' it, an' the long o' it costs extra.", next = "why" },
      { id = "tp_bg2", text = "I rode wi' the Wildhammer once, an' now I read. I'm no' sure which was more dangerous." },
    },
    advice = { { id = "tp_ad", text = "Never scry for somethin' ye're no' ready tae find. An' never lend a mage yer books." } },
    dark_portal = { { id = "tp_portal", text = "A door wi' the latch on the far side, an' the reason my scryin' gets crowded at night." } },
    burning_legion = { { id = "tp_legion", text = "Them I don't scry for, ever. Some things notice when ye look at them." } },
    nethergarde = { { id = "tp_nether", text = "Grim folk an' good books. I've lived in worse places, though no' many." } },
    _none = { { id = "tp_none", text = "That's no' somethin' I've ever cared tae look for. Ask the Watcher; he cares about everythin'." } },
  },
}

P:NPC {
  key = "ardalan", id = TODO_NPC("Ambassador Ardalan"), name = "Ambassador Ardalan",
  bible = "bibles/blastedlands.md", role = "noble", tier = "major",
  communities = { "nethergarde" }, temper = { "proud" }, values = { "wise", "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Ambassador Ardalan is an elf who speaks very politely about very unwelcome ideas, chiefly that the Alliance should stop fighting the Horde. He never quite says whom he speaks for.",
    third = "{name} met Ambassador Ardalan, an elven envoy at Nethergarde Keep who urges Alliance and Horde to stand together against the Burning Legion.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a fresh face, and one that isn't scowling at me yet. How refreshing." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Have you come to argue, or have you finally come to listen?" },
    { id = "g_hero", when = { questDone = TODO_QUEST("Petty Squabbles") }, text = "You went and spoke with the orc. I knew there was more sense in you than in this whole garrison." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, inside Nethergarde, and nobody has drawn a sword yet. You see? It can be done, if everyone tries very hard not to be foolish." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "One of Stormwind's own. Your people built this keep to watch for demons, and then filled it with soldiers who'd rather fight orcs; I find that curious." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the Silver Hand. My people once fought beside yours against the Horde, and I'd have you fight beside the Horde now, against something worse." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ambassador Ardalan, at your service, though most here would say I serve nobody they'd care to name. I'm here to tell anyone who'll listen that we fight the wrong enemy in these lands." },
        { id = "h_squabbles", tags = { "news" }, when = { questActive = TODO_QUEST("Petty Squabbles") },
          text = "The fallen hero waits at the border of the swamp, where the road climbs out of the Blasted Lands. Hear him out to the end, whatever you think of orcs when you get there." },
        { id = "h_tale", tags = { "news" }, when = { questDone = TODO_QUEST("A Tale of Sorrow") },
          text = "So you've heard his story, and now you know what grows in the south while we squabble. Tell me you feel a little less certain about who the enemy is." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "On cold nights like this one I count the demons' fires in the south from the wall. There are more of them than there are of us, and that's before you count the ogres." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm in no hurry; nobody here wants to talk to me anyway." },
        { id = "h_again2", text = "Go on. A diplomat's only weapon is a long conversation." },
      },
      choices = {
        { text = "Who do you speak for, Ambassador?", next = "who" },
        { text = "What do you mean, the wrong enemy?", next = "enemy" },
        { text = "What grows in the south?", next = "legion" },
        { text = "How does the garrison treat you?", next = "garrison" },
        { text = "The Light stands against demons, whoever else does.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Thrall would agree with you, elf.", next = "orc", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You'd use warlocks against the Legion, Ambassador?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "My people fought the Legion ten thousand years ago.", next = "k_elf", when = { race = "NightElf" } },
        { text = "My ancestors were Highborne, Ambassador.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "Good day, Ambassador.", next = "END" },
      },
    },

    who = {
      lines = {
        { id = "w_default", text = "For anyone with sense, which in these lands makes for a very small embassy. The title is a courtesy I extend to myself, since nobody else seems inclined to." },
      },
      choices = {
        { text = "You're an elf of Quel'Thalas?", next = "who_elves" },
        { text = "That's not much of an answer.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_elves = {
      lines = { { id = "we_default", text = "I was, when there was a Quel'Thalas to be of. The Scourge took our kingdom, and what's left of us took a new name in memory of the dead; we call ourselves blood elves now, and we have learned exactly what a common enemy is worth." } },
      choices = {
        { text = "I'm sorry for your people.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "And yet you lecture us about squabbling.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },

    enemy = {
      big = true,
      lines = {
        { id = "e_default", text = "Alliance and Horde squabble over scorched earth while the true power in these lands grows in strength and number. I would rather see you fight beside an orc today than be routed beside your countrymen tomorrow." },
      },
      choices = {
        { text = "Who should I talk to?", next = "enemy_hero" },
        { text = "The Horde burned half the world. I won't fight beside them.", next = "BACK", fx = { align = { honor = -1 }, opinion = { horde = "never" } } },
        { text = "If the demons are the threat, I'll stand with anyone.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2, opinion = { horde = "common_cause" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy_hero = {
      lines = { { id = "eh_default", text = "There's an orc, a fallen hero of the Horde, at the border of the swamp and these lands. He knows the truth of the Blasted Lands better than anyone in this keep, and he paid for it in a way I'd not wish on anyone." } },
      choices = {
        { text = "I'll go and hear him.", next = "BACK", fx = { affinity = 1 } },
        { text = "What happened to him?", next = "enemy_paid" },
      },
    },
    enemy_paid = {
      lines = { { id = "ep_default", text = "That's his to tell, not mine; I'd only spoil it. Only go with an open mind, and keep your sword in its sheath until he's finished." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    legion = {
      lines = {
        { id = "l_default", fx = { learn = { "burning_legion", "tainted_scar" } },
          text = "The Burning Legion, or what remains of it on this side of the Portal: demons in the Tainted Scar, cultists and warlocks who serve them, ogres who do their fighting. Something commands all of that, and it isn't an ogre." },
      },
      choices = {
        { text = "Then what does?", next = "legion_who" },
        { text = "Nethergarde will hold.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    legion_who = {
      lines = { { id = "lw_default", text = "I've heard whispers, and whispers aren't proof. The mages here want proof before they'll lift a finger, and by then it may be too late to lift anything." } },
      choices = {
        { text = "Whispers are more than I've got. Tell me.", tag = "Persuade", next = "legion_name",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("A Tale of Sorrow") }, { class = { "PRIEST", "PALADIN" } } } } },
          fail = { next = "legion_proof", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_name = {
      big = true,
      lines = {
        { id = "ln_default", text = "A dreadlord, if the orc hero is right, one of the demon lords who once whispered in Lordaeron's ear, now sitting over these lands like a spider. The ogres' warlord and two of the Shadowsworn serve him, and so, the orc says, do the soldiers he lost." },
        { id = "ln_heard", when = { questDone = TODO_QUEST("A Tale of Sorrow") },
          text = "You've heard it from the orc himself, so you know the name: Razelikh, a dreadlord, with Grol of the Dreadmaul and two of the Shadowsworn as his hands. The mages call it a story, and I call it the only map of the enemy anyone in this keep has." },
      },
      choices = {
        { text = "Then we strike at him.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "And the Alliance won't believe it.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    legion_proof = {
      lines = { { id = "lp_default", text = "Now you sound like the mages. Go and find your own whispers, then, and come back when you're ready to believe them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    garrison = {
      lines = { { id = "g2_default", text = "Politely, coldly and from a distance, the way a garrison treats anything it doesn't understand. The Quartermaster feeds me last and the soldiers watch me eat, and I've learned to take my bread to the wall and eat it there." } },
      choices = {
        { text = "They'll come round.", next = "BACK", fx = { affinity = 1 } },
        { text = "Can you blame them?", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Then you're the first in this keep to say so aloud. If the Light has no quarrel with an orc who fights demons, perhaps the Alliance could stop having one for a season." } },
      choices = {
        { text = "The Light shelters anyone who stands against the dark.", next = "BACK", fx = { align = { light = 1, honor = 1 }, affinity = 2 } },
        { text = "The Light also remembers who burned Lordaeron's villages.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    orc = {
      lines = { { id = "or_default", text = "So I've heard, and it's one of the few things your Warchief and I agree on. Tell him, if you ever speak to him, that there's an elf at Nethergarde who'd buy him a drink." } },
      choices = {
        { text = "I'll pass it on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_lock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "I would use anyone who knows the enemy's face, and you know it better than the soldiers on this wall. Whether that makes you a weapon or a warning, I haven't decided, and I'm not certain you have either." },
      },
      choices = {
        { text = "A weapon. Point me south.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "A warning. I know what it costs.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What grows in the south?", next = "legion" },
      },
    },
    k_elf = {
      lines = {
        { id = "xel_default", text = "Then you need no lecture from me, and I'm glad of it, for I've given this one to every soldier on the wall and they look at me as if I'd grown a second head. Tell your Sentinels the Legion never forgot your forests, even if the humans never learned their name." },
      },
      choices = {
        { text = "We remember. We'll stand with whoever stands against it.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "My people fight their own wars, elf.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },
    k_sky = {
      lines = {
        { id = "xsk_default", text = "Highborne. My people say the same of themselves, and we have spent ten thousand years not quite agreeing with yours about what it means. Still, an elf who knows what the Legion is needs no persuading, and I am tired of persuading." },
      },
      choices = {
        { text = "Then we agree on the one thing that matters.", next = "BACK", fx = { affinity = 2 } },
        { text = "My people chose exile over that kind of magic.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Diplomats hear a great deal, mostly from people who don't think we're listening. Pick a subject." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've listened to me, which nobody else here does, so I'll return the favour. Ask anything." },
    },
    background = {
      { id = "tp_bg", text = "An elf of a kingdom that no longer exists, carrying a message nobody wants to hear. I've had better posts.", next = "who" },
      { id = "tp_bg2", text = "I've worn this title in more halls than I can count, and been shown the door in most of them." },
    },
    advice = { { id = "tp_ad", text = "Before you draw your sword, ask who profits from the fight. In these lands, the answer is rarely the one swinging." } },
    burning_legion = { { id = "tp_legion", text = "The only enemy in these lands worth the name. Everything else is a squabble.", next = "legion" } },
    tainted_scar = { { id = "tp_scar", text = "Where the demons gather, and where the lord of these lands keeps his court, if the whispers are right." } },
    nethergarde = { { id = "tp_nether", text = "A fine keep full of people watching the wrong door. The Portal's closed, but the demons are already on this side." } },
    dark_portal = { { id = "tp_portal", text = "An old wound, and the Legion is the infection. The mages stare at the wound and ignore the fever." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beneath an ambassador's notice. Or above it; I can never remember which." } },
  },
}

P:NPC {
  key = "enohar", id = TODO_NPC("Enohar Thunderbrew"), name = "Enohar Thunderbrew",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "nethergarde" }, temper = { "jovial" }, values = { "loyal", "brave" },
  notices = { "race", "drunk" },

  impression = {
    first = "Enohar Thunderbrew is a dwarf who serves her watch at Nethergarde with a mug never far from her hand. Mention her family's ale and she bristles like a cat; mention home and she goes quiet.",
    third = "{name} met Enohar Thunderbrew, a dwarf of the famous brewing family serving at Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Ho there! Pull up a crate, an' don't tell the Quartermaster what's in my mug." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, I was runnin' out o' people tae drink with." },
    { id = "g_ragnar", when = { questDone = TODO_QUEST("Ragnar Thunderbrew") }, text = "Ye went tae see Ragnar! Was he still red in the face, or had he simmered down a bit?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf! Now the keep's got two folk in it who know what a proper stout tastes like, an' I'm buyin'." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ha! Ye've had a few already, haven't ye? Then ye're my kind o' company, though mind the stairs on yer way out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Enohar Thunderbrew, o' the Thunderbrews o' Kharanos, the finest brewers in all o' Khaz Modan, an' don't let anyone tell ye otherwise. Things get a wee bit stuffy in Nethergarde, so now an' then I have a brew tae take my mind off the duty." },
        { id = "h_ragnar", tags = { "news" }, when = { questActive = TODO_QUEST("Ragnar Thunderbrew") },
          text = "Ragnar's at the distillery in Kharanos, steamin' like a kettle. Go an' see him, an' tell him Enohar sent ye, so he knows the family's lookin' after its own." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Cold as a Dun Morogh winter out there tonight, an' not half as pretty. Good night for a warm mug, if ye ask me." },
      },
      again = {
        { id = "h_again", text = "What else, friend? My mug's half full, so I've got time." },
        { id = "h_again2", text = "Out wi' it, then, an' I'll listen, mostly, between sips." },
      },
      choices = {
        { text = "What's this about stolen ale?", next = "ale" },
        { text = "What brings a Thunderbrew all the way out here?", next = "why" },
        { text = "How do the dwarves find Nethergarde?", next = "dwarves" },
        { text = "To Ironforge, and to good ale!", next = "toast", when = { race = "Dwarf" } },
        { text = "I've had a few myself, if I'm honest.", next = "drunk", when = { drunk = true } },
        { text = "I could steal the ale back, quiet-like.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Enjoy your brew, Enohar.", next = "END" },
      },
    },

    ale = {
      lines = {
        { id = "a_default", fx = { learn = { "dark_iron" } },
          text = "Somebody's been stealin' Ragnar's ale, an' worse, one o' the family recipes went with it. He's lookin' for stout adventurers an' willin' tae pay, an' if ye ask me it's those Dark Iron thieves again." },
      },
      choices = {
        { text = "Why the Dark Irons?", next = "ale_darkiron" },
        { text = "I'll talk to Ragnar.", next = "BACK", fx = { affinity = 1 } },
        { text = "It's only ale.", next = "ale_only" },
      },
    },
    ale_darkiron = {
      lines = { { id = "ad_default", fx = { learn = { "blackrock_depths" } },
        text = "Because they've wanted a Thunderbrew recipe for as long as there've been Thunderbrews, an' because they've nothin' fit tae drink down in those Depths o' theirs. They'd steal the foam off yer mug if ye looked away." } },
      choices = {
        { text = "Then I'll get it back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale_only = {
      lines = { { id = "ao_default", text = "Only ale? Only ale? I'll pretend ye didnae say that, for the sake o' yer health, an' ye can pretend I'm no' reachin' for my axe." } },
      choices = {
        { text = "I take it back. It's never only ale.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "Duty, same as everyone. Ironforge sends soldiers tae Nethergarde, an' a Thunderbrew doesnae hide behind the family name when the King asks for volunteers." } },
      choices = {
        { text = "Do you miss Kharanos?", next = "why_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_home = {
      lines = { { id = "wh_default", text = "Every day, an' every night twice over. The snow, the smell o' the mash, my kin shoutin' over the kettles; out here it's red dust an' mages who drink water on purpose." } },
      choices = {
        { text = "You'll see it again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dwarves = {
      lines = { { id = "d_default", text = "Too hot by day, too cold by night, an' no proper stone tae dig into anywhere. We grumble, we hold the walls, an' we drink when the ogres give us a night off." } },
      choices = {
        { text = "The walls are in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    toast = {
      lines = { { id = "t_default", text = "An' tae good ale! Ha, now that's a proper toast, an' the first I've heard in this keep since spring." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    drunk = {
      lines = { { id = "dr_default", text = "Then sit an' be honest with me; the soldiers here only drink on holidays, an' they hold it like gnomes. Just don't tell the Quartermaster I let ye." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Steal it back! Now there's a lad or lass after my own heart, though I'd no' call it stealin' when it was mine tae begin wi'. The Dark Irons keep it in their camp like it's treasure, which, tae be fair, it is." },
      },
      choices = {
        { text = "Consider it reclaimed, not stolen.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "What's this about stolen ale?", next = "ale" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Thunderbrew, born over a kettle in Kharanos. Everythin' else is just the job.", next = "why" } },
    advice = { { id = "tp_ad", text = "Never trust a dwarf who doesnae drink, an' never trust a Dark Iron who does." } },
    dark_iron = { { id = "tp_darkiron", text = "Thieves an' worse, the lot o' them. If ye find any o' Ragnar's ale down there, bring it home." } },
    nethergarde = { { id = "tp_nether", text = "Good walls, good soldiers an' terrible beer. Two out o' three's no' bad." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. Ask me about ale an' I'll talk till dawn." } },
  },
}

P:NPC {
  key = "alexandra", id = TODO_NPC("Alexandra Constantine"), name = "Alexandra Constantine",
  bible = "bibles/blastedlands.md", role = "flightmaster", tier = "service",
  communities = { "nethergarde" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Alexandra Constantine keeps Nethergarde's gryphons alive in a land that seems built to kill them. She speaks of her birds the way other people speak of their children.",
    third = "{name} met Alexandra Constantine, the gryphon master of Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Need a gryphon? Keep your voice down near the roost; they're napping off the heat." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The birds remember you, which is more than they do for most." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good; you'll know how to sit a gryphon without strangling it. The soldiers here hold the reins as if they were drowning." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alexandra Constantine, gryphon master of Nethergarde. My birds carry the keep's letters and the keep's visitors, and the Blasted Lands do their best to kill all three." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights are cold enough to frost a gryphon's beak out here. I'll find you a blanket for the saddle if you're going." },
      },
      again = { { id = "h_again", text = "Is there something else, or shall I saddle a bird for you?" } },
      choices = {
        { text = "Where can your gryphons take me?", next = "routes" },
        { text = "How do the birds manage this place?", next = "birds" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    routes = {
      lines = { { id = "r_default", text = "West to Stormwind, which is where most people want to go after a day here, and north over the mountains to Morgan's Vigil in the Burning Steppes. We give the Dark Portal a wide berth; there's a black drake circling it that doesn't care for company." } },
      choices = {
        { text = "A drake?", next = "routes_drake" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_drake = {
      lines = { { id = "rd_default", text = "Teremus, the soldiers call it, and it's bigger than any three of my birds together. We fly the long way round and nobody complains about the time twice." } },
      choices = { { text = "Long way it is.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    birds = {
      lines = { { id = "b_default", text = "Badly, and bravely. The red dust gets into their feathers and the cold gets into their bones, so I brush them every evening and blanket them every night, and they still look at me as if it's my fault." } },
      choices = {
        { text = "Poor birds.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the birds at Nethergarde, and I keep them alive, which out here is a full-time job." } },
    advice = { { id = "tp_ad", text = "Fly before noon or after sunset. Midday air over the Blasted Lands throws a gryphon about like a leaf." } },
    _none = { { id = "tp_none", text = "I only know birds and weather. Ask the Quartermaster about the rest." } },
  },
}

P:NPC {
  key = "bernie", id = TODO_NPC("Bernie Heisten"), name = "Bernie Heisten",
  bible = "bibles/blastedlands.md", role = "vendor", tier = "service",
  communities = { "nethergarde" }, temper = { "warm" }, values = { "generous" },
  notices = { "kit" },

  impression = {
    first = "Bernie Heisten feeds Nethergarde from whatever the caravans bring, and talks the whole time he does it. He knows every soldier's order and most of their troubles.",
    third = "{name} met Bernie Heisten, who sells food and drink to the garrison at Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Course you are; everyone who comes up that road is. Have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I'll take that as a compliment to the cooking." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like the ogres chewed you and spat you out, friend. Eat something before you go see Strumner about that armor; he's grumpy on an empty stomach, and so are you, I'd wager." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bernie Heisten, food and drink for the finest and grimmest garrison in the Alliance. Bread, cheese and water, mostly, because that's what survives the road from Darkshire." },
        { id = "h_caravan", when = { questRecent = { TODO_QUEST("Deliver the Shipment"), days = 7 } },
          text = "The Quartermaster says you brought in Biggs's shipment. There was cheese in it, real cheese, so you've made a whole keep very happy." },
      },
      again = { { id = "h_again", text = "Anything else, or shall I wrap something up for the road?" } },
      choices = {
        { text = "What's good today?", next = "food" },
        { text = "You must hear all the keep's gossip.", next = "gossip" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Not hungry, thanks.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Honestly? The bread, because I bake it myself, and the water, because it came from Stormwind and not from anywhere around here. Don't drink from anything in the Blasted Lands, whatever it looks like." } },
      choices = {
        { text = "What's wrong with the water here?", next = "food_water" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_water = {
      lines = { { id = "fw_default", text = "Ask the mages; they'll tell you about taint for an hour. All I know is that a soldier drank from a pool by the road last spring and spent a week seeing things." } },
      choices = { { text = "I'll stick to the bread.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    gossip = {
      lines = { { id = "gs_default", text = "Every scrap of it, friend. The Quartermaster's worried about the caravans, the Watcher hasn't slept since some books arrived, and the elf ambassador eats his bread on the wall because nobody'll sit with him." } },
      choices = {
        { text = "Why won't anyone sit with him?", next = "gossip_elf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_elf = {
      lines = { { id = "ge_default", text = "Because he keeps telling them to make friends with orcs, and half of them lost fathers to the Horde. I give him an extra roll; he's not a bad sort, just a tiring one." } },
      choices = { { text = "That's kind of you.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cook for soldiers, and I'll cook for soldiers until the caravans stop coming. That's all there is to me." } },
    advice = { { id = "tp_ad", text = "Eat before you go out, not after. Out there you'll lose your appetite quick, and you'll want the strength." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I know bread, and I know who's been complaining." } },
  },
}

P:NPC {
  key = "strumner", id = TODO_NPC("Strumner Flintheel"), name = "Strumner Flintheel",
  bible = "bibles/blastedlands.md", role = "blacksmith", tier = "service",
  communities = { "nethergarde" }, temper = { "gruff" }, values = { "practical" },
  notices = { "kit" },

  impression = {
    first = "Strumner Flintheel says as little as a dwarf can and still do business, and his hammer does the rest of the talking. He is, by his own reckoning, the only honest repair for leagues.",
    third = "{name} met Strumner Flintheel, the armorer at Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Armor. Mended or sold, it's all the same price of patience." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and dented again, by the sound of ye." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ogre club, by the shape o' that dent, and a big one. Set it on the bench before it falls off ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Strumner Flintheel, armorer. There's no other forge between here and Darkshire that'll take yer coin, so ye'll forgive me if I don't haggle." },
      },
      again = { { id = "h_again", text = "Anythin' else, or can I get back tae the anvil?" } },
      choices = {
        { text = "What do the Blasted Lands do to armor?", next = "wear" },
        { text = "Is it hard to work out here?", next = "work" },
        { text = "I need repairs.", next = "BUSINESS" },
        { text = "What's the clay done to my plate?", next = "k_plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Never mind.", next = "END" },
      },
    },
    wear = {
      lines = { { id = "w_default", text = "Ogres dent it, demons scorch it and the red dust gets into every joint and grinds like sand in a mill. I mend more fur and leather than ye'd think, because the cold nights crack the straps." } },
      choices = {
        { text = "What about demons?", next = "wear_demons" },
        { text = "I need repairs.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wear_demons = {
      lines = { { id = "wd_default", text = "Felhound teeth leave a green stain that won't come out wi' any polish I know. I tell folk it's a mark of honour, and charge them the same either way." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    work = {
      lines = { { id = "wk_default", text = "Coal comes up the same road as the bread, which means some weeks it doesn't come at all. I've learned tae work small and waste nothing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_plate = {
      lines = {
        { id = "xpl_default", text = "Got intae every joint an' ground away at it, like it does tae everyone's. Plate's the worst for it, for the red dust sits in the hinges, so knock it out every night or ye'll be walkin' like a rusty gate by the week's end." },
      },
      choices = {
        { text = "I'll knock it out every night.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I need repairs.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a dwarf wi' a hammer at the end o' a long road. Nothin' more to tell." } },
    advice = { { id = "tp_ad", text = "Oil yer buckles every night out here, or the dust will seize them by morning." } },
    _none = { { id = "tp_none", text = "Don't know, and don't much care, so ye'd best ask the Quartermaster upstairs." } },
  },
}
