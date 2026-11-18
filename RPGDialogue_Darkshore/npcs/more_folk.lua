-- Darkshore, Auberdine's shopkeepers we had missed: Harlon Thornguard (armor), Kyndri (bread),
-- Allyndia (food and drink), Shaldyn (cloth) and Mavralyn (leather). Classic Auberdine only.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Harlon Thornguard
---------------------------------------------------------------------------
P:NPC {
  key = "harlon", id = TODO_NPC("Harlon Thornguard"), name = "Harlon Thornguard", title = "Armorer & Shieldsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "auberdine" }, temper = { "gruff", "steady" }, values = { "craft", "protective" },
  notices = { "class", "kit" },

  impression = {
    first = "He talks about the furbolgs as if they owed him money.",
    third = "{name} met Harlon Thornguard, the armorer and shieldsmith of Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Armor and shields. If you're heading up the coast, you'll want both." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the coast with all your limbs, I see. Something of mine must have held." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. Come in, I've a shield that's been waiting for a proper arm." },
  },

  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf" },
      text = "A dwarf. You'll want to know who made it before you ask what it costs, so I'll save you the breath: I did, and Delfrum Flintbeard has not laughed at it in a year." },
    { id = "n_dented", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armor's taken a beating. Murlocs, or furbolgs? The furbolgs leave bigger dents." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin in Auberdine. The priestesses will be curious about your Light, but I'm only curious about your plate." },
  },

  start = "hello",
  nodes = {
    forge = {
      lines = { { id = "fo_default", text = "I do. Delfrum Flintbeard set up his anvil here when the boats began running, and Elisa Steelhand sells the coal and flux beside him. I thought I would resent the noise, and instead I find I have learned more about rivets in three years than in the three centuries before." } },
      choices = {
        { text = "An elf learning from a dwarf. That's rare.", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "fo2_default", text = "It should not be. My people made armor to be light and to last through a long peace, and his make it to be struck hard and often. This coast has stopped being peaceful, so I would be a fool to keep to the old pattern out of pride." } },
      choices = {
        { text = "The old ways lasted ten thousand years. Keep them.", next = "BACK", reply = "They lasted while the furbolgs were friends. I'll keep the old patterns on the wall and sell the new ones.", fx = { align = { order = 1 } } },
        { text = "Good. Pride never stopped a claw.", next = "BACK", reply = "Delfrum says the same, though with more swearing. I'll tell him he has an ally.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "Sentinel Glynda Nal'Shea does, now and then, when her patrols come back from the Blackwood dens with their leathers torn through. I tell her every time that leather is the wrong answer to a furbolg, and every time she tells me a Sentinel in plate cannot climb a tree." } },
      choices = {
        { text = "She has a point.", next = "sentinels2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels2 = {
      lines = { { id = "se2_default", text = "She does, and so do I, and so we have settled on bracers and a light shield for the ones who go nearest the dens. It is not enough, but it is more than they carried last year, and I count that as winning the argument slowly." } },
      choices = { { text = "Slow is still winning. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    xshield = {
      lines = { { id = "xs_default", text = "Turn it over and look at the back. Two straps and a grip, set off-centre so the weight sits toward the elbow, and a strip of thistle bear hide under the arm so it does not slide when it is wet, which on this coast is always." } },
      choices = { { text = "That's well thought out. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "One already has, and he charges me in ale for the lessons. Go and tell Delfrum that his pupil's work is fit to carry, if you think it is, because he will believe it from another dwarf sooner than from me." } },
      choices = { { text = "If it holds, I'll tell him. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Harlon Thornguard, armorer and shieldsmith of Auberdine. Darkshore's a hard coast these days, and I make sure those who walk it have something between them and the teeth." },
      },
      again = {
        { id = "h_again3", text = "Ask it. I can talk and fit a strap at the same time." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else do you need?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What's so hard about this coast?", next = "coast" },
        { text = "Who buys most of your armor?", next = "buyers" },
        { text = "Night elves don't usually wear heavy armor.", next = "heavy" },
        { text = "You work near a dwarven forge, I see.", next = "forge" },
        { text = "Do the Sentinels ask your advice?", next = "sentinels" },
        { text = "A shield is my trade. Show me how yours are braced.", next = "xshield", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Our smiths could teach yours a thing or two.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Good day.", next = "END" },
      },
    },

    coast = {
      lines = { { id = "co_default", text = "The Blackwood furbolgs have gone mad, the murlocs crawl up the beaches every tide, and the moonkin north of here attack anyone who wanders near. Then there's the old ruins, which have things in them I'd rather not think about." } },
      choices = {
        { text = "What happened to the furbolgs?", next = "furbolgs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    furbolgs = {
      lines = { { id = "fu_default", text = "Corruption, the druids say, though they're still arguing about where it comes from. The Blackwood were good neighbours once, and now Sentinel Glynda sends people to cull them like wolves." } },
      choices = {
        { text = "It's sad. They were your friends.", next = "BACK", reply = "They were, and I'll not pretend otherwise. But my shields don't know the difference.", fx = { align = { light = 1 } } },
        { text = "A threat is a threat. Cull them.", next = "BACK", reply = "Glynda would agree with you. I'm not sure I do, but I'll sell you the shield.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Travelers off the boats from Menethil, mostly, who've heard Darkshore is a gentle place and learned otherwise at the first murloc. The Sentinels keep their own armorers, though they'll come to me when they're pressed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    heavy = {
      lines = { { id = "he_default", text = "Not usually, no, and I hear that from my own people every day. But not everyone who comes through Auberdine is a Sentinel, and the dwarves and humans like their armor thick, so I make it thick." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "The Sentinels fight in leather because they have always fought in leather. I am wearing that argument down one bracer at a time." } },
    advice = { { id = "tp_advice", text = "If you go up the coast to the Blackwood dens, carry a shield even if you never have before. A furbolg hits with its whole weight." } },
    background = { { id = "tp_bg", text = "I make and sell armor in Auberdine. It's never been busier, which is not good news." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood furbolgs were peaceful once. Now they're why half my customers come in." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me about rivets and straps." } },
  },
}

---------------------------------------------------------------------------
-- Kyndri
---------------------------------------------------------------------------
P:NPC {
  key = "kyndri", id = TODO_NPC("Kyndri"), name = "Kyndri", title = "Baker",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "warm", "brisk" }, values = { "hospitality", "kind" },
  notices = { "race", "weary" },

  impression = {
    first = "She watches the harbor while she works, as if waiting for someone.",
    third = "{name} met Kyndri, Auberdine's baker.",
  },

  greetings = {
    { id = "g_hello", text = "Fresh bread, and water from the spring. You look like you could use both." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I baked extra today, in case." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, dear? Then go and see Tharnariun Treetender when you've eaten, because he's been fretting over the beasts of this shore and could use a friendly ear." },
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You've the look of someone who's walked from Bashal'Aran without stopping. Sit down before you fall down." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human! Tell me, is it true your bakers in Stormwind put sugar in everything?" },
  },

  start = "hello",
  nodes = {
    inn = {
      lines = { { id = "in_default", text = "Every morning, dear. Innkeeper Shaussiy takes two baskets before the first boat, and Taldan pours the drink to go with them. Between the three of us and Allyndia at her stall, nobody leaves Auberdine hungry, which is more than I can say for where they're going." } },
      choices = {
        { text = "Shaussiy hears everything, you said.", next = "inn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn2 = {
      lines = { { id = "in2_default", text = "She does, because the whole town passes through her common room sooner or later. The dwarf with the dig up the coast, the little gnome with his humming boxes, the Sentinels off the night patrol: they all talk over my bread, and she listens with her back turned." } },
      choices = { { text = "I'll mind what I say there. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    coast = {
      lines = { { id = "co_default", text = "I think so, dear, though I'm only a baker. The bears come down to the road with foam on their jaws, the furbolgs have stopped trading, and great dead things keep washing up on the sand. Thundris Windweaver walks about with a face like a closed door, which is how I know it's serious." } },
      choices = {
        { text = "What does Thundris think it is?", next = "coast2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coast2 = {
      lines = { { id = "co2_default", text = "He doesn't tell bakers, but he sends for the Temple and for the druids both, and those two don't share a table unless they must. Whatever it is, it's old, and it was here before Auberdine was." } },
      choices = {
        { text = "Then the Temple and the druids must work as one.", next = "BACK", reply = "That's what I say, dear, and nobody asks me. Perhaps they'll listen to you.", fx = { align = { order = 1 } } },
        { text = "Leave the elders to argue. Folk here should arm themselves.", next = "BACK", reply = "Some already have, quietly. I keep a rolling pin by the door, for what that's worth.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = { { id = "xh_default", text = "Is it? A sailor off the Bravery swore to me that your sweet rolls would stick to a ceiling. I should like to taste one before I judge, so if you ever sail back this way, bring me the recipe and I'll trade you my moonberry loaf for it." } },
      choices = { { text = "A fair trade. I'll remember.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "So they all tell me, and then they eat three loaves to settle their stomachs. I've started baking a hard biscuit for the ship, with a little ginger the Menethil traders bring, and the crew say it helps." } },
      choices = { { text = "I'd have paid dearly for one. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kyndri, and I bake for Auberdine and for everyone who comes off the boats. Sailors from Menethil, pilgrims from Rut'theran, Sentinels off patrol: they all eat bread, whatever else they disagree about." },
      },
      again = {
        { id = "h_again3", text = "Ask away, dear. I've a batch rising, and it won't want me for a quarter hour." },
        { id = "h_again", text = "Anything else? The oven's hot." },
        { id = "h_again2", text = "What else, dear?" },
      },
      choices = {
        { text = "Let me see your bread.", next = "BUSINESS" },
        { text = "You keep watching the harbor.", next = "harbor" },
        { text = "What do sailors talk about?", next = "sailors" },
        { text = "You bake for the inn as well, then.", next = "inn" },
        { text = "Something's wrong with this coast, isn't it?", next = "coast" },
        { text = "Sugar in everything? That's a slander on Stormwind.", next = "xhuman", when = { race = "Human" } },
        { text = "I've sailed from Menethil myself. It's a hard crossing.", next = "xdwarf", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Good day.", next = "END" },
      },
    },

    harbor = {
      lines = { { id = "ha_default", text = "Do I? I suppose I do. The ships bring flour from the south, and when one is late, I start counting what's left in the bins. It's a baker's worry, nothing more." } },
      choices = {
        { text = "Are the ships often late?", next = "late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    late = {
      lines = { { id = "la_default", text = "More often lately. The captains say the sea's rougher along the coast, and there are naga in the waters off the north, though no one likes to say so in front of the passengers." } },
      choices = {
        { text = "Then you should stock up while you can.", next = "BACK", reply = "I do, and then the bins fill up with mice. There's no winning with flour.", fx = { align = { order = 1 } } },
        { text = "Worry about it when it happens.", next = "BACK", reply = "Spoken like someone who's never run out of flour with a full inn waiting. Still, you're right, I fret too much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sailors = {
      lines = { { id = "sa_default", text = "Menethil, mostly, and the swamps and the trolls around it, and how much they hate the crossing. The dwarves from the boats complain about the weather, the humans complain about the food, and they all buy my bread anyway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood used to come to the edge of town for honey cakes, dear. I still bake a few by habit, and then I remember." } },
    background = { { id = "tp_bg", text = "I bake for Auberdine and the boats. It's simple work, and everyone's glad of it." } },
    advice = { { id = "tp_advice", text = "Carry bread in your pack, always. You never know when you'll be stuck on a beach with murlocs between you and the town." } },
    _none = { { id = "tp_none", text = "Oh, I've no idea, dear. Ask Shaussiy at the inn; she hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Allyndia
---------------------------------------------------------------------------
P:NPC {
  key = "allyndia", id = TODO_NPC("Allyndia"), name = "Allyndia", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "cheerful", "chatty" }, values = { "friendly", "practical" },
  notices = { "race", "drink" },

  impression = {
    first = "She seems to know who is coming off every boat.",
    third = "{name} met Allyndia, who sells food and drink in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to Auberdine! You'll want something to eat, I expect. Everyone does, after the crossing." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Still alive, still hungry. That's how I like my customers." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Your friend Wizbang at the inn eats nothing but crackers and forgets those half the time. Do take him something on your way past." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've a little ale from Menethil, but I warn you, it's not Thunderbrew." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Somebody's been enjoying the inn. Have some water, friend, and maybe some bread." },
  },

  start = "hello",
  nodes = {
    boats = {
      lines = { { id = "bo_default", text = "I stand where the pier meets the town, so I can hardly help it. Thamarian tells them which boat is which, Gwennyth Bly'Leggonde tells them what has washed ashore this week, and then they come to me because both of those are hungry news." } },
      choices = {
        { text = "What has washed ashore this week?", next = "boats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boats2 = {
      lines = { { id = "bo2_default", text = "Sea creatures, great ones, dead on the sand all down the coast, and nobody can say why. Gwennyth has been sending travelers out to take samples from them for the Temple, and they come back rather green and not wanting my fish." } },
      choices = {
        { text = "Something in the sea is sick. People should be told.", next = "BACK", reply = "Gwennyth says so too, and she's telling Darnassus as fast as she can. I'll go on telling the boats, then.", fx = { align = { light = 1 } } },
        { text = "Keep it quiet. Frightened travelers don't buy food.", next = "BACK", reply = "Oh, I couldn't keep anything quiet if I tried, friend. And they'd see the beaches for themselves by noon.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat = {
      lines = { { id = "me_default", text = "Less every month, and I turn away some of what they do bring. Anything taken near the Blackwood dens goes straight back, because Mavralyn says the sickness gets into the hides, and I'll not find out whether it gets into the stew as well." } },
      choices = {
        { text = "So what does Auberdine eat instead?", next = "meat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat2 = {
      lines = { { id = "me2_default", text = "Fish, and then more fish. Laird sells what the boats land, Gubber Blump catches his own off the end of the dock and tells everyone how, and Kyndri's bread goes with all of it. We do well enough, though I dream of venison." } },
      choices = { { text = "A town could do worse. Something else.", next = "BACK" } },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "Only since the boats started coming, and you'll grow used to it faster than you think. I was raised in the quiet too, and now I can tell a dwarf's laugh from a gnome's at forty paces and I'd miss either one." } },
      choices = { { text = "Then I'll try to listen kindly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xcook = {
      lines = { { id = "xc_default", text = "Slowly, with a great deal of water, because a strider is all leg and no fat. The dwarves here fry the breast with whatever spice they've carried over, and I admit it's better than our way, though you'll not hear me say so to the elders." } },
      choices = { { text = "I'll try the dwarven way. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Allyndia, and I keep the travelers of Auberdine fed and watered. Fruit, cheese, a little meat when the hunters bring it, and the coldest water on the coast." },
      },
      again = {
        { id = "h_again3", text = "Go on, I love a question. The cheese will keep, and so will I." },
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "What else can I get you?" },
      },
      choices = {
        { text = "Show me your food.", next = "BUSINESS" },
        { text = "Who comes through Auberdine?", next = "who" },
        { text = "What's there to see in Darkshore?", next = "see" },
        { text = "You seem to know who's on every boat.", next = "boats" },
        { text = "The hunters can't be bringing you much meat.", next = "meat" },
        { text = "I've only just left Teldrassil. Is the mainland always so loud?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I cook. What do you do with strider meat?", next = "xcook", when = { profession = "Cooking" } },
        { text = "Good day.", next = "END" },
      },
    },

    who = {
      lines = { { id = "wh_default", text = "Everyone, lately! Dwarves from the Explorers' League looking for ruins, humans who've never seen a night elf, gnomes asking about the moonwells, and our own young ones off to Ashenvale. It's never been so lively." } },
      choices = {
        { text = "Do the townsfolk mind the outsiders?", next = "mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind = {
      lines = { { id = "mi_default", text = "Some of the elders do, and they grumble about axes and noise. But I like it; Auberdine was very quiet for a very long time, and I think we'd forgotten how to talk to strangers." } },
      choices = {
        { text = "Strangers bring new ideas. Good for you.", next = "BACK", reply = "That's what I keep telling the elders. They keep not listening.", fx = { align = { order = -1 } } },
        { text = "Your elders have reason to be careful.", next = "BACK", reply = "They do, I suppose. Ten thousand years of careful is still a lot of careful.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    see = {
      lines = { { id = "se_default", text = "The ruins of Bashal'Aran and Ameth'Aran, if you like old stones and older ghosts. The beaches, if you don't mind murlocs. And the great Cliffspring Falls to the north, which are lovely, though the furbolgs nearby are not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood used to trade berries at the edge of town when I was small. Now I won't even buy meat that was hunted near their dens." } },
    advice = { { id = "tp_advice", text = "Eat before you take the road south, friend. There's nothing between here and Ashenvale but bears and one very lonely Sentinel." } },
    background = { { id = "tp_bg", text = "I sell food and drink in Auberdine. I know everyone, and everyone knows me." } },
    explorers_league = { { id = "tp_league", text = "The dwarves of the Explorers' League dig in our ruins. They're polite, mostly, and they eat a great deal." } },
    _none = { { id = "tp_none", text = "I haven't heard a thing about that. Strange, I usually hear everything." } },
  },
}

---------------------------------------------------------------------------
-- Shaldyn
---------------------------------------------------------------------------
P:NPC {
  key = "shaldyn", id = TODO_NPC("Shaldyn"), name = "Shaldyn",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "gentle", "precise" }, values = { "craft", "beauty" },
  notices = { "class", "craft" },

  impression = {
    first = "It pains her when a customer doesn't care about colour.",
    third = "{name} met Shaldyn, who sells cloth armor in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Robes, gloves, and soft boots. Do look, and please don't drag them on the floor." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your robe's held up, I see. Mostly." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Your robe has seen the road, and I mean no unkindness when I say the hem is a tragedy. Let me show you something that hangs properly." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Your people do like their robes long, don't they? I've one or two that would suit." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor. Look at the stitching on the cuffs, then, and tell me honestly what you think." },
  },

  start = "hello",
  nodes = {
    wearers = {
      lines = { { id = "we_default", text = "Thundris Windweaver has worn the same grey of mine for longer than I care to say, and will not hear of another. The priestesses who come up from Darnassus take the silver, and Grondal Moonbreeze, who teaches the tailors here, buys my offcuts for his students and tells them what I did wrong." } },
      choices = {
        { text = "That must sting a little.", next = "wearers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wearers2 = {
      lines = { { id = "we2_default", text = "It did for the first century. Now I go and stand at the back of his lessons, and when he holds up my seam I learn something as well. He is usually right, which is the truly annoying part." } },
      choices = {
        { text = "A craftswoman who still listens is a rare thing.", next = "BACK", reply = "You are kind. I would rather be corrected than be comfortable and wrong.", fx = { align = { honor = 1 } } },
        { text = "I'd tell him to mind his own needle.", next = "BACK", reply = "I have composed that speech many times, and it is very fine. I never give it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather = {
      lines = { { id = "ga_default", text = "I did, until this year. The kelp I can still take from the beach by the docks, but the moss grows best in the northern woods, and the Sentinels will not let me walk there alone now that the Blackwood have turned. Sentinel Elissa Starbreeze went with me once and stood over me the whole time with her bow strung." } },
      choices = {
        { text = "And the moonflower?", next = "gather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather2 = {
      lines = { { id = "ga2_default", text = "It grows among the stones at Ameth'Aran, where the old spirits walk, and they do not care for visitors. I have a little silver left, enough for a dozen robes, and after that I do not know." } },
      choices = { { text = "Then it's dearer than I thought. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    xtailor = {
      lines = { { id = "xt_default", text = "It is, and thank you for saying so plainly. The good thread comes from Valdaron, two doors along, and he has had none of the heavy spool since the last ship from Rut'theran turned back in the storm. I would rather sew fine than not sew." } },
      choices = { { text = "It holds well for its weight. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xpriest = {
      lines = { { id = "xp_default", text = "Then I shall show you the last of it. The priestesses say the silver is the colour of the moon on still water, and I say it is the colour of a month of nights spent stirring a pot, and I think we are both right." } },
      choices = { { text = "Then it's doubly blessed. Something else.", next = "BACK" } },
    },
    xherb = {
      lines = { { id = "xhb_default", text = "We call it moonpetal, though the herbalists have a longer name. It opens only when the White Lady is full and closes at the first grey of dawn, so you must cut it in the dark and by feel. If you find any at Ameth'Aran and live to carry it out, I should be very glad of it." } },
      choices = { { text = "I'll look when the moon's full. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shaldyn, and I sell cloth armor to priests, mages, and anyone else who would rather move freely than be weighed down. The colours are dyed here in Auberdine, from plants along the shore." },
      },
      again = {
        { id = "h_again3", text = "Yes? Ask, only do keep your sleeves away from the dye pots while you do." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else can I show you?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Tell me about the dyes.", next = "dyes" },
        { text = "Cloth won't stop a furbolg's claw.", next = "claw" },
        { text = "Who wears your robes in Auberdine?", next = "wearers" },
        { text = "You gather your own dye plants, then.", next = "gather" },
        { text = "The stitching's fine. The thread's a little thin.", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "I serve the Temple. I'd wear Elune's silver gladly.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I pick herbs. Which flower gives the silver?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "Good day.", next = "END" },
      },
    },

    dyes = {
      lines = { { id = "dy_default", text = "Blues from a kelp that washes up after storms, greens from the moss under the trees, and a silver we make from a flower that only opens under the moon. The silver takes a month, and it's worth every night." } },
      choices = {
        { text = "Beauty is worth the time.", next = "BACK", reply = "It is. I'm glad someone who wears my robes thinks so.", fx = { align = { order = 1 } } },
        { text = "I care more that it's sturdy.", next = "BACK", reply = "It's sturdy too, I promise. But you might at least notice the silver.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    claw = {
      lines = { { id = "cl_default", text = "No, and it isn't meant to. Cloth lets a priestess move her hands and a mage keep his mind clear; the claw is meant to stop before it gets to them. That's what the warriors are for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood have closed the northern woods to me, and my green dye with them. It is a small loss beside the others, I know, but it is mine." } },
    advice = { { id = "tp_advice", text = "Wash a good robe in cold water and dry it out of the sun. Half the robes I mend were ruined by their owners and not by any enemy." } },
    background = { { id = "tp_bg", text = "I sell cloth armor in Auberdine, dyed with colours from the shore." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. Ask me about cloth and colour." } },
  },
}

---------------------------------------------------------------------------
-- Mavralyn
---------------------------------------------------------------------------
P:NPC {
  key = "mavralyn", id = TODO_NPC("Mavralyn"), name = "Mavralyn",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "dry", "practical" }, values = { "craft", "trade" },
  notices = { "craft", "class" },

  impression = {
    first = "She is blunt about bad skinning and generous about good.",
    third = "{name} met Mavralyn, who sells leather and leatherworking supplies in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Leather armor, thread, dye, and salt for curing. What are you after?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Bring me anything worth curing?" },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! I've thread and dye, and opinions, if you want them." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Your leathers want to stretch when you change, I'm told, so I cut them loose at the shoulder. Tharnariun has never complained." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You skin, by the knife on your belt. Strider hides here are thin; cut slowly or you'll ruin them." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Dark leather, I expect, and soft boots. I've both." },
  },

  start = "hello",
  nodes = {
    hunters = {
      lines = { { id = "hu_default", text = "Every one, and I know them by their cuts. The Sentinels skin clean and fast, the dwarves skin as if they were mining, and the young ones off the boat from Teldrassil apologise to the animal first, which I don't discourage." } },
      choices = {
        { text = "Do they bring you news from the hills?", next = "hunters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters2 = {
      lines = { { id = "hu2_default", text = "More than the Sentinels get, sometimes. It was a hunter who first told me the bears had gone foam-mouthed near the dens, a full season before Tharnariun Treetender began asking travelers to put the worst of them down. I told him, and to his credit he listened." } },
      choices = {
        { text = "Culling them is cruel, sick or not.", next = "BACK", reply = "Crueller to leave them raving in the brush, I think. But I'm glad it troubles you, because it ought to.", fx = { align = { light = 1 } } },
        { text = "A rabid beast is a danger. Put them down.", next = "BACK", reply = "That's Tharnariun's view, and mine. Just do it cleanly, and don't bring me the hide.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "to_default", text = "It has, and for the better where my trade's concerned. Harlon makes his armor thick for the outlanders now, Naram Longclaw sells blades the Sentinels wouldn't have looked at ten years ago, and I've learned to cut a jerkin for a dwarf, which is mostly a matter of forgetting about the waist." } },
      choices = {
        { text = "And what do the outlanders make of your work?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "to2_default", text = "They call it thin until the first rainstorm, when their own leathers are soaked through and mine are not. After that they come back and buy a second set, and I try not to look pleased." } },
      choices = { { text = "You look pleased now. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xlw = {
      lines = { { id = "xl_default", text = "Brine it twice as long as you think it needs, and work it while it's still damp. The fur's so thick that the hide under it never quite dries on the beast, and if you cure it like a strider's it will rot from the inside by the next moon." } },
      choices = { { text = "I'd have ruined a dozen. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "South of the Wildbend, toward the Twilight Vale, where the furbolgs don't range. The moonstalkers there are sleek and sound, and I'll pay well for them. Stay out of the northern woods unless Tharnariun sends you, because nothing up there is fit to wear." } },
      choices = { { text = "South, then. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Mavralyn, and I sell leather armor and the makings of it. The hunters of Darkshore bring me their hides, and the travelers buy what I make of them." },
      },
      again = {
        { id = "h_again3", text = "Ask it. I've a hide in the brine and nothing to do but wait on it." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What hides come from Darkshore?", next = "hides" },
        { text = "How do you tell good skinning from bad?", next = "skinning" },
        { text = "You must see every hunter on this coast.", next = "hunters" },
        { text = "Auberdine has changed since the boats came.", next = "town" },
        { text = "I work leather. What's the trick to thistle bear?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "I hunt these hills. Where are the clean beasts?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Good day.", next = "END" },
      },
    },

    hides = {
      lines = { { id = "hi_default", text = "Strider, mostly, and thistle bear, and the odd nightsaber from the hills. The bears are the best of it, thick and warm, though I don't buy from the furbolg dens; whatever's sick there gets into the hides." } },
      choices = {
        { text = "Sick hides? How can you tell?", next = "sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick = {
      lines = { { id = "si_default", text = "They smell wrong, and the leather cracks no matter how you cure it. The druids say it's the same corruption that's taken the Blackwood, and I believe them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    skinning = {
      lines = { { id = "sk_default", text = "Good skinning leaves the hide whole and the cuts straight; bad skinning looks as if a murloc did it with its teeth. I'll buy either, but I'll pay very differently." } },
      choices = {
        { text = "Fair. Quality should be paid for.", next = "BACK", reply = "Exactly. And a skinner who learns that soon earns well.", fx = { align = { honor = 1 } } },
        { text = "A hide's a hide. Pay the same.", next = "BACK", reply = "Then go and sell your murloc-chewed hides elsewhere, friend. I'll be here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "Whatever has taken the Blackwood is in the beasts near their dens too. I can smell it on a hide before I've unrolled it." } },
    advice = { { id = "tp_advice", text = "Cut slowly and keep your knife sharp. A good hide pays for a week on the road, and a ruined one pays for nothing." } },
    background = { { id = "tp_bg", text = "I sell leather and leatherworking goods in Auberdine. I buy hides too, if they're worth it." } },
    _none = { { id = "tp_none", text = "Not my business. Leather is." } },
  },
}
