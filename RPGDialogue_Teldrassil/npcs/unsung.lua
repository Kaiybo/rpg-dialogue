-- Teldrassil's tradespeople (0.39.0): Dolanaar's bowyer, warrior trainer, alchemist and herbalist,
-- the Maneweavers in their house up the road, and Rut'theran's fishmonger and fishing trainer.
-- Voices: bibles/unsung.md. Forever: the Camping 101 lessons end with Malorne, Nadyia and Radnaal.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jeena Featherbow: bowyer in Dolanaar.
P:NPC {
  key = "jeena", id = TODO_NPC("Jeena Featherbow"), name = "Jeena Featherbow", title = "Bowyer",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "dolanaar" }, temper = { "lively", "frank" }, values = { "craft", "self-reliance" },
  notices = { "class" },
  impression = {
    first = "Jeena Featherbow sells bows and arrows in Dolanaar and will happily tell you everything wrong with the way you hold yours. She is friendly about it, and usually right.",
    third = "{name} met Jeena Featherbow, Dolanaar's frank and cheerful bowyer.",
  },

  greetings = {
    { id = "g_default", text = "Arrows, bows, quivers, whatever you need for the road, and advice for free if you stand still long enough." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? You must be using those arrows, which is the whole idea." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your quiver's half empty. Gnarlpine hide is tough, so you'll want the sharper heads before you go near Ban'ethil." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior wanting a bow? Good. Pulling a harpy down to you is a lot safer than climbing up after her." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jeena Featherbow, and I sell bows and arrows here in Dolanaar. Every young hunter on Teldrassil buys their first quiver from me, and most of them come back to tell me what they shot with it." },
      },
      again = {
        { id = "h_again", text = "What else? I've arrows to fletch, but I can talk while I do it." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "bow" },
        { text = "What should I be shooting around here?", next = "targets" },
        { text = "Do the Sentinels buy from you?", next = "sentinels" },
        { text = "Farewell, Jeena.", next = "END" },
      },
    },
    bow = {
      lines = {
        { id = "bo_default", text = "Wood that bends without arguing and a string that doesn't fray in the damp. The best bows on Teldrassil are cut from fallen branches, never living ones, and anyone who tells you otherwise has never met a druid." },
      },
      choices = {
        { text = "Why only fallen wood?", next = "bow2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bow2 = {
      lines = {
        { id = "bo2_default", text = "Because the tree is alive, and we live in it. It's slower to wait for the wind to bring the wood down, but I'd rather wait than explain myself to the Arch Druid." },
      },
      choices = {
        { text = "That's right. Teldrassil deserves that respect.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A tree this size can spare a branch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    targets = {
      lines = {
        { id = "ta_default", text = "Nightsabers and strigid owls in the woods around the village, and the Gnarlpine furbolgs to the west if Athridas has asked you to deal with them. Keep your distance from the furbolgs and let the arrows do the work." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    sentinels = {
      lines = {
        { id = "se_default", text = "The ones posted in Dolanaar do, when their own fletchers run short. They're fussier customers than any hunter, and I like them better for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Gnarlpine used to be peaceful, but now they snarl at anyone who goes near Ban'ethil. Shoot first if they come running." } },
    background = { { id = "tp_bg", text = "I make and sell bows in Dolanaar. My hands have more splinters than skin." } },
    advice = { { id = "tp_ad", text = "Carry twice the arrows you think you need. You'll lose half of them in the undergrowth." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask Keldamyr at the inn; everyone talks to her." } },
  },
}

-- Kyra Windblade: warrior trainer in Dolanaar; sends warriors on to Elanaria in Darnassus.
P:NPC {
  key = "kyra", id = TODO_NPC("Kyra Windblade"), name = "Kyra Windblade", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "steady", "encouraging" }, values = { "courage", "duty" },
  notices = { "class", "greenness" },
  impression = {
    first = "Kyra Windblade trains Dolanaar's young warriors with steady encouragement, and she seems to measure a student by how they get up rather than how they fall.",
    third = "{name} met Kyra Windblade, the steady warrior trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Dolanaar. If you've come to learn the blade, you've found the right elf." },
    { id = "g_back", when = { metBefore = true }, text = "There you are. You're standing better than last time, so something's sinking in." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { class = "WARRIOR", maxLevel = 6 },
      text = "You're fresh down from Shadowglen, I can tell by the way you hold your shoulders. Relax them before a grell teaches you to." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like someone who'd rather strike from behind. It works, but one day you'll have to face someone, and I'd like you to be ready." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Kyra Windblade, and I train the warriors who come down from Shadowglen. I teach them the basics here in Dolanaar before Darnassus gets them, so that Arias'ta and the others don't have to start from nothing." },
        { id = "h_elanaria", tags = { "news" }, when = { questActive = TODO_QUEST("Elanaria") },
          text = "Elanaria in Darnassus is expecting you. Go up to the Warrior's Terrace, and when she asks what I taught you, tell her I said to keep your feet planted." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, I don't bite." },
        { id = "h_again2", text = "Go on. The next student can wait." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "What comes after Dolanaar for a warrior?", next = "after" },
        { text = "What's the most common mistake you see?", next = "mistake" },
        { text = "Why do so few kaldorei become warriors?", next = "few" },
        { text = "Farewell, Kyra.", next = "END" },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Darnassus, and the trainers on the Warrior's Terrace, then across the sea to Darkshore. Once you're ready, I'll send you to Elanaria, and she'll decide whether you're as good as I've told her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mistake = {
      lines = {
        { id = "mi_default", text = "Charging in alone. Young warriors see a nightsaber and think they'll prove themselves, and then there are three nightsabers, and the priestesses have to carry them back to the moonwell." },
      },
      choices = {
        { text = "Courage means charging in anyway.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Patience wins more fights than courage.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    few = {
      lines = {
        { id = "fe_default", text = "Many of our daughters join the Sentinels, and many of our sons go to the druids, and the blade is left for those of us who fit neither. That suits me, because the ones who choose it really mean to be here." },
      },
      choices = {
        { text = "Did you choose it yourself?", next = "few2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    few2 = {
      lines = {
        { id = "fe2_default", text = "I did. I liked the quiet of the Sentinels' watch, but not the waiting, and a blade doesn't ask you to wait." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sent", text = "The Sentinels guard our forests and our roads, and every warrior I train might one day stand beside them." } },
    background = { { id = "tp_bg", text = "I teach the first lessons of the blade in Dolanaar. Someone has to, and I like seeing them improve." } },
    advice = { { id = "tp_ad", text = "Fight one enemy at a time when you can. Pull them apart and you can beat them all." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. My world is drills and bruises." } },
  },
}

-- Cyndra Kindwhisper: alchemy trainer in Dolanaar.
P:NPC {
  key = "cyndra", id = TODO_NPC("Cyndra Kindwhisper"), name = "Cyndra Kindwhisper", title = "Alchemy Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "soft-spoken", "curious" }, values = { "knowledge", "healing" },
  notices = { "craft" },
  impression = {
    first = "Cyndra Kindwhisper teaches alchemy in Dolanaar and speaks so softly that I leaned in to hear her. She treats every herb as if it had something to tell her.",
    third = "{name} met Cyndra Kindwhisper, the quiet alchemy trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Hello. Please keep your voice low, the tincture is settling." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Have you found any interesting herbs since we last spoke?" },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been picking silverleaf, I can smell it on your gloves. Malorne must be teaching you well." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Cyndra Kindwhisper, and I teach alchemy here in Dolanaar. I show students how to turn what grows on Teldrassil into potions that heal, and I ask them to be gentle with both the plants and the people who drink the result." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Go on, quietly." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What can I make from Teldrassil's herbs?", next = "herbs" },
        { text = "Who do you make potions for?", next = "for" },
        { text = "Goodbye, Cyndra.", next = "END" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf make a healing potion, which is the first thing every alchemist learns. Earthroot will come later, once you've learned to coax a little more out of what you gather." },
      },
      choices = {
        { text = "Where do I find them?", next = "herbs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs2 = {
      lines = {
        { id = "he2_default", text = "In almost every glade between here and Lake Al'Ameth, if you look down while you walk. Malorne Bladeleaf, here in the village, can teach you to gather them without tearing up the roots." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ["for"] = {
      lines = {
        { id = "fo_default", text = "For the Sentinels, mostly, and for anyone who comes back from Ban'ethil bleeding. Lately I've been sending more down to the moonwell than I'd like, because the furbolgs are not as gentle as they used to be." },
      },
      choices = {
        { text = "Should the furbolgs be cured or driven out?", next = "for2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    for2 = {
      lines = {
        { id = "fo2_default", text = "Athridas believes they can be cured, and I'd like to believe it too, because I knew them when they were kind. But a cure does nothing for the scout who comes back with claw marks across her arm." },
      },
      choices = {
        { text = "They were friends once. They deserve a cure.", next = "BACK", fx = { align = { light = 1 }, learn = { "furbolgs" } } },
        { text = "Protect our own first. Drive them out.", next = "BACK", fx = { align = { light = -1 }, learn = { "furbolgs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Gnarlpine have gone wild, and I treat the wounds they leave. I pray Athridas finds a cure." } },
    background = { { id = "tp_bg", text = "I teach alchemy in Dolanaar. It's quiet work, and I'm a quiet person." } },
    advice = { { id = "tp_ad", text = "Keep a healing potion on your belt, not in your pack. You won't have time to dig." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. Perhaps someone at the inn could tell you." } },
  },
}

-- Malorne Bladeleaf: herbalism trainer in Dolanaar. (Forever: ends Camping 101: Herbalism.)
P:NPC {
  key = "malorne", id = TODO_NPC("Malorne Bladeleaf"), name = "Malorne Bladeleaf", title = "Herbalism Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "patient", "reverent" }, values = { "nature", "balance" },
  notices = { "craft", "form" },
  impression = {
    first = "Malorne Bladeleaf teaches herbalism in Dolanaar and treats every root as something borrowed from the forest. He spoke more kindly to the plants than to most people, and he was kind enough to me.",
    third = "{name} met Malorne Bladeleaf, the patient herbalism trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. Mind where you step; there's earthroot under that bench." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope you've been leaving the roots in the ground." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat" } },
      text = "Please don't trample the seedlings with those great paws. They took me a whole season to coax up." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Malorne Bladeleaf, and I teach herbalism to those who'll listen. Anyone can pull a flower out of the ground, but I teach people to take what the forest offers so that it grows back next season." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Herbalism") },
          text = "Lyreena sent you, did she? Then you've learned that a camp needs a fire, and I'll show you what an herbalist adds to one beside it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid will already know half of what I teach, so you're here for the other half. The Enclave teaches you to feel the forest, and I'll teach you which leaves to pick." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak softly; the seedlings are listening." },
        { id = "h_again2", text = "Ask what you will." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "How do I gather without harming the plant?", next = "gather" },
        { text = "What grows best on Teldrassil?", next = "grows" },
        { text = "What does an herbalist bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") } },
        { text = "Farewell, Malorne.", next = "END" },
      },
    },
    gather = {
      lines = {
        { id = "ga_default", text = "Take the leaves and the bloom, but leave the root and a little of the stem. Most herbs will grow back for the next traveler if you do, and if you take everything, the glade is bare for years." },
      },
      choices = {
        { text = "Does it really matter that much?", next = "gather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather2 = {
      lines = {
        { id = "ga2_default", text = "It does on Teldrassil. This tree is young, and the soil on its branches is thin, so what we take carelessly may not come back at all." },
      },
      choices = {
        { text = "Then we should take only what we need.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "teldrassil" } } },
        { text = "Herbs are meant to be gathered. That's their purpose.", next = "BACK", fx = { align = { light = -1 }, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows = {
      lines = {
        { id = "gr_default", text = "Peacebloom and silverleaf in every glade, and earthroot along the paths if you look closely. For mageroyal and briarthorn you'll have to cross to Darkshore, and the rarer herbs grow further south in Ashenvale." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "Herbs to keep the fire sweet and a few leaves to steep, so whoever rests there wakes up clearer. Lyreena knows how a camp should feel, and I only add the smell of the forest to it." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },

  topics = {
    teldrassil = { { id = "tp_teld", text = "The tree is young and its soil is thin. It gives freely, but it can't give forever." } },
    camping = { { id = "tp_camp", text = "Lyreena teaches the fire, and I teach the herbs that go beside it. Ask her first." } },
    background = { { id = "tp_bg", text = "I teach herbalism in Dolanaar. I've walked every glade on this tree with my eyes on the ground." } },
    _none = { { id = "tp_none", text = "That is beyond my knowledge. The forest hasn't told me." } },
  },
}

-- Nadyia Maneweaver: leatherworking trainer in her house up the road from Dolanaar. (Forever: ends Camping 101: Leatherworking.)
P:NPC {
  key = "nadyia", id = TODO_NPC("Nadyia Maneweaver"), name = "Nadyia Maneweaver", title = "Leatherworking Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "hospitable", "particular" }, values = { "home", "craft" },
  notices = { "craft" },
  impression = {
    first = "Nadyia Maneweaver teaches leatherworking from the house she shares with Radnaal, and she welcomes students as guests. She is very particular about small, neat stitches.",
    third = "{name} met Nadyia Maneweaver, who teaches leatherworking from her home west of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, you're welcome here. We haven't much, but what we have is yours to share." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to our home. Let me see your stitches; I hope they've gotten smaller." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Let me see that seam on your sleeve. Hmm, it's better than most, though I'd tighten it before it gives way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Nadyia Maneweaver, and I teach leatherworking here in our house, just up the road from Dolanaar. Radnaal skins the hides and teaches skinning, and I turn the hides into something a traveler can wear." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Leatherworking") },
          text = "Lyreena sent you to learn what a leatherworker brings to a camp. It's the tent, of course, and I'll show you how to stitch one that won't let in the rain." },
      },
      again = {
        { id = "h_again", text = "What else, dear? Sit down by the fire, if you like." },
        { id = "h_again2", text = "Ask away. Radnaal won't be back for a while yet." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Why make your stitches so small?", next = "stitch" },
        { text = "Why live outside the village?", next = "house" },
        { text = "What does a leatherworker bring to a camp?", next = "camp" },
        { text = "Goodbye, Nadyia.", next = "END" },
      },
    },
    stitch = {
      lines = {
        { id = "st_default", text = "Because a big stitch lets things slip out, and it lets the cold in, and it makes a tunic look lumpy. A small stitch takes longer, but a jerkin sewn properly lasts until you outgrow it." },
      },
      choices = {
        { text = "Faster work is sometimes better work.", next = "stitch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitch2 = {
      lines = {
        { id = "st2_default", text = "Faster work comes back to me in pieces, usually from the young ones who fought a nightsaber in it. I'd rather have them leave my house a day later and come home whole." },
      },
      choices = {
        { text = "Do it right, then. Shortcuts cost more later.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sometimes good enough is good enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "Because tanning hides doesn't smell pleasant, and Dolanaar's neighbors are kinder for not living beside it. Besides, the hunters pass this way on their way back from the west, and they bring their hides straight to Radnaal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "A tent, so the people who rest by the fire have somewhere dry to sleep. Lyreena prefers the stars, but even she's grateful for canvas when it rains." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camp", text = "A leatherworker brings the tent. Without one, a camp is just a fire and wet blankets." } },
    background = { { id = "tp_bg", text = "Radnaal and I keep a house up the road from Dolanaar, and I teach leatherworking from it." } },
    advice = { { id = "tp_ad", text = "Mend your armor before it tears. A small stitch today saves a big patch tomorrow." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, dear. Ask in Dolanaar; they hear more news than we do out here." } },
  },
}

-- Radnaal Maneweaver: skinning trainer, Nadyia's housemate. (Forever: ends Camping 101: Skinning.)
P:NPC {
  key = "radnaal", id = TODO_NPC("Radnaal Maneweaver"), name = "Radnaal Maneweaver", title = "Skinning Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "quiet", "gruff" }, values = { "respect", "craft" },
  notices = { "pet" },
  impression = {
    first = "Radnaal Maneweaver teaches skinning and says little that isn't about the work. When he does speak, it is with real respect for the animals he skins.",
    third = "{name} met Radnaal Maneweaver, the taciturn skinning trainer who shares a house with Nadyia.",
  },

  greetings = {
    { id = "g_default", text = "Hm, a visitor. If you're here to learn skinning, come and stand by the rack." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your knife looks sharper than last time." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { family = "Cat" } },
      text = "You're traveling with a cat, so I'll keep the nightsaber pelts out of its sight. It doesn't seem right to make it watch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Radnaal Maneweaver, and I teach skinning. Nadyia does the fine work with the leather, and I do the part that comes first, which nobody enjoys but somebody must." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Skinning") },
          text = "Lyreena's lesson, is it? A skinner brings hides to the camp to sit on, so nobody has to sit in the mud." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask, if you need to." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "Do you mind the work?", next = "mind" },
        { text = "What's the best beast to skin on Teldrassil?", next = "best" },
        { text = "Goodbye.", next = "END" },
      },
    },
    mind = {
      lines = {
        { id = "mi_default", text = "I mind waste. If a beast is killed and the hide left to rot, it died for nothing, so I'd rather it kept someone warm through a Darkshore winter." },
      },
      choices = {
        { text = "So using everything honors the animal.", next = "mind2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind2 = {
      lines = {
        { id = "mi2_default", text = "That's how I see it, though some of the druids think I'm only making excuses. They're welcome to come and say so, but they never do." },
      },
      choices = {
        { text = "Using what you take shows respect for it.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A hide is a hide. No need to dress it up.", next = "BACK", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "be_default", text = "Nightsabers give the softest pelts, and the young hunters bring them in by the armful. Bring me a ruined one and I'll show you where you cut wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camp", text = "A skinner brings hides to sit on. Ask Lyreena about the rest." } },
    background = { { id = "tp_bg", text = "I skin, and I teach skinning. Nadyia does the talking for both of us." } },
    _none = { { id = "tp_none", text = "Don't know, so ask Nadyia." } },
  },
}

-- Nessa Shadowsong: fishing supplies in Rut'theran Village; sends the Bounty of Teldrassil to Auberdine.
P:NPC {
  key = "nessa", id = TODO_NPC("Nessa Shadowsong"), name = "Nessa Shadowsong", title = "Fishing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "rutheran" }, temper = { "cheerful", "chatty" }, values = { "friendship", "trade" },
  notices = { "craft" },
  impression = {
    first = "Nessa Shadowsong sells fishing gear in Rut'theran Village and seems to know every boat and every fisherman on the water. She talks about Auberdine as if it were next door.",
    third = "{name} met Nessa Shadowsong, the cheerful fishmonger of Rut'theran Village.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Rut'theran! Lines, hooks and bait, and the best gossip on the shore for nothing." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Did the fish bite, or did you only feed them?" },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You've got the smell of a proper angler about you, and I mean that kindly. Androl will be pleased to see you, down by the water." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Nessa Shadowsong, and I sell fishing supplies here at the foot of Teldrassil. Most of what I catch goes up to Darnassus, and the best of it goes across the water to my friends in Auberdine." },
        { id = "h_mydrannul", tags = { "news" }, when = { questActive = TODO_QUEST("Nessa Shadowsong") },
          text = "Mydrannul sent you down from the Terrace, didn't he? Bless him, he always finds me someone. I've a parcel of Teldrassil's best that needs to reach Auberdine." },
        { id = "h_back", when = { questDone = TODO_QUEST("Return to Nessa") },
          text = "You got my bounty all the way to Laird, and he sent back word that it arrived fresh. I owe you for that, and I won't forget it." },
      },
      again = {
        { id = "h_again", text = "Anything else? The boats won't be in for a while yet." },
        { id = "h_again2", text = "Ask on, I've nothing but time and fish." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What do you send to Auberdine?", next = "bounty" },
        { text = "Where's the best fishing around here?", next = "fishing" },
        { text = "What's Rut'theran like?", next = "village" },
        { text = "Goodbye, Nessa.", next = "END" },
      },
    },
    bounty = {
      lines = {
        { id = "bo_default", text = "Fish from Teldrassil's waters, packed to keep cold, and Vesprystus flies them over for me. Laird sells them in the inn at Auberdine, and the folk there swear they taste of home." },
      },
      choices = {
        { text = "Who is Laird?", next = "bounty2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bounty2 = {
      lines = {
        { id = "bo2_default", text = "A fishmonger in Auberdine, and an old friend. We've traded across the water since Auberdine was little more than a dock, and we argue about whose catch is better every season." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fishing = {
      lines = {
        { id = "fi_default", text = "Right off the docks here, for a start, and the lake in the middle of Teldrassil when you're better at it. Androl Oakhand trains anglers just down the shore, and he'll tell you the same, only more slowly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "vi_default", text = "It's the door to Teldrassil. Everyone arriving by boat from Auberdine comes through here, humans and dwarves and gnomes who've never seen a tree this big, and I love watching their faces." },
        { id = "vi_human", when = { race = { "Human", "Dwarf", "Gnome" } },
          text = "You must have made that same face when you first stepped off the boat. Everyone does, and I'm never tired of it." },
      },
      choices = {
        { text = "So many outsiders. Does that worry anyone?", next = "village2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village2 = {
      lines = {
        { id = "vi2_default", text = "Some of the older folk up in Darnassus grumble about it, but not down here. Down here, newcomers buy bait and tell stories, and I'd rather have a busy dock than a quiet one." },
      },
      choices = {
        { text = "The Alliance makes us stronger. Welcome them.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Our people should be careful who they let in.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    teldrassil = { { id = "tp_teld", text = "From down here at the roots you can't even see the top. I've never minded; the sea is more interesting." } },
    background = { { id = "tp_bg", text = "I sell fishing supplies in Rut'theran. I've traded with Auberdine for longer than I can remember." } },
    advice = { { id = "tp_ad", text = "Bring bait you're willing to lose. The fish here are smarter than they look." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about fish, though, and I'll talk until the boat leaves." } },
  },
}

-- Androl Oakhand: fishing trainer in Rut'theran Village.
P:NPC {
  key = "androl", id = TODO_NPC("Androl Oakhand"), name = "Androl Oakhand", title = "Fishing Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "rutheran" }, temper = { "slow", "content" }, values = { "patience", "simplicity" },
  notices = { "craft" },
  impression = {
    first = "Androl Oakhand teaches fishing on the shore at Rut'theran and does everything slowly, talking included. It is oddly restful to stand beside him.",
    third = "{name} met Androl Oakhand, the slow and patient fishing trainer of Rut'theran Village.",
  },

  greetings = {
    { id = "g_default", text = "Sit down if you like. The fish aren't in any hurry, so neither am I." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the water again, I see. Good, the water missed you." },
  },

  notice = {
    { id = "n_skill", cat = "craft", when = { profession = { name = "Fishing", min = 150 } },
      text = "You've learned all I have to teach already, I think. There's an old fisherman in Booty Bay with a book that goes further, if you've the patience to sail that far." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Androl Oakhand, and I teach fishing here at the foot of Teldrassil. It's the most patient trade there is, and I've had a great deal of time to practice." },
      },
      again = {
        { id = "h_again", text = "Something else? Take your time; I'm not going anywhere." },
        { id = "h_again2", text = "Ask on. The line's still slack." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's the secret of fishing?", next = "secret" },
        { text = "Why fish, when you could hunt?", next = "why" },
        { text = "Goodbye, Androl.", next = "END" },
      },
    },
    secret = {
      lines = {
        { id = "se_default", text = "Waiting, and not minding that you're waiting. Most people stare at the float until their eyes hurt, but if you watch the water instead, you'll know before the float does." },
      },
      choices = {
        { text = "That sounds like a lot of doing nothing.", next = "secret2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret2 = {
      lines = {
        { id = "se2_default", text = "It is, and that's the best part. Our people waited ten thousand years in these forests, and a few minutes on a dock won't hurt you." },
      },
      choices = {
        { text = "Patience is a virtue. I'll learn it.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "Life's too short to sit and wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because the fish don't mind as much, or at least they don't complain. And Nessa buys everything I catch, which is more than the hunters can say for their kills." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach fishing at Rut'theran. I've sat on this dock since the first boats came over from Auberdine." } },
    advice = { { id = "tp_ad", text = "Fish in the morning, when the water's still. And don't talk; the fish can hear you." } },
    _none = { { id = "tp_none", text = "I don't know about that. I know a fair bit about fish, though, if that helps." } },
  },
}
