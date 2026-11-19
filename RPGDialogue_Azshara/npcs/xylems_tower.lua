-- Xylem's tower on the cliffs at Bear's Head, and the servant who sends visitors up. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "xylem", id = TODO_NPC("Archmage Xylem"), name = "Archmage Xylem",
  bible = "bibles/azshara.md", role = "scholar", tier = "major",
  prejudice = { class = "DRUID", amount = 10, why = "a human archmage who thinks the Circle squandered the Highborne's knowledge and lectures anyone who studies it" },
  communities = { "xylems_tower" }, temper = { "proud", "sharp" }, values = { "curious", "proud" },
  likesTone = "polite",
  notices = { "class", "race", "arcane" },

  impression = {
    first = "He mourns the shard more than the apprentice a drake ate.",
    third = "{name} met Archmage Xylem in his tower above the Highborne ruins of Azshara.",
  },

  greetings = {
    { id = "g_pj_druid", when = { prejudiced = true }, text = "A druid, climbing my tower, how bracing. Your Circle drove the Highborne's learning out of Kalimdor and then spent ten thousand years asleep in trees, so I shan't expect a scholarly conversation." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "My druid! I told Sanath you were the exception that proves the rule, and he asked which rule, and I couldn't remember, and that is how thoroughly you've ruined it." },
    { id = "g_op_arcane", when = { opinion = { topic = "arcane_magic", stance = "dangerous" } }, text = "I'm told you think magic should be locked away by wiser heads than ours. Wiser than mine? Name one, and I'll write to them." },
    { id = "g_default", text = "Ah, a visitor who survived Sanath's manners. Come in, and do try not to touch anything that glows." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {name}. Good; the last three visitors were disappointments." },
    { id = "g_morphaz", when = { questDone = TODO_QUEST("Destroy Morphaz") }, text = "My favourite drake-slayer! Sit, sit; the shard has been singing all week." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The ley lines are louder after dark. I shall listen to them and to you at once, so do speak up." },
    { id = "g_away", when = { away = 14 }, text = "Ah, {name}, back after {away}, which by a tower's reckoning is barely a pause between thoughts. Sit, and tell me whether the world below has done anything worth writing down." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown considerably since your last visit, and the ley lines shift when you stand there, which is more than I could ever say for my late apprentice." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Sanath tells me you talked someone round down below, which is a rare talent in a world full of people who don't care to understand anything, and I find that almost refreshing." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and one who can find a tower on a cliff with no stairs. That's a better start than most of my students ever made." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of Ravenholdt's quiet friends, unless I miss my guess. Keep your hands where I can see them, and we'll get along famously." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei! Your ancestors built every wonder on this coast, and your people let them crumble. I've never decided whether that was wisdom or waste." },
    { id = "n_skyborne", cat = "race", when = { all = { { race = "Skyborne" }, { faction = "Alliance" } } },
      text = "One of the High Order, here, in the shadow of Eldarath? Your ancestors would weep to see what's left of their libraries, and so do I, every morning." },
  },

  start = "hello",
  nodes = {
    pj_xylem = {
      lines = { { id = "pj_xylem_default", text = "To me? Nothing, which is rather the point. Your Circle had the greatest library of magic this world has ever known lying in the rubble of Zin-Azshari, and it chose to grow moss over it and lecture anyone who picked up a page." } },
      choices = {
        { text = "Is there more to it than books, Archmage?", next = "pj_xylem2" },
        { text = "Some knowledge should stay buried. The Sundering proved that.", next = "BACK", reply = "The Sundering proved that the Highborne were careless, my dear, not that books are dangerous. I'll grant you the difference is subtle for a druid.", fx = { align = { light = 1 } } },
        { text = "You're right. Knowledge belongs to whoever is bold enough to dig.", next = "BACK", reply = "At last, a visitor with some sense! Bring me your shovel and your curiosity, and leave your Circle's frowns at the bottom of the stairs.", fx = { align = { light = -1 } } },
        { text = "Then let me show you a druid who reads.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_xylem2 = {
      lines = { { id = "pj_xylem2_default", text = "A little. When I first came to this coast, a Cenarion druid followed me for a month, undoing my wards at night and leaving acorns on my desk as a kind of sermon. I burned the acorns, and I'm told that was the worst thing I could have done." } },
      choices = {
        { text = "Acorns as a sermon? I'd have burned them too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirintor = {
      lines = {
        { id = "opk_default", text = "They think I'm a renegade with a nice tower, which is half right. They'd have every Highborne rune sealed in a vault and every student who reads one sent home in disgrace. Tell me, are they right?" },
      },
      choices = {
        { text = "They're right. Some knowledge should stay buried.", next = "op_kt_right", fx = { affinity = -1, align = { order = 1 }, opinion = { kirin_tor = "trust" } } },
        { text = "The Kirin Tor are timid. Study what you like.", next = "op_kt_timid", fx = { affinity = 1, align = { order = -1 }, opinion = { kirin_tor = "contempt" } } },
        { text = "Dalaran taught me caution, Archmage. You might try some.", next = "op_kt_right", fx = { affinity = -1, trait = { stern = 1 }, opinion = { kirin_tor = "respect" } }, when = { class = "MAGE" } },
        { text = "I'm here for the work, not the politics.", next = "BACK" },
      },
    },
    op_kt_right = {
      lines = {
        { id = "opkr_default", text = "Buried knowledge doesn't stay buried; it only waits for someone less careful than me to find it. But do go on, you sound exactly like my old examiners, and I've missed them terribly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_kt_timid = {
      lines = {
        { id = "opkd_default", text = "Timid! I'll have that carved over my door, and I'll send them a drawing of it. You and I are going to get along splendidly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_st = {
      big = true,
      lines = { { id = "xcl_st_default", text = "Grim is a fine word for anywhere trolls and dragons share a cellar. The dragonkin down there guard the Atal'ai's mistakes for their mistress, and I find it fascinating that creatures with so much power choose to spend it as jailers." } },
      choices = {
        { text = "Guarding a prison is noble work, however dull.", next = "BACK", reply = "Noble, certainly, in the way a door is noble. I'd find it maddening, but then dragons have longer patience than archmages.", fx = { align = { honor = 1 } } },
        { text = "Power wasted on guard duty is power wasted. They should leave.", next = "BACK", reply = "My thoughts exactly, though I'd never say it to one of them. Dragons take criticism very poorly, and very hotly.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Why did your apprentice go there, Archmage?", next = "xcl_st2" },
      },
    },
    xcl_st2 = {
      lines = { { id = "xcl_st2_default", text = "He was with me when Morphaz caught us in the open, and he tried to prove he didn't need my help. He was a promising boy with poor instincts, and if I sound cold about it, you may put that down to the tower being very high and the company very thin." } },
      choices = {
        { text = "I'll put it down to grief, Archmage.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think it is a very useful sort of power for people who don't care to understand how it works, which is to say most people. The Highborne understood magic, and look what became of them, so perhaps ignorance has its virtues, though I shan't be trying it myself." } },
      choices = {
        { text = "Faith isn't ignorance, Archmage. You'd do well to learn that.", next = "BACK", reply = "I've learned a great deal in my years, and faith has never once explained a ward to me. But I'll grant it makes you calmer than most.", fx = { align = { light = 1 } } },
        { text = "You're right. I'd rather understand a thing than pray to it.", next = "BACK", reply = "There, you see, a sensible warrior of the Light. We'll make a scholar of you yet, {class}.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same use a scholar has for a door, my dear, and a very sturdy one at that. Morphaz is sleeping in the drowned temple with my apprentice in his belly and my shard in his hoard, and I need someone to go and knock." } },
      choices = {
        { text = "I'll go for your shard, and for the apprentice he ate.", next = "BACK", reply = "How very noble of you, and he'd have appreciated the thought, I'm sure. Do bring the shard back first, though.", fx = { align = { light = 1 } } },
        { text = "I'll go for the shard. The apprentice was your problem.", next = "BACK", reply = "He was, and frankly a disappointing one, but don't let him hear me say so. He's probably still listening, in there.", fx = { align = { light = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Drakes, sirens and whatever eats my books, mostly, and the blue dragonflight takes a dim view of my interest in drakes. A hunter could track down the beasts of this coast that swallowed my stolen fragments, and I'd be grateful, in an academic sort of way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Drakes, sirens and whatever eats my books, mostly, and the blue dragonflight takes a dim view of my interest in drakes. Do keep {pet} from chewing anything in the tower. The last beast that came up here ate a page of Highborne poetry, and I'm told it hasn't been right since." },
      },
      choices = {
        { text = "I'll track the beasts carefully and bring every fragment intact.", next = "BACK", reply = "Excellent, and gently, if you please, since half my research is already in pieces. A torn page is a lost spell.", fx = { align = { order = 1 } } },
        { text = "I'll kill anything that might have eaten a page. It saves time.", next = "BACK", reply = "Efficient, I'll grant, but the dragonflight will notice, and they'll come asking why. Do try to be subtle.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_xy = {
      big = true,
      lines = {
        { id = "wxy_default", text = "Of course they do; you people are always interested in the darker parts, it's practically your entire curriculum. I'll show you nothing that summons anything, because I don't care to have my tower eaten, but you may look at the warding glyphs, from a distance." },
      },
      choices = {
        { text = "Wards are the useful part. I'll study them.", next = "BACK", reply = "A wise choice, and the one I'd have made at your age. Wards are where all the real cleverness lives.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Wards only teach you what's behind them.", next = "BACK", reply = "Precisely why I'll show you nothing else, {class}. Some doors I prefer to leave closed, and locked, and warded.", fx = { align = { light = -1 } } },
      },
    },
    sky_xy = {
      lines = {
        { id = "sxy_default", text = "Were they, now! Then you're a living footnote to everything I study, and I'd very much like to know what your people kept and what they lost. Don't take that badly; it's the highest compliment I give." },
        { id = "sxy_mage", when = { race = "Skyborne", class = "MAGE" },
          text = "And a mage too, from the High Order, I suppose. Tell Dalaran I'm alive and busy and not taking visitors, though you, I'll grant, may come up the tower when you like." },
      },
      choices = {
        { text = "What we kept is ours, Archmage.", next = "BACK", fx = { affinity = -1 } },
        { text = "I'll share what I can.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Twist them? It overpowered them, my dear shaman, which is rather the point of Highborne magic. The power under this coast still runs hot, and the elements here behave like dogs that have been kicked once too often. I find it fascinating, and I expect you find it sad, which is precisely why one of us lives in a tower." } },
      choices = {
        { text = "Fascinating is right. I'd study it myself, given the chance.", next = "BACK", reply = "Do you, now? I'd never have guessed it of a shaman, but I'll take an apprentice where I find one.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Magic that cows the elements should be left buried.", next = "BACK", reply = "Buried is where it was, and look how well that's turned out. Better I understand it than a satyr does.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Inelegant but serviceable, rather like a hammer beside a scalpel. The Highborne studied every kind of power on this coast, shadow included, and you can see from the ruins below how well that ended for them." } },
      choices = {
        { text = "Then I'll keep my power simple, and honest.", next = "BACK", reply = "Simple is underrated, and honest even more so. You'll live longer than most of my colleagues.", fx = { align = { honor = 1 } } },
        { text = "The Highborne lacked caution. I'll take what they left.", next = "BACK", reply = "Then you'll find the ruins very generous, {class}, and very unforgiving. Take carefully.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because ignorance doesn't keep anyone safe, druid. The Highborne's work lies all along this coast whether I study it or not, and I would rather understand it than let some fool of a satyr stumble onto it first. Your Circle buries what frightens it, and I write it down, and one day you'll be glad someone did." } },
      choices = {
        { text = "Some things should stay buried. You play with old fire.", next = "BACK", reply = "Old fire warms as well as burns, druid, and I've been very careful with my matches. Mostly.", fx = { align = { order = 1 } } },
        { text = "Better a scholar holds it than a satyr. Study on.", next = "BACK", reply = "Thank you, and I'll quote you to the next druid who comes up those stairs. Better a scholar than a satyr indeed.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_st", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar" }, text = "You've been down to the bottom of the Sunken Temple, I'm told, which means you either found Morphaz or he found you. Either way you came back, which is more than my apprentice managed, poor careless boy." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in my tower! How novel, since your sort usually prefers to stay on the ground, where the Light can see you more clearly, or so I assume." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, in my tower. How refreshing, a visitor who won't touch my books, if only because you can't read the language." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You'll not be interested in my research, I suppose, unless it involves something with fur and teeth, which, now that I think of it, it often does." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my tower? How quaint. I suppose you've come to tell me the Highborne relics upset the local spirits, and I suppose I'll pretend to listen." },
        { id = "h_default", key = true,
          text = "Archmage Xylem, at your service, or rather, you at mine, if you're any use. I study what the Highborne left on this coast, which is a treasury of lore, guarded by a great many things that would rather I didn't, not least the drake Morphaz." },
        { id = "h_dust", when = { questActive = TODO_QUEST("Magic Dust") },
          text = "The elves on the northern cliffs grind their relics to a glittering dust, and they killed the apprentice I sent to buy some. We'll take it the other way, then; violence is only a less polite kind of trade." },
        { id = "h_coral", when = { questActive = TODO_QUEST("The Siren's Coral") },
          text = "The Spitelash sirens have stripped the bay of enchanted coral, and I need it more than they do. They cast rather well for fish-folk, so don't underestimate them." },
        { id = "h_morphaz", tags = { "news" }, when = { questActive = TODO_QUEST("Destroy Morphaz") },
          text = "Morphaz is waiting in the drowned temple of Atal'Hakkar, fat on my apprentice and my shard. Bring friends, {name}, because I'd hate to lose two students to the same stomach." },
        { id = "h_krellian", when = { questActive = TODO_QUEST("Warlord Krellian") },
          text = "Krellian hides in the Temple of Zin-Malor with a shell that fairly shouts with magic. My scrying never lies, though it does exaggerate sometimes, so hurry before somebody else hears it." },
        { id = "h_frag", when = { questActive = TODO_QUEST("Fragmented Magic") },
          text = "Polymorph the Spitelash with the shell close by and strike down the little copies before they fade. It sounds absurd, I know, and that's how you can tell it's real research." },
        { id = "h_bag", when = { questActive = TODO_QUEST("Encoded Fragments") },
          text = "Savages stole my books on dispelling and tore them up, and I need them to open a certain bag for Ravenholdt. Bring me the fragments; the beasts out there swallow everything, including literature." },
        { id = "h_tablet", when = { questActive = TODO_QUEST("Delivery to Archmage Xylem") },
          text = "Is that the Tablet of Sael'hai? I can feel it from here, like warmth from a hearth. Put it down gently, please, and tell me nothing about the orc who found it." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "{name}! Splendid. You're the only person in a hundred miles who listens to the end of my sentences, and I've saved several long ones for you." },
        { id = "h_cool", when = { disposition = { max = 34 } },
          text = "Oh, it's you. Say what you came to say; I'm in the middle of something that will explode if I leave it too long." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, in my tower! You've climbed farther than most, figuratively speaking, since Sanath did the climbing for you." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at my tower? I suppose you've come to scold me for studying the Highborne, as your Circle so loves to do, so let's have it over quickly." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, please; a thought is cooling on my desk." },
        { id = "h_again2", text = "Go on. I can listen and calculate at the same time, which is more than Sanath can manage." },
        { id = "h_again3", when = { disposition = { min = 70 } }, text = "Ask me anything, {name}. Within reason, and the reason is mine." },
      },
      choices = {
        { text = "Does the Highborne magic here twist the elements, Archmage?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You must study something important up here.", next = "study" },
        { text = "Who is Morphaz?", next = "morphaz" },
        { text = "You seem very interested in the naga.", next = "naga" },
        { text = "Where did you come from, Archmage?", next = "past" },
        { text = "Tell me about your apprentices.", next = "apprentices" },
        { text = "I've come to learn, Archmage.", next = "mage", when = { class = "MAGE" } },
        { text = "Lord Ravenholdt sends his regards.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do you ever pray up here, Archmage?", next = "priest", when = { class = "PRIEST" } },
        { text = "Jediga sent me with the tablet.", next = "jediga", when = { questActive = TODO_QUEST("Delivery to Archmage Xylem") } },
        { text = "The Highborne's power interests me too. The darker parts.", next = "warlock_xy", when = { class = "WARLOCK" } },
        { text = "My ancestors were Highborne of Eldre'Thalas.", next = "sky_xy", when = { race = "Skyborne" } },
        { text = "What does an archmage make of a priest's power, Xylem?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What use has an archmage for a warrior?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your research must involve some dangerous beasts, Archmage.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why study the magic that broke this land?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What does an archmage think of the Light, Xylem?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I've been through the Sunken Temple, Archmage. It was grim.", next = "xcl_st", when = { cleared = "The Temple of Atal'Hakkar" } },
        { text = "You sneer at druids, Archmage. What did the Circle do to you?", next = "pj_xylem", when = { prejudiced = true } },
        { text = "Good day, Archmage.", next = "END" },
      },
    },

    study = {
      big = true,
      lines = {
        { id = "st_default", fx = { learn = { "highborne", "eldarath" } },
          text = "The Highborne, of course. They were the finest arcanists this world has ever produced, and the worst-behaved, and they left their runes and tablets lying about Eldarath like a careless child leaves toys. Most of it's ruined, but what isn't is worth a lifetime." },
        { id = "st_nelf", when = { race = "NightElf" },
          text = "Your ancestors, my dear kaldorei, and don't look so sour about it. Their pride sank a continent, I know, but their notes are magnificent." },
      },
      choices = {
        { text = "Their magic broke the world.", next = "study_danger" },
        { text = "What have you found?", next = "study_found" },
        { text = "What do you really want with Highborne tablets?", tag = "Persuade", next = "tablet_why",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "MAGE" }, { questDone = TODO_QUEST("Destroy Morphaz") }, { all = { { race = "Skyborne" }, { faction = "Alliance" } } } } } },
          fail = { next = "tablet_fail", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    study_danger = {
      lines = { { id = "sd_default", text = "Their appetite broke the world, which is a different thing entirely. A knife cuts bread or throats, and nobody blames the knife; I simply intend to be a better cook than they were." } },
      choices = {
        { text = "What do the Kirin Tor think of your work here?", next = "op_kirintor" },
        { text = "Knowledge is worth the risk.", next = "BACK", reply = "It is, and I've staked my life on it, as you can see from the view. Welcome to the club, {class}.", fx = { affinity = 1, align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Some doors should stay shut, Archmage.", next = "BACK", reply = "And who would decide which, my dear? Not the Circle, I hope, and certainly not you.", fx = { affinity = -1, align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },
    study_found = {
      lines = { { id = "sf_default", text = "Runes on the old walls that explain how the Highborne kept their towers standing, a ward I still can't break, and four tablets named for their wizards that an enterprising orc keeps selling to everyone in Kalimdor. I bought one, naturally." } },
      choices = {
        { text = "The orc is Jediga, at Valormok.", next = "BACK", fx = { trait = { curious = 1 } }, when = { heardLine = "jediga.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tablet_why = {
      big = true,
      lines = {
        { id = "tw_default", text = "Very well, since you ask nicely. The Highborne wrote down how they bound the arcane into objects, and most of it is madness, but a little of it is sense. Enough sense, with the right shard, to forge magic the way a smith forges steel, and I mean to be that smith." },
      },
      choices = {
        { text = "That's an extraordinary ambition.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Then be careful what you forge.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    tablet_fail = {
      lines = { { id = "tf_default", text = "I want to read it, which is what one does with writing. If you were hoping for a confession, try the priests in Stormwind; they're better at that sort of thing." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    morphaz = {
      lines = {
        { id = "mo_default", fx = { learn = { "morphaz" } },
          text = "A green drake, and my oldest enemy. Years ago he caught us in the open, me and my best apprentice, and swallowed the boy whole, along with the finest arcane shard I've ever held." },
        { id = "mo_done", when = { questDone = TODO_QUEST("Destroy Morphaz") },
          text = "Was my oldest enemy, I should say, thanks to you. The shard grew fat on him over the years, and now my hands remember how to forge the arcane." },
      },
      choices = {
        { text = "You mourn the shard more than the apprentice.", next = "morphaz_cold" },
        { text = "The drake must be somewhere.", next = "morphaz_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morphaz_cold = {
      lines = { { id = "mc_default", text = "I mourn them both; I simply talk about the shard, because the shard can be recovered and the boy can't. He was the best student I ever had, and the most irritating, and I still set out two cups some mornings out of habit." } },
      choices = {
        { text = "I'm sorry, Archmage.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then avenge him, not the shard.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    morphaz_where = {
      lines = { { id = "mw_default", text = "Down in Atal'Hakkar, the trolls' drowned temple in the Swamp of Sorrows, where they tried to raise their own god. He's in good company down there, and none of it's friendly." } },
      choices = {
        { text = "I'll find him.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    naga = {
      lines = {
        { id = "na_default", fx = { learn = { "spitelash" } },
          text = "The Spitelash have learned which of this coast's treasures are rare, which is inconvenient of them. They've stripped the bay of enchanted coral, and their warlord Krellian sits in the Temple of Zin-Malor on top of things I'd very much like to have." },
      },
      choices = {
        { text = "The naga don't look like any beast I know.", next = "naga_what" },
        { text = "Why not take it yourself?", next = "naga_tower" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_what = {
      lines = { { id = "nw_default", text = "Elves, once, if the old stories are right, and the sea made them into what you see. I'd love to study one, but they object so strenuously to being studied." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    naga_tower = {
      lines = { { id = "nt_default", text = "Because my work can't be left, and because young people with swords are plentiful while archmages are not. I pay well, I keep my bargains to the letter, and I never send anyone where I wouldn't go myself, given forty years less and a stronger back." } },
      choices = {
        { text = "That's honest, at least.", next = "BACK", fx = { affinity = 1 } },
        { text = "You'd rather risk my neck than yours.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    past = {
      lines = {
        { id = "pa_default", text = "Dalaran trained me, and the war took me west with the expedition to Kalimdor. I was in the Stonetalon Mountains when Hellscream's Warsong came down on our camp, and after that I decided I preferred my own company and a tower nobody could climb." },
      },
      choices = {
        { text = "So you fought the Warsong.", next = "past_war" },
        { text = "Why Azshara, of all places?", next = "past_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_war = {
      lines = { { id = "pw_default", text = "I survived the Warsong, which is not the same as fighting them. They came out of the trees like a forest fire, and I learned that day that a spellbook is a poor shield and a long way off is a fine one." } },
      choices = {
        { text = "The Horde has changed since then.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_why = {
      lines = { { id = "py_default", text = "Because the Highborne lived here, and nobody else wants it. Ten thousand years of magic lying in the grass, and the only competition is naga, elves who should know better, and a blue dragon who thinks he owns the place." } },
      choices = {
        { text = "A blue dragon?", next = "past_dragon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_dragon = {
      lines = { { id = "pdr_default", text = "Azuregos, he calls himself, and he roams the cliffs south of Eldarath guarding something he won't name. Every adventurer in Kalimdor tries to stick a sword in him, which hasn't improved his temper, and we are not on speaking terms." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    apprentices = {
      lines = {
        { id = "ap_default", text = "I have had a great many, and lost rather too many. Sanath below keeps the door and sends you up, and the others come and go, mostly go, sometimes in pieces." },
      },
      choices = {
        { text = "Sanath doesn't like visitors.", next = "apprentices_sanath" },
        { text = "Could I study with you?", next = "apprentices_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentices_sanath = {
      lines = { { id = "as_default", text = "Sanath doesn't like anything, which makes him an excellent doorkeeper. He used to charge visitors a fee to come up, until I told him to stop; he still sulks about it, and I find it restful." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    apprentices_me = {
      lines = {
        { id = "am_default", text = "Bring me what I ask for, bring it back in one piece, and we'll see. I take anyone with talent and patience, and I keep the ones who survive." },
        { id = "am_mage", when = { class = "MAGE" }, text = "You're halfway there already, simply by being a mage who came all this way. Do the errands, and I'll teach you a trick or two that Dalaran never would." },
      },
      choices = {
        { text = "I'll prove myself.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mage = {
      big = true,
      lines = { { id = "ma_default", text = "Then you've come to the right cliff. Prove your skill against the elves' dust and the sirens' coral, and then against something worthy of it, and I'll give you something no library in Stormwind has." } },
      choices = {
        { text = "Power is what I came for.", next = "BACK", reply = "Honest, at least, and power is what most of them come for, though few admit it. Prove yourself and you'll have it.", fx = { affinity = 1, align = { light = -1 }, trait = { proud = 1 } } },
        { text = "I came for understanding, not power.", next = "BACK", reply = "Understanding, {g:he|she} says, as if the two were different things. Come back when you've learned they're not.", fx = { affinity = 1, align = { light = 1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Does he? How unlike him. Jorach Ravenholdt and I have an understanding: he finds the things nobody can find, and I open the things nobody can open, and neither of us asks the other what's inside." } },
      choices = {
        { text = "A good arrangement.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "I calculate up here, which is like praying, except that the answers come back. No offence meant, {class}; I'm sure the Light does wonderful work for those who have the patience to wait for it." } },
      choices = {
        { text = "The Light answers. You just don't listen.", next = "BACK", reply = "Perhaps I don't, and I'm too old to start now. But I'm glad it answers someone.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "I've wondered the same, some nights.", next = "BACK", reply = "Have you, now? Then there's hope for you yet, {class}. Doubt is where all good scholarship begins.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jediga = {
      lines = { { id = "jd_default", text = "I've been waiting to study this for a very long time. Tell Jediga she's done well and that I'll pay what she asked; she seems to expect me to cheat her, which I find rather hurtful." } },
      choices = {
        { text = "She says you can't be trusted.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, at last, a visitor with a sense of proportion! I have been saying as much to Sanath for years, and he only grunts, so do sit down and tell me more." },
        { id = "s2", text = "You're entirely right, of course, and it is such a relief to hear it from someone who climbed all this way to say so. I shall think of you fondly the next time Dalaran forgets to write." },
        { id = "s3", when = { class = "MAGE" }, text = "Praise from a fellow mage is worth ten from the laity, because you know precisely how difficult it is to be me. You may consider yourself my favourite colleague on this coast, which I admit is a short list." },
      },
      fail = {
        { id = "f1", text = "My dear, half of Dalaran flattered me whenever it wanted my vote, and it was considerably better at it. Do tell me what you're after, and spare us both the preamble." },
        { id = "f2", text = "How charming, and how transparent. I keep a tower full of things people want, so you'll forgive me if I count the relics before I blush." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Oh, very good! Nobody has been rude to me in this tower since my apprentice was eaten, and I've rather missed the exercise. Do go on, because I'm sharpening a reply." },
        { id = "s2", text = "You've a wicked tongue, and I approve of it, because a mind that can't sting usually can't think either. I shall have to be on my best form with you." },
      },
      fail = {
        { id = "f1", text = "I've been insulted in four languages by people who could read all of them. Yours was a very ordinary effort, and I'm afraid I can't give it marks." },
        { id = "f2", text = "I see. Well, the way out is behind you, and Sanath will be delighted to explain how the cliff works if you can't manage the stairs I haven't got." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Now, now, there's no call for that sort of thing among civilised people. I'm an archmage, not a duellist, and I should much prefer to keep all my shelves upright, so let us say you've made your point." },
        { id = "s2", text = "Goodness. You're rather more alarming than you looked on the way in, and I'm standing next to several things that explode. Very well, you have my full and careful attention." },
      },
      fail = {
        { id = "f1", text = "You are threatening a man who lives on top of a ley line, in a room full of Highborne wards he wrote the notes on. I'd advise against it, purely as a matter of scholarship." },
        { id = "f2", text = "My dear, a green drake ate my apprentice, and I was back at my desk the same afternoon. You'll find I'm not easily put off my work." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "That is research in progress, and I don't discuss my research with people I've barely met. Come back when I've some reason to think you'd understand it." },
      { id = "gt2", text = "No, I think not. The contents of this tower are for my friends and my betters, and so far you're neither." },
    },
    knows = {
      { id = "tp_knows", text = "I know a great deal about nearly everything, and everything about a few things. Choose carefully, or we'll be here until supper." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, {name}, I'll even explain the hard parts. Pick a subject." },
    },
    background = { { id = "tp_bg", text = "Dalaran's son, the war's leftover, and Azshara's only resident archmage. I like it that way.", next = "past" } },
    advice = { { id = "tp_ad", text = "Never read a Highborne rune aloud until you know what it says. I lost a perfectly good set of eyebrows learning that." } },
    highborne = { { id = "tp_hb", text = "Geniuses and fools in equal measure, which is the usual proportion for geniuses.", next = "study" } },
    eldarath = { { id = "tp_eld", text = "The richest ruin in Kalimdor, and the naga know it. I'd move in tomorrow if they'd move out." } },
    morphaz = { { id = "tp_morph", text = "A green drake with my apprentice and my shard in his belly. You can guess my opinion of him.", next = "morphaz" } },
    spitelash = { { id = "tp_spite", text = "Naga with taste, which is the worst kind. They've learned what's valuable on this coast.", next = "naga" } },
    xylem = { { id = "tp_self", text = "Ah, the subject I know best. I'm brilliant, impatient and right more often than is fair; ask anyone." } },
    rimtori = { { id = "tp_rimtori", text = "Thalassian scavengers with good instincts and bad manners. They killed my apprentice over a sack of dust." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was always too full of committees for my taste, and the Legion made it rather more empty. I prefer my tower, where the committee is one man and he always agrees with himself." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor would very much like to know what I keep in this tower, and I would very much like them not to. We have an understanding, which is that neither of us mentions it." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "Queen Azshara commanded the greatest sorcery the world has ever known, and the night elves would rather I didn't study it. I study it anyway, very carefully." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion is a regrettable consequence of excellent research. I do not intend to repeat the consequence, only the research." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon in Dustwallow, I hear, and Deathwing's own daughter. I would not study her, because some subjects study you back." } },
    _none = { { id = "tp_none", text = "Not my field, and I don't waste time outside my field. Try someone with less to do." } },
  },
}

P:NPC {
  key = "sanath", id = TODO_NPC("Sanath Lim-yo"), name = "Sanath Lim-yo",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "xylems_tower" }, temper = { "proud", "sharp" }, values = { "proud", "dutiful" },
  notices = { "race", "class", "kit", "lock_taint" },

  impression = {
    first = "He insulted my clothes, face and reasons, then got bored of it.",
    third = "{name} met Sanath Lim-yo, who sends visitors up to Archmage Xylem's tower and despises each of them.",
  },

  greetings = {
    { id = "g_op_kirintor", when = { gossip = { topic = "kirin_tor", stance = "contempt" } }, text = "The Archmage says you called the Kirin Tor timid. He's been insufferable all week, so I hope you're pleased with yourself." },
    { id = "g_default", text = "Another pilgrim at my master's door, and how dreary you all are." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and wearing the same dreadful clothes, which is almost impressive." },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, of a sort. I'd say we were cousins, but I have standards about family." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, here to grovel for lessons. My master will love you; he adores an audience." },
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "You've come to see the Archmage dressed like that? That's bold, in the way that falling off a cliff is bold." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "You've a faint green glow about the face, which is vulgar, and you're tracking it all over my master's floor. He'll find it fascinating, of course, so I'll be the one who has to scrub." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because they interfere with his experiments, or so he claims, and I never second-guess what he commands. If you must pray, do it quietly, and do it outside, because the last paladin who prayed in the tower set off three wards, and I had to clean the scorch marks." } },
      choices = {
        { text = "I'll keep my prayers to myself, then. It's his tower.", next = "BACK", reply = "Very sensible of you, and you'll find my master far more pleasant for it. Well, less unpleasant.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pray where I like. The Light doesn't ask permission.", next = "BACK", reply = "The Light may not, but my master certainly does. Pray outside, or I'll be the one asking you to leave.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "My master needs a great many things, and most of them are hit with swords, apparently, and that's what keeps you lot trudging up here. I'd tell you to be polite to him, but warriors never are, so just try not to break the furniture." } },
      choices = {
        { text = "I'll be polite to the Archmage, which is more than you are.", next = "BACK", reply = "Ha! You'll find that I don't need to be, since I'm the one who sends you up. Be polite to him, or don't come back down.", fx = { align = { order = 1 } } },
        { text = "I'll be whatever I like to the Archmage. Just send me up.", next = "BACK", reply = "Very well, but don't blame me when you come down as a newt. He has a short temper with your sort.", fx = { align = { order = -1 } } },
        { text = "Something else, Sanath.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "My master would let a kodo into the tower if it brought him a relic, but I would not, and I am the one who sends you up. Your beast stays down here with me, and if it sheds on the stones, I'll know whom to blame." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "My master would let a kodo into the tower if it brought him a relic, but I would not, and I am the one who sends you up. I suppose {pet} is better company than most of my master's visitors, if only because it doesn't talk." },
      },
      choices = {
        { text = "Fine. My beast will wait here, as you ask.", next = "BACK", reply = "Thank you, and I'll keep an eye on it, though I'd rather not. Tell it not to shed.", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go, servant.", next = "BACK", reply = "Not up my master's stairs, it doesn't. Wait down here, then, both of you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Rocks, wind and a very long drop, which I look at every day and care for less each time. The Highborne built all along this coast, and my master says their magic still hums in the stone, though to me it only hums. If your spirits are listening, ask them to carry me somewhere warm." } },
      choices = {
        { text = "Your master won't notice if you slip off south.", next = "BACK", reply = "Don't tempt me, {class}, I've thought of it every day for years. My master would notice, eventually, and very loudly.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Serve your master well. There's honour even in waiting.", next = "BACK", reply = "Honour, waiting, yes, I've heard all about it. I'll let you know when I find any.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Several, and my master turned them into something unpleasant and left them for the drakes. I find it tedious to clean up afterwards, so I'd thank you not to add to my work." } },
      choices = {
        { text = "I'm not here to steal. Your master's safe.", next = "BACK", reply = "Good, and I'll take you at your word, since the drakes are full this week. Off you go.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every ward has a weakness, servant.", next = "BACK", reply = "They do, and my master knows every one of them better than you. Please, spare me the cleaning.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my hands to myself.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "My master studies everything, and nothing he finds is quite as interesting as himself. The Highborne dabbled in the demonic, of course, so there are tablets he keeps locked away, and he never lets me read them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "My master studies everything, and nothing he finds is quite as interesting as himself, though your demon might come close, the way he would stare at it. The Highborne dabbled in the demonic, so there are tablets he keeps locked away, and I'd rather you not bring that thing near his door." },
      },
      choices = {
        { text = "Some knowledge should stay locked away.", next = "BACK", reply = "Wise, and my master would agree, though he'd never say so. He's not always as reckless as he looks.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd like to read those tablets myself.", next = "BACK", reply = "Then you'll have to get past my master, and then past me, and I'm much less pleasant. I'd not try it.", fx = { align = { light = -1 } } },
        { text = "Your master sounds tiresome.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "My master has use for power, and he finds it in his books and in the old Highborne ruins, not in sermons. I'm told the Highborne also thought prayer beneath them, and look how that ended, though you will not repeat that to him." } },
      choices = {
        { text = "Magic without humility ends in ruin. The Highborne prove it.", next = "BACK", reply = "They do prove it, and I've said as much to him, carefully. He doesn't listen, of course.", fx = { align = { light = 1 } } },
        { text = "Power is power. The Highborne just lost control of theirs.", next = "BACK", reply = "That's my master's view too, and he's very sure of it. I hope you're both right.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "My master hates everyone who isn't him, and priests only slightly more, because you insist on being humble. I find humility rather tedious myself, but I suspect it's the only reason your sort survive a visit to the tower." } },
      choices = {
        { text = "Humility costs nothing, Sanath. Try it sometime.", next = "BACK", reply = "I'll consider it, priest, after I've finished being proud. It's taking a while.", fx = { align = { honor = 1 } } },
        { text = "I'm not humble. I'm patient, and I'm watching.", next = "BACK", reply = "Watching? Well, so am I, and I'm much better at it, having nothing else to do up here. We'll see who blinks first.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Quiet, mostly, and lonely, with nothing but the wind and the Highborne stones for company. My master's work is dangerous, and I do not always agree with what he digs up, but I gave my word to serve him, and a servant who breaks his word is no better than a thief." } },
      choices = {
        { text = "Your word holds you. Keep it, even if he's wrong.", next = "BACK", reply = "I will, and it's good to hear someone say it. I gave it before the tower had a roof, and I'll not break it now that it has one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If his work endangers the land, walk away. No oath is worth that.", next = "BACK", reply = "It's not so simple, druid, but I'll think on it. Perhaps one day I'll walk.", fx = { align = { honor = -1 } } },
        { text = "Something else, Sanath.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_morphaz", when = { questDone = TODO_QUEST("Destroy Morphaz") },
          text = "So you're the one who killed the drake that ate the Archmage's apprentice. He's been insufferably cheerful since, and I'm the one who has to stand at the bottom of the tower and listen to it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, clanking and shining and dreadfully earnest. I'm obliged to send you up to the Archmage, but do try not to bless anything in the tower, because he hates it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, smelling of sweat and old leather, how charming. My master doesn't need muscle, but I'm obliged to send you up, so do try not to dent anything." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, with a beast, in my master's courtyard. Keep that thing off the stones; they were laid by the Highborne, and they don't wash." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, smelling of smoke and earth, as your sort always do. My master won't care what you are, so I suppose neither will I." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, of course, skulking about in those dreadful leathers. If you think to rob my master's tower, you'll find the wards are less forgiving than I am, and I am not forgiving at all." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, and dressed like one, all skulls and spikes. My master tolerates many things, but your little demons scratch the floors, so do keep them leashed." },
        { id = "h_default", key = true,
          text = "Sanath Lim-yo, servant of Archmage Xylem. My master's tower stands above us, and there are no stairs, so you will need me to send you up, which I am obliged to do for anyone at all now, more's the pity." },
        { id = "h_magecraft", when = { questActive = TODO_QUEST("Magecraft") },
          text = "Ah, the Archmage asked for someone with your experience, did he? He's expecting you, though I can't imagine why." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, how dreary. I suppose you've come to pray at my master's tower, as if the arcane needed any help from the Light, and as if I needed one more visitor in robes." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Your robes are dreadful and your posture is worse, but I'm obliged to send you up, so do try not to pray at my master; he hates it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and you don't even need me to send you up the tower, I'd wager, since you could simply fly. My master would find that very irritating." },
      },
      again = {
        { id = "h_again", text = "Still here? What else, then?" },
        { id = "h_again2", text = "Go on. Bore me a little more; I'm almost asleep." },
      },
      choices = {
        { text = "Do these cliffs hold anything the spirits care for?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Send me up to your master.", next = "up" },
        { text = "So you used to charge for this.", next = "toll" },
        { text = "What is your master like?", next = "master" },
        { text = "You don't sound like you're from around here, Sanath.", next = "home" },
        { text = "You're a long way from Quel'Thalas.", next = "home", when = { race = "Skyborne" } },
        { text = "Someone must have tried to rob Xylem's tower.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does Xylem study demonology too?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does your master have no use for the Light at all?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does your master hate all priests, Sanath?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your master seems to need a warrior's help, Sanath.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Will your master let my beast into the tower?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What's it like, serving the archmage?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why does the Archmage hate blessings, Sanath?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll leave you to your sulking.", next = "END" },
      },
    },
    up = {
      lines = { { id = "u_default", text = "Very well, since I must. Try not to scream on the way; the last one did, and the Archmage made me clean the floor." } },
      choices = {
        { text = "Do it, then.", next = "BUSINESS" },
        { text = "On second thought, something else.", next = "BACK" },
      },
    },
    toll = {
      lines = { { id = "t_default", text = "Once, I could ask whatever I liked of the people who wanted to see him. Now my master takes in any stray who asks, and I am reduced to sneering at their boots for entertainment." } },
      choices = {
        { text = "You must have asked a fine price, once.", next = "toll_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    toll_price = {
      lines = { { id = "tp2_default", text = "Hippogryph feathers, undamaged ones, which is harder than it sounds when the birds object. I counted them every night, and now I count the days since anyone paid me, which is a much sadder number." } },
      choices = {
        { text = "That's petty, Sanath.", next = "BACK", reply = "It is, and I'll own it proudly. Pettiness is all a servant has left.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "A toll's a toll. You were cheated.", next = "BACK", reply = "I was, and thank you for saying so. Nobody else up here ever does.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    master = {
      lines = { { id = "m_default", fx = { learn = { "xylem" } },
        text = "Brilliant, impatient and entirely beyond your understanding. I never second-guess what he commands, and I advise you not to either, especially to his face." } },
      choices = {
        { text = "You're very loyal to him.", next = "master_loyal" },
        { text = "Is he dangerous?", next = "master_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_loyal = {
      lines = { { id = "ml_default", text = "I'm useful to him, and he's the only person on this coast worth being useful to. That is loyalty enough for an elf with any sense." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master_danger = {
      lines = { { id = "md_default", text = "To the naga, to the drake that ate his student, and to anyone who touches his books. To you, only if you're very stupid, so I'd say your odds are poor." } },
      choices = {
        { text = "Charming as ever.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Quel'Thalas, before the dead walked through it. I don't speak of it to strangers, and everyone is a stranger." } },
      choices = {
        { text = "I'm sorry for what happened there.", next = "home_sorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_sorry = {
      lines = { { id = "hs_default", text = "Your sorrow is noted and of no use to me. Still, it's the first polite thing anyone's said at this tower in a month, so I'll insult your hat a little less." } },
      choices = { { text = "That's something.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Archmage. Before that, I was somewhere better. Neither is your concern.", next = "home" } },
    advice = { { id = "tp_ad", text = "Dress better before you meet the Archmage. He notices, and then I have to hear about it." } },
    xylem = { { id = "tp_xylem", text = "My master. Go up and see for yourself, and stop asking me about him.", next = "master" } },
    rimtori = { { id = "tp_rimtori", text = "Thalassians who've forgotten their manners along with their homes. I am not one of them, before you ask." } },
    dalaran = { { id = "tp_dalaran", text = "My master looks down on Dalaran, which is the only thing he and I agree on. Every mage I ever met from there dressed even worse than you." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are a gaggle of old men in purple robes, and my master is one old man in purple robes. I fail to see the improvement." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "The queen of this land drowned a whole city, and I've still not been allowed to see the sea from this tower. Some people have all the luck." } },
    _none = { { id = "tp_none", text = "How tedious. I neither know nor care." } },
  },
}
