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
    sentinels = { { id = "tp_sentinels", text = "They come off the night patrol grey with tiredness, dear, and I have a warm loaf waiting. It's little enough." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves from the dig buy my hardest bread by the sackful. They say it reminds them of home, which I try to take kindly." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "There are hooded folk at the Master's Glaive, dear, and nobody goes that way for a picnic any more. That's all I know, and all I want to." } },
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
        { text = "You sound like you'd sail on the next boat yourself.", next = "sail" },
        { text = "Come to Stormwind sometime. I'll show you the cathedral.", next = "xhuman", when = { race = "Human" } },
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

    -- Kaldorei factions: the young who want to see the world the elders fear.
    sail = {
      lines = {
        { id = "sa_default", key = true,
          text = "I would, and I've packed twice and unpacked twice. I'm barely two centuries old, which makes me a child to the elders, and I've never seen snow on a mountain, or a city built of stone instead of grown." },
      },
      choices = {
        { text = "What stops you?", next = "sail_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sail_stop = {
      lines = {
        { id = "ss_default", text = "My mother, mostly, and Barithras across the square, who says the world is shorter for us now than it used to be and I shouldn't waste it on boats. I tell him that's exactly why I should go, and he looks at me as if I'd knocked over one of his jars." },
      },
      choices = {
        { text = "Go. The world won't wait for you any longer.", next = "BACK", reply = "That's what I keep saying, and you said it better. Perhaps the next boat, then, if Kyndri will mind my stall.", fx = { align = { order = -1 } } },
        { text = "Your elders remember the Sundering. Listen to them.", next = "BACK", reply = "I do listen, I promise, but they remember the Sundering so hard there's no room left for anything else. Somebody has to remember Stormwind.", fx = { align = { order = 1 } } },
        { text = "What would you see first?", next = "sail_first" },
      },
    },
    sail_first = {
      lines = {
        { id = "sf_default", text = "The cathedral in Stormwind, where the humans pray to a Light that isn't even the moon, and then Ironforge, where Thelgrum swears the forges never go out. The elders call the humans children, but children built those, and I want to see what they built." },
        { id = "sf_human", when = { race = "Human" },
          text = "Your city first, the cathedral in Stormwind, and then Ironforge, where Thelgrum swears the forges never go out. The elders call your people children, but children built those, and I want to see them with my own eyes." },
        { id = "sf_dwarf", when = { race = "Dwarf" },
          text = "Ironforge first, where Thelgrum swears the forges never go out, and then the cathedral in Stormwind. The elders say your people only dig, but I've heard of halls carved so high they have their own weather, and I want to stand in one." },
      },
      choices = {
        { text = "I'll tell you about it when I'm back this way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "Don't say that unless you mean it, because I'll hold you to it, and then I'll have to tell my mother. Tell me about it instead, so I know what I'm missing; is it true the windows are made of coloured glass?" },
      },
      choices = {
        { text = "It's true. The light comes through in every colour.", next = "BACK", reply = "Every colour! Our temple has only moonlight, and I love it, but I should like to see a window that remembers the sun.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    see = {
      lines = { { id = "se_default", text = "The ruins of Bashal'Aran and Ameth'Aran, if you like old stones and older ghosts. The beaches, if you don't mind murlocs. And the great Cliffspring Falls to the north, which are lovely, though the furbolgs nearby are not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "Glynda's Sentinels eat at my stall when they've a moment, which is never. I wrap it so they can eat walking." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "A traveler told me there are cultists down at the Master's Glaive, praying to old bones. I gave him a second helping; he looked as if he needed it." } },
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
    highborne = { { id = "tp_highborne", text = "The spirits at Ameth'Aran were Highborne, and they dressed beautifully, by the look of them. I try not to admire it." } },
    elune = { { id = "tp_elune", text = "The silver dye wants a full moon, so in a manner of speaking She is my partner in it. I have never dared say so to a priestess." } },
    sentinels = { { id = "tp_sentinels", text = "Sentinel Elissa Starbreeze guarded me while I gathered moss, and tapped her foot the whole while. I was grateful, and I hurried." } },
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
    sentinels = { { id = "tp_sentinels", text = "A Sentinel skins the way she fights, fast and with nothing wasted. I'd take a dozen of them as apprentices." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "The moonstalkers have left the hills round the Master's Glaive. Beasts know a bad neighbour when they smell one." } },
    furbolgs = { { id = "tp_furbolgs", text = "Whatever has taken the Blackwood is in the beasts near their dens too. I can smell it on a hide before I've unrolled it." } },
    advice = { { id = "tp_advice", text = "Cut slowly and keep your knife sharp. A good hide pays for a week on the road, and a ruined one pays for nothing." } },
    background = { { id = "tp_bg", text = "I sell leather and leatherworking goods in Auberdine. I buy hides too, if they're worth it." } },
    _none = { { id = "tp_none", text = "Not my business. Leather is." } },
  },
}

---------------------------------------------------------------------------
-- Wizbang Cranktoggle
---------------------------------------------------------------------------
P:NPC {
  key = "wizbang", id = TODO_NPC("Wizbang Cranktoggle"), name = "Wizbang Cranktoggle",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "auberdine" }, temper = { "excitable", "precise" }, values = { "invention", "curiosity" },
  notices = { "class", "race" },

  impression = {
    first = "Wizbang Cranktoggle is a gnome who has set up in Auberdine's inn and scattered humming brass boxes across Darkshore to study its animals from a safe distance. He talks faster than he thinks, and he thinks very fast.",
    third = "{name} met Wizbang Cranktoggle, a gnome inventor studying Darkshore's beasts from Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Oh! Hello, hello, you're just the right height, I mean the right sort, for a field assistant. Have you got a minute and a strong stomach?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Splendid. Did the buzzbox hum at you, or click? It matters enormously which." },
    { id = "g_active", when = { questActive = TODO_QUEST("Buzzbox 827") }, text = "Six crawler legs into Buzzbox 827, on the shore south of the dock. Press the green stud, not the red. Definitely not the red." },
    { id = "g_done", when = { questDone = TODO_QUEST("Buzzbox 525") }, text = "Four boxes, four samples, and all the transmissions came through with only eleven percent static! That is a personal best." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Oh, thank goodness. I've been explaining what a transmitter is to people who think lightning is a religious matter. Sit down, sit down." },
    { id = "n_eng", cat = "class", when = { profession = "Engineering" },
      text = "Is that a spanner in your belt? An arclight spanner? You could recalibrate 411 for me, it's been reading thresher eyes as turnips." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ah, one of the locals. I do apologise about the box by the moonwell. It's quite harmless, and I've turned the hum down by a third." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wizbang Cranktoggle, inventor, at your service! I came to Darkshore to study the wildlife, because something here is making it sick, and I've built a network of buzzboxes to gather samples. Only I can't be at four boxes at once, and the wildlife keeps trying to eat me." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Buzzbox 827") }, text = "Each buzzbox wants a different sample. Put the bits in the hopper, press the stud, and it sends me the readings and tells you where the next one is. It's all perfectly automatic, apart from the collecting." },
        { id = "h_done", when = { questDone = TODO_QUEST("Buzzbox 525") }, text = "The readings agree across all four species, crab to bear: the same contaminant, getting stronger toward the north and the furbolg dens. I've written it up for Thundris Windweaver in very small words. He was civil about it." },
      },
      again = {
        { id = "h_again", text = "Yes? Yes! Ask, I'm only soldering." },
        { id = "h_again2", text = "Go on, go on, I can talk and count at the same time, usually." },
        { id = "h_again3", text = "Something else? Hold this wire while you ask. Not that end." },
      },
      choices = {
        { text = "What exactly is a buzzbox?", next = "box" },
        { text = "What do you think is sickening the animals?", next = "sick" },
        { text = "What's a gnome doing in Auberdine?", next = "gnome" },
        { text = "What did the samples tell you?", next = "xdone", when = { questDone = TODO_QUEST("Buzzbox 525") } },
        { text = "Let me see the schematic. Maybe I can cut the static.", next = "xeng", when = { profession = "Engineering" } },
        { text = "Is it true about Gnomeregan?", next = "xgnome", when = { race = { "Gnome", "Dwarf" } } },
        { text = "The elders dislike your boxes near the moonwells.", next = "xnelf", when = { race = "NightElf" } },
        { text = "The elves look at your boxes like they might explode.", next = "ne_look", when = { ["not"] = { race = "NightElf" } } },
        { text = "Good luck with your boxes.", next = "END" },
      },
    },
    box = {
      lines = {
        { id = "box_default", text = "A Cranktoggle Remote Sample Analyser and Relay, though the innkeeper called it a buzzbox on the first day and it stuck. You feed it a specimen, it measures seventeen properties, and it sends the numbers to my receiver here by a principle I shan't bore you with unless you ask twice." },
      },
      choices = {
        { text = "And it tells me where the next one is?", next = "box2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    box2 = {
      lines = {
        { id = "box2_default", text = "It does! Each box knows the bearing of the next, and it'll say which sample that one's been tuned for. 827 takes crawler legs, 411 thresher eyes, 323 moonstalker fangs, and 525 the scalps of grizzled bears, which I admit is the least pleasant, and I'm sorry." },
      },
      choices = {
        { text = "Legs, eyes, fangs, scalps. Lovely. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    sick = {
      lines = {
        { id = "sick_default", text = "I've a hypothesis and I'm very fond of it, so I'm trying not to believe it yet. The bears foam, the crabs are the wrong colour, and it's all worse to the north. That says a source, something leaching into soil and stream. The druids say 'corruption', which I think is the same idea in a longer robe." },
      },
      choices = {
        { text = "The druids have known this land for ages. Heed them.", next = "BACK", reply = "Oh, I do! They know what and where. I only want the how much, and they will not give me a number.", fx = { align = { order = 1 } } },
        { text = "Numbers beat robes. Trust your instruments.", next = "BACK", reply = "Thank you! Though don't say so to Tharnariun, he's been very decent about the bears.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    gnome = {
      lines = {
        { id = "gnome_default", text = "Being useful somewhere that isn't underground, to be frank. There wasn't much call for a naturalist in Tinker Town. So I took the boat from Menethil with nine crates, and Innkeeper Shaussiy has let me have the upstairs table as long as nothing explodes before breakfast." },
      },
      choices = {
        { text = "Has anything?", next = "gnome2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome2 = {
      lines = {
        { id = "gnome2_default", text = "Once, and it was after breakfast, so strictly speaking I kept my word. Taldan the drink seller lost an eyebrow. He was most gracious, and I've promised him the first working receiver, which he doesn't want." },
      },
      choices = {
        { text = "A generous offer. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdone = {
      lines = {
        { id = "xdone_default", text = "That whatever it is gets into everything that eats, and concentrates as it goes up, so the bears have it worst. The peak readings all point toward the Blackwood dens. I can't tell you what it is, only that it isn't natural and isn't going away, and I've said so to everyone who'll stand still." },
      },
      choices = {
        { text = "Keep saying it. Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xeng_default", text = "Would you? Oh, marvellous. It's the coil, I'm sure it's the coil, the sea air gets at the windings. If you've a bit of bronze tube and some patience, I think we could get it under eight percent. Nobody here has offered to look at a schematic in four months." },
      },
      choices = {
        { text = "Bronze tube and patience. Let's see it later.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xgnome = {
      lines = {
        { id = "xgnome_default", text = "It's true. Thermaplugg, the gas, all of it. I got out with my notebooks and one boot. I find that if I think about crab legs and coil windings very hard, I don't think about the rest so often, which is probably why there are four boxes and not one." },
      },
      choices = {
        { text = "We'll take Gnomeregan back. Hold to that.", next = "BACK", reply = "I do. And when we do, I'll want a proper laboratory, with a door that shuts.", fx = { align = { honor = 1 } } },
        { text = "Keep building. It's as good a cure as any.", next = "BACK", reply = "That's my method exactly. I've nearly cured myself as far as box number five.", fx = { align = { honor = -1 } } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "I know, I know, and I do understand, truly! I've moved it twelve paces back, padded the casing with two of my socks, and the hum is down to a polite whisper. It only listens, I promise, it doesn't take a drop from the well. If Thundris wants it gone I'll fetch it tonight, though it's my best reading by a clear fourteen percent." },
      },
      choices = {
        { text = "I'll tell them it only listens. Something else.", next = "BACK" },
        { text = "It's a moonwell, Wizbang, not a laboratory.", next = "xnelf_well" },
      },
    },
    xnelf_well = {
      narr = "He takes off his goggles, which seems to cost him something.",
      lines = {
        { id = "xnw_default", text = "Ah. There it is, the look! The elders give me that exact look, eyebrows at roughly forty degrees, as if I'd lit a fuse to see whether it was a candle. Now, your people have watched this coast for ten thousand years, which is a marvellous sample size! You could tell me the tide heights, the water clarity, the glow per fathom before the sickness came, and instead I get a proverb about balance. Not one number. I counted!" },
      },
      choices = {
        { text = "We've seen what clever hands do with power. Forgive our caution.", next = "BACK",
          reply = "I've seen it too, you know, in Gnomeregan, with my own two eyes and one boot. Perhaps that's why I want numbers so badly; numbers would have told us to stop.",
          fx = { align = { order = 1 }, opinion = { gnomes = "reckless" } } },
        { text = "You're right. Our elders hoard what they know.", next = "BACK",
          reply = "Oh, I didn't expect a kaldorei to say so! Don't tell Thundris I made you, though, because he's been very civil and I'd hate to lose the upstairs table.",
          fx = { align = { order = -1 }, opinion = { night_elves = "secretive" } } },
        { text = "What would you ask them, if they'd answer?", next = "ne_ask" },
      },
    },
    ne_look = {
      lines = {
        { id = "nel_default", text = "Oh, they do, they absolutely do, and I've measured it: a kaldorei will stand eleven paces from a buzzbox, which is precisely the distance you'd stand from a fused barrel of blasting powder. They distrust anything with a gear in it, and I can't say I blame them after what happened to my city, but it does make fieldwork very lonely." },
        { id = "nel_gnome", when = { race = "Gnome" },
          text = "They do, and they look at us the same way, you'll have noticed: a dangerous toy that wandered off from its workshop. I've measured it, eleven paces from any buzzbox, and I'd love to say they're wrong to keep their distance, only I can't, not after Gnomeregan." },
      },
      choices = {
        { text = "Do they ever help you?", next = "ne_help" },
        { text = "They're right to be wary of machines.", next = "BACK",
          reply = "Perhaps, perhaps, though a buzzbox has never once burned a forest, and I can't say the same of their old enemies. Still, I've turned the hum down by a third, as a gesture.",
          fx = { align = { light = 1 }, opinion = { night_elves = "respect" } } },
        { text = "They're superstitious. Your boxes will prove them wrong.", next = "BACK",
          reply = "That's the hope, that's the whole hope! Though I'd rather prove them wrong politely, because they have very good bows.",
          fx = { align = { light = -1 }, opinion = { night_elves = "superstitious" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ne_help = {
      lines = {
        { id = "neh_default", text = "In their way, which is to say they'll tell you the answer and never how they got it. The druids know exactly which streams have turned and which bears have gone wrong, and when I ask for their records, they tell me the land remembers, which is very poetic and absolutely useless on a graph. I've tried plotting it. The line just goes wistful." },
      },
      choices = {
        { text = "What would you ask them, if they'd answer?", next = "ne_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ne_ask = {
      lines = {
        { id = "nea_default", text = "How the shore looked a hundred years ago, before the sickness, because without a baseline every reading I take is a number floating in the dark! They've lived through it, they remember it, and they won't write a word of it down for a gnome, and if that isn't the most maddening thing on this continent, I'll eat my goggles, lenses and all." },
      },
      choices = {
        { text = "Maybe they don't think in numbers.", next = "BACK", reply = "Then I'll learn to think in whatever they think in, if I have to, though I suspect it involves a great deal of sitting very still." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I'm a gnome naturalist, working out of the inn at Auberdine. I've four buzzboxes across Darkshore, and one of them works perfectly." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Lost, for now. I got out with my notebooks and one boot. I'd much rather talk about crabs, if it's all the same to you. Crabs have very interesting joints." } },
    furbolgs = { { id = "tp_furbolgs", text = "Every reading I take gets worse toward their dens. I don't know what they've got up there, but it's in the water." } },
    advice = { { id = "tp_advice", text = "The green stud, never the red. I really can't stress that enough." } },
    _none = { { id = "tp_none", text = "No data, I'm afraid! Ask Shaussiy downstairs. She collects information the old-fashioned way, by listening." } },
  },
}

---------------------------------------------------------------------------
-- Sentinel Aynasha
---------------------------------------------------------------------------
P:NPC {
  key = "aynasha", id = TODO_NPC("Sentinel Aynasha"), name = "Sentinel Aynasha",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "darkshore_wilds" }, temper = { "terse", "proud" }, values = { "dutiful", "endurance" },
  notices = { "class", "race" },

  impression = {
    first = "Sentinel Aynasha is holding a stretch of the southern Darkshore road alone, wounded, with a handful of arrows and furbolgs gathering in the trees. She asks for help the way a Sentinel does, as a statement of fact.",
    third = "{name} met Sentinel Aynasha on the southern road of Darkshore, hurt and nearly out of arrows.",
  },

  greetings = {
    { id = "g_hello", text = "You, traveler. Stop there, and listen. I have little time and less breath." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back down the road. I am still standing, as you see." },
    { id = "g_active", when = { questActive = TODO_QUEST("One Shot. One Kill.") }, text = "They are coming. Stand where I can see you, and do not let them reach me until this string is on." },
    { id = "g_done", when = { questDone = TODO_QUEST("One Shot. One Kill.") }, text = "Onaeya has my report, and you carried it. I owe you more than I have had the chance to say." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry a bow. If you have shafts to spare, I will not be too proud to count them." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "DRUID", "PALADIN" } },
      text = "A healer. Later. If you spend yourself on me now, neither of us will see the end of this." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander. I had hoped for a Sentinel. You will do, if you can hold a line." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sentinel Aynasha. I was carrying word south to Maestra's Post when the Blackwood set on me. I have driven off two attacks, but my string has parted and I am down to my last arrows. A third is coming, and I cannot meet it alone." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("One Shot. One Kill.") }, text = "Keep them off me while I restring. They will come up from the western trees, a few at first and then their leader. Kill him and the rest will break." },
        { id = "h_done", when = { questDone = TODO_QUEST("One Shot. One Kill.") }, text = "I had one arrow left for their chieftain, and you gave me the moment to place it. That is the whole of what happened here, and I have told it so to my commander." },
      },
      again = {
        { id = "h_again", text = "Ask, quickly." },
        { id = "h_again2", text = "Speak. I am listening for them, not for you." },
        { id = "h_again3", text = "What else? Keep your voice down." },
      },
      choices = {
        { text = "How did the furbolgs catch a Sentinel?", next = "caught" },
        { text = "What word were you carrying south?", next = "word" },
        { text = "You should fall back to Auberdine.", next = "retreat" },
        { text = "That last shot was a fine one.", next = "xdone", when = { questDone = TODO_QUEST("One Shot. One Kill.") } },
        { text = "Take half my quiver, Sentinel.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Sister, why were you sent alone?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Hold fast, Sentinel.", next = "END" },
      },
    },
    caught = {
      lines = {
        { id = "caught_default", text = "They did not catch me. They waited at the ford, where the road narrows, as no furbolg I ever knew would have had the wit or the malice to do. I saw them late. I will not make that error twice." },
      },
      choices = {
        { text = "They've changed, then.", next = "caught2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught2 = {
      lines = {
        { id = "caught2_default", text = "Past knowing. I hunted beside the Blackwood as a girl. They shared honey with us, and they laughed. What came out of those trees had the same faces and nothing behind them. I shot three whose names I think I once knew." },
      },
      choices = {
        { text = "That's a grief, and no shame to you.", next = "BACK", reply = "It is both, to me. But I thank you for saying it.", fx = { align = { light = 1 } } },
        { text = "They chose to attack. Waste no pity on them.", next = "BACK", reply = "I waste nothing, traveler. I have four arrows. The pity I will see to afterward.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    word = {
      lines = {
        { id = "word_default", text = "That the corruption is not Darkshore's alone. Sentinel Glynda Nal'Shea in Auberdine has reports of sickened furbolgs and fouled streams, and Ashenvale's posts must know that what they see with the Thistlefur is the same thing. Onaeya at Maestra's Post is to send it on to Astranaar." },
      },
      choices = {
        { text = "And if you don't arrive?", next = "word2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    word2 = {
      lines = {
        { id = "word2_default", text = "Then you will carry it. I say that plainly, so there is no doubt later. Maestra's Post lies beyond the border, the first lodge on the road. Give it to Sentinel Onaeya and no one else." },
      },
      choices = {
        { text = "To Onaeya, and no one else. Something else.", next = "BACK" },
      },
    },
    retreat = {
      lines = {
        { id = "retreat_default", text = "With this leg, and them between me and the town? No. And if I could, I would not. The message goes south, and a Sentinel who turns back with her dispatch is only a tired traveler." },
      },
      choices = {
        { text = "Then I'll stand with you. The message goes south.", next = "BACK", reply = "Good. Stand to my left. I shoot from the right.", fx = { align = { honor = 1 } } },
        { text = "Dead Sentinels deliver nothing. Be sensible.", next = "BACK", reply = "I am being sensible. I have asked for help, which I am told I do rarely.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdone = {
      lines = {
        { id = "xdone_default", text = "It was the only one I had, so it had to be. They train us to make the last arrow the best, and I always thought it a saying for the young. I shall tell my own recruits it is true." },
      },
      choices = {
        { text = "They'll believe it from you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "I will take six, and I will return them to you in furbolgs. A Sentinel does not forget a debt of arrows. Now nock one yourself, and watch the western trees." },
      },
      choices = {
        { text = "Six it is. West, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Because there was no one to send with me. Glynda has eight Sentinels for the whole coast. You know how thin we are stretched, or you soon will. That is why your being here matters, whatever leathers you wear." },
      },
      choices = {
        { text = "Then I'm glad I took this road. Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am a Sentinel of Auberdine, carrying dispatches south. I was delayed on the road." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood were friends once. They ambush like bandits now, and there is nothing in their eyes." } },
    sentinels = { { id = "tp_sentinels", text = "We are eight on this coast. Each of us does what three should, and does not complain of it." } },
    advice = { { id = "tp_advice", text = "Count your arrows before you count on anyone else. I learned that today." } },
    _none = { { id = "tp_none", text = "I do not know. Ask me after, if there is an after." } },
  },
}

---------------------------------------------------------------------------
-- Therylune
---------------------------------------------------------------------------
P:NPC {
  key = "therylune", id = TODO_NPC("Therylune"), name = "Therylune",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "darkshore_wilds" }, temper = { "shaken", "resolute" }, values = { "nature", "courage" },
  notices = { "class", "race" },

  impression = {
    first = "Therylune is a captive of the Twilight's Hammer at the Master's Glaive, taken while watching the cult from too close. She is frightened and angry in about equal measure, and intends to walk out.",
    third = "{name} met Therylune, a prisoner of the Twilight's Hammer at the Master's Glaive in Darkshore.",
  },

  greetings = {
    { id = "g_hello", text = "Hsst! Here, behind the stones. You are not one of them, are you? No. You are breathing too loudly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back for me. I had begun to compose what I would say to Elune about you if you did not." },
    { id = "g_active", when = { questActive = TODO_QUEST("Therylune's Escape") }, text = "Stay close, and strike the ones who chant first. I can walk, but I cannot run far." },
    { id = "g_done", when = { questDone = TODO_QUEST("Therylune's Escape") }, text = "I am out of that pit, and I have slept under open leaves again. I will not forget whose doing that was." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You came in without their seeing you. Good. Then you know how I ought to have done it, and may refrain from saying so." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You are of the Circle. Then you feel it too, this place. The ground is wrong the whole way down." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander, in this place of all places. I do not care if you are a murloc in a hat, so long as you can fight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Therylune. I came to the Master's Glaive to learn what the Twilight's Hammer wants with it, and I learned instead how quickly they notice a watcher. They have held me here for days. Help me reach the edge of the valley, and I can find my own way after." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Therylune's Escape") }, text = "We go up, out of the bowl, by the eastern path. They will try to stop us. Do not wait for me to tell you to strike." },
        { id = "h_done", when = { questDone = TODO_QUEST("Therylune's Escape") }, text = "The cult will have moved its sentries by now, and learned nothing else from losing me. I told the Sentinels all I saw. It was less than I went for, and more than I should like to know." },
      },
      again = {
        { id = "h_again", text = "Ask, but softly. They pass this way every quarter hour." },
        { id = "h_again2", text = "What else? Quickly, and low." },
        { id = "h_again3", text = "Speak. I am listening for footsteps as well as for you." },
      },
      choices = {
        { text = "What is the Master's Glaive?", next = "glaive" },
        { text = "What do the Twilight's Hammer want here?", next = "cult" },
        { text = "How were you caught?", next = "caught" },
        { text = "What did you tell the Sentinels?", next = "xdone", when = { questDone = TODO_QUEST("Therylune's Escape") } },
        { text = "The earth here is in pain. What lies beneath?", next = "xdruid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "We'll go out the way I came in. Follow my steps.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Be ready. I'll get you out.", next = "END" },
      },
    },
    glaive = {
      lines = {
        { id = "glaive_default", text = "Look up. Those are bones, the bones of something that died here before our people had a name, with a blade the size of a tower still standing in its skull. My people have always kept away from this valley. The trees will not grow in it, and that is warning enough." },
      },
      choices = {
        { text = "What was it?", next = "glaive2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glaive2 = {
      lines = {
        { id = "glaive2_default", text = "A servant of something older than the world's keepers, if the oldest tales are to be believed, slain by a master greater than itself. I do not know. I know that the cultists kneel to the bones and whisper to them, and that at night I have thought the bones whispered back." },
      },
      choices = {
        { text = "Then the sooner we leave, the better.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    cult = {
      lines = {
        { id = "cult_default", text = "They call themselves the Twilight's Hammer, and they speak of old gods who will end the world and of how glad they will be to see it. Here they dig around the bones and read aloud from tablets. I think they are trying to learn something from the dead thing, or wake it." },
      },
      choices = {
        { text = "Who would wish for the world's end?", next = "cult2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      lines = {
        { id = "cult2_default", text = "I listened to them for three days and I can tell you. The ones who believe they have been wronged past mending. There was a human among them who had lost a farm, and an elf, one of ours, who had lost a sister at Hyjal. They are not mad. That is what frightened me." },
      },
      choices = {
        { text = "They're past saving. Cut them down.", next = "BACK", reply = "We shall have to, to leave. I only wish I had not heard why.", fx = { align = { light = -1 } } },
        { text = "Then some might still be turned back.", next = "BACK", reply = "Not by us, not today. But I am glad someone thinks it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = {
        { id = "caught_default", text = "By watching too long from the same rock. I told myself one more hour, and one more, because I had nearly understood their rite. A sentry I had not counted came up behind me. Balthule Shadowstrike warned me of exactly that, at the head of the valley, and I thanked him and ignored it." },
      },
      choices = {
        { text = "Curiosity that ignores orders is no virtue.", next = "BACK", reply = "No. I have had some days to reflect on that, with my hands tied.", fx = { align = { order = 1 } } },
        { text = "You nearly had it. I'd have stayed too.", next = "BACK", reply = "Then we are both fools, and one of us is still free. Let us make use of that one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdone = {
      lines = {
        { id = "xdone_default", text = "That they are few, but that more arrive each week by the southern path. That their leaders can call up things of water and shadow. And that Balthule's reports were not half grave enough. Thundris Windweaver heard me to the end without once interrupting, which I am told is rare." },
      },
      choices = {
        { text = "Then it was worth the telling. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "I do not know, and I am afraid to guess. The earth here is not dead; that I could bear. It is listening. When they chant, something under the valley leans closer. I felt it through my feet for three days." },
      },
      choices = {
        { text = "I feel it too. Let's be gone.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Gladly, and I shall place my feet exactly where yours go. I have been proud once already this week, and it has cured me for a season." },
      },
      choices = {
        { text = "Step where I step. Something else first.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I came to watch the cult at the Master's Glaive, and I was caught at it. I would rather be known for what I learned." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "They pray for the world to end, and they are not mad, only bitter. I listened to them for three days." } },
    sentinels = { { id = "tp_sentinels", text = "Balthule Shadowstrike watches this valley for the Sentinels. He warned me, and he was right." } },
    advice = { { id = "tp_advice", text = "Never watch from the same place twice. I can show you the rope marks, if you doubt me." } },
    _none = { { id = "tp_none", text = "I cannot say. Ask me when there is sky over my head and not these bones." } },
  },
}

---------------------------------------------------------------------------
-- Delfrum Flintbeard
---------------------------------------------------------------------------
P:NPC {
  key = "delfrum", id = TODO_NPC("Delfrum Flintbeard"), name = "Delfrum Flintbeard", title = "Blacksmithing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "auberdine" }, temper = { "gruff", "hearty" }, values = { "craft", "honesty" },
  notices = { "craft", "race" },

  impression = {
    first = "Delfrum Flintbeard is a dwarf who set up an anvil in Auberdine and teaches smithing to anyone who can lift the hammer, night elves included. He complains about the damp constantly and has no intention of leaving.",
    third = "{name} met Delfrum Flintbeard, the dwarven blacksmithing trainer in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Aye, come in out o' the drizzle. It's always drizzle here. Are ye wantin' to learn, or just to stand by the fire like the rest o' them?" },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Let's see yer hands, then, for a smith's hands never lie, and aye, ye've been at it. Good." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith! Praise the forge. Come here and tell me this weld's no' as bad as I think it is." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! By my beard, it's good to hear a proper voice. Sit ye down. I've a wee keg from Menethil that I've been savin' for exactly this." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf at a forge. Dinnae look so worried, {g:lad|lass}, I've taught a dozen o' your folk. Ye're stronger than ye look, and ye listen, which is more than I can say for my cousins." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye've ore dust in your cuffs. Kurdram'll want a word wi' ye, and I'll want whatever copper ye've got that he doesnae." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Delfrum Flintbeard, smith, late o' Ironforge. I came over on the boat thinkin' the elves might need a nail or two, and found they'd no' had a proper anvil in the town in ten thousand years. So I stayed, and I teach." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Ye know the trade already. There's more I can show ye when ye've the ore for it. Elisa Steelhand has the coal and flux, right there, and she'll no' cheat ye." },
      },
      again = {
        { id = "h_again", text = "Ask away. I can talk through a hammer." },
        { id = "h_again2", text = "Go on, {g:lad|lass}. The iron needs a minute anyway." },
        { id = "h_again3", text = "Somethin' else? Mind the sparks." },
      },
      choices = {
        { text = "Teach me smithing.", next = "BUSINESS" },
        { text = "A dwarven forge in an elven town?", next = "forge" },
        { text = "Who works alongside you?", next = "folk" },
        { text = "You don't like the weather.", next = "damp" },
        { text = "What's it like, teaching night elves?", next = "xdwarf", when = { race = { "Dwarf", "Gnome" } } },
        { text = "My welds crack in the cold. Why?", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "Harlon says you've made his armor better.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Keep the fire hot, Delfrum.", next = "END" },
      },
    },
    forge = {
      lines = {
        { id = "forge_default", text = "Aye, and ye should've seen their faces when I lit it. They work metal cold and slow, wi' moonlight and patience, and it's bonny stuff, I'll grant. But ye cannae arm a town that way when the furbolgs are comin' doon the beach. So they let me have this corner, and the noise." },
      },
      choices = {
        { text = "They've come round to it?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = {
        { id = "forge2_default", text = "Some. Harlon Thornguard the armorer comes by most evenin's and pretends he's just passin'. He's learned to rivet like a dwarf, and I've learned from him how to make a thing light that's still strong, which I'd have sworn couldnae be done. Dinnae tell Ironforge." },
      },
      choices = {
        { text = "Good craft has no nation. Share it all.", next = "BACK", reply = "That's my thinkin'. A hammer doesnae care whose hand it's in.", fx = { align = { order = -1 } } },
        { text = "Some secrets should stay with the clans.", next = "BACK", reply = "Aye, and the deep ones do. But a rivet's no' a secret, it's just sense.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk = {
      lines = {
        { id = "folk_default", text = "Elisa Steelhand sells the smithin' supplies, and she's sharp as a chisel. Kurdram Stonehammer teaches minin' and his kinsman Thelgrum sells the picks. Between the four o' us there's a wee corner o' Khaz Modan on this dock, and we take it in turns to be homesick." },
      },
      choices = {
        { text = "Four dwarves, a long way from the mountain.", next = "folk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk2 = {
      lines = {
        { id = "folk2_default", text = "Five, wi' Gorbold Steelhand at the trade counter, and there's Hollee and the League up the coast. We came for different reasons. Mine was that Ironforge has a thousand smiths and Auberdine had none. A man likes to be needed, even somewhere it never stops rainin'." },
      },
      choices = {
        { text = "That's reason enough. Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    damp = {
      lines = {
        { id = "damp_default", text = "Like it? I've had to oil my own beard. Everythin' rusts, the coal's aye wet, and I've no' seen the sun since I got off the boat. And yet the folk are decent, and the work matters, and there's a kind o' quiet in the evenin's I never had under the mountain." },
      },
      choices = {
        { text = "You've found a second home. Admit it.", next = "BACK", reply = "I'll admit nothin' o' the sort. But I'm no' packin', am I?", fx = { align = { light = 1 } } },
        { text = "Go back to Ironforge. You've done your part.", next = "BACK", reply = "And leave these folk wi' no smith and the bears at the door? Away wi' ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "Strange, at first. They dinnae sweat, they dinnae swear, and they thank the ore. But they'll stand at the anvil six hours without askin' for a drink, and their eye for a line is better than mine. I've stopped tellin' them to hit it harder and started watchin' how they hit it." },
      },
      choices = {
        { text = "I'd not have believed it. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    xsmith = {
      lines = {
        { id = "xsmith_default", text = "Because ye're quenchin' in sea air, {g:lad|lass}, and the wet takes the heat off too quick on one side. Bring it back up to cherry and let it cool slow in the ash before ye quench at all. I lost a week o' work to that when I first came." },
      },
      choices = {
        { text = "Slow in the ash first. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Did he say that? Out loud? Well. Ye can tell him his shields are fit to carry, and that I said so, and then watch him try no' to smile. He's the best student I've had, and he was a master before I was born." },
      },
      choices = {
        { text = "I'll tell him exactly that. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "The elf lasses on patrol wear leather against furbolgs, which is madness. I've forged a few bucklers for them, on the quiet." } },
    background = { { id = "tp_background", text = "I'm a smith out o' Ironforge, teachin' in Auberdine. They'd no anvil till I came, if ye can credit it." } },
    explorers_league = { { id = "tp_explorers_league", text = "The League's diggin' up the coast at Remtravel's. Daft beggars, the lot, but they buy my chisels." } },
    furbolgs = { { id = "tp_furbolgs", text = "Whatever's got into the Blackwood, it's why half this town's learnin' to make a blade. I'd rather teach for a happier reason." } },
    advice = { { id = "tp_advice", text = "Oil everythin' ye own, every night. This coast'll rust the buttons off your coat." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, {g:lad|lass}. Ask the innkeeper, or Thundris if it's elf business." } },
  },
}

---------------------------------------------------------------------------
-- Grondal Moonbreeze
---------------------------------------------------------------------------
P:NPC {
  key = "grondal", id = TODO_NPC("Grondal Moonbreeze"), name = "Grondal Moonbreeze", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "auberdine" }, temper = { "exacting", "courteous" }, values = { "craft", "tradition" },
  notices = { "craft", "class" },

  impression = {
    first = "Grondal Moonbreeze teaches tailoring in Auberdine and holds up his students' seams to the light as evidence. He is unfailingly courteous and almost never satisfied.",
    third = "{name} met Grondal Moonbreeze, the tailoring trainer of Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Good day to you. Please, do not lean on the cutting table; the chalk lines are fresh." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. I trust you have brought me a seam to look at, and not merely an excuse." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor. Excellent. Hold out your cuff, if you would. Ah. We have work to do." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Your stitches are even, and a little timid. You are afraid of the cloth. It can tell, and it will pucker out of spite." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, in a robe whose hem has plainly been set on fire and then stamped out. I see the same every week. I have begun to teach a flame-proof hem as a matter of course." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Grondal Moonbreeze, and I teach the cutting and sewing of cloth to those in Auberdine who will be corrected. I have taught it since before this town had a dock, and I have seen every mistake that can be made with a needle. I am told I mention them." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "You have some training. There is more to learn, when you have the cloth for it. Valdaron sells thread and dye two doors along, and you may tell him I sent you; he will sigh." },
      },
      again = {
        { id = "h_again", text = "Yes? Please, ask. I shall continue pinning." },
        { id = "h_again2", text = "What else would you know?" },
        { id = "h_again3", text = "Something further? I am listening." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "You hold your students to a hard standard.", next = "standard" },
        { text = "Who are Auberdine's cloth-workers?", next = "cloth" },
        { text = "What do you sew for a town at war's edge?", next = "war" },
        { text = "Why does my linen pucker at the seam?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "Shaldyn says you're usually right. It annoys her.", next = "xshaldyn", when = { heardLine = "shaldyn.we2_default" } },
        { text = "Teach me that flame-proof hem.", next = "xmage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Good day, Grondal.", next = "END" },
      },
    },
    standard = {
      lines = {
        { id = "standard_default", text = "I do. A garment is worn against the skin, in rain and battle and grief, and the one who wears it never thinks of the one who made it unless it fails. I teach my students to be forgotten. It is harder than being admired." },
      },
      choices = {
        { text = "That's a severe way to put it.", next = "standard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    standard2 = {
      lines = {
        { id = "standard2_default", text = "Perhaps. I had a student who wept when I unpicked her first robe before the class. She is now the finest seamstress in Darnassus and unpicks her own apprentices' work. She wrote to thank me. I have kept the letter where the others can see it." },
      },
      choices = {
        { text = "High standards are a gift to the student.", next = "BACK", reply = "So I believe. They seldom believe it until later.", fx = { align = { order = 1 } } },
        { text = "A kinder word would teach as well.", next = "BACK", reply = "I have tried kind words. They produce kind seams, which come apart.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = {
        { id = "cloth_default", text = "Shaldyn sells finished robes, dyed by her own hand, and her colour is beyond reproach. Valdaron supplies thread, and would supply more of it if the boats were regular. And I teach. We are a small guild, and each of us is certain the other two could do better." },
      },
      choices = {
        { text = "Could they?", next = "cloth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth2 = {
      lines = {
        { id = "cloth2_default", text = "Shaldyn's seams have improved a great deal since she began attending my lessons, standing at the back as though she had merely wandered in. I have never remarked on it. One does not embarrass a colleague who is quietly doing the right thing." },
      },
      choices = {
        { text = "That's a courtesy in itself. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    war = {
      lines = {
        { id = "war_default", text = "Bandage linen, by the bolt, for Sentinel Glynda's patrols, and it is the most carefully hemmed bandage linen on the coast. Cloaks waxed against the rain. And shrouds, which I cut myself and let no student touch. There have been more of those this year than last." },
      },
      choices = {
        { text = "Even a shroud deserves a master's hand.", next = "BACK", reply = "It deserves it most. It is the last thing anyone will make for them.", fx = { align = { light = 1 } } },
        { text = "Spend your skill on the living.", next = "BACK", reply = "I spend it on both. The linen is for the living, and I should rather sew that all day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtailor = {
      lines = {
        { id = "xtailor_default", text = "Because you are pulling the thread to close the seam, when the seam should close itself. Smaller stitches, less tension, and press it flat with a warm stone before you turn it. And wax your thread. On this coast, unwaxed thread swells and then shrinks." },
      },
      choices = {
        { text = "Smaller, looser, waxed. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xshaldyn = {
      lines = {
        { id = "xshaldyn_default", text = "Did she say so? How very like her to say it to a stranger and never to me. You may tell her that her silver dye is the envy of every tailor I have trained, and that I have never once been able to match it. That is also annoying." },
      },
      choices = {
        { text = "I'll carry it back to her. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "It is a matter of the lining. A strip of spider silk, doubled, inside the last hand's breadth, and the outer cloth cut on the bias so that it curls away from heat. It will not save you from a dragon. It will save the robe from your own carelessness." },
      },
      choices = {
        { text = "My own carelessness thanks you. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    highborne = { { id = "tp_highborne", text = "They wore silk such as no loom now makes, and it did not save them. I tell my students that when they grow vain about a hem." } },
    elune = { { id = "tp_elune", text = "The Temple's vestments are the standard I teach to. One should sew as though the Goddess will inspect the lining." } },
    background = { { id = "tp_background", text = "I teach tailoring in Auberdine. I have corrected every seam sewn in this town for longer than its dock has stood." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels bleed on my linen and never see the hem. That is as it should be." } },
    furbolgs = { { id = "tp_furbolgs", text = "I cut more shrouds this year than last, and most of them on account of the Blackwood. I do not need to know more than that." } },
    advice = { { id = "tp_advice", text = "Wax your thread and press your seams. Everything else is practice and humility." } },
    _none = { { id = "tp_none", text = "I could not say. If it cannot be measured with a tape, I am seldom the one to ask." } },
  },
}

---------------------------------------------------------------------------
-- Gorbold Steelhand
---------------------------------------------------------------------------
P:NPC {
  key = "gorbold", id = TODO_NPC("Gorbold Steelhand"), name = "Gorbold Steelhand", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "quest", gender = "male",
  communities = { "auberdine" }, temper = { "shrewd", "jovial" }, values = { "trade", "family" },
  notices = { "craft", "race" },

  impression = {
    first = "Gorbold Steelhand is a dwarf merchant selling trade supplies in Auberdine, and he has cargo at the bottom of the sea that he would very much like back. He is jovial about most things and precise about losses.",
    third = "{name} met Gorbold Steelhand, a dwarf trader in Auberdine with goods lost in two shipwrecks.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome, welcome! Thread, flux, spice, vials, all the wee necessaries. And if ye can swim, I've a proposition." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yourself again. Buyin', or have ye been thinkin' about my proposition?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Deep Ocean, Vast Sea") }, text = "The Silver Dawning and the Mist Veil, both sunk off the coast north o' here. The lockboxes are in the holds. Mind the murlocs." },
    { id = "g_done", when = { questDone = TODO_QUEST("Deep Ocean, Vast Sea") }, text = "Both lockboxes, and the seals no' even broken! Ye've saved a season's trade. I'll no' forget it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Good to see a beard. Ye'll understand the pain o' a paid-for cargo lyin' on the seabed, which the elves, bless them, do not." },
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Leatherworking" } },
      text = "A crafter, I can tell by the hands. Whatever ye're short of, I have it or I had it before the Mist Veil went down." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One o' the locals. Your folk are grand customers, never a word o' hagglin'. I've had to learn to haggle against myself to keep in practice." },
  },

  start = "hello",
  nodes = {
    dw_elves = {
      lines = {
        { id = "dw_elves_default", text = "Fairly, aye, an' coldly. They don't like the League diggin' in their old ruins down the coast, an' they've decided every dwarf in Darkshore carries a shovel under his coat. I sell thread, friend, no' shovels." },
        { id = "dw_elves_elf", when = { race = "NightElf" }, text = "Fairly, aye, though yer folk are a wee bit cold about it. They don't like the League diggin' in the old ruins down the coast, an' I can't say I blame them, but I sell thread, no' shovels." },
      },
      choices = {
        { text = "The League should respect the elves' ruins.", next = "BACK", reply = "I'll pass that on tae Remtravel, if he remembers who I am. He forgets most things, but never a dig.", fx = { align = { order = 1 } } },
        { text = "Old ruins belong to whoever can dig them out.", next = "BACK", reply = "Keep yer voice down in Auberdine, would ye? I've a business tae run, an' the Sentinels have long memories.", fx = { align = { order = -1 } } },
        { text = "Something else, Gorbold.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gorbold Steelhand, purveyor o' trade goods. I'm here on business for my family in Ironforge, and business was fine until two o' our ships went down off this coast inside a month. I've goods in both holds, locked in strongboxes, and no' a soul in Auberdine who'll dive for them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Deep Ocean, Vast Sea") }, text = "The wrecks lie in the shallows up the coast, past the Cliffspring. Each has a lockbox wi' my family's mark. Bring them both, and watch for the Greymist murlocs, they've made a home in the timbers." },
        { id = "h_done", when = { questDone = TODO_QUEST("Deep Ocean, Vast Sea") }, text = "The ledgers balance again, and my brother's stopped writin' me letters in red ink. I owe ye a debt that's no' on any invoice." },
      },
      again = {
        { id = "h_again", text = "Ask away! Talk's the one thing I dinnae charge for." },
        { id = "h_again2", text = "Go on, {g:lad|lass}." },
        { id = "h_again3", text = "Somethin' else? I've all day, the boat's late again." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Two ships lost in a month?", next = "ships" },
        { text = "What brings a dwarf merchant to Darkshore?", next = "business" },
        { text = "Who do you trade with here?", next = "trade" },
        { text = "What was in those lockboxes, really?", next = "xdone", when = { questDone = TODO_QUEST("Deep Ocean, Vast Sea") } },
        { text = "Ironforge is a long way to send for thread.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Do you sell honest weight, merchant?", next = "xcraft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Leatherworking" } } },
        { text = "Do the night elves treat a dwarf trader fairly?", next = "dw_elves" },
        { text = "Good trading, Gorbold.", next = "END" },
      },
    },
    ships = {
      lines = {
        { id = "ships_default", text = "Aye, the Silver Dawning first and the Mist Veil three weeks after, both in sight o' land on a calm night. The crews swam for it and swear somethin' came up under the keel. I'm a practical dwarf. But two in a month isnae weather." },
      },
      choices = {
        { text = "What do you think sank them?", next = "ships2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships2 = {
      lines = {
        { id = "ships2_default", text = "The sailors say naga. Gwennyth on the dock says the sea's been throwin' up dead beasts the size o' barns. I say that whatever it is, it's bad for trade, and somebody ought to be doin' somethin', and I've said so to Thundris Windweaver twice." },
      },
      choices = {
        { text = "Trade should wait until the sea is safe.", next = "BACK", reply = "Aye, and my family should eat what while it waits? But ye're no' wrong about the danger.", fx = { align = { order = 1 } } },
        { text = "Keep the ships coming. Fortune favors the bold.", next = "BACK", reply = "That's the spirit! I'll put ye on the next manifest as ballast.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      lines = {
        { id = "business_default", text = "The Steelhands have traded out o' Ironforge for six generations. When the Alliance came north, my brother said 'there'll be elves wantin' flux', and I drew the short straw. Elisa, my cousin, came for the smithin' supplies. Between us we've a fair wee enterprise." },
      },
      choices = {
        { text = "And do the elves want flux?", next = "business2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business2 = {
      lines = {
        { id = "business2_default", text = "They didnae know they did, till Delfrum lit his forge. Now I cannae keep it on the shelf. That's trade for ye: half of it is carryin' goods, and half is carryin' the notion that folk need them." },
      },
      choices = {
        { text = "A notion and a cart. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    trade = {
      lines = {
        { id = "trade_default", text = "Everyone wi' a craft. Grondal the tailor and Valdaron take my thread, Delfrum and Harlon my flux, and that daft wee gnome at the inn buys every scrap o' copper wire I can find. And the Sentinels, for salt and lamp oil, though they pay in the Temple's coin and I've to change it in Menethil." },
      },
      choices = {
        { text = "The gnome keeps you busy.", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      lines = {
        { id = "trade2_default", text = "Wizbang? He's my best customer and my worst. He orders things I've never heard of, pays in advance, and then somethin' explodes and he orders them again. I've stopped askin'. I just keep a crate marked 'Cranktoggle' and fill it as I can." },
      },
      choices = {
        { text = "A crate with his name on. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdone = {
      lines = {
        { id = "xdone_default", text = "Since ye fetched them, I'll tell ye. Letters o' credit, mostly, and a season's worth o' rare dyes. And in the Mist Veil's, my grandmother's scales, the ones the family's weighed on since Modimus was king. I'd have dived for those myself, if I could swim a stroke." },
      },
      choices = {
        { text = "I'm glad they're home. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "It is, and the freight's murder. But I'll tell ye a secret: the thread's elven, I buy it in Darnassus and sell it back to them here wi' a Steelhand ribbon on. The flux and the tools are ours. Dinnae look at me like that, it's all honestly labelled. In small letters." },
      },
      choices = {
        { text = "Small letters. Aye, I'll bet. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xcraft = {
      lines = {
        { id = "xcraft_default", text = "To the grain, and ye can test it on any scale in town. A Steelhand who sold short weight would have his beard trimmed by his own mother. Charge high, aye, I do that. Cheat, never." },
      },
      choices = {
        { text = "High but honest. Fair enough. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I'm a Steelhand o' Ironforge, sellin' trade goods in Auberdine. Business is good, when my ships stay on top o' the water." } },
    explorers_league = { { id = "tp_explorers_league", text = "The League buys rope and lamp oil by the barrel. I've no notion what they do down those holes, and I've stopped askin'." } },
    advice = { { id = "tp_advice", text = "Never ship all your goods in one hull. I learned it twice in a month." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "A bad business. I've a soft spot for the wee folk since; I give the gnome at the inn credit, and I never give credit." } },
    _none = { { id = "tp_none", text = "That's outside my ledger, {g:lad|lass}. Ask Gwennyth on the dock, she talks to every sailor that lands." } },
  },
}

---------------------------------------------------------------------------
-- Thelgrum Stonehammer
---------------------------------------------------------------------------
P:NPC {
  key = "thelgrum", id = TODO_NPC("Thelgrum Stonehammer"), name = "Thelgrum Stonehammer", title = "Mining Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "auberdine" }, temper = { "plainspoken", "wry" }, values = { "craft", "kin" },
  notices = { "craft", "race" },

  impression = {
    first = "Thelgrum Stonehammer sells picks and mining supplies in Auberdine beside his kinsman Kurdram, who teaches the trade. He is plainspoken, and puzzled by a coast with so little worth digging.",
    third = "{name} met Thelgrum Stonehammer, who sells mining supplies in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Picks, shovels, lamp oil and a good stout sack. If ye're diggin', I'm your dwarf." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Broke the pick, or lost it? It's aye one or the other." },
    { id = "g_miner", when = { profession = "Mining" }, text = "A miner, at long last! Tell me ye've found somethin' on this coast besides copper and wet sand." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "That's a miner's squint ye've got, lookin' at the cliff and no' the view. There's copper in the hills east o' the road, and tin if ye go as far as the falls." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf! That makes near enough to a clan. Kurdram'll want ye for his card game, and I'd advise against it, he cheats." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf lookin' at picks. I mean no offence, but your folk hold them like they're afraid o' wakin' the rock. It's stone. It doesnae mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Thelgrum Stonehammer. My kinsman Kurdram teaches the minin', and I sell what ye need to do it. We came over thinkin' a whole new continent must be full o' ore, and found the elves had never so much as scratched it." },
      },
      again = {
        { id = "h_again", text = "Ask away. Trade's slow till the boat's in." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "Somethin' else? I'm only sortin' wedges." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Is there much worth mining in Darkshore?", next = "ore" },
        { text = "The elves never mined at all?", next = "elves" },
        { text = "You and Kurdram came over together.", next = "kin" },
        { text = "Where's the tin, exactly?", next = "xminer", when = { profession = "Mining" } },
        { text = "Stone does mind, sometimes. We listen for it.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Any word of the League's dig up the coast?", next = "xdwarf", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Good day, Thelgrum.", next = "END" },
      },
    },
    ore = {
      lines = {
        { id = "ore_default", text = "Copper, in the hills, and a wee bit o' tin by the Cliffspring. It's no' Loch Modan. But it's untouched, every vein, and there's somethin' in a dwarf that cannae walk past an untouched vein. The trouble is the bears and the furbolgs, who sit on the best o' it." },
      },
      choices = {
        { text = "The furbolgs guard the ore?", next = "ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore2 = {
      lines = {
        { id = "ore2_default", text = "No' guard, exactly. They've a den up north built right on a copper seam, and they've gone mad, so nobody digs there. Kurdram sent a lad up last spring who came back wi' no pick and a great deal to say about green fire. We dig south o' the town now." },
      },
      choices = {
        { text = "South it is. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    elves = {
      lines = {
        { id = "elves_default", text = "Never, not once in ten thousand years sittin' on top o' it. I asked one why, and she said the earth gives what it wishes to, and when I said it wishes a deal faster wi' a pick, she didnae laugh. They're grand folk, but ye'll no' get a joke about rocks past them." },
      },
      choices = {
        { text = "They've a point. Take only what's needed.", next = "BACK", reply = "Aye, well, I need a fair bit. But I fill my holes after, which is more than some.", fx = { align = { order = 1 } } },
        { text = "Ore in the ground helps no one. Dig.", next = "BACK", reply = "That's what I say! I'll have it carved over the door.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "kin_default", text = "We did, and it was his notion. He's the one wi' the patience to teach, and I'm the one who can add. Delfrum the smith takes what the students dig, Elisa sells him his coal, and Gorbold changes the coin. It's a tidy wee circle, and no' an elf in it's been cheated yet." },
      },
      choices = {
        { text = "A dwarven corner of an elven town.", next = "kin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin2 = {
      lines = {
        { id = "kin2_default", text = "Aye. They put us all at the one end o' the dock, where the hammerin' wouldnae carry. I thought it an insult the first month. Now I think they were bein' kind to the both o' us, and I've grown fond o' the quiet end o' the day when the tide's out." },
      },
      choices = {
        { text = "Sounds like you've settled. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xminer = {
      lines = {
        { id = "xminer_default", text = "Follow the Cliffspring River up from the falls, and look on the north bank where the rock's gone grey and flaky. Ye'll want a lamp, there's caves, and ye'll want a weapon, because the caves have things in them. Bring me a sample and I'll tell ye if it's worth a second trip." },
      },
      choices = {
        { text = "North bank, grey rock. Thanks. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Do ye, now? Kurdram says the same o' his best student, an elf lass who taps the wall and waits before she swings. She's never once brought a roof doon. Maybe there's somethin' in it. I'll no' say so in front o' the other dwarves." },
      },
      choices = {
        { text = "Tap and wait. It works. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "Remtravel's? He's lost again, last I heard, wanderin' the ruins wi' his nose in a notebook. Hollee keeps the camp. They buy my chisels and bring them back blunt wi' nothin' to show but pots. Still, they're kin o' a sort, and they pay." },
      },
      choices = {
        { text = "Lost again. That's the League. Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "A bad business, yon. There's a wee gnome at the inn who cannae talk about it, and I've learned no' to ask." } },
    highborne = { { id = "tp_highborne", text = "The old elf ruins are full o' cut stone, grand work, and no' a quarry in sight. I'd give a good pick to know where they dug it." } },
    background = { { id = "tp_background", text = "I sell minin' supplies in Auberdine, beside my kinsman Kurdram. It's a thin coast for ore, but it's all ours." } },
    explorers_league = { { id = "tp_explorers_league", text = "They dig for pots, no' ore, and they blunt a good chisel doin' it. But they're dwarves, so I give them a fair price." } },
    furbolgs = { { id = "tp_furbolgs", text = "The best copper seam on this coast is under a furbolg den. I'd weep, if I were the weepin' sort." } },
    advice = { { id = "tp_advice", text = "Carry a spare pick handle. The head never breaks; it's aye the handle." } },
    _none = { { id = "tp_none", text = "Couldnae say. Ask Kurdram, he's the thinker o' the two o' us." } },
  },
}

---------------------------------------------------------------------------
-- Valdaron
---------------------------------------------------------------------------
P:NPC {
  key = "valdaron", id = TODO_NPC("Valdaron"), name = "Valdaron", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "auberdine" }, temper = { "mild", "patient" }, values = { "craft", "thrift" },
  notices = { "craft", "class" },

  impression = {
    first = "Valdaron sells thread, dye and bolts of cloth in Auberdine and waits on the supply boats with resigned patience. He is mild in everything, including his complaints.",
    third = "{name} met Valdaron, who sells tailoring supplies in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Good day. Thread, dye and cloth, such as the last boat left me. Please, look." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back. I have a little more of the blue than I had, and no more of anything else." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor. Grondal has sent you, or will. He says I sigh. I do not think I sigh." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You run the cloth between your fingers before you look at the price. That is how I know a tailor from a customer." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. I keep a bolt of white aside for the Temple's people. It is the one thing I have never yet run short of, for I order it first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Valdaron, and I supply the tailors of Auberdine: Grondal Moonbreeze's students, Shaldyn at her dye pots, and any traveler who has torn a sleeve. My stock comes by boat from Rut'theran, so I am, you might say, at the mercy of the tide." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I am in no hurry." },
        { id = "h_again2", text = "Please, ask." },
        { id = "h_again3", text = "Something more? The boat is not due till evening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The boats aren't reliable, I take it.", next = "boats" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "Do you make your own dyes?", next = "dyes" },
        { text = "Which thread would you use for heavy wool?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "Is there truly less coming from Darnassus?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Good day, Valdaron.", next = "END" },
      },
    },
    boats = {
      lines = {
        { id = "boats_default", text = "They were, for a great many years. This season the Moonspray has turned back twice in weather, and the crews speak of things under the water that I should prefer not to picture. When she does come, half my order has been left on the dock at Rut'theran to make room for travelers." },
      },
      choices = {
        { text = "Travelers before thread?", next = "boats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boats2 = {
      lines = {
        { id = "boats2_default", text = "So many of them, since the Alliance. I do not grudge it. They come to help us, and a person matters more than a spool. But I notice that it is thread that mends their cloaks when they arrive, and nobody thought of that at the dock." },
      },
      choices = {
        { text = "They should carry both. Supplies are a town's lifeblood.", next = "BACK", reply = "I have written to say so, very politely. I expect a polite reply by winter.", fx = { align = { order = 1 } } },
        { text = "People first. Thread can wait.", next = "BACK", reply = "It can, and it does. I only wish it did not have to wait quite so often.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_default", text = "Grondal, for his lessons, and he sends back any spool he thinks uneven. Shaldyn takes the undyed cloth. The dwarf Gorbold buys my Darnassian thread and sells it again from his own counter at a higher price, with a ribbon on it. I find that I do not mind. It is the same thread." },
      },
      choices = {
        { text = "That doesn't trouble you?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = {
        { id = "buyers2_default", text = "It would trouble Grondal, so I have not told him. Gorbold pays promptly and in full, and his customers are people who would never have found my door. I think there is room on a dock for two kinds of merchant." },
      },
      choices = {
        { text = "A generous view. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    dyes = {
      lines = {
        { id = "dyes_default", text = "The plain ones, from bark and shore-moss, yes. The fine colours are Shaldyn's, and I would not presume. She makes a silver from a flower that grows at Ameth'Aran, and she can no longer gather it for the spirits there. I have been keeping my last jar of it against the day she asks." },
      },
      choices = {
        { text = "Give it to her now. Don't wait to be asked.", next = "BACK", reply = "You are right. I have been saving it like a miser, and for whom? I shall take it to her this evening.", fx = { align = { light = 1 } } },
        { text = "Hold it. Scarce things should be kept.", next = "BACK", reply = "That was my thought. Though each day I keep it, I feel a little less sure.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtailor = {
      lines = {
        { id = "xtailor_default", text = "The waxed three-ply, in grey, and I have exactly four spools of it. It does not swell in this air, and it is strong enough that the cloth will tear before the seam does. Grondal will tell you the two-ply is more elegant. He does not have to wear the cloak in the rain." },
      },
      choices = {
        { text = "Three-ply, waxed. I'll take the advice. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Less, and later. The city sends what it can, but the looms there are busy with tabards and bandages for Ashenvale, and Auberdine is a small voice. I do not complain of it. I only order earlier each season, and hope." },
      },
      choices = {
        { text = "I'll speak for Auberdine when I'm there. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves from the dig buy canvas, a great deal of canvas. I have never asked what they wrap in it." } },
    highborne = { { id = "tp_highborne", text = "Shaldyn's moonflower grows only among their ruins. It seems they left one beautiful thing behind them, after all." } },
    elune = { { id = "tp_elune", text = "I keep the white bolt for the Temple first, always. It is the nearest thing to a prayer a cloth merchant has." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "I am told the cultists at the Master's Glaive wear dark wool, poorly dyed. I should not have sold it to them, had they asked." } },
    background = { { id = "tp_background", text = "I sell tailoring supplies in Auberdine. What I have depends on the boat, and the boat depends on the sea." } },
    advice = { { id = "tp_advice", text = "Buy thread when you see it, not when you need it. On this coast the two are seldom the same day." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood have closed the northern woods, and with them half the plants we dyed with. It is a small sorrow among larger ones." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels come for bandage linen and never haggle. I give them the best bolt and say it is the ordinary one." } },
    _none = { { id = "tp_none", text = "I am afraid I do not know. Thundris Windweaver might, if it is a matter of weight." } },
  },
}

---------------------------------------------------------------------------
-- Jaelysia
---------------------------------------------------------------------------
P:NPC {
  key = "jaelysia", id = TODO_NPC("Jaelysia"), name = "Jaelysia", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "gentle", "firm" }, values = { "animals", "duty" },
  notices = { "class", "pet" },

  impression = {
    first = "Jaelysia keeps the stable in Auberdine and looks after hunters' beasts as if each had been left with her by a friend. She is gentle with animals and somewhat firmer with their owners.",
    third = "{name} met Jaelysia, the stable master of Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome. If you have a companion with you, let it come forward on its own; I like to be introduced properly." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Hello, {pet}. You have had a long walk, I can see it in how you stand. Come and have some water." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Your companion has been well, and has eaten better than you have, I would guess." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Before you ask about room in the stable, tell me when your companion last rested for a whole day." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} is watching the door and not the food. Something on the road frightened it. I would keep it close tonight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jaelysia, and I keep the stable for Auberdine. Hunters leave their companions with me when they take the boat or go where a beast cannot follow, and I see that each is fed, walked and spoken to until its hunter returns." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? Softly, the owl is sleeping." },
        { id = "h_again2", text = "Go on. I can listen while I fill the troughs." },
        { id = "h_again3", text = "Something more?" },
      },
      choices = {
        { text = "I'd like to stable my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What beasts do you look after?", next = "beasts" },
        { text = "Do the animals sense what's wrong on this coast?", next = "sense" },
        { text = "Hunters leave their beasts for long?", next = "leave" },
        { text = "Which of Darkshore's beasts would you tame?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I speak with beasts. May I ask yours what they've seen?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Which companions do Sentinel hunters favour?", next = "hnt_sent", when = { class = "HUNTER" } },
        { text = "My companion has been with me since Teldrassil.", next = "hnt_tel", when = { class = "HUNTER", race = "NightElf" } },
        { text = "A Horde hunter would never get a stall here, I suppose.", next = "hnt_horde", when = { class = "HUNTER", minLevel = 15 } },
        { text = "Thank you, Jaelysia.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "beasts_default", text = "Nightsabers and owls from our own people, mostly. Since the boats, a great grey wolf from the human lands who howls at the tide, and a dwarf's bear that has eaten more than the rest together. I had never kept a bear. He is very gentle, and he snores." },
      },
      choices = {
        { text = "And the hunters themselves?", next = "beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts2 = {
      lines = {
        { id = "beasts2_default", text = "Some are better than their beasts, and some are not. I had a young man leave a saber here thin as a rake, and I kept her a week longer than he paid for and sent him away twice. When he came the third time he had learned to ask how she was before he asked for her. Then I let her go." },
      },
      choices = {
        { text = "You were right. A beast is owed good care.", next = "BACK", reply = "I think so. Caylais at the hippogryph roost said I had overstepped. She then asked me to look at one of her own.", fx = { align = { light = 1 } } },
        { text = "It was his beast. That wasn't your place.", next = "BACK", reply = "Perhaps not. I would do it again tomorrow, and I told him so.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sense = {
      lines = {
        { id = "sense_default", text = "Long before we did. The sabers will not face north at night. The owls came down from the trees near the Blackwood dens two seasons ago and roost in my rafters now, uninvited. I told Tharnariun Treetender, and he looked as though I had confirmed something he had hoped was not so." },
      },
      choices = {
        { text = "What did he say?", next = "sense2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sense2 = {
      lines = {
        { id = "sense2_default", text = "That the bears were the worst of it, and that he had begun asking travelers to put the sickest out of their pain. He did not like saying it. I gave him the name of every hunter I trust to do it cleanly, and I have not asked him how many he has sent." },
      },
      choices = {
        { text = "A hard kindness. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    leave = {
      lines = {
        { id = "leave_default", text = "A day, for the boat to Rut'theran. A month, for those who go south to Ashenvale and find it worse than they expected. And one owl has been with me three years. Her hunter went to the Master's Glaive and did not return. She still looks up when the door opens." },
      },
      choices = {
        { text = "Keep her. She's found her home with you.", next = "BACK", reply = "I think she has. I have stopped calling her a guest.", fx = { align = { order = 1 } } },
        { text = "Let her fly. She shouldn't wait forever.", next = "BACK", reply = "The door is never shut. She could go any night. She has not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "A moonstalker from the southern hills, if you have the patience; they are clever and they bond deeply. Not a bear from the north, however fine it looks. Whatever is in them does not leave when the taming is done, and I have had to help put two down." },
      },
      choices = {
        { text = "Moonstalker, from the south. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "You may, and I should be grateful to hear it. Ask the old saber in the end stall. She came down from Cliffspring last year and will not go near running water since. I have always wanted to know what she saw in it." },
      },
      choices = {
        { text = "I'll sit with her a while. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hnt_sent = {
      lines = { { id = "hs_d", text = "Nightsabers, when they can win one, and owls for the scouts who need eyes above the canopy. The Sentinels do not keep pets as your kind do, they keep sisters, and a sentinel's saber will sit at her grave for a week if she falls." } },
      choices = {
        { text = "I'd like a companion like that.", next = "hnt_sent2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hnt_sent2 = {
      lines = { { id = "hs2_d", text = "Then do not look for one, let it find you, and be worth finding when it does. That is the only advice my mother gave me about beasts, and I have not needed any other since." } },
      choices = { { text = "Be worth finding. I'll remember. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hnt_tel = {
      lines = { { id = "ht_d", text = "I can tell, for it looks at the sea the way the young ones do, as if it has never seen so much water without a tree in it. Teldrassil's beasts are clean of the corruption, so keep it away from the thistle bears up north, and it will stay that way." } },
      choices = { { text = "I'll keep it clean. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    hnt_horde = {
      lines = { { id = "hh_d", text = "Not here, though I have heard that their hunters keep their wolves and raptors with the same care we keep our sabers. A beast does not know which banner its master serves, and I would feed one if it came to my door hungry, whatever my sisters thought of it." } },
      choices = {
        { text = "A beast is a beast. I'd feed it too.", next = "BACK", reply = "Then we understand each other, and we will keep it between us.", fx = { align = { honor = 1 } } },
        { text = "Their beasts carry their riders. I'd turn it away.", next = "BACK", reply = "Spoken like a Sentinel. I will not argue it, but I will not change my mind either.", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves brought a pack ram that eats my rope. I have grown fond of him, and I keep the rope higher now." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "No beast will go willingly toward the Master's Glaive. I had a saber refuse the southern road altogether last month." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "Tharnariun Treetender comes to sit with the sick ones. He cannot always heal them, but they are calmer when he has been." } },
    elune = { { id = "tp_elune", text = "The owls wake at moonrise and all look the same way for a breath. I have never found a better hour for a prayer." } },
    background = { { id = "tp_background", text = "I keep Auberdine's stable. Every beast here was left with me in trust, and I treat it so." } },
    furbolgs = { { id = "tp_furbolgs", text = "The owls fled the woods near the Blackwood dens and live in my rafters now. The beasts knew before any of us." } },
    advice = { { id = "tp_advice", text = "Rest your companion one day in seven, whatever the hurry. A tired beast makes a hunter's mistakes for them." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels' sabers come to me when they are lamed. I send them back sound, and the Sentinels pretend not to have been worried." } },
    _none = { { id = "tp_none", text = "I do not know. Most of what I know, I learned from creatures that cannot be asked directly." } },
  },
}
