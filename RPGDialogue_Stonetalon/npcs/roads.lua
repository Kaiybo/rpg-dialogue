-- Stonetalon between the towns (0.38.0): a goblin's hut at Windshear Crag, Sun Rock's seed-keeper, and Kaya on the road home. Voice: bibles/stonetalon.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "ziz", id = TODO_NPC("Ziz Fizziks"), name = "Ziz Fizziks", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "windshear_crag" }, temper = { "shifty" }, values = { "ambitious", "inventive" },
  impression = {
    first = "Ziz Fizziks is a goblin hiding in a hut at Windshear Crag, right under the Venture Company's nose. He wants their shredder plans, and he isn't fussy about who fetches them.",
    third = "{name} met Ziz Fizziks, a goblin at Windshear Crag with designs on the Venture Company's machines.",
  },

  greetings = {
    { id = "g_default", text = "Psst, over here, and keep it down! The Venture boys have ears like bats and tempers like trolls." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and nobody followed you, right? Good, because I'm not set up for visitors with axes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Name's Ziz Fizziks, freelance engineer and a man of vision, and that vision is the Venture Company's Super Reaper 6000. Their operators carry the blueprints, so if you happen to take some off them, I'll make it worth your while." },
        { id = "h_cond", when = { race = "Gnome" }, text = "A gnome! Now you'd appreciate a good set of shredder schematics, wouldn't you? Don't answer that, I don't want any competition." },
      },
      again = {
        { id = "h_again1", text = "What else? Make it quick, the shift changes soon." },
        { id = "h_again2", text = "Anything else, pal?" },
      },
      choices = {
        { text = "What's the Super Reaper 6000?", next = "reaper" },
        { text = "Why do you hate the Venture Company?", next = "venture" },
        { text = "Isn't it dangerous hiding here?", next = "crag" },
        { text = "I'd only want a peek at the schematics.", next = "gnome", when = { race = "Gnome" } },
        { text = "Good luck with your machine.", next = "END" },
      },
    },
    reaper = {
      lines = {
        { id = "reaper_default", text = "Only the finest tree-chopping shredder ever built, and the Venture Company's using it to strip Stonetalon bare. Me, I'd put it to better uses, and sell it to the highest bidder, naturally." },
      },
      choices = {
        { text = "Better uses? You'd sell it too.", next = "reaper2" },
      },
    },
    reaper2 = {
      lines = {
        { id = "reaper2_default", text = "Course I would, I'm a goblin! The druids say the machines are killing the mountain, and the Venture boys say it's only business, and I say both can be true at once." },
      },
      choices = {
        { text = "The mountain matters more than profit.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Business is business. Get the plans, sell them.", next = "BACK", fx = { align = { order = -1 }, trait = { greedy = 1 } } },
      },
    },
    venture = {
      lines = {
        { id = "venture_default", text = "Hate's a strong word, pal, I just don't like being fired. I built half their gears, and they sacked me without so much as a copper bonus." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crag = {
      lines = {
        { id = "crag_default", text = "Sure it is, but nobody looks for a goblin right under their own noses. Besides, the view of the burning forest is very inspiring, for an engineer." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gnome_default", text = "A peek, he says, as if a gnome ever stopped at a peek! Fine, bring me the blueprints and you can look, but no taking notes." },
      },
      choices = {
        { text = "Deal. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an engineer, between employers, with very big plans." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal, and I don't do anything for free." } },
  },
}

P:NPC {
  key = "tsunaman", id = TODO_NPC("Tsunaman"), name = "Tsunaman", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "gentle" }, values = { "hopeful", "nature" },
  impression = {
    first = "Tsunaman is a tauren of Sun Rock Retreat who plants new life where the Venture Company has cut the forest down. He works slowly, and he means to outlast the machines.",
    third = "{name} met Tsunaman, a tauren of Sun Rock Retreat replanting the scarred woods of Stonetalon.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Sun Rock, traveller. Mind the seedlings by the path; they're younger than they look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and the seedlings are taller than when you left. You see, it works." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tsunaman, and I plant what others cut down. The Venture Company has stripped the Charred Vale and the woods below, and the Earth Mother will heal them, but she's glad of a little help." },
        { id = "h_cond", when = { race = "Tauren" }, text = "A shu'halo! Then you know the land is our mother, and a child does not stand by while his mother is hurt." },
      },
      again = {
        { id = "h_again1", text = "What else, friend?" },
        { id = "h_again2", text = "Ask what you like while I sort these seeds by size." },
      },
      choices = {
        { text = "What are you planting?", next = "seeds" },
        { text = "What happened to the Charred Vale?", next = "vale" },
        { text = "How is Sun Rock holding?", next = "sunrock" },
        { text = "I'll help heal her.", next = "tauren", when = { race = "Tauren" } },
        { text = "May the seeds take root.", next = "END" },
      },
    },
    seeds = {
      lines = {
        { id = "seeds_default", text = "Gaea seeds, which grow quickly where the earth is wounded, if they're planted in the right places. I need hands to carry them to the burned ground, where the Venture shredders still roam." },
      },
      choices = {
        { text = "Won't the goblins just cut them down again?", next = "seeds2" },
      },
    },
    seeds2 = {
      lines = {
        { id = "seeds2_default", text = "Perhaps, but then I'll plant more, and the forest is more patient than any goblin's purse. Some of my people would rather drive the Venture Company out first, and some say we should heal before we fight." },
      },
      choices = {
        { text = "Heal first. Anger only burns more forest.", next = "BACK", fx = { align = { light = 1 }, trait = { patient = 1 } } },
        { text = "Drive them out first, or the planting is wasted.", next = "BACK", fx = { align = { light = -1 }, trait = { fierce = 1 } } },
      },
    },
    vale = {
      lines = {
        { id = "vale_default", text = "Fire, and the Venture Company, and the Grimtotem who don't care either way. The vale was green when I was a calf, and I mean for it to be green again before I'm an elder." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sunrock = {
      lines = {
        { id = "sunrock_default", text = "We are a small place, but the cliffs keep us safe and Maggran Earthbinder keeps us steady. The Grimtotem trouble us more than the goblins do, lately." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "Then take a seed with you when you leave Stonetalon, and plant it somewhere that needs it. The Earth Mother keeps track, I think, of every one." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a planter of seeds, and Sun Rock is my home." } },
    _none = { { id = "tp_none", text = "That I don't know, but the earth might, if you listen long enough." } },
  },
}

P:NPC {
  key = "kaya", id = TODO_NPC("Kaya Flathoof"), name = "Kaya Flathoof", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "brave" }, values = { "family", "determined" },
  impression = {
    first = "Kaya Flathoof is a young tauren who survived the Grimtotem attack on Camp Aparaje and wants only to get home to Sun Rock. She is frightened and refuses to show it.",
    third = "{name} met Kaya Flathoof, a young tauren trying to get home to Sun Rock after the Grimtotem attack.",
  },

  greetings = {
    { id = "g_default", text = "You're not Grimtotem! Oh, thank the Earth Mother, I thought they'd found me." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Please, are we leaving now? I'd like to see Sun Rock before nightfall." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Kaya Flathoof, and the Grimtotem fell on our camp, and I've been hiding ever since. My uncle is at Sun Rock, and I think he must believe I'm dead, so will you walk me home?" },
        { id = "h_cond", when = { race = "Tauren" }, text = "Shu'halo! You'll know the Grimtotem are tauren too, which makes this worse, doesn't it? They're our own people, and they did this." },
      },
      again = {
        { id = "h_again1", text = "I'll answer anything you like, if it means we're closer to leaving." },
        { id = "h_again2", text = "Ask, but please, let's not wait too long." },
      },
      choices = {
        { text = "Why did the Grimtotem attack?", next = "grimtotem" },
        { text = "Who's waiting for you at Sun Rock?", next = "uncle" },
        { text = "Is the road dangerous?", next = "road" },
        { text = "They've betrayed every tauren.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll take you home soon, Kaya.", next = "END" },
      },
    },
    grimtotem = {
      lines = {
        { id = "grimtotem_default", text = "They hate anyone who follows Cairne, and they want Stonetalon for themselves. They came at night with clubs and torches, and they didn't care who was asleep." },
      },
      choices = {
        { text = "What should be done with them?", next = "grimtotem2" },
      },
    },
    grimtotem2 = {
      lines = {
        { id = "grimtotem2_default", text = "Some of the elders say we must make peace with them for the sake of the shu'halo, and others say they've earned a war. I'm too tired to know which is right." },
      },
      choices = {
        { text = "Peace, if they'll take it. They're still tauren.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They attacked sleeping people. They've earned a war.", next = "BACK", fx = { align = { order = -1 }, trait = { fierce = 1 } } },
      },
    },
    uncle = {
      lines = {
        { id = "uncle_default", text = "My uncle, and he worries about everything, so he'll be beside himself by now. I'd like to see his face when I walk in, even if he shouts at me after." },
      },
      choices = {
        { text = "He'll be glad to see you.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_default", text = "The Grimtotem watch it, and they'll ambush us if they see me leave. Stay close, please, and don't let me fall behind." },
      },
      choices = {
        { text = "I'll stay close.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "They have, and when I'm home I'll tell the Bluff so, if anyone asks a young cow what she thinks. Thank you for saying it out loud." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Kaya, from Camp Aparaje, though there isn't much of the camp left now." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. I only want to get home." } },
  },
}
