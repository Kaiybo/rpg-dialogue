-- The northeastern Barrens around Far Watch Post: Kargal Battlescar on the cliffs above the
-- Southfury, Ak'Zeloth and the Burning Blade's business at Dreadmist Peak, Thun'grim Firegaze
-- on the path of fire, and Uzzek drilling young warriors.
-- Voices: bibles/kargal.md, bibles/akzeloth.md, bibles/thungrim.md, bibles/uzzek.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kargal Battlescar: Far Watch Post. An old grunt who thinks he should be running the
-- Crossroads instead of Sergra Darkthorn, and says so to anyone who'll stand still.
---------------------------------------------------------------------------
P:NPC {
  key = "kargal", id = TODO_NPC("Kargal Battlescar"), name = "Kargal Battlescar",
  prejudice = { race = "Skyborne", amount = 8, why = "He doesn't trust anything new on the border, and the Skyborne came out of nowhere as far as Far Watch is concerned." },
  bible = "bibles/kargal.md", role = "soldier", tier = "quest",
  temper = { "gruff", "proud" }, values = { "proud", "loyal" },
  notices = { "gender", "kit" },
  impression = {
    first = "Kargal Battlescar keeps Far Watch Post above the Southfury and carries a grudge against Sergra Darkthorn like a second axe. Under the grumbling he watches the border more carefully than he lets on.",
    third = "{name} met Kargal Battlescar at Far Watch Post, a scarred veteran with a long grudge against the Crossroads' commander.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Skyborne. I've got a whole border to watch, and now there's people coming down out of the sky that nobody told me about. Don't take it personally that I keep an eye on you." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You know, I wrote to Orgrimmar about you lot the first time you came through. I might write again and tell them you're all right, if I can find the ink." },
    { id = "g_watch", text = "Far Watch Post. If you're lost, the Crossroads is west, and if you're not, state your business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, because nobody else climbs up here unless Sergra sends them, and you don't look like one of hers." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} and back in one piece? Most of the runners who leave this post can't say that." },
  },

  notice = {
    { id = "n_woman", cat = "gender", when = { gender = "female", faction = "Horde" },
      text = "Hm. Another one who'll tell me the Horde's women fight as hard as its men, I suppose. I've seen them do it, so you can save your breath." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's hanging off you in strips, {class}. Get it mended before the harpies notice, because they always do." },
  },

  start = "hello",
  nodes = {
    prej_kargal = {
      big = true,
      lines = { { id = "prej_kargal_default", text = "Course I have. I've watched this border since the Horde came to Durotar, and I know every face that crosses it, and then one day your people turn up out of the clouds with no warning and a lot of questions. A watchman doesn't like surprises, and you're a big one." } },
      choices = {
        { text = "We came in good faith. Your suspicion insults the Horde.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Good. A watchman who trusts strangers dies young.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody needs your permission to cross the sky, old orc.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Ask what you like. I'll answer straight.", next = "prej_kargal_calm", fx = { affinity = 1 } },
        { text = "Has anyone from the sky caused you trouble?", next = "prej_kargal_why" },
      },
    },
    prej_kargal_why = {
      lines = { { id = "prej_kargal_why_default", text = "Not yet, which is what bothers me. In my experience, trouble that hasn't happened yet is just trouble that's still on the road, and I'd like to know which road it's coming down." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_kargal" }, { text = "Something else.", next = "BACK" } },
    },
    prej_kargal_calm = {
      lines = { { id = "prej_kargal_calm_default", text = "Hm. Straight answers. Sergra Darkthorn never gave me one of those in her life, so you're already ahead of her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kargal Battlescar. I hold Far Watch Post for the Horde, which means I watch the river, the hills and the road, and nobody at the Crossroads thanks me for any of it." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc who climbed the hill on purpose. Sit if you like, there's a fire, and you can tell me how badly they're running things down at the Crossroads." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "One of Sylvanas's dead, all the way out here. Stand downwind of the fire, would you, because my grunts are eating." },
        { id = "h_sergra_heard", when = { heardLine = "sergra.h_default" }, text = "You've come from Sergra's Crossroads, I can tell by the dust. If she mentioned me, whatever she said, I said worse about her first." },
      },
      again = {
        { id = "h_again", text = "What else? I've got all day, which is the trouble with this post." },
        { id = "h_again2", text = "Go on, then. The river isn't going anywhere." },
      },
      choices = {
        { text = "You've had your eyes on me since I came up the path, Battlescar.", next = "prej_kargal", when = { prejudiced = true } },
        { text = "What does Far Watch Post guard?", next = "post" },
        { text = "You don't think much of Sergra Darkthorn.", next = "sergra" },
        { text = "How did you get that scar?", next = "scar" },
        { text = "What's been moving in the hills lately?", next = "hills" },
        { text = "I serve under Sergra at the Crossroads.", next = "hers", when = { questDone = TODO_QUEST("Plainstrider Menace") } },
        { text = "Women have held the line for the Horde since Durotar.", next = "women", when = { gender = "female", faction = "Horde" } },
        { text = "Watch well, Kargal.", next = "END" },
      },
    },
    post = {
      lines = { { id = "p_default", text = "The Southfury, first of all, because the only fords between Durotar and the Barrens are below these cliffs. Anything that wants to raid Razor Hill or Orgrimmar from the west has to cross under my nose, and so far nothing has done it twice." } },
      choices = {
        { text = "What's tried it once?", next = "tried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tried = {
      lines = { { id = "t_default", text = "Kolkar, mostly, and once a band of Razormane who thought the river was shallower than it is. We pulled a few of them out downstream and sent them home to the Thorn Hill with their tusks tied together, which I'm told caused some talk among the quilboar." } },
      choices = {
        { text = "Sending them home was a mercy worth giving.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You should have left them in the river.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sergra = {
      lines = { { id = "s_default", text = "I don't think much of being passed over, which isn't the same thing. I've held a wall since before she could lift an axe, and when the Warchief needed someone to command the Crossroads, he gave it to her and gave me a hill." } },
      choices = {
        { text = "Is she bad at the job?", next = "job" },
        { text = "Maybe a hill is where you're most useful.", next = "useful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "No, curse her, she's good at it, and that's what sticks in my teeth. She keeps the caravans moving and the Kolkar nervous, and if she'd only stop reminding every male grunt in the Barrens that she outranks him, I'd drink to her." } },
      choices = {
        { text = "Then drink to her. Pride's no reason to hold a grudge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "She earned it. You'd better earn yours back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    useful = {
      lines = { { id = "u_default", text = "Ha! You sound like the Warchief's runner who brought my orders. Maybe you're both right, and maybe I'd sleep better if I didn't think it, so let's say no more about it." } },
      choices = {
        { text = "Then something else.", next = "BACK" },
        { text = "I'll leave you to your hill.", next = "END" },
      },
    },
    scar = {
      lines = { { id = "sc_default", text = "An internment camp guard, outside Durnholde, with a sword he'd taken off a better soldier than he was. I got this scar, he got my axe in his ribs, and the Warchief got one more orc who was done with cages." } },
      choices = {
        { text = "You were in the camps?", next = "camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = {
        { id = "c_default", text = "Years of them, and the lethargy that went with them, sitting in the mud and forgetting how to want anything. Thrall woke us up, and I won't hear a word against him, but I sometimes think Sergra's lot never learned what it cost to get out." },
        { id = "c_human", when = { race = "Scourge" }, text = "Years of them. Some of the guards might be walking around Undercity now, for all I know, wearing the same faces and serving the same Horde as me, and I try not to think too hard about that." },
      },
      choices = {
        { text = "The young should hear it from you, then.", next = "BACK", fx = { affinity = 1, learn = { "internment" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "internment" } } },
      },
    },
    hills = {
      lines = { { id = "hl_default", text = "Harpies in the Dry Hills to the north, screeching all night, and the Burning Blade on Dreadmist Peak lighting fires they shouldn't. There's an orc called Ak'Zeloth camped out that way who claims to know their business, and I'd like to know how." } },
      choices = {
        { text = "You don't trust Ak'Zeloth?", next = "akz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    akz = {
      lines = { { id = "a_default", text = "I don't trust any orc who talks about demons as calmly as he does. If he's watching the cult, good, and if he's one of them, I'd like the first swing, so keep your eyes open if you go out there." } },
      choices = {
        { text = "I'll keep them open.", next = "BACK", fx = { learn = { "burning_blade" } } },
        { text = "I'll be leaving now.", next = "END", fx = { learn = { "burning_blade" } } },
      },
    },
    hers = {
      lines = { { id = "hr_default", text = "Ran her plainstriders down for her, did you? Then you know she gives good orders, and you can carry one back from me, which is that Far Watch could use more than six grunts." } },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Tell her yourself.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    women = {
      lines = { { id = "w_default", text = "I know it, and I've never said otherwise. My quarrel is with one woman and one promotion, and if the whole Barrens wants to make it into more than that, they can do it without my help." } },
      choices = {
        { text = "Then keep the quarrel small and fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then say it to her face, not to strangers.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Internment camps, then the Warchief's crossing, then every wall in Durotar that needed holding. Now this hill." } },
    sergra = { { id = "tp_sergra", text = "Commands the Crossroads, and does it well, and I'll deny I said that.", next = "sergra" } },
    burning_blade = { { id = "tp_bb", text = "A cult of demon-lovers who should have died with the old Horde. They squat on Dreadmist Peak to the north." } },
    _none = { { id = "tp_none", text = "Never heard of it, and up on this hill, I hear about everything eventually." } },
  },
}

---------------------------------------------------------------------------
-- Ak'Zeloth: an orc who knows too much about the Burning Blade, camped in the northern
-- Barrens. Neeru Fireblade sends adventurers to him; he sends them after the Demon Seed.
---------------------------------------------------------------------------
P:NPC {
  key = "akzeloth", id = TODO_NPC("Ak'Zeloth"), name = "Ak'Zeloth",
  bible = "bibles/akzeloth.md", role = "questgiver", tier = "quest",
  temper = { "calm", "secretive" }, values = { "cunning", "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "Ak'Zeloth talks about the Burning Blade and its demons the way a farmer talks about weather. He wants their power stone broken, and I could not tell whether he hates the cult or only its leaders.",
    third = "{name} met Ak'Zeloth in the northern Barrens, an orc with an unsettling knowledge of the Burning Blade.",
  },

  greetings = {
    { id = "g_default", text = "Come closer, {class}, and keep your voice down. The hills carry sound further than you'd think." },
    { id = "g_seed", when = { questActive = TODO_QUEST("The Demon Seed") }, text = "Have you found the stone yet? The longer it stays whole, the more the cult on Dreadmist Peak draws from it." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I can smell the Nether on your sleeves, and so can the Burning Blade, so don't go near Dreadmist unless you want them to try to recruit you." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Good, the elements will tell you what I can't, which is how sick this land gets wherever the cult lights its fires." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Then you know what the Blade was, before Thrall, and you'll understand why some of us still look over our shoulders." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ak'Zeloth. I watch the Burning Blade on Dreadmist Peak, I count their fires, and I know more about what they're feeding than any honest orc should." },
        { id = "h_sent", when = { questActive = TODO_QUEST("Ak'Zeloth") }, text = "Neeru Fireblade sent you, didn't he? He always sends the capable ones. Listen, then, because what I have to tell you won't wait for a second visit." },
        { id = "h_seed_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Demon Seed"), days = 3 } }, text = "The stone is broken, and I felt the hills go quiet when it happened. The cultists will be scrambling for a week, and some of them will be angry enough to make mistakes." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask quickly. The fires on the peak are lit again tonight." },
      },
      choices = {
        { text = "What is the Demon Seed?", next = "seed" },
        { text = "How do you know so much about the Burning Blade?", next = "know" },
        { text = "What happens on Dreadmist Peak?", next = "peak" },
        { text = "What do you make of Neeru Fireblade?", next = "neeru", when = { questDone = TODO_QUEST("Ak'Zeloth") } },
        { text = "I have dealings with demons myself.", next = "lock", when = { class = "WARLOCK" } },
        { text = "Give me the task.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    seed = {
      lines = { { id = "s_default", text = "A power stone, flawed but still potent, that the Burning Blade on Dreadmist Peak use to draw on the Twisting Nether. Take it from them and destroy it at the altar I'll show you, and whatever they've been calling up there loses its anchor." } },
      choices = {
        { text = "What have they been calling?", next = "calling" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calling = {
      lines = { { id = "c_default", text = "Small things for now, imps and felhounds' whispers, because they lack the strength for more. But the old Horde started small too, and I was there to see how quickly small became Mannoroth." } },
      choices = {
        { text = "Then it ends with that stone.", next = "BACK", fx = { align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "Power is power. Let them draw it, and we'll take it.", next = "BACK", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    know = {
      lines = { { id = "k_default", text = "Because I was there when the clans drank, and I remember who taught the young ones to like the taste. Some of those teachers lived, and some of them wear the Burning Blade's mark now, and I have made it my business to know their names." } },
      choices = {
        { text = "Were you one of them?", next = "were" },
        { text = "Something else.", next = "BACK" },
      },
    },
    were = {
      lines = {
        { id = "w_default", text = "I was a warlock of the old Horde, yes, and I'll not dress it up for you. Thrall offered every orc a clean start, and I took mine, and the best use I've found for what I learned is to undo the people who still practice it." },
        { id = "w_orc", when = { race = "Orc" }, text = "I was a warlock of the old Horde, and you of all people know how many of us were. Thrall gave us a clean start, and I spend mine undoing those who refused theirs." },
      },
      choices = {
        { text = "A clean start is worth honoring. I believe you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Nobody comes clean from that. I'll keep my distance.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peak = {
      lines = { { id = "p_default", text = "Cultists in red robes, mostly young, mostly orcs who came to Kalimdor too late to remember the blood. The Burning Blade tells them Thrall made the Horde weak and promises them the strength the clans used to have, and some of them are fool enough to want it." } },
      choices = {
        { text = "Can they be turned back?", next = "turned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    turned = {
      lines = { { id = "t_default", text = "A few, if someone reaches them before their first summoning. After that, the Nether has their scent and they have its taste, and I've never seen one of those come back." } },
      choices = {
        { text = "Then I'll spare the young where I can.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A cultist is a cultist. They all answer for it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neeru = {
      lines = { { id = "n_default", text = "Neeru keeps the Cleft of Shadow and sends me useful people, and I send them back with useful work done. Whatever else he is, he's well informed about the Blade, which is either very good for the Horde or very bad, and I've stopped trying to decide which." } },
      choices = {
        { text = "That sounds like a warning.", next = "BACK", fx = { learn = { "neeru" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = { { id = "l_default", text = "Then you know the rule I live by: you hold the leash, or the leash holds you. The cultists on the peak forgot which end they had a long time ago, so watch how they die and learn from it." } },
      choices = {
        { text = "I hold the leash, and I always will.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_blade = { { id = "tp_bb", text = "Cultists who worship what the old Horde served. They have a foothold on Dreadmist Peak and, I'd wager, other places closer to the Warchief than he'd like." } },
    neeru = { { id = "tp_neeru", text = "Neeru Fireblade, in Orgrimmar's Cleft of Shadow. He knows a great deal, and he shares a little of it." } },
    _none = { { id = "tp_none", text = "That's outside my study. I watch the Blade, and the Blade doesn't care about that." } },
  },
}

---------------------------------------------------------------------------
-- Thun'grim Firegaze: an orc shaman on a hilltop camp near Far Watch, who tests young
-- shamans on the path of fire.
---------------------------------------------------------------------------
P:NPC {
  key = "thungrim", id = TODO_NPC("Thun'grim Firegaze"), name = "Thun'grim Firegaze",
  bible = "bibles/thungrim.md", role = "questgiver", tier = "quest",
  temper = { "stern", "patient" }, values = { "wise", "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "Thun'grim Firegaze keeps a fire burning on a bare hilltop and talks to it more than to visitors. He tests shamans on the path of fire and does not hurry anyone who climbs up to him.",
    third = "{name} met Thun'grim Firegaze, the shaman who tests the Horde's young on the path of fire.",
  },

  greetings = {
    { id = "g_default", text = "Sit by the fire, {class}, and catch your breath. The climb is part of the lesson, though most don't notice." },
    { id = "g_shaman_back", when = { class = "SHAMAN", metBefore = true }, text = "The fire remembers you. Whether it likes you is still being decided." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You burn things by command, and I burn them by asking, and I promise you the fire can tell the difference." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren this far east. The Earthmother's children usually come to the earth first, but the fire is glad of you all the same." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Thun'grim Firegaze, and I keep this fire for those who would learn its ways. Fire is the hungriest of the elements, and the most honest, because it never pretends to be anything but what it is." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "A young shaman, come up the hill at last. Telf sent you, I expect, and he'll have told you the fire spirits test hard, which is the only thing about them he got right." },
        { id = "h_fire_done", tags = { "news" }, when = { questDone = TODO_QUEST("Call of Fire") }, text = "You carry the fire's mark now, and I can see it in how you stand closer to the coals than you used to. Use it well, and never use it in anger." },
      },
      again = {
        { id = "h_again", text = "The fire is patient. What else?" },
        { id = "h_again2", text = "Ask, and let the fire listen." },
      },
      choices = {
        { text = "Why keep your fire up here, alone?", next = "alone" },
        { text = "What is the path of fire?", next = "path" },
        { text = "What do you think of the Burning Blade?", next = "blade" },
        { text = "I'm ready for the trial of fire.", next = "trial", when = { class = "SHAMAN" } },
        { text = "I have business with you.", next = "BUSINESS" },
        { text = "Keep your fire well.", next = "END" },
      },
    },
    alone = {
      lines = { { id = "a_default", text = "Because the wind up here feeds it and the land below it is dry enough to burn for a week if I'm careless. A fire kept where it could do harm teaches you respect faster than one kept in a hearth." } },
      choices = {
        { text = "Isn't that dangerous?", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "It is, and so is every element worth knowing. The warlocks of the old Horde thought they could command the fire without asking, and the Barrens is still paying for their arrogance, so I ask every morning." } },
      choices = {
        { text = "Then the elements deserve to be asked.", next = "BACK", fx = { align = { order = 1 }, learn = { "elements" } } },
        { text = "Asking is for the weak. The strong command.", next = "BACK", fx = { align = { order = -1 }, learn = { "elements" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "elements" } } },
      },
    },
    path = {
      lines = { { id = "p_default", text = "Earth first, because it holds you up, then fire, because it shows you what you are when everything else is burned away. Water and air come after, and a shaman who skips one ends up lopsided, like a kodo with a bad leg." } },
      choices = {
        { text = "What does fire show you?", next = "shows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shows = {
      lines = { { id = "s_default", text = "Your anger, mostly, at first. Every young orc who sits at this fire finds out how much rage they carry from the camps and the old wars, and the fire will burn it out of them or burn them with it." } },
      choices = {
        { text = "Did it burn yours out?", next = "mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = { { id = "m_default", text = "Most of it, in the end, though it took me longer than I'll admit to a student. What's left I keep for the Burning Blade, because the spirits allow a little anger if it's aimed at the right people." } },
      choices = {
        { text = "Then aim it well.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "They make me ashamed to be an orc who works with fire. They light their braziers on Dreadmist Peak with fel flame, and the spirits of fire in these hills scream every time, and I hear it from here." } },
      choices = {
        { text = "Then they should be stopped.", next = "BACK", fx = { align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "Fire is fire. The spirits will get over it.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trial = {
      lines = { { id = "t_default", text = "Then gather what I ask for and bring it back without complaint, because the fire hates a whiner. When you're done, you'll stand before a brazier and ask the spirit of fire for its blessing, and it will answer, or it won't." } },
      choices = {
        { text = "It will answer.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
  },

  topics = {
    elements = { { id = "tp_el", text = "Earth, fire, water and air, and the shamans who ask instead of command. The asking is the whole of it." } },
    burning_blade = { { id = "tp_bb", text = "Fel fires on Dreadmist Peak. I'd put them out myself if I were thirty years younger." } },
    _none = { { id = "tp_none", text = "The fire doesn't speak of that, and so neither do I." } },
  },
}

---------------------------------------------------------------------------
-- Uzzek: a veteran orc warrior who tests young Horde warriors on the path of defense.
---------------------------------------------------------------------------
P:NPC {
  key = "uzzek", id = TODO_NPC("Uzzek"), name = "Uzzek",
  bible = "bibles/uzzek.md", role = "questgiver", tier = "quest",
  temper = { "gruff", "fierce" }, values = { "proud", "dutiful" },
  notices = { "class", "kit" },
  impression = {
    first = "Uzzek is an old warrior who tests the young ones on the path of defense and doesn't hide how few impress him. His advice is blunt and mostly about shields.",
    third = "{name} met Uzzek, a veteran who tests the Horde's young warriors in the Barrens.",
  },

  greetings = {
    { id = "g_default", text = "Stand up straight when you come to me, {class}. Slouching gets you killed." },
    { id = "g_path", when = { questActive = TODO_QUEST("Path of Defense") }, text = "Well? Have you got what I sent you for, or have you come to tell me why not?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Let's see your feet, because they tell me more than your axe ever will." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that armor. You've been taking hits you should have turned, and I can count every one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Uzzek. The warrior trainers in Orgrimmar and Thunder Bluff send me their promising ones, and I find out whether they can stand their ground or just swing hard." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "So they sent you out to me. Good, because any fool can hit something, and I'm here to see if you can stop being hit." },
        { id = "h_tauren", when = { class = "WARRIOR", race = "Tauren" }, text = "A tauren warrior. You've got the size, which helps, but size gets lazy, so let's see if you've got the patience." },
        { id = "h_path_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Path of Defense"), days = 3 } }, text = "You did it, and you came back standing. That's the lesson, if you were wondering: the one who stands longest wins." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick." },
        { id = "h_again2", text = "Go on. My knees aren't getting younger." },
      },
      choices = {
        { text = "What is the path of defense?", next = "path" },
        { text = "Where did you learn to fight?", next = "learn" },
        { text = "What's the most dangerous thing out here?", next = "danger" },
        { text = "Teach me to hold the line.", next = "line", when = { class = "WARRIOR" } },
        { text = "I'm ready for my test.", next = "BUSINESS" },
        { text = "I'll go.", next = "END" },
      },
    },
    path = {
      lines = { { id = "p_default", text = "Taking a blow and still being there to give one back. The young ones want to charge in and win in one swing, and the ones who live long enough to get old learned to wait." } },
      choices = {
        { text = "The one who strikes first usually wins.", next = "first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Against a farmer, maybe. Against a soldier who knows his business, you'll strike first and he'll strike last, and you'll learn the difference lying on your back." } },
      choices = {
        { text = "Then I'll learn patience.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take my chances with speed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "In the Second War, on a wall in Lordaeron, holding off human knights for a day and a night. Most of my clan charged out to meet them, and I stayed on that wall, and that's why I'm here to tell you about it." } },
      choices = {
        { text = "What happened to the ones who charged?", next = "charged" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charged = {
      lines = {
        { id = "c_default", text = "The knights rode them down in the open, as the knights always did. I don't hold it against them, because they were brave, but brave and dead is still dead, and I'd rather train you to be the other kind." },
        { id = "c_forsaken", when = { race = "Scourge" }, text = "The knights rode them down in the open. For all I know, one of those knights is standing in front of me, wearing a different face, and if so, you rode well." },
      },
      choices = {
        { text = "Their bravery still deserves honor.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Bravery that loses a war is just foolishness.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Thunder lizards, if you're foolish, because they hit like falling rock and they don't stop. The Kolkar are worse if you're careless, and the Burning Blade on Dreadmist are worse than both if you're curious." } },
      choices = {
        { text = "What about the thunder lizards?", next = "lizards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lizards = {
      lines = { { id = "lz_default", text = "Big, thick-hided, and short-tempered, and they spit lightning when they're angry. Fight one without a shield and you'll find out why I keep sending young warriors after them." } },
      choices = {
        { text = "I'll bring my shield.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    line = {
      lines = { { id = "ln_default", text = "Shield up, feet wide, weight low, and don't let your eyes leave the enemy's shoulders, because that's where the swing starts. Do that a thousand times and you'll start to understand." } },
      choices = {
        { text = "A thousand times. I'll start now.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Second War, then the camps, then Thrall. Now I teach, which is easier on the knees." } },
    _none = { { id = "tp_none", text = "Don't know. Ask someone who isn't busy." } },
  },
}
