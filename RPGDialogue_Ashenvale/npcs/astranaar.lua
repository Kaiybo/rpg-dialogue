-- Astranaar and Maestra's Post (Alliance). Voice: bibles/ashenvale.md
-- Classic quests only: Trek to Ashenvale (Sentinel Selarin) is the road in, not the later
-- Onward to Ashenvale; Faldreas sends travellers to Stonetalon Peak, not to the Edunes.
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raene", id = TODO_NPC("Raene Wolfrunner"), name = "Raene Wolfrunner",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "major",
  communities = { "astranaar" }, temper = { "fierce" }, values = { "protective", "loyal" },
  likesTone = "blunt",
  notices = { "pet", "form", "class", "lock_shadow", "lock_shards" },
  impression = {
    first = "Her grief for Teronis sits close under all that fierceness.",
    third = "{name} met Raene Wolfrunner, who commands the scouts of Astranaar and fights for every tree in Ashenvale.",
  },

  greetings = {
    { id = "g_forest", text = "Ashenvale needs you, and that's no flattery. The forest needs every blade it can get, and every pair of eyes." },
    { id = "g_back", when = { metBefore = true }, text = "Home from the trees! Tell me what you saw out there, every bit of it." },
    { id = "g_scout", when = { origin = "nightelf_sentinel_scout" }, text = "I know you! You ran the border paths out past Silverwind before you went off to see the world, and you always came back with your report before the moon was up. Ashenvale has missed scouts like you, so tell me you've come home." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I counted the days, because in Ashenvale too many people simply stop coming back. Sit, and tell me what the rest of the world has been doing while our forest burns." },
    { id = "g_away_long", when = { away = 60 }, text = "{name}! After {away} away I had half decided the forest had taken you, and I'd already grieved a little, so forgive me for staring. Ashenvale has lost more trees since you left, and I'm glad it hasn't lost you as well." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've changed since I last saw you, and I can see it in how you stand, like someone the Warsong would think twice about. Teronis carried himself like that, and I'd be glad of more of it at my side." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Half of Astranaar is talking about what you did for us, and I'm glad of it. Most who promise us help get as far as the first furbolg camp and turn back." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone here left a talk with you looking like a storm cloud, and in a town this small I hear about it before supper. I'll judge you for myself, but I'd rather the forest's friends weren't at odds with each other." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ashenvale has satyrs enough already, stranger, and they started out smelling much like you. Keep whatever you carry on a short leash inside my walls." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "That's a good companion. My saber, Korra, likes the look of it, though my wolf, Dagri, isn't sure yet; he's never sure about anyone at first." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then you know the forest isn't a place but a living thing, so help me keep it that way." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid, and the trees will be glad of you. So will I, because something is making the furbolgs sick, and you'll see it sooner than I can." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My scouts went quiet when you came in, and they are not easily quieted, because they know what the satyrs feel like at night. You carry that same hush, warlock, and I would rather you carried it out in the forest than in my hall." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "That bag of shards at your hip is heavy with souls, enough for a whole patrol. I hope every one of them came off a satyr, because I have lost scouts this year, and I would not like to wonder." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Burn the lumber camp to the ground, salt the stumps and send the Warsong back to Durotar with splinters in their pride. You've seen them up close, though, so tell me what you make of them." },
      },
      choices = {
        { text = "Butchers. Every axe they swing is an insult.", next = "op_r1", fx = { affinity = 2, align = { honor = -1 }, trait = { stern = 1 }, opinion = { warsong = "hate" } } },
        { text = "Workers following orders. Their chiefs are the problem.", next = "op_r2", fx = { align = { honor = 1 }, trait = { kind = 1 }, opinion = { warsong = "pity" } } },
        { text = "They're soldiers. Beat them as soldiers, not as monsters.", next = "op_r3", fx = { align = { honor = 1 }, opinion = { warsong = "respect" } } },
        { text = "Orgrimmar needs lumber, and Ashenvale has plenty to spare.", next = "op_r4", fx = { affinity = -2, align = { honor = -1 }, opinion = { warsong = "necessary" } }, when = { faction = "Horde" } },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Then we understand each other perfectly. Go and see Sentinel Thenysil; she keeps a list, and it has room on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Workers with axes are still axes, {class}. I'll pity them when they're back across the river." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "You sound like the Sentinels who stood beside orcs at Hyjal. I stood there too, and I watched how quickly that friendship rotted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then Orgrimmar can build with stone like the dwarves do, and leave our ancestors' trees standing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I have heard them chanting at the lumber camps, and I will never forget it. If your spirits are kin to theirs, I would know whether the forest's anguish reaches them at all." } },
      choices = {
        { text = "My spirits grieve with you, Raene. I'll help defend these trees.", next = "BACK", reply = "Then you are welcome here, shaman, and more than welcome on the eastern roads. The trees will be glad of you.", fx = { align = { honor = 1 } } },
        { text = "Spirits serve whoever calls them. Don't blame the spirits for orcs.", next = "BACK", reply = "Perhaps the spirits are blameless, but they answered the axes all the same. I'll judge the hands that call them, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A frost spell that pins a Warsong runner to the road would be worth a dozen of my arrows, and I'll say so to the Sentinels' faces. But you'll fight beside my scouts and not in front of them, because fire in these trees could do more harm than any orc axe." } },
      choices = {
        { text = "I'll fight beside your scouts and keep my fire close.", next = "BACK", reply = "Good. My scouts will be glad of you, and the trees will be gladder still.", fx = { align = { order = 1 } } },
        { text = "I'll use whatever spell wins the fight, fire included.", next = "BACK", reply = "Then fight somewhere my scouts aren't, mage. I'll not have the forest burned to save it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I judge you by the same thing the satyrs started with, which was a bargain with the Legion that they swore they could control. Prove me wrong out in the forest where my scouts can see it, and I'll be the first to say so." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I judge you by the same thing the satyrs started with, which was a bargain with the Legion that they swore they could control. And here it stands in my outpost, watching my Sentinels like it's counting them, so prove me wrong out in the forest where my scouts can see it." },
      },
      choices = {
        { text = "Watch me, then. I'll never let it master me.", next = "BACK", reply = "I will watch, and I hope you prove me wrong. Elune knows I'd like to be.", fx = { align = { light = 1 } } },
        { text = "The satyrs were weak. I'm not, and I won't apologise for it.", next = "BACK", reply = "The satyrs said that too, before the horns came. Stay far from my scouts.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_r = {
      lines = {
        { id = "wr_default", text = "There is no front, warrior, and that's the trouble with this war. The Warsong come through the trees from the east wherever they like, so a good warrior here learns to fight from behind a trunk, the way my scouts do." },
        { id = "wr_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "A veteran of the Auberdine watch, and you still want more? Good. Ashenvale needs exactly that kind of stubbornness, because the Warsong have plenty of their own." },
      },
      choices = {
        { text = "Then I'll learn to fight like a scout.", next = "BACK", reply = "Good. You'll live longer, and so will the scouts beside you.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll stand in the open and let them come.", next = "BACK", reply = "Then you'll be the first thing the Warsong see, and the last thing my scouts bury. Be careful.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
    rogue_r = {
      big = true,
      lines = {
        { id = "rr_default", text = "Could you? The Warsong post guards on their saws and their wolves smell elves at fifty paces, but a rogue who can get close could learn how many axes they have, and where they mean to cut next." },
        { id = "rr_watch", when = { origin = "nightelf_watcher_trained" },
          text = "You move like the Watchers, and I'll not ask where you learned it. Scout the lumber camps for me and I'll count it a debt between us." },
      },
      choices = {
        { text = "I'll scout and report. No killing unless I must.", next = "BACK", reply = "Good. Numbers first, and blood only if they force it. You'll do well here.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll do more than count. Their foremen won't wake.", next = "BACK", reply = "I'll not mourn a Warsong foreman, but I'd rather have the numbers. Bring me both.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human_r = {
      big = true,
      lines = {
        { id = "hmr_default", text = "I know, and I've heard Stormwind's soldiers talk about it around our fires. Your people kept the orcs in camps after that war, and their young Warchief broke them out and brought them across the sea, and here are his axes in my trees." },
      },
      choices = {
        { text = "Orcs can change. Some of them have.", next = "human_r2", fx = { align = { light = 1 } } },
        { text = "An orc with an axe is an orc with an axe.", next = "BACK", reply = "It is, and that's all I need to know about it. Thank you for not pretending otherwise.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    human_r2 = {
      lines = {
        { id = "hmr2_default", text = "Maybe, and maybe one day I'll meet one. Until then I'll judge them by what reaches Astranaar, which is smoke and stumps and the bodies of my scouts." },
      },
      choices = { { text = "Something else, Raene.", next = "BACK" } },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stand between the Warsong axes and the trees, because every grove they fell is gone for good. Delgren's people already hold Maestra's Post, and I'd be glad of one more hammer on the roads." } },
      choices = {
        { text = "Then I'll stand between the axes and the trees.", next = "BACK", reply = "Then you'll stand with Delgren's people, and I'll be glad of you. Every grove counts.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm here for my own reasons, not the trees'.", next = "BACK", reply = "As you like, paladin, and I'll not ask what they are. The trees will be glad of you either way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Quiet for now, which is the most anyone gets in Ashenvale. The orcs at Zoram'gar will crow that they did it, so let them crow; I know whose boots came back wet, and I'll make sure the Sentinels know it too." },
      },
      choices = {
        { text = "Let them crow. The deed matters more than the credit.", next = "BACK", reply = "It does, and I'm glad you see it. I'll remember whose boots came back wet.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell everyone, Raene. I want my name known in Astranaar.", next = "BACK", reply = "Then I'll tell them, and gladly. Astranaar will know who went into the Deeps.", fx = { align = { honor = -1 } } },
        { text = "The Horde at Zoram'gar must have fought down there too.", next = "xcl_bfd2" },
      },
    },
    xcl_bfd2 = {
      big = true,
      lines = { { id = "xcl_bfd2_default", text = "Some of them, I'm told, and I'll not pretend they didn't bleed for it. They want the naga gone as much as we do, but they want the coast's timber too, and every shared enemy only puts off the day we're shooting at each other again." } },
      choices = {
        { text = "A shared enemy is a start. Peace has grown from less.", next = "BACK", reply = "It is a start, and I'll not pretend I don't hope for it. But I'll watch them closely all the same.", fx = { align = { order = 1 } } },
        { text = "Then strike the Horde while they're still licking their wounds.", next = "BACK", reply = "They're not the only ones licking wounds, and I'll not send my scouts into a second war. Not yet.", fx = { align = { order = -1 } } },
        { text = "I'll keep my eyes open on the strand, then.", next = "BACK" },
      },
    },
    dd_sarilus = {
      lines = {
        { id = "dds_default", text = "Cleaner, at least, and Velene can stop staring at the water as if it might attack her, which once it did. A mage in the Barrens bending our elementals to his will is exactly the kind of trouble I cannot spare Sentinels to hunt, so I am grateful you did it for us." },
      },
      choices = {
        { text = "Why can't you spare the Sentinels?", next = "dd_sarilus2" },
        { text = "Something else, Raene.", next = "BACK" },
      },
    },
    dd_sarilus2 = {
      lines = {
        { id = "dds2_default", text = "Because the orcs cut at Warsong, the furbolgs rage in the north, the satyrs creep out of Felfire Hill, and Darnassus sends me promises instead of soldiers. Astranaar holds because travellers like you lend their blades, and I would rather say that plainly than pretend otherwise." },
      },
      choices = {
        { text = "Then I'll keep lending mine.", next = "BACK", fx = { affinity = 1, standing = { astranaar = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_sarilus", tags = { "news" }, when = { questDone = TODO_QUEST("Mage Summoner") }, text = "Velene sent word from Silverwind that the mage who fouled her lake is dead in the Barrens, and that you carried his head back to her. One less enemy at our backs, {class}, and I have few enough Sentinels to watch them all." },
        { id = "o_orcs_pity", tags = { "news" }, when = { opinion = { topic = "orcs", stance = "pity" } },
          text = "I hear you've a soft word for the orcs, {class}. Keep it soft, because my Sentinels have hard ears today." },
        { id = "o_ashenvale_war", tags = { "news" }, when = { faction = "Alliance", opinion = { topic = "ashenvale", stance = "war" } },
          text = "Word reached me you want every Warsong camp driven out. Good, because I've a list, and it starts at the lumber camp." },
        { id = "h_cl_bfd", tags = { "news" }, when = { cleared = "Blackfathom Deeps", faction = "Alliance" }, text = "My scouts on the Zoram Strand say you went into Blackfathom Deeps and came out past whatever waited at the bottom. Good, because I have no one to spare for that water, and it has been gnawing at Ashenvale's coast for years." },
        { id = "h_default", key = true,
          text = "I am Raene Wolfrunner, and I command the scouts of Astranaar. The furbolgs are going mad to the north and the Horde is cutting the forest to the east, and I would rather face them all alone than watch another tree fall." },
        { id = "h_trek", tags = { "news" }, when = { questActive = TODO_QUEST("Trek to Ashenvale") },
          text = "You've come from Darkshore, and Sentinel Selarin sent you on quickly; good. I wish you'd come under happier circumstances, but there's more wrong in this forest than one scout can mend, so start by talking to the people of Astranaar." },
        { id = "h_aggressive", when = { questActive = TODO_QUEST("An Aggressive Defense") },
          text = "The Foulweald have been falling on travellers along the road east, before the Falfarren River. Their camps are south of the road, so show them the same mercy they've shown our people." },
        { id = "h_cull", tags = { "news" }, when = { questActive = TODO_QUEST("Culling the Threat") },
          text = "My scouts say the Thistlefur north of Astranaar have grown greatly in number these past months, and if they grow much more they may find the courage to attack us. Bring me their chieftain Dal Bloodclaw's skull." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Raene's Cleansing") },
          text = "Teronis was my friend, and he died seeking a way to slow the furbolgs. I would rest much easier knowing his death was not in vain, so finish his work." },
        { id = "h_ran", when = { questDone = TODO_QUEST("Raene's Cleansing") },
          text = "You took up Teronis's work when no one else would, and I will not forget it. He would have been proud of whoever finishes it." },
        { id = "h_thundris", when = { heardLine = "thundris.h_ashenvale" },
          text = "Thundris Windweaver sent you down from Auberdine? Then he thinks well of you, and he doesn't think well of many." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, good. My scouts come back from the Thistlefur hills with wounds that need more than bandages." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "There's a mage in Astranaar, and the Sentinels are already watching you, I'd wager. My people learned what the arcane costs when the Well of Eternity dragged our homeland under the sea, so don't take the stares personally." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "So you're the one my saber, Korra, has been growling at since you crossed the bridge. I've buried scouts the satyrs of Satyrnaar tore open, and you smell the way their camps did." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, all the way out here! I hope you came to fight, because Ashenvale has no use for anyone who came to watch." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Foulweald", "Thistlefur" }, min = 40 } },
          text = "My scouts tell me the Foulweald and the Thistlefur have both lost a great many warriors this season, and that you're a good part of the reason. Astranaar sleeps a little easier for it, and so do I." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, in Ashenvale. The Warsong have shamans too, and they cheer while their axes bite into trees older than your kingdom, so tell me your spirits grieve for this forest." },
      },
      again = {
        { id = "h_again", text = "What else? Korra's getting restless, and so am I; Ashenvale has been patient for ten thousand years, and it has run out." },
        { id = "h_again2", text = "Ask away; I have a moment before the scouts report." },
      },
      choices = {
        { text = "Velene's lake should run clean now.", next = "dd_sarilus", when = { questDone = TODO_QUEST("Mage Summoner") } },
        { text = "What would you do with the Warsong, if you could?", next = "op_ask" },
        { text = "Do you keep any animals of your own?", next = "pets" },
        { text = "The furbolgs seem to have turned against you.", next = "furbolgs" },
        { text = "Tell me about Teronis.", next = "teronis", when = { any = { { questActive = TODO_QUEST("Raene's Cleansing") }, { questDone = TODO_QUEST("Raene's Cleansing") } } } },
        { text = "What about the Horde?", next = "horde" },
        { text = "How do you keep two companions at once?", next = "hunter_r", when = { class = "HUNTER" } },
        { text = "What do you need from a druid?", next = "druid_r", when = { class = "DRUID" } },
        { text = "Your scouts must need a healer.", next = "priest_r", when = { class = "PRIEST" } },
        { text = "Put me at the front when the Warsong come.", next = "warrior_r", when = { class = "WARRIOR" } },
        { text = "I could get into their lumber camps unseen.", next = "rogue_r", when = { class = "ROGUE" } },
        { text = "My people fought the orcs in our own fields.", next = "human_r", when = { race = "Human" } },
        { text = "A mage could be of use to your scouts, Raene.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you judge me by what the satyrs did?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would you have a paladin do in Ashenvale, Raene?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Warsong shamans really bless the logging, Raene?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Blackfathom Deeps is quiet now, Raene.", next = "xcl_bfd", when = { cleared = "Blackfathom Deeps", faction = "Alliance" } },
        { text = "I pray for the Warsong wounded too, Raene. Does that trouble you?", next = "xorig_well", when = { origin = "nightelf_astranaar_moonwell" } },
        { text = "I'll help defend the forest.", next = "END", fx = { affinity = 2, standing = { astranaar = 1 } } },
      },
    },
    xorig_well = {
      big = true,
      lines = {
        { id = "xwe_default", text = "It does, and I'll not pretend otherwise, because I have buried Sentinels those same orcs walked away from. But you kept our moonwells clean when nobody else would stand by them, and you have mended more of my scouts than any priestess in Darnassus. Why pray for them at all?" },
      },
      choices = {
        { text = "Elune's mercy isn't mine to ration, Raene.", next = "BACK", reply = "It isn't, and I'm ashamed I spoke as if it were. Forgive a tired Sentinel.", fx = { align = { light = 1 } } },
        { text = "You're right. My prayers belong to our own first.", next = "BACK", reply = "That's what I tell myself, most nights. But I'm glad someone was there for the others.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pets = {
      lines = { { id = "p_default", text = "Korra is my saber cat and Dagri is my wolf. They don't like each other much, but they like me, and they both hate furbolgs, so that's as near to a family as I've got, fleas and all." } },
      choices = {
        { text = "Good family.", next = "BACK", fx = { affinity = 1 } },
        { text = "How do they get along?", next = "pets2" },
      },
    },
    pets2 = {
      lines = { { id = "p2_default", text = "They tolerate each other for my sake, the way two old soldiers share a fire. It's more courtesy than either of them shows a furbolg." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    furbolgs = {
      big = true,
      lines = {
        { id = "f_default", text = "They didn't use to. The furbolgs were peaceful once, even wise, but something is poisoning them, and until I know what it is, I keep them away from the town with arrows." },
      },
      choices = {
        { text = "I'll find out what it is.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Why not just kill them all?", next = "all" },
      },
    },
    all = {
      lines = { { id = "a_default", text = "Because they were our friends, and because something made them like this. I would rather kill whatever that is." } },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teronis = {
      lines = { { id = "te_default", text = "He was a longtime friend, aiding the Sentinels here. He went looking for a gem for a rod made long ago by Dartol, a druid long dead, because he thought it could slow the furbolgs, and we found him dead on the shrine island in Lake Falathim." } },
      choices = {
        { text = "A dead druid's rod sounds like an odd thing to need.", next = "rod" },
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You blame yourself for letting him go alone.", tag = "Persuade", next = "teronis_guilt",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { class = "HUNTER" } } } },
          fail = { next = "teronis_no", fx = { affinity = -1 } } },
      },
    },
    rod = {
      lines = { { id = "ro_default", text = "I know how it sounds. But Teronis believed the rod could let someone walk among the furbolgs as one of them and learn what poisoned them, and I trust what Teronis believed." } },
      choices = {
        { text = "Then I'll finish what he started.", next = "BACK", reply = "Then you'll honour Teronis, and I'll be grateful. Find what he was looking for.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Walking among them in their own skins is a fine trick, and I like tricks.", next = "BACK", reply = "It is a fine trick, and a dangerous one. Use it for the furbolgs, not for sport.", fx = { align = { honor = -1 } } },
        { text = "A tool like that sounds risky.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "The Warsong cut to the east from their post at Splintertree, and my Sentinels answer every axe they swing. I would rather face them alone than watch them hack their way through these trees." } },
      choices = {
        { text = "Can't there ever be peace here?", next = "horde2" },
        { text = "Then I'll fight them with you.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } },
      },
    },
    horde2 = {
      lines = { { id = "ho2_default", text = "Perhaps, on the day they stop cutting. Ask Delgren at Maestra's Post; he's a human paladin who learned their tongue, and he'll give you a more patient answer than I can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter_r = {
      lines = { { id = "hr_default", text = "With patience, and by never favouring one where the other can see. Your own companion will teach you the rest, if you let it." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid_r = {
      lines = { { id = "dr_default", text = "Eyes that can see sickness. Walk the Thistlefur hills north of town and tell me whether the trees are sick too, or only the furbolgs." } },
      choices = { { text = "I'll go and look.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    priest_r = {
      lines = { { id = "pr_default", text = "They always do. The ones who come back from the Thistlefur hills come back torn, and some nights Kimlya's inn is more hospice than inn, so sit with them if you have the time." } },
      choices = {
        { text = "I'll go there now.", next = "BACK", reply = "Thank you. They'll be glad of you, more than they'll say.", fx = { affinity = 2, align = { light = 1 }, standing = { astranaar = 1 } } },
        { text = "The ones who went into the Thistlefur hills chose their wounds.", next = "BACK", reply = "Some of them chose, and some were sent. Either way, they're bleeding in Kimlya's beds.", fx = { align = { light = -1 } } },
      },
    },
    teronis_guilt = {
      lines = {
        { id = "tg_default", text = "Every day. He asked whether I could spare a scout to walk with him, and with the Warsong at the river I said no, so he went to Lake Falathim alone, and whatever waited on the shrine island found him before anyone else did." },
        { id = "tg_hunter", when = { class = "HUNTER" },
          text = "You know what it is to answer for another life, hunter. I let Teronis go to Lake Falathim alone because I wouldn't spare a scout from the Warsong line, and I have answered for it every night since." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then let me finish what he started.", next = "rod" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teronis_no = {
      lines = {
        { id = "tn_default", text = "Blame is for later, when the forest is safe again. Ask me something I can use." },
        { id = "tn_kin", when = { race = "NightElf" },
          text = "You know better than to pick at a Sentinel's wounds, {g:brother|sister}. Ask me something I can use." },
      },
      choices = {
        { text = "Right. Something useful, then.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's good to hear, and I don't hear it often out here. I'll take it back to the Sentinels on the wall, because they've earned a share of it." },
        { id = "s2", text = "You've a kind tongue, and you sound as if you mean it. Thank you, because the forest wears on a hunter, and a word like that helps." },
      },
      fail = {
        { id = "f1", text = "Don't waste flattery on me, because I can't make arrows out of it. If you think well of Astranaar, pick up a blade and show me." },
        { id = "f2", text = "I've tracked enough game to know when I'm being led down a trail. Whatever you're after, ask for it straight." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've got a wolf's cheek, and I like it. The Sentinels are so grim these days that I'd forgotten what it was to be needled." },
        { id = "s2", text = "Careful, or I'll start to enjoy your company. You've a quick tongue, and I'd wager a quick blade to go with it." },
      },
      fail = {
        { id = "f1", text = "I've buried friends this season, so I've no patience for that. Say it again and you can find another village to rest in." },
        { id = "f2", text = "That's the kind of talk I'd expect from someone who has never stood a night watch on the Ashenvale border. Go and stand one, and then come and mock me." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, you've made yourself clear, and I'm not fool enough to pick a fight inside my own walls while the orcs are outside them. Have it your way." },
        { id = "s2", text = "You've a look in your eye I've seen on cornered nightsabers, and I respect it enough to step back. Tell me what you want." },
      },
      fail = {
        { id = "f1", narr = "Her hand drops to the bow at her side.", text = "I hunt things in the dark that would turn your stomach, so that glare is wasted on me. Stand down before I decide you're a threat to Astranaar." },
        { id = "f2", text = "Try to frighten me again and I'll have the Sentinels walk you to the bridge. I have real enemies in this forest, and I haven't time for a pretend one." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's not something I'll talk about with someone I've barely hunted beside. Do some work for Astranaar, and I may tell you." },
      { id = "gt2", text = "I know, and I'm keeping it to myself until I'm surer of you. Out here we've learned to be careful about whom we trust." },
    },
    knows = {
      { id = "tp_knows", text = "My scouts bring me word of everything that moves in this forest, and Korra brings me the rest. Ask what you need." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "I'll answer, because the forest needs every pair of hands, even yours. Be quick about it." },
    },
    background = { { id = "tp_bg", text = "I'm a hunter of the Sentinels, and Ashenvale is the only home I care about. Korra and Dagri are all the family I need." } },
    advice = { { id = "tp_ad", text = "Learn the forest as if it were part of you, and remember there is always more danger hidden in it than you can see." } },
    furbolgs = { { id = "tp_furbolgs", text = "They were peaceful once, even wise. Something poisoned them, and I mean to find out what.", next = "furbolgs" } },
    warsong = { { id = "tp_warsong", text = "Their axes are the sound I hate most in this whole forest." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids could help here, if they'd look up from their arguments in Darnassus. A few have, but not nearly enough." } },
    thrall = { { id = "tp_thrall", text = "Thrall's a better warchief than the ones who burned this forest before him, and I've heard he means well. Meaning well doesn't stop the Warsong saws, so I'll judge him by his axes." } },
    blackfathom = {
      { id = "tp_blackfathom", text = "Blackfathom Deeps is on the coast west of here, an old temple of Elune full of nagas and Twilight's Hammer cultists. Korra won't go near the place, and Korra isn't afraid of anything." },
      { id = "tp_blackfathom2", when = { class = "HUNTER" }, text = "You're a hunter, so take my advice and leave your cat outside Blackfathom if it hates water. Korra does, and I've never heard the end of it." },
    },
    green_dragons = { { id = "tp_green_dragons", text = "There's a dragon's grove in the south of Ashenvale, under great trees where the mist never lifts. Lately the beasts there have gone strange, and I keep Korra and Dagri well away." } },
    centaur = { { id = "tp_centaur", text = "The centaur come up from the Barrens now and then and test our southern edge. They hunt well, and they don't care whose land it is, which I suppose is something we have in common." } },
    elune = { { id = "tp_elune", text = "I'm a hunter, not a priestess, but I pray to Elune before every long patrol. Korra sits with me, and I like to think she's praying too." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw up in Felwood are what the Thistlefur used to be, before the madness. I'd like our furbolgs back, but I'll settle for keeping them out of Astranaar." } },
    _none = { { id = "tp_none", text = "That's not mine to know. Ask a Sentinel, or ask the trees, if you know how; they remember more than any of us." } },
  },
}

P:NPC {
  key = "pelturas", id = TODO_NPC("Pelturas Whitemoon"), name = "Pelturas Whitemoon",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "anxious" }, values = { "loving", "determined" },
  notices = { "class", "lock_soulstone" },
  impression = {
    first = "He has tried nearly every cure and has not once stopped hoping.",
    third = "{name} met Pelturas Whitemoon of Astranaar, a father searching for any cure for his daughter Relara's fever and nightmares.",
  },

  greetings = {
    { id = "g_worried", text = "Please, speak softly; my daughter is sleeping. At least, I hope she's sleeping." },
    { id = "g_back", when = { metBefore = true }, text = "Thank you for coming back. Every time someone comes back, I can breathe a little easier." },
  },

  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "DRUID", "PALADIN" } },
      text = "You have healing in you; I can feel it. Would you look at her? Only look, please, and I'll be grateful for anything." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone has set your soul in a stone, I think, so that you can be called back if you fall. My daughter's dreams take her somewhere I cannot follow, and I find myself envying you that thread home." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A little, sometimes, and then the sickness returns. I would try anything, even spirits I do not understand, if it helped her." } },
      choices = {
        { text = "Then I will help however I can, Pelturas. She deserves hope.", next = "BACK", reply = "Thank you, truly. Hope is all I've had to give her these last weeks.", fx = { align = { light = 1 } } },
        { text = "Some sicknesses cannot be cured. Prepare yourself.", next = "BACK", reply = "I know, and I've told myself the same at night. But I'm not ready to stop trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There may be, for the cure I've been promised needs things from places where no healer can go safely. Orendil says Fallen Sky Lake holds part of it and the creatures there are cruel, so a warrior would be more use to me than a whole bag of herbs." } },
      choices = {
        { text = "I'll go to the lake for her.", next = "BACK", reply = "Bless you, bless you. I'll send word to Orendil that you're coming.", fx = { align = { honor = 1 } } },
        { text = "I'll go, but I'll expect fair pay.", next = "BACK", reply = "Of course, and I'll pay what I can. Anything, for her.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The healers say so, though they argue about which, and the corrupted things at Fallen Sky Lake are the ones they argue over most. A hunter who knows the lake could save me a season of guessing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The healers say so, though they argue about which, and the corrupted things at Fallen Sky Lake are the ones they argue over most. Your {pet} is gentle around her, I can see it, so if she wakes, would you let her see it?" },
      },
      choices = {
        { text = "I'll go to the lake and find what she needs.", next = "BACK", reply = "Thank you. She'll know a stranger cared, and that matters more than you know.", fx = { align = { honor = 1 } } },
        { text = "I hunt for coin, not for cures.", next = "BACK", reply = "I'll pay, then, whatever I have. She's worth more than every coin I own.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Orendil once told me the Shadethicket Oracle hoards the moonstones deep in their camp by Fallen Sky Lake, where no honest fighter could reach them without a battle. I'd never ask anyone to steal, but I've stopped pretending I'd mind." } },
      choices = {
        { text = "I'll fight for the stone openly, Pelturas.", next = "BACK", reply = "Thank you. I'd rather it was honest, if it can be.", fx = { align = { honor = 1 } } },
        { text = "Then I'll slip in and take it unseen.", next = "BACK", reply = "I'll not ask how, only that you come back. She needs that stone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't know what reaches into her dreams, and that is what frightens me most, because whatever it is came out of this forest's sickness. If you can feel such things, say so, and then please stand a little further from the door." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I don't know what reaches into her dreams, and that is what frightens me most, because whatever it is came out of this forest's sickness. Your servant keeps turning its head toward her bed as though it hears something, so tell me what it senses, and then please take it outside." },
      },
      choices = {
        { text = "I'll keep my distance from her room, Pelturas.", next = "BACK", reply = "I understand, and I'm grateful for it. Whatever reaches her, I'd rather it reached nothing else.", fx = { align = { light = 1 } } },
        { text = "Let me sit by her. I might hear what whispers to her.", next = "BACK", reply = "Would you? I'm frightened, but I'd let anyone try who might hear it. Please be gentle.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_p = {
      lines = {
        { id = "mp_default", text = "A spell? My mother would have thrown you out of the house for saying it, and the Sentinels would agree with her. But I've tried every herb in Ashenvale, so tell me plainly: can your magic touch a fever that comes from a dream?" },
      },
      choices = {
        { text = "No. It can't, and I won't lie to you. I'm sorry.", next = "BACK", reply = "Thank you for telling me honestly. It's a kindness, even if it hurts.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It might. I'd try anything, as you have.", next = "BACK", reply = "Then I'll hope, and I'll keep looking for herbs. Thank you.", fx = { align = { honor = -1 } } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A little, for a night or two, and then the dreams come back worse than before. The priestesses say the sickness is not of the body, and so I have pinned my hopes on Orendil's cure instead." } },
      choices = {
        { text = "I'll pray for her every night until she's well.", next = "BACK", reply = "Thank you. She'll sleep better knowing someone is praying for her, I think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If healers failed, prayer won't help her either.", next = "BACK", reply = "Maybe not, but I'll pray anyway, because I've nothing else left. Please don't take that from me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Help me find a cure, because I am a father and not a warrior, and the things that guard what I need are past me. If you can spare the time, there is no deed in this forest I would thank you for more." } },
      choices = {
        { text = "I'll find her cure, whatever stands in the way.", next = "BACK", reply = "Thank you. I'll never forget it, and neither will she.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've harder fights to finish first, Pelturas.", next = "BACK", reply = "I understand. If you finish them, please come back. She'll still need you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_branch", when = { questDone = TODO_QUEST("The Branch of Cenarius") }, text = "Illiyana's sorrow has eased a little since the Branch of Cenarius came home to her, I hear, and you were the one who brought it. Elune bless you for that, for the dryads have few enough friends in these woods now." },
        { id = "h_default", key = true,
          text = "I am Pelturas Whitemoon. My daughter Relara has a fever no herb can touch and nightmares that make her scream in her sleep, and I will try anything; I have tried most things already, and only Orendil's remedies help at all." },
        { id = "h_orendil", tags = { "news" }, when = { questActive = TODO_QUEST("Orendil's Cure") },
          text = "This is from Orendil? His skill with herbs and healing is great, and this cure gives me hope where before I had very little." },
        { id = "h_tear", when = { questActive = TODO_QUEST("Elune's Tear") },
          text = "Orendil's cure only slowed the sickness. He told me of Elune's Tear, a stone found only on the isle in Iris Lake, east of here, that washes corruption away, so please bring it to me." },
        { id = "h_stardust", when = { questActive = TODO_QUEST("The Ruins of Stardust") },
          text = "The tear washed away some of the sickness and her nightmares have lessened, but the fever still rages. Orendil spoke of a frosted dust in the Ruins of Stardust to the south; bring me some, and I'll make a poultice." },
        { id = "h_moonstone", tags = { "news" }, when = { questActive = TODO_QUEST("Fallen Sky Lake") },
          text = "Her fever has passed, but she is so weak. We used to gather moonstones together at Fallen Sky Lake before the Shadethicket came, and now their Oracle hoards every one; I need one to give her strength back." },
        { id = "h_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
          text = "She's eating! She asked for honey cakes this morning, and I cried in front of the baker, and I don't care who knows it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came in so softly that Relara didn't stir, and for that I could almost thank you. Most visitors clatter in like Sentinels at the changing of the watch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's a coldness about you that I don't like near my daughter's room, and forgive me for saying so. Her dreams are dark enough already without anything darker standing at her door." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Please lower your voice; Relara has only just fallen asleep, and every sound wakes her." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Speak softly, I beg you, because my daughter sleeps lightly and the dreams are bad." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Forgive me, I don't mean to stare, but I have asked every healer who comes through Astranaar to look at Relara." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I have heard your order can lay hands on the sick, and I would beg it of you if I thought it would help her." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Please, speak softly, for Relara's sake. You are a shaman, I see, and I have tried nearly every cure my people know, so tell me, do your spirits know another?" },
      },
      again = {
        { id = "h_again", text = "Is there anything else? Forgive me, I keep listening for her." },
        { id = "h_again2", text = "Go on, please. Talking helps with the waiting." },
      },
      choices = {
        { text = "What's wrong with her?", next = "wrong" },
        { text = "Who is Orendil?", next = "orendil" },
        { text = "What did you and Relara do before she fell ill?", next = "lake" },
        { text = "Let me look at her.", next = "look", when = { class = { "PRIEST", "DRUID", "PALADIN" } } },
        { text = "I'm a mage. Let me try a spell on her fever.", next = "mage_p", when = { class = "MAGE" } },
        { text = "Is there anything quiet feet could fetch for Relara?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there anything a warrior can do for Relara?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The creatures of Ashenvale might hold what Relara needs.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think what I carry could reach into her dreams?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Has nothing a healer tried helped Relara?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd like to do something for your daughter, Pelturas.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has any cure helped Relara at all, Pelturas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    wrong = {
      big = true,
      lines = {
        { id = "w_default", text = "No one is sure. It's a fever that comes from magic rather than sickness, with dreams that hurt her, as if something in this forest reaches into sleep, and I want it out of my daughter." },
      },
      choices = {
        { text = "We'll get it out.", next = "BACK", reply = "Thank you. I'll hold on to that until you do.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "If it takes dark magic to drive it out, I'll use it.", next = "BACK", reply = "Please, be careful, whatever you use. She's only a child.", fx = { align = { light = -1 } } },
        { text = "Something in the forest?", next = "forest" },
      },
    },
    forest = {
      lines = { { id = "f_default", text = "The furbolgs went mad, the water is wrong in places, and now my girl dreams of things she has never seen. I'm no druid, but I'm not a fool either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orendil = {
      lines = { { id = "o_default", text = "Orendil Broadleaf is a healer, and his skill with herbs is greater than anyone's in the forest. Each remedy he sends helps a little, and each time I pray it will be the last one we need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lake = {
      lines = { { id = "l_default", text = "We used to go to Fallen Sky Lake together, she and I, and gather the fallen moonstones. Then the Shadethicket bog beasts came, and their Oracle took every stone for itself." } },
      choices = {
        { text = "Then I'll take one back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "lo_default", text = "Would you really? Please be gentle with her. Whatever you can do, even if it only eases her for one night, I'll be grateful." } },
      choices = {
        { text = "I'll pray over her.", next = "BACK", reply = "Thank you. She'll feel it, I think, even in her sleep.", fx = { affinity = 3, align = { light = 2 } } },
        { text = "Prayer won't reach a magic fever, but I know darker remedies that might.", next = "BACK", reply = "Darker? I'm frightened of anything darker than what's already in her dreams. Please, only if there's nothing else.", fx = { align = { light = -2 } } },
        { text = "I'll do what I can.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've asked everyone in Astranaar about everything, looking for something that might help Relara. Ask me; perhaps some of it will help you." },
    },
    background = { { id = "tp_bg", text = "I'm Relara's father. That's all I am at the moment, and I can't remember the last time I slept." } },
    advice = { { id = "tp_ad", text = "Hold on to the people you love while you can. I'm learning that at a bedside." } },
    elune = { { id = "tp_elune", text = "I've prayed to Elune every night since Relara fell ill, and some mornings I think she's answering. Other mornings I just keep praying." } },
    holy_light = { { id = "tp_holy_light", text = "Delgren prays to his Light over Relara sometimes, and I let him. I'd let anyone pray over her who wanted to." } },
    warsong = { { id = "tp_warsong", text = "The orcs cut the forest a day's walk from my door, and I lie awake listening for them. I used to lie awake for other reasons, before Relara got sick." } },
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about anything else right now. Elune forgive me, there is only Relara." } },
  },
}

P:NPC {
  key = "relara", id = TODO_NPC("Relara Whitemoon"), name = "Relara Whitemoon",
  bible = "bibles/ashenvale.md", role = "child", tier = "quest",
  communities = { "astranaar" }, temper = { "frightened" }, values = { "gentle" },
  notices = { "pet", "lock_steed" },
  impression = {
    first = "She means to become a Sentinel or a hippogryph, whichever flies.",
    third = "{name} met Relara Whitemoon, Pelturas's young daughter, who faces her fevered nightmares with a child's stubborn hope.",
  },

  greetings = {
    { id = "g_sleep", text = "Is it morning yet? It's always dark when I wake up... is Papa here?" },
    { id = "g_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") }, text = "Hello! I'm better now, and Papa says I mustn't run yet, but I'm going to run anyway, later." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Is that yours? Oh, can it come closer? I won't pull its ears, I promise!" },
    { id = "n_lock_steed", cat = "lock_steed", when = { aura = { 5784, 23161 } },
      text = "Is that your horse, with the fire on its feet? It's scary and beautiful at once, and I want to touch its nose, but Papa would never let me, so can you tell me if it's warm?" },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than anything! Papa's fixing everything, and then I'll fly. Can your wind spirits teach me?" } },
      choices = {
        { text = "You'll fly one day, Relara. Hold on to that.", next = "BACK", reply = "Really? Then I'll hold on as tight as I can, and I'll fly one day. Thank you.", fx = { align = { honor = 1 } } },
        { text = "Rest first. Flying can wait.", next = "BACK", reply = "That's what Papa says too. But when I'm better, I'm flying first thing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Yes, please, but a small bear, if you can, because Papa will hear if you knock anything over. Do bears have bad dreams too, or do they sleep all winter and only dream about honey?" } },
      choices = {
        { text = "Bears have bad dreams too, but they always wake up again.", next = "BACK", reply = "Oh, good, because I'd hate for them to stay scared. Will you show me the bear now, a small one?", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bears never have bad dreams. Nothing scares a bear.", next = "BACK", reply = "Really? Then I want to be a bear when I'm better, so nothing scares me either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I want to be a Sentinel and ride a nightsaber and fight the orcs, but Papa says I have to get better first. Did it hurt, the first time you got hit? I bet you didn't even cry." } },
      choices = {
        { text = "It hurt, and I cried. Brave people still cry.", next = "BACK", reply = "You cried? Then I can cry and still be brave. That makes me feel much better.", fx = { align = { honor = 1 } } },
        { text = "Never. Warriors don't cry.", next = "BACK", reply = "Oh. I cried when I fell off the bridge, so maybe I'm not a warrior yet. I'll try harder.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Maybe, if I can't be a hippogryph, because hunters get to have a friend who goes everywhere with them. Papa says the bad dreams can't get you if something's watching over you, so maybe I need a beast." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Maybe, if I can't be a hippogryph, because hunters get a friend who goes everywhere with them. Is your {pet} nice? It's looking at me like it knows I'm sick, so can it stay a little while?" },
      },
      choices = {
        { text = "Every hunter needs a brave heart first, and you have one.", next = "BACK", reply = "You think so? Then I'll be brave, and I'll get a friend to watch over me.", fx = { align = { light = 1 } } },
        { text = "Hunting's hard. Better to stay safe at home.", next = "BACK", reply = "But I don't want to stay home forever. I'll be careful, though, I promise.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because he always looks so sad when he thinks I'm sleeping, and if I sneak up quietly I can see whether he smiles when nobody's watching. The Sentinels walk quietly too, so it's good practice for being a Sentinel." } },
      choices = {
        { text = "Better to just ask him. Honest is braver than sneaky.", next = "BACK", reply = "Honest is braver? Then I'll ask him tomorrow, when he's not looking so sad.", fx = { align = { honor = 1 } } },
        { text = "Sneaking's a fine skill. Practise on everyone.", next = "BACK", reply = "Ha! I'll sneak up on Papa first, and then the Sentinels. Don't tell anyone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Yes, please, but only a small one, because Papa will be cross if anything catches fire. Could you make it look like the moon, so it's as if Elune came to visit me?" } },
      choices = {
        { text = "Better ask your papa first. Rules keep you safe.", next = "BACK", reply = "Oh, all right, I'll ask him. But he'll say yes, I think, if it's a small one.", fx = { align = { order = 1 } } },
        { text = "A small light, then, and we won't tell your papa.", next = "BACK", reply = "A secret moon! Oh, thank you, and I won't tell anyone, I promise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_r = {
      lines = {
        { id = "gnr_default", text = "Yes! Is it that you're all really children? Papa says you're not, but you're the same size as me, and you've got a much better hat." },
      },
      choices = {
        { text = "No, but we build machines that walk.", next = "BACK", fx = { affinity = 2 } },
        { text = "It's a secret. Get well and I'll tell you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Yes please, but a short one, because I get sleepy. And can you ask Elune to make the dreams nicer, or the Light, or whoever's listening?" } },
      choices = {
        { text = "I'll pray for you tonight, and every night.", next = "BACK", reply = "Thank you. I think the dreams will be nicer now, maybe.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't fix this. Your papa will, though.", next = "BACK", reply = "Papa will fix it, he always does. But you can still pray, if you want.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Is it like a Sentinel, but with a hammer? I think it means you're brave and you help sick people and fight bad things, and I'd like to be one, if I can't be a hippogryph." } },
      choices = {
        { text = "That's right. We protect people who can't protect themselves.", next = "BACK", reply = "Then I want to be a paladin, if I can't be a hippogryph or a Sentinel. Maybe all three.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Mostly it means fighting. It's not for children.", next = "BACK", reply = "Oh. Well, I'm not a child forever, you know. I'll be grown up soon.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little bit, but only because Papa says the bad dreams come from the same dark place it smells of, somewhere under the lake. Does it have a name? I think things with names are harder to be scared of." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A little bit, because it's looking at me right now and Papa says the bad dreams come from the same dark place demons do. Is that its name, {pet}? It doesn't feel as scary now I know it, but could it please stand behind you anyway?" },
      },
      choices = {
        { text = "You're right to be careful. Things like it are never pets.", next = "BACK", reply = "I knew it! I'll stay far from it, then, even if it has a name.", fx = { align = { light = 1 } } },
        { text = "There's nothing to fear while I hold the leash.", next = "BACK", reply = "Then I'll be brave, if you hold it tight. But please don't let go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_tear", tags = { "news" }, when = { questDone = TODO_QUEST("Elune's Tear") }, text = "Pelturas tells me you went all the way to the isle in Iris Lake for Elune's Tear, and that Orendil's patients rest easier for it. I worry for everyone who goes east of the lake, so I am glad to see you come back whole." },
        { id = "h_default", text = "I'm Relara, and I'm sick, but Papa's fixing it. The dreams are bad, but you're not in them, so that's good." },
        { id = "h_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
          text = "The bad dreams stopped, and now I just dream about honey cakes. Papa says that's normal, but I think it's the best dream there is." },
        { id = "h_sentinel", when = { metBefore = true }, text = "When I'm better, Papa says I can watch the Sentinels practise, and I'm going to be a Sentinel, or a hippogryph, whichever one gets to fly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walked in without making any noise at all! Can you teach me how, so I can sneak up on Papa when I'm better?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Are you a real mage? Papa says magic is dangerous, but I think a tiny bit of light to keep the bad dreams away wouldn't hurt anybody." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "You've got a sword! Papa says I can have one when I'm a Sentinel, but I think he's fibbing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "Are you a hunter? Do you have a beast? Does it bite, or can I pet it, or will Papa get cross?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Are you a priest? Papa says priests make the bad dreams go away, but they always come back after." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "You've got so much armour! Are you a knight? Papa says knights help people, so you must help people too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Are you a druid? Papa says druids can turn into a bear, and I've never seen it, but I promise I won't be scared." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "What's that little thing behind you? Papa says the bad dreams come from somewhere dark, but yours looks too small to cause anything." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Are you a shaman? Can your spirits fly? When I'm better I'm going to be a Sentinel, or a hippogryph, whichever one gets to fly." },
      },
      again = {
        { id = "h_again", text = "Are you still here? Good, then tell me something." },
        { id = "h_again2", text = "Will you stay a little longer? Papa's busy talking to the Sentinels." },
      },
      choices = {
        { text = "You look like you've had bad dreams.", next = "dreams", when = { questBefore = TODO_QUEST("Fallen Sky Lake") } },
        { text = "What's your papa like?", next = "papa" },
        { text = "You seem to like the Sentinels.", next = "sentinels_r" },
        { text = "Would you like to meet my companion?", next = "pet_r", when = { pet = true } },
        { text = "Want to know a secret about gnomes?", next = "gnome_r", when = { race = "Gnome" } },
        { text = "Why do you want to sneak up on your papa?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you like to see a little magic, Relara?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You'd make a fine warrior when you're well, Relara.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you like to be a hunter when you're well, Relara?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you like me to say a prayer for you, Relara?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'm a paladin, Relara. Do you know what that means?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you like to see my bear form, Relara?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Are you scared of my companion, Relara?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must really want to fly, Relara.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Get well soon.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    dreams = {
      lines = { { id = "d_default", text = "Everything's dark and twisty, and something keeps whispering, and I don't like it... can we talk about something else?" } },
      choices = {
        { text = "Of course. Tell me about the Sentinels.", next = "sentinels_r", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Of course. Get some rest.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    papa = {
      lines = { { id = "pa_default", text = "He's the best papa, and he knows everything except how to make the dreams stop. He used to take me to the lake to find moonstones, before the bog monsters came." } },
      choices = {
        { text = "Bog monsters sound frightening.", next = "bog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bog = {
      lines = { { id = "bo_default", text = "Papa says they're called Shadethicket, and they're big and squelchy and they took all the moonstones, so when I'm better I'm going to go and tell them off." } },
      choices = { { text = "I'll tell them off for you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    sentinels_r = {
      lines = { { id = "se_default", text = "They're the bravest people in the whole forest, and they have owls and big cats! Raene's big cat, Korra, looked at me once, and I think she liked me." } },
      choices = { { text = "I'm sure she did.", next = "BACK", fx = { affinity = 1 } } },
    },
    pet_r = {
      lines = { { id = "pe_default", text = "Yes, yes, please! Hello, {pet}, you're very handsome. Do you like honey cakes? Everybody should like honey cakes." } },
      choices = { { text = "{pet} likes you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Relara Whitemoon, and I live in Astranaar with Papa, and I'm going to be a Sentinel when I'm better." } },
    advice = { { id = "tp_ad", text = "Always tell your papa when you have a bad dream, because he'll sit with you until morning." } },
    elune = { { id = "tp_elune", text = "Papa says Elune watches over me at night, so I try to stay awake to see her. I always fall asleep first, but I think she comes anyway." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Somebody told me there's a fair with a carousel and a man who eats fire! When I'm better, I'm going to go and I'm going to eat fire too." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind is the bravest person in the whole world, and she has a big white tiger. When I'm a Sentinel I'm going to have a tiger even bigger." } },
    centaur = { { id = "tp_centaur", text = "Are centaur half horse and half person? Papa won't tell me, so I think it must be true and also scary." } },
    _none = { { id = "tp_none", text = "Papa would know. Papa knows everything except how to make the dreams stop." } },
  },
}

P:NPC {
  key = "faldreas", id = TODO_NPC("Faldreas Goeth'Shael"), name = "Faldreas Goeth'Shael",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "kit", "lock_armor" },
  impression = {
    first = "The best part of his day is crossing off a returned name.",
    third = "{name} met Faldreas Goeth'Shael, who keeps track of every traveller leaving Astranaar and listens to the forest spirits.",
  },

  greetings = {
    { id = "g_road", text = "Ishnu-alah, traveller. The roads out of Astranaar are long and not as safe as they look, so mind them." },
  },

  notice = {
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "The Sentinels at the bridge marked you as you crossed, because a demon's hide over a traveller's shoulders is not a thing they let pass unremarked. I have put it in the record as well, beside your name, as I must." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Too many, between the Warsong, the furbolgs and the demons in the east, and every one is a name I never got to cross off. If your spirits can help bring some home, I'd be glad of them." } },
      choices = {
        { text = "Then cross mine off the right way, Faldreas. I'll return.", next = "BACK", reply = "I will, and gladly. Come back, and I'll cross it the right way.", fx = { align = { order = 1 } } },
        { text = "Your list won't save anyone.", next = "BACK", reply = "No, but it tells me who to mourn, and that's something. Someone has to keep it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I do, though they are the hardest to keep, because they leave in one shape and come back in another. Two of the Circle went toward the Foulweald a month ago, and I have not crossed their names off yet." } },
      choices = {
        { text = "Understood. I'll tell you each time before I leave.", next = "BACK", reply = "Thank you, druid. That's one name I'll worry about a little less.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Druids go where the forest calls. Don't count on my word.", next = "BACK", reply = "Then I'll worry, as I do for the others. It's what the book is for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More of them than scholars, but fewer than I'd like, because warriors go looking for the Warsong instead of hiding from them. I cross off every name that comes back, and I'd very much like to cross off yours." } },
      choices = {
        { text = "Put my name in the book. I'll come back to cross it off.", next = "BACK", reply = "Then I'll write it in my best hand, and I'll look forward to the crossing. Come back.", fx = { align = { order = 1 } } },
        { text = "No names. I come and go as I please.", next = "BACK", reply = "As you like, but I'll not have anything to tell the Sentinels if you don't. Be careful.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because when someone doesn't come back, the first thing the Sentinels ask me is where they were going, and I hate having no answer. The forest spirits can't always tell me, and a name with no road beside it is a name nobody goes out to find." } },
      choices = {
        { text = "Write it down, then. I'll tell you where I'm going.", next = "BACK", reply = "Thank you. You'd be surprised how much that eases my nights.", fx = { align = { order = 1 } } },
        { text = "My roads are my own business, Faldreas.", next = "BACK", reply = "It is, and I'll not pry. But if you don't come back, I'll have nothing to tell anyone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They mind it the way an old hound minds thunder, because they remember the Sundering and they've never quite trusted the arcane since. They've told me nothing bad of you yet, though, and I'll take that as a good sign." } },
      choices = {
        { text = "I'll walk your roads gently, so they've nothing bad to tell.", next = "BACK", reply = "Thank you. They'll notice, and I'll hear of it.", fx = { align = { light = 1 } } },
        { text = "The spirits' memories aren't my concern, Faldreas.", next = "BACK", reply = "Perhaps not, but the roads are theirs, and they talk. I'd mind them, if I were you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet_f = {
      lines = {
        { id = "pf_default", text = "Nobody has ever asked me that. Very well; {pet}, out on the roads with you, and I'll want to see both names come back through this gate, so look after each other." },
      },
      choices = {
        { text = "We always do.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "For the second list, yes, though I keep hoping some of them are only late. If you pray over it, pray that I'm wrong about most of them." } },
      choices = {
        { text = "I'll pray for every name on it, the living and the lost.", next = "BACK", reply = "Thank you. Both lists, then, and I'll keep hoping with you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Names on a list won't feel any prayer.", next = "BACK", reply = "Perhaps not, but I will, and so will their families. Pray for them, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The road south to Mystral Lake, where the orcs from Splintertree come out to cut and the furbolgs come out to kill. Walk it with your eyes open, and come back so I can cross your name off properly." } },
      choices = {
        { text = "I'll walk it, and see others home along it.", next = "BACK", reply = "Thank you. That's the kind of name I like to cross off.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll walk where I please, not where you send me.", next = "BACK", reply = "Then I'll write down wherever you please, and hope it's somewhere safe.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because they remember what the demons did to these woods, both long ago and again not so many years past, when the Legion marched on Hyjal. They'll speak again once you've gone, and I'll still put your name on my list, because a list doesn't care what you've summoned." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because they remember what the demons did to these woods, both long ago and again when the Legion marched on Hyjal. Yours is standing in the middle of my square, and every voice in it has gone silent at once, so I'll write your name on my list and you'll take it out of sight." },
      },
      choices = {
        { text = "They're right to fear it. I'll keep it off the roads.", next = "BACK", reply = "Thank you, and they'll notice it. The forest remembers kindness as long as it remembers harm.", fx = { align = { order = 1 } } },
        { text = "The spirits can keep their silence. What I do is my own.", next = "BACK", reply = "Your craft is your own, and their silence is theirs. Walk carefully all the same.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Faldreas Goeth'Shael. With the forest spirits' help, I keep track of who goes out on the roads and who ought to have come back by now, and since the orcs came, the second list is longer than I'd like." },
        { id = "h_edunes", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "The forest spirits tell me you are brave and willing to travel. Take the Talondeep Path near Mystral Lake into the Stonetalon Mountains, then climb to Stonetalon Peak, where Keeper Albagorm is waiting for you." },
        { id = "h_crossed", when = { metBefore = true }, text = "Three travellers came back yesterday and I crossed them off the list. Crossing names off the right way is the best part of my day." },
        { id = "h_albagorm", when = { questDone = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "Keeper Albagorm sent word that you arrived, and that I'd listened well to the forest spirits. I usually do; they're better at keeping lists than I am." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll be the kind who leaves Astranaar without telling me, I can see it already. Do me a kindness and stop at my gate first, so I know which list to put you on." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage, so I suppose you'll be stepping in and out of the world without ever passing my gate. The forest spirits find that very confusing, and so do I." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Write your name in my book before you go out on the roads, please, so I'll know where to look if you're late." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll know, then, why I keep a second list, the one of those who won't be coming back down the road." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You walk the roads armoured, which gives me some hope I won't be adding your name to my second list." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle. You will walk paths I cannot follow, so tell me when you set out, and I will know where to look if you do not come back." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "The forest spirits went quiet when you came in, and they only do that for one kind of traveller. Write your name in my book all the same, because I keep everyone's." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I keep a list of everyone who goes out on the roads and everyone who should have come back, so tell me, will I cross your name off the right way?" },
      },
      again = {
        { id = "h_again", text = "What else? I've a list to keep." },
        { id = "h_again2", text = "Ask, and then tell me where you're headed next, so I can write it down." },
      },
      choices = {
        { text = "Why keep the list?", next = "list" },
        { text = "The forest spirits speak to you?", next = "spirits" },
        { text = "The roads must go a long way from here.", next = "roads" },
        { text = "I'm a long way from home. Will you remember me?", next = "far", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Put my companion on your list too.", next = "pet_f", when = { class = "HUNTER", pet = { named = true } } },
        { text = "Why does it matter if I slip out unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the forest spirits mind the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors make it back from the roads, Faldreas?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I could say a prayer for the names on your list.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Which road needs a paladin's protection most?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess you keep druids on your list as well, Faldreas.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why do the forest spirits fall quiet around me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many travellers fail to come back, Faldreas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1 } },
      },
    },
    list = {
      lines = {
        { id = "l_remember", text = "Because someone has to remember who went out. If nobody remembers, nobody goes looking, and I would rather be the one who remembers." },
      },
      choices = { { text = "I'll check in when I'm back.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They whisper, mostly, and they aren't always clear, but they told me about you before you arrived. I've learned not to argue with them." } },
      choices = {
        { text = "What do they say about Ashenvale?", next = "spirits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits2 = {
      lines = { { id = "sp2_default", text = "That it's hurting: the furbolgs in the north, the Horde's axes in the east, and Mystral Lake, which has come alive and attacks anyone on the path. I write it all down, like everything else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    roads = {
      lines = { { id = "ro_default", text = "South through the Talondeep Path to Stonetalon, west to Maestra's Post and the coast, and east toward the Horde's camps, which I'd advise against." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    far = {
      lines = { { id = "fa_default", text = "I remember everyone who goes out, whatever their kingdom. Tell me where home is, so I know where to send word if I ever have to." } },
      choices = {
        { text = "Stormwind.", next = "BACK", fx = { affinity = 1 } },
        { text = "Ironforge, under the mountain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Nowhere, these days.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Keeping track of the roads means hearing about everything on them. Ask, and I'll tell you what my lists say." },
    },
    background = { { id = "tp_bg", text = "I keep the list of who's out on the roads. It's a small job, until someone doesn't come back." } },
    advice = { { id = "tp_ad", text = "Tell someone where you're going before you go, and tell me, if there's no one else." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom's off my list, because once someone goes in there, I stop counting days. I count them again when they come back out, if they do." } },
    warsong = { { id = "tp_warsong", text = "The Warsong hold the east, so I mark every road through it in red. Most of my missing names went east." } },
    centaur = { { id = "tp_centaur", text = "Centaur on the southern roads, sometimes, coming up from the Barrens. I add a day to any trip that goes that way." } },
    thrall = { { id = "tp_thrall", text = "Thrall sends his orcs, and I send our scouts, and I keep the list. I'd like a shorter list." } },
    _none = { { id = "tp_none", text = "Raene would know; she knows everything that moves in this forest, and Elune tells her the rest." } },
  },
}

P:NPC {
  key = "kimlya", id = TODO_NPC("Innkeeper Kimlya"), name = "Innkeeper Kimlya",
  bible = "bibles/ashenvale.md", role = "innkeeper", tier = "service",
  communities = { "astranaar" }, temper = { "warm" }, values = { "kind" },
  notices = { "weary", "lock_stones" },
  impression = {
    first = "She sends broth up to a sick child every night.",
    third = "{name} rested at Innkeeper Kimlya's inn on Astranaar's island, a refuge for scouts, healers and weary travellers.",
  },

  greetings = {
    { id = "g_rest", text = "You look worn through, body and spirit both. Rest here a while, and may Elune keep your dreams gentle." },
    { id = "g_home", when = { homeInn = { "Astranaar" } }, text = "Your bed's ready, and the island's quiet tonight; the lake keeps the worst of the forest out." },
    { id = "g_away", when = { away = 14 }, text = "There you are, after {away} away, and thinner than when you left, I'd wager. Sit down and let me bring you something warm before you tell me anything at all." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You carry yourself differently now, as if the road taught you hard lessons while you were gone. I hope it let you rest now and then, because strength without sleep doesn't last." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone came by tonight still smiling about a talk they'd had with you, and smiles have been scarce in Astranaar lately. Thank you for that." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear things over the broth pot, and what I heard today was that someone caught you in an untruth. I won't scold you, but Astranaar is small, and trust here is hard to win twice." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Was it the furbolgs, or the Horde? Never mind; sit down, because whoever it was, they can't reach you in here." },
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "If you need a healthstone in the night, warlock, please use it in your room and not at the hearth, because the older Sentinels would see something stolen. I will keep the fire warm for you either way." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I care for as many as I can, because quiet kindness is what keeps this town together. Your spirits might help it along." } },
      choices = {
        { text = "Quiet kindness is the best kind, Kimlya.", next = "BACK", reply = "It is, and I'm glad you think so. The town needs more of it.", fx = { align = { light = 1 } } },
        { text = "Kindness won't win the war.", next = "BACK", reply = "No, but it might help someone survive it. That's enough for me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When they can, and they eat as if they haven't seen food in a month, which is usually true. The ones back from the Warsong lines don't talk much, so I don't ask, and I just keep the broth hot." } },
      choices = {
        { text = "I'll eat and rest, then back to the line.", next = "BACK", reply = "Eat well, then, and I'll keep the stew warm for your return. Elune guard you.", fx = { align = { order = 1 } } },
        { text = "No rest for me. I'm going straight back.", next = "BACK", reply = "At least take a loaf with you. The line will still be there in an hour.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When they can, and the stags of Ashenvale make the best broth I've ever cooked. Half of what goes up to Relara Whitemoon came in on a hunter's back, so every hunter who walks in here has fed a sick child, whether they knew it or not." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "When they can, and the stags of Ashenvale make the best broth I've ever cooked. Your {pet} is welcome by the kitchen door, where the smells are, because it never pretends it isn't hungry." },
      },
      choices = {
        { text = "I'll bring meat for Relara's broth.", next = "BACK", reply = "Thank you, and she'll be glad of it, even if she never knows who brought it.", fx = { align = { honor = 1 } } },
        { text = "I hunt to sell, not to give away.", next = "BACK", reply = "Fair enough, and I'll buy what you sell. She'll eat either way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Often, because Raene sends a few out to watch the Warsong camps, and they come back hungry and won't tell me a thing. I've learned to feed them first and ask nothing, and they always leave a little extra on the table that way." } },
      choices = {
        { text = "Then I'll tell you what I can, and thank you properly.", next = "BACK", reply = "That's kind of you, and more than most give me. Come in and sit.", fx = { align = { honor = 1 } } },
        { text = "Asking nothing is wise. Rogues remember who's curious.", next = "BACK", reply = "Exactly, and I've never been stabbed in my own kitchen yet. I'll keep it that way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the satyrs out east were kaldorei once, before they bargained with demons, and some of the older Sentinels were alive to see it happen. Your little friend may be harmless, but to them it looks like the start of the same sad road." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because the satyrs out east were kaldorei once, before they bargained with demons, and some of the older Sentinels were alive to see it happen. When they see that thing sitting at your feet by my hearth, they see the start of the same sad road, so I'd ask you to send it away before supper." },
      },
      choices = {
        { text = "Then my companion stays outside, for their sakes.", next = "BACK", reply = "Thank you. The Sentinels will notice, I promise.", fx = { align = { light = 1 } } },
        { text = "Your scouts will have to get used to it.", next = "BACK", reply = "They might, in a few centuries. Please, outside, for now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Whitemoon girl, Relara, and her father almost as much, for he hasn't slept properly in weeks. I send them broth every night, but broth doesn't mend a heart, and you might." } },
      choices = {
        { text = "I'll visit them both before I leave Astranaar.", next = "BACK", reply = "Thank you, truly. The little one will be glad of a new face.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their troubles are their own, Kimlya.", next = "BACK", reply = "They are, and I'll not press you. But a visit costs so little.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough on the island, but the scouts come back fewer than they went out, and everyone here knows it. A paladin on the roads gives folk something to hope for, and hope's been thin here since the last patrol came back two short." } },
      choices = {
        { text = "Then I'll be on the roads, keeping them safe.", next = "BACK", reply = "Then you'll do more good than you know. Every carter who reaches the gate safe tells the whole market about it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hope won't stop the Warsong. Steel will.", next = "BACK", reply = "It will, and so will hope, in its way. Don't scorn it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Only for lighting the hearth when the wood's damp, and the Sentinels would grumble even at that, because the kaldorei remember what came of the arcane at the Well. Still, I had a gnome mage upstairs once who kept the soup warm all night, and I'll not pretend I minded." },
      },
      choices = {
        { text = "The Sentinels are right to be wary. I'll keep my spells outside.", next = "BACK", reply = "Thank you. The Sentinels will see it, and maybe soften a little.", fx = { align = { order = 1 } } },
        { text = "Warm soup is no sin. They'll get used to us.", next = "BACK", reply = "It isn't, and I'd agree with you. But they've a long memory, and you'll find it easier to humour them.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dd_branch = {
      lines = {
        { id = "ddb_default", text = "Glad, and a little ashamed, I think. Anilia was killed within a day's walk of Astranaar and the branch stolen from her, and none of us here could do anything about it. A stranger did what our own Sentinels hadn't the numbers for." },
        { id = "ddb_ne", when = { race = "NightElf" }, text = "Glad, and a little ashamed. Anilia was killed within a day's walk of Astranaar, and it took a kaldorei on the road rather than our own Sentinels to set it right, because Raene has too few of them to spare." },
      },
      choices = {
        { text = "The Sentinels can't be everywhere. Don't blame them.", next = "BACK", reply = "I don't, truly. I only wish the High Priestess would send more of them south, and I say so to anyone who will listen.", fx = { align = { order = 1 } } },
        { text = "Then Astranaar should stop waiting for Sentinels and act.", next = "BACK", reply = "Spoken like someone who has never had to keep an inn full of frightened travellers calm. Still, you're not wrong, and that's what worries me.", fx = { align = { order = -1 } } },
        { text = "Something else, Kimlya.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_branch", tags = { "news" }, when = { questDone = TODO_QUEST("The Branch of Cenarius") }, text = "The Sentinels say you took the Branch of Cenarius back from that satyr Geltharis and laid it in the dryad's hands. Half my common room raised a cup to you last night, and the other half pretended they had known all along." },
        { id = "h_dd_raene", when = { questDone = TODO_QUEST("Raene's Cleansing") }, text = "Raene came in for supper smiling, which she has not done since the furbolgs turned, and she told me you had helped her with something in the woods. She would not say what, but I know that smile, so thank you." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "You look like you have spent more nights at the spirit healer than in a bed, friend. Ashenvale is no gentle forest any longer, so rest here before it takes you again." },
        { id = "o_forsaken_pity", tags = { "news" }, when = { opinion = { topic = "forsaken", stance = "pity" } },
          text = "Word is you pity the Forsaken. Kayneth at Forest Song would call that a warning sign, though with Kayneth everything is a warning sign." },
        { id = "h_default", text = "I am Kimlya, and I keep the inn for scouts, healers, travellers and the occasional lost adventurer. Elune willing, most of them leave in better shape than they came." },
        { id = "h_relara", when = { heardLine = "pelturas.h_default" },
          text = "So Pelturas told you about Relara. I send broth up for her every night, and she doesn't eat it, but he does, and someone has to look after him." },
        { id = "h_sentinel", when = { metBefore = true }, text = "A Sentinel fell asleep at that table last night, sitting up with her spear still in her hand, and I didn't have the heart to wake her." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The lake's black as ink at night, and Astranaar's lanterns float on it. It's the prettiest thing in Ashenvale, and nobody stops to look." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You slipped in past the scouts at the door, and they'll be sulking about it all evening. Sit down before they notice, and I'll bring you something hot." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll give you a room like anyone else, but I'd ask you to leave your companion outside the door. The scouts sleeping upstairs have seen enough of that sort out at Satyrnaar." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and hungry, I'd guess. Sit, and I'll bring broth before you go back out to the Warsong." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and I'd guess your companion is hungrier than you are. Sit, the pair of you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Do sit down, and have some broth, because you'll be called to some sickbed or other before the night's out." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The scouts will be glad to see you, and so am I, though you'll leave mud on my floors like everyone else." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Sit down by the fire, and if the scouts grumble about the arcane, pay them no mind, because they grumble about my soup as well." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Sit down, please. I send broth up to a sick child every night, and I wonder whether your spirits care for the sick as Elune does." },
      },
      again = {
        { id = "h_again", text = "Anything else? Take your time; the fire's lit." },
      },
      choices = {
        { text = "The common room seems glad about the Branch of Cenarius.", next = "dd_branch", when = { questDone = TODO_QUEST("The Branch of Cenarius") } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who stays here?", next = "guests" },
        { text = "Is anyone in town unwell?", next = "relara_k" },
        { text = "I can tend wounds. Do your scouts need a healer?", next = "healer_k", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "It's a long way from Stormwind to here.", next = "far_k", when = { race = "Human" } },
        { text = "You must get a few rogues at your inn, Kimlya.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the warriors from the front come here to rest?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters bring meat for your kitchen, Kimlya?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do the scouts flinch at my companion so?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Somebody in Astranaar must need a priest badly, Kimlya.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Astranaar really feel safe to its people, Kimlya?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you have any use for a mage at your inn, Kimlya?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you care for everyone in Astranaar, Kimlya?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just resting.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Raene's scouts, mostly, when they're back from the Thistlefur hills, and travellers waiting on the hippogryphs. The scouts pay their way in stories as often as in coin." } },
      choices = {
        { text = "Any stories worth hearing?", next = "story" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story = {
      lines = { { id = "st_default", text = "Only the worried kind, lately. The scouts say the Thistlefur grow bolder every month, and nobody laughs at the old jokes quite as much as they used to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    relara_k = {
      lines = { { id = "re_default", text = "The Whitemoon girl, Relara, has a fever that's better some days and worse on others. Her father hardly sleeps, so I make sure he at least eats." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    healer_k = {
      lines = {
        { id = "hk_default", text = "Always, and more than I can manage with bandages and broth. Two of Raene's scouts are upstairs with Thistlefur claw marks that won't close cleanly, and they'd be glad of better hands than mine." },
        { id = "hk_priest", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
          text = "Your Light, in a Sentinel's sickroom? They'd be surprised, and glad, I think. Two of Raene's scouts are upstairs with Thistlefur claw marks that won't close cleanly." },
      },
      choices = {
        { text = "I'll see to them before I sleep.", next = "BACK", reply = "Bless you. They're the two by the window; you can't miss them.", fx = { align = { light = 1 }, affinity = 2, standing = { astranaar = 1 } } },
        { text = "Scouts who get clawed should learn to dodge.", next = "BACK", reply = "They tried, I promise you. The Thistlefur are faster than they look.", fx = { align = { light = -1 }, affinity = -1 } },
      },
    },
    far_k = {
      lines = { { id = "fk_default", text = "So I hear, and you're the third human this month to tell me so. Delgren's paladins come through on their way to Maestra's Post, and they all ask for something they call mutton." } },
      choices = {
        { text = "Do you have any mutton?", next = "far_k2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_k2 = {
      lines = { { id = "fk2_default", text = "No, but I have venison and a good mushroom stew, and the paladins eat both and say grace over them. You may do the same, love, if it makes it taste more like home." } },
      choices = { { text = "Venison it is.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Scouts talk while I bandage them, and I remember more than they think. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep the inn on the island. There's not much more to me than a warm bed and a full pot." } },
    advice = { { id = "tp_ad", text = "Sleep when you can and eat when you can, because between the Warsong and the satyrs, Ashenvale rarely gives you the chance." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Sentinels on leave sometimes talk about sneaking off to the Darkmoon Faire. I tell them to sleep instead, and they never listen." } },
    theramore = { { id = "tp_theramore", text = "Theramore's soldiers come through on their way to the coast now and then. They eat like bears and sleep like stones, and they always leave a coin for the pot." } },
    blackfathom = { { id = "tp_blackfathom", text = "I've nursed more than one scout back from Blackfathom in my beds upstairs. They don't talk much about it, and I don't ask." } },
    elune = { { id = "tp_elune", text = "Elune's moon shines on the lake right outside my door, and on clear nights the whole island glows. It's the best thing I can offer anyone, and it costs me nothing." } },
    _none = { { id = "tp_none", text = "Ask Raene, outside. She'll know, or she'll find out, as the Sentinels always do." } },
  },
}

P:NPC {
  key = "delgren", id = TODO_NPC("Delgren the Purifier"), name = "Delgren the Purifier",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "maestras_post" }, temper = { "earnest" }, values = { "devout", "brave" },
  spiritSensitive = true,
  notices = { "class" },
  impression = {
    first = "Warm and earnest, but I'd not be a warlock near his hammer.",
    third = "{name} met Delgren the Purifier at Maestra's Post, a servant of the Light hunting the Dark Strand cult in Ashenvale.",
  },

  greetings = {
    { id = "g_light", text = "Light keep you, friend! Maestra's Post bids you welcome; it's a long way from home, but there's work for the righteous everywhere." },
    { id = "g_human", when = { race = "Human" }, text = "A human! You've no idea how good that is to see, this far into elf country." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Another servant of the Light, and a paladin at that! We'll trade stories later, but for now there's a cult to stop." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "My hand wants my hammer, friend, and I think you know why. I'll keep it still if you keep yours still too." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest of the Light, out here! Bless you; I've been teaching young Balthule what I know of it, and I could use someone who knows it better." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "It did. I first practised it on the prisoners in the internment camps back home, and the more I understood, the less I liked what we'd done to them. What do you think, friend? Should the Alliance ever have kept the orcs in those camps?" },
      },
      choices = {
        { text = "They were savages. The camps kept us safe.", next = "op_r1", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { orcs = "hard" } } },
        { text = "The camps were cruel, and they made Thrall what he is.", next = "op_r2", fx = { affinity = 1, align = { light = 1 }, opinion = { orcs = "pity" } } },
        { text = "The camps were needed then, but not now.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { orcs = "necessary" } } },
        { text = "The Light forgives orcs, Delgren. So should we.", next = "op_r4", fx = { affinity = 1, opinion = { orcs = "pity", the_light = "mercy" } }, when = { class = "PALADIN" } },
        { text = "I've never given it much thought.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Safe for a while, and very costly, and they gave us Thrall in the end. I'm not sure safe is the word I'd choose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Aye, that's what keeps me up at night. We built the man who leads the Horde, and we built him out of chains." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "A soldier's answer, and probably the one my old commander would have given. The orcs don't remember it so evenly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "The Light forgives faster than the Sentinels do, I've found. Say it too loudly here and they'll think the Silver Hand has gone soft." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I hope so! I purify what's been corrupted, and your spirits might help with that, since we both want the forest healed." } },
      choices = {
        { text = "Then let's heal it together, Delgren.", next = "BACK", reply = "Together, then, with the Light and your spirits sharing the work. I'd like to see the Dark Strand's faces when we do.", fx = { align = { light = 1 } } },
        { text = "The Light should keep to its own work.", next = "BACK", reply = "The Light's work is healing, friend, wherever healing's needed. But I'll not argue with you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I admire them, for they heal the land as surely as we heal the wounded. But they speak of balance where I would speak of evil, and with the Dark Strand nesting in that tower, I'm not sure balance is what's called for." } },
      choices = {
        { text = "The balance is the law of the forest. Respect it here.", next = "BACK", reply = "It is, and I'll respect it while I'm here. But I'll still call the Dark Strand evil.", fx = { align = { order = 1 } } },
        { text = "Balance or not, I'll do whatever the moment needs.", next = "BACK", reply = "Then we'll do what's needed together, and argue about the rest later.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone to hold the tower stairs while my paladins clear the cultists room by room. The Dark Strand fight like cornered rats, and a warrior who holds the stairs is worth more to me than any blessing I could give." } },
      choices = {
        { text = "I'll hold the stairs. Not one gets past.", next = "BACK", reply = "Bless you, friend. I'll be right behind you with the Light, so don't look back.", fx = { align = { honor = 1 } } },
        { text = "I'd rather clear the rooms myself. The glory's inside.", next = "BACK", reply = "The glory's for the Light, not for us. But clear them if you must, and mind the traps.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plenty, because they post lookouts in the ruins around the Tower of Althalaxx, and my paladins clank far too loudly to reach them. Pick them off from the trees, and we'll do the rest with the Light and our hammers." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks steady, and it will need to be, because the Dark Strand call things up from the Void. Keep it close, and the Light keep you both." },
      },
      choices = {
        { text = "I'll give them a chance to surrender first.", next = "BACK", reply = "That's more mercy than they'd give you, but it's the Light's way, and I'm glad you'll take it.", fx = { align = { light = 1 } } },
        { text = "Cultists get no chances. I'll shoot them all.", next = "BACK", reply = "I'll not argue, though I'd rather they'd had the chance. Mind your aim.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They could, because the cult posts lookouts round the Tower of Althalaxx and they always see my lads coming. Get close enough to learn their numbers and I'll bring the Light down on them openly, as it ought to be done." } },
      choices = {
        { text = "I'll count them, and leave the fighting to your hammer.", next = "BACK", reply = "Good, and I'll be grateful for the numbers. The hammer can do the rest.", fx = { align = { honor = 1 } } },
        { text = "Lookouts die quietly. I'll thin them before you arrive.", next = "BACK", reply = "Quietly, then, and I'll not ask how. Just leave me enough to question.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "All the difference in the world, friend, though from a distance it can look the same. Your power comes from study and discipline and theirs comes from the Legion, and I've watched more than one proud mage cross that line thinking he could step back." } },
      choices = {
        { text = "I'll never cross it. Study is enough for me.", next = "BACK", reply = "Good. Study is a noble road, and the Light walks it with you.", fx = { align = { light = 1 } } },
        { text = "A wise mage studies both sides of that line.", next = "BACK", reply = "Study it, then, but never step over it. I've seen too many who did.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_d = {
      big = true,
      lines = {
        { id = "wd_default", text = "I'd guessed what you were, friend, and I've been trying to decide whether to say it. If you can read what they read, you can tell me what they want, but the Light will be watching what you do with the knowing, and so will I." },
      },
      choices = {
        { text = "Read it and burn it. That's my offer.", next = "BACK", reply = "That's an offer I can accept, and gladly. The Light will watch, and so will I.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What I learn from their books is mine.", next = "BACK", reply = "Then the Light will watch you very closely, friend. Be careful what you keep.", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_strand = {
      lines = {
        { id = "dds_default", text = "You have, and I am grateful, but understand what they are. Many were kaldorei once, scholars and seekers who wanted the power the Highborne lost, and they found someone in the dark willing to promise it to them." },
      },
      choices = {
        { text = "Then they chose their fate. They get no mercy from me.", next = "BACK", reply = "They chose it, yes, and I have stopped mourning them. Purifying means burning out the rot, not pitying it.", fx = { align = { light = -1 } } },
        { text = "Some of them might still be brought back.", next = "BACK", reply = "Perhaps one in a hundred, and I would gladly be wrong. Take any who surrender to the Sentinels, and let Elune judge them.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_strand", tags = { "news" }, when = { killed = { name = "Dark Strand", min = 40 } }, text = "The Dark Strand curse your name now, from the Tower of Althalaxx to the ruins of Ashenvale, and I can think of no better praise. Each fanatic you strike down is one less voice calling to whatever waits in that tower." },
        { id = "h_default", key = true,
          text = "I'm Delgren, called the Purifier. Our company came to help the night elves against demons and the walking dead, and instead we found a cult, the Dark Strand, nesting in the old tower to the north. I've even taken up Orcish, because the warlock who teaches them is an orc." },
        { id = "h_tower", tags = { "news" }, when = { questActive = TODO_QUEST("The Tower of Althalaxx") },
          text = "The Dark Strand gather at the Tower of Althalaxx to work their warlock's magic. Balthule keeps watch there and Feero carries word to Auberdine, and I'd be glad of your help with the rest." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies to Auberdine") },
          text = "Feero is carrying supplies and messages to Sentinel Starbreeze in Auberdine. The elves there have been generous to us, and it's time we returned the favour." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky-elves, of all people! I'd heard of you, and the Light shines in strange places these days, which is all the more reason to look for it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Light keep you, friend, though you came up so quietly I nearly greeted you with my hammer. Forgive me, because the Dark Strand have taught us all to jump at shadows." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, out here in elf country, and that's a cheering sight! The Dark Strand work their spells in that old tower, and I'd welcome someone who understands how such magic thinks." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Light bless you, friend, for we've been short of strong arms since the Dark Strand dug in at the tower." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! The Light welcomes you, and so do I, because there are long leagues of forest between us and that tower, and you'll know them better than my paladins." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've learned a good deal about your Circle since I came to Ashenvale, though I'll admit I still don't follow half of it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "The Light's blessing upon you, shaman! I'm a long way from home and glad of any company. Do your spirits bless too?" },
      },
      again = {
        { id = "h_again", text = "What else, friend? The cult won't wait on us." },
        { id = "h_again2", text = "Go on, I'm listening. The Light's in no hurry, even when I am." },
      },
      choices = {
        { text = "I've cut down a lot of Dark Strand cultists.", next = "dd_strand", when = { killed = { name = "Dark Strand", min = 40 } } },
        { text = "Did learning Orcish change how you see the orcs?", next = "op_ask" },
        { text = "Who are the Dark Strand?", next = "strand" },
        { text = "Learning Orcish seems an odd choice for a paladin.", next = "orcish" },
        { text = "How do you find the night elves?", next = "elves_d" },
        { text = "I'm a paladin too. How can I help?", next = "pal_d", when = { class = "PALADIN" } },
        { text = "Your company could use a priest's blessing.", next = "priest_d", when = { class = "PRIEST" } },
        { text = "I know the Dark Strand's craft better than I should. I could read their tomes.", next = "warlock_d", when = { class = "WARLOCK" } },
        { text = "Could someone quiet help you against the Dark Strand?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "My magic is nothing like the Dark Strand's.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does Maestra's Post need from a warrior, Delgren?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a hunter be of use against the Dark Strand?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You seem wary of the Circle's ways, Delgren.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the Light and the spirits get along, Delgren?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Light keep you.", next = "END", fx = { affinity = 1 } },
      },
    },
    strand = {
      big = true,
      lines = {
        { id = "s_default", text = "They're warlocks, hungry for power that should have stayed lost and willing to deal with demons to get it. I've seen what that bargain costs, but they haven't, yet." },
      },
      choices = {
        { text = "Then we stop them.", next = "BACK", reply = "We do, and I'll be glad of the company when we go.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Power is power, and I can't blame them for wanting it.", next = "BACK", reply = "I can, friend, and I do. Power bought from demons is never yours.", fx = { align = { light = -1 } } },
        { text = "Why do people join them?", next = "elves" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "Grief and pride make fools of every people, mine included. I don't judge anyone by their worst; I just stop it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcish = {
      lines = { { id = "o_default", text = "Many in my order scoffed when I chose to learn it, but you cannot beat an enemy whose orders you cannot read. Their writing's little better than a child's scribbles, though it served me well enough with the warlock Ilkrud's notes." } },
      choices = {
        { text = "Only to beat them?", next = "orcish2" },
        { text = "Wise.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    orcish2 = {
      lines = { { id = "o2_default", text = "For now, yes. If there's ever a day when it's good for more than that, I'll be glad I already know the words." } },
      choices = {
        { text = "I hope that day comes.", next = "BACK", reply = "So do I, friend, so do I. Peace has started with less.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd rather learn it to hear what they're plotting before they strike.", next = "BACK", reply = "That's useful too, I'll grant. Listen well, then.", fx = { align = { honor = -1 } } },
      },
    },
    elves_d = {
      lines = { { id = "ed_default", text = "I was unused to their manners at first, I'll admit, but I've grown to respect them greatly as allies. They fight this forest's battles with more patience than we would ever have." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    pal_d = {
      lines = { { id = "pd_default", text = "Then pray with me before you go into the satyrs' country, because their blood-soaked temples unsettle even seasoned fighters. After that, swing hard." } },
      choices = {
        { text = "Let's pray, then.", next = "BACK", reply = "Let's, then, and may the Light guide your hammer. Swing hard.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Save the prayers. I'll trust my hammer in satyr country.", next = "BACK", reply = "As you like, but I'll pray for you anyway, and you can't stop me.", fx = { align = { light = -1 } } },
      },
    },
    priest_d = {
      lines = { { id = "pq_default", text = "We'd be grateful for it. It's been months since anyone but me prayed over these lads, and I'm a better hammer than a priest." } },
      choices = {
        { text = "Then gather them round.", next = "BACK", reply = "Thank you. They'll be glad of it, more than they'll say.", fx = { affinity = 3, align = { light = 2 }, standing = { maestras_post = 1 } } },
        { text = "These lads need sleep more than sermons, so I'll let them rest.", next = "BACK", reply = "Perhaps you're right, and rest is a blessing too. Thank you anyway.", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A paladin in a strange land learns to listen, friend, and I've learned a fair bit here. Ask, and I'll share it." },
    },
    background = { { id = "tp_bg", text = "I'm a paladin a long way from home, with a company that came to help our allies. That's all there is that matters." } },
    advice = { { id = "tp_ad", text = "If you meet a warlock in these woods, assume he isn't alone." } },
    dark_strand = {
      { id = "tp_strandnext", text = "They're the cult at the Tower of Althalaxx. Ask, and I'll tell you what I know.", next = "strand" },
      { id = "tp_strand", text = "They're warlocks who think demons will keep their bargains. They're always wrong about that." },
    },
    holy_light = {
      { id = "tp_holy_light", text = "The Light brought me across the sea to stand with allies who never asked for it, and it's served me well here. The Sentinels pray to their moon and I pray to my Light, and we both pray for the same things." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You walk the Light too, so you'll know the strength it gives when you're far from home. Lean on it, and lean on the elves as well; they're braver than they let on." },
    },
    silver_hand = { { id = "tp_silver_hand", text = "The Silver Hand was broken when Lordaeron fell, but its oaths weren't. My company holds to them, though we answer to Stormwind now and not to Uther." } },
    scourge = { { id = "tp_scourge", text = "My company was formed to fight the dead, and we came here because the Legion's taint brings them in its shadow. I've seen what they did to Lordaeron, and I'll not let it happen to this forest." } },
    thrall = {
      { id = "tp_thrall", text = "I learned Orcish, over my superiors' frowns, and I've spoken with orcs who honour Thrall with their whole hearts. That doesn't stop the Warsong, but it reminds me there are people under the war paint." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "I speak your tongue, and I respect your warchief more than my superiors would like. Your Warsong still need to leave this forest alone." },
    },
    stratholme = { { id = "tp_stratholme", text = "The paladins who were at Stratholme don't speak of it, and the dead hold the city still. I'd rather not say more, if it's all the same to you." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar commands Stormwind's armies while the king is missing. He's a good paladin and a better man, and I'm proud to answer to him." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but I'll pray on it, and that's a start." } },
  },
}
