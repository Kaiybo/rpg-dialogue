-- Elwynn Forest folk who exist only in World of Warcraft: Forever: Blixie Fitzwink (Tower of Azora),
-- Josephine Carson (Goldshire hunters), Nordun Steadysight (Goldshire, guns and bows), Kelsey Fargo
-- (Echo Ridge Mine), Nancy Songflower and Riley Peltskinner (Northshire's junior trainers),
-- Tordrin Sternblade (Northshire hunters) and Ormin Pelford (below Eastvale).
-- Voices: bibles/elwynn_forever.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Blixie Fitzwink: gnome servant of Theocritus, robbed by gnolls on the road.
---------------------------------------------------------------------------
P:NPC {
  key = "blixie", id = TODO_NPC("Blixie Fitzwink"), name = "Blixie Fitzwink",
  bible = "bibles/elwynn_forever.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "anxious" }, values = { "loyal", "curious" },
  notices = { "class", "race" },
  impression = {
    first = "Blixie Fitzwink is one of Theocritus's gnome servants, small and singed and very worried about her master's temper. Gnolls took a parcel from her on the road, and she fears the punishment more than she feared the gnolls.",
    third = "{name} met Blixie Fitzwink, a gnome servant of the Tower of Azora who lost her master's parcel to gnolls.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Oh, you're not a gnoll, thank goodness. Sorry, I'm still jumping at every rustle in the bushes." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I'm still here, as you can see, and not yet turned into anything with feathers." },
    { id = "g_active", when = { questActive = TODO_QUEST("Stolen Enchanting Supplies") }, text = "Did you find the supplies? Please say you found at least some of them, because the Master counts everything twice." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stolen Enchanting Supplies") }, text = "It's my rescuer! Every time the Master opens one of those jars I think of you and say a little thank you." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Please don't polymorph me, I've had a very long day and I've only just stopped feeling like a sheep from the last time." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome, out here among all these trees! It's lovely to talk to someone at a sensible height for once." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Blixie Fitzwink, in service to Master Theocritus of the tower just up the hill. I'm usually inside sweeping up after his experiments, but today I'm out here having the worst afternoon of my life." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Stolen Enchanting Supplies") },
          text = "The Master sent me down for a parcel of enchanting supplies, and on the way back a whole pack of gnolls jumped out at me. I dropped everything and ran, and I'm not proud of it, but I'm not a gnoll's supper either." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Stolen Enchanting Supplies") },
          text = "The gnolls dragged the supplies off to their camps around Stone Cairn Lake. Five pieces, all told, and the Master knows exactly how many there should be." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Stolen Enchanting Supplies"), days = 3 } },
          text = "I carried the parcel up to the top floor and the Master didn't even look up from his book, which is the nicest thing he's done all week. No mopping duty for Blixie!" },
        { id = "h_done", when = { questDone = TODO_QUEST("Stolen Enchanting Supplies") },
          text = "Everything's back on the shelves where it belongs, and I've started taking the long way round the lake, past the farms, where there are fewer bushes for gnolls to hide in." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "You'll understand better than anyone why a gnome takes work in a human wizard's tower. When your own city's full of poison and troggs, a damp tower in Elwynn feels like a palace." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no hurry to go back up those stairs, honestly." },
        { id = "h_again2", text = "Ask away! Talking takes my mind off the gnolls." },
      },
      choices = {
        { text = "What happened to your supplies?", next = "ambush" },
        { text = "What's this about cleaning up after experiments?", next = "experiments" },
        { text = "What's it like, serving Theocritus?", next = "master" },
        { text = "Why does a gnome work out here?", next = "gnomes" },
        { text = "I'll find your supplies.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Stolen Enchanting Supplies") } },
        { text = "I've got your supplies here.", next = "BUSINESS", when = { questActive = TODO_QUEST("Stolen Enchanting Supplies") } },
        { text = "Mind the bushes, Blixie.", next = "END" },
      },
    },

    ambush = {
      lines = {
        { id = "am_default", text = "I was nearly home with the parcel tucked under my arm when they came out of the brush, four or five of them, snarling and waving clubs. I threw the whole thing in the air and ran the other way, and they were so busy squabbling over it that nobody chased me." },
      },
      choices = {
        { text = "Why would gnolls want enchanting supplies?", next = "ambush_why" },
        { text = "You did right to run.", next = "ambush_ran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_why = {
      lines = {
        { id = "aw_default", text = "They don't, I'm sure of it! They can't read a label and they'd eat the dust if you let them. They just grab anything that shines or rattles and carry it back to their camps, and some of those jars rattle beautifully." },
        { id = "aw_done", when = { questDone = TODO_QUEST("Stolen Enchanting Supplies") }, text = "They didn't, as it turned out; you found the jars thrown about their camps like toys. I hope one of them licked the arcane dust and spent the night hiccuping sparks." },
      },
      choices = {
        { text = "Gnolls are getting bolder all over Elwynn.", next = "gnolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls = {
      lines = {
        { id = "gn_default", text = "They are! The farmers say they used to keep to the hills, and now they're down by the lake and the road like they own it. With the soldiers off in Westfall and Redridge, there's nobody left to tell them otherwise." },
      },
      choices = {
        { text = "Stormwind should send soldiers back to guard its roads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Folk out here should arm themselves, not wait for Stormwind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_ran = {
      lines = {
        { id = "ar_default", text = "That's what I keep telling myself! A gnome against five gnolls isn't a battle, it's a snack. Still, I keep thinking a braver servant would have held on to the parcel." },
      },
      choices = {
        { text = "A braver servant would be dead. You're alive.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "You were trusted with it. You should have held on.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },

    experiments = {
      lines = {
        { id = "ex_default", text = "The Master's apprentices practise polymorphing each other, and then something goes wrong, and then there's a sheep in the library who used to be called Edmund. Somebody has to clean up after the sheep, and when I'm in trouble, that somebody is me." },
      },
      choices = {
        { text = "That's a cruel punishment.", next = "experiments_cruel" },
        { text = "Does it ever wear off wrong?", next = "experiments_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    experiments_cruel = {
      lines = {
        { id = "ec_default", text = "Oh, it's not cruel exactly, it's just very, very messy. Sheep can't hold their dinners in, and neither can frogs, and a pig once got into the flour store and there was no saving the flour." },
      },
      choices = {
        { text = "A master who'd punish you that way doesn't deserve you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Mistakes cost something. That's how the tower runs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    experiments_wrong = {
      lines = {
        { id = "ew_default", text = "Not that I've seen, though one fellow came back with a craving for clover that lasted a week. The Master says it's perfectly safe, and he says it in the voice he uses when he isn't really listening." },
        { id = "ew_mage", when = { class = "MAGE" }, text = "You'd know better than me, I suppose! Does it hurt, being the sheep? Edmund says it doesn't, but he also keeps sniffing at the hedges." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    master = {
      lines = {
        { id = "ms_default", text = "He's very clever and very busy, and he forgets we're there until something needs fetching or scrubbing. He watches something far off through his instruments, an old enemy of his, I think, but he doesn't talk to servants about it." },
      },
      choices = {
        { text = "What enemy is he watching?", next = "master_enemy" },
        { text = "Is he kind to you?", next = "master_kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_enemy = {
      lines = {
        { id = "me_default", text = "I only hear bits through the door, mind. There's a wizard out in Redridge who went bad, Morganth, and the Master says keeping an eye on him is his duty. I keep my eyes on the floor, which is safer." },
      },
      choices = {
        { text = "I might pay this Morganth a visit someday.", next = "BACK", fx = { learn = { "morganth" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_kind = {
      lines = {
        { id = "mk_default", text = "Kind in his way, I suppose. He's never raised his voice, and he once gave me a whole afternoon off because I'd stopped a fire in the alchemy room. He just never asks where any of us came from, and I've stopped expecting him to." },
      },
      choices = {
        { text = "Then you should ask more of him.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnomes = {
      lines = {
        { id = "gs_default", text = "There's a few of us at the tower, all gnomes. After Gnomeregan, a lot of us went looking for work wherever there was a roof and a wage, and a wizard's tower is about as close to home as Elwynn gets.", fx = { learn = { "gnomeregan" } } },
        { id = "gs_gnome", when = { race = "Gnome" }, text = "You know how it was. Half of us went to Ironforge and the other half scattered, and I ended up here, sweeping a human's floors and missing the noise of real machines." },
      },
      choices = {
        { text = "Will you go back when Gnomeregan is retaken?", next = "gnomes_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_back = {
      lines = {
        { id = "gb_default", text = "When, you say, and not if. I like that. I think I'd go back the very day they open the gates, even if it meant scrubbing the whole city clean with my own toothbrush." },
      },
      choices = {
        { text = "Gnomeregan will be yours again. I'm sure of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some places are lost for good. Make your home here.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Gnomeregan first, then the road, then the tower. I've been a servant here long enough to know which stairs creak." } },
    advice = { { id = "tp_ad", text = "If you ever carry anything for a wizard, hold on tighter than I did, and take the long way round the lake." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask the Master, if you can get him to look up from his books, which you can't." } },
  },
}

---------------------------------------------------------------------------
-- Josephine Carson: Goldshire's hunter trainer, sharp with anyone who isn't a hunter.
---------------------------------------------------------------------------
P:NPC {
  key = "josephine_carson", id = TODO_NPC("Josephine Carson"), name = "Josephine Carson", title = "Hunter Trainer",
  bible = "bibles/elwynn_forever.md", role = "trainer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "practical", "proud" },
  notices = { "pet", "class" },
  impression = {
    first = "Josephine Carson trains hunters in Goldshire and has no patience for anyone who isn't one. She judges a person by how they'd handle a bow, and she says so to their face.",
    third = "{name} met Josephine Carson, Goldshire's sharp-tongued hunter trainer.",
  },

  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Greetings, hunter. Come to learn, or come to show me what you've already learned?" },
    { id = "g_other", when = { ["not"] = { class = "HUNTER" } }, text = "Sorry, you don't look like you could fully draw a longbow, nor load a musket. I teach real hunters." },
    { id = "g_tame", when = { class = "HUNTER", questActive = TODO_QUEST("Taming the Beast") }, text = "Well? Did the beast take the rod, or did it take a piece of you?" },
    { id = "g_pet", when = { class = "HUNTER", pet = { type = "Beast" } }, text = "There's {pet}, and there's you. Let me see which of you is better fed." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} looks healthy and sure of itself. That's your doing, and I'll say it once, so enjoy it." },
    { id = "n_dwarf", cat = "class", when = { class = "HUNTER", race = "Dwarf" },
      text = "A dwarf hunter. Your folk taught half the hunters in this kingdom to shoot straight, so there's little I can show you about a rifle." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Josephine Carson. I teach hunters, which is to say people who can read a track, keep a beast's trust and hit what they aim at. If that's not you, I'm not sure what I can do for you." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Hunting in Elwynn's no small thing anymore, with wolves on every hillside and gnolls in the hills. I'll make sure you're ready for both, and for whatever's waiting past Goldshire." },
        { id = "h_tame_before", when = { class = "HUNTER", questBefore = TODO_QUEST("Taming the Beast") },
          text = "You're ready to take a beast of your own, I think, or near enough. There's a way to do it, and it starts with a rod and a great deal of patience." },
        { id = "h_tame_active", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("Taming the Beast") },
          text = "Use the rod, hold your nerve, and don't let the creature see you're afraid of it. Once it settles, you'll feel it, and then send it off and come back to me." },
        { id = "h_training", tags = { "news" }, when = { class = "HUNTER", questDone = TODO_QUEST("Taming the Beast") },
          text = "You've tamed three beasts now, each harder than the last, and you're still in one piece. The next lesson is about keeping one, and that's where Training the Beast comes in." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; I've a pupil coming at the hour." },
        { id = "h_again2", text = "Go on, then. I'm listening." },
      },
      choices = {
        { text = "What makes someone a real hunter?", next = "real" },
        { text = "Tell me about taming a beast.", next = "taming", when = { class = "HUNTER" } },
        { text = "Why so hard on people who aren't hunters?", next = "hard", when = { ["not"] = { class = "HUNTER" } } },
        { text = "What hunts in Elwynn these days?", next = "elwynn" },
        { text = "How did you come to teach in Goldshire?", next = "goldshire" },
        { text = "What do you think of my {pet}?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "I'd like to train.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    real = {
      lines = {
        { id = "re_default", text = "Patience first, then eyes, then aim, and most people have it backwards. Any fool can loose an arrow, but a hunter knows where the deer will be before it does, and lets it walk there." },
        { id = "re_hunter", when = { class = "HUNTER" }, text = "You know already, or you'd not be wearing that quiver. Patience first, then eyes, then aim, and the beast at your side keeps you honest about all three." },
      },
      choices = {
        { text = "And the beast? Where does it fit?", next = "real_beast" },
        { text = "A hunter feeds people. That's what makes one real.", next = "real_feed", fx = { align = { light = 1 } } },
        { text = "A hunter kills cleanly. Nothing more to it.", next = "real_feed", fx = { align = { light = -1 } } },
      },
    },
    real_beast = {
      lines = {
        { id = "rb_default", text = "Beside you, never behind you and never in front. A beast that leads will get you killed and a beast that trails behind will leave you, but one that walks beside you will die for you, so you'd better be worth it." },
      },
      choices = {
        { text = "That's a heavy thing to owe an animal.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    real_feed = {
      lines = {
        { id = "rf_default", text = "Both, and don't let anyone tell you otherwise. The meat on the Lion's Pride's table came off a hunter's line, and the wolf that didn't take a farmer's lamb this spring was a hunter's work as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    taming = {
      lines = {
        { id = "ta_default", text = "There are three to learn on, each one harder than the last, and you tame them, feel them settle, and let them go again. It's a lesson, not a collection, so don't get attached to the first thing with fur." },
        { id = "ta_done", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "You've done it three times now, and you've learned how a beast's will bends without breaking. Keeping one is the next thing, and that's a longer lesson than the taming." },
      },
      choices = {
        { text = "Why let them go again?", next = "taming_go" },
        { text = "What if it turns on me?", next = "taming_turn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taming_go = {
      lines = {
        { id = "tg_default", text = "Because a hunter's first beast should be chosen, not grabbed. Taming three teaches your hands what to do, and then when you find the one you mean to keep, you'll not fumble it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    taming_turn = {
      lines = {
        { id = "tt_default", text = "Then you weren't ready, and you'll have learned something the hard way, as most of us do. Every hunter I know has a scar from that lesson, and I've two." },
      },
      choices = {
        { text = "I'll take the risk. Fear never trained anything.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll go carefully and do it your way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },

    hard = {
      lines = {
        { id = "hd_default", text = "Because I get farmhands and tavern boys in here every week wanting to be hunters for an afternoon, and they waste my time and frighten the animals. If you've another trainer, go and see them; they'll teach you better than I would." },
      },
      choices = {
        { text = "That's rude to people who only want to learn.", next = "hard_rude" },
        { text = "Fair. Your time is your own.", next = "BACK" },
      },
    },
    hard_rude = {
      lines = {
        { id = "hr_default", text = "It is, and I'll not apologise. Hunting badly gets people hurt, and a little rudeness at my door costs nobody anything but their pride." },
      },
      choices = {
        { text = "Being plain with people is a kindness.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A little courtesy would cost you nothing either.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },

    elwynn = {
      lines = {
        { id = "el_default", text = "Wolves, mostly, prowlers and timber wolves both, and they've grown bold since the patrols thinned out. Boars in the woods, bears up north, and gnolls in the west hills who'd hunt you back if they got the chance." },
      },
      choices = {
        { text = "Why have the wolves grown bold?", next = "elwynn_wolves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elwynn_wolves = {
      lines = {
        { id = "ew_default", text = "Nobody's culling them. The soldiers went off to Westfall and Redridge and the farmers can't spare the time, so the packs get bigger every season. Marshal Dughan posts bounties, and the bounties don't stop them." },
      },
      choices = {
        { text = "Then I'll thin the packs myself.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    goldshire = {
      lines = {
        { id = "gs_default", text = "I grew up on the edge of the forest, shooting rabbits for the pot, and I never wanted to do anything else. When Goldshire needed someone to teach the young hunters coming through, I was the one standing nearest with a bow." },
      },
      choices = {
        { text = "Do you miss hunting for yourself?", next = "goldshire_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goldshire_miss = {
      lines = {
        { id = "gm_default", text = "Every day there's sun on the hills. But I'd rather put a hundred hunters into the world than take a hundred deer out of it, and that's the trade I made." },
      },
      choices = {
        { text = "That's a good trade.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pet = {
      lines = {
        { id = "pt_default", text = "Good weight, bright eyes, and it watches me without fear or fuss. You've been feeding {pet} properly, and I can tell you've not been too proud to let it rest." },
      },
      choices = {
        { text = "{pet} has saved my life more than once.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born at the forest's edge, raised on rabbit stew, and teaching hunters in Goldshire since I was old enough to be listened to." } },
    advice = { { id = "tp_ad", text = "Let the animal come to you. Most hunters who go home empty went chasing." } },
    _none = { { id = "tp_none", text = "That's no business of a hunter's, so it's no business of mine. Ask at the inn." } },
  },
}

---------------------------------------------------------------------------
-- Nordun Steadysight: a dwarf selling guns, bows and shot in Goldshire.
---------------------------------------------------------------------------
P:NPC {
  key = "nordun", id = TODO_NPC("Nordun Steadysight"), name = "Nordun Steadysight", title = "Traveling Ranged Weapon Salesman",
  bible = "bibles/elwynn_forever.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "jovial" }, values = { "proud", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Nordun Steadysight is a travelling dwarf who sells guns, bows and shot out of Goldshire. He talks about a blunderbuss the way other men talk about their sweethearts.",
    third = "{name} met Nordun Steadysight, a dwarf selling guns and bows on the road through Goldshire.",
  },

  greetings = {
    { id = "g_default", text = "Bows, guns, arrows an' shot! Step up, friend, an' have a look at somethin' that'll keep the wolves honest." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Run out o' shot already? That's the sign of a busy {class}, that is." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Now there's a customer who knows the difference between a good barrel an' a bad one." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ah, one o' my own! Ye'll know Ironforge steel when ye see it, so I'll not insult ye with the sales talk." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", race = "Human" },
      text = "A human hunter, an' a young one at that. When I was a lad your folk hardly ever kept a beast at their side, an' now look at ye all." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Nordun Steadysight, travellin' salesman, at yer service! Bows from the shortbow up, a blunderbuss or two, an' enough arrows an' shot to see ye clear to Westfall and back." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Now then, a hunter needs three things: a good weapon, plenty o' ammunition, an' somewhere to keep it. I sell all three, which is a fine coincidence." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ye've come a long way from the mountain an' so have I. Elwynn's a pleasant place, but the ale's thin an' nobody knows how to clean a barrel." },
      },
      again = {
        { id = "h_again", text = "Anythin' else I can do ye for?" },
        { id = "h_again2", text = "Aye? What else, friend?" },
      },
      choices = {
        { text = "Gun or bow: which should I carry?", next = "gunbow" },
        { text = "Why sell out here and not in Ironforge?", next = "road" },
        { text = "Who buys guns in Goldshire?", next = "buyers" },
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Not today, Nordun.", next = "END" },
      },
    },

    gunbow = {
      lines = {
        { id = "gb_default", text = "Well, I'm a dwarf, so ye know what I'll say. A gun makes a noise that tells every wolf in the valley ye mean business, an' a blunderbuss'll stop a boar in its tracks. A bow's quieter, mind, an' cheaper to feed." },
        { id = "gb_nelf", when = { race = "NightElf" }, text = "Oh, I know what yer people think o' guns. Noisy, smoky, an' all that. But I'll wager ye a silver ye'd come round to a blunderbuss if ye ever fired one." },
      },
      choices = {
        { text = "A bow is the honest weapon. Guns are for show.", next = "gunbow_argue", fx = { align = { order = -1 } } },
        { text = "A gun is the future. Bows belong to the past.", next = "gunbow_argue", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gunbow_argue = {
      lines = {
        { id = "ga_default", text = "Ha! Ye'll start a brawl sayin' that in any tavern from here to Thelsamar. I sell both, so I'll love ye whichever way ye choose, as long as ye pay." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    road = {
      lines = {
        { id = "ro_default", text = "Because Ironforge has a gunsmith on every corner an' Goldshire has me. Every young fighter headin' south or west comes through this crossroads, an' most of 'em have never held a proper weapon in their lives." },
      },
      choices = {
        { text = "Do you miss the mountain?", next = "road_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_miss = {
      lines = {
        { id = "rm_default", text = "I miss the Stonefire Tavern an' the sound o' the Great Forge, aye. But the sun's warm down here, an' the coin's good, an' my brothers back home would only make me sweep the shop." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = {
        { id = "bu_default", text = "Hunters, mostly, an' farmers with wolves at the fence. I've had a few nervous types with red scarves in their pockets askin' for shot, too, an' I sent them off without sellin' a thing." },
      },
      choices = {
        { text = "You did right turning the Defias away.", next = "buyers_defias", fx = { learn = { "defias" } } },
        { text = "Coin is coin. Why turn them away?", next = "buyers_defias" },
      },
    },
    buyers_defias = {
      lines = {
        { id = "bd_default", text = "Because I'll not have my guns pointed at the folk who buy my guns, that's why. Business is business, but a dwarf has his limits, an' I'll not arm bandits." },
      },
      choices = {
        { text = "Some of them are just hungry men.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Bandits are bandits. You chose well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge born, raised in a gunsmith's shop, an' on the road with a cart o' barrels since I could grow a proper beard." } },
    advice = { { id = "tp_ad", text = "Keep yer powder dry an' yer arrows straight. The rest is just aimin'." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. Ask me about a barrel an' I'll talk till sundown." } },
  },
}

---------------------------------------------------------------------------
-- Kelsey Fargo: junior mining trainer at Echo Ridge, fed up with kobolds.
---------------------------------------------------------------------------
P:NPC {
  key = "kelsey_fargo", id = TODO_NPC("Kelsey Fargo"), name = "Kelsey Fargo", title = "Junior Mining Trainer",
  bible = "bibles/elwynn_forever.md", role = "trainer", tier = "quest",
  communities = { "northshire" }, temper = { "brisk" }, values = { "hardworking", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Kelsey Fargo teaches mining at the mouth of Echo Ridge Mine and can't get a day's work done for the kobolds. She is brisk, dusty and much more interested in the rock than in the people who stop to talk.",
    third = "{name} met Kelsey Fargo, a junior mining trainer cursing the kobolds at Echo Ridge Mine.",
  },

  greetings = {
    { id = "g_default", text = "Blast these kobolds. I can't get any work done with them running back and forth, getting in my way." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still no kobolds on your heels, which makes you better company than most." },
    { id = "g_miner", when = { profession = "Mining" }, text = "There's a miner, I can see it in your knuckles. Come to learn something new?" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Your pick's been used, and properly, by the look of the edge. You'd be amazed how many come to me with a pick still shiny from the shop." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at my mine! Go on, look at the seam and tell me what I'm doing wrong. Every dwarf who comes by does." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Kelsey Fargo, junior mining trainer, and I'd be a senior one by now if I could get into my own mine. Well, I've got nothing better to do: would you like to learn about mining, or do you just need new tools?" },
        { id = "h_consult", tags = { "news" }, when = { questActive = TODO_QUEST("Mining Consultant") },
          text = "Somebody sent you to consult, did they? Good, because I've been wanting a second pair of hands out here for weeks." },
        { id = "h_big_before", when = { questDone = TODO_QUEST("Mining Consultant"), questBefore = TODO_QUEST("The Big Picture") },
          text = "Now you've seen the mine up close, I've a bigger job in mind for you, if you're willing. It's about the whole ridge and not just one seam." },
        { id = "h_big_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Big Picture") },
          text = "How's that job I gave you coming along? Don't rush it; I want it right, not quick." },
        { id = "h_big_done", when = { questDone = TODO_QUEST("The Big Picture") },
          text = "Thanks to you I can see the whole of it now, the ridge and the seams and where the kobolds are tunnelling. That's the first proper plan this mine has had in a year." },
      },
      again = {
        { id = "h_again", text = "What else? I've a seam waiting, kobolds permitting." },
        { id = "h_again2", text = "Go on, I'm listening, though I'm watching the tunnel too." },
      },
      choices = {
        { text = "What's the trouble with the kobolds?", next = "kobolds" },
        { text = "What's worth digging in Echo Ridge?", next = "ore" },
        { text = "How does someone become a mining trainer?", next = "trade" },
        { text = "What's this bigger job of yours?", next = "big", when = { questDone = TODO_QUEST("Mining Consultant") } },
        { text = "Teach me something about mining.", next = "BUSINESS" },
        { text = "Good luck with your kobolds.", next = "END" },
      },
    },

    kobolds = {
      lines = {
        { id = "ko_default", text = "They're everywhere inside, and they've taken to the tunnels like they own them. Some of them dig, some of them guard the ones who dig, and every one of them yells about candles if you get near." },
        { id = "ko_done", when = { questDone = TODO_QUEST("Investigate Echo Ridge") }, text = "You've been inside, so you've seen them, hundreds of the little rats with candles on their heads. The Abbey sends recruits, and the recruits come out bloodied, and still the kobolds keep digging." },
      },
      choices = {
        { text = "Why do they want the mine so badly?", next = "kobolds_why" },
        { text = "Can't the Abbey clear them out?", next = "kobolds_abbey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds_why = {
      lines = {
        { id = "kw_default", text = "I wish I knew. They pick at the walls like they're after something, but they've no idea what copper's worth. If you ask me, they just like being underground and hate anybody else being there." },
      },
      choices = {
        { text = "Then they've as much right to the dark as anyone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Vermin don't get rights. Clear them out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds_abbey = {
      lines = {
        { id = "ka_default", text = "They try. Marshal McBride sends new recruits up every day, and they kill a few and the rest come back the next morning. It's like bailing out a boat with a spoon.", fx = { learn = { "kobolds" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    ore = {
      lines = {
        { id = "or_default", text = "Copper, good copper, and the odd vein of tin if you know where to look. It's not Ironforge, but it's honest stone, and Stormwind's smiths need every bar they can get." },
        { id = "or_miner", when = { profession = "Mining" }, text = "Copper, mostly, in green streaks you'll learn to spot from across a cave. Bring it out, smelt it, and you'll have bars for any smith in Elwynn, and enough left for your own pocket." },
      },
      choices = {
        { text = "Who buys the copper?", next = "ore_buy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_buy = {
      lines = {
        { id = "ob_default", text = "Smiths in Goldshire and Stormwind, and the Abbey's own smith in a pinch. Stormwind's still rebuilding, and a city that size eats metal like a furnace eats coal." },
      },
      choices = {
        { text = "Then miners should be well paid.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    trade = {
      lines = {
        { id = "tr_default", text = "You dig until your back gives out and then you teach others to dig. I'm not that old yet, but I've done enough of it to call myself a junior trainer, and the kobolds keep me from doing any more." },
      },
      choices = {
        { text = "Would you rather be digging than teaching?", next = "trade_rather" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_rather = {
      lines = {
        { id = "tra_default", text = "Every day. Teaching's good work, but there's nothing like the sound of a pick biting into a fresh seam. One day I'll have this mine back and I'll do both." },
      },
      choices = {
        { text = "Teaching others matters more than digging yourself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Go dig, then. Let someone else teach.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    big = {
      lines = {
        { id = "bg_default", text = "I can't plan anything for this mine while I'm only seeing it a tunnel at a time. I need someone to look at all of it for me, and you've already shown you can keep your head in there." },
        { id = "bg_done", when = { questDone = TODO_QUEST("The Big Picture") }, text = "You did it already, and I've got it all laid out now. When the kobolds are gone, I'll know exactly where to start digging." },
      },
      choices = {
        { text = "Why not do it yourself?", next = "big_why" },
        { text = "I'll do it.", next = "BUSINESS", when = { questBefore = TODO_QUEST("The Big Picture") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big_why = {
      lines = {
        { id = "bw_default", text = "Because last time I went past the first bend, a kobold with a candle on its head hit me on the knee with a pick, and I limped for a week. I know rock, not fighting." },
      },
      choices = {
        { text = "Then I'll do the fighting for you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Miner's daughter from the hills above Goldshire. I had a pick in my hands before I had boots that fit." } },
    advice = { { id = "tp_ad", text = "Mine the vein, not the wall. You'll save your arms and your temper." } },
    _none = { { id = "tp_none", text = "If it's not in the rock, I don't know about it. Ask somebody who sees daylight more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Nancy Songflower: Northshire's junior herbalism trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "nancy_songflower", id = TODO_NPC("Nancy Songflower"), name = "Nancy Songflower", title = "Junior Herbalism Trainer",
  bible = "bibles/elwynn_forever.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "cheerful" }, values = { "kind", "curious" },
  notices = { "craft" },
  impression = {
    first = "Nancy Songflower teaches herb-picking in Northshire Valley and seems to know every flower in it by name. She is cheerful company, as long as you don't step on anything.",
    third = "{name} met Nancy Songflower, Northshire's cheerful junior herbalism trainer.",
  },

  greetings = {
    { id = "g_default", text = "Hello there! Mind the peacebloom by your boot, please; it's only just come up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The silverleaf's coming in nicely by the vineyard, if you've been looking." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "An herbalist! I can smell the earthroot on your gloves from here." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been picking, I can tell, and you've left the roots in, which is more than most beginners manage." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy", ["not"] = { profession = "Herbalism" } },
      text = "An alchemist who doesn't pick their own herbs? You'll pay double at every market from here to Stormwind, you know." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Nancy Songflower, and I teach the young ones how to pick herbs without ripping up the whole hillside. Northshire's a lovely place to learn, too, with peacebloom and silverleaf all over the valley." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! I've always wanted to ask one of your kind whether the plants really talk to you, or whether that's just a story the Brothers tell." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm happy to chat while I sort these." },
        { id = "h_again2", text = "Go on, I love a question." },
      },
      choices = {
        { text = "What grows here in Northshire?", next = "herbs" },
        { text = "How do I pick without ruining the plant?", next = "picking" },
        { text = "Do the plants really talk to you?", next = "druid", when = { class = "DRUID" } },
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Good day, Nancy.", next = "END" },
      },
    },

    herbs = {
      lines = {
        { id = "hb_default", text = "Peacebloom, with the little white petals, and silverleaf, which shines when the light catches it. Earthroot grows under the trees, if you dig a little, and the Brothers use all three for their salves." },
      },
      choices = {
        { text = "Do the Brothers buy from you?", next = "herbs_brothers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_brothers = {
      lines = {
        { id = "hbb_default", text = "Sometimes, when the recruits come back from the kobold mine all scraped up. I'd rather they pick their own, mind, because the ones I pick I'd sooner keep for myself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    picking = {
      lines = {
        { id = "pk_default", text = "Take the leaves and the flowers and leave the root in the ground, and it'll come back next spring. Rip it all up and you'll have one harvest and then nothing but mud." },
      },
      choices = {
        { text = "Leave the root. Always.", next = "picking_root", fx = { align = { light = 1 } } },
        { text = "I take what I need. The land is wide.", next = "picking_root", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    picking_root = {
      lines = {
        { id = "pr_default", text = "Well, you'll do as you like when you're out of my sight, I expect, but the valley remembers who looked after it. So do I, for that matter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    druid = {
      lines = {
        { id = "dr_default", text = "I knew it! Well, perhaps not talk, but they must say something to you. I only ever hear the wind and the bees, and the wolves on the ridge when I'm out too late." },
      },
      choices = {
        { text = "They speak, if you listen with patience.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Goldshire, trained under an herbalist in Stormwind, and sent back here to teach the beginners." } },
    advice = { { id = "tp_ad", text = "Leave the roots in. The valley will thank you." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, I'm afraid! Ask me about a flower and I'll talk your ears off." } },
  },
}

---------------------------------------------------------------------------
-- Riley Peltskinner: Northshire's junior skinning trainer, of Eagan's family.
---------------------------------------------------------------------------
P:NPC {
  key = "riley_peltskinner", id = TODO_NPC("Riley Peltskinner"), name = "Riley Peltskinner", title = "Junior Skinning Trainer",
  bible = "bibles/elwynn_forever.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" }, values = { "practical", "loyal" },
  notices = { "craft" },
  impression = {
    first = "Riley Peltskinner teaches skinning in Northshire and comes from the same family as Eagan, the valley's tanner. She is practical and plain-spoken, and smells faintly of salt and hides.",
    third = "{name} met Riley Peltskinner, Northshire's junior skinning trainer.",
  },

  greetings = {
    { id = "g_default", text = "Care to learn how to gather leather from slain beasts? Or do you need some new tools?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you've been busy with the wolves, by the look of your sleeves." },
    { id = "g_skin", when = { profession = "Skinning" }, text = "A skinner! Show me your knife, let's see if you've been keeping it sharp." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "That's clean work on those pelts you're carrying. Somebody's been teaching you right." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking", ["not"] = { profession = "Skinning" } },
      text = "A leatherworker who doesn't skin? You'll spend a fortune on hides, and half the time they'll be badly cut." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Riley Peltskinner. The Peltskinners have been skinning and tanning in this valley longer than anyone remembers, and Eagan's the one you'll hear about, but somebody has to teach the young ones." },
        { id = "h_wolves", when = { questDone = TODO_QUEST("Wolves Across the Border") },
          text = "Eagan says you cleared out a good few of those wolves for him. That's meat for his table and hides for mine, so I'm grateful too." },
      },
      again = {
        { id = "h_again", text = "Anything else you need?" },
        { id = "h_again2", text = "Go on, then. Ask." },
      },
      choices = {
        { text = "How are you and Eagan related?", next = "eagan" },
        { text = "What makes a good skinner?", next = "craft" },
        { text = "What's worth skinning in Northshire?", next = "beasts" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "Take care, Riley.", next = "END" },
      },
    },

    eagan = {
      lines = {
        { id = "eg_default", text = "We're Peltskinners, the both of us, and that's all the family history anybody needs in Northshire. Eagan does the hunting and the worrying, and I do the teaching and the salting." },
      },
      choices = {
        { text = "Eagan seems to worry a lot about the wolves.", next = "eagan_wolves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eagan_wolves = {
      lines = {
        { id = "ew_default", text = "He does, and he's right to. They've come down from across the border and they're not afraid of people anymore, so the young recruits get bitten and I get the hides." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    craft = {
      lines = {
        { id = "cr_default", text = "A sharp knife and a steady hand, and respect for the beast. You cut slowly along the grain, and you don't waste anything, because the animal didn't have a choice about giving it up." },
      },
      choices = {
        { text = "Respect for the beast. I like that.", next = "craft_respect", fx = { align = { light = 1 } } },
        { text = "A dead wolf doesn't care how you cut it.", next = "craft_respect", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_respect = {
      lines = {
        { id = "crr_default", text = "Maybe not, but the buyers in Goldshire care, and so do I. A hide with knife holes in it is worth half as much as a clean one, so respect pays as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    beasts = {
      lines = {
        { id = "bs_default", text = "Wolves, mostly, and the odd boar if you go out past the vineyard. The young wolves give you light leather, which is fine for a beginner, and the older ones a bit thicker." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born a Peltskinner in Northshire, and I've had a skinning knife in my hand since I was old enough to be trusted with one." } },
    advice = { { id = "tp_ad", text = "Keep your knife sharp and your salt dry. Everything else comes with practice." } },
    _none = { { id = "tp_none", text = "Not my business, that. Ask Eagan; he worries about everything, so he's bound to have an opinion." } },
  },
}

---------------------------------------------------------------------------
-- Tordrin Sternblade: dwarf hunter trainer in Northshire, teaching the human recruits.
---------------------------------------------------------------------------
P:NPC {
  key = "tordrin", id = TODO_NPC("Tordrin Sternblade"), name = "Tordrin Sternblade", title = "Hunter Trainer",
  bible = "bibles/elwynn_forever.md", role = "trainer", tier = "quest",
  communities = { "northshire" }, temper = { "gruff" }, values = { "practical", "loyal" },
  notices = { "class", "pet", "race" },
  impression = {
    first = "Tordrin Sternblade is a gruff dwarf with a thick mountain burr who teaches the hunters in Northshire. He talks about kobolds like a man discussing a family of rats in his cellar, with contempt and a grudging respect for their nerve.",
    third = "{name} met Tordrin Sternblade, the dwarf who trains the hunters at Northshire Abbey.",
  },

  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Wot kin I do fer ye? Speak up, lad or lass, I've had a kobold yellin' in me ear all mornin'." },
    { id = "g_other", when = { ["not"] = { class = "HUNTER" } }, text = "Wot kin I do fer ye? I'm no use to ye unless ye've a bow on yer back, mind." },
    { id = "g_letter", when = { questActive = TODO_QUEST("A Scribbled Letter") }, text = "Got a letter fer me, have ye? Hand it over, an' let's see if I can read the scrawl." },
    { id = "g_hunting", when = { questActive = TODO_QUEST("Shhh! We're Hunting Kobolds") }, text = "Shhh! Quiet, now! Ye'll never sneak up on a kobold makin' that much noise." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Well, there's a sight fer sore eyes. It's all humans up here, an' none o' them can hold their drink." },
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "That's a fine beast ye've got there. {pet}, is it? Feed it right an' it'll never let ye down." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Tordrin Sternblade, hunter o' Ironforge, teachin' the young ones here how to track an' shoot an' keep their heads. The Abbey's got its priests an' its warriors, an' now it's got me." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Scribbled Letter"), days = 1 } },
          text = "So ye've come to learn the hunter's way, an' brought a scrap o' paper to prove it. Good! There's no better teacher than a kobold that bites, an' Northshire's full o' them." },
        { id = "h_before", when = { class = "HUNTER", questBefore = TODO_QUEST("Shhh! We're Hunting Kobolds") },
          text = "First lesson's a quiet one. Ye don't charge in, ye don't shout, ye find yer quarry an' ye let it lead ye. An' the quarry, as it happens, is kobolds." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Shhh! We're Hunting Kobolds") },
          text = "Keep low an' keep quiet. A kobold'll yell for its friends the moment it sees ye, so let it go about its business an' watch where it goes." },
        { id = "h_follow", tags = { "news" }, when = { questRecent = { TODO_QUEST("Follow That Kobold!"), days = 3 } },
          text = "Ye followed the wee rat all the way an' it never saw ye. That's the first thing a hunter learns, an' the last thing most forget." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ye'll be wonderin' what a dwarf's doin' teachin' humans in Elwynn. Ironforge has hunters to spare, an' Stormwind asked nicely, so here I am." },
      },
      again = {
        { id = "h_again", text = "Aye? Wot else?" },
        { id = "h_again2", text = "Go on, I'm listenin'. Quietly, mind." },
      },
      choices = {
        { text = "What brings a dwarf to Northshire?", next = "dwarf" },
        { text = "Why hunt kobolds quietly?", next = "quiet" },
        { text = "What's the first thing a hunter learns?", next = "lesson" },
        { text = "What do you make of the kobolds?", next = "kobolds" },
        { text = "What do you think of my {pet}?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "I seek training in the ways of the Hunter.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "I'll let you get on.", next = "END" },
      },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "Stormwind's always been short o' good hunters, an' Ironforge has more than it can feed. So when the Abbey asked, a few of us came down from the mountain to teach, an' I drew Northshire." },
        { id = "dw_human", when = { race = "Human" }, text = "Your folk were never much for huntin' with beasts. Swords an' horses an' knights, aye, but not a bow an' a bear at yer side. That's changin', an' somebody has to teach ye." },
      },
      choices = {
        { text = "Do you miss the mountain?", next = "dwarf_miss" },
        { text = "What do you think of humans?", next = "dwarf_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_miss = {
      lines = {
        { id = "dm_default", text = "Aye, every night when the sun goes down an' there's no forge-light to read by. Dun Morogh's cold an' clean, an' Elwynn's warm an' wet, an' I've not been dry since I came." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_humans = {
      lines = {
        { id = "dh_default", text = "Good folk, mostly, if a bit soft an' loud. They pray more than they drink, which is backwards, but they stood with us in the war, an' a dwarf doesnae forget that." },
      },
      choices = {
        { text = "Humans and dwarves should stand together always.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every people should look after their own first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quiet = {
      lines = {
        { id = "qu_default", text = "Because a kobold that sees ye will yell, an' a kobold that yells brings twenty more. But a kobold that doesn't see ye will walk straight back to its friends, an' show ye exactly where they're hidin'." },
      },
      choices = {
        { text = "So we follow it home.", next = "quiet_follow" },
        { text = "Why not just kill it?", next = "quiet_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet_follow = {
      lines = {
        { id = "qf_default", text = "Aye, an' that's the whole lesson. Patience gets ye more than an arrow ever will, an' if ye can follow a kobold without bein' seen, ye can follow anythin'." },
      },
      choices = {
        { text = "Patience wins the hunt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Patience is fine. Speed wins more.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    quiet_kill = {
      lines = {
        { id = "qk_default", text = "Then ye've got one dead kobold an' no idea where the rest are. Kill the first rat ye see an' the nest stays full; follow it home an' ye can clear the lot." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    lesson = {
      lines = {
        { id = "le_default", text = "To keep quiet an' watch. Then to shoot straight, then to tame a beast an' keep it. But the watchin' comes first, an' it's the hardest, because every young hunter wants to loose an arrow." },
        { id = "le_tame", when = { class = "HUNTER", minLevel = 10 }, text = "Ye're past the first lessons now. Ye'll want a beast o' yer own next, an' there's a trainer in Goldshire who'll see to that. Josephine Carson, sharp as a knife an' twice as pointed." },
      },
      choices = {
        { text = "Tell me about Josephine Carson.", next = "josephine", when = { class = "HUNTER" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    josephine = {
      lines = {
        { id = "jo_default", text = "Good hunter, an' a better teacher, but she's no patience for fools. If ye go to her, go knowin' what ye're about, or she'll send ye packin' with yer ears ringin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    kobolds = {
      lines = {
        { id = "ko_default", text = "Vermin, but clever vermin. They've candles on their heads an' no sense in them, but they dig like miners an' they'll defend a tunnel to the last rat. I've seen worse foes, but not many more stubborn.", fx = { learn = { "kobolds" } } },
      },
      choices = {
        { text = "They're only trying to survive, same as us.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Vermin is vermin. Clear them out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pet = {
      lines = {
        { id = "pt_default", text = "{pet}'s got a good eye an' a steady way o' standin'. Treat it right, feed it well, an' never leave it behind, an' it'll stand between ye an' the worst the world can throw." },
      },
      choices = {
        { text = "I won't let {pet} down.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Dun Morogh, hunted rams an' bears in the snow, an' came down to Elwynn when Stormwind asked fer teachers." } },
    advice = { { id = "tp_ad", text = "Watch first, shoot second. An' feed yer beast before ye feed yerself." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask one o' the Brothers; they know everythin' an' they'll tell ye twice." } },
  },
}

---------------------------------------------------------------------------
-- Ormin Pelford: lost a wagonload of supplies in the river below Eastvale.
---------------------------------------------------------------------------
P:NPC {
  key = "ormin", id = TODO_NPC("Ormin Pelford"), name = "Ormin Pelford",
  bible = "bibles/elwynn_forever.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "anxious" }, values = { "hardworking", "honest" },
  notices = { "class" },
  impression = {
    first = "Ormin Pelford tipped a wagonload of the logging camp's supplies into the river and is still standing by the bank, wringing his hands. He is apologetic about everything, even the weather.",
    third = "{name} met Ormin Pelford, who lost the Eastvale logging camp's tools in the river.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello. Don't mind me, I'm only standing here working out how to tell the camp I've lost their tools." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Please tell me you've come with good news, I've had none all week." },
    { id = "g_active", when = { questActive = TODO_QUEST("Downstream") }, text = "Did you find the supplies? I've been watching the river all day, in case anything else floats past." },
    { id = "g_done", when = { questDone = TODO_QUEST("Downstream") }, text = "There's the hero of the riverbank! Still damp, or have you dried out yet?" },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You're a shaman, aren't you? I don't suppose you could ask the river nicely to give my things back." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Ormin Pelford. I haul supplies from the trading post to Eastvale's logging camp, and I've done it a hundred times without a scratch. Today the wagon tipped, and everything went into the river." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Downstream") },
          text = "By the time I'd got the wagon upright, the axe and the saw and the toolbox were already floating off downstream. Between the murlocs and the wolves down there, I don't stand a chance of getting them back on my own." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Downstream") },
          text = "An axe, a saw and a toolbox, all waterlogged by now, I expect. Follow the river down and watch for murlocs, they'll have pulled anything shiny out of the water." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Downstream"), days = 3 } },
          text = "You look a bit damp. Sorry about that, but the camp's got its tools back and nobody's any the wiser. I owe you, and I won't forget it." },
        { id = "h_done", when = { questDone = TODO_QUEST("Downstream") },
          text = "I've tied everything down twice since then, and I take the ford slow now. The loggers laugh at me, but they've not lost a saw since." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no hurry to face the camp." },
        { id = "h_again2", text = "Ask away. It's better than standing here staring at the water." },
      },
      choices = {
        { text = "How did the wagon tip over?", next = "wagon" },
        { text = "What's down the river?", next = "river" },
        { text = "Tell me about the logging camp.", next = "camp" },
        { text = "What's this trading post?", next = "post" },
        { text = "I'll find your supplies.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Downstream") } },
        { text = "I've brought back your tools.", next = "BUSINESS", when = { questActive = TODO_QUEST("Downstream") } },
        { text = "Good luck with the camp.", next = "END" },
      },
    },

    wagon = {
      lines = {
        { id = "wg_default", text = "The ford was higher than I've ever seen it, and the horse shied at something in the water. I pulled the wrong way, the wheel caught a rock, and over she went, me and all." },
      },
      choices = {
        { text = "Something in the water?", next = "wagon_water" },
        { text = "Accidents happen. It's not your fault.", next = "wagon_fault", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "You should own up to the camp before they find out.", next = "wagon_fault", fx = { align = { honor = 1 } } },
      },
    },
    wagon_water = {
      lines = {
        { id = "ww_default", text = "A murloc, I'm almost sure, though I only saw a flash of green and heard that awful gurgling noise. They've come up the river from the lake, the camp says, and they're getting bolder.", fx = { learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wagon_fault = {
      lines = {
        { id = "wf_default", text = "Maybe you're right, and maybe the camp would understand. But a hauler who loses his load doesn't keep his work for long, and I've a family in Goldshire who like to eat." },
      },
      choices = {
        { text = "Then let's get it back before anyone notices.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    river = {
      lines = {
        { id = "rv_default", text = "Murlocs in the shallows and wolves along the banks, and not much else besides reeds and mud. A man with a wagon and a bad back stands no chance, but you seem like the hardy sort." },
      },
      choices = {
        { text = "Why are the murlocs moving upriver?", next = "river_murlocs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    river_murlocs = {
      lines = {
        { id = "rm_default", text = "Nobody knows. The farmers say they've always been in the lake, but they never came this far before. Some say they've been pushed out by something worse, and I don't like to think what." },
      },
      choices = {
        { text = "Someone should drive them back to the lake.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Leave them be. They were here first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = {
        { id = "cp_default", text = "Eastvale's loggers cut the timber Stormwind's been rebuilding with since the war, and it's hard work. They go through axes and saws like bread, and they rely on me to bring new ones.", fx = { learn = { "eastvale" } } },
      },
      choices = {
        { text = "Will they be angry with you?", next = "camp_angry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_angry = {
      lines = {
        { id = "ca_default", text = "Not angry, exactly, but they'll never let me forget it. Loggers have long memories for a laugh, and I'll be Ormin the Swimmer for the rest of my days." },
        { id = "ca_done", when = { questDone = TODO_QUEST("Downstream") }, text = "They never found out, thanks to you. Well, the axe still had a bit of river weed on it, but I told them I'd been cleaning it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    post = {
      lines = {
        { id = "po_default", text = "Where I pick up the camp's supplies, a good ride from here. It's always busy, with traders and wagons coming and going, and I've never had a problem there. It's the road back that's the trouble." },
      },
      choices = {
        { text = "Is the road dangerous?", next = "post_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_road = {
      lines = {
        { id = "pr_default", text = "More than it used to be. There's wolves and gnolls, and the odd fellow in a red bandana watching from the trees. I keep my head down and my horse moving, and most days that's enough." },
      },
      choices = {
        { text = "Stormwind should patrol these roads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Carry a weapon. Don't wait for the guard.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Goldshire born, a hauler by trade, and a man with a very wet wagon this week." } },
    advice = { { id = "tp_ad", text = "Take the ford slow, and tie your load down twice. I learned that the hard way." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask at the logging camp; they know everything that happens along this road." } },
  },
}
