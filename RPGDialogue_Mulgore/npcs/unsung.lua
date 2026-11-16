-- Mulgore's working people with no quests of their own: Camp Narache's trainers and
-- Bloodhoof Village's warrior trainer, weaponsmith and baker. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Camp Narache
---------------------------------------------------------------------------

-- Harutt Thunderhorn: Camp Narache's warrior trainer.
P:NPC {
  key = "harutt", id = TODO_NPC("Harutt Thunderhorn"), name = "Harutt Thunderhorn", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "steady" }, values = { "brave", "patient" },
  notices = { "class", "weary" },
  impression = {
    first = "Harutt Thunderhorn trains the young braves of Camp Narache, a broad, slow-spoken tauren who teaches strength as a kind of patience. He seems to count every brave who leaves the camp as one of his own.",
    third = "{name} met Harutt Thunderhorn, the warrior trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_war", when = { class = "WARRIOR" }, text = "Come, young brave, and plant your hooves. Let us see what the plains have taught you since you last stood here." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Walk with the Earth Mother, friend. You are not one of my braves, but you are welcome at my fire." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "The quilboar have been at you, I see, and your armor shows every tusk. Rest before you go back down the ravine, because pride heals slower than a bruise." },
    { id = "n_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "An orc warrior on our mesa, and a long way from Durotar. Your people fight like a storm, but here you might learn to fight like a mountain." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Harutt Thunderhorn, and I teach the young braves of Narache to stand firm. A tauren is strong from birth, but strength without patience only breaks things." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Your arms are thicker than when you came to me, young one, and your stance is better. Are you ready to learn more?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You carry totems on your belt, young one, and that is a heavy load for a brave. Carry it as patiently as you would carry a spear." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Must a shaman be as strong as a warrior, Harutt?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does patience have to do with fighting?", next = "patience" },
        { text = "What dangers face the camp?", next = "danger" },
        { text = "Who else trains here?", next = "others" },
        { text = "Farewell, Harutt.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will, young one. The sun is high, and there is time." },
        { id = "h_again2", text = "Something more? Speak, and I will listen." },
      },
    },
    patience = {
      lines = { { id = "p_default", text = "The kodo does not run at every noise, and that is why the wolves cannot move it. A brave who waits for the right moment strikes once, and a brave who charges at everything is tired when the real enemy comes." } },
      choices = {
        { text = "Then I'll learn to wait.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Sometimes you must strike first and hard.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "The Bristleback quilboar who dig in Brambleblade Ravine, below the mesa, and the plainstriders and battleboars that roam the grass. Grull Hawkwind sends the braves against them, and I make sure they come back." } },
      choices = { { text = "Why do the quilboar attack you?", next = "danger_why" } },
    },
    danger_why = {
      lines = { { id = "dw_default", text = "They are greedy for land, and they think Red Cloud Mesa should belong to them. Chief Hawkwind would share the plains with almost anyone, but the quilboar do not want to share anything." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "Meela Dawnstrider teaches the shaman, and Gart Mistrunner the druids, and Lanka Farshot the hunters. Between the four of us, every young tauren learns something before they walk down to Bloodhoof." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Stronger, in the way that matters, because the elements will not be bullied and a shaman must not bend to them either. Strength without patience breaks things, and with the elements it breaks you first." } },
      choices = {
        { text = "Then I'll learn patience before I ask for power.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements answer the bold. Patience is for the old.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That I do not know, young one. Ask Grull or the chief, who see farther than I do." } },
  },
}

-- Meela Dawnstrider: Camp Narache's shaman trainer.
P:NPC {
  key = "meela", id = TODO_NPC("Meela Dawnstrider"), name = "Meela Dawnstrider", title = "Shaman Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "serene" }, values = { "wise", "kind" },
  notices = { "class", "form" },
  impression = {
    first = "Meela Dawnstrider teaches the young shaman of Camp Narache to listen to the elements before speaking to them. She is gentle, but she has no patience for anyone who treats the spirits like servants.",
    third = "{name} met Meela Dawnstrider, the shaman trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "The wind told me you were coming, young one. Sit with me, and tell me what the elements have whispered to you." },
    { id = "g_other", when = { ["not"] = { class = "SHAMAN" } }, text = "Peace be on you, traveler. The morning is clear, and the spirits are calm." },
  },
  notice = {
    { id = "n_ghost", cat = "form", when = { form = { "ghostwolf" } },
      text = "You come to me on four legs and wrapped in spirit, and that is good. The ghost wolf carries you only because the spirits allow it, so thank them when you change back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Meela Dawnstrider, and I teach the young shaman of Narache to hear the earth, fire, water and air. The elements are not tools, and the first lesson is learning to listen before you ask them for anything." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "You have been listening to the spirits, I can tell, because you walk more softly than you did. Are you ready for a new lesson?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How do you listen to the elements?", next = "listen" },
        { text = "Who taught the tauren the shaman's way?", next = "tradition" },
        { text = "I'm an orc shaman. Is our way different?", next = "orc", when = { race = "Orc" } },
        { text = "Farewell, Meela.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else would you know? The wind can wait for us." },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "Sit still on the grass until you can feel the earth under you, and then wait until you can feel the wind on your face without thinking about it. When you stop noticing yourself, the spirits begin to notice you." } },
      choices = { { text = "What if they never answer?", next = "listen_none" } },
    },
    listen_none = {
      lines = { { id = "ln_default", text = "Then you are still talking inside your own head, and you should try again tomorrow. The spirits answer everyone in time, but they do not answer anyone who is in a hurry." } },
      choices = {
        { text = "The spirits deserve that respect.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If they won't answer, I'll find power elsewhere.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tradition = {
      lines = { { id = "t_default", text = "No one taught us; the tauren have always spoken with the spirits of the earth, as long as there have been tauren. Our elders say the Earth Mother gave us her ears so we would never be lonely on the plains." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "o_default", text = "The orcs lost the elements for a time and found them again through Thrall, so your way is younger and fiercer than ours. The spirits are the same spirits, though, and they were glad to have your people back." } },
      choices = { { text = "That's good to hear.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not mine to know, little one. Ask the elders at Bloodhoof, or the chief." } },
  },
}

-- Gart Mistrunner: Camp Narache's druid trainer.
P:NPC {
  key = "gart", id = TODO_NPC("Gart Mistrunner"), name = "Gart Mistrunner", title = "Druid Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class", "form" },
  impression = {
    first = "Gart Mistrunner trains the young druids at Camp Narache and speaks of the night elves who taught his people with real gratitude. He is quiet, and more interested in the creatures of Mulgore than in anything said around the fire.",
    third = "{name} met Gart Mistrunner, the druid trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome back, young druid. The plains have been good to you, I think, because you walk like you belong on them." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "Welcome, friend. The grass is green on the mesa this season, which is a good sign." },
  },
  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear" } },
      text = "You stand before me as a bear, and you wear the shape well. Remember that the bear is strong because it is patient, not because it is angry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gart Mistrunner, and I teach the young druids of Narache. We learn to take the shapes of the beasts and to heal the land, as the Earth Mother wishes." },
        { id = "h_druid", when = { class = "DRUID" }, text = "Each time you come back, I can see more of the wild in you. What will you learn this time?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The creatures of Mulgore grow calmer when one of your kind walks among them, and I wonder if you've noticed." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Who taught the tauren to be druids?", next = "history" },
        { text = "What does a druid do for Mulgore?", next = "land" },
        { text = "I'm a night elf druid as well.", next = "elf", when = { race = "NightElf" } },
        { text = "Do the elements and the beasts share the same spirits, Gart?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Farewell, Gart.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will, and I will answer as well as I can." },
      },
    },
    history = {
      lines = { { id = "h2_default", text = "The demigod Cenarius taught us long ago, in the time of the ancient war, and the knowledge never left us. Today the Cenarion Circle still welcomes tauren in Moonglade, though not every elf is pleased about it." } },
      choices = { { text = "Do the elves resent you?", next = "history_elves" } },
    },
    history_elves = {
      lines = { { id = "he_default", text = "Some do, because we stand with the Horde and the orcs cut down their forests in Ashenvale. But a druid is a druid first, and in Moonglade we try to remember that, whatever our peoples do outside it." } },
      choices = {
        { text = "Nature matters more than any war.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Horde comes first, even for druids.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    land = {
      lines = { { id = "l_default", text = "We watch the herds and the grass, and we notice when something goes wrong with them before anyone else does. The plainstriders near the ravine have been restless, and I think the quilboar are to blame." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elf = {
      lines = { { id = "e_default", text = "Then you are far from your home, but we follow the same path, and you are welcome by my fire. Your people taught mine long ago, so I owe you thanks at the least." } },
      choices = { { text = "Then we're kin in this.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I don't think they do, though they're neighbors on the same land, the way the kodo and the plainstrider are. The beasts answer the Earth Mother through the wild and the elements answer through stone and wind, and both grow restless when the land is hurt." } },
      choices = {
        { text = "Each spirit has its place, and the elders are right to keep them there.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spirits mingle freely. Lines the elders draw don't bind them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the beasts and the grass, but I don't know that. Ask Grull Hawkwind." } },
  },
}

---------------------------------------------------------------------------
-- Bloodhoof Village
---------------------------------------------------------------------------

-- Krang Stonehoof: Bloodhoof Village's warrior trainer.
P:NPC {
  key = "krang", id = TODO_NPC("Krang Stonehoof"), name = "Krang Stonehoof", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "gruff" }, values = { "proud", "dutiful" },
  notices = { "class", "weary" },
  impression = {
    first = "Krang Stonehoof trains warriors in Bloodhoof Village and speaks about Mulgore's borders as if he walked them all himself. He is gruff, and proud that the tauren have become warriors of the Horde.",
    third = "{name} met Krang Stonehoof, the warrior trainer of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior comes down from the mesa! Come here, and let us see whether Harutt taught you anything." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Welcome to Bloodhoof, stranger. Keep your weapon sheathed in the village, and we will get along." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You have been fighting the Venture Company, I think, because only their saws leave marks like that. Get your armor mended before you go back to the mines." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Krang Stonehoof, and I train the warriors of Bloodhoof Village. Since Cairne joined the Horde, our braves fight beside orcs and trolls, and they must learn to fight as well as any of them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? The orcs taught us that a shaman can fight as hard as any warrior, and I'll expect you to prove it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "How do shamans fight beside the Horde's warriors, Krang?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What threats does Mulgore face?", next = "threats" },
        { text = "What do you think of the Horde?", next = "horde" },
        { text = "I'll go.", next = "END" },
      },
      again = { { id = "h_again", text = "What else would you ask of an old warrior? Speak, and be quick about it." } },
    },
    threats = {
      lines = { { id = "t_default", text = "The Venture Company goblins cut down our trees and dig in our hills to the north, and the Palemane gnolls hold Palemane Rock to the southwest. Worse are the dwarves at Bael'dun, who dig into Mulgore's earth without asking anyone." } },
      choices = { { text = "What are the dwarves digging for?", next = "threats_dwarves" } },
    },
    threats_dwarves = {
      lines = { { id = "td_default", text = "Nobody knows for sure, but the earth groans where they dig, and the shaman don't like it. Baine Bloodhoof watches them, and if they go any deeper, the village will have to answer." } },
      choices = {
        { text = "Drive them out before they do harm.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Talk to them first. War should be the last choice.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "h2_default", text = "The orcs saved us from the centaur when we were wandering and dying, and Thrall asked nothing for it but friendship. That's a debt I will pay with my axe until the day I die." } },
      choices = { { text = "That's a good reason to fight.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Close and hard, the way Thrall's own shamans fought when they broke open the internment camps. A shaman who hides behind the braves isn't worth the totems, so plant yours where the fighting is and swing a mace while they work." } },
      choices = {
        { text = "I'll stand at the front, where the braves can see me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A clever shaman strikes where the enemy isn't looking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is beyond an axe-teacher, friend, so take your question to Baine Bloodhoof." } },
  },
}

-- Mahnott Roughwound: Bloodhoof Village's weaponsmith.
P:NPC {
  key = "mahnott", id = TODO_NPC("Mahnott Roughwound"), name = "Mahnott Roughwound", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "dry" }, values = { "practical", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Mahnott Roughwound sells weapons in Bloodhoof Village and has opinions on every one of them. He says a tauren needs a big weapon simply because a small one looks silly in tauren hands.",
    third = "{name} met Mahnott Roughwound, the weaponsmith of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_shop", text = "Maces, axes and staves, all made big enough for a tauren's hands. Take a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend? I hope you're here to buy, and not to complain about the last one." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You work the forge as well, I can see it on your hands. Then you know a good haft from a bad one, so I won't waste your time with the bad ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mahnott Roughwound, and I sell weapons to the braves of Bloodhoof. Most of what I have is heavy, because a tauren with a little dagger looks like a kodo wearing a hat." },
        { id = "h_small", when = { race = { "Troll", "Scourge" } }, text = "I am Mahnott Roughwound, and I sell weapons, though most of mine are made for tauren hands. Look anyway, because I keep a few smaller ones for our friends from the Horde." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Shaman, eh? Then you'll want a good mace or a heavy axe, and I have both, because a totem alone won't stop a charging quilboar." },
      },
      choices = {
        { text = "What weapon suits a shaman of the plains, Mahnott?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where does your wood and iron come from?", next = "materials" },
        { text = "What weapon would you choose for me?", next = "advice" },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, or are you ready to buy something heavy?" } },
    },
    materials = {
      lines = { { id = "m_default", text = "The wood comes from the trees near the lakes, the ones the Venture Company hasn't cut down yet, and the iron is traded down from Thunder Bluff. The goblins would sell me iron too, but only after they have stolen the hills to make it." } },
      choices = {
        { text = "Trade with goblins is still trade.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Good. Don't buy from thieves.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Something you can swing all day without your arms going numb, because the plains are big and the fights are long. Don't buy the biggest one just because it looks good on you." },
        { id = "a_hunter", when = { class = "HUNTER" }, text = "For a hunter, something on the back for when the beast gets too close and the bow is useless. Most hunters forget that until they're bleeding." },
      },
      choices = { { text = "Show me what you'd choose.", next = "BUSINESS" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A mace, and a heavy one, because you'll want the weight of the earth behind every swing. The orc shamans like axes, and I sell those too, though I'll never understand anyone who wants a small one." } },
      choices = {
        { text = "A sound mace and a steady hand. That's the honest way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever hits hardest when nobody's looking is the right weapon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Weapons I know, but not that. Ask someone else in the village." } },
  },
}

-- Jhawna Oatwind: Bloodhoof Village's baker.
P:NPC {
  key = "jhawna", id = TODO_NPC("Jhawna Oatwind"), name = "Jhawna Oatwind", title = "Baker",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous", "kind" },
  notices = { "hunger", "weary" },
  impression = {
    first = "Jhawna Oatwind bakes the bread of Bloodhoof Village and talks about the wheat of Mulgore as if each field were a neighbour. Nobody leaves her without hearing which farm the grain came from.",
    third = "{name} bought bread from Jhawna Oatwind, the baker of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_shop", text = "Fresh bread from Mulgore's wheat, still warm. Come and have a look, little one." },
    { id = "g_morning", when = { timeOfDay = "dawn" }, text = "You're up with the sun, and so is the bread. Come and take some while it's hot." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Oh, look at you, all scraped up. Eat something before you do anything else, because a hungry fighter makes poor choices." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jhawna Oatwind, and I bake for Bloodhoof Village. The wheat comes from the farms around us, and if you have ever wondered why Mulgore smells so sweet in the morning, it's my ovens." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The old ones used to sing over the first wheat of the season, and I always thought the bread tasted better for it." },
      },
      choices = {
        { text = "Do the old songs over the wheat still matter, Jhawna?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Where does the wheat come from?", next = "wheat" },
        { text = "What's the news in the village?", next = "news" },
        { text = "I can cook too.", next = "cook", when = { profession = "Cooking" } },
        { text = "Farewell, Jhawna.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, little one? The ovens are warm, and so am I." } },
    },
    wheat = {
      lines = { { id = "w_default", text = "From the Wheathoof family and the others on the plains, and they work hard for every sack of it. Ahab Wheathoof's dog Kyle runs off whenever there's food about, so hold on to your bread if you pass his farm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    news = {
      lines = { { id = "n_default", text = "The Venture Company is cutting down our trees north of the village, and nobody is happy about it. The braves are busy with the gnolls and the goblins, and I'm busy feeding the braves." } },
      choices = {
        { text = "The goblins should be driven out.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Maybe Thunder Bluff can bargain with them.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Then you know that good bread needs patience and good flour, and that people only remember the burned loaves. Come by the ovens when you have time, and we can talk recipes." } },
      choices = { { text = "I'd like that.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They matter to me, and to every farmer around the village, because the rains have come strangely this year. Nobody sings over the fields anymore except old Zarlman, and he forgets half the words." } },
      choices = {
        { text = "The old songs should be kept, even over something as plain as wheat.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The songs are pretty, but rain matters more than ritual.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh, I wouldn't know that, little one. I know flour and ovens, and that's about it." } },
  },
}
