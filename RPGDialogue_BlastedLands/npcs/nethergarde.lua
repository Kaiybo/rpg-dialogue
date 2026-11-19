-- Nethergarde Keep: the Alliance's watch over the Dark Portal, on the bluff above the only road into the Blasted Lands. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lungertz", id = TODO_NPC("Quartermaster Lungertz"), name = "Quartermaster Lungertz",
  bible = "bibles/blastedlands.md", role = "soldier", tier = "major",
  communities = { "nethergarde" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  prejudice = { class = "WARLOCK", amount = 10, why = "Writes the letters home for every soldier the demons beyond the Portal kill." },
  notices = { "class", "kit", "race" },

  impression = {
    first = "He is cheerful the way people are when the alternative is despair.",
    third = "{name} met Quartermaster Lungertz, who keeps Nethergarde Keep fed and supplied from the far end of a very dangerous road.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I write the letters home for every soldier the demons out there kill, and I've written too many lately. Don't bring that thing near my stores." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Cheerful's my job, but I'll not be cheerful at you. What do you need, and how quickly can you leave?" },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've brought back more supplies than trouble, and the ledger doesn't lie. I'll smile at you, then, but I'll count the crates after." },
    { id = "g_op_arcane", when = { gossip = { topic = "arcane_magic", stance = "dangerous" } }, text = "Mahar Ba's been muttering that you think the mages should lock their books away. He's taken it as a challenge, and I've had three requisitions for new shelves since." },
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
      text = "Trained in Stormwind's Mage Quarter, were you? Most of the magi on these walls came out of the same towers, and they all talk about Dalaran as if they'd built it themselves, so you'll fit right in." },
    { id = "n_lamb", cat = "origin", when = { origin = "human_lamb_cellar" },
      text = "I know that look, because I've seen it on the warlocks who come through to bind the demons on the plain. You'll sign for anything you take from my stores, and you'll sign in ink, not in anything else." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Light's sake, look at your armor; the ogres had a go at you, didn't they? Strumner's at the forge downstairs, and he's the only one who'll mend it for leagues." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good. Half the soldiers on these walls are your kin, and they've been complaining that nobody here pours a proper ale." },
  },

  start = "hello",
  nodes = {
    op_defias = {
      lines = {
        { id = "opd_default", text = "The very same, before Stormwind's nobles stiffed his guild and he took it badly, by which I mean with knives. I've a cousin in Westfall, so I hear both sides of it in every letter. Where do you come down on it, friend?" },
      },
      choices = {
        { text = "The masons were cheated. I can't blame them for being angry.", next = "op_defias_nobles", fx = { align = { order = -1 }, opinion = { defias = "nobles_to_blame" } } },
        { text = "Unpaid or not, murder is murder. Hang the Defias.", next = "op_defias_hang", fx = { affinity = 1, align = { order = 1 }, trait = { stern = 1 }, opinion = { defias = "hate" } } },
        { text = "Westfall's farmers paid for that quarrel, not the nobles.", next = "op_defias_westfall", fx = { affinity = 1, opinion = { defias = "hate", westfall = "pity" } }, when = { race = "Human" } },
        { text = "I'd rather count crates than argue politics.", next = "BACK" },
      },
    },
    op_defias_nobles = {
      lines = {
        { id = "opdn_default", text = "Keep your voice down; most of the soldiers here are paid by those same nobles, when they're paid at all. I have been waiting on a wagon of their silver for three weeks, though, so I'm not saying you're wrong." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_defias_hang = {
      lines = {
        { id = "opdh_default", text = "That's how the Keep sees it, and that's how my ledger sees it, too. A thief's a thief, whether he's got a grievance or not, and my cousin's lost two cows to people with grievances." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_defias_westfall = {
      lines = {
        { id = "opdw_default", text = "They did, and they're still paying, if my cousin's letters are anything to go by. The nobles never miss a meal, but the farmers miss plenty, so there's your justice." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Because the road from Stormwind runs through the Swamp of Sorrows and past the orcs at Stonard, and every driver who's made the trip twice asks for double pay the third time. The Blasted Lands are the edge of the world, friend, and nobody hurries to the edge." } },
      choices = {
        { text = "Nethergarde deserves better. Stormwind should send more.", next = "BACK", reply = "Tell that to the King's treasurers, friend, and I'll buy you a drink if they listen. Until then I count every sack twice.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A garrison out here should learn to fend for itself.", next = "BACK", reply = "We're learning, the hard way, and the seed corn's my latest lesson. Fending for ourselves in this dust is easier said than planted.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If you can tell me when the next caravan from Darkshire's in trouble, you'd be the most useful soul in the keep. The fel out there sours everything, though, and I'd wager it sours your spirits too." } },
      choices = {
        { text = "I'll serve the keep however it needs me, ledger and all.", next = "BACK", reply = "Then you're the sort the keep needs, and I'll put you in my ledger gladly. Spirits and sacks both, if you can manage it.", fx = { align = { order = 1 } } },
        { text = "Spirits don't fit in ledgers. I'll go where they lead.", next = "BACK", reply = "They don't, and that's what worries me about them. Go where they lead, but if they lead you past a stranded wagon, give it a push.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They feed the wards that watch the Portal, as I understand it, and when the stones go dark the wards go dark with them. I don't pretend to know how, but I know that when a crate comes in late, Mahar Ba stops sleeping, and then everybody hears about it." } },
      choices = {
        { text = "The wards matter. I'll help keep them fed.", next = "BACK", reply = "Good, because the stones eat more than the soldiers do, and nobody believes me. Every crate you bring keeps the Watchers watching.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wards on a dead portal? Sounds like a waste to me.", next = "BACK", reply = "Waste, maybe, until the day it isn't, and I'd rather not be the quartermaster who saved the coin that day. The stones get fed.", fx = { align = { order = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ogres, mostly, and the swamp, which swallows a wagon wheel as soon as look at it, and now and then a soldier who's tired of hardtack. I count everything twice, and I'd count it three times if the candles lasted." } },
      choices = {
        { text = "I'll bring your crates back, Quartermaster.", next = "BACK", reply = "You'd be the first in a month, and I'll write your name in the ledger in my best hand. Mind the swamp on the way back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hungry soldier's theft hardly counts, surely.", next = "BACK", reply = "It counts in my ledger, friend, because a missing crate is missing whether the thief was hungry or not. Though I'll admit I've looked the other way once or twice.", fx = { align = { honor = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The mages say it's the Portal and the old fel magic soaked into the ground, and the soldiers say it's the ogres trampling everything flat. I say it's both, and the result's the same: every grain we eat comes down the road from Darkshire in a wagon." } },
      choices = {
        { text = "The land can heal, Lungertz. Keep trying the seed corn.", next = "BACK", reply = "I will, and I'll plant another row in spring, because somebody has to. You're the first to say it might work.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "This land's dead for good. Trust the wagons and stop wasting seed.", next = "BACK", reply = "Maybe you're right, but a quartermaster who stops trying is just a man counting dust. I'll keep the seed, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ogres", when = { killed = { name = "Dreadmaul", min = 40 } },
          text = "Fewer ogres on the Darkshire road, the drivers tell me, and every one of them used your name. I've written it in the ledger under the column marked 'reasons the wagons arrived'." },
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A whole company, and here I am with half a storeroom and the Stormwind wagons three weeks late. Visitors eat what the garrison eats at Nethergarde, which is salt pork and good intentions." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. My crates go missing between Darkshire and here often enough without help, so please tell me you're the kind who brings things back." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! The tower lot will be glad of you, and so will I, because every mage up there wants powerstones, and every powerstone comes through my ledger." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I've a ledger full of names the demons past the Portal took, and you smell like the things that took them. Tell me what you need." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "The ledger says you've helped this keep more than you've cost it. Go on, then, what is it?" },
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
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid in Nethergarde! I've a crate of seed corn nobody's managed to grow out here, and you're very welcome to try, though I'd not stake my supper on it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman of Ironforge! I'll write you in the ledger as a soldier, because I haven't got a column for people who talk to the elements, and I'm not about to make one." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if you would; there's a wagon due and I'd like to count it before the ogres do." },
        { id = "h_again2", text = "Go on, then. The ledgers will wait a minute, which is more than the mages ever do." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. Nothing comes up the road after dark, so I've nothing better to do than talk." },
      },
      choices = {
        { text = "A quartermaster must need everything out here.", next = "supplies" },
        { text = "Who holds Nethergarde Keep?", next = "keep" },
        { text = "What's out there in the wastes?", next = "wastes" },
        { text = "Why guard a portal that's dead?", next = "portal" },
        { text = "Your clerics look like they need another pair of hands.", next = "priest", when = { class = "PRIEST" } },
        { text = "Nothing beyond that Portal frightens me. One of its kind walks at my heel.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The powerstones came in time, then?", next = "powerstones", when = { questDone = TODO_QUEST("Supplies for Nethergarde") } },
        { text = "What do your soldiers need most, Quartermaster?", next = "k_warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Does the keep need fresh meat? I hunt.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "A gnome could keep your powerstones working.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Why do the mages need so many powerstones?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your crates must go missing on the road.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Nothing seems to grow around Nethergarde, Quartermaster.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
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
        { text = "Stormwind can't keep this up forever.", next = "supplies_stormwind" },
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
        { text = "Stormwind will see us through. It always has.", next = "BACK", reply = "It has, so far, though slower every year. The last wagon came in with half its flour and a note from the treasury apologising for the other half.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Then stop waiting on Stormwind and fend for yourselves.", next = "BACK", reply = "We're trying, friend, and the dust isn't helping. But fending for ourselves is already most of what we do.", fx = { align = { order = -1 } } },
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
        { text = "The mages upstairs must know about this.", next = "supplies_commander" },
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
        { text = "VanCleef? The Defias leader built these walls?", next = "op_defias" },
        { text = "Stormwind should have paid them.", next = "BACK", reply = "They should have, and the whole kingdom's paying for it now in Westfall. I'll not say that too loudly in front of the captain.", fx = { align = { honor = 1 } } },
        { text = "A bill is no excuse for banditry.", next = "BACK", reply = "No, it isn't, and I'd hang a bandit as quick as anyone. But I still think of the masons every time I look at these walls.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
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
        { text = "Those ogres seem to answer to the demons.", next = "wastes_ogres" },
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
      lines = { { id = "wot_default", text = "Bloodmage Drazial and Bloodmage Lynnore, a pair of elves up by the northern pass, cutting up boars for science, and some sort of broken draenei wandering near the Portal, hunting for crystals. None of them buys from me, so I can't tell you much more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    portal = {
      big = true,
      lines = {
        { id = "p_default", fx = { learn = { "dark_portal" } },
          text = "Dead it may be, but it's the door the Horde came through, and the mages swear the land around it still isn't right. I'd rather feed a hundred mages to watch an empty door than wake up one morning wishing we had." },
      },
      choices = {
        { text = "Better a watched door than a surprise.", next = "BACK", reply = "My thinking exactly. Twenty years of quiet costs Stormwind a few wagons of grain a season, and one bad night through that gate would cost it everything south of Westfall.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Twenty quiet years. Stormwind's coin would do more elsewhere.", next = "BACK", reply = "Quiet years make people forget, and forgetting's what got Lordaeron burned. I'll keep spending Stormwind's coin here, thank you.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "They need ten pairs, and they'd take yours gladly. The clerics patch up whoever the ogres send back, and the demons leave wounds that won't close for a plain bandage; a priest's prayer goes a long way here." } },
      choices = {
        { text = "I'll see to the wounded before I go.", next = "BACK", reply = "Bless you, they'll be grateful, and so will the ones on the cots. The infirmary's just down the stair.", fx = { affinity = 3, align = { light = 2 }, standing = { nethergarde = 2 } },
          journal = { first = "Nethergarde's clerics couldn't keep up with the wounded the ogres send back, so I stayed and prayed over the worst of them.",
                      third = "{name} stayed at Nethergarde Keep to pray over soldiers wounded by ogres and demons." } },
        { text = "The clerics will manage. I've other work.", next = "BACK", reply = "They'll manage, they always do, but they'd have managed better with you. Go on, then, and mind the ogres.", fx = { align = { light = -1 } } },
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
        { text = "It'll behave. You have my word.", next = "BACK", reply = "Your word's good enough for me, if not for the soldiers. Keep it close and keep it quiet, and we'll get on fine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If your soldiers touch it, that's their own mistake.", next = "BACK", reply = "Then you'll have more trouble than that creature can handle, friend. These men remember the Second War, and they've long memories for that stink.", fx = { affinity = -2, align = { honor = -1 } } },
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
        { id = "xwa_default", text = "Boots, first, because the red clay eats them in a month, then whetstones, then sleep, and I can only supply the first two. Every soldier on that wall has walked the Darkshire road, and each would trade a week's pay for a night without ogres." },
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
        { text = "Ears recover, Quartermaster. Wards don't.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, that's going in the ledger, friend, under one kind word, received undamaged. It's the first thing to arrive in good order all month." },
        { id = "s2", text = "You've noticed that someone keeps this keep fed and shod, and that puts you ahead of every mage upstairs. I'm obliged to you, truly." },
      },
      fail = {
        { id = "f1", text = "Ah, now, I know that tune, because it's what the sergeant whistles just before he asks for extra boots. The stores are counted, friend, and compliments don't change the count." },
        { id = "f2", text = "Kind of you, but I've been sweet-talked by teamsters, recruits and one very determined gnome, and none of them got anything out of me either." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! A clerk with an inkpot at the edge of the world, aye, I know how it looks. Laugh all you like, because it beats what the mages do for amusement." },
        { id = "s2", text = "Oh, that's good, and I'll be using it on the sergeant. It's a fine thing to meet someone with a sense of humour who isn't losing at dice." },
      },
      fail = {
        { id = "f1", text = "It's easy to laugh at the man with the ledger until the arrows run out, friend. I've seen it happen, and nobody was laughing then." },
        { id = "f2", text = "I've had a long day of short wagons, and I don't much care to be the joke at the end of it. Mind the crates on your way out." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "He sets down his quill and leans away from the desk.", text = "Now, now, there's no need for that, I'm only the fellow who counts things. You'll get no argument from me, and I'd thank you to step back from the desk." },
        { id = "s2", text = "All right, friend, you've made yourself very clear, and I'd rather face a short wagon than you. Ask what you came to ask." },
      },
      fail = {
        { id = "f1", text = "The Dreadmaul come at these walls regular as the tides, and you're a good deal smaller than they are. Try that on a recruit, because it's wasted on me." },
        { id = "f2", text = "You can glare all you like, but the guard post is ten paces behind you, and those lads are bored. I'd think again." },
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
    _none = { { id = "tp_none", text = "If it doesn't come in a crate, it isn't in my ledgers. Try the Watcher upstairs; he keeps notes on things I can't even spell." } },
    _gated = {
      { id = "gt1", text = "That's keep business, friend, and I don't write strangers into it. Come back when I know your name as well as I know my crates." },
      { id = "gt2", text = "I'd sooner not say, not to someone I've only just met. Give it a while, and we'll see." },
    },
  },
}

P:NPC {
  key = "mahar_ba", id = TODO_NPC("Watcher Mahar Ba"), name = "Watcher Mahar Ba",
  bible = "bibles/blastedlands.md", role = "scholar", tier = "major",
  communities = { "nethergarde" }, temper = { "eager" }, values = { "curious", "wise" },
  likesTone = "polite",
  notices = { "class", "race" },

  impression = {
    first = "He speaks of Khadgar as if he'd only left the room.",
    third = "{name} met Watcher Mahar Ba, a mage of Nethergarde who studies the Dark Portal and everything Khadgar left behind.",
  },

  greetings = {
    { id = "g_op_alliance", when = { gossip = { topic = "alliance", stance = "failed" } }, text = "Ambassador Ardalan says you told him the Alliance failed Quel'Thalas. He's been almost cheerful since, and it's frightening the clerks." },
    { id = "g_default", text = "Ah, a visitor! Do come in, only don't touch the instruments, the papers or, ideally, anything at all." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. I've filled half a book since we last spoke, and none of it good news." },
    { id = "g_portal_resolved", when = { thread = { id = "portal_watch", state = "resolved" } }, text = "Ah, my fellow watcher! The stones were cold again this morning, and I wrote it down, and I've promised Lungertz not to read it out at supper." },
    { id = "g_essays", when = { questDone = TODO_QUEST("Mazen's Behest") }, text = "My courier of Khadgar! I've read the essays twice already and I understand perhaps half of them, which is twice what I expected." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I've filled most of another book in that time, almost none of it good news. Do come in and tell me something better." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since we last spoke, and a good deal faster than my understanding of the Portal. Come and tell me what you've seen." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I'm told you talked someone in the Keep round to your view. I'd be grateful if you'd try it on the mages, because I've been failing for months." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A fellow student of the arcane, and out here of all places! I'll warn you now that I talk too much; the soldiers have heard all my theories and started hiding from me." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I can feel the fel on you from across the room, warlock. Mind it near the wards, please; they were made to keep your sort of power out, and they're not subtle about it." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "A night elf at Nethergarde! Your people fought the Legion ten thousand years ago, and I'd give a year of my notes to know what you remember of it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Forgive me, I'm staring; you're one of the people Dalaran's letters call the Skyborne, and I've only read about you by lamplight." },
  },

  start = "hello",
  nodes = {
    op_arcane = {
      lines = {
        { id = "opr_default", text = "Oh, both, and that's what makes it so fascinating! The Portal was opened by magic and sealed by magic, and the Kirin Tor have been arguing about what that means for twenty years. I'd love to know what someone outside the argument thinks." },
      },
      choices = {
        { text = "Knowledge is never wrong. Only how it's used.", next = "op_arc_useful", fx = { affinity = 1, align = { order = -1 }, opinion = { arcane_magic = "useful" } } },
        { text = "Magic that strong should be locked away by the Kirin Tor.", next = "op_arc_danger", fx = { align = { order = 1 }, opinion = { arcane_magic = "dangerous", kirin_tor = "trust" } } },
        { text = "It's my craft, Watcher. I'd sooner lose a hand.", next = "op_arc_useful", fx = { affinity = 2, opinion = { arcane_magic = "admire" } }, when = { class = "MAGE" } },
        { text = "The Well of Eternity drowned an empire. Be careful.", next = "op_arc_danger", fx = { opinion = { arcane_magic = "dangerous" } }, when = { race = "NightElf" } },
        { text = "I'll leave that to the Kirin Tor.", next = "BACK" },
      },
    },
    op_arc_useful = {
      lines = {
        { id = "opau_default", text = "Exactly! The Portal isn't the fault of magic any more than a flood is the fault of water. I wouldn't say that too loudly to the soldiers, though, since they've seen the floods up close." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_arc_danger = {
      lines = {
        { id = "opad_default", text = "Locked away? Well, I suppose that's what Nethergarde is, really, a very large lock on a very large door. I don't agree with you, but I'll admit I sleep better knowing someone holds the key." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_mage = {
      big = true,
      lines = { { id = "xpt_mage_default", text = "Like a door left open in winter, with the cold of somewhere else still clinging to it, though the gate has been dead since the far side was destroyed. We watch it anyway, because nobody who saw the Horde come through it ever trusts a closed door again." } },
      choices = {
        { text = "Nethergarde's watch is wise. Keep it, whatever it costs.", next = "BACK", reply = "We will, whatever it costs, and it costs a great deal. My apprentices cough red dust all winter, and not one of them has asked to go home.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The gate is dead. Dalaran's mages are needed elsewhere.", next = "BACK", reply = "Dalaran's mages are needed everywhere, and I'm one of them. But someone must sit by the door, and I've chosen to.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hold the stair, I should think, the way the Alliance's soldiers held the ground here at the end of the Second War while Khadgar did his work. We measure and we ward, but if anything comes through that gate again, it'll be steel at the bottom of the steps that buys us time to finish." } },
      choices = {
        { text = "Then I'd hold it, and trust the Watchers to finish their work.", next = "BACK", reply = "Then you'd be a soldier worth having on the stair. Hold the line, and let us finish the reading.", fx = { align = { order = 1 } } },
        { text = "Steel shouldn't wait on wards. Strike first, measure afterward.", next = "BACK", reply = "Strike first, and you might strike something we'd rather have left asleep. Measure first, friend, and live.", fx = { align = { order = -1 } } },
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
        { text = "I'll tell you what I see. Your records matter.", next = "BACK", reply = "Thank you, every report helps. The records are the only way we'll know what the Portal's doing.", fx = { align = { order = 1 } } },
        { text = "Twisted beasts get an arrow, Watcher, not a ledger entry.", next = "BACK", reply = "An arrow's quicker, I'll grant you, but the record lasts longer. Shoot if you must, but tell me what you shot.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Its knights were at the Portal at the end of the Second War, when the Alliance broke the Horde's hold on it, and some of them crossed over with Khadgar and never came back. I keep a list of their names, because the official histories only remember the generals." } },
      choices = {
        { text = "Their names should be honoured in Stormwind, not just here.", next = "BACK", reply = "They should, and I've written to the Cathedral more than once. Here, at least, we say their names every year.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lists won't bring them back. Watch the Portal instead.", next = "BACK", reply = "We do both, friend, and the list is how we remember why. Watching without remembering is just staring.", fx = { align = { honor = -1 } } },
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
        { text = "I'll watch and report exactly what I see, Watcher.", next = "BACK", reply = "That's all I ask, and more than most give me. You'd be amazed how many soldiers come back from the Scar with a story about a demon the size of the keep.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll watch, and decide myself what's worth reporting.", next = "BACK", reply = "Then I'll weigh your reports accordingly, and you'll forgive me if I double-check them. Decisions are my job.", fx = { align = { order = -1 } } },
        { text = "Something else, Watcher.", next = "BACK" },
      },
    },
    dd_kazzak = {
      lines = {
        { id = "dd_kazzak_1",
          text = "He was the Legion's foothold on this side of the Portal, the thing we feared would open it again. Khadgar's notes speak of doomlords as captains, not soldiers, and a captain alone on our world was always waiting for an army." },
        { id = "dd_kazzak_2",
          text = "Demons don't truly die here, you understand, they're only cast back to the Nether. He may return one day, but for now the Scar is quieter, and I mean to write it down very carefully." },
      },
      choices = {
        { text = "Then we'll kill him again if he comes back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Write it down. The Watchers should be ready next time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Watcher.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_kazzak", tags = { "news" }, when = { killed = { name = "Kazzak" } },
          text = "They say Lord Kazzak has fallen in the Tainted Scar, and that you were among those who brought him down. I've been watching the Portal for that doomlord's shadow for as long as I've been posted here, and I scarcely know what to do with my evenings now." },
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
        { text = "What did Kazzak mean to the Watchers?", next = "dd_kazzak", when = { killed = { name = "Kazzak" } } },
        { text = "Has Nethergarde tried to restore the land?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What exactly do you watch for?", next = "watch" },
        { text = "Who was Khadgar?", next = "khadgar" },
        { text = "Are you waiting on anything from Stormwind?", next = "essays" },
        { text = "Does anything hunt from the sky out here?", next = "drake" },
        { text = "The Light feels thin in this place, Watcher.", next = "priest", when = { class = "PRIEST" } },
        { text = "Dalaran trained me. Does Nethergarde still answer to it?", next = "mage", when = { class = "MAGE" } },
        { text = "My people remember the Legion. We never forget.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "The poison in this land is power, Watcher, wasted on wards.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The Kirin Tor took my people in, Watcher.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "The stone here is screaming, Watcher.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Could a druid heal this land?", next = "k_druid", when = { class = "DRUID" } },
        { text = "Did the Silver Hand fight at the Dark Portal, Watcher?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would a warrior do if the Portal woke, Watcher?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The beasts near the Portal look wrong somehow.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
        { text = "The Portal looks dead enough from here.", next = "watch_portal" },
        { text = "Can the land be healed?", next = "watch_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_portal = {
      lines = { { id = "wp_default", text = "As dead as stone can be. The five who went through sealed it from the far side twenty years ago, and nothing has stirred in it since, though I check every morning anyway, because that is what a watcher is for." } },
      choices = {
        { text = "I'd tear it down, stone by stone.", next = "watch_tear" },
        { text = "Then keep watching. Someone has to.", next = "BACK", reply = "We will. It's a comfort to hear it from someone who's walked the red earth and seen the gate for themselves.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Twenty dead years. Let the mages go home.", next = "BACK", reply = "Twenty dead years can turn into one live night, friend. The mages stay, and so do I.", fx = { align = { order = -1 } } },
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
      lines = { { id = "kf_default", text = "Nobody knows. The Alliance mourned them, Stormwind carved them in stone, and the rest of us go on reading what they left behind, which in Khadgar's case fills a library." } },
      choices = {
        { text = "You don't sound like you've mourned him.", tag = "Persuade", next = "khadgar_hope",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Mazen's Behest") }, { class = "MAGE" } } } },
          fail = { next = "khadgar_shelf", fx = { affinity = -1 } } },
        { text = "They're gone. Best to honour them and move on.", next = "BACK", reply = "That's what most people say, and maybe they're right. But I keep a candle lit on the sill facing south, all the same.", fx = { align = { order = 1 } } },
        { text = "Nobody's dead until someone finds the body.", next = "BACK", reply = "That's what I tell myself on the long nights. They sealed it from the far side, and the far side's very large.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "The Light is never thin. Only our faith is.", next = "BACK", reply = "Perhaps you're right, and perhaps it's our faith that's thin. I'll tell the clerics to pray harder.", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Then maybe the Light has given up on this place.", next = "BACK", reply = "I hope not, but I've wondered. The clerics keep praying, at least, and so do I.", fx = { align = { light = -1 } } },
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
        { text = "Is magic the cure for this land, or the disease?", next = "op_arcane" },
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
        { text = "Power is only as wicked as its master.", next = "BACK", reply = "Perhaps, but I've read too many histories of masters who thought they had it leashed. I'll keep it out, thank you.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Keep it out, then. I'll respect the wards.", next = "BACK", reply = "Thank you. You'd be surprised how few people who carry it can say that without arguing first.", fx = { align = { light = 1 }, affinity = 1 } },
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
        { id = "xsh_default", text = "Screaming. I measure it with crystals and charts and call it residue, and you put your hand on the ground and call it screaming, and I can't say for certain which of us is closer. Does it say what would quiet it?" },
      },
      choices = {
        { text = "Close the Portal for good. Seal it.", next = "BACK", reply = "We've tried, and the Portal doesn't want to be sealed further. But your hand on the stones tells me more than my charts do.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let the land heal its own way. Stop watching.", next = "BACK", reply = "I'd like to, but if we stop watching and something comes through, nobody will be left to say I told you so. We watch.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Couldn't the Portal's stones just be torn down?", next = "watch_tear" },
      },
    },
    k_druid = {
      lines = {
        { id = "xdr_default", text = "I have wondered, on long nights, whether a grove could take root here, and every soil sample tells me it would die before it flowered. But I'm a mage, and we tend to believe the samples; perhaps a druid knows better." },
        { id = "xdr_elf", when = { race = "NightElf" },
          text = "Your people healed the land after the Legion's first war, the books say, and that was a war beside which this is a scratch. If anyone could, I'd wager on a druid of the Cenarion Circle, though I'd still wager small." },
      },
      choices = {
        { text = "Any land can heal, given time.", next = "BACK", reply = "I hope so. If you ever plant that grove, I'll ride out every season and measure the saplings myself.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Some wounds are meant to stay open, as warnings.", next = "BACK", reply = "Perhaps they are, and this one's a warning if ever there was. We watch it so nobody forgets.", fx = { align = { light = -1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh! Well, that's very kind, and rather unexpected, since nobody here reads my reports, let alone praises them. I shall be insufferable about it for the rest of the day." },
        { id = "s2", text = "Do you really think so? Archmage Khadgar's notes deserve the credit, of course, but I won't pretend I'm not pleased. Thank you, truly." },
      },
      fail = {
        { id = "f1", text = "That's kind, I suppose, though I'm not sure you know what it is you're praising. I've spent years on this work, and I'd rather have one good question than a compliment." },
        { id = "f2", text = "They taught us in Dalaran to be wary of visitors who admire the instruments too warmly, since something usually goes missing afterwards." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Yes, I know, a grown man who talks to rocks and waits on a dead door. It's quite all right, because I'd laugh at me too." },
        { id = "s2", text = "Oh, very good, I hadn't heard that one, and I've heard most of them from the garrison. You're sharper than the soldiers, I'll give you that." },
      },
      fail = {
        { id = "f1", text = "I watch the Dark Portal so that you may sleep at night without ever thinking of it. I don't ask for thanks, but I'd prefer not to be sneered at for it." },
        { id = "f2", text = "That wasn't called for, and I've too much work to stand here being mocked. Mind the instruments as you leave, please." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Goodness, please, there's really no need for that! I'm a scholar and no soldier, so do ask your question, only come away from the instruments first." },
        { id = "s2", text = "Yes, yes, all right, you've quite convinced me. I measure dangerous things for a living, and I know when one has walked into the room." },
      },
      fail = {
        { id = "f1", text = "I have looked into the Tainted Scar through a scrying glass, and what looked back was a good deal worse than you. I'm sorry, but I'm simply not frightened." },
        { id = "f2", text = "You're threatening a Watcher of Nethergarde in a keep full of mages, which seems poorly reasoned. I'd ask you to stop before the guards take an interest." },
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
    _none = { { id = "tp_none", text = "I'm afraid that's outside my studies. The Quartermaster hears everything, though; try him, and bring him something to count." } },
    _gated = {
      { id = "gt1", text = "I'm afraid that isn't something I can share with a visitor I've only just met. Come by a few more times, and I expect I'll tell you all of it." },
      { id = "gt2", text = "I'd rather not, not yet. Forgive me, but the Kirin Tor are particular about whom we confide in." },
    },
  },
}

P:NPC {
  key = "thadius", id = TODO_NPC("Thadius Grimshade"), name = "Thadius Grimshade",
  bible = "bibles/blastedlands.md", role = "scholar", tier = "major",
  communities = { "nethergarde" }, temper = { "sharp" }, values = { "curious", "ambitious" },
  race = "Dwarf", likesTone = "blunt",
  notices = { "race", "class" },

  impression = {
    first = "He drives a hard bargain but lights up at talk of gryphons.",
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
    op_wildhammer = {
      lines = {
        { id = "opw_default", text = "Neither, an' both, an' that's how I came tae live in a mage's keep at the end o' the world. But ye've an opinion, I can see it on yer face, so out wi' it: should the Wildhammer come home tae Ironforge, or stay free in the Hinterlands?" },
      },
      choices = {
        { text = "Ironforge is the heart of the dwarves. They should come home.", next = "op_wh_home", fx = { align = { order = 1 }, opinion = { wildhammer = "distrust", magni = "trust" } } },
        { text = "The Wildhammer kept their freedom. Good for them.", next = "op_wh_free", fx = { affinity = 1, align = { order = -1 }, opinion = { wildhammer = "admire" } } },
        { text = "We're one people, whatever beard we follow.", next = "op_wh_kin", fx = { affinity = 2, opinion = { wildhammer = "respect", dwarves = "kin" } }, when = { race = "Dwarf" } },
        { text = "I'll not get between dwarves and their grudges.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    op_wh_home = {
      lines = {
        { id = "opwh_default", text = "Spoken like a Bronzebeard, whatever yer blood. Magni's a fair king, I'll grant ye, but he'll never understand why a dwarf would rather have the sky than a roof." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wh_free = {
      lines = {
        { id = "opwf_default", text = "Ha! Now there's a gryphon rider's answer. Free an' poor an' proud of it, that's the Wildhammer way, an' it's why I left, an' it's why I miss it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wh_kin = {
      lines = {
        { id = "opwk_default", text = "Aye, one people, an' three thrones, an' a war at Grim Batol tae prove it. Ye're a kinder dwarf than most, cousin, so don't let the old men in either city talk ye out o' it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then an old debt's been paid, though not by any dwarf of my clan. When the Dark Irons' sorceress died at Grim Batol her curse fell on the whole mountain, and my people had to leave it to rot and make a new home in the Hinterlands, and no Wildhammer has forgotten whose sorcery did it." } },
      choices = {
        { text = "A debt paid is a debt done. Let the grudge die with him.", next = "BACK", reply = "Aye, mebbe ye're right, an' the dead can keep their grudges in the dark. I'll try tae let it lie, but I'll no' promise.", fx = { align = { honor = 1 } } },
        { text = "Keep the grudge. A people that forgets gets wronged twice.", next = "BACK", reply = "That's the Wildhammer in ye talkin', or ye've a bit o' dwarf blood somewhere. Aye, keep it, an' keep it sharp.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "Drill them till they hate you. A shield wall that hates you still holds.", next = "BACK", reply = "Ha! That's how the Bronzebeards do it, an' I'll no' argue it works. But ye'll never catch me in a shield wall.", fx = { align = { order = 1 } } },
        { text = "Give me the sky and the hammer, and nobody's orders.", next = "BACK", reply = "Now that's a Wildhammer answer, an' I'd buy ye an ale for it if this keep had any worth drinkin'. The sky an' the hammer, aye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Both, like a good axe, an' it depends entirely on whose hand is on the haft. I've seen things in the chalk that I'd rather not have seen, an' I've found lost gryphons an' lost children, an' I'll not be ashamed o' the second for fear o' the first." } },
      choices = {
        { text = "Then use it in the open, and I'll not judge it.", next = "BACK", reply = "Honestly, aye, an' that's all I ask o' anyone. Thank ye, paladin, ye're fairer than most o' yer order.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some doors should stay shut, whatever good comes through.", next = "BACK", reply = "Mebbe some should, an' I'll no' argue the point too hard. But this one's already open, an' I'd rather know what comes through.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The Dark Portal and everything that came through it. The orcs' warlocks drained the life from Draenor to power their magic, and they began the same work here. Nethergarde exists to make sure it never finishes." } },
      choices = {
        { text = "Then I'll help Nethergarde guard what remains.", next = "BACK", reply = "Guard it, aye, an' guard it well. The orcs came through that door once while half o' Azeroth was sure nothin' ever would.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Guarding a dead land seems a waste of good mages.", next = "BACK", reply = "A waste, mebbe, till the day somethin' comes through the door. Then ye'll be glad o' every mage on the wall.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "As real as yer fireballs, though it doesnae make as pretty a noise. The Watchers measure the Portal wi' crystals an' charts, an' I ask the smoke what it's seen, an' half the time we get the same answer, though I'll no' tell them that." } },
      choices = {
        { text = "Chants or charts, whatever works should be used.", next = "BACK", reply = "Aye, whatever works, an' I'm glad ye see it. Chants or charts, the Portal doesnae care.", fx = { align = { order = -1 } } },
        { text = "Proper study beats chanting, Thadius. Respectfully.", next = "BACK", reply = "Respectfully, he says! Ye're a polite one for a mage, an' I'll grant ye study has its place. But so does a good chant.", fx = { align = { order = 1 } } },
        { text = "Something else, Thadius.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It could, an' it has, an' I've charged handsomely for it. If ye've a mind tae lift anythin' in Nethergarde, remember there's a diviner up these stairs who'll find it by mornin', an' he'll want payin' by the thief." } },
      choices = {
        { text = "I'll keep my hands clean in Nethergarde.", next = "BACK", reply = "Good, an' I'll sleep easier for it. The last fellow who didnae keep 'em clean tried tae lift one o' my tomes, an' the tome bit him.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll steal somewhere far from your stairs.", next = "BACK", reply = "Far from my stairs, aye, an' I'll no' ask where. Just don't bring it back here.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_mazen", when = { questDone = TODO_QUEST("Mazen's Behest") },
          text = "Mahar Ba's been tellin' anyone who'll stand still that ye fetched his reagents for the Watchers' work. He's a good lad, if a bit wordy, an' he doesnae get much help from anyone." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths" }, text = "So the Emperor's dead under the mountain, and the Dark Irons have lost their king in his own throne room! I'm a Wildhammer, mind, and my clan has a long memory where Thaurissan's line is concerned, so I'm pouring a dram for it tonight." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, eh? Ye've the shoulders for a Wildhammer storm hammer, if ye ever tire o' whatever it is ye're carryin' now." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. I find lost things, an' ye find things that werenae lost till ye came along, so in a way we're in the same trade." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The Watchers downstairs think my chantin' is old superstition, an' I think their sums are, so we get along by no' talkin' at all." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid, wi' the look o' one who'd rather be anywhere else. I understand; I dream o' trees myself, an' wake tae this." },
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
        { id = "h_again", text = "Aye? What else, then? The circle's no' goin' anywhere, an' neither am I." },
        { id = "h_again2", text = "Ask. I've answers for most things, an' prices for the rest." },
      },
      choices = {
        { text = "What killed the land here?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Why would a Wildhammer leave the Hinterlands?", next = "why" },
        { text = "What do you want with Nekrum's medallion?", next = "medallion", when = { any = { { questActive = TODO_QUEST("Nekrum's Medallion") }, { questDone = TODO_QUEST("Nekrum's Medallion") } } } },
        { text = "How does divination work?", next = "divination" },
        { text = "Can you find Sharpbeak?", next = "sharpbeak", when = { any = { { questActive = TODO_QUEST("Thadius Grimshade") }, { questActive = TODO_QUEST("Nekrum's Medallion") } } } },
        { text = "Darker knowledge has a price, diviner.", next = "priest", when = { class = "PRIEST" } },
        { text = "You're a long way from Aerie Peak, cousin.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Sharpbeak's home, safe with his mother.", next = "home", when = { questDone = TODO_QUEST("Saving Sharpbeak") } },
        { text = "I speak with the spirits too, Thadius.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "My beast could track Sharpbeak's scent.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Your divinations smell of the same smoke I carry.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "Divination doesn't seem like real magic to me.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your divination could find stolen goods, I'd wager.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is divination a gift or a danger, Thadius?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Wildhammer warriors must fight differently from Ironforge's.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Emperor Thaurissan is dead, Thadius. I saw him fall myself.", next = "xcl_brd", when = { cleared = "Blackrock Depths" } },
        { text = "I'll leave you to your chalk.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Because the Hinterlands taught me everythin' about wind an' feather an' nothin' about what lies under them. I wanted tae know what the shamans wouldnae tell me, an' Nethergarde's the only place in the world wi' a library an' a Dark Portal on the doorstep." },
      },
      choices = {
        { text = "You must miss the aeries, Thadius.", next = "why_aerie" },
        { text = "What did the shamans keep from you?", next = "why_shamans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_aerie = {
      lines = { { id = "wa_default", text = "Every day, an' I'll deny it if ye tell the mages. When I cannae sleep I go up tae the roost an' talk tae the keep's gryphons; they're lowland birds, soft as butter, but they listen." } },
      choices = {
        { text = "That's no crime, Thadius.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then go home.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    why_shamans = {
      lines = { { id = "ws_default", text = "That some knowledge is better left alone, which is exactly what a man says when he's afraid o' it. I'm afraid o' it too, mind; I just read it anyway." } },
      choices = {
        { text = "Some knowledge ought to stay buried.", next = "BACK", reply = "Mebbe it should, an' I've thought that myself. But I'm no' afraid o' it, an' that's the difference.", fx = { align = { light = 1 } } },
        { text = "Knowledge is knowledge. Fear is no reason to stop.", next = "BACK", reply = "Exactly, an' that's what I told the elders at Aerie Peak. They didnae like it, but they couldnae argue.", fx = { align = { light = -1 }, affinity = 1 } },
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
        { text = "Long life isn't worth a troll's curse.", next = "BACK", reply = "It isnae, an' I'll no' be the one tae try. But I'd like tae know how he's done it all the same.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "If you can cheat the price, more power to you.", next = "BACK", reply = "Ha! Ye've a Wildhammer's nerve, an' I like ye for it. Cheat it if ye can, but don't come cryin' tae me after.", fx = { align = { light = -1 }, affinity = 1 } },
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
      lines = { { id = "pr_default", text = "Aye, an' I pay it, an' I've the scars tae show for every payment. Yer Light has its price too, priest; ye just call it faith an' pay it in advance." } },
      choices = {
        { text = "Faith isn't a price. It's a gift.", next = "BACK", reply = "A gift, aye, an' a gift has its own price, even if ye don't see it. But I'll no' argue faith wi' ye.", fx = { align = { light = 2 } } },
        { text = "You're not wrong. Every power costs something.", next = "BACK", reply = "Every power, aye, an' ye're one o' the few priests who'll say so out loud. I'd drink tae that, if this keep had a drop worth drinkin'.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw2_default", text = "Further than ye know, cousin. The Bronzebeards would call me a Wildhammer an' the Wildhammers would call me a bookworm, so here I sit, where nobody's bothered what I am as long as the scryin' works." } },
      choices = {
        { text = "Which side are you on, then, Bronzebeard or Wildhammer?", next = "op_wildhammer" },
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
        { text = "The spirits deserve respect, Thadius. Go home.", next = "BACK", reply = "Go home? I've thought about it, an' mebbe one day. But no' while there's work here.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Results matter. The spirits will get over it.", next = "BACK", reply = "They'll get over it, aye, or they won't, an' I'll pay the price either way. I've paid worse for less, out here.", fx = { align = { light = -1 }, affinity = 1 } },
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
        { text = "Borrowing is just inviting with poor manners.", next = "BACK", reply = "Ha! That's a fine way o' puttin' it, an' mebbe ye're right. I'll keep my manners, at least.", fx = { align = { light = -1 }, trait = { witty = 1 } } },
        { text = "Then we should both be careful.", next = "BACK", reply = "Aye, both of us, an' very careful at that. I've a scorch mark on the ceilin' that says so.", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, now, that's a rare thing tae hear in a keep full o' mages, who'd choke before they praised a dwarf. I'll take it, an' gladly." },
        { id = "s2", text = "Ye've an eye for good work, an' no' many do. That circle took me all mornin', an' ye're the first tae notice it's true." },
      },
      fail = {
        { id = "f1", text = "Aye, an' what'll that cost me? I've haggled wi' goblins, so I know when a compliment's only the first offer." },
        { id = "f2", text = "Save yer breath. The mages o' Dalaran flattered me right up until they wanted my notes, an' I've been deaf tae it ever since." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! A Wildhammer wi' his nose in a book, aye, my own kin said worse an' said it louder. Ye've a tongue on ye, an' I like that." },
        { id = "s2", text = "Ye're a cheeky one, are ye no'? Good, for I've had my fill o' folk who tiptoe round me as if I'd hex them." },
      },
      fail = {
        { id = "f1", text = "Mind yerself. I may read for a livin', but I was bred at Aerie Peak, an' I've a stormhammer under the bench that still knows its work." },
        { id = "f2", text = "I've been laughed at by mages an' by my own clan, an' ye're no' as good at it as either. Away wi' ye, for I've scryin' tae do." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Easy, there. I can see ye're no' one tae be trifled wi', an' I'd as soon no' have blood on my chalk. Say what ye want." },
        { id = "s2", text = "Aye, well, ye've a look on ye I've only seen on a gryphon before it strikes. I'll no' argue the point." },
      },
      fail = {
        { id = "f1", text = "Ye'd threaten a dwarf who scries the Blasted Lands at night? {g:Laddie|Lassie}, I've seen things in that bowl that would turn yer hair white, an' ye're no' one o' them." },
        { id = "f2", text = "Step off my circle before ye smudge it, an' take yer scowl wi' ye. It doesn't frighten me, an' it's blockin' the light." },
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
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages taught me what I know, an' they never let me forget I was a dwarf. I learned anyway, an' by the end I could out-cast most o' their journeymen." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres are thick as stone an' twice as stubborn, an' they've no business near the Portal. I'd like them gone, an' I'd pay to see it." } },
    _none = { { id = "tp_none", text = "That's no' somethin' I've ever cared tae look for. Ask the Watcher; he cares about everythin'." } },
    _gated = {
      { id = "gt1", text = "That'll stay under my hat till I know ye better. I don't hand my business tae every stranger who knocks at the door." },
      { id = "gt2", text = "No, I'll no' be tellin' ye that yet. Come back when we've done a bit o' honest tradin', an' we'll see." },
    },
  },
}

P:NPC {
  key = "ardalan", id = TODO_NPC("Ambassador Ardalan"), name = "Ambassador Ardalan",
  bible = "bibles/blastedlands.md", role = "noble", tier = "major",
  communities = { "nethergarde" }, temper = { "proud" }, values = { "wise", "practical" },
  likesTone = "polite", private = { "arthas" },
  prejudice = { class = "WARLOCK", amount = 13, why = "Has spent years warning the kingdoms of the Burning Legion; sees a warlock as the Legion's open door." },
  notices = { "race", "class" },

  impression = {
    first = "He never quite says whom he speaks for.",
    third = "{name} met Ambassador Ardalan, an elven envoy at Nethergarde Keep who urges Alliance and Horde to stand together against the Burning Legion.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I have spent years warning the kingdoms of the Burning Legion, and you invite its servants to walk beside you. Do not expect me to call that courage." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Every warlock believes he is master of his demon, right up until he isn't. Say what you came to say." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You have fought the Legion's creatures in these wastes, and that counts for something. It does not make me trust the door you keep open." },
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
    op_alliance = {
      lines = {
        { id = "opa_default", text = "My king left the Alliance after the orcs burned our forests, and the Alliance did not come when the Scourge did. Whose fault that was is argued in every court that still stands, so I would hear your verdict." },
      },
      choices = {
        { text = "The Alliance failed you, and it should be ashamed of it.", next = "op_alli_failed", fx = { affinity = 2, align = { honor = 1 }, opinion = { alliance = "failed" } } },
        { text = "Your king left the Alliance first. Quel'Thalas reaped what it sowed.", next = "op_alli_sowed", fx = { affinity = -2, align = { honor = -1 }, opinion = { high_elves = "contempt" } } },
        { text = "My people warned yours about magic ten thousand years ago.", next = "op_alli_magic", fx = { affinity = -1, opinion = { arcane_magic = "dangerous", high_elves = "pity" } }, when = { race = "NightElf" } },
        { text = "Your people's grief is real, whoever's to blame. I'm sorry.", next = "op_alli_sorry", fx = { affinity = 1, trait = { kind = 1 }, opinion = { high_elves = "pity" } } },
        { text = "That's for courts to argue, not me.", next = "BACK" },
      },
    },
    op_alli_failed = {
      lines = {
        { id = "opaf_default", text = "You're the first in this keep to say it without blushing. Shame is cheap, of course, and it rebuilds nothing, but I'll take it as a beginning." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_alli_sowed = {
      lines = {
        { id = "opas_default", text = "Spoken like someone whose capital still stands. I hope you never learn what it is to be right about a quarrel while your capital burns." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_alli_magic = {
      lines = {
        { id = "opam_default", text = "You did, and you've reminded us ever since, with the patience of people who never forgave us for being right about other things. Shall we leave old quarrels in the past, where they belong?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_alli_sorry = {
      lines = {
        { id = "opay_default", text = "Thank you. Sorrow is about all my people have left to trade in, and it's good to find a buyer who doesn't haggle." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That the line between Horde and Alliance is thinner than either side pretends. The elements answer an orc and a dwarf alike, and if they see no difference between you, I wonder why we insist on killing each other." } },
      choices = {
        { text = "The elements may not choose sides, but I do.", next = "BACK", reply = "That's your right, and I'll not ask you to give it up. But choose carefully, because the Legion chooses everyone.", fx = { align = { order = 1 } } },
        { text = "Perhaps you're right. The spirits care nothing for banners.", next = "BACK", reply = "They don't, and neither should we, at least where the Legion's concerned. Thank you for hearing me out.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The servants of the Burning Legion, which is a far older enemy than any orc. The Alliance spends good swords on Horde patrols in Ashenvale while the Shadowsworn bleed onto altars a few miles from this keep, and I find that very difficult to watch politely." } },
      choices = {
        { text = "You're right. Demon-worshippers first, old grudges after.", next = "BACK", reply = "Exactly, and I'm glad you see it. The orcs at Stonard are a day's ride away and asleep; the cultists in the Scar are a morning's walk and very much awake.", fx = { align = { light = 1 } } },
        { text = "The Horde earned my blade. I won't forget that for you.", next = "BACK", reply = "Then you'll fight the Horde, and the Legion will thank you for it. I only ask you to remember who the real enemy is.", fx = { align = { light = -1 } } },
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
        { text = "Then I'll scout the Scar and tell the keep what I find.", next = "BACK", reply = "Thank you, the keep needs all the eyes it can get. Watch the altars, and keep your distance.", fx = { align = { honor = 1 } } },
        { text = "I hunt for coin, Ambassador, not for warnings.", next = "BACK", reply = "Coin, then, and I'll pay it if I must. But warnings are worth more than coin, out here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I speak for those who remember what Archimonde did to Dalaran, which ought to be everyone and is almost nobody. The Kirin Tor are scattered, and while they rebuild, the Alliance and the Horde sharpen their swords on each other." } },
      choices = {
        { text = "Then the old enemies should make peace.", next = "BACK", reply = "They should, and I hope one day they will. Archimonde didn't care whose banner he burned.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace with the Horde? Not while the blood's still fresh.", next = "BACK", reply = "The blood is fresh, yes, and there is old blood under it too. But the Legion's blood is older than any of it, and it is still flowing.", fx = { align = { light = -1 } } },
        { text = "Something else, Ambassador.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Then perhaps every spy is sincere, which would be a pleasant surprise for us all. I carry no knives and steal no letters, unlike a fair portion of this garrison, so judge me by what I ask of you, not by what I won't say." } },
      choices = {
        { text = "Fair enough. I'll judge you by your deeds.", next = "BACK", reply = "That's all I ask. The garrison has been judging me by my ears since the day I arrived.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets cut both ways. I'll find yours, Ambassador.", next = "BACK", reply = "You may try, and I'll wish you luck. My secrets are very dull, I'm afraid.", fx = { align = { honor = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It does, though perhaps not as loudly as I would like, and your druids sit with the tauren in Moonglade without a single sword drawn. If the Circle can keep that peace, then the Alliance and the Horde can keep it here too, and fight what came through the Portal instead of one another." } },
      choices = {
        { text = "The Circle's peace is a good example. The war should end.", next = "BACK", reply = "It is, and I wish more would follow it. Moonglade shows what's possible.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Moonglade isn't Nethergarde. The Horde must answer for the war.", next = "BACK", reply = "It must, and it will, in time. I only ask that the reckoning wait until the Scar is empty.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_honor = {
      lines = {
        { id = "dd_honor_1",
          text = "Because every orc you kill in Alterac or Warsong is one fewer orc standing between this world and what lies behind that Portal. The Legion made the orcs into a weapon once, and it would be glad to see us break that weapon for it." },
        { id = "dd_honor_2",
          text = "I know how it sounds, coming from an elf in a dwarven keep. I only ask you to remember who is truly watching when the two sides spend their blood on each other." },
      },
      choices = {
        { text = "The Horde is the enemy. I'll keep killing them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe you're right. The Legion is the true enemy.", next = "BACK", fx = { align = { order = -1, light = 1 } } },
        { text = "Something else, Ambassador.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_honor", when = { faction = "Alliance", honorKills = { min = 100 } },
          text = "You've the look of someone who's been killing Horde soldiers in some valley or other, and doing it well. I won't lecture you, friend, but I'd like you to sit with me a while before you go back to it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. I'd ask whose blood you've been trained to spill, though I suspect the answer is orcs, and I'd suggest very gently that the orcs are not the ones building altars south of this keep." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, and you've been looking at me the way you'd look at a trail, wondering where it leads. It leads south, if you'd like to know, toward the cultists nobody here cares to talk about." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be wondering who I really work for, I expect, and I'll tell you what I tell the captain: someone who would rather you lived." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Then you know, as I do, that Dalaran was not the Legion's first target, and it will not be the last." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I have argued for years that the Legion is coming, and here stands proof that some would rather open the door than bar it. I will speak with you, because I must." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You have done more against the Legion here than most who swear they hate it. Very well, I am listening." },
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
        { id = "h_again2", text = "Go on, ask. A diplomat's only weapon is a long conversation, and I've had very few lately." },
      },
      choices = {
        { text = "Why would you lecture me about the Horde?", next = "dd_honor", when = { faction = "Alliance", honorKills = { min = 100 } } },
        { text = "Who do you speak for, Ambassador?", next = "who" },
        { text = "What do you mean, the wrong enemy?", next = "enemy" },
        { text = "What threatens these lands, then?", next = "legion" },
        { text = "The garrison doesn't seem to welcome you here.", next = "garrison" },
        { text = "The Light stands against demons, whoever else does.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Thrall would agree with you, elf.", next = "orc", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You'd use people like me against the Legion, Ambassador?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "My people fought the Legion ten thousand years ago.", next = "k_elf", when = { race = "NightElf" } },
        { text = "My ancestors were Highborne, Ambassador.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "You speak like one of Dalaran's own, Ambassador.", next = "xmage", when = { class = "MAGE" } },
        { text = "Every spy says that, Ambassador.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Who should a warrior be fighting, then, Ambassador?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You keep watching something south of the keep, Ambassador.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
        { text = "Did the Alliance fail Quel'Thalas, Ambassador?", next = "op_alliance" },
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
        { text = "The Horde burned Stormwind once. I won't fight beside them.", next = "BACK", reply = "They did, and I'll not pretend otherwise, for my own people bled in those fires. But the hand that lit them is still out there, and it isn't green.", fx = { align = { honor = -1 }, opinion = { horde = "never" } } },
        { text = "If the demons are the threat, I'll stand with anyone.", next = "BACK", reply = "Then you've understood what took me a lifetime and a burned city to learn. Stand with anyone, and watch the shadows together.", fx = { align = { honor = 1 }, affinity = 2, opinion = { horde = "common_cause" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy_hero = {
      lines = { { id = "eh_default", text = "There's an orc, a fallen hero of the Horde, at the border of the swamp and these lands. He knows the truth of the Blasted Lands better than anyone in this keep, and he paid for it in a way I'd not wish on anyone." } },
      choices = {
        { text = "I'll go and hear him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something must have happened to him.", next = "enemy_paid" },
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
        { text = "The Light shelters anyone who stands against the dark.", next = "BACK", reply = "It does, and I'm glad to hear a priest say it in this keep. The soldiers will need time to hear it too.", fx = { align = { light = 1, honor = 1 }, affinity = 2 } },
        { text = "The Light also remembers who burned Lordaeron's villages.", next = "BACK", reply = "It remembers, and so do I, for I watched some of those villages burn. But the hand that drove the orcs remembers us all.", fx = { align = { honor = -1 } } },
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
        { text = "A weapon. Point me south.", next = "BACK", reply = "A weapon who points himself, then. Go south, and come back with the cult's names.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "A warning. I know what it costs.", next = "BACK", reply = "Then you understand the price better than most, and I'll trust you more for it. A warning carried wisely is worth an army.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Which enemy do you mean?", next = "legion" },
      },
    },
    k_elf = {
      lines = {
        { id = "xel_default", text = "Then you need no lecture from me, and I'm glad of it, for I've given this one to every soldier on the wall and they look at me as if I'd grown a second head. Tell your Sentinels the Legion never forgot your forests, even if the humans never learned their name." },
      },
      choices = {
        { text = "We remember. We'll stand with whoever stands against it.", next = "BACK", reply = "Then we're of one mind, and I'm glad of it. Quel'Thalas remembers too, though it speaks of it less.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "My people fight their own wars, elf.", next = "BACK", reply = "They do, and so do mine, and that is exactly the trouble. The Legion will be glad to hear we still fight alone.", fx = { align = { order = 1 }, affinity = -1 } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "How gracious, and how unlike this garrison. I had begun to think that courtesy had been left off Nethergarde's supply list entirely." },
        { id = "s2", text = "You flatter me, and you do it with some skill, which I may say as one who has practised the art in a great many halls. I am obliged to you." },
      },
      fail = {
        { id = "f1", text = "I have been flattered by kings who meant to refuse me before the wine was poured. You will forgive me if I recognise the opening." },
        { id = "f2", text = "A diplomat is paid to notice when sweet words arrive ahead of a request. Let us dispense with the first and proceed to the second." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ah, a little wit at the ambassador's expense. Do continue, for it is a good deal more civil than what the soldiers say behind my back, and rather cleverer." },
        { id = "s2", text = "You are impertinent, and I find that I prefer it to the scowling. One learns to value an honest barb in a keep full of silent contempt." },
      },
      fail = {
        { id = "f1", text = "I have been insulted in Stormwind, in Ironforge and in the ruins of my own city, and by people with far greater gifts for it. You may stop." },
        { id = "f2", text = "How disappointing. I had taken you for one who came to listen, and instead you are merely another jeer among the many." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There is no need for that, I assure you. I am a diplomat, and I know very well when the other party holds the stronger hand." },
        { id = "s2", text = "You make your position admirably clear, and I am not so proud as to ignore it. Very well; ask, and I shall be candid." },
      },
      fail = {
        { id = "f1", text = "I watched the Scourge march through the gates of Silvermoon. After that, I regret to say, there is very little that a raised voice can do to me." },
        { id = "f2", text = "Threats are what remain when argument has failed, and I am sorry to see you reach them so quickly. I shall wait until you find your manners again." },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "Diplomats hear everything, mostly from people who don't think we're listening. Pick a subject." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've listened to me, which nobody else here does, so I'll return the favour. Ask anything." },
    },
    background = {
      { id = "tp_bg", text = "An elf of a kingdom that no longer exists, carrying a message nobody wants to hear. I've had better posts.", next = "who" },
      { id = "tp_bg2", text = "I've worn this title in more halls than I can count, and been shown the door in most of them." },
    },
    advice = { { id = "tp_ad", text = "Before you draw your sword, ask who profits from the fight. In these lands the answer is rarely the one swinging, and almost never the one who dies." } },
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
    _gated = {
      { id = "gt1", text = "That is a confidence, and I extend my confidences sparingly. Perhaps I shall, when we know each other better." },
      { id = "gt2", text = "I must decline to speak of that for the present. You have not yet given me cause to trust you with it." },
    },
  },
}

P:NPC {
  key = "enohar", id = TODO_NPC("Enohar Thunderbrew"), name = "Enohar Thunderbrew",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "nethergarde" }, temper = { "jovial" }, values = { "loyal", "brave" },
  notices = { "race", "drunk", "lock_stones" },

  impression = {
    first = "Mention her family's ale and she bristles, mention home and she quiets.",
    third = "{name} met Enohar Thunderbrew, a dwarf of the famous brewing family serving at Nethergarde Keep.",
  },

  greetings = {
    { id = "g_op_wildhammer", when = { gossip = { topic = "wildhammer", stance = "admire" } }, text = "Thadius says ye've a soft spot for the Wildhammer. Well, they brew a fair ale, I'll grant ye, for folk who live up trees an' talk tae birds." },
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
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Is that a healthstone in yer pocket? I've seen soldiers here trade a week's ale for one before a patrol tae the Portal, an' I've never once laughed at them for it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Oh, the Thunderbrews mind everythin', {g:lad|lass}. They'd say the stone's for minin', the ale's for drinkin' an' spirits are for orcs, but I'm stuck here starin' at the Portal, so I've stopped mindin' much." } },
      choices = {
        { text = "Khaz Modan's stone speaks to me. I'll not hide that.", next = "BACK", reply = "Ha! Then don't hide it, {g:lad|lass}, an' let the Thunderbrews grumble into their mugs. The stone's big enough for both of us.", fx = { align = { order = -1 } } },
        { text = "I honour the old ways too. The spirits only add to them.", next = "BACK", reply = "Now that's a dwarf wi' sense, an' my uncle would stop grumblin' tae hear it. Mebbe.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One mug steadies yer hand an' two makes ye brave, an' by the third ye're the bravest corpse the Dreadmaul ever ate. My granda carried a flask through the whole o' the Second War, an' he always said the trick was knowin' which side o' the battle tae drink on." } },
      choices = {
        { text = "I fight sober. Duty first, and ale once the line holds.", next = "BACK", reply = "Spoken like a sergeant, an' a sensible one. I'll have a mug waitin' for ye when the line holds.", fx = { align = { order = 1 } } },
        { text = "A warrior should fight the way he drinks, with his whole heart.", next = "BACK", reply = "Ha! Then ye'll fight like a Thunderbrew, an' I'll drink tae that. Just mind the third mug.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Precious little that's fit tae eat, I'll tell ye, because the boars taste o' brimstone an' the scorpids taste o' nothin' at all. Back in Dun Morogh we'd hunt boar in the snow an' roast it by the brewhouse, an' I'll admit I think on that more often than a soldier should." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Precious little fit tae eat, for the boars taste o' brimstone. An' who's this, {pet}? Keep yer beast away from the barrels, because the last one that got its nose in a keg o' Thunderbrew slept for two days an' woke up mean." },
      },
      choices = {
        { text = "Your post is here, Enohar. Dun Morogh will keep.", next = "BACK", reply = "Aye, it will, an' so will my mother's stew. I'll stay, but I'll grumble about it.", fx = { align = { order = 1 } } },
        { text = "Go home, then. Nobody should rot out here for duty.", next = "BACK", reply = "Go home? Ach, don't tempt me, I'd be halfway tae Kharanos before ye finished the sentence. But someone's got tae brew for the lads.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Needs? No. Wants? Aye, an' there's a difference, though the captain doesnae always see it. My kin brew the finest ale in Khaz Modan an' I'm stuck at the end o' the world watchin' a gate, so ye'll forgive me a wee comfort." } },
      choices = {
        { text = "Duty comes before comfort, Enohar, every time.", next = "BACK", reply = "Every time, aye, an' that's why I'm still here. But a wee dram doesnae hurt the duty.", fx = { align = { order = 1 } } },
        { text = "A watch kept is a watch kept. Drink up.", next = "BACK", reply = "Now that's a paladin I'd share a cask wi'! Drink up, an' keep watch, an' we'll get along.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some pray, some drink, an' most do both, an' I'll no' judge which comes first. Ye stand watch beside that Portal for long enough an' ye learn that the Light an' a good ale both keep the dark from creepin' in." } },
      choices = {
        { text = "Faith keeps watch better than ale ever could.", next = "BACK", reply = "Mebbe it does, an' I'll no' argue wi' ye. But ale's never once asked me tae confess.", fx = { align = { light = 1 } } },
        { text = "Ale's an honest comfort. The Light won't begrudge it.", next = "BACK", reply = "Ha! A priest after my own heart! The Light an' the ale, an' the lads are all the better for both.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "A wee bit, an' only out o' stubbornness. There's roots out there that grow nowhere else, twisted things that drink demon blood, an' feed one tae a man an' he'll either be strong as a bull or spend three days in the latrine trench." } },
      choices = {
        { text = "Then I'll help you find what heals rather than harms.", next = "BACK", reply = "Ye'd do that? Then ye're a better friend tae this land than most who walk it. I'll show ye where they grow.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Twisted things should be burned, not harvested.", next = "BACK", reply = "Burned, aye, an' I've thought it myself. But some o' them heal better than anything from the Alterac hills.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Done, an' a fair trade! Kharanos is snow an' stills an' the best ale in Khaz Modan, an' Ragnar's there fumin' over our stolen brew while I drink Nethergarde's swill, so ye can see why a cold mug cheers me." } },
      choices = {
        { text = "Duty first. The keep needs you more than Kharanos does.", next = "BACK", reply = "Duty, aye, an' the keep's got me till my contract's up. But Kharanos will still be waitin'.", fx = { align = { order = 1 } } },
        { text = "Family first. Kharanos needs you more than the keep does.", next = "BACK", reply = "Ha! Ye sound like my sister, an' she's never wrong. Mebbe I'll take leave in the spring.", fx = { align = { order = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because they're watchin' the very door those horrors came through, an' ye're standin' there wi' somethin' at yer heel that smells o' the same place. Me, I judge a body by what they drink an' how they pay, so pull up a crate, an' keep the wee beastie off my mug." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because they're watchin' the very door the demons came through, an' ye've brought one up tae the bar wi' ye. Me, I judge a body by what they drink an' how they pay, so pull up a crate, but that thing's been sniffin' at my mug, an' it can sniff somethin' else." },
      },
      choices = {
        { text = "What came through that door is a weapon. Nethergarde should use it.", next = "BACK", reply = "A weapon, is it? Ach, I'll leave that tae the captain, but I'll no' be drinkin' wi' yer wee beastie.", fx = { align = { light = -1 } } },
        { text = "They're right to be wary. I'd be wary too.", next = "BACK", reply = "Good, an' they'll respect ye more for it. The last warlock who wasnae wary had his imp set fire tae the barracks blankets, an' the lads still talk about it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Enohar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 8 } },
          text = "Ye've been dyin' a fair bit lately, by the look o' ye. Have a drink before ye go back out, because a dwarf in Kharanos would tell ye nae spirit healer's half as good as a warm mug." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Good, sit doon an' have one, because ye'll be wantin' it after a day out by the Dreadmaul camps." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, eh? If ye bag a boar out there, I'll tell ye my cousin's way o' roastin' it, because it's wasted on the bread an' cheese they serve in this keep." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Somethin' smoky's come in wi' ye, an' I can guess what. Most o' the folk in this keep would sooner see the Portal open than one o' yer kind on the wall." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could ye put a wee frost on this mug? Nethergarde's ale comes in warm an' stays warm, an' it's an insult tae every Thunderbrew livin'." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid! Ye'll be wantin' tae see what this place was before the Dark Portal, I suppose, an' so would I." },
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
        { text = "Is anything troubling the Thunderbrews?", next = "ale" },
        { text = "A Thunderbrew is a long way from home out here.", next = "why" },
        { text = "How do the dwarves find Nethergarde?", next = "dwarves" },
        { text = "To Ironforge, and to good ale!", next = "toast", when = { race = "Dwarf" } },
        { text = "I've had a few myself, mind.", next = "drunk", when = { drunk = true } },
        { text = "If anything of yours was stolen, I could steal it back.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "A frost for your mug, if you'll tell me about home.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why does everyone in this keep watch me so closely?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The soldiers here don't look like they pray much.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does a dwarf on duty need a mug in hand, Enohar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A mug before battle steadies a warrior, I'd say.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
        { text = "Out the window, I'd say. With a cask.", next = "xorig_brew2", fx = { trait = { witty = 1 }, affinity = 1 } },
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
        { text = "What was stolen, exactly?", next = "ale" },
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
  notices = { "race", "lock_steed" },

  impression = {
    first = "She speaks of her gryphons the way others speak of their children.",
    third = "{name} met Alexandra Constantine, the gryphon master of Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Need a gryphon? Keep your voice down near the roost; they're napping off the heat." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The birds remember you, which is more than they do for most." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good; you'll know how to sit a gryphon without strangling it. The soldiers here hold the reins as if they were drowning." },
    { id = "n_lock_steed", cat = "lock_steed", when = { aura = { 5784, 23161 } },
      text = "Please leave that burning horse at the foot of the hill, because the gryphons have been staring south at the Portal all day, and they don't need a reminder of what came out of it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything here troubles them: the red sky, the fel in the water, the smell off the Portal. If your spirits have any kindness left for this land, I'd ask them to spare a little for my birds." } },
      choices = {
        { text = "This land can heal, given time and care.", next = "BACK", reply = "It can. There's a patch of grass by the north wall that came back last spring; I water it from my own ration and I haven't told anyone.", fx = { align = { light = 1 } } },
        { text = "This land is lost. Burn out the fel and move on.", next = "BACK", reply = "Burn it out, and you'd burn what little's trying to grow. I'd rather tend it, even this slowly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can, and they do, though they grumble about it the whole way to Darkshire, and I don't blame them. The Wildhammer flew riders straight into the Horde's lines in the Second War, so I tell my birds a soldier in plate is nothing their kind hasn't carried before." } },
      choices = {
        { text = "I'll leave the heavy plate behind. Your birds deserve better.", next = "BACK", reply = "They'll thank you for it, and so will I. Greywing came back lame last month from carrying a knight in full harness, and she's only just flying again.", fx = { align = { light = 1 } } },
        { text = "A gryphon is a beast of war. It can carry me.", next = "BACK", reply = "It can, and it will, but it'll remember every pound. Go gently with them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Clean water carried down from Darkshire, meat that hasn't been within a mile of the Tainted Scar, and long rests after every flight south. The worst of it is the dust, which gets into their feathers and their lungs, and I spend half my evenings combing it out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Clean water, clean meat and a comb for the dust every evening. {pet} has the dust all down its coat as well, poor thing, so comb it out nightly, because a beast that can't breathe can't hunt." },
      },
      choices = {
        { text = "Your care keeps the keep's letters moving. That matters.", next = "BACK", reply = "It does, and nobody else seems to notice. Thank you for saying so.", fx = { align = { order = 1 } } },
        { text = "Send them somewhere kinder. This land isn't for gryphons.", next = "BACK", reply = "I'd like to, but the letters must fly, and so must they. I'll keep them as well as I can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The black drake the soldiers talk about took three of my best out of the air in a single week, and nothing I've tried has kept it away. The keep wants letters carried and I keep sending birds out, and I hate every minute of it." } },
      choices = {
        { text = "Duty's hard, but the letters have to fly.", next = "BACK", reply = "It must, and they do, though I hold my breath every time one leaves. The drake hasn't come back, at least not yet.", fx = { align = { order = 1 } } },
        { text = "Keep the birds home until the drake's dealt with.", next = "BACK", reply = "I'd like to, but the keep can't wait, and neither can the letters. I'll send them high and fast.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They won't fly within a mile of it, and they come back trembling if the wind turns them that way. Whatever the Portal is now, it still remembers what came through it, and so do the birds, I think." } },
      choices = {
        { text = "Creatures sense what the Light opposes. Trust them.", next = "BACK", reply = "I do, and I've learned to watch them as closely as the Watchers watch the Portal. They know more than we do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They smell the scorched earth, that's all.", next = "BACK", reply = "Perhaps, but they've flown over scorched earth before without trembling. This is something else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They mind the wards on the tower more, because the air hums when the Watchers are working and the birds hate a humming sky. They've all learned to land on the far side of the keep, the clever things." } },
      choices = {
        { text = "Then I'll keep my spells quiet near your birds.", next = "BACK", reply = "Thank you. They put up with the Watchers' humming because they have to, and they'll be grateful for one less thing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Birds can learn to put up with a little noise.", next = "BACK", reply = "They can, but they shouldn't have to, not on top of everything else. A little consideration goes a long way.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because this whole land smells of them, and the birds have flown over it all their lives, and they know what that smell means even if they've never seen the thing. I'd take a nervous bird over a brave one out here, any day." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because this whole land smells of them, and the birds have flown over it all their lives, and now one's standing at the foot of their roost. You can hear them shifting from here, so send it away before I bring one down, and I'd take a nervous bird over a brave one, but not a frantic one." },
      },
      choices = {
        { text = "Wise birds. What I keep can wait outside.", next = "BACK", reply = "Thank you. The young male bolted clean over the wall the last time someone walked in with a little horned thing at their heel, and it took me two days to coax him down.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear makes them weak. They'll get used to it.", next = "BACK", reply = "They won't, and I'd not want them to. Fear keeps them alive here.", fx = { align = { light = -1 } } },
        { text = "Something else, Alexandra.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The air burns their lungs, the water's foul, and the ash gets into their feathers until they can barely fly. Your Circle sent a druid through last year who sat with my sickest bird all night, and it flew the next morning, and I've never known how." } },
      choices = {
        { text = "Your birds deserve better land than this. They should go home.", next = "BACK", reply = "They do, and I've written to Stormwind more than once. Until then, I'll do what I can.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Nethergarde needs its gryphons. They must stay and serve.", next = "BACK", reply = "They must, and they do, and it's breaking my heart. I'll keep them as well as I can.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "All of them do, and I'd think less of them if they didn't, because in this land anything that creeps up on you usually means to eat you. Walk up to them openly and let them see your hands, and they'll carry you anywhere you need to go, even a rogue." } },
      choices = {
        { text = "Hands showing, then. I'll walk up openly.", next = "BACK", reply = "Thank you, they'll settle faster for it. Let the big one smell your palm before you touch her.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep creeping. It's good practice, birds or not.", next = "BACK", reply = "Then don't be surprised when you get a beak in the shoulder. They don't like surprises.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_sharpbeak = {
      lines = {
        { id = "dd_sharpbeak_1",
          text = "Every gryphon master between Aerie Peak and Nethergarde knows it. He was the Wildhammer's finest, and the Dark Irons took him for some foul purpose of their own, and the Aerie's been sending letters asking after him for longer than I'd like to say." },
        { id = "dd_sharpbeak_2",
          text = "A gryphon that's been caged doesn't always fly right again, mind. But he'll be home, among his own kind, and that's more than most creatures get out of the Dark Irons." },
      },
      choices = {
        { text = "He deserved to fly free. I'd do it again.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I did it for Thadius's reward, honestly.", next = "BACK", fx = { align = { light = -1, honor = 1 } } },
        { text = "Something else, Alexandra.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_sharpbeak", tags = { "news" }, when = { questDone = TODO_QUEST("Saving Sharpbeak") },
          text = "Thadius tells me you got Sharpbeak out of the Dark Iron cage and sent him home to the Hinterlands. I've had a bird in a cage once, and I cried for a week when I got her back, so you have my thanks for that one." },
        { id = "h_dd_fall", when = { deathCause = "falling" },
          text = "I hear you came down from a height somewhere without wings to break it. My birds have been flying in this wind for years, so next time, let one of them do the falling for you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Stay clear of the roost if you can't help creeping, because a gryphon that hears someone sneak up behind it will bite first and think about it afterward." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. You'll be heavy in the saddle, so mind how you mount, because my birds remember who kicked them on the way up." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! Then you'll understand what it is to keep an animal alive in a place that wants it dead, and most visitors never give it a thought." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Keep whatever's at your heel well away from the roost, because a gryphon that smells that stink won't fly for a day." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. If you're flying, keep your hands in your lap; the last one cast a frost spell to cool off, and my bird came down at Darkshire with ice on its wings." },
        { id = "h_default", key = true,
          text = "Alexandra Constantine, gryphon master of Nethergarde. My birds carry the keep's letters and the keep's visitors, and the Blasted Lands do their best to kill all three." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights are cold enough to frost a gryphon's beak out here. I'll find you a blanket for the saddle if you're going." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! The birds take to holy folk, I've noticed, and you'd be doing me a kindness if you said a word over them before the next long flight north." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want my steadiest bird, then, because the heavy riders frighten the young ones, and the young ones are all I have left after this spring." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid! My gryphons perked up when you walked in, and they don't do that for anyone in this keep, so I'll thank you to stay a while." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My gryphons are calmer around you already, and in this place I'll take calm from anywhere it comes." },
      },
      again = { { id = "h_again", text = "Is there something else, or shall I saddle a bird for you?" } },
      choices = {
        { text = "Do you know Sharpbeak's story?", next = "dd_sharpbeak", when = { questDone = TODO_QUEST("Saving Sharpbeak") } },
        { text = "Where can your gryphons take me?", next = "routes" },
        { text = "How do the birds manage this place?", next = "birds" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Your gryphons seem uneasy around the arcane, Alexandra.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do your gryphons shy away from me, Alexandra?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your gryphons must fear the Dark Portal.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What happened to your gryphons this spring, Alexandra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A gryphon would struggle with a warrior in full plate.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
    _none = { { id = "tp_none", text = "I only know birds and weather, I'm afraid. Ask the Quartermaster about the rest; he knows everything that comes in a crate." } },
  },
}

P:NPC {
  key = "bernie", id = TODO_NPC("Bernie Heisten"), name = "Bernie Heisten",
  bible = "bibles/blastedlands.md", role = "vendor", tier = "service",
  communities = { "nethergarde" }, temper = { "warm" }, values = { "generous" },
  notices = { "kit", "lock_shadow" },

  impression = {
    first = "He knows every soldier's order and most of their troubles.",
    third = "{name} met Bernie Heisten, who sells food and drink to the garrison at Nethergarde Keep.",
  },

  greetings = {
    { id = "g_op_defias", when = { gossip = { topic = "defias", stance = "nobles_to_blame" } }, text = "The Quartermaster says you've a soft spot for the Defias' side of things. Don't say it too loud at my counter, friend, because half the stew in this pot came up the Westfall road." },
    { id = "g_default", text = "Hungry? Course you are; everyone who comes up that road is. Have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit down, the stew's hot, and it's the only warm thing this side of the Keep." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like the ogres chewed you and spat you out, friend. Eat something before you go see Strumner about that armor; he's grumpy on an empty stomach, and so are you, I'd wager." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The bread I set out went stale on the board while you were walking in, and it was baked this morning. Out here I've learned not to ask, so sit with your back to the wall and eat." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They talk about everything, and you'd be news for a week, I'd guess. Some say it's orc magic and some say the dwarves always did talk to rocks, and I just say pass the cheese." } },
      choices = {
        { text = "Let them talk. I serve Ironforge, same as them.", next = "BACK", reply = "That's the spirit, and the lads will come round. Ironforge is big enough for spirits too.", fx = { align = { order = 1 } } },
        { text = "Let them call it orc magic. The spirits don't mind.", next = "BACK", reply = "Ha! Let them call it what they like, then. The spirits and the stew both, I'd say.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That they're big and stupid and very hard to kill, mostly, and that there's always more of them coming down from Dreadmaul Hold. One of the lads swears an ogre ate his shield, which I don't believe, though I'll admit I never saw the shield again." } },
      choices = {
        { text = "Ogres or not, I'd stand that watch beside them.", next = "BACK", reply = "That's the spirit the keep needs, and the lads will thank you. Big and stupid is still big.", fx = { align = { honor = 1 } } },
        { text = "Let the ogres have the watch. I'll take the cheese.", next = "BACK", reply = "Ha! The cheese is yours, then, though the ogres might want some too. Take a wedge and keep watch from the kitchen.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scorpid, once, roasted on a shield over the fire, and the lad who tried it couldn't feel his tongue for a week. I tell them it's bread, cheese and water or nothing, because nothing in the Blasted Lands was ever meant to be eaten." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Scorpid, roasted on a shield, and the lad couldn't feel his tongue for a week. Keep {pet} away from the cheese wheels, friend, because the last dog that found them is still the most popular soldier in the keep." },
      },
      choices = {
        { text = "The men deserve better. I'll hunt the wastes for them.", next = "BACK", reply = "They do, and they'd thank you for it. Bring me something that didn't drink from the Scar, if you can.", fx = { align = { honor = 1 } } },
        { text = "Bread will do. I'm not risking my neck for their supper.", next = "BACK", reply = "Bread it is, then, and I'll not blame you. The wastes are no place for a supper run.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Me, mostly, and the Quartermaster, though he'd never admit to anything so soft. The soldiers here are the Alliance's last watch on the Dark Portal, and nobody remembers them, so I make sure they at least eat well." } },
      choices = {
        { text = "They're remembered. Their watch matters to all of us.", next = "BACK", reply = "They are, and it's good to hear someone say it. I set out an empty bowl at the end of the table every year on the night we lost them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A soldier's duty doesn't need remembering to be done.", next = "BACK", reply = "Doesn't need it, maybe, but it deserves it. I'll keep remembering them, whatever you say.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nothing, if they can help it, and they change the subject if anyone else brings it up. A few of the old ones fought there in the Second War, and they eat their supper with their backs to the window, every night." } },
      choices = {
        { text = "They need comfort. I'll sit with the old ones.", next = "BACK", reply = "Thank you, they'll be glad of it, though they won't say so. The old ones are by the fire most nights.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave them be. Old soldiers heal in their own way.", next = "BACK", reply = "They do, I suppose, and I'll not push them. But a kind word never hurt anyone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It fills you up and it doesn't taste of anything, which is fine for a march and miserable for a mess hall. The soldiers here would trade all the magic bread in Dalaran for one wheel of real cheese, and I've the ledger to prove it." } },
      choices = {
        { text = "Real food is worth the trouble, Bernie.", next = "BACK", reply = "It is, and I'll keep making it. I've seen a whole night watch stay awake on the promise of my onion soup.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Food is fuel. Taste is a luxury.", next = "BACK", reply = "Fuel, sure, but a soldier who eats well fights better. I'll keep cooking, thank you.", fx = { align = { order = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somebody on the third watch, and I'll find out who, because I've started counting the wheels at night. The Quartermaster says to let it go, but you don't let cheese go out here, not when it's come all the way from Darkshire." } },
      choices = {
        { text = "Find the thief. Rules hold, even for cheese.", next = "BACK", reply = "I will, and the third watch is going to hear about it. A wheel of cheese is a wheel of cheese.", fx = { align = { order = 1 } } },
        { text = "Let it go. A little cheese keeps the watch happy.", next = "BACK", reply = "Happy, maybe, but a missing wheel's a missing wheel. I'll keep counting.", fx = { align = { order = -1 } } },
        { text = "Something else, Bernie.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every new recruit tries, and gives up the moment the seeds come up black and twisted. One lad ate one of the blackened turnips on a dare, and the healers said he'd live, though he never talked about it again." } },
      choices = {
        { text = "Then plant again, carefully. The land has to be coaxed back.", next = "BACK", reply = "That's what I keep telling them, and some listen. Carefully, aye, and slowly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn whatever comes up black. Nothing from this ground is safe.", next = "BACK", reply = "They do, mostly, and I'll not argue. But I keep hoping one'll come up green.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not much, and I can't blame them, because each of them has stood a watch facing the Dark Portal and wondered what might come through it. Sit with your back to the wall and eat what you're given without any fuss, and by the third meal they'll stop staring, mostly." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not much, and I can't blame them, because each of them has stood a watch facing the Dark Portal. Now they're looking at the thing you've brought into my mess hall, and the spoons have all stopped moving, so dismiss it, sit with your back to the wall and eat what you're given." },
      },
      choices = {
        { text = "I'll keep my head down and earn their trust.", next = "BACK", reply = "That's the way of it, and they'll come round, given time. Keep your head down and that companion of yours quieter.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them stare. I don't need their trust.", next = "BACK", reply = "Then you'll be lonely here, and it's a lonely place already. Think on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_ragnar = {
      lines = {
        { id = "dd_ragnar_1",
          text = "Every night! She'll sip it and tell me it tastes like a goblin's boot, and then she'll drink three more and tell me the same thing again. It's the closest thing to home she's got out here, I think, complaining about somebody else's ale." },
        { id = "dd_ragnar_2",
          text = "Last night, though, she just drank it and told me about her cousin Ragnar's barley. I don't know what you said to her family, but whatever it was, I'm grateful." },
      },
      choices = {
        { text = "Everyone needs to hear from home sometimes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I just carried a letter. Don't make it a story.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Bernie.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ragnar", when = { questDone = TODO_QUEST("Ragnar Thunderbrew") },
          text = "Enohar's been in a better mood since you carried her letter home to her kin in Kharanos, and she even let me pour her a mug without arguing about the brew. That's a first, and I'm marking the day." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Smoke on your coat, in my kitchen! Keep the little red thing off the counter, friend, because the last one that got in here ate a wheel of cheese and blamed the dwarves, and the dwarves have not forgotten." },
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
        { text = "Enohar usually argues about your ale?", next = "dd_ragnar", when = { questDone = TODO_QUEST("Ragnar Thunderbrew") } },
        { text = "What's good today?", next = "food" },
        { text = "You must hear all the keep's gossip.", next = "gossip" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Is conjured bread really that bad, Bernie?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Somebody's been stealing your cheese, by the sound of it.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do Nethergarde's soldiers say about the Portal, Bernie?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who keeps this garrison in good spirits, Bernie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the soldiers say about the Dreadmaul, Bernie?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's the strangest thing the soldiers have tried to eat here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Nobody could grow food in this soil.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the soldiers here trust someone who smells like the Portal, Bernie?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers here talk about a dwarf shaman, Bernie?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not hungry, thanks.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "The bread, if you want my word for it, because I bake it myself, and the water, because it came from Stormwind and not from anywhere around here. Don't drink from anything in the Blasted Lands, whatever it looks like." } },
      choices = {
        { text = "The water here tastes wrong.", next = "food_water" },
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
    dark_portal = { { id = "tp_dark_portal", text = "The soldiers don't talk about the Portal at supper, and I don't ask. A man eats better if he isn't thinking about demons, and he sleeps better if he's eaten." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I know bread, and I know who's been complaining." } },
  },
}

P:NPC {
  key = "strumner", id = TODO_NPC("Strumner Flintheel"), name = "Strumner Flintheel",
  bible = "bibles/blastedlands.md", role = "blacksmith", tier = "service",
  communities = { "nethergarde" }, temper = { "gruff" }, values = { "practical" },
  notices = { "kit", "lock_armor" },

  impression = {
    first = "He reckons himself the only honest repair for leagues.",
    third = "{name} met Strumner Flintheel, the armorer at Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Armor, mended or sold. Either way it costs patience, mine an' yers." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and dented again, by the sound of ye." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ogre club, by the shape o' that dent, and a big one. Set it on the bench before it falls off ye." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's demon hide ye've wrapped yerself in, an' I can see it shimmerin' under the plate, the same as the hide on the things that came through that Portal. I'll mend the steel, but I'll no' touch the other." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Our fathers took their strength from the forge an' the stone, no' from bargainin' wi' spirits like the orcs we fought in the Second War. But yer coin's good, an' I've armored stranger." } },
      choices = {
        { text = "The forge and the stone have spirits too, Strumner.", next = "BACK", reply = "Mebbe they do, an' my grandfather would've said so too. I'll no' argue the point, no' today.", fx = { align = { order = -1 } } },
        { text = "I keep Ironforge's ways. The spirits only lend a hand.", next = "BACK", reply = "Ironforge's ways first, aye, an' I'll respect that. The spirits can lend all they like.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It grinds, is what it does, every link against the next till the rings wear thin as paper. Oil it every night, or ye'll be stood in front o' a basilisk wi' nothin' between ye an' it but good intentions." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It grinds every link thin, so oil it every night, an' brush the grit out o' {pet}'s coat while ye're at it, because I've seen beasts here rubbed raw under the collar." },
      },
      choices = {
        { text = "I'll oil it nightly. Good gear is discipline.", next = "BACK", reply = "Good, an' the mail will thank ye. A link oiled is a link that lasts.", fx = { align = { order = 1 } } },
        { text = "I move fast. The mail can wear thin.", next = "BACK", reply = "Fast, aye, until a link snaps an' a blade finds the gap. Oil it anyway, for my peace o' mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some days. When the wind comes off the Portal at night they sleep badly an' dream worse, an' I can mend a dent but I cannae mend that. Ye can try, if ye've the stomach for it." } },
      choices = {
        { text = "I'll try. That's the work the Light gave me.", next = "BACK", reply = "That's the work, aye, an' it's harder than mine. Thank ye for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mend their armour first. Courage follows good steel.", next = "BACK", reply = "I do, an' I will, but steel doesnae mend a nightmare. Ye'll still need yer prayers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Dry it out an' crack it, for the dust gets intae every seam an' the cold nights finish the job. Oil it every night, an' if ye don't, come tae me, an' I'll take yer coin an' say nothin'." } },
      choices = {
        { text = "I'll oil it nightly. Good gear deserves care.", next = "BACK", reply = "Good, an' I'll no' see ye at my anvil for a while. That's a compliment, mind.", fx = { align = { order = 1 } } },
        { text = "Gear's for wearing out. I'll just buy new.", next = "BACK", reply = "New, aye, an' the dust will eat that too. Oil's cheaper than leather, friend.", fx = { align = { order = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For the brackets on their crystals, aye, an' the cages on their braziers, an' once for a mirror that started talkin' back. I didnae ask what was in it, an' they didnae tell me, an' I charged double." } },
      choices = {
        { text = "Wise not to ask. Some things aren't your business.", next = "BACK", reply = "Aye, I didnae, an' I sleep fine. The Watchers know their business.", fx = { align = { order = 1 } } },
        { text = "I'd have asked. A smith should know what he's caging.", next = "BACK", reply = "Mebbe I should've, an' mebbe I'd sleep worse. Some things a smith's better off no' knowin'.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than ye'd think, because yer kind fights in the shape of beasts and comes back with leather torn in places no tailor would expect. The leather's no problem; it's the moss growin' in the seams I can't abide." } },
      choices = {
        { text = "Leave the moss, Strumner. It means the armour's still alive.", next = "BACK", reply = "Alive? Ha! I'll leave it, then, an' tell the next soldier it's a feature.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Scrape it out. A druid's armour should be as tidy as anyone's.", next = "BACK", reply = "Tidy, aye, an' I'll scrape it, though it'll grow back by the next fight. Druid armor's a whole trade unto itself.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Aye, if the coin's good an' the armor's no' smokin'. I've seen what comes out o' that Portal, so I'll no' pretend I like yer trade, but a smith who turned away every customer he disliked would starve in a week out here." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Aye, if the coin's good an' the armor's no' smokin'. But that beastie o' yers is leanin' on my anvil an' the iron's warmin' under it, so walk it back tae the door, because I've seen what comes out o' that Portal an' I'll no' have one in my forge." },
      },
      choices = {
        { text = "Fair dealing's all I ask, Strumner.", next = "BACK", reply = "Fair dealing's what ye'll get, an' no more nor less. Keep the smoke away from my forge.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep your opinions and just do the work, dwarf.", next = "BACK", reply = "Opinions are free, dwarf or no', an' I'll keep mine. But I'll do the work, an' do it well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_ogres = {
      lines = {
        { id = "dd_ogres_1",
          text = "An ogre doesnae swing, it drops, so the dent's wide an' shallow an' always from above. A Dark Iron leaves a neat wee hole, an' a demon leaves scorch marks, an' I've seen all three on the same breastplate." },
        { id = "dd_ogres_2",
          text = "Yers is ogre, mostly, an' plenty o' it. Keep yer shield up higher, an' ye'll keep yer head under it." },
      },
      choices = {
        { text = "Good advice. I'll keep my shield high.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather hit first than block, Strumner.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ogres", when = { killed = { name = "Dreadmaul", min = 40 } },
          text = "Ye've been bashin' Dreadmaul skulls by the dozen, if the dents in yer kit are anythin' tae go by. Leave it here an' I'll beat the ogre out o' it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I mend armor, no' souls, so if it's that wee horror o' yers that needs fixin', ye've come tae the wrong dwarf." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "Hunter, is it? Mail, then, or leather wi' studs, an' either way ye'll want it seen tae before the dust gets in the links." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, at my forge? Cloth doesnae need an anvil, friend, though I'll mend yer gloves if ye ask nicely." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Leather, is it? I'm an armorer, no' a tanner, but I'll stitch yer jerkin if ye don't mind it comin' back stiff." },
        { id = "h_default", key = true,
          text = "Strumner Flintheel, armorer. There's no other forge between here and Darkshire that'll take yer coin, so I'll no' be hagglin'." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. Ye'll not need much from my forge, I'd wager, but the soldiers here are glad o' ye, so sit by the fire if ye like." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Ye'll not want my steel, I'd wager, but if ye've armor that needs mending after a fight as a bear, bring it here and I'll see what I can do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Never thought I'd see a dwarf wi' totems hangin' off a belt, an' I'll not pretend I like it." },
      },
      again = { { id = "h_again", text = "Anythin' else, or can I get back tae the anvil?" } },
      choices = {
        { text = "How can you tell ogre dents from any other?", next = "dd_ogres", when = { killed = { name = "Dreadmaul", min = 40 } } },
        { text = "What do the Blasted Lands do to armor?", next = "wear" },
        { text = "It must be hard to work a forge out here.", next = "work" },
        { text = "I need repairs.", next = "BUSINESS" },
        { text = "What's the clay done to my plate?", next = "k_plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "What do the Blasted Lands do to leather?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt the mages upstairs need a smith much.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd say the soldiers here need a priest more than an armorer.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does this dust do to a hunter's mail?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you mend much druid armor out here, Strumner?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you mend armor for someone you'd rather not serve, Strumner?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
