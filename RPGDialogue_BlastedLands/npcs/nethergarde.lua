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
    { id = "g_default", text = "Mind the crates, friend, and don't mind the shouting; the sergeant lost at dice again, and the recruits are paying for it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing? Come in, come in, and tell me you've brought something I can write down." },
    { id = "g_supplies", when = { questDone = TODO_QUEST("Supplies for Nethergarde") }, text = "My powerstone runner! The mages still talk about the day that crate came in glowing." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Cold enough to freeze the ink tonight. Shut the door behind you, would you?" },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been gone {away}, and I've written down every crate that came through that gate in the meantime. Come in and give me something new to write." },
    { id = "g_away_long", when = { away = 60 }, text = "I'd half filed you under the missing after {away} away, and I'm glad to cross it out. Welcome back to Nethergarde." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a good deal tougher since we last spoke. I'll put that in the ledger, under assets." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone in the Keep caught you in a lie. Ledgers only work when people tell the truth, so keep yours honest while you're here." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word around the garrison is you've done Nethergarde a good turn. I've marked it down, and that's the highest honour I can give." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Our clerics will want a word, and so will I, because they go through bandages and prayers faster than I can order either." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another mage, is it? Then you'll know what an Azoran crystal costs, and you'll forgive me for counting them twice." },
    { id = "n_quarter", cat = "origin", when = { origin = "human_mage_quarter" },
      text = "Trained in Stormwind's Mage Quarter, were you? Half the magi on these walls came out of the same towers, and every one of them talks about Dalaran as if they'd built it themselves, so you'll fit right in." },
    { id = "n_lamb", cat = "origin", when = { origin = "human_lamb_cellar" },
      text = "I know that look, because I've seen it on the Lamb's people when they come through for the demons on the plain. You'll sign for anything you take from my stores, and you'll sign in ink, not in anything else." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Light's sake, look at your armor; the ogres had a go at you, didn't they? Strumner's at the forge downstairs, and he's the only one who'll mend it for leagues." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good. Half the soldiers on these walls are your kin, and they've been complaining that nobody here pours a proper ale." },
  },

  start = "hello",
  nodes = {
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Because the road from Stormwind runs through the Swamp of Sorrows and past the orcs at Stonard, and every driver who's made the trip twice asks for double pay the third time. The Blasted Lands are the edge of the world, friend, and nobody hurries to the edge." } },
      choices = {
        { text = "Nethergarde deserves better. Stormwind should send more.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A garrison out here should learn to fend for itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If you can tell me when the next caravan from Darkshire's in trouble, you'd be the most useful soul in the keep. The fel out there sours everything, though, and I'd wager it sours your spirits too." } },
      choices = {
        { text = "I'll serve the keep however it needs me, ledger and all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spirits don't fit in ledgers. I'll go where they lead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They feed the wards that watch the Portal, as I understand it, and when the stones go dark the wards go dark with them. I don't pretend to know how, but I know that when a crate comes in late, Mahar Ba stops sleeping, and then everybody hears about it." } },
      choices = {
        { text = "The wards matter. I'll help keep them fed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wards on a dead portal? Sounds like waste to me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ogres, mostly, and the swamp, which swallows a wagon wheel as soon as look at it, and now and then a soldier who's tired of hardtack. I count everything twice, and I'd count it three times if the candles lasted." } },
      choices = {
        { text = "I'll bring your crates back, Quartermaster.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hungry soldier's theft hardly counts, surely.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The mages say it's the Portal and the old fel magic soaked into the ground, and the soldiers say it's the ogres trampling everything flat. I say it's both, and the result's the same: every grain we eat comes down the road from Darkshire in a wagon." } },
      choices = {
        { text = "The land can heal, Lungertz. Keep trying the seed corn.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "This land's dead for good. Trust the wagons and stop wasting seed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A whole company, and here I am with half a storeroom and the Stormwind wagons three weeks late. Visitors eat what the garrison eats at Nethergarde, which is salt pork and good intentions." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. My crates go missing between Darkshire and here often enough without help, so please tell me you're the kind who brings things back." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! The tower lot will be glad of you, and so will I, because every mage up there wants powerstones, and every powerstone comes through my ledger." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid in Nethergarde! I've a crate of seed corn nobody's managed to grow out here, and you're very welcome to try, though I'd not stake my supper on it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman of Ironforge! I'll write you in the ledger as a soldier, because I haven't got a column for people who talk to the elements, and I'm not about to make one." },
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
        { text = "Why do the mages need so many powerstones?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Who takes your crates on the road?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why won't anything grow around Nethergarde, Quartermaster?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does Nethergarde have any use for a shaman, Quartermaster?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Why are your supply wagons always late?", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
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
    bolvar = { { id = "tp_bolvar", text = "The Highlord signs my requisitions when they reach him, and they reach him about one time in three. I've stopped blaming him, because I've seen the queue." } },
    varian = { { id = "tp_varian", text = "The king went missing, and the supply wagons got lighter the same month. I'm not saying the two are connected, only that I've noticed." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor sits on the committee that approves Nethergarde's budget, and our budget has gone down twice since she joined it. I'm sure she has her reasons, and I'm sure I'll never hear them." } },
    second_war = { { id = "tp_second_war", text = "The Second War is why Nethergarde exists, so somebody would always be watching the Portal. I count crates so the watchers don't have to." } },
    draenethyst = { { id = "tp_draenethyst", text = "Draenethyst crystals turn up out in the wastes, and Kum'isha pays for them, and I've no idea why. I've written him into the ledger as a regional curiosity." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took the north, and every soldier Stormwind sends there is one it can't send here. I understand it, but my ledger doesn't." } },
    khadgar = { { id = "tp_khadgar", text = "Archmage Khadgar founded this keep, and he left orders so thorough I'm still finding them in the drawers. I'd have liked to meet him, if only to ask what he meant by half of them." } },
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
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I've filled most of another book in that time, almost none of it good news. Do come in and tell me something better." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a great deal since we last spoke, which is more than I can say for my understanding of the Portal. Come and tell me what you've seen." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I'm told you talked someone in the Keep round to your view. I'd be grateful if you'd try it on the mages, because I've been failing for months." },
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
    xpt_mage = {
      big = true,
      lines = { { id = "xpt_mage_default", text = "Like a door left open in winter, with the cold of somewhere else still clinging to it, though the gate has been dead since the far side was destroyed. We watch it anyway, because nobody who saw the Horde come through it ever trusts a closed door again." } },
      choices = {
        { text = "Nethergarde's watch is wise. Keep it, whatever it costs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The gate is dead. Dalaran's mages are needed elsewhere.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hold the stair, I should think, the way the Alliance's soldiers held the ground here at the end of the Second War while Khadgar did his work. We measure and we ward, but if anything comes through that gate again, it'll be steel at the bottom of the steps that buys us time to finish." } },
      choices = {
        { text = "Then I'd hold it, and trust the Watchers to finish their work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Steel shouldn't wait on wards. I'd strike first and measure afterward.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They change, slowly, and we've been writing it down for years: the boars come back from the Portal's shadow with thicker hides and worse tempers, and the basilisks grow stone along their spines. If you hunt down there, tell me what you notice, because a hunter's eye sees what my instruments can't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} out of the Tainted Scar, I beg you. I've seen what that ground does to a creature that drinks from its pools, and I'd hate to have to write it in my ledger." },
      },
      choices = {
        { text = "I'll tell you what I see. Your records matter.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Twisted beasts get an arrow, Watcher, not a ledger entry.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Its knights were at the Portal at the end of the Second War, when the Alliance broke the Horde's hold on it, and some of them crossed over with Khadgar and never came back. I keep a list of their names, because the official histories only remember the generals." } },
      choices = {
        { text = "Their names should be honoured in Stormwind, not just here.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lists won't bring them back. Watch the Portal instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Tried, yes, and failed. The fel taint goes down into the rock. Our mages can hold it back, but only the Cenarion Circle could ever hope to undo it, and they have never answered our letters." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Portal itself is quiet, but the Dreadmaul ogres and the Shadowsworn cultists come and go around it at all hours, and nobody knows who sends them. A quiet pair of eyes on the cultists' camps would tell me more than another month of readings from this tower." } },
      choices = {
        { text = "I'll watch and report exactly what I see, Watcher.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll watch, and decide myself what's worth reporting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Watcher.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_mage", tags = { "news" }, when = { party = { class = "MAGE" }, faction = "Alliance" },
          text = "You travel with a mage, I see, and {companion} will feel the Portal before they see it, as all of us did when we first came. Nethergarde was raised by Dalaran's mages to watch that gate, and we have not stopped watching." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, here? Then you'll know how to stand still and watch without being noticed, which is most of what we do in Nethergarde, though we write it all down afterward." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! The garrison downstairs keeps the Dreadmaul off our wards while we take our readings, and I'm more grateful to your sort than I ever remember to say." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, out here? There's precious little left alive in the Blasted Lands to track, though what's left has grown strange enough to keep you busy." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. I read in the old books that your people once healed a world. I hope you've brought a little of that here." },
        { id = "h_default", key = true,
          text = "Watcher Mahar Ba, of the mages of Nethergarde. We watch the Dark Portal, and when it does nothing, which is always, we measure what the nothing is doing to the land around it." },
        { id = "h_essays_wait", tags = { "news" }, when = { questActive = TODO_QUEST("Mazen's Behest") },
          text = "You've come from Master Mazen? Then tell me you have Khadgar's essays, because I'd begun to think my request had fallen behind a bookcase in Stormwind." },
        { id = "h_essays_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mazen's Behest"), days = 7 } },
          text = "I haven't slept, I confess, not since you brought me the essays. To read Khadgar's own reasoning about how two worlds can touch is a thing I never expected to do in my life." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The Portal looks almost peaceful by starlight, which is exactly when I trust it least. I take my readings at night; the land seems to talk more when it's cold." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, at Nethergarde! The Silver Hand was founded in the years the orcs poured through that Portal, so I suppose you've come to see where your order's story began." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask; I'd much rather talk than calculate, though don't tell the others." },
        { id = "h_again2", text = "What else would you like to know? I warn you, I can talk about the Portal until the candle gutters." },
      },
      choices = {
        { text = "Has Nethergarde tried to restore the land?", next = "druid_talk", when = { class = "DRUID" } },
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
        { text = "Did the Silver Hand fight at the Dark Portal, Watcher?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would a warrior do if the Portal woke, Watcher?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What happens to the beasts that live near the Portal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does a Watcher need that a rogue could help with, Mahar Ba?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "My companion is a mage. What does the Portal feel like?", next = "xpt_mage", when = { party = { class = "MAGE" }, faction = "Alliance" } },
        { text = "I'll leave you to your readings.", next = "END" },
      },
    },

    watch = {
      lines = {
        { id = "w_default", fx = { learn = { "dark_portal" } },
          text = "The taint, mostly: the soil, the rock, the beasts, all of it changed by the magic that tore the Portal open and then tore it down again. We measure how far it spreads each year, and we make sure it spreads no further than the edge of these lands." },
      },
      choices = {
        { text = "Is the Portal really dead?", next = "watch_portal" },
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
        { text = "Keep it out, then. I'll respect the wards.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
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
    dalaran = { { id = "tp_dalaran", text = "I studied in Dalaran before the Scourge came, and I still dream about the libraries. They're rebuilding now, behind their shield, and they haven't written to us in months." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor sent us here to watch the Portal, and they still pay our stipends, mostly on time. I'd like them to send more mages, but they're busy with their own ruins." } },
    second_war = { { id = "tp_second_war", text = "The Second War ended when Khadgar and the Alliance closed the Portal, and I've spent my life studying what they did. It's still the finest piece of magic I've ever seen." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is the work of a necromancer from Dalaran, and the Kirin Tor have never forgiven themselves for Kel'Thuzad. Neither have I, and I never met him." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a member of the Kirin Tor, a scholar like me, and he turned to necromancy and gave the north to the dead. When I read too late into the night, I think about him." } },
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
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' I've chalked the circle three times since. Mind it now, would ye?" },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear somebody in the Keep was talked intae somethin' by a clever tongue. I charge for my answers, friend, an' I check the payment twice." },
  },

  notice = {
    { id = "n_wildhammer", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, an' by the look o' ye one who's never sat a gryphon. Ironforge, then, where they keep their feet on the stone an' their heads under it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, frownin' at my books before ye've read a single page. Go on, say it; everyone in this keep has." },
  },

  start = "hello",
  nodes = {
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then an old debt's been paid, though not by any dwarf of my clan. When the Dark Irons' sorceress died at Grim Batol her curse fell on the whole mountain, and my people had to leave it to rot and make a new home in the Hinterlands, and no Wildhammer has forgotten whose sorcery did it." } },
      choices = {
        { text = "A debt paid is a debt done. Let the grudge die with him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep the grudge. A people that forgets gets wronged twice.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Do the Wildhammer still want Grim Batol back?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Every Wildhammer dreams of it, but the curse still lies on that place, and the stone there is black and sick. I'd sooner fly a gryphon through a thunderstorm than set foot in Grim Batol before someone cleanses it." } },
      choices = {
        { text = "Maybe someday someone will. Something else, Thadius.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, we fight frae the sky, wi' a storm hammer thrown off a gryphon's back, an' the Bronzebeards fight frae behind a wall o' shields an' call it discipline. Both'll kill an orc, mind, but only one o' them has ever seen the orc's face frae above." } },
      choices = {
        { text = "Drill them till they hate you. A shield wall that hates you still holds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the sky and the hammer, and nobody's orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Both, like a good axe, an' it depends entirely on whose hand is on the haft. I've seen things in the chalk that I'd rather not have seen, an' I've found lost gryphons an' lost children, an' I'll not be ashamed o' the second for fear o' the first." } },
      choices = {
        { text = "Then use it honestly, and I'll not judge it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some doors should stay shut, whatever good comes through.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The Dark Portal and everything that came through it. The orcs' warlocks drained the life from Draenor to power their magic, and they began the same work here. Nethergarde exists to make sure it never finishes." } },
      choices = {
        { text = "Then I'll help Nethergarde guard what remains.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Guarding a dead land seems a waste of good mages.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "As real as yer fireballs, though it doesnae make as pretty a noise. The Watchers measure the Portal wi' crystals an' charts, an' I ask the smoke what it's seen, an' half the time we get the same answer, though I'll no' tell them that." } },
      choices = {
        { text = "Chants or charts, whatever works should be used.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Proper study beats chanting, Thadius. Respectfully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Thadius.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It could, an' it has, an' I've charged handsomely for it. If ye've a mind tae lift anythin' in Nethergarde, remember there's a diviner up these stairs who'll find it by mornin', an' he'll want payin' by the thief." } },
      choices = {
        { text = "I'll keep my hands clean in Nethergarde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll steal somewhere far from your stairs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths" }, text = "So the Emperor's dead under the mountain, and the Dark Irons have lost their king in his own throne room! I'm a Wildhammer, mind, and my clan has a long memory where Thaurissan's line is concerned, so you'll forgive me if I pour a dram for it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, eh? Ye've the shoulders for a Wildhammer storm hammer, if ye ever tire o' whatever it is ye're carryin' now." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. I find lost things, an' ye find things that werenae lost till ye came along, so in a way we're in the same trade." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The Watchers downstairs think my chantin' is old superstition, an' I think their sums are, so we get along by no' talkin' at all." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. You have the look of one who would rather be anywhere else. I understand; I dream of trees myself, and wake to this." },
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
        { id = "h_listener", when = { origin = "dwarf_stone_listener" },
          text = "Ye hear the stone, don't ye? I can see it in how ye stand, as if the floor were talkin' an' ye were bein' polite. The priests in Ironforge'll no' know what tae make o' ye, but up at the Peak we'd have called it a gift, so tell me, what does this dead land say?" },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, climbin' my stairs. Ye'll want tae tell me my scryin' is unholy, I expect, so go on an' get it said, an' then we can talk business." },
      },
      again = {
        { id = "h_again", text = "Aye? What else, then? The circle's no' goin' anywhere." },
        { id = "h_again2", text = "Ask. I've answers for most things, an' prices for the rest." },
      },
      choices = {
        { text = "What killed the land here?", next = "druid_talk", when = { class = "DRUID" } },
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
        { text = "Is divination real magic, Thadius?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could your divination find stolen goods?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is divination a gift or a danger, Thadius?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do Wildhammer warriors fight differently from Ironforge's?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Emperor Thaurissan is dead, Thadius. I saw him fall myself.", next = "xcl_brd", when = { cleared = "Blackrock Depths" } },
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
      lines = { { id = "sb_default", text = "Aye, if I have his feather an' my price. Swiftwind an' Keenclaw's chick, an' destined for great things if he lives tae grow; I'd find him for nothin', mind, but don't tell Talonaxe that." } },
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
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer o' Aerie Peak are my kin, an' they fly free an' drink free an' think a book is somethin' ye light a fire with. I love them dearly an' I left." } },
    magni = { { id = "tp_magni", text = "Magni's a fine king for the Bronzebeards, I'll grant ye, an' he doesn't tell the Wildhammer what to do, which is the best thing a king can do for us." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol was ours once, before the Dark Irons cursed it an' the orcs used it to break dragons. No Wildhammer goes there now, an' none ever should." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages taught me what I know, an' they never let me forget I was a dwarf. I learned anyway, an' I learned more than most o' them." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres are thick as stone an' twice as stubborn, an' they've no business near the Portal. I'd like them gone, an' I'd pay to see it." } },
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
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the garrison has scowled at me the whole time. It's good to see a face that doesn't." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in the Keep is furious with you, I'm told. Take it from a man everyone here is furious with, and go and speak to them while it's still only words." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you left someone in the Keep in a fine mood. That's diplomacy, you see, and it works better than the garrison believes." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That the line between Horde and Alliance is thinner than either side pretends. The elements answer an orc and a dwarf alike, and if they see no difference between you, I wonder why we insist on killing each other." } },
      choices = {
        { text = "The elements may not choose sides, but I do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps you're right. The spirits care nothing for banners.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The servants of the Burning Legion, which is a far older enemy than any orc. The Alliance spends good swords on Horde patrols in Ashenvale while the Shadowsworn bleed onto altars a few miles from this keep, and I find that very difficult to watch politely." } },
      choices = {
        { text = "You're right. Demon-worshippers first, old grudges after.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Horde earned my blade. I won't forget that for you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Tainted Scar, where men in robes bleed onto altars and call it worship, and the beasts around it have learned to give the place a wide berth. When the animals know where the danger lies and the garrison doesn't, someone ought to be asking why." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps its eyes on the south too, I notice. Animals are honest about demons in a way that diplomats are not, myself included." },
      },
      choices = {
        { text = "Then I'll scout the Scar and tell the keep what I find.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt for coin, Ambassador, not for warnings.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I speak for those who remember what Archimonde did to Dalaran, which ought to be everyone and is almost nobody. The Kirin Tor are scattered, and while they rebuild, the Alliance and the Horde sharpen their swords on each other." } },
      choices = {
        { text = "Then the old enemies should make peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace with the Horde? Not while blood's still fresh.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Ambassador.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Then perhaps every spy is sincere, which would be a pleasant surprise for us all. I carry no knives and steal no letters, which is more than I can say for half the garrison, so judge me by what I ask of you, not by what I won't say." } },
      choices = {
        { text = "Fair. I'll judge you by your deeds.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets cut both ways. I'll find yours, Ambassador.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It does, though perhaps not as loudly as I would like, and your druids sit with the tauren in Moonglade without a single sword drawn. If the Circle can keep that peace, then the Alliance and the Horde can keep it here too, and fight what came through the Portal instead of one another." } },
      choices = {
        { text = "The Circle's peace is a good example. The war should end.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Moonglade isn't Nethergarde. The Horde must answer for the war.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. I'd ask whose blood you've been trained to spill, though I suspect the answer is orcs, and I'd suggest very gently that the orcs are not the ones building altars south of this keep." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, and you've been looking at me the way you'd look at a trail, wondering where it leads. It leads south, if you'd like to know, toward the cultists nobody here cares to talk about." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be wondering who I really work for, I expect, and I'll tell you what I tell the captain: someone who would rather you lived." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Then you know, as I do, that Dalaran was not the Legion's first target, and it will not be the last." },
        { id = "h_default", key = true,
          text = "Ambassador Ardalan, at your service, though most here would say I serve nobody they'd care to name. I'm here to tell anyone who'll listen that we fight the wrong enemy in these lands." },
        { id = "h_squabbles", tags = { "news" }, when = { questActive = TODO_QUEST("Petty Squabbles") },
          text = "The fallen hero waits at the border of the swamp, where the road climbs out of the Blasted Lands. Hear him out to the end, whatever you think of orcs when you get there." },
        { id = "h_tale", tags = { "news" }, when = { questDone = TODO_QUEST("A Tale of Sorrow") },
          text = "So you've heard his story, and now you know what grows in the south while we squabble. Tell me you feel a little less certain about who the enemy is." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "On cold nights like this one I count the demons' fires in the south from the wall. There are more of them than there are of us, and that's before you count the ogres." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle. You of all people should hear me out, for the Circle has always said that the land matters more than the banners fighting over it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. How interesting; your people learned their strength from the stone, and now some of you learn the orcs' old ways as well, which proves my point rather nicely." },
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
        { text = "Do you speak for Dalaran, Ambassador?", next = "xmage", when = { class = "MAGE" } },
        { text = "Every spy says that, Ambassador.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Who should a warrior be fighting, then, Ambassador?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's south of the keep that you keep watching, Ambassador?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Circle really say the land matters more than banners, Ambassador?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What point does a dwarf shaman prove, Ambassador?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the jewel of the human kingdoms, and the elves sent their best students there. It will be rebuilt, I am told, though it may not open its gates as quickly as some would like." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are a council of mages who believe they can govern magic, and they have been wrong before. I respect their learning more than their judgment." } },
    sylvanas = { { id = "tp_sylvanas", text = "Lady Sylvanas Windrunner was Ranger-General of Silvermoon, and she died defending our homeland. What walks in her name now is something I cannot speak of without grief." } },
    arthas = { { id = "tp_arthas", text = "Prince Arthas led the dead through our gates and into the heart of Quel'Thalas. I will not say more about him, because I cannot say it politely." } },
    scourge = { { id = "tp_scourge", text = "The Scourge broke my homeland, and the Alliance was too divided to stop it. That is why I say the Alliance and the Horde must stop fighting each other, if anyone will listen." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron fell because its people would not believe what was coming until it was at their gates. I fear the same lesson is being forgotten in Stormwind." } },
    thrall = { { id = "tp_thrall", text = "The Warchief of the Horde has made peace with Theramore, and I think that wiser than most in Stormwind will admit. I say so quietly, and only to those who ask." } },
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
    { id = "g_away", when = { away = 14 }, text = "Ho, ye're back after {away} away! I've been drinkin' alone the whole time, an' it's no' the same." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear ye gave somebody in the Keep a proper scare. Good for ye, but no' me, for I'm only a wee bit brave, an' only when I've had a few." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf! Now the keep's got two folk in it who know what a proper stout tastes like, an' I'm buyin'." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ha! Ye've had a few already, haven't ye? Then ye're my kind o' company, though mind the stairs on yer way out." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Oh, the Thunderbrews mind everythin', {g:lad|lass}. They'd say the stone's for minin', the ale's for drinkin' an' spirits are for orcs, but I'm stuck here starin' at the Portal, so I've stopped mindin' much." } },
      choices = {
        { text = "Khaz Modan's stone speaks to me. I'll not hide that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I honor the old ways too. The spirits only add to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One mug steadies yer hand an' two makes ye brave, an' by the third ye're the bravest corpse the Dreadmaul ever ate. My granda carried a flask through the whole o' the Second War, an' he always said the trick was knowin' which side o' the battle tae drink on." } },
      choices = {
        { text = "I fight sober. Duty first, and ale after the line holds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warrior should fight the way he drinks, with his whole heart.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Precious little that's fit tae eat, I'll tell ye, because the boars taste o' brimstone an' the scorpids taste o' nothin' at all. Back in Dun Morogh we'd hunt boar in the snow an' roast it by the brewhouse, an' I'll admit I think on that more often than a soldier should." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' who's this, then? {pet}, is it? Keep yer beast away from the barrels, because the last one that got its nose in a keg o' Thunderbrew slept for two days an' woke up mean." },
      },
      choices = {
        { text = "Your post is here, Enohar. Dun Morogh will keep.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Go home, then. Nobody should rot out here for duty.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Needs? No. Wants? Aye, an' there's a difference, though the captain doesnae always see it. My kin brew the finest ale in Khaz Modan an' I'm stuck at the end o' the world watchin' a gate, so ye'll forgive me a wee comfort." } },
      choices = {
        { text = "Duty comes before comfort, Enohar, every time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A watch kept is a watch kept. Drink up.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some pray, some drink, an' most do both, an' I'll no' judge which comes first. Ye stand watch beside that Portal for long enough an' ye learn that the Light an' a good ale both keep the dark from creepin' in." } },
      choices = {
        { text = "Faith keeps watch better than ale ever could.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Ale's honest comfort. The Light won't begrudge it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "A little, and only with stubbornness. I gather herbs and roots that grow nowhere else, twisted things that drink demon blood. Feed them to a man and he'll either be strong as a bull or spend three days in the latrine trench." } },
      choices = {
        { text = "Then I'll help you find what heals rather than harms.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Twisted things should be burned, not harvested.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Done, an' a fair trade! Kharanos is snow an' stills an' the best ale in Khaz Modan, an' Ragnar's there fumin' over our stolen brew while I drink Nethergarde's swill, so ye can see why a cold mug cheers me." } },
      choices = {
        { text = "Duty first. The keep needs you more than Kharanos.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Family first. Kharanos needs you more than the keep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because they're watchin' the very door the demons came through, an' ye're standin' there wi' one at yer heel. Me, I judge a body by what they drink an' how they pay, so pull up a crate, an' keep the wee beastie off my mug." } },
      choices = {
        { text = "Demons are a weapon. Nethergarde should use them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "They're right to be wary. I'd be wary too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Enohar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Good, sit doon an' have one, because ye'll be wantin' it after a day out by the Dreadmaul camps." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, eh? If ye bag a boar out there, I'll tell ye my cousin's way o' roastin' it, because it's wasted on the bread an' cheese they serve in this keep." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, at Nethergarde. Well, there's a sight; most o' the folk in this keep would sooner see the Portal open than one o' yer kind on the wall." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could ye put a wee frost on this mug? Nethergarde's ale comes in warm an' stays warm, an' it's an insult tae every Thunderbrew livin'." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid! You'll be wanting to see what this place was before the Dark Portal, I suppose. So would I." },
        { id = "h_default", key = true,
          text = "Enohar Thunderbrew, o' the Thunderbrews o' Kharanos, the finest brewers in all o' Khaz Modan, an' don't let anyone tell ye otherwise. Things get a wee bit stuffy in Nethergarde, so now an' then I have a brew tae take my mind off the duty." },
        { id = "h_ragnar", tags = { "news" }, when = { questActive = TODO_QUEST("Ragnar Thunderbrew") },
          text = "Ragnar's at the distillery in Kharanos, steamin' like a kettle. Go an' see him, an' tell him Enohar sent ye, so he knows the family's lookin' after its own." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Cold as a Dun Morogh winter out there tonight, an' not half as pretty. Good night for a warm mug, if ye ask me." },
        { id = "h_brewer", when = { origin = "dwarf_brewer" },
          text = "Now there's a nose that's been raised over a mash tun, I'd stake my mug on it! Another brewer's youngest, out at the end o' the world? Then ye've found where the barrels go, friend, an' it's here, an' they come back empty." },
        { id = "h_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A Kharanos face, an' a bear at yer heel! I'd know the hill trackers anywhere, for they used tae stamp the snow off their boots on our distillery step an' never once on the mat." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, an' a long way from any chapel! Ye'll find little holy out here, but there's a mug o' Thunderbrew in my kit, an' I'd call that a blessin' o' sorts." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Now if ye're here tae lecture me on duty, I'll tell ye I've never missed a watch, drunk or sober, an' I've the blisters an' the sour stomach tae prove it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, an' a dwarf! My da' would've choked on his ale, an' I think I like ye already for it." },
      },
      again = {
        { id = "h_again", text = "What else, friend? My mug's half full, so I've got time." },
        { id = "h_again2", text = "Out wi' it, then, an' I'll listen, mostly, between sips." },
      },
      choices = {
        { text = "Can anything grow in the Blasted Lands?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What's this about stolen ale?", next = "ale" },
        { text = "What brings a Thunderbrew all the way out here?", next = "why" },
        { text = "How do the dwarves find Nethergarde?", next = "dwarves" },
        { text = "To Ironforge, and to good ale!", next = "toast", when = { race = "Dwarf" } },
        { text = "I've had a few myself, mind.", next = "drunk", when = { drunk = true } },
        { text = "I could steal the ale back, quiet-like.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "A frost for your mug, if you'll tell me about home.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do they mistrust warlocks here?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers at Nethergarde keep any faith, Enohar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does a dwarf on duty need a mug in hand, Enohar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a mug before battle good for a warrior, Enohar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's worth hunting out in the Blasted Lands?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would your family really mind a dwarf shaman, Enohar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My family brews too. I ran off to see where the barrels go.", next = "xorig_brew", when = { origin = "dwarf_brewer" } },
        { text = "Enjoy your brew, Enohar.", next = "END" },
      },
    },
    xorig_brew = {
      lines = {
        { id = "xob_default", text = "Hah! Ye an' me both, an' look where it got us, a stone keep in a red desert wi' demons at the gate. Tell me true, though, did yer folk let ye go wi' a blessin', or did ye climb out the window?" },
      },
      choices = {
        { text = "Out the window. With a cask.", next = "xorig_brew2", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "They let me go, though it hurt them.", next = "xorig_brew2", fx = { trait = { kind = 1 } } },
      },
    },
    xorig_brew2 = {
      lines = {
        { id = "xob2_default", text = "Then ye're a proper brewer's runaway, an' ye'll end up like me, homesick for the smell o' the mash an' too proud tae go back for it. Here's tae the barrels, friend, an' tae the families who'll forgive us eventually." },
      },
      choices = {
        { text = "To the barrels.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
    magni = { { id = "tp_magni", text = "King Magni's a good king, an' he drinks Thunderbrew, which shows his taste. I'll not say more, or I'll get homesick." } },
    gnomeregan = {
      { id = "tp_gnomeregan", text = "The gnomes lost Gnomeregan right up the road from Kharanos, an' I remember the refugees comin' down the mountain. My family fed every one o' them." },
      { id = "tp_gnomeregan2", when = { race = "Gnome" }, text = "Ye'd have been one o' them comin' down the hill, maybe, an' if so my mother likely fed ye. I hope ye found a warm bed in Ironforge." },
    },
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres are a nuisance, an' I've put an arrow through a few. They don't stop comin', though." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer drink their ale too strong an' brew it too fast. I'd teach them a thing or two, if they'd ever sit still long enough." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything here troubles them: the red sky, the fel in the water, the smell off the Portal. If your spirits have any kindness left for this land, I'd ask them to spare a little for my birds." } },
      choices = {
        { text = "This land can heal, given time and care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "This land is lost. Burn out the fel and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can, and they do, though they grumble about it the whole way to Darkshire, and I don't blame them. The Wildhammer flew riders straight into the Horde's lines in the Second War, so I tell my birds a soldier in plate is nothing their kind hasn't carried before." } },
      choices = {
        { text = "I'll leave the heavy plate behind. Your birds deserve better.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A gryphon is a beast of war. It can carry me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Clean water carried down from Darkshire, meat that hasn't been within a mile of the Tainted Scar, and long rests after every flight south. The worst of it is the dust, which gets into their feathers and their lungs, and I spend half my evenings combing it out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} has the dust all down its coat as well, poor thing. Comb it out every night, because a beast that can't breathe can't hunt, whatever it tells you." },
      },
      choices = {
        { text = "Your care keeps the keep's letters moving. That matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Send them somewhere kinder. This land isn't for gryphons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The black drake the soldiers talk about took three of my best out of the air in a single week, and nothing I've tried has kept it away. The keep wants letters carried and I keep sending birds out, and I hate every minute of it." } },
      choices = {
        { text = "Duty's hard, but the letters must fly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep the birds home until the drake's dealt with.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They won't fly within a mile of it, and they come back trembling if the wind turns them that way. Whatever the Portal is now, it still remembers what came through it, and so do the birds, I think." } },
      choices = {
        { text = "Creatures sense what the Light opposes. Trust them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They smell the scorched earth, that's all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They mind the wards on the tower more, because the air hums when the Watchers are working and the birds hate a humming sky. Every one of them has learned to land on the far side of the keep, which tells you how clever they are." } },
      choices = {
        { text = "Then I'll keep my spells quiet near your birds.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Birds can learn to put up with a little noise.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because this whole land smells of them, and the birds have flown over it all their lives, and they know what that smell means even if they've never seen the thing. I'd take a nervous bird over a brave one out here, any day." } },
      choices = {
        { text = "Wise birds. I'll leave my demon outside.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear makes them weak. They'll get used to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Alexandra.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The air burns their lungs, the water's foul, and the ash gets into their feathers until they can barely fly. Your Circle sent a druid through last year who sat with my sickest bird all night, and it flew the next morning, and I've never known how." } },
      choices = {
        { text = "Your birds deserve better land than this. They should be sent home.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Nethergarde needs its gryphons. They must stay and serve.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every one of them, and I'd think less of them if they didn't, because in this land anything that creeps up on you usually means to eat you. Walk up to them openly and let them see your hands, and they'll carry you anywhere you need to go, even a rogue." } },
      choices = {
        { text = "Hands showing, then. I'll walk up openly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep creeping. It's good practice, birds or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Stay clear of the roost if you can't help creeping, because a gryphon that hears someone sneak up behind it will bite first and think about it afterward." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. You'll be heavy in the saddle, so mind how you mount, because my birds remember who kicked them on the way up." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! Then you'll understand what it is to keep an animal alive in a place that wants it dead, which is more than I can say for most visitors." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Keep your demon well away from the roost, because a gryphon that smells a demon won't fly for a day." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. If you're flying, keep your hands in your lap; the last one cast a frost spell to cool off, and my bird came down at Darkshire with ice on its wings." },
        { id = "h_default", key = true,
          text = "Alexandra Constantine, gryphon master of Nethergarde. My birds carry the keep's letters and the keep's visitors, and the Blasted Lands do their best to kill all three." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights are cold enough to frost a gryphon's beak out here. I'll find you a blanket for the saddle if you're going." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! The birds take to holy folk, I've noticed, and you'd be doing me a kindness if you said a word over them before the next long flight north." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want my steadiest bird, then, because the heavy riders frighten the young ones, and the young ones are all I have left after this spring." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! My gryphons perked up when you walked in, and they don't do that for anyone in this keep, so I'll thank you to stay a while." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My gryphons are calmer around you already, and in this place I'll take calm from anywhere it comes." },
      },
      again = { { id = "h_again", text = "Is there something else, or shall I saddle a bird for you?" } },
      choices = {
        { text = "Where can your gryphons take me?", next = "routes" },
        { text = "How do the birds manage this place?", next = "birds" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Do your gryphons mind the arcane, Alexandra?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do gryphons fear demons so much?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your gryphons fear the Dark Portal, Alexandra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What happened to your gryphons this spring, Alexandra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can a gryphon carry a warrior in full plate?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you keep your gryphons healthy here, Alexandra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do the Blasted Lands do to your gryphons, Alexandra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your gryphons really bite anyone who sneaks up on them, Alexandra?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the Blasted Lands trouble your gryphons, Alexandra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer taught me most of what I know about gryphons, though they'd laugh at the way I keep mine. They ride without saddles, and they have the bruises to prove it." } },
    dark_portal = { { id = "tp_dark_portal", text = "The birds hate flying anywhere near the Portal. They know something I don't, and I've learned to trust them." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres throw rocks at my gryphons, and I've lost one to them already. I'd like to see them all driven out of the Blasted Lands." } },
    theramore = { { id = "tp_theramore", text = "I've sent birds to Theramore, and they come back fat and happy and smelling of the sea. I'd like to see it someday." } },
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
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit down, the stew's hot, and it's the only warm thing this side of the Keep." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like the ogres chewed you and spat you out, friend. Eat something before you go see Strumner about that armor; he's grumpy on an empty stomach, and so are you, I'd wager." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They talk about everything, and you'd be news for a week, I'd guess. Some say it's orc magic and some say the dwarves always did talk to rocks, and I just say pass the cheese." } },
      choices = {
        { text = "Let them talk. I serve Ironforge, same as them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them call it orc magic. The spirits don't mind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That they're big and stupid and very hard to kill, mostly, and that there's always more of them coming down from Dreadmaul Hold. One of the lads swears an ogre ate his shield, which I don't believe, though I'll admit I never saw the shield again." } },
      choices = {
        { text = "Ogres or not, I'd stand that watch beside them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the ogres have the watch. I'll take the cheese.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scorpid, once, roasted on a shield over the fire, and the lad who tried it couldn't feel his tongue for a week. I tell them it's bread, cheese and water or nothing, because nothing in the Blasted Lands was ever meant to be eaten." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's {pet}, is it? Keep it away from the cheese wheels, friend, because the last dog that found them is still the most popular soldier in the keep." },
      },
      choices = {
        { text = "The men deserve better. I'll hunt the wastes for them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Bread will do. I'm not risking my neck for their supper.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Me, mostly, and the Quartermaster, though he'd never admit to anything so soft. The soldiers here are the Alliance's last watch on the Dark Portal, and nobody remembers them, so I make sure they at least eat well." } },
      choices = {
        { text = "They're remembered. Their watch matters to all of us.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A soldier's duty doesn't need remembering to be done.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nothing, if they can help it, and they change the subject if anyone else brings it up. A few of the old ones fought there in the Second War, and they eat their supper with their backs to the window, every night." } },
      choices = {
        { text = "They need comfort. I'll sit with the old ones.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave them be. Old soldiers heal in their own way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It fills you up and it doesn't taste of anything, which is fine for a march and miserable for a mess hall. The soldiers here would trade all the magic bread in Dalaran for one wheel of real cheese, and I've the ledger to prove it." } },
      choices = {
        { text = "Real food is worth the trouble, Bernie.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Food is fuel. Taste is a luxury.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somebody on the third watch, and I'll find out who, because I've started counting the wheels at night. The Quartermaster says to let it go, but you don't let cheese go out here, not when it's come all the way from Darkshire." } },
      choices = {
        { text = "Find the thief. Rules hold, even for cheese.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let it go. A little cheese keeps the watch happy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Bernie.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every new recruit tries, and every one of them gives up when the seeds come up black and twisted. One lad ate one of the blackened turnips on a dare, and the healers said he'd live, though he never talked about it again." } },
      choices = {
        { text = "Then plant again, carefully. The land must be coaxed back to life.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn whatever comes up black. Nothing from this ground is safe.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not much, and I can't blame them, because every one of them has stood a watch facing the Dark Portal and wondered what might come through it. Sit with your back to the wall and eat what you're given without any fuss, and by the third meal they'll stop staring, mostly." } },
      choices = {
        { text = "I'll keep my head down and earn their trust.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them stare. I don't need their trust.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, in my kitchen! Keep the imp off the counter, friend, because the last one that got in here ate a wheel of cheese and blamed the dwarves, and the dwarves have not forgotten." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! You'll want the big loaf, then, because the soldiers who stand the morning watch by the Portal come back hungrier than the ogres." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! I don't suppose you've brought anything fresh in from the wastes, because I've served bread and cheese so long the men have started dreaming about meat." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. I know every soldier's business in this keep, so if you're after gossip you've come to the right counter, and if you're after the cheese, you haven't." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! You won't be buying bread, I suppose, since you can make your own, though I'll tell you now, conjured bread is no match for a proper loaf." },
        { id = "h_default", key = true,
          text = "Bernie Heisten, food and drink for the finest and grimmest garrison in the Alliance. Bread, cheese and water, mostly, because that's what survives the road from Darkshire." },
        { id = "h_caravan", when = { questRecent = { TODO_QUEST("Deliver the Shipment"), days = 7 } },
          text = "The Quartermaster says you brought in Biggs's shipment. There was cheese in it, real cheese, so you've made a whole keep very happy." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Blessing the bread's no bad idea out here, I'll say, because by the time it comes down the road from Darkshire it's had a harder trip than most soldiers." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want a proper meal, then, because plate is heavy, and I'll swear the keep's cooking is better than anything Darkshire's sending down the road." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You won't think much of my larder, I'm afraid; it's bread, cheese and water, because nothing that grows in the Blasted Lands is fit for anyone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Well, I've never fed one before, but I expect the spirits don't eat much, so you'll have their share as well as yours." },
      },
      again = { { id = "h_again", text = "Anything else, or shall I wrap something up for the road?" } },
      choices = {
        { text = "What's good today?", next = "food" },
        { text = "You must hear all the keep's gossip.", next = "gossip" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Is conjured bread really that bad, Bernie?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Who's stealing cheese in this keep, Bernie?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do Nethergarde's soldiers say about the Portal, Bernie?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who keeps this garrison in good spirits, Bernie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the soldiers say about the Dreadmaul, Bernie?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's the strangest thing the soldiers have tried to eat here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone tried to grow food here, Bernie?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the soldiers here trust a warlock at their table, Bernie?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers here talk about a dwarf shaman, Bernie?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres raid our caravans for the food, of all things, and they've got terrible taste. I've seen what they eat, and it's not something I'd serve." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord sends us supplies when he can, and I've learned to make them last. A good stew can feed a garrison for a week, if you're careful." } },
    second_war = { { id = "tp_second_war", text = "My father fought in the Second War, and he came home thin as a rake. I made a promise then that no soldier I cooked for would go hungry." } },
    dark_portal = { { id = "tp_dark_portal", text = "The soldiers don't talk about the Portal at supper, and I don't ask. A man eats better if he isn't thinking about demons." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Our fathers took their strength from the forge an' the stone, no' from bargainin' wi' spirits like the orcs we fought in the Second War. But yer coin's good, an' I've armored stranger." } },
      choices = {
        { text = "The forge and the stone have spirits too, Strumner.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I keep Ironforge's ways. The spirits only lend a hand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It grinds, is what it does, every link against the next till the rings wear thin as paper. Oil it every night, or ye'll be stood in front o' a basilisk wi' nothin' between ye an' it but good intentions." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' brush the grit out o' {pet}'s coat while ye're at it, because I've seen beasts here rubbed raw under the collar." },
      },
      choices = {
        { text = "I'll oil it nightly. Good gear is discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I move fast. The mail can wear thin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some days. When the wind comes off the Portal at night they sleep badly an' dream worse, an' I can mend a dent but I cannae mend that. Ye can try, if ye've the stomach for it." } },
      choices = {
        { text = "I'll try. That's the work the Light gave me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mend their armour first. Courage follows good steel.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Dry it out an' crack it, for the dust gets intae every seam an' the cold nights finish the job. Oil it every night, an' if ye don't, come tae me, an' I'll take yer coin an' say nothin'." } },
      choices = {
        { text = "I'll oil it nightly. Good gear deserves care.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gear's for wearing out. I'll buy new.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For the brackets on their crystals, aye, an' the cages on their braziers, an' once for a mirror that started talkin' back. I didnae ask what was in it, an' they didnae tell me, an' I charged double." } },
      choices = {
        { text = "Wise not to ask. Some things aren't your business.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd have asked. A smith should know what he's caging.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than ye'd think, because yer kind fights in the shape of beasts and comes back with leather torn in places no tailor would expect. The leather's no problem; it's the moss growin' in the seams I can't abide." } },
      choices = {
        { text = "Leave the moss, Strumner. It means the armor's still alive.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Scrape it out. A druid's armor should be as tidy as anyone's.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aye, if the coin's good an' the armor's no' smokin'. I've seen what comes out o' that Portal, so I'll no' pretend I like yer trade, but a smith who turned away every customer he disliked would starve in a week out here." } },
      choices = {
        { text = "Fair dealing's all I ask, Strumner.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep your opinions and just do the work, dwarf.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I mend armor, no' souls, so if it's yer demon that needs fixin', ye've come tae the wrong dwarf." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "Hunter, is it? Mail, then, or leather wi' studs, an' either way ye'll want it seen tae before the dust gets in the links." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, at my forge? Cloth doesnae need an anvil, friend, though I'll mend yer gloves if ye ask nicely." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Leather, is it? I'm an armorer, no' a tanner, but I'll stitch yer jerkin if ye don't mind it comin' back stiff." },
        { id = "h_default", key = true,
          text = "Strumner Flintheel, armorer. There's no other forge between here and Darkshire that'll take yer coin, so ye'll forgive me if I don't haggle." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. Ye'll not need much from my forge, I'd wager, but the soldiers here are glad o' ye, so sit by the fire if ye like." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Ye'll not want my steel, I'd wager, but if ye've armor that needs mending after a fight as a bear, bring it here and I'll see what I can do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Never thought I'd see a dwarf wi' totems hangin' off a belt, an' I'll not pretend I like it." },
      },
      again = { { id = "h_again", text = "Anythin' else, or can I get back tae the anvil?" } },
      choices = {
        { text = "What do the Blasted Lands do to armor?", next = "wear" },
        { text = "Is it hard to work out here?", next = "work" },
        { text = "I need repairs.", next = "BUSINESS" },
        { text = "What's the clay done to my plate?", next = "k_plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "What do the Blasted Lands do to leather?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the mages upstairs ever need a smith?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the soldiers here need a priest more than an armorer?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does this dust do to a hunter's mail?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you mend much druid armor out here, Strumner?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you mend armor for a warlock, Strumner?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's wrong with a dwarf shaman, Strumner?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
      choices = { { text = "Honour and a bill. Very dwarven.", next = "BACK", fx = { trait = { witty = 1 } } } },
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
    background = { { id = "tp_bg", text = "I'm a dwarf wi' a hammer, sore feet an' a pay chit three months late. Nothin' more to tell." } },
    advice = { { id = "tp_ad", text = "Oil yer buckles every night out here, or the dust will seize them by morning." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "Ogres break things, an' I fix them. That's the Dreadmaul an' me, in one sentence." } },
    magni = { { id = "tp_magni", text = "The king's a good king. He'd know my pay's late, if anybody told him." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons make good steel an' bad neighbors. I've fixed a few o' their blades, an' I washed my hands after." } },
    _none = { { id = "tp_none", text = "Don't know, and don't much care, so ye'd best ask the Quartermaster upstairs." } },
  },
}
