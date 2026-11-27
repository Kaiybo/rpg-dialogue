-- Un'Goro, one an earlier pass missed: Mor'vek, the Darkspear who watches the ravasaurs in the south-east of
-- the crater. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mor'vek: jungle troll of the Ravasaur Trainers, south-eastern Un'Goro Crater.
P:NPC {
  key = "morvek", id = TODO_NPC("Mor'vek"), name = "Mor'vek", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "ungoro_wilds" }, temper = { "wry", "patient" }, values = { "nature", "cunning" },
  notices = { "pet" },
  impression = {
    first = "Mor'vek is a Darkspear troll camped in the south-east of Un'Goro, close to where the ravasaurs hunt. His arms are scarred with old bites, and he talks about the raptors' venom the way a brewer talks about a difficult ale.",
    third = "{name} met Mor'vek, a Darkspear troll who studies the ravasaurs of Un'Goro Crater.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, mon, good to see ya. Come crouch by me and watch the ferns. You know how to keep quiet." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Keep ya voice low, mon, and keep ya distance. The ravasaurs might take a liking to ya." },
    { id = "g_default", text = "Easy, mon, and keep ya voice low. The ravasaurs be huntin' just past those ferns, and they not be likin' strangers who shout." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, and with all ya fingers. Dat be more than I can say for meself some days." },
  },
  notice = {
    { id = "n_raptor", cat = "pet", when = { pet = { family = "Raptor" } },
      text = "Now dat be a fine raptor you got walkin' beside you. {pet} be lookin' at my ravasaurs like a cousin from the city, and they be lookin' back." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, all the way down in this hole! Sit, and tell me if Sen'jin Village still smells of fish, because I be missin' it." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "I got no quarrel with you down here, where everything wants to eat us both the same. Just keep ya hands off my raptors." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Mor'vek, of the Darkspear. My people been ridin' raptors since before we had a name for it, and when I heard this crater be breedin' a kind with poison in the bite, I came to see if a troll could make friends with one." } },
      again = {
        { id = "h_again", text = "What else you be wantin' to know, mon?" },
        { id = "h_again2", text = "Ask it soft, and I be answerin'." },
      },
      choices = {
        { text = "Befriending a beast is kinder than taming it with whips.", next = "BACK", reply = "Ya understand, mon. Patience and kindness, that be the way.", fx = { align = { light = 1 } } },
        { text = "A ravasaur only respects the whip.", next = "BACK", reply = "Maybe so, mon. But I be tryin' the other way first.", fx = { align = { light = -1 } } },
        { text = "What makes the ravasaurs different?", next = "different" },
        { text = "Have you made friends with one yet?", next = "friends" },
        { text = "Those are bite scars on your arms.", next = "scars" },
        { text = "How do you survive out here?", next = "survive" },
        { text = "Why come all this way for ravasaurs?", next = "why" },
        { text = "What do the goblins at the Refuge make of you?", next = "refuge" },
        { text = "Good hunting, Mor'vek.", next = "END" },
      },
    },
    different = {
      lines = { { id = "d_default", text = "They be bigger than the raptors of the Barrens, and smarter, and the venomhide ones carry a poison dat stops a stegodon's heart. A raptor like dat don't need a pack to bring down big prey, so she not be learnin' to follow anybody." } },
      choices = {
        { text = "Then how would you ever tame one?", next = "tame" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "Not by force, I be sure of dat much. I think it must be from the egg, so she hatches lookin' at a troll's face, and even then her rider would need the venom in his own blood first or her first love-bite be his last." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    friends = {
      lines = { { id = "f_default", text = "There be one old female who lets me sit forty paces off while she eats, and last season it was sixty. At dat rate, mon, I be scratchin' her chin about the time my grandchildren be grown." } },
      choices = { { text = "Patience suits you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scars = {
      lines = { { id = "s_default", text = "Every one be a lesson, and I can tell you which raptor gave it and what I did wrong. I been takin' a little of the venom on purpose, a scratch at a time, and it don't lay me out for three days anymore, only one." } },
      choices = {
        { text = "You poison yourself deliberately?", next = "poison" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "The witch doctors been doin' it with snakes since the old days on the islands, so it not be so mad as it sounds. My wife says it be exactly as mad as it sounds, and she be the one who has to sit up with me." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    survive = {
      lines = { { id = "su_default", text = "By rememberin' dat nothin' in this crater be at the top for long. The devilsaur eats the ravasaur, the ravasaur eats the troll, and the troll stays alive by bein' too small and too quiet to be worth the walk." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wy_default", text = "Because de Darkspear ride raptors, mon, and a ravasaur be a raptor's bigger, meaner cousin. If a troll could ride one into battle, de Horde would have somethin' de Alliance never seen. I want to be de troll who figured it out, and I be patient enough to try." } },
      choices = {
        { text = "And if it never works?", next = "why2" },
        { text = "A ravasaur cavalry would be a terrible sight.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wy2_default", text = "Den I learned more about ravasaurs dan any troll livin', and dat be worth somethin' too. De witch doctors at Sen'jin say every failure be a lesson de loa wanted you to learn. I got a lot of scars, so de loa must want me very educated." } },
      choices = { { text = "Very educated. Something else.", next = "BACK" } },
    },
    refuge = {
      lines = { { id = "rf_default", text = "Dey think I be mad, mon, and dey sell me bandages at twice de price because of it. De scientists like me better, because I tell dem where de ravasaurs nest, and dey write it in deir books and argue about it all night." } },
      choices = {
        { text = "Do you trust the scientists with what you know?", next = "refuge2" },
        { text = "Twice the price for bandages. That's the goblin way.", next = "refuge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuge2 = {
      lines = { { id = "rf2_default", text = "Some of it. Dey want to know what de beasts eat and how de crystals glow. Dey don't want to ride nothin', so dey be no rivals of mine. If an Alliance gnome ever ask me how to tame a ravasaur, though, I suddenly forget everything, mon." } },
      choices = {
        { text = "I'm Darkspear. I'd ride a ravasaur into battle gladly.", next = "BACK", reply = "Den come back when ya got de venom in ya blood, cousin, and we see if she likes ya face.", when = { race = "Troll" } },
        { text = "Something else, Mor'vek.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A raptor handler of the Darkspear, come to Un'Goro to learn the venomhides. They be teachin' me slow." } },
    devilsaurs = { { id = "tp_dv", text = "When the ground shakes, mon, you don't look for it. You just be somewhere else." } },
    _none = { { id = "tp_none", text = "Dat I couldn't tell you, mon. Ask up at the Refuge, they write everything down." } },
  },
}

-- Elder Thunderhorn: a tauren ancestor honored at the Lunar Festival, at the Slithering Scar.
P:NPC {
  key = "ung_elder_thunderhorn", id = 15583, name = "Elder Thunderhorn", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "lunar_elders" }, temper = { "booming", "kindly" }, values = { "memory", "nature" },
  notices = { "race" },
  impression = {
    first = "A great tauren elder spirit standing among the steaming jungle, as calm as a mountain.",
    third = "{name} honored Elder Thunderhorn, a tauren ancestor in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, little one. The crater is loud with life, but I can still hear you." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival! It is good to walk among the living again, even in this wild place." },
    { id = "g_honored", when = { questDone = TODO_QUEST("Thunderhorn the Elder") }, text = "You have honored me already. Go, and mind the devilsaurs." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the Shu'halo, so far from Mulgore! The Earth Mother has led you well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Thunderhorn, an elder of the tauren. I return each year at the festival, and I choose this crater because it reminds me of the world when it was young." } },
      again = { { id = "h_again", text = "Ask, ask. I am in no hurry." } },
      choices = {
        { text = "Why does this crater remind you of the past?", next = "crater" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "What did the Earth Mother teach you?", next = "earthmother", when = { race = "Tauren" } },
        { text = "Who were you, in life?", next = "ylife" },
        { text = "Do you visit other elders at the festival?", next = "yothers" },
        { text = "What do you think of the goblins and scholars here?", next = "yscholars" },
        { text = "A child of the herds greets you, Elder.", next = "ytauren", when = { race = "Tauren" } },
        { text = "Farewell.", next = "END" },
      },
    },
    crater = {
      lines = { { id = "c_default", text = "The beasts here are old, older than the tauren, and the land is wild as it was when the titans shaped it. Few places remain so untouched." } },
      choices = {
        { text = "Then it should be protected.", next = "BACK", reply = "Yes. Let the gnomes and goblins tread lightly.", fx = { align = { order = 1 } } },
        { text = "Wild places are meant to be explored.", next = "BACK", reply = "Explore, then. But listen while you walk.", fx = { align = { order = -1 } } },
        { text = "Titans shaped this crater?", next = "titans" },
      },
    },
    titans = {
      lines = { { id = "ti_default", text = "So the old stories say, little one. The gnomes at Marshal's Refuge chase the crystals here, and the ones who study the Ruins speak of keepers and great machines. I only know that the earth here still feels newly made." } },
      choices = {
        { text = "What of the great beasts, the devilsaurs?", next = "beasts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "They are the land's oldest hunters, and they fear nothing. A wise hunter honours them from a distance, and a foolish one becomes their supper. Choose which you wish to be." } },
      choices = { { text = "From a distance, I think. Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "f_default", text = "The turning of the year, when the elders are remembered. Find us and honor us, and you carry our blessing in a coin of ancestry." } },
      choices = { { text = "I'll find you all. Something else.", next = "BACK" } },
    },
    honor = {
      lines = { { id = "h2_default", text = "I accept your honor gladly, little one. Take this coin, and walk with the strength of the ancestors." } },
      choices = { { text = "Thank you, Elder Thunderhorn.", next = "BACK" } },
    },
    earthmother = {
      lines = { { id = "e_default", text = "That all things are bound together, the hunter and the hunted, the river and the rain. Remember that, and you will never be truly lost." } },
      choices = { { text = "I'll remember.", next = "BACK" } },
    },
    ylife = {
      lines = {
        { id = "yylife_d", text = "A hunter of the Thunderhorn tribe, when the tauren were still wanderers. I chased kodo across the Barrens and the Thousand Needles. I never saw this crater in life, only in dreams." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yothers = {
      lines = {
        { id = "yyothers_d", text = "Many of us gather, at Moonglade and at the old places. We speak of the living, and of the young ones who honour us. You are spoken of, a little, now that you have come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yscholars = {
      lines = {
        { id = "yyscholars_d", text = "They come with books and goggles and pick at the crystals and the bones. Some want to learn, and some want to sell. The crater does not care, but it does remember." },
      },
      choices = {
        { text = "Knowledge is good. Let them learn.", next = "BACK", reply = "Yes, if they learn gently.", fx = { align = { order = -1 } } },
        { text = "The crater should be left alone.", next = "BACK", reply = "Perhaps. But the young never leave anything alone.", fx = { align = { order = 1 } } },
      },
    },
    ytauren = {
      lines = {
        { id = "yytauren_d", text = "Then the Earth Mother smiles, and so do I. Walk this crater with respect, young one. It is old, and it has seen the world made. Honour it, and it will honour you." },
      },
      choices = {
        { text = "I will, Elder.", next = "BACK", reply = "Good. Then I am glad you came.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    devilsaurs = { { id = "ytp_devilsaurs", text = "The devilsaurs are the oldest hunters. I would have liked to hunt one, in life." } },
    thunderhorn = { { id = "ytp_thunderhorn", text = "The Thunderhorn tribe were great hunters. I was among the greatest, or so they sang." } },
    un_goro = { { id = "ytp_un_goro", text = "Un'Goro is young and old at once. It is the world as the titans first made it." } },
    _none = { { id = "tp_none", text = "I do not know that, little one." } },
  },
}
