-- Razor Hill, the rest of the town: Cook Torka (feeds the garrison and grumbles about it), Takrin Pathseeker
-- (the scout who signs up recruits for the Barrens) and Shoja'my (the troll stable master).
-- Voice: bibles/razorhill_folk.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Cook Torka
---------------------------------------------------------------------------
P:NPC {
  key = "torka", id = TODO_NPC("Cook Torka"), name = "Cook Torka",
  bible = "bibles/razorhill_folk.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "gruff", "harried" }, values = { "dutiful", "practical" },
  notices = { "hunger", "craft", "race" },

  impression = {
    first = "Nobody has gone hungry on his watch, and he's secretly proud.",
    third = "{name} met Cook Torka, the harried orc cook who keeps Razor Hill's garrison fed.",
  },

  greetings = {
    { id = "g_default", text = "If you're here to eat, you're early, and if you're here to help, you're late. Either way, stand out of the smoke." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I've got another job, and you've got legs." },
    { id = "g_eggs", when = { questActive = TODO_QUEST("Break a Few Eggs") }, text = "Eggs! Taillasher eggs, from the Echo Isles! Breakfast doesn't wait for you to finish admiring the view." },
    { id = "g_pears", when = { questActive = TODO_QUEST("This Fruit Could Bite Back") }, text = "The prickly pears grow west of town, past the quilboar camps. Mind the spines, because the fruit fights back nearly as hard as the boars do." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I fed the whole garrison every day of it without your help. Not that anyone noticed." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell of a cookfire, and not a bad one. If you've learned to cook, you know what this job is like, so don't complain to me about yours." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Don't look at the stew like that, it's boar, not kodo, and I'd swear it on my ladle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_encroach", tags = { "news" }, when = { questDone = TODO_QUEST("Encroachment") },
          text = "My supply carts have been rolling in from the Barrens border without a single tusk mark on them since you sorted out those quilboar for Gar'Thok. I'll take that over a medal, because a medal doesn't feed anybody." },
        { id = "h_dd_razormane", when = { killed = { name = "Razormane", min = 20 } },
          text = "You smell like quilboar, {class}, and not the good kind that comes out of my pot. Thin enough of the Razormane and maybe I'll have pork on the menu for once instead of scorpid." },
        { id = "h_default", key = true,
          text = "The Horde's got a lot of mouths to feed, and I'm the one stuck feeding them. Torka, cook to the Razor Hill garrison, and if you've got two hands and no orders, I've got a use for both." },
        { id = "h_eggs_done", when = { questDone = TODO_QUEST("Break a Few Eggs") },
          text = "You brought the eggs and you didn't drop a single one. You might be weak, but at least you're not clumsy like the grunts who juggle my pots." },
        { id = "h_pears_done", when = { questDone = TODO_QUEST("This Fruit Could Bite Back") },
          text = "The pear jam went over well with the grunts, and I saved the seeds for planting. Someday we'll have prickly pears growing all around Orgrimmar, and you can say you started it." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc who isn't standing in my line yet. Either you've eaten already, or you've got a job for me, and I hope it's the first one." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll! Your people at Sen'jin keep telling me my food needs more pepper. I keep telling them it needs more grunts to eat it before it goes cold." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, the pot's starting to stick." },
        { id = "h_again2", text = "Go on, ask, but don't touch the ladle." },
      },
      choices = {
        { text = "Why taillasher eggs?", next = "eggs" },
        { text = "Prickly pears grow in Durotar?", next = "pears" },
        { text = "Is it hard, feeding the garrison?", next = "garrison" },
        { text = "What do the grunts complain about most?", next = "complaints" },
        { text = "I'm a cook too, Torka.", next = "xcook", when = { profession = "Cooking" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    eggs = {
      lines = { { id = "eg_default", text = "Because the raptor eggs are big enough to feed a squad, and the chickens in this town are too scrawny to feed a peon. The Bloodtalon taillashers on the Echo Isles guard their nests to the death, so I send you and not me." } },
      choices = {
        { text = "To the death? You're too kind, Torka.", next = "eg_death" },
        { text = "Where on the isles?", next = "eg_where", fx = { learn = { "echo_isles" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eg_death = {
      lines = { { id = "egd_default", text = "Their death, usually, if you're any good, and if you're not, I'll have a spare portion tonight. Don't make that face, I'm a cook, not a nursemaid." } },
      choices = {
        { text = "Fair point. I'll bring the eggs.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eg_where = {
      lines = { { id = "egw_default", text = "All over the islands southeast of Sen'jin, but they bury some too deep to dig out safely. Take the ones on top, and stay away from the hexed trolls in the middle, Zalazane's lot, because those aren't the friendly kind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pears = {
      lines = { { id = "pe_default", text = "A cactus out west that grows a sweet fruit, of all the things to find in this dust. The hunters and fishers bring me plenty of meat, but a grunt who never tastes anything sweet gets mean, and meaner than usual is a problem." } },
      choices = {
        { text = "Past the quilboar camps?", next = "pe_boar" },
        { text = "Orcs like sweet things?", next = "pe_sweet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pe_boar = {
      lines = { { id = "peb_default", text = "Right through the Razormane grounds, yes, and the quilboar don't share. Be careful, because the fruit's as spiny as the quilboars and you'll be picking needles out of your hands either way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pe_sweet = {
      lines = { { id = "pes_default", text = "Everyone likes sweet things, they just don't admit it in front of a sergeant. I've seen Gar'Thok steal a spoon of jam when he thought I was looking at the fire." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "I'm telling the whole barracks.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    garrison = {
      big = true,
      lines = { { id = "ga_default", text = "Hard? Every grunt eats like it's his last meal, because out here it might be. The ones posted on the Tiragarde road get fed first, and the ones who sit in the barracks get what's left, and I don't care who outranks who." } },
      choices = {
        { text = "That's right. Those on the line eat first.", next = "ga_more", fx = { align = { honor = 1 } } },
        { text = "Rank has its privileges. Feed the officers first.", next = "ga_more", fx = { align = { honor = -1 } } },
        { text = "Who complains about that?", next = "complaints" },
      },
    },
    ga_more = {
      lines = { { id = "gam_default", text = "Nobody complains to my face twice, I'll tell you that. A full belly holds the line better than a sharp axe, and I've been in enough lines to know." } },
      choices = {
        { text = "You were a soldier?", next = "ga_soldier" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ga_soldier = {
      lines = { { id = "gas_default", text = "Everybody my age was a soldier, whether they meant to be or not. I cooked for a warband in the old days, and afterward in the camps, and the food in the camps was worse than anything I'd ever burn." } },
      choices = {
        { text = "Then you've earned a better kitchen.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    complaints = {
      lines = { { id = "co_default", text = "The trolls say it needs pepper, the tauren want to know what's in it, the Forsaken don't eat and still have opinions, and the orcs just want more. Nobody ever says it was good, because good means they ate it all and forgot to say so." } },
      choices = {
        { text = "For what it's worth, it smells good.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xcook = {
      lines = { { id = "xc_default", text = "Then you know the first rule: the fire doesn't care how tired you are. Tell me, what do you put in a boar stew that nobody else does?" } },
      choices = {
        { text = "A little scorpid meat, for the bite.", next = "xcook2", fx = { trait = { curious = 1 } } },
        { text = "Nothing fancy. Just boar, salt and patience.", next = "xcook2", fx = { trait = { practical = 1 } } },
      },
    },
    xcook2 = {
      lines = { { id = "xc2_default", text = "Hmph, not bad, not bad at all. Don't go spreading it around Razor Hill that Torka liked somebody's cooking, because then everybody will want to help and nobody will want to fetch eggs." } },
      choices = { { text = "I won't tell a soul.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know food, fire, and which grunt steals from the pot, so ask." } },
    background = { { id = "tp_bg", text = "I cooked for a warband, then in the camps, and now for the garrison, and it's the same pot inside different walls." } },
    advice = { { id = "tp_ad", text = "Eat when you can. The Barrens won't feed you, and neither will I if you're late." } },
    echo_isles = { { id = "tp_echo", text = "The Echo Isles have the best eggs in Durotar and the worst trolls, so I send others to fetch them." } },
    _none = { { id = "tp_none", text = "You can't eat it, so I don't care about it." } },
  },
}

---------------------------------------------------------------------------
-- Takrin Pathseeker
---------------------------------------------------------------------------
P:NPC {
  key = "takrin", id = TODO_NPC("Takrin Pathseeker"), name = "Takrin Pathseeker",
  bible = "bibles/razorhill_folk.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "easy", "watchful" }, values = { "dutiful", "loyal" },
  notices = { "class", "level" },

  impression = {
    first = "He sizes people up the way a scout reads a trail.",
    third = "{name} met Takrin Pathseeker, the Razor Hill scout who sends promising recruits to Kargal Battlescar in the Barrens.",
  },

  greetings = {
    { id = "g_default", text = "Hmm, you look pretty strong. Stay a moment, I may have a road for you." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the road, or not on it yet? Either way, sit, and tell me what you saw." },
    { id = "g_letter", when = { questActive = TODO_QUEST("Conscript of the Horde") }, text = "Kargal's waiting on that letter. Take the western road over the bridge, and you'll find his outpost on the far side." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. A scout notices who leaves and who comes back, and I'm glad you came back." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "You walk quiet and keep your eyes moving. Good, the Barrens eat the loud ones first." },
    { id = "n_level", cat = "level", when = { minLevel = 10, maxLevel = 14 },
      text = "You've outgrown the valley and you're getting restless in the town. I can see it, and I've got just the cure for it." },
  },

  start = "hello",
  nodes = {
    w2odd = {
      lines = { { id = "w2od_default", text = "A goblin caravan out of Ratchet pulled by a single kodo wearing a straw hat. The goblin said it kept the sun off the beast's head, and the kodo looked so pleased with itself that I've never had the heart to argue." } },
      choices = {
        { text = "Did the hat work?", next = "w2odd2" },
        { text = "Goblins will try anything for a sale.", next = "w2odd2" },
        { text = "Something else, Takrin.", next = "BACK" },
      },
    },
    w2odd2 = {
      lines = { { id = "w2od2_default", text = "That kodo has outlived three drivers and every centaur raid on the southern road, so I'd say so. Now half the caravans put hats on their beasts, and Kargal swears the Razormane think it's some kind of war paint." } },
      choices = { { text = "Maybe it is.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    dd_darkstorm = {
      lines = {
        { id = "dd_ds_default", text = "Quieter, aye, but a scout learns not to trust quiet. Fizzle Darkstorm had followers, and followers scatter rather than vanish, so I'll be watching the ridges between here and the Barrens for new smoke. If you see any on your way west, tell me or tell Kargal." },
      },
      choices = {
        { text = "If I see smoke, I'll put it out myself.", next = "BACK", reply = "Spoken like someone Kargal would like. Just come back and tell me afterwards, so I know where to look next.", fx = { align = { order = -1 } } },
        { text = "I'll bring word to you first, then.", next = "BACK", reply = "Good. A scout who reports is worth three who don't, and Gar'Thok will hear your name from me.", fx = { align = { order = 1 } } },
        { text = "Something else, Takrin.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_darkstorm", tags = { "news" }, when = { questDone = TODO_QUEST("Dark Storms") },
          text = "I walked past Thunder Ridge this morning and didn't see a single Burning Blade fire burning. Orgnil says Fizzle Darkstorm is dead and you're the reason, so the western road is a good deal friendlier than it was." },
        { id = "h_default", key = true,
          text = "Takrin Pathseeker, scout. I walk the roads between here and the Barrens and come back to tell Razor Hill what's on them. My friend Kargal at the Barrens outpost needs new recruits, and I'm always looking." },
        { id = "h_letter_done", when = { questDone = TODO_QUEST("Conscript of the Horde") },
          text = "Kargal signed your letter and sent you on to the Crossroads, I hear. Good, they need strong arms there more than he does, though he'll never tell you so." },
        { id = "h_young", when = { maxLevel = 9 },
          text = "You're still a bit green for the Barrens, friend. Finish your work in Durotar first, and come and find me when the scorpids stop giving you trouble." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "A Forsaken, a long way from your own roads. The Barrens are hot and dry, so you'll either love them or fall apart in them, and I'd like to know which." },
      },
      again = {
        { id = "h_again", text = "What else? Scouts are good listeners when they're not running." },
        { id = "h_again2", text = "Ask away. The road will still be there in a moment." },
      },
      choices = {
        { text = "Thunder Ridge should be quieter now, Takrin.", next = "dd_darkstorm", when = { questDone = TODO_QUEST("Dark Storms") } },
        { text = "What's this about recruits?", next = "recruit" },
        { text = "What lies on the road west?", next = "road" },
        { text = "Tell me about Kargal Battlescar.", next = "kargal" },
        { text = "What does a scout actually do?", next = "scout" },
        { text = "I'm a hunter. Any tracks I should know?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "What's the strangest thing you've seen on the road?", next = "w2odd" },
        { text = "Another time, Takrin.", next = "END" },
      },
    },

    recruit = {
      big = true,
      lines = { { id = "re_default", text = "Kargal holds the outpost across the bridge with too few grunts, and the centaur and the quilboar both know it. I know you want to do what's right for the Horde, so take this letter to him and see if he'll sign it." } },
      choices = {
        { text = "The Horde calls, and I'll answer.", next = "re_more", fx = { align = { order = 1 } } },
        { text = "I'll go west for my own reasons, not for orders.", next = "re_more", fx = { align = { order = -1 } } },
        { text = "What's in it for me?", next = "re_more", fx = { trait = { greedy = 1 } } },
      },
    },
    re_more = {
      lines = { { id = "rem_default", text = "Kargal will sign it, and then he'll tell you the Crossroads need you more than he does, because they do. That's the way of the Barrens: every post sends you to the next one, and you see the whole land that way." } },
      choices = {
        { text = "Then I'll see it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    road = {
      lines = { { id = "rd_default", text = "Follow the western road out of Razor Hill, over the river and the bridge, and you'll see the outpost on the far side. After that it's the Barrens, flat and gold and full of things that want to eat you." } },
      choices = {
        { text = "What sort of things?", next = "rd_things" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rd_things = {
      lines = { { id = "rdt_default", text = "Plainstriders, zhevra, lions that hunt in pairs, and the Razormane quilboar, who are worse than all of them together. And the Kolkar centaur, who ride fast and think every acre belongs to them." } },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Sounds like good hunting.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    kargal = {
      lines = { { id = "ka_default", text = "An old warrior, scarred from his face to his feet, and the best friend a scout could ask for. He says I'm the best scout he knows, which is generous, because I'm the only scout he knows." } },
      choices = {
        { text = "How did you meet?", next = "ka_meet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ka_meet = {
      lines = { { id = "kam_default", text = "In the camps, years ago, when we were both too thin to lift an axe. He carried my share of the water one bad summer, and I've been finding him recruits ever since to pay him back." } },
      choices = {
        { text = "That's a good debt to keep.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scout = {
      lines = { { id = "sc_default", text = "Walk out, look, walk back, and tell the truth about what you saw, even when nobody wants to hear it. The walking is easy. The truth part is what gets scouts in trouble." } },
      choices = {
        { text = "What truth didn't they want?", next = "sc_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sc_truth = {
      lines = { { id = "sct_default", text = "That the humans at Tiragarde Keep weren't packing up to leave, for one. Gar'Thok didn't like hearing it, but he liked it better than finding out on his own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xhunt = {
      lines = { { id = "xh_default", text = "Watch for centaur hoofprints doubled back on themselves, because the Kolkar ride in circles before they strike. And if your {pet} gets nervous near the river, trust it before you trust me." } },
      choices = {
        { text = "Thanks, Takrin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know roads, tracks, and which outpost is short of grunts this week." } },
    background = { { id = "tp_bg", text = "I was born in the camps and raised on the road, and I've walked more of Durotar than most of its scorpids." } },
    advice = { { id = "tp_ad", text = "Carry more water than you think you need. Everybody laughs at that until the Barrens." } },
    burning_blade = { { id = "tp_bb", text = "I give the Burning Blade's caves a wide berth, and so should you until you're strong enough not to." } },
    _none = { { id = "tp_none", text = "Never seen tracks of that one. Ask me another." } },
  },
}

---------------------------------------------------------------------------
-- Shoja'my
---------------------------------------------------------------------------
P:NPC {
  key = "shojamy", id = TODO_NPC("Shoja'my"), name = "Shoja'my",
  title = "Stable Master",
  bible = "bibles/razorhill_folk.md", role = "stablemaster", tier = "service",
  communities = { "razor_hill" }, temper = { "warm", "teasing" }, values = { "loyal", "practical" },
  notices = { "pet" },

  impression = {
    first = "A Darkspear among orcs, she gives as good as she gets.",
    third = "{name} met Shoja'my, the troll stable master of Razor Hill.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hey, friend! Bring de beast; I saved de good straw for it." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Bring a beast or go smell somebody else's straw." },
    { id = "g_default", text = "Hey, mon, you bring me a beast or you just come to smell the straw?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Your beasts miss you, or maybe they miss my feed. Hard to tell." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Ooh, look at {pet}! Come here, beautiful, let Shoja'my see your teeth." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} be favorin' the left foot a little, mon. Nothin' bad, just a thorn or a bad step in the scrub, but let it rest tonight." },
  },

  start = "hello",
  nodes = {
    w2left = {
      lines = { { id = "w2lf_default", text = "Sometimes, mon, an' I never know if dey died or just forgot. I keep de beasts a year an' a day, de old way, an' den dey go to de young hunters in Sen'jin who need a friend an' can't tame one yet." } },
      choices = {
        { text = "Does a beast ever wait longer?", next = "w2left2" },
        { text = "A year is generous for a stable.", next = "w2left2" },
        { text = "Something else, Shoja'my.", next = "BACK" },
      },
    },
    w2left2 = {
      lines = {
        { id = "w2lf2_hunter", when = { class = "HUNTER" }, text = "One old wolf, mon, who still sits by de gate every evenin' lookin' down de road. You keep yours close, hunter, an' if you ever leave one wit' me, come back, even if it be only to say goodbye." },
        { id = "w2lf2_default", text = "One old wolf, mon, who still sits by de gate every evenin' lookin' down de road. I can't give dat one away, an' I don't try anymore." },
      },
      choices = { { text = "That's a sad thing.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    sj_wolves = {
      lines = { { id = "sj_wolves_l", text = "Dey be calmer because I sing to dem, mon, and de orcs in de barracks only shout. A wolf don't care what de words be, only de tone, and a shouted wolf be a nervous wolf." } },
      choices = {
        { text = "You sing to the wolves?", next = "sj_wolves2" },
        { text = "The orcs have kept wolves for generations.", next = "sj_wolves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sj_wolves2 = {
      lines = { { id = "sj_wolves2_l", text = "Every evenin', de old songs from de Echo Isles, about de sea and de hunt. De orc wolf riders laughed de first time, but now dey ask me to sing to dere own wolves before a long ride, and dey pretend it be my idea." } },
      choices = {
        { text = "Then the orcs have learned something from you.", next = "BACK", reply = "Dey learned a little, mon, and dey won't admit it, which be how orcs learn everything.", fx = { affinity = 1 } },
        { text = "Something else, Shoja'my.", next = "BACK" },
      },
    },
    sj_torka = {
      lines = { { id = "sj_torka_l", text = "De bones and de fat, yes, and some days de whole leg of a boar if de grunts don't finish dinner. Cook Torka be a good orc, but he cooks like he be feedin' an army, because he be feedin' an army." } },
      choices = {
        { text = "Does he ever complain about the beasts?", next = "sj_torka2" },
        { text = "A garrison kitchen must waste a lot.", next = "sj_torka2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sj_torka2 = {
      lines = { { id = "sj_torka2_l", text = "Only when de crab gets out and walks into his kitchen, which happens more often dan I like to say. He chased it out with a ladle last week, mon, shoutin' dat he'd cook it, and de crab pinched de ladle clean in two." } },
      choices = {
        { text = "That crab has earned its name.", next = "BACK" },
        { text = "Where is the crab now?", next = "sj_torka3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sj_torka3 = {
      lines = { { id = "sj_torka3_l", text = "In de back pen, sulkin', with a ring of stones round it dat Torka laid himself. De grunts call it de prisoner now, mon, and dey toss it scraps on de way to de barracks, so I think it be de best-fed crab in Durotar." } },
      choices = {
        { text = "A lucky crab, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_eggs = {
      lines = {
        { id = "dd_eg_default", text = "I don't mind, not really, because a garrison be needin' food and the taillashers lay plenty. But I raise beasts, mon, and every egg in Torka's pan be a raptor I never get to name. What you think, should a hunter feel bad about that?" },
      },
      choices = {
        { text = "No. Food is food, and the grunts were hungry.", next = "BACK", reply = "Spoken like an orc, even if you not be one. Torka will love you, and my raptors will forgive you eventually.", fx = { align = { light = -1 } } },
        { text = "A little. I'll leave the next nest alone.", next = "BACK", reply = "Ah, dat be a good heart talkin'. The raptors don't know it, but I do, and I'll tell them anyway.", fx = { align = { light = 1 } } },
        { text = "Something else, Shoja'my.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_eggs", tags = { "news" }, when = { questDone = TODO_QUEST("Break a Few Eggs") },
          text = "Torka be fryin' raptor eggs and tellin' everyone who brought them in. I won't say nothin' bad about you, mon, but my raptors in the back pens been givin' you a funny look." },
        { id = "h_default", key = true,
          text = "I be Shoja'my, and these be my stables, though the orcs think they be in charge of them. I keep the beasts that hunters cannot carry with them, and I feed them better than the grunts get fed." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Good, I like hunters, you be the only ones who ever come back for the beasts you leave. Who you want me to look after today?" },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc who come to the stables and not the barracks. Either you be a hunter, or you be hidin' from Cook Torka's chores, and both be fine with me." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Talk while I shovel; de wolves like a voice dat isn't barkin' orders." },
        { id = "h_again2", text = "Ask, ask, I be shovelin' anyway." },
      },
      choices = {
        { text = "A beast should be cared for like kin.", next = "BACK", reply = "It should, mon. You understand.", fx = { align = { light = 1 } } },
        { text = "A beast is just a beast.", next = "BACK", reply = "Den I care for it, and you wait outside.", fx = { align = { light = -1 } } },
        { text = "You don't like that I took those eggs, Shoja'my.", next = "dd_eggs", when = { questDone = TODO_QUEST("Break a Few Eggs") } },
        { text = "I need to stable a beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How did a troll end up running Razor Hill's stables?", next = "how" },
        { text = "What beasts do you keep?", next = "beasts" },
        { text = "How should I care for my {pet}?", next = "care", when = { class = "HUNTER" } },
        { text = "The wolves in your pens seem calmer than the barracks wolves.", next = "sj_wolves" },
        { text = "Cook Torka sends you scraps, I'd guess.", next = "sj_torka" },
        { text = "Do hunters ever not come back for their beasts?", next = "w2left" },
        { text = "Take care, Shoja'my.", next = "END" },
      },
    },

    how = {
      big = true,
      lines = { { id = "how_default", text = "The orcs be good with wolves and bad with everything else, mon, and the hunters keep bringin' boars and crabs and cats. Somebody had to be good with everything else, and the Darkspear be good with beasts." } },
      choices = {
        { text = "Trolls and orcs together. That's the Horde working.", next = "how2", fx = { align = { order = 1 } } },
        { text = "You deserve better than an orc town's stables.", next = "how2", fx = { align = { order = -1 } } },
        { text = "Do they treat you well?", next = "how2" },
      },
    },
    how2 = {
      lines = { { id = "how2_default", text = "They treat me fine, mon, because they need me, and I need them, and that be how the Horde work when it work. Some of the old grunts call me 'the troll girl', so I call them 'the green boys', and we all get along." } },
      choices = {
        { text = "That sounds like a fair trade.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    beasts = {
      lines = { { id = "be_default", text = "Wolves, mostly, and cats and boars and one crab that bite everybody but me. A hunter left it six weeks ago and never come back, so now it be my crab." } },
      choices = {
        { text = "Does the crab have a name?", next = "be_crab" },
        { text = "Something else.", next = "BACK" },
      },
    },
    be_crab = {
      lines = { { id = "bec_default", text = "I call it Gar'Thok, mon, because it be grumpy and it pinch, but do not tell the real Gar'Thok. He would not laugh." } },
      choices = {
        { text = "Not a word.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    care = {
      lines = { { id = "ca_default", text = "Feed {pet} what it like, not what be cheap, and talk to it in the evenings even when you be tired. A beast that know your voice will fight for it." } },
      choices = {
        { text = "I will. Thank you, truly.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know beasts, mon, and the hunters who forget them." } },
    background = { { id = "tp_bg", text = "I be Darkspear, from the isles, and the only troll in Razor Hill who know a wolf's moods." } },
    advice = { { id = "tp_ad", text = "Never feed a wolf from your hand while it be hungry, mon. It will not mean to take the fingers." } },
    _none = { { id = "tp_none", text = "If it not eat hay or meat, mon, I not know it." } },
  },
}
