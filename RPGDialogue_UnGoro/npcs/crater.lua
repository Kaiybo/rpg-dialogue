-- Un'Goro beyond the Refuge's fire: Hol'anyee Marshal, Torwa Pathfinder, the bloodpetal growers, and the lost souls down in the crater.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "holanyee", id = TODO_NPC("Hol'anyee Marshal"), name = "Hol'anyee Marshal",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Hol'anyee Marshal is Williden's sister and co-leader of the expedition, a sharpshooter who takes the crater's dangers personally.",
    third = "{name} met Hol'anyee Marshal, co-leader of the Marshal Expedition at Marshal's Refuge.",
  },
  greetings = {
    { id = "g_main", text = "Hold up there. Let me see if you're injured before you come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back, and in one piece. That's more than I can say for my brother's tent." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hol'anyee Marshal, Williden's sister and the better shot of the two of us, whatever he tells you. While he plans, I go out and keep the raptors from eating our scholars." },
        { id = "h_c0", when = { class = "HUNTER" }, text = "A hunter! Finally, someone who understands why I sleep with my rifle. The raptors here hunt like nothing else in Azeroth." },
      },
      again = { { id = "h_again", text = "What else? I've got a patrol soon." }, { id = "h_again2", text = "Ask away, quickly." } },
      choices = {
        { text = "What's it like hunting in the crater?", next = "b1_1" },
        { text = "Tell me about Williden.", next = "b2_1" },
        { text = "Why did the camps fall?", next = "b3_1" },
        { text = "I'll fight anything down there.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should the expedition pull out?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Like nothing else in the world, and I've hunted a good deal of it. The raptors hunt in packs and think like soldiers, and the devilsaurs don't think at all; they just eat." } },
      choices = { { text = "You lost scouts?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I lost two good scouts to raptors in the first month, which taught me to always watch my flanks. Now I teach that lesson to everyone who comes to the Refuge." } },
      choices = { { text = "Never chase a lone raptor?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you go hunting down there, never chase a lone raptor. There's never only one." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "He's my brother, he's brilliant, and he worries too much, which makes him a decent leader and a terrible camper. I love him, and I wouldn't let anyone else watch his back." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "We pushed in too fast, too far, and the crater pushed back. I told Williden we needed more guards, and he agreed, and we still didn't have enough." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Brave words, and maybe you can. Just remember, the crater doesn't care how brave you are, only how fast you can run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Williden won't give up, and part of me admires him for it. The other part wonders how many more we'll lose." } },
      choices = { { text = "Keep going. Discovery is worth the risk.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Pull out before you lose anyone else.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, and I don't think the crater does either." } } },
}

P:NPC {
  key = "torwa", id = TODO_NPC("Torwa Pathfinder"), name = "Torwa Pathfinder",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Torwa Pathfinder is a tauren hunter camped near the Refuge who has set his sights on the great raptor Lar'korwi.",
    third = "{name} met Torwa Pathfinder, a tauren hunter in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "The Earth Mother walks here, stranger, and so do great beasts. Tread carefully." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, hunter. The trails have missed you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Torwa Pathfinder. I came to this crater to learn from its beasts, and the greatest of them, Lar'korwi, has become my teacher and my quarry." },
        { id = "h_c0", when = { questActive = TODO_QUEST("The Bait for Lar'korwi") }, text = "Lay the bait where Lar'korwi hunts, and be ready, for he will come quickly and he will not come gently." },
      },
      again = { { id = "h_again", text = "What else would you know?" }, { id = "h_again2", text = "Speak, hunter." } },
      choices = {
        { text = "Who is Lar'korwi?", next = "b1_1" },
        { text = "Why come to Un'Goro?", next = "b2_1" },
        { text = "Is it dangerous out here?", next = "b3_1" },
        { text = "The Earth Mother guide you, Torwa.", next = "x_1", when = { race = "Tauren" } },
        { text = "Should Lar'korwi be left alone?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The greatest of the crater's raptors, the one the others follow. I have tracked him for many moons, and he has led me to places no other hunter has seen." } },
      choices = { { text = "Hunting as honor?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "To hunt him is to honor him. I will not take him lightly, nor will I take him without purpose, for he deserves a hunter's respect." } },
      choices = { { text = "And then?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "When he falls, his strength will feed many, and his spirit will return to the Earth Mother. That is the way of things." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "This crater is like the world when it was young. The Earth Mother's children here are stronger and older, and a hunter can learn much from them." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Very, but so is all of life. A hunter who fears danger does not hunt, and a hunter who does not respect it does not live." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "And you, kin. It is good to see a tauren face so far from Mulgore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge say the beast should be left in peace. I say the hunt is part of the balance." } },
      choices = { { text = "The hunt is part of the balance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Some beasts should be left to live.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is not something the trails have taught me." } } },
}

P:NPC {
  key = "muigin", id = TODO_NPC("Muigin"), name = "Muigin",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Muigin tends unusual plants at Marshal's Refuge and talks about bloodpetals with real affection.",
    third = "{name} met Muigin, a botanist at Marshal's Refuge.",
  },
  greetings = {
    { id = "g_main", text = "Oh! Mind the sprouts, please, they're very delicate." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! The sprouts are growing nicely, thank you for asking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Muigin, botanist! I study the plants of Un'Goro, especially the bloodpetals, which are as fascinating as they are dangerous. My partner Larion and I have been experimenting with them." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Muigin and Larion") }, text = "Bring me those bloodpetal sprouts, and mind the ones that bite. They're very hungry this time of year." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Ask me about the plants!" } },
      choices = {
        { text = "What are bloodpetals?", next = "b1_1" },
        { text = "Who is Larion?", next = "b2_1" },
        { text = "Do the plants really bite?", next = "b3_1" },
        { text = "Is there magic in that sap?", next = "x_1", when = { class = { "MAGE", "DRUID" } } },
        { text = "Is it right to experiment on living plants?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Carnivorous plants, and very clever ones, which is why I love them. They lure insects and small creatures, and sometimes larger creatures, too, if they're hungry enough." } },
      choices = { { text = "Amazing properties?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Larion and I believe their sap has amazing properties, though we're still working out exactly which ones. It's very exciting." } },
      choices = { { text = "Both?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "And very dangerous, of course, but exciting! Science is often both." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "My research partner, and a very patient one. He handles the field collection and I handle the analysis, though we argue about which part is harder." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Oh, yes, and some of them quite hard. I've lost two pairs of gloves and nearly a finger." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, wonderful, someone who asks the right question! It's a mana-reactive compound, I'm almost certain, though Larion says I'm guessing. I'm not guessing, I'm hypothesizing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge think the plants should be left alone. I think understanding them is the highest form of respect." } },
      choices = { { text = "Understanding is a form of respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Leave the crater's plants in peace.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but it probably grows somewhere in the crater!" } } },
}

P:NPC {
  key = "ringo", id = TODO_NPC("Ringo"), name = "Ringo",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Ringo is a lost expedition member who wandered too far into the crater and could barely keep going.",
    third = "{name} met Ringo, a lost member of the Marshal Expedition in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "Oh, thank goodness, a person! I thought I'd never see another face." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I wasn't sure you would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ringo, of the Marshal Expedition, or I was until I got lost. I've been wandering for days, and I'm so tired and thirsty I can barely stand." },
        { id = "h_c0", when = { questActive = TODO_QUEST("A Little Help From My Friends") }, text = "You'll take me back to the Refuge? Please, and if I faint, use the water from the spring, it brings me round." },
      },
      again = { { id = "h_again", text = "What else? I'm listening, barely." }, { id = "h_again2", text = "Go on, I'm just resting my eyes." } },
      choices = {
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who's Spraggle?", next = "b2_1" },
        { text = "Are you hurt?", next = "b3_1" },
        { text = "Let me tend to you before we go.", next = "x_1", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "Should you have gone alone?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was looking for crystals out past the ridge, and I followed a trail I shouldn't have. By the time I turned back, everything looked the same." } },
      choices = { { text = "Drinking from puddles?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I've been hiding from the raptors and drinking from puddles, which I don't recommend. Spraggle must be frantic." } },
      choices = { { text = "Owe me everything?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you get me home, I'll owe you everything, and Spraggle will too." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Spraggle Frock, my friend at the Refuge, and the worrier of the expedition. If anyone's been looking for me, it's Spraggle." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Not badly, just exhausted and very, very thirsty. The crater's heat takes everything out of you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, that feels better already. Thank you, friend, I didn't think I'd last another night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Williden told us to always go in pairs. I didn't listen, and look where it got me." } },
      choices = { { text = "Rules exist for good reason. Follow them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Sometimes you have to take your own path.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, I'm too tired to think about it." } } },
}

