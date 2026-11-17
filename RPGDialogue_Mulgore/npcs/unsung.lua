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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Firmer, some of them, because a brave only has to stand his ground, while a priest stands it and keeps everyone else standing too. I saw it on the long walk before Mulgore, and I teach my braves to guard their healers first." } },
      choices = {
        { text = "Then I'll stand firm and keep your braves standing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let your braves guard themselves. I'm no one's nursemaid.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Harutt.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because one day a beast will charge you after your companion falls, and on that day you'll need to plant your feet and hold. The battleboars of Narache charge straight at anything that moves, and learning to stand against them is the first lesson every young one learns, warrior or hunter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} stands well, I'll give it that. Perhaps it could teach my young braves a thing or two about patience." },
      },
      choices = {
        { text = "I'll learn to stand firm, as the braves do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll stay back and let my beast hold the line.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Harutt Thunderhorn, and I teach the young braves of Narache to stand firm. A tauren is strong from birth, but strength without patience only breaks things." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Your arms are thicker than when you came to me, young one, and your stance is better. Are you ready to learn more?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You carry totems on your belt, young one, and that is a heavy load for a brave. Carry it as patiently as you would carry a spear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter comes to the warrior's fire. Sit, and let me tell you why a hunter should stand as firm as any brave." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Strength without patience breaks things, and I am told that healing without patience breaks things too." },
      },
      choices = {
        { text = "Why should a hunter learn to stand firm, Harutt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Must a shaman be as strong as a warrior, Harutt?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does patience have to do with fighting?", next = "patience" },
        { text = "What dangers face the camp?", next = "danger" },
        { text = "Who else trains here?", next = "others" },
        { text = "Can a priest stand as firmly as a brave, Harutt?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not that I have felt, though fire grows restless near a priest of shadow, and water seems to lean towards a healer. You ask a power that answers, as I do, and I only ask that you never treat it like a servant." } },
      choices = {
        { text = "I'll ask with respect, as you teach your shaman.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. I'll use whatever answers me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Meela.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should, because the earth holds his feet and the air fills his lungs when he charges. The young braves who train with Harutt come to my fire before their first fight, and those who listen for the earth's rumble hear the quilboar coming sooner." } },
      choices = {
        { text = "I'll thank the earth before I fight, Meela.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My strength is my own, Meela, not the earth's.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Thunder before it rolls and the earth before it shakes, and every shift of the wind that carries a scent. The beasts of Mulgore live closer to the elements than any shaman, so watch them closely, and they'll teach you as much as I ever could." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} lifts its head when the wind turns. That is the air speaking, {class}, and your companion is listening." },
      },
      choices = {
        { text = "I'll learn to listen as my beast does.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Beasts hear scent and noise, nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They don't fear it, child, they despise it, and so do I. The orc shamans learned that lesson in their own blood when their warlocks turned the elements away from them, and I'll not see the young of Narache learn it from you." },
      },
      choices = {
        { text = "I won't bring it near your students.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The elements' opinion of me changes nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How do you listen to the elements?", next = "listen" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The elements are alive, and they answer when you ask with respect. The arcane answers whoever has the will to grasp it, and that's exactly what makes my people wary of it." },
      },
      choices = {
        { text = "Asking with respect is the wiser path.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Will and study are all any power needs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who taught the tauren the shaman's way?", next = "tradition" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Meela Dawnstrider, and I teach the young shaman of Narache to hear the earth, fire, water and air. The elements are not tools, and the first lesson is learning to listen before you ask them for anything." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "You have been listening to the spirits, I can tell, because you walk more softly than you did. Are you ready for a new lesson?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The earth holds you up, though you may never have thanked it for that." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast hears the elements better than you do, so watch its ears when the wind changes." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The elements are quiet around you, as they are around anyone who listens to something they cannot hear, and I find I respect that." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How do you listen to the elements?", next = "listen" },
        { text = "Who taught the tauren the shaman's way?", next = "tradition" },
        { text = "I'm an orc shaman. Is our way different?", next = "orc", when = { race = "Orc" } },
        { text = "Your elements don't fear my demon, do they?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Is the arcane so different from the elements?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior thank the elements, Meela?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What does my companion hear, Meela?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the elements and my prayers ever quarrel, Meela?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They would sense the healing in you, I think, the same way they sense it in a druid, though yours smells of incense and ours of grass. A hurt beast will come to a gentle hand, so if you find one, kneel and wait." } },
      choices = {
        { text = "Then I'll kneel and wait, and mend what comes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hurt beast that comes to me is easy prey.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gart.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, because a druid in bear form stands in front of the quilboar the same as any warrior. The difference is that a bear knows when the fight is over, and I'd wish that wisdom on every warrior who walks through Narache." } },
      choices = {
        { text = "I'll know when the fight is over, Gart.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The fight's over when the enemy's dead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Both begin with listening to the beasts, though the druid walks further down that road than most hunters wish to. The Earth Mother gave the beasts their forms and gave us the means to understand them, so whatever path you walk, walk it with care." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks content. I've always believed a content beast is the mark of a good hunter." },
      },
      choices = {
        { text = "I'll walk with care, as the Earth Mother wishes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Earth Mother made the beasts for us to use.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gart Mistrunner, and I teach the young druids of Narache. We learn to take the shapes of the beasts and to heal the land, as the Earth Mother wishes." },
        { id = "h_druid", when = { class = "DRUID" }, text = "Each time you come back, I can see more of the wild in you. What will you learn this time?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The creatures of Mulgore grow calmer when one of your kind walks among them, and I wonder if you've noticed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You remind me of the young druids when they first take the bear's form, all strength and no stillness." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a beast who trusts you. That trust is the first step on the druid's path as well as yours." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Most of my students are tauren, and the creatures of Narache rarely see a troll or a Forsaken, so do not mind if the plainstriders stare." },
      },
      choices = {
        { text = "What does a druid know of fighting, Gart?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is the hunter's path like the druid's, Gart?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Who taught the tauren to be druids?", next = "history" },
        { text = "What does a druid do for Mulgore?", next = "land" },
        { text = "I'm a night elf druid as well.", next = "elf", when = { race = "NightElf" } },
        { text = "Do the elements and the beasts share the same spirits, Gart?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would the creatures here make of a priest, Gart?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They trust what they have seen, and they have seen troll priests pull braves back from death at the edge of the Barrens. A Forsaken priest makes them uneasy still, because the dead should not be walking, but I tell them a healer is a healer." } },
      choices = {
        { text = "I'll earn their trust, Krang, one wound at a time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their trust doesn't matter. Their wounds heal either way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Krang.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a hunter who knows where the warriors will stand knows where to shoot, and where not to. Since Cairne joined the Horde, our braves fight beside orc hunters and troll hunters both, and the ones who learn each other's ways come home together." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will need to know the shield-wall too. Bring it to the training ground, and we'll see if it can hold its place." },
      },
      choices = {
        { text = "I'll learn to fight beside the warriors.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fight my own way. The warriors can adapt.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "So I've heard the orcs of the Shattered Hand fought, and nobody I know calls them cowards. I'll teach my warriors to stand firm and you can go around the side, but mind you don't arrive after the fight's already won." },
      },
      choices = {
        { text = "The flank wins battles. The front only bleeds.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll stand at the front with your braves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What do you make of the Horde?", next = "horde" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "So the Warchief says, and I'll follow his word, because the Horde gave us Mulgore. But I've heard what the Burning Blade did in Durotar, and I'll keep a spear near my hand whenever you're near the barracks." },
      },
      choices = {
        { text = "I'll follow the Warchief's rules, as you do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Watch me all you like. I answer to myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What threats does Mulgore face?", next = "threats" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Krang Stonehoof, and I train the warriors of Bloodhoof Village. Since Cairne joined the Horde, our braves fight beside orcs and trolls, and they must learn to fight as well as any of them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? The orcs taught us that a shaman can fight as hard as any warrior, and I'll expect you to prove it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The orcs and trolls fight beside us now, and so must our hunters and warriors, so come and learn how a shield-wall works." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Horde's healers are one of the reasons I let my braves march beside orcs and trolls without fearing for their lives." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "How do shamans fight beside the Horde's warriors, Krang?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What threats does Mulgore face?", next = "threats" },
        { text = "What do you think of the Horde?", next = "horde" },
        { text = "Your warriors fight in the open. I prefer the flanks.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why should a hunter learn the shield-wall, Krang?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "A warlock fights for the Horde too, Krang.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do your warriors trust priests, Krang?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because the gnolls never stop to ask whether you're a healer, and a priest with a heavy staff lives long enough to finish the prayer. My braves laugh when I say so, but they don't laugh when the gnolls come." } },
      choices = {
        { text = "My faith is my weapon, Mahnott, not your staff.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. A heavy staff it is, then.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Mahnott.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A great axe the smiths on the bluffs made from the iron of a broken goblin drill, and it's so heavy most orcs can barely lift it. The tauren braves swing it like a stick, though, and I'm told it splits a centaur's shield and the centaur behind it." } },
      choices = {
        { text = "I'll buy a weapon I can wield with skill.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The heavier the better. Skill is overrated.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A light axe or a short spear, something you can swing one-handed when the arrows are no use. The prairie wolves of Mulgore come in close and fast, and a hunter with nothing but a bow learns that lesson only once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks fierce enough to keep most things off you, but even the fiercest beast tires. Buy the axe, friend." },
      },
      choices = {
        { text = "I'll carry a blade, and use it well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My beast is my blade. I need no other.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I do, though I keep them on the bottom shelf where no tauren has to look at them. Orc and troll rogues come through Bloodhoof more often than you'd think, and I'm not too proud to admit the little things sell." },
      },
      choices = {
        { text = "A small blade in the right place beats a big one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair. A big weapon in plain sight is more honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What weapon would you choose for me?", next = "advice" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A light staff, as if a mage ever carried any other kind. I've got a few carved from Mulgore ash that won't snap, and I'll admit a staff is the one weapon where tauren and mages agree it ought to be long." },
      },
      choices = {
        { text = "Mulgore ash it is. Good, honest wood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wood is wood. I only care about the enchantment.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where does your wood and iron come from?", next = "materials" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mahnott Roughwound, and I sell weapons to the braves of Bloodhoof. Most of what I have is heavy, because a tauren with a little dagger looks like a kodo wearing a hat." },
        { id = "h_small", when = { race = { "Troll", "Scourge" } }, text = "I am Mahnott Roughwound, and I sell weapons, though most of mine are made for tauren hands. Look anyway, because I keep a few smaller ones for our friends from the Horde." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Shaman, eh? Then you'll want a good mace or a heavy axe, and I have both, because a totem alone won't stop a charging quilboar." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! At last, somebody who'll appreciate a proper weapon, heavy enough to fell a kodo in one swing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want something for close work, then, and I've axes light enough for a hunter's arm." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've no little daggers for you, I'm afraid, though I have a staff that would make a Palemane gnoll think twice about his life." },
      },
      choices = {
        { text = "What weapon suits a shaman of the plains, Mahnott?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where does your wood and iron come from?", next = "materials" },
        { text = "What weapon would you choose for me?", next = "advice" },
        { text = "So you don't sell daggers, then, Mahnott?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd want a staff, Mahnott, and a light one.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What's the heaviest weapon you sell, Mahnott?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What should a hunter carry for close work, Mahnott?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would a priest need a big weapon, Mahnott?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Oh, I'd not say no, though the Earth Mother has kept them warm so far and I'd not want her to feel slighted. Say it softly, and maybe say it over the wheat fields too, because the Venture Company's dust has been settling on the eastern farms." } },
      choices = {
        { text = "I'll bless the fields and the ovens both.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bread needs heat, Jhawna, not prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jhawna.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one of them, and some take a loaf in their packs for the road as well. A brave who fights on an empty belly fights badly, and the centaur aren't kind to those who falter, so I bake enough for every one of them and a few besides." } },
      choices = {
        { text = "Thank you for feeding the braves, Jhawna.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Bread is soft. Warriors should eat what they kill.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider pies and kodo stew bread, mostly, though I once made a wolf-and-wheat pie that nobody would eat twice. The hunters of Bloodhoof bring me what's left of their hunts, and I make sure nothing goes to waste, as the Earth Mother would wish." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And I've a crust or two for your {pet}, if it likes bread. Most beasts do, though they pretend they don't." },
      },
      choices = {
        { text = "Nothing wasted. That's the right way to hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Leftovers are for scavengers. I take only the best cuts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then the thieves had better come and ask, because I'd give them a loaf before I'd let them steal one. Nobody in Bloodhoof goes hungry while my ovens are hot, and that includes whatever sort of person you are." },
      },
      choices = {
        { text = "I'd ask, Jhawna. A gift beats a theft.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A thief who asks isn't much of a thief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where does the wheat come from?", next = "wheat" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Conjured bread, is it? I tasted some once, from a Forsaken mage passing through, and it was like chewing on a cloud that had only heard about wheat, so fill your belly on it if you must, but don't tell me it's bread." },
      },
      choices = {
        { text = "Fair. Real bread from real fields is better.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It fills a belly and costs nothing. That's bread.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's the news in the village?", next = "news" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jhawna Oatwind, and I bake for Bloodhoof Village. The wheat comes from the farms around us, and if you have ever wondered why Mulgore smells so sweet in the morning, it's my ovens." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The old ones used to sing over the first wheat of the season, and I always thought the bread tasted better for it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You look like you've been living on jerky and pride, and that's no way for anyone to fight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have plainstrider meat to trade, I hope, because I'd love to try a new pie." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! We bless the first loaf of every harvest to the Earth Mother, and I've always wondered whether your people bless their bread too." },
      },
      choices = {
        { text = "Do the old songs over the wheat still matter, Jhawna?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Where does the wheat come from?", next = "wheat" },
        { text = "What's the news in the village?", next = "news" },
        { text = "I can cook too.", next = "cook", when = { profession = "Cooking" } },
        { text = "Your bread cart could feed a whole thieves' camp, Jhawna.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A conjured loaf is lighter to carry than yours.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the braves eat your bread before battle, Jhawna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you bake with a hunter's game, Jhawna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would you want a blessing on your ovens, Jhawna?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
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
