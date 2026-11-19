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
    first = "He carries a grudge against Sergra Darkthorn like a second axe.",
    third = "{name} met Kargal Battlescar at Far Watch Post, a scarred veteran with a long grudge against the Crossroads' commander.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Skyborne. I've got a whole border to watch, and now there's people coming down out of the sky that nobody told me about. Don't take it personally that I keep an eye on you." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You know, I wrote to Orgrimmar about you lot the first time you came through. I might write again and tell them you're all right, if I can find the ink." },
    { id = "g_watch", text = "Far Watch Post. If you're lost, the Crossroads is west, and if you're not, state your business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, because nobody else climbs up here unless Sergra Darkthorn sends them, and you don't look like one of hers." },
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
    dd_blade = {
      lines = {
        { id = "dd_bl_default", text = "Fewer, aye, but they're like scorpids under a rock: you never get all of them. Ak'Zeloth says the demons they call are drawn to the place itself, and that's why they keep coming back. What would you do about it, if Far Watch were yours?" },
      },
      choices = {
        { text = "Burn the peak to the rock and salt the ashes.", next = "BACK", reply = "If I had the grunts, I'd do just that. I'll pass it on to Thork, though he'll laugh at me again.", fx = { align = { light = -1 } } },
        { text = "Ask the shaman to cleanse the land, not just kill.", next = "BACK", reply = "Thun'grim would like that answer, and maybe you're right. The spirits might know better than my axe does.", fx = { align = { light = 1 } } },
        { text = "Something else, Kargal.", next = "BACK" },
      },
    },
    prej_kargal = {
      big = true,
      lines = { { id = "prej_kargal_default", text = "Course I have. I've watched this border since the Horde came to Durotar, and I know every face that crosses it, and then one day your people turn up out of the clouds with no warning and a lot of questions. A watchman doesn't like surprises, and you're a big one." } },
      choices = {
        { text = "We came in good faith. Your suspicion insults the Horde.", next = "BACK", reply = "Insult or not, I'll keep watching, because that's what a watchman's for. Show me good faith with your deeds, and I'll stop counting your steps.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Good. A watchman who trusts strangers dies young.", next = "BACK", reply = "Ha! At last, someone who understands what a border is for. You can stay a while, then, and I'll only watch you with one eye.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody needs your permission to cross the sky, old orc.", next = "BACK", reply = "Nobody needs it, no, but anyone who lands at my post gets looked at hard. Mind your tongue, stranger, because I've been sour since before you were born.", fx = { align = { order = -1 }, affinity = -1 } },
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
        { id = "h_dd_blade", when = { killed = { name = "Burning Blade", min = 20 } },
          text = "My lookouts say the Burning Blade fires at Dreadmist Peak have been burning lower since you went up there. I'll take any help with those cultists, because nobody at the Crossroads ever sends me enough grunts to deal with them myself." },
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
        { text = "The Burning Blade at Dreadmist are fewer, Kargal.", next = "dd_blade", when = { killed = { name = "Burning Blade", min = 20 } } },
        { text = "You've had your eyes on me since I came up the path, Battlescar.", next = "prej_kargal", when = { prejudiced = true } },
        { text = "What does Far Watch Post guard?", next = "post" },
        { text = "You don't think much of the Crossroads command.", next = "sergra" },
        { text = "How did you get that scar?", next = "scar" },
        { text = "You keep a close eye on those hills.", next = "hills" },
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
      lines = { { id = "t_default", text = "Kolkar, mostly, and once a band of Razormane who thought the river was shallower than it is. We pulled a few of them out downstream and sent them home to Thorn Hill with their tusks tied together, which I'm told caused some talk among the quilboar." } },
      choices = {
        { text = "Sending them home was a mercy worth giving.", next = "BACK", reply = "Mercy or a warning, it did the same job, and the Razormane haven't tried the river since. Sometimes a laugh at the enemy's expense is worth more than a body.", fx = { align = { light = 1 } } },
        { text = "You should have left them in the river.", next = "BACK", reply = "We thought about it, believe me, and one grunt argued it all night. But a drowned boar teaches nobody anything, and a humiliated one teaches the whole tribe.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sergra = {
      lines = { { id = "s_default", text = "I don't think much of being passed over, which isn't the same thing. I've held a wall since before she could lift an axe, and when the Warchief needed someone to command the Crossroads, he gave it to her and gave me a hill." } },
      choices = {
        { text = "It sounds like she's bad at the job.", next = "job" },
        { text = "Maybe a hill is where you're most useful.", next = "useful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "No, curse her, she's good at it, and that's what sticks in my teeth. She keeps the caravans moving and the Kolkar nervous, and if she'd only stop reminding every male grunt in the Barrens that she outranks him, I'd drink to her." } },
      choices = {
        { text = "Then drink to her. Pride's no reason to hold a grudge.", next = "BACK", reply = "Maybe I will, one day, when I've had enough grog to forget the promotion. You speak like a peacemaker, {class}, and I'm still deciding whether that's a compliment.", fx = { align = { order = 1 } } },
        { text = "She earned it. You'd better earn yours back.", next = "BACK", reply = "Earn it back, from a watchtower nobody visits? That's harsh, though maybe you're not wrong, and that's the part I hate.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    useful = {
      lines = { { id = "u_default", text = "Ha! You sound like the Warchief's runner who brought my orders. Maybe you're both right, but I sleep better not thinking about it, so let's say no more." } },
      choices = {
        { text = "Then something else.", next = "BACK" },
        { text = "I'll leave you to your hill.", next = "END" },
      },
    },
    scar = {
      lines = { { id = "sc_default", text = "From an internment camp guard outside Durnholde, swinging a sword he'd taken off a better soldier than he was. I got this scar, he got my axe in his ribs, and the Warchief got one more orc who was done with cages." } },
      choices = {
        { text = "So you were in the internment camps.", next = "camps" },
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
        { text = "You don't sound like you trust Ak'Zeloth.", next = "akz" },
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
      lines = { { id = "hr_default", text = "Ran her plainstriders down for her, did you? Then you know she gives good orders, and you can carry a message back from me: Far Watch could use more than six grunts." } },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Tell her yourself.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    women = {
      lines = { { id = "w_default", text = "I know it, and I've never said otherwise. My quarrel is with one woman and one promotion, and if the whole Barrens wants to make it into more than that, they can do it without my help." } },
      choices = {
        { text = "Then keep the quarrel small and fair.", next = "BACK", reply = "Small and fair is how I've kept it, whatever the gossip says. If you hear different at the Crossroads, tell them Kargal said so himself.", fx = { align = { honor = 1 } } },
        { text = "Then say it to her face, not to strangers.", next = "BACK", reply = "I have, and she laughed, and then she gave me Far Watch. Maybe she had the right of it, but I'll grumble to whoever I like.", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I did my years in the internment camps, crossed the sea with the Warchief, and held every wall in Durotar that needed holding. Now I hold this hill." } },
    sergra = { { id = "tp_sergra", text = "Sergra commands the Crossroads, and she does it well, and I'll deny I ever said that.", next = "sergra" } },
    burning_blade = { { id = "tp_bb", text = "A cult of demon-lovers who should have died with the old Horde. They squat on Dreadmist Peak to the north." } },
    _none = { { id = "tp_none", text = "Never heard of it, grunt, and up on this hill, I hear about everything eventually." } },
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
    first = "I can't tell whether he hates the cult or only its leaders.",
    third = "{name} met Ak'Zeloth in the northern Barrens, an orc with an unsettling knowledge of the Burning Blade.",
  },

  greetings = {
    { id = "g_default", text = "Come closer, {class}, and keep your voice down. The hills carry sound all the way to Thorn Hill." },
    { id = "g_seed", when = { questActive = TODO_QUEST("The Demon Seed") }, text = "Have you found the stone yet? The longer it stays whole, the more the cult on Dreadmist Peak draws from it." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell the Nether on your sleeves, and so can the Burning Blade, so don't go near Dreadmist unless you want them to try to recruit you." },
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
        { id = "h_again2", text = "Ask quickly, because the fires on the peak are lit again tonight." },
      },
      choices = {
        { text = "What gives the cultists their power?", next = "seed" },
        { text = "How do you know so much about the Burning Blade?", next = "know" },
        { text = "What happens on Dreadmist Peak?", next = "peak" },
        { text = "What do you make of Neeru Fireblade?", next = "neeru", when = { questDone = TODO_QUEST("Ak'Zeloth") } },
        { text = "I have dealings with demons myself. Hungry ones.", next = "lock", when = { class = "WARLOCK" } },
        { text = "Give me the task.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    seed = {
      lines = { { id = "s_default", text = "A flawed but potent power stone called the Demon Seed, which the Burning Blade on Dreadmist Peak use to draw on the Twisting Nether. Take it from them and destroy it at the altar I'll show you, and whatever they've been calling up there loses its anchor." } },
      choices = {
        { text = "What have they been calling?", next = "calling" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calling = {
      lines = { { id = "c_default", text = "Small things for now, imps mostly, because they lack the strength for more. But the old Horde started small too, and I was there to see how quickly small became Mannoroth." } },
      choices = {
        { text = "Then it ends with that stone.", next = "BACK", reply = "Then make sure it does, because I'll not live through that again. Bring me that stone, and we'll cut off the next Mannoroth before he's even a whisper.", fx = { align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "Power is power. Let them draw it, and we'll take it.", next = "BACK", reply = "That's what we said in the Shadow Council days, word for word, and look where it got us. If you believe that, stay away from me and my fire.", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
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
        { text = "A clean start is worth honoring. I believe you.", next = "BACK", reply = "That means more than you know, coming from a stranger. I'll prove you right by what I do to the Burning Blade, and that's the only proof I've got.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Nobody comes clean from that. I'll keep my distance.", next = "BACK", reply = "Keep it, then, and I won't blame you, because I keep my distance from myself some days. Just don't keep so far off that you miss what I can teach you about them.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peak = {
      lines = { { id = "p_default", text = "Cultists in red robes, mostly young, mostly orcs who came to Kalimdor too late to remember the blood. The Burning Blade tells them Thrall made the Horde weak and promises them the strength the clans used to have, and some of them are fool enough to want it." } },
      choices = {
        { text = "Some of them might still be turned back.", next = "turned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    turned = {
      lines = { { id = "t_default", text = "A few, if someone reaches them before their first summoning. After that, the Nether has their scent and they have its taste, and I've never seen one of those come back." } },
      choices = {
        { text = "Then I'll spare the young where I can.", next = "BACK", reply = "Good. Every one you spare before the first summoning is one less I'll have to kill after it.", fx = { align = { order = -1 } } },
        { text = "A cultist is a cultist. They all answer for it.", next = "BACK", reply = "They will answer, every one, but some of them are still children playing with a forbidden flame. I'd rather you knew which ones before you struck.", fx = { align = { order = 1 } } },
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
        { text = "I hold the leash, and I always will. It knows that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_blade = { { id = "tp_bb", text = "Cultists who worship what the old Horde served. They have a foothold on Dreadmist Peak and, I'd wager, other places closer to the Warchief than he'd like." } },
    neeru = { { id = "tp_neeru", text = "Neeru Fireblade, in Orgrimmar's Cleft of Shadow. He knows much, and he shares a little of it." } },
    _none = { { id = "tp_none", text = "That's outside my study. I watch the Blade, and the Blade cares for nothing but demon blood." } },
  },
}

---------------------------------------------------------------------------
-- Thun'grim Firegaze: an old, near-blind orc blacksmith and hermit on a mountain south of
-- Thorn Hill, who forges for the Horde's young warriors (Path of Defense's end, the brutal armor).
---------------------------------------------------------------------------
P:NPC {
  key = "thungrim", id = TODO_NPC("Thun'grim Firegaze"), name = "Thun'grim Firegaze",
  bible = "bibles/thungrim.md", role = "questgiver", tier = "quest",
  temper = { "stern", "patient" }, values = { "craft", "dutiful" },
  notices = { "class", "race", "kit" },
  impression = {
    first = "He can barely see, but he knew my armor by its sound.",
    third = "{name} met Thun'grim Firegaze, the half-blind smith on the mountain south of Thorn Hill who forges for the Horde's young warriors.",
  },

  greetings = {
    { id = "g_default", text = "Footsteps on my mountain. Come closer, {class}, because my eyes gave up long ago and my ears do all the work now." },
    { id = "g_back", when = { metBefore = true }, text = "I know that tread, and that rattle of loose buckles. Sit, and let me hear what you've been hitting." },
    { id = "g_war", when = { class = "WARRIOR", metBefore = true }, text = "That's a warrior's walk, heavy on the heel. Uzzek's lot always walk like that, as if the ground owed them something." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's singing like a cracked bell, and I can hear every split rivet from here. Take it to a smith before you take it into a fight, because I'm too old to mend it for you." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, by the weight on the stones. Orm Stonehoof up on the bluffs is a friend of mine, and he says your people are slow to buy and quick to break things, and he means it kindly." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and young by the sound of it. Come here and let me put a hand on your shield, because I can tell more by touch than most smiths can by looking." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Thun'grim Firegaze, and I keep a forge on this mountain where nobody bothers me but the wind. My eyes dried out long ago from staring into the flame, so I work by the sound of the hammer now, and the steel has never once complained." },
        { id = "h_uzzek", tags = { "news" }, when = { questDone = TODO_QUEST("Path of Defense") }, text = "Uzzek sent you up, did he? Then you can stand behind a shield, and you've earned some iron worth standing behind, so let me hear how you hold it." },
        { id = "h_ruga", tags = { "news" }, when = { questDone = TODO_QUEST("Trial at the Field of Giants") }, text = "Ruga says you went into the Field of Giants and came back quieter than you went, and that's the best word he gives anyone. Sit down, and we'll talk about armor." },
        { id = "h_brutal", when = { questDone = TODO_QUEST("Brutal Armor") }, text = "The brutal hauberk sits well on you, I can hear it. Ula'elek, Orm and Velora will finish the set if you bring them what they ask, and then nobody will mistake you for a recruit." },
        { id = "h_orcwar", when = { class = "WARRIOR", race = "Orc" }, text = "A young orc warrior, climbing to an old orc's forge. In my day we forged weapons for demons' wars and never asked why, so I'm glad to be forging for yours." },
        { id = "h_trollwar", when = { class = "WARRIOR", race = "Troll" }, text = "A Darkspear warrior, by the light step and the laughing. Ula'elek at Sen'jin is a friend of mine and a better jeweller than a smith, but don't tell him I said so." },
        { id = "h_notwar", when = { ["not"] = { class = "WARRIOR" } }, text = "You're no warrior, by your step, and I've little for anyone else. But sit by the forge if you like, because the wind on this mountain bites." },
      },
      again = {
        { id = "h_again", text = "What else? The coals are patient, and so am I." },
        { id = "h_again2", text = "Ask on. I'll hammer while you talk, and listen with the other ear." },
      },
      choices = {
        { text = "How do you forge without your eyes?", next = "blind" },
        { text = "Why keep your forge up here, alone?", next = "alone" },
        { text = "What do you make for young warriors?", next = "make", when = { class = "WARRIOR" } },
        { text = "Tell me about the brutal armor.", next = "brutal", when = { class = "WARRIOR", minLevel = 20 } },
        { text = "What do you think of the Burning Blade?", next = "blade" },
        { text = "I have business with you.", next = "BUSINESS" },
        { text = "Keep your forge hot, Thun'grim.", next = "END" },
      },
    },
    blind = {
      lines = { { id = "b_default", text = "By the ring of the hammer, mostly, because good steel sings and bad steel thuds, and an old smith can hear the difference in his sleep. The heat tells me the rest, on my face and in my hands, and I've been burned so many times that the burns can't surprise me any more." } },
      choices = {
        { text = "Does the blindness ever trouble you?", next = "blind2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blind2 = {
      big = true,
      lines = { { id = "b2_default", text = "Only when I remember what I used to forge. I made blades for the Horde when the warlocks ruled it, and I watched the fire in those blades turn green, and I didn't stop until I'd stared so long I couldn't see it any more. Some days I think the blindness was a mercy." } },
      choices = {
        { text = "You've paid for it. Forge for the new Horde now.", next = "BACK", reply = "That's what I tell myself every morning when I light the coals. Some mornings it's even true.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A smith forges what he's paid for. No shame in that.", next = "BACK", reply = "That's what I told myself then, and it's why I'm up here now. Be careful who pays you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "a_default", text = "Because the wind up here feeds the coals better than any bellows, and because the Crossroads is too loud for an old orc who works by ear. The warriors who need me find the path, and the ones who can't climb it aren't ready for what I make." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    make = {
      lines = {
        { id = "mk_default", text = "Shields first, for the ones Uzzek sends me, because a warrior who's learned to stand needs something to stand behind. Later, if they live, armor, and the brutal set is the best I know how to make." },
        { id = "mk_low", when = { questBefore = TODO_QUEST("Path of Defense") }, text = "Nothing for you yet, young one, because you haven't been to Uzzek. Go down to his hill near Far Watch, learn to stand still, and then climb back up and we'll talk." },
      },
      choices = {
        { text = "Why does the shield come before the blade?", next = "make2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    make2 = {
      lines = { { id = "mk2_default", text = "Because I forged blades first for my whole life and watched them carry our people into ruin. A shield never started a war, so I'd rather the young ones learn to love theirs before they learn to love the axe." } },
      choices = {
        { text = "A shield is worth more than any blade.", next = "BACK", reply = "Spoken like Uzzek's student. He'll be glad of you.", fx = { align = { honor = 1 } } },
        { text = "A shield never won a war either.", next = "BACK", reply = "No, but it brought a great many warriors home from them. Think on which matters more.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brutal = {
      lines = {
        { id = "br_default", text = "Heavy plates and heavy bracing, made to look as if nothing could cut through it, because half of armor is what the enemy believes. I make the hauberk myself, and send warriors to Ula'elek at Sen'jin for the gauntlets, to Orm Stonehoof on the bluffs for the helm, and to Velora Nitely in the Undercity for the legguards." },
        { id = "br_ruga", when = { questBefore = TODO_QUEST("Trial at the Field of Giants") }, text = "Not yet, young one. Go to Ruga Ragetotem at Camp Taurajo first and pass his trial at the Field of Giants, and when he sends you back to me, I'll start on the hauberk." },
      },
      choices = {
        { text = "Why send me to four smiths instead of one?", next = "brutal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brutal2 = {
      lines = { { id = "br2_default", text = "Because each of them knows something I don't, and because a warrior who's walked to Sen'jin, Thunder Bluff and the Undercity has seen what the Horde is made of. You come back knowing whose armor you wear, and that's worth more than the steel." } },
      choices = { { text = "I'll make the walk. Something else.", next = "BACK" } },
    },
    blade = {
      lines = { { id = "bl_default", text = "They make me ashamed of the green fire I once worked by. They light fel braziers on Dreadmist Peak, not far from here, and I can smell it on the wind, sour like hot copper, every time the wind turns north." } },
      choices = {
        { text = "Then they should be stopped.", next = "BACK", reply = "They should, and if I were thirty years younger and could see past my own hand, I'd climb Dreadmist myself. Go in my place, if you're willing.", fx = { align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "Fire is fire, whatever colour it burns.", next = "BACK", reply = "Spoken like the young smith I was, and I'd not wish his eyes on you. Fel fire eats more than it burns.", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_blade = { { id = "tp_bb", text = "The Burning Blade light fel fires on Dreadmist Peak, and I'd put them out myself if I could see the path." } },
    background = { { id = "tp_bg", text = "I forged for the old Horde until my eyes gave out, and now I forge for the new one by ear, which suits us both." } },
    _none = { { id = "tp_none", text = "I'm a smith, and a blind one, so if it can't be heated and hammered, I'd not know it." } },
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
    first = "Few of the young impress him, and his advice is mostly shields.",
    third = "{name} met Uzzek, a veteran who tests the Horde's young warriors in the Barrens.",
  },

  greetings = {
    { id = "g_default", text = "Stand up straight when you come to me, {class}. Slouching gets you killed." },
    { id = "g_path", when = { questActive = TODO_QUEST("Path of Defense") }, text = "Well? Have you got what I sent you for, or have you come to tell me why not?" },
    { id = "g_ready", when = { questReady = TODO_QUEST("Path of Defense") }, text = "You've the horns, I can smell the lizard on you. Bring them here and let's have a look at your shield arm." },
    { id = "g_garvak_master", when = { class = "WARRIOR", thread = { id = "war_garvak", state = "resolved" } }, text = "Garvak stood his ground for a whole morning yesterday, and he hated every moment of it. Stand up straight, {class}, because I'm in a good mood." },
    { id = "g_garvak_run", when = { class = "WARRIOR", thread = { id = "war_garvak", state = "soured" } }, text = "Garvak's back on the Kolkar line, charging like the old days. Say what you came for, and stand straight while you say it." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Let's see your feet, because they tell me more than your axe ever will." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that armor. You've been taking hits you should have turned, and I can count each one in the dents." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Uzzek. The warrior trainers in Orgrimmar and Thunder Bluff send me their promising ones, and I find out whether they can stand their ground or just swing hard." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "So they sent you out to me. Good, because any fool can hit something, and I'm here to see if you can stop being hit." },
        { id = "h_tauren", when = { class = "WARRIOR", race = "Tauren" }, text = "A tauren warrior. You've got the size, which helps, but size gets lazy, so let's see if you've got the patience." },
        { id = "h_orcwar", when = { class = "WARRIOR", race = "Orc" }, text = "An orc, sent to learn the shield. Your elders charged when they should have stood, and I buried enough of them to know it, so you'll learn to stand if I have to nail your feet to this hill." },
        { id = "h_trollwar", when = { class = "WARRIOR", race = "Troll" }, text = "A Darkspear, quick and twitchy like all your people. A shield's no use to a warrior who won't stay behind it, so the first thing I'll teach you is to keep still." },
        { id = "h_deadwar", when = { class = "WARRIOR", race = "Scourge" }, text = "A Forsaken warrior, come all the way from Lordaeron to learn from an orc who nearly took it. I held a wall against your knights once, so I know you can be taught to hold one too." },
        { id = "h_active", when = { questActive = TODO_QUEST("Path of Defense") }, text = "The thunder lizards graze the plains around Far Watch, and they'll come at you hard. Take their horns, keep your shield up when they spit, and don't come back with a hole in you." },
        { id = "h_after", when = { questDone = TODO_QUEST("Path of Defense"), minLevel = 14 }, text = "You've learned the stance and you've had time to forget it. Show me your feet, and I'll tell you whether you've been practising or bragging." },
        { id = "h_path_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Path of Defense"), days = 3 } }, text = "You did it, and you came back standing. That's the lesson, if you were wondering: the one who stands longest wins." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, and stand like a warrior while you ask." },
        { id = "h_again2", text = "Go on. My knees aren't getting younger." },
      },
      choices = {
        { text = "What is the path of defense?", next = "path" },
        { text = "Where did you learn to fight?", next = "learn" },
        { text = "What's the most dangerous thing out here?", next = "danger" },
        { text = "Teach me to hold the line.", next = "line", when = { class = "WARRIOR" } },
        { text = "Why does the defensive stance matter so much?", next = "w_stance", when = { class = "WARRIOR" } },
        { text = "Where do I go once I've passed your test?", next = "w_next", when = { class = "WARRIOR" } },
        { text = "I'm ready for my test.", next = "BUSINESS" },
        { text = "I've heard what the others say about Garvak.", next = "garvak_end",
          when = { class = "WARRIOR", thread = { id = "war_garvak", beat = "b2_uzzek", state = "unfolding" },
                   any = { { thread = { id = "war_garvak", beat = "b3_kargal" } }, { thread = { id = "war_garvak", beat = "b3_grezz" } } } } },
        { text = "I'll go.", next = "END" },
      },
    },
    garvak_end = {
      big = true,
      narr = "He plants his shield rim-down in the dust and leans on it.",
      lines = { { id = "garvak_end_default", key = true,
        text = "Then you know he's coming back to me at the next new moon, because I asked him to, and I'll have to tell him something. Kargal calls it the fever and Grezz calls it the Horde, and you're young enough to have no stake in that old war, so you tell me: does he master the rage, or let it run?" } },
      again = { { id = "garvak_end_again", text = "You've given me your answer about Garvak. Now I have to give it to him." } },
      choices = {
        { text = "He masters it. A rage that rules you is only a leash.", next = "garvak_master",
          fx = { thread = { id = "war_garvak", state = "resolved" }, align = { order = 1 }, affinity = 1 },
          journal = { first = "I told Uzzek that Garvak must master his rage. He'll teach the whelp to stand still.", third = "{name} told Uzzek that Garvak must master his rage." } },
        { text = "Let it run. The rage was ours before any demon came.", next = "garvak_run",
          fx = { thread = { id = "war_garvak", state = "soured" }, align = { order = -1 } },
          journal = { first = "I told Uzzek to let Garvak's rage run. He's sending him back to the Kolkar line.", third = "{name} told Uzzek to let Garvak's rage run." } },
        { text = "That's for Garvak to answer, not me.", next = "BACK" },
      },
    },
    garvak_master = {
      lines = { { id = "garvak_master_default",
        text = "That's my answer too, and now I've someone to blame for it besides myself. I'll teach him to stand still if it takes another four tries, and if it takes five, I'll tell him you said so." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "Lok'tar, Uzzek.", next = "END" } },
    },
    garvak_run = {
      lines = { { id = "garvak_run_default",
        text = "Then I'll send him back to Kargal's line with my blessing, such as it is, and hope you're right. If they carry him in on a shield, I'll remember who told me to let him go." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll go.", next = "END" } },
    },
    path = {
      lines = { { id = "p_default", text = "It's taking a blow and still being there to give one back. The young ones want to charge in and win in one swing, and the ones who live long enough to get old learned to wait." } },
      choices = {
        { text = "The one who strikes first usually wins.", next = "first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Against a farmer, maybe. Against a soldier who knows his business, you'll strike first and he'll strike last, and you'll learn the difference lying on your back." } },
      choices = {
        { text = "Then I'll learn patience.", next = "BACK", reply = "Good, because patience is the hardest thing a warrior learns and the last thing he forgets. Stand your ground, let them come, and break them when they've spent themselves.", fx = { align = { order = 1 } } },
        { text = "I'll take my chances with speed.", next = "BACK", reply = "Then you'll find your back in the dirt soon enough, and I'll be standing over you. Come and see me when you're ready to learn the hard way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "In the Second War, on a wall in Lordaeron, holding off human knights for a day and a night. Most of my clan charged out to meet them, and I stayed on that wall, and that's why I'm here to tell you about it." } },
      choices = {
        { text = "The ones who charged never came back, I'd guess.", next = "charged" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charged = {
      lines = {
        { id = "c_default", text = "The knights rode them down in the open, as the knights always did. I don't hold it against them, because they were brave, but brave and dead is still dead, and I train grunts to come home." },
        { id = "c_forsaken", when = { race = "Scourge" }, text = "The knights rode them down in the open. For all I know, one of those knights is standing in front of me, wearing a different face, and if so, you rode well." },
      },
      choices = {
        { text = "Their bravery still deserves honor.", next = "BACK", reply = "It does, and I'd never say otherwise, because I stood beside some of them. But I'd rather honor you living than carve your name on a stone, young one.", fx = { align = { honor = 1 } } },
        { text = "Bravery that loses a war is just foolishness.", next = "BACK", reply = "A hard thing to say about orcs who died beside me, but you're not wrong about the result. Learn from them, then, and don't become one of them.", fx = { align = { honor = -1 } } },
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
      lines = { { id = "lz_default", text = "They're big, thick-hided and short-tempered, and they spit lightning when they're angry. Fight one without a shield and you'll find out why I keep sending young warriors after them." } },
      choices = {
        { text = "I'll bring my shield.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_stance = {
      lines = {
        { id = "ws_default", text = "Because every blow lands softer in it, and every hit you take makes you angrier instead of weaker. In the battle stance you're a weapon, and in the defensive stance you're a wall, and the Horde has more weapons than it has walls." },
        { id = "ws_done", when = { questDone = TODO_QUEST("Path of Defense") }, text = "You know it now, so learn what goes with it: a taunt to pull the enemy off whoever's weaker, and a sunder to crack its armor while it's busy hating you. A wall that nobody attacks is only a pile of stones." },
      },
      choices = {
        { text = "Walls don't win wars. Weapons do.", next = "BACK", reply = "Weapons win battles, and walls win wars, because the walls are still there after. I learned that on mine.", fx = { align = { order = -1 } } },
        { text = "Then I'll be a wall, for whoever's behind me.", next = "BACK", reply = "Good. Say that again when your arm's numb and you've no healer, and then I'll believe you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_next = {
      lines = {
        { id = "wn_default", text = "Up the mountain south of Thorn Hill, to Thun'grim Firegaze, the old smith. He's half blind from staring into his forge, but he'll know a warrior by the sound of his footsteps, and I send him the ones who pass." },
        { id = "wn_later", when = { minLevel = 20 }, text = "Southwest to Camp Taurajo, to Ruga Ragetotem, who has a trial for warriors your size. After that, back to Thun'grim for armor, and at thirty, to Fray Island, if you've any sense." },
      },
      choices = {
        { text = "Why send me to a smith?", next = "w_next2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_next2 = {
      lines = { { id = "wn2_default", text = "Because a stance is nothing without the iron to stand behind, and Thun'grim's made shields for half the warriors in the Horde. He'll talk your ear off about steel, and you'll listen, because he's earned it." } },
      choices = { { text = "I'll listen. Something else.", next = "BACK" } },
    },
    line = {
      lines = { { id = "ln_default", text = "Shield up, feet wide, weight low, and don't let your eyes leave the enemy's shoulders, because that's where the swing starts. Do that a thousand times and you'll start to understand." } },
      choices = {
        { text = "A thousand times it is, and I'll start right now.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fought in the Second War, rotted in the camps, and followed Thrall out of them. Now I teach, which is easier on the knees." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to. Ask some grunt who isn't busy." } },
  },
}