P:NPC {
  key = "krakle", id = TODO_NPC("Krakle"), name = "Krakle",
  bible = "bibles/ungoro.md", role = "citizen", tier = "service",
  impression = {
    first = "Krakle is a goblin who has taken a great interest in the hot springs of Un'Goro, mostly the profitable kind.",
    third = "{name} met Krakle, a goblin near the hot springs of Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "Hey, careful there, friend! The water's hotter than it looks." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Got any readings for me?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Krakle's the name, and the hot springs are my game. These springs are boiling with heat and minerals, and somebody's going to figure out how to sell them." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Talk quick, the springs won't wait." } },
      choices = {
        { text = "What's special about the springs?", next = "b1_1" },
        { text = "Is it safe here?", next = "b2_1" },
        { text = "Should these springs be sold?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They're hot, they're full of strange minerals, and some of them glow. Something's heating them from deep underground, and I'd love to know what." } },
      choices = { { text = "Something bigger?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Maybe it's the Fire Plume, or maybe it's something bigger. Either way, heat like that is worth money." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe enough, if you don't fall in. The bigger danger is the beasts that come to drink, so keep your eyes open." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge say the crater shouldn't be bought and sold. I say everything's for sale, if the price is right." } },
      choices = { { text = "Nature shouldn't be for sale.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Profit is how anything gets done.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, friend, but I bet it's worth something." } } },
}
