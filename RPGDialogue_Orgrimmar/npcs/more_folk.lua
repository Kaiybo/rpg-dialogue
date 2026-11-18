-- More of Orgrimmar: Sagorne Creststrider and Sian'tsu (shaman trainers in Grommash Hold), Zamja (cooking,
-- the Drag), Thuwd (skinning, the Drag), Handor and Tor'phan (cloth and leather, the Drag), Kor'jus and
-- Muragus (mushrooms and staves, the Cleft of Shadow), Shan'ti (fruit), Stone Guard Zarg and Brave Stonehide
-- (the Hall of Legends). Added later: Nazgrel, Kor'ghan, Krathok Moltenfist, Borgosh Corebender, Barkeep Morag,
-- Zayus, Pephredo, Koma, Roxxik and Godan. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sagorne Creststrider: tauren shaman trainer in Grommash Hold; the Darkreaver Menace.
---------------------------------------------------------------------------
P:NPC {
  key = "sagorne", id = TODO_NPC("Sagorne Creststrider"), name = "Sagorne Creststrider", title = "Shaman Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "He says the elements are to be respected, not owned.",
    third = "{name} met Sagorne Creststrider, the tauren shaman trainer in Grommash Hold.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome under this roof, traveler. The Hold is loud, but the spirits are patient with noise, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the winds came with you. Sit a moment, if your feet will let you." },
    { id = "g_dark", when = { questActive = TODO_QUEST("The Darkreaver Menace") }, text = "You carry the weight of Scholomance on your shoulders already, I can see it. Darkreaver still waits in those halls, and the Earth Mother grows tired of waiting with him." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "One of the herd, so far from Mulgore. Does the stone of this city sit heavily on you as well?" },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Your totems hang well on you, young one. The earth spirit in particular seems pleased to be carried, which is not always so." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "The Warchief's people learned the old ways again from Drek'Thar and from Thrall himself, and they learn them fiercely. I have rarely seen students so hungry to make amends." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sagorne Creststrider, and I teach the shaman of the Horde alongside Kardris and Sian'tsu. Cairne sent me to stand among the orcs, and Thrall was kind enough to give a tauren a corner of his hall." },
        { id = "h_dark_done", when = { questDone = TODO_QUEST("The Darkreaver Menace") },
          text = "Darkreaver is fallen, and the halls of Scholomance are a little quieter for it. The spirits of earth and fire both remember what you did, and so do I." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman stands before me, and the spirits lean closer to listen. Come, tell me what you have learned since last we spoke." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of an old bull?" },
        { id = "h_again2", text = "Speak, and I will listen as long as you need." },
      },
      choices = {
        { text = "Train me, Sagorne.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Why does a tauren teach in an orc hall?", next = "why" },
        { text = "You speak of the elements as if they were weather.", next = "weather" },
        { text = "What is the Darkreaver Menace?", next = "dark", when = { class = "SHAMAN", minLevel = 55 } },
        { text = "Do you miss Thunder Bluff?", next = "home" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because Thrall's people forgot the spirits for a long while, and mine never did. When the orcs came to Kalimdor, Cairne saw that the tauren had something to give them besides land, and he sent a few of us to give it." } },
      choices = {
        { text = "The orcs had their own shaman once.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wh2_default", text = "They did, before the demon blood, and some of the old ones never let go of the spirits even in the camps. Thrall learned from Drek'Thar in Alterac, and now the orcs remember quickly, but a herd that has been scattered is glad of other herds to walk beside it." } },
      choices = {
        { text = "And what do the tauren take in return?", next = "why3" },
        { text = "Something else, Sagorne.", next = "BACK", fx = { learn = { "alterac" } } },
      },
    },
    why3 = {
      big = true,
      lines = { { id = "wh3_default", text = "Friends, and swords on our side when the centaur ride, which we did not have before. Some of the elders in Thunder Bluff say we give too much to the newcomers, but I have seen what an orc's gratitude looks like, and it is not a small thing." } },
      choices = {
        { text = "The Horde is stronger for every tribe in it.", next = "BACK", reply = "So Cairne believes, and so do I. A single kodo is prey, but a herd turns even the plainstrider lions away.", fx = { align = { order = 1 } } },
        { text = "Those elders may be right. Each tribe should look to itself.", next = "BACK", reply = "Perhaps, but the Grimtotem looked only to themselves, and see how that has made them. I would sooner trust too much than too little.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weather = {
      lines = { { id = "we_default", text = "Ha, you have a good ear. The elements are like the weather on the plains, because you cannot command the rain, only learn where it will fall and stand ready with your bowl." } },
      choices = {
        { text = "Some say a shaman commands them.", next = "weather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weather2 = {
      big = true,
      lines = { { id = "we2_default", text = "Some say so, and some of them are orcs who learned the lesson of the warlocks too well. A shaman asks, and the spirits answer if they choose, so the day a shaman begins to demand is the day the spirits fall silent." } },
      choices = {
        { text = "Then I'll always ask, and listen.", next = "BACK", reply = "Good. Asking is not weakness, young one, it is how you stay a friend to something stronger than yourself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Strength takes what it needs. The spirits will learn that.", next = "BACK", reply = "The Burning Legion taught the orcs that lesson, and see what it cost them. I hope you never learn it the same way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark = {
      lines = { { id = "dk_default", text = "In Scholomance, where the Cult of the Damned teaches necromancy to the living, a death knight named Darkreaver has been raising horrors from the dead. The spirits of the earth cannot rest while he does it, and they have asked the shaman of the Horde to put an end to him." } },
      choices = {
        { text = "How do I reach him?", next = "dark2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scourge" } } },
      },
    },
    dark2 = {
      lines = { { id = "dk2_default", text = "He keeps a great ossuary deep in the school, and he will not come out to fight while his bones lie quiet. You must disturb them, and then he will come, and you will need friends at your side, because he is not a thing one shaman can face alone." } },
      choices = { { text = "I'll gather my friends, then.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    home = {
      lines = { { id = "ho_default", text = "Every morning, when I wake under stone instead of sky. Orgrimmar is a good city and a strong one, but nothing in it smells of rain on the grass, and I find I listen for the wind on the mesas more than I should." } },
      choices = {
        { text = "The Valley of Wisdom has some sky, at least.", next = "BACK", reply = "It does, and I walk there when the Hold grows too loud. You have a kind way of seeing things.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "The Warchief listens to the spirits more closely than any orc I know, which is why I came here gladly when Cairne asked." } },
    earth_mother = { { id = "tp_em", text = "She is beneath every stone of this city too, though the orcs built over her in a hurry. She does not mind, I think, so long as they remember she is there." } },
    advice = { { id = "tp_ad", text = "Never call on a spirit you have not thanked. They keep a longer memory than any elder." } },
    _none = { { id = "tp_none", text = "That is beyond what an old bull can tell you. Ask the wind, perhaps, since it travels more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Sian'tsu: Darkspear shaman trainer in Grommash Hold.
---------------------------------------------------------------------------
P:NPC {
  key = "siantsu", id = TODO_NPC("Sian'tsu"), name = "Sian'tsu", title = "Shaman Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "wry" }, values = { "wise", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "She talks as if she can still hear the Echo Isles' surf.",
    third = "{name} met Sian'tsu, the troll shaman trainer in Grommash Hold.",
  },
  greetings = {
    { id = "g_default", text = "Hey now, you be lookin' for a shaman or just lost in de big orc house? Both happen here more than you think." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, and still in one piece. De spirits must like you, mon." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear, good, somebody in dis hall who knows how to smile. Sit, sit." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Your fire totem be smokin' a little, did you know? It does dat when it's restless, so give it somethin' to burn soon." },
    { id = "n_orc", cat = "race", when = { race = "Orc", class = "SHAMAN" },
      text = "An orc shaman, and so serious about it! Loosen your shoulders, mon, de wind don't come to somebody clenched like a fist." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ooh, de water in my bowl just went still as glass. It don't like what you carry, mon, so stand a little dat way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Sian'tsu, and I teach de shaman of de Horde, troll and orc and tauren all together. Thrall wanted all de people under one roof, so dis is de roof, and I be one of de people." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "A shaman, ready for de next lesson or I miss my guess. De spirits don't wait forever, so let's not waste de day." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask, ask, I got time till de next student trips over his totems." },
        { id = "h_again3", text = "You still be here, and I still be smilin'. Dat be a good sign for both of us, mon." },
      },
      choices = {
        { text = "I'm ready to train.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How do trolls come to the spirits?", next = "loa" },
        { text = "You don't seem to mind teaching orcs.", next = "orcs" },
        { text = "What's the hardest thing to teach?", next = "hard" },
        { text = "Three peoples under one roof must argue.", next = "roof" },
        { text = "You teach a stone's throw from the Warchief.", next = "hold" },
        { text = "A Darkspear shaman is a rare thing, I'd have thought.", next = "rare", when = { race = "Troll" } },
        { text = "The Earth Mother and your loa share this hall.", next = "tauren", when = { race = "Tauren" } },
        { text = "Farewell, Sian'tsu.", next = "END" },
      },
    },
    loa = {
      lines = { { id = "lo_default", text = "De loa and de elements be different spirits, but a troll who listens to one learns to hear de other. On de Echo Isles we learned de waves and de storms before we ever learned to read, so de water spirits and I go back a long way." } },
      choices = {
        { text = "Is that why you're quick to laugh?", next = "loa2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } },
      },
    },
    loa2 = {
      lines = { { id = "lo2_default", text = "Maybe so, because de sea laughs at everybody eventually. A shaman who can't laugh at herself gets very serious and very lonely, and de spirits don't like serious company much more than I do." } },
      choices = { { text = "Something else, Sian'tsu.", next = "BACK", fx = { affinity = 1 } } },
    },
    orcs = {
      big = true,
      lines = { { id = "or_default", text = "Thrall saved my people from de sea witch and de murlocs both, and he gave us a home in Durotar when we had nothin'. Teachin' his people to hear de spirits again be a small price, and de orcs be good students once dey stop shoutin'." } },
      choices = {
        { text = "The Darkspear owe Thrall everything. You repay it well.", next = "BACK", reply = "We do, and Vol'jin never lets us forget it, not dat any of us want to. Dis be my share of de debt, mon.", fx = { align = { order = 1 } } },
        { text = "Debts end. The Darkspear should look to their own.", next = "BACK", reply = "Maybe one day, when Zalazane is gone and de isles be ours again. Today, dis roof keeps de rain off, and I don't complain.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "ha_default", text = "Patience, every time. Young shaman want de lightning first and de listening later, and de spirits teach dem de other way round, usually by knockin' dem on dere backside." } },
      choices = {
        { text = "Did the spirits ever knock you down?", next = "hard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard2 = {
      lines = { { id = "ha2_default", text = "Ha, more dan once! I called a storm on de beach when I was a girl, to show my cousins, and de wave it sent took our boat and my father's nets. De water spirit never said a word about it, mon, it just let me watch de boat go." } },
      choices = {
        { text = "What did you learn from it?", next = "hard3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard3 = {
      big = true,
      lines = { { id = "ha3_default", text = "Dat de spirits be not servants and not teachers either. Dey be neighbours, mon, old ones, and you ask a neighbour for help de way you would want to be asked. I tell every student dat, and de ones who hear it need very little else from me." } },
      choices = {
        { text = "Asking with respect is the whole of the craft.", next = "BACK", reply = "Dat be it, and it took me a boat to learn it. You got it for free, so use it well.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A strong enough shaman need not ask.", next = "BACK", reply = "Dere was a troll who thought so, and now he sits on our islands with a head full of spite. Don't be dat one, mon.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roof = {
      lines = { { id = "ro_default", text = "All de time, mon, and it be de best part! Kardris says de spirits must be approached with ceremony, Sagorne says dey must be approached with humility, and I say dey must be approached with a joke, and somehow de students come out knowin' all three." } },
      choices = {
        { text = "Which of you is right?", next = "roof2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roof2 = {
      lines = { { id = "ro2_default", text = "Sagorne, probably, but don't tell him. De tauren never lost de spirits de way de orcs did, and never had to bargain with dem de way we did with de loa, so he comes to dem clean. I be a little jealous of dat, when I be honest." } },
      choices = { { text = "Something else, Sian'tsu.", next = "BACK" } },
    },
    hold = {
      lines = { { id = "ho_default", text = "I do, and he walks through sometimes and listens at de back like any student. De Warchief be de strongest shaman I ever stood near, mon, and he still asks old Kardris how she would do a thing before he does it. Dat tells you what kind of power he has." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rare = {
      lines = { { id = "ra_default", text = "Rarer dan it should be, cousin. De tribe has witch doctors and priests and shadow hunters, and de elements got left to de fishermen who needed to know de weather. Vol'jin asked a few of us to learn it proper from de orcs, and I was de one who could not say no to a storm." } },
      choices = { { text = "I'm glad you couldn't. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Dey do, and dey get along better dan you would fear. Your Earth Mother be big enough to hold everything, and de loa be too proud to notice dey be standin' on her, so nobody quarrels. Sagorne laughed when I told him dat, and he does not laugh often." } },
      choices = { { text = "That sounds like him. Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "He pulled my people off a drownin' island with de sea witch reachin' for us. Every lesson I give in his hall be a small piece paid back." } },
    the_elements = { { id = "tp_elements", text = "Water I know best, den air, den earth. Fire and I be polite to each other, mon, and we leave it at dat." } },
    darkspear = { { id = "tp_darkspear", text = "We be few and far from home, and we be still laughin'. Nobody ever broke a people dat could still laugh." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be de cleverest troll I ever met, and he sits beside Thrall like he was born dere. Don't tell him I said so, his head be big enough." } },
    echo_isles = { { id = "tp_echo", text = "Zalazane holds de isles now with his hexed fools, and I dream of de beaches anyway. One day, mon." } },
    _none = { { id = "tp_none", text = "Dat one I don't know, and de spirits ain't sayin' either." } },
  },
}

---------------------------------------------------------------------------
-- Zamja: Darkspear cooking trainer in the Drag.
---------------------------------------------------------------------------
P:NPC {
  key = "zamja", id = TODO_NPC("Zamja"), name = "Zamja", title = "Cooking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "craft", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "She has firm opinions about orc seasoning and shares them freely.",
    third = "{name} met Zamja, the troll cooking trainer in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear of de block, I be choppin'. You want to learn cookin', or you just smell somethin' good?" },
    { id = "g_back", when = { metBefore = true }, text = "You be back! Did you burn anything since last time? Everybody does, so don't lie." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell like a cookfire, a good one with some pepper in it. Maybe dere's hope for you after all." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Let me guess, you like your boar burnt on de outside and raw in de middle, like every orc I ever fed." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear nose! Come, smell dis and tell me if it be right, because every orc I ask just says it be hot." },
    { id = "n_dead", cat = "race", when = { race = "Scourge" },
      text = "One of de dead ones. Can you taste, mon? No, don't tell me, I cook it right either way and I rather not know." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Zamja, and I teach cookin' to anybody in Orgrimmar who wants to eat better than a grunt on a march. Dat be most of you, if you're honest." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "A cook come back for de next lesson. Good, because I got recipes waitin' and nobody else in dis city listens." },
      },
      again = {
        { id = "h_again", text = "What else? De meat won't chop itself." },
        { id = "h_again2", text = "Go on, I can talk and chop together." },
        { id = "h_again3", text = "Talk, talk, but stand upwind of de pepper pot or you be cryin' on my floor." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's wrong with orc cooking?", next = "orcfood" },
        { text = "What do trolls cook that orcs don't?", next = "troll" },
        { text = "Where should a cook find good meat?", next = "meat" },
        { text = "The Drag must be the busiest kitchen in the city.", next = "drag" },
        { text = "I fish. What should I bring you from the water?", next = "fish", when = { profession = "Fishing" } },
        { text = "A tauren's cooking would surprise you, I think.", next = "tauren", when = { race = "Tauren" } },
        { text = "Do any of your students cook well?", next = "students" },
        { text = "I'll leave you to your chopping.", next = "END" },
      },
    },
    orcfood = {
      big = true,
      lines = { { id = "of_default", text = "Nothin' wrong with it, if all you want is to stop bein' hungry. Orcs cook like dey fight, fast and hot and no thinkin', but a little patience and a little spice and de same boar tastes like a feast." } },
      choices = {
        { text = "Food is fuel. The orcs have it right.", next = "BACK", reply = "Fuel, he says! Then go eat de raw stuff and leave de good cookin' to people who taste it.", fx = { align = { order = 1 } } },
        { text = "A meal should be savoured. Teach me the spices.", next = "BACK", reply = "Now dat be a student talkin'. Start with de peppers from de Barrens, and work your way up to de fire.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Fish, mostly, since de Darkspear lived by de sea, and anything with enough pepper to make your eyes run. On de Echo Isles we cooked crab in de shell right on de coals, and I still miss de smell of it." } },
      choices = {
        { text = "Can you get crab in Orgrimmar?", next = "troll2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll2 = {
      lines = { { id = "tr2_default", text = "Sometimes, from de fishers down by Sen'jin, if dey don't eat it first. Bring me some clattering scorpid or crab from de coast, and I show you what a troll does with it." } },
      choices = { { text = "Something else, Zamja.", next = "BACK" } },
    },
    meat = {
      lines = { { id = "me_default", text = "Boar from Durotar, but de young ones, because de old tusks be tough as boot leather. Out in de Barrens de kodo and de plainstriders be better, and de butchers in de Valley of Strength sell good cuts if you don't want to hunt." } },
      choices = {
        { text = "Which butcher do you buy from?", next = "meat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat2 = {
      lines = { { id = "me2_default", text = "Olvia, by de inn, when I want it clean and quick, and Thuwd across de way when I want it cheap, because he only cares about de hide. I take de carcass after he be done with it, and he thinks he be gettin' rid of rubbish." } },
      choices = {
        { text = "What do you make from Thuwd's leavings?", next = "meat3" },
        { text = "Something else, Zamja.", next = "BACK" },
      },
    },
    meat3 = {
      big = true,
      lines = { { id = "me3_default", text = "Stew, and stock, and de marrow goes on bread for de peons who sweep de Drag at night. Nobody asks me to feed dem, mon, but dey work in my smell all day and go home to gruel, and I can't cook with dat on my mind." } },
      choices = {
        { text = "A good cook feeds whoever is hungry.", next = "BACK", reply = "Dat be what my mother said, with a ladle in her hand. Sit down some night and I feed you too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Give it away and nobody will pay for it.", next = "BACK", reply = "De ones who can pay, pay. De ones who can't sweep my step without bein' asked, so who be de fool?", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drag = {
      lines = { { id = "dr_default", text = "It be de only kitchen worth de name, mon! De inn does meat on a stick and calls it supper. Down here it stays cool under de awnings, de leatherworkers send me scraps, and every trade in de Drag comes past my block when de sun be highest." } },
      choices = {
        { text = "Who eats the most?", next = "drag2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drag2 = {
      lines = { { id = "dr2_default", text = "De smiths' apprentices from de Valley of Honor, who run all de way here because Saru Steelfury won't let dem stop long. Den Nogg's engineers, who eat with black hands and never notice what dey be eatin', and it breaks my heart every day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students = {
      lines = { { id = "st_default", text = "One or two. De orcs learn fast once dey believe a recipe be a kind of battle plan, and de tauren already know more about roots and grain dan I do. De Forsaken follow every step perfect and den ask me if it be good, mon, because dey can't tell." } },
      choices = {
        { text = "That must be hard to teach around.", next = "BACK", reply = "It be sad more dan hard. I tell dem to cook for somebody livin' and watch de face, and dat works.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish = {
      lines = { { id = "fi_default", text = "Anything from de coast with scales on it, and I don't care how ugly. Lumak teaches de fishin' up de way, and he and I got an arrangement, he sends me de students and I send him back de ones who burn everything." } },
      choices = { { text = "I'll bring you my next catch. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "It already did, mon. A brave from Thunder Bluff showed me how dey bake bread in hot ash with no pot at all, and I been tryin' to get it right for a year. You know how, you come round de block and show me." } },
      choices = { { text = "Gladly, when there's time. Something else.", next = "BACK" } },
    },
  },
  topics = {
    darkspear = { { id = "tp_darkspear", text = "De tribe cooked for de orcs de first night we landed in Durotar. Half of dem cried from de pepper, and we been friends ever since." } },
    thrall = { { id = "tp_thrall", text = "De Warchief eats what his grunts eat, dey say, and I say dat be loyalty gone too far. Somebody send him down here." } },
    ratchet = { { id = "tp_ratchet", text = "De goblins sell spice from across de sea, at prices dat make me dizzy. I pay dem, mon, because a kitchen without spice be just a fire." } },
    _gated = { { id = "tp_gated", text = "Dat I keep for people who have eaten at my block more dan once. Come back hungry." } },
    echo_isles = { { id = "tp_echo", text = "De best crabs in de world be on dose isles, and Zalazane's fools be eatin' dem all. Dat alone be reason enough to take de isles back." } },
    _none = { { id = "tp_none", text = "Dat ain't food, so I don't know it, mon." } },
  },
}

---------------------------------------------------------------------------
-- Thuwd: orc skinning trainer in the Drag, always mid-carcass.
---------------------------------------------------------------------------
P:NPC {
  key = "thuwd", id = TODO_NPC("Thuwd"), name = "Thuwd", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "craft", "practical" },
  notices = { "craft", "pet" },
  impression = {
    first = "He talks about hides the way other orcs talk about axes.",
    third = "{name} met Thuwd, the orc skinning trainer in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Mind your feet, there's blood on the stones. If you're here to learn the knife, kneel down; if not, you're in my light." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me your hands, and I'll tell you how many hides you've ruined." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You've been skinning, I can see it under your nails. Good, the knife only teaches those who use it." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your {pet} back from my boar, hunter. It's had its dinner, I'm sure, and this one's mine." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Aim for the eye or the heart and leave the flank alone, because I'm the one who has to work around your holes." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people taught mine most of what I know about using the whole beast, and I'll say so to anyone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Thuwd. I teach skinning, which means I teach you not to waste what the hunt gives you. A hide cut badly is a beast killed for nothing, and I won't have that in my city." },
      },
      again = {
        { id = "h_again", text = "What else? The boar's getting stiff." },
        { id = "h_again2", text = "Ask. The knife can wait a breath." },
        { id = "h_again3", text = "Talk if you must. I can listen and cut, and I'd sooner cut." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "A beast killed for nothing?", next = "waste" },
        { text = "Where do the hides go after you?", next = "hides" },
        { text = "That boar looks sick, Thuwd.", next = "boar" },
        { text = "You learned this somewhere harder than the Drag.", next = "learned" },
        { text = "Hunters must bring you some strange kills.", next = "strange" },
        { text = "My people honor the beast before the knife.", next = "tauren", when = { race = "Tauren" } },
        { text = "I work leather. Which hides should I ask for?", next = "lw", when = { profession = "Leatherworking" } },
        { text = "I'll get out of your light.", next = "END" },
      },
    },
    waste = {
      big = true,
      lines = { { id = "wa_default", text = "Ask a tauren, they'll tell you the same. The beast gives you its life, so you take the meat, the hide and the bone, and you leave nothing for the vultures but the smell." } },
      choices = {
        { text = "That's right. A clean kill deserves a clean hide.", next = "BACK", reply = "Good, you listen. Kneel here, then, and I'll show you where to start the cut.", fx = { align = { honor = 1 } } },
        { text = "The vultures need to eat too. I only take what sells.", next = "BACK", reply = "Then you'll be poor and the vultures will be fat. Your choice, but don't learn it at my boar.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Across the Drag to Karolek and the Kodohide leatherworkers, mostly, who complain about every scratch I leave. The rest go to the armorers and the drum-makers, and the scraps go to the peons for their boots." } },
      choices = {
        { text = "Drum-makers? Tell me about the drums.", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boar = {
      lines = { { id = "bo_default", text = "Sharp eyes. It's one of the mottled boars from the valley south of here, and something's got into them, they come out with rot in their gut and madness in their eyes. The meat's no good, but the hide still teaches the knife." } },
      choices = {
        { text = "What's causing it?", next = "boar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boar2 = {
      lines = { { id = "bo2_default", text = "Some say it's the Burning Blade and their foul magic in the caves, others say bad water. I just skin them, and I wash my hands after, and I tell the young ones to do the same." } },
      choices = { { text = "Something else, Thuwd.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    hides2 = {
      lines = { { id = "hi2_default", text = "The war drums in the Valley of Honor are kodo hide, stretched wet and dried in the sun for a month, and one drum takes a whole bull's back. I skinned the one that hangs over the Hall of the Brave, and it took four of us a day." } },
      choices = {
        { text = "Where does Orgrimmar get kodo?", next = "hides3" },
        { text = "Something else, Thuwd.", next = "BACK" },
      },
    },
    hides3 = {
      big = true,
      lines = { { id = "hi3_default", text = "From the Barrens, and only the ones that go to the graveyard to die, or so the tauren ask of us. Some of our hunters don't wait, and I've had hides brought to me that were plainly taken from a beast in its prime with a calf beside it." } },
      choices = {
        { text = "Refuse those hides. The tauren are our allies.", next = "BACK", reply = "I do refuse them, and I tell the hunter why, loudly. It costs me coin and I sleep the better for it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide is a hide once the beast is dead.", next = "BACK", reply = "Say that in Thunder Bluff and see how long you keep your welcome. The Horde's a pact, and I'll not skin a hole in it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned = {
      lines = { { id = "le_default", text = "On the march, after Hyjal, when there was no supply train and we lived on what we killed. A tauren called it shameful that orcs threw half of every beast away, and he was right, so I sat down beside him with a knife and I've not stood up since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "st_default", text = "A thunder lizard once, with the skin still crackling so that the knife jumped in my hand. Raptors by the cartload, and now and then some fool brings me a basilisk and asks why its hide has turned his gloves to stone." } },
      choices = {
        { text = "What is the worst hide to work?", next = "strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange2 = {
      lines = { { id = "st2_default", text = "Scorpid, without question. It isn't a hide at all, it's plate with a grudge, and you must find the seams and pop each piece off whole. Karolek's people will pay well for clean scorpid scale, so it's worth the cut fingers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "I know it, and I've taken up the habit. I say a word over each carcass now, quietly, since the grunts would laugh. I don't know who hears it, but the knife goes cleaner after." } },
      choices = { { text = "The Earth Mother hears it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lw = {
      lines = { { id = "lw_default", text = "Light boar for practice, and medium hides off the Barrens cats when your hands are steadier. Don't buy from the auction house till you've seen the back of the hide, because half of what's sold there was skinned by someone in a hurry." } },
      choices = { { text = "I'll check the backs. Something else.", next = "BACK" } },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "Something of theirs is in the Durotar boars, I'd swear to it. I've opened three this month that were black inside." } },
    thrall = { { id = "tp_thrall", text = "The Warchief keeps wolves and honors them, as the Frostwolves always have. I've never been brought a wolf pelt in this city, and I'd not take one." } },
    cairne = { { id = "tp_cairne", text = "The old bull's people showed us how to live on this land without stripping it. I'd not have a craft without them." } },
    centaur = { { id = "tp_centaur", text = "I've been asked what I would do with a centaur. I answered that I've standards, and left it there." } },
    _none = { { id = "tp_none", text = "If it hasn't got a hide, I've got no opinion on it." } },
  },
}

---------------------------------------------------------------------------
-- Handor: cloth and leather armor in the Kodohide Leatherworkers shop.
---------------------------------------------------------------------------
P:NPC {
  key = "handor", id = TODO_NPC("Handor"), name = "Handor", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "He says what's wrong with your gear before you've asked.",
    third = "{name} met Handor, who sells cloth and leather armor in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Kodohide Leatherworkers. Your boots are worn through at the heel, by the way, so you came to the right shop." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Let me see how my leather held up, then." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone a while, and your gear shows every mile of it. Stand still and let me see the damage." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. You'll want the soft leather, the kind that doesn't creak, and I've got it if you've got the coin." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in my shop, and you're looking at the kodo hides as if you knew them. Don't tell me, I'd rather not know." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That isn't armor any more, it's a memory of armor. Take it off before it falls off, and I'll find you something that closes." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll want it loose at the shoulder for the draw, and you'll tell me so as if I'd never fitted an archer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Handor. I sell cloth and leather, padded, cured and stitched right here in the Drag. It won't stop an axe, but it'll stop the wind and a bit of everything else." },
      },
      again = {
        { id = "h_again", text = "Anything else, or just browsing?" },
        { id = "h_again2", text = "Go on, I've time between customers." },
        { id = "h_again3", text = "Still here. Good, it gives me longer to look at that stitching of yours." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Who does your stitching?", next = "shop" },
        { text = "Leather against an axe? Why bother?", next = "axe" },
        { text = "You judged my boots before I'd said a word.", next = "eye" },
        { text = "Tor'phan up the street says your leather creaks.", next = "torphan" },
        { text = "What should a traveller wear for the Barrens?", next = "barrens" },
        { text = "I need something that keeps quiet in the dark.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I work leather. Would the shop buy from me?", next = "lw", when = { profession = "Leatherworking" } },
        { text = "Just looking, Handor.", next = "END" },
      },
    },
    shop = {
      lines = { { id = "sh_default", text = "The leatherworkers in the back, with Karolek teaching the young ones next door. Thuwd sends us the hides, and we curse his knife-work, and he curses our stitching, and the armor comes out fine anyway." } },
      choices = {
        { text = "Sounds like a family.", next = "shop2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop2 = {
      lines = { { id = "sh2_default", text = "Closer than a family, since we can't get away from each other. After the camps, a roof and a trade and a few people to argue with is more than most of us thought we'd have." } },
      choices = { { text = "Something else, Handor.", next = "BACK", fx = { learn = { "internment" } } } },
    },
    axe = {
      big = true,
      lines = { { id = "ax_default", text = "Because not everyone stands in the front line, and the ones who don't still need to come home. A mage in plate can't cast, and a hunter in plate can't creep, so they buy from me and keep their distance from the axe instead." } },
      choices = {
        { text = "Fair enough. Every fighter has a place.", next = "BACK", reply = "That's it. The Horde needs its archers as much as its grunts, and the archers need my leather.", fx = { align = { order = 1 } } },
        { text = "A real warrior faces the axe. The rest hide.", next = "BACK", reply = "Then go and face it, and come back for bandages from someone else. I'll be here selling to the ones who lived.", fx = { align = { order = -1 } } },
        { text = "Has your leather ever decided a real fight?", next = "axe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    axe2 = {
      lines = { { id = "ax2_default", text = "More than the plate, some seasons. Plate gets a grunt killed slowly and leather gets a scout home quickly, and a scout who comes home tells the Warchief where the enemy is. I'd say that jerkin did more for the Horde than the breastplate did." } },
      choices = {
        { text = "The Horde needs its quiet ones as much as its loud.", next = "BACK", reply = "It does, and the quiet ones pay on time. Remember me when you need a jerkin.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A warrior should face the axe, not dodge it.", next = "BACK", reply = "Then go to the armorers in the Valley of Honor, and good luck to you. I'll be here when the dents start to pinch.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye = {
      lines = { { id = "ey_default", text = "It's the trade. Twenty steps is enough to see where someone has been and how they fight, if you know what wear looks like. Yours says a great deal of walking and not much sitting, and that you favour one side when you're tired." } },
      choices = {
        { text = "What else can you read from gear?", next = "eye2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye2 = {
      lines = { { id = "ey2_default", text = "Who's lying about where they've been, mostly. A grunt came in last month swearing he'd fought in Ashenvale, with not one thorn-snag on his leggings. I sold him the leggings he asked for and kept my mouth shut, which is the other half of the trade." } },
      choices = { { text = "Something else, Handor.", next = "BACK" } },
    },
    torphan = {
      lines = { { id = "tp_default", text = "New leather creaks. It stops when it's been worn, and his customers would know that if any of them wore his robes long enough to find out. He's a good salesman, I'll give him that, and Magar's needle is the best in the Drag, so between them they do no real harm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barrens = {
      lines = { { id = "ba_default", text = "Light, and all of it broken in before you go. The Barrens is hot by day and cold by night and full of things with claws, so you want leather on the legs, cloth at the neck to keep the dust out, and boots that have already walked a week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "rg_default", text = "Then you want the oiled kodo calfskin on the back shelf, with the buckles wrapped. Shenthul's people from the Cleft buy it by the bundle and never give a name, and I've learned not to offer them a receipt." } },
      choices = { { text = "No receipt, then. Something else.", next = "BACK" } },
    },
    lw = {
      lines = { { id = "lw_default", text = "If the stitching's even and the hide's clean, yes. Bring a piece to Karolek first, because he decides what's good enough to hang under our sign, and he has turned away work from orcs twice your age." } },
      choices = { { text = "I'll show Karolek. Something else.", next = "BACK" } },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "They gave us one blanket each and nothing to mend it with. I learned to sew with a fish bone, and I've not wasted a scrap since." } },
    thrall = { { id = "tp_thrall", text = "The Warchief has his armor from Doomhammer and needs nothing from me. His wolf riders are another matter, and they are particular." } },
    warsong = { { id = "tp_warsong", text = "The Warsong outriders buy my lightest leather and bring it back in ribbons. Whatever lives in Ashenvale has sharp opinions." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask me about seams instead." } },
  },
}

---------------------------------------------------------------------------
-- Tor'phan: cloth and leather armor at Magar's Cloth Goods.
---------------------------------------------------------------------------
P:NPC {
  key = "torphan", id = TODO_NPC("Tor'phan"), name = "Tor'phan", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "practical", "ambitious" },
  notices = { "class", "purse" },
  impression = {
    first = "He calls every robe the finest in the Drag.",
    third = "{name} met Tor'phan, who sells armor at Magar's Cloth Goods in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Magar's! Whatever Handor told you, his leather creaks, and ours doesn't." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer, and a wise one. Come in, come in." },
    { id = "g_away", when = { away = 14 }, text = "My friend, where have you been? The whole season's cut has changed since you left, and you are wearing last season." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! The robes on the left are cut for spellwork, with room in the sleeves so your hands move freely." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock! We keep the darker bolts at the back, out of the light, where they hold their colour and nobody stares." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Friend, I say this with respect, but you are wearing rags with a memory of thread in them. Let me help before someone mistakes you for a peon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Tor'phan, at your service, selling the best cloth and leather armor in Orgrimmar here at Magar's. Magar sews and teaches, and I sell, which is the part he doesn't like doing." },
      },
      again = {
        { id = "h_again", text = "What else can I show you?" },
        { id = "h_again2", text = "Take your time, though not too much, because the good robes go quickly." },
        { id = "h_again3", text = "Ask anything, friend. Questions are free, and they're the only thing in here that is." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "You and Handor don't get along?", next = "handor" },
        { text = "Magar doesn't like selling?", next = "magar" },
        { text = "Every robe can't be the finest in the Drag.", next = "finest" },
        { text = "Who buys cloth in a city of warriors?", next = "buyers" },
        { text = "I'm a tailor. Would Magar look at my work?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "The Forsaken dress more finely than you'd expect.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll look elsewhere.", next = "END" },
      },
    },
    handor = {
      big = true,
      lines = { { id = "ha_default", text = "We get along fine, so long as he keeps to his side of the Drag. A city this size has room for two armor shops, but only one of them can be the best, and it isn't his." } },
      choices = {
        { text = "How long have you two been at this?", next = "handor2" },
        { text = "Rivalry keeps you both honest. Good.", next = "BACK", reply = "Exactly what I tell Magar! The customers win, and so do I, most days.", fx = { align = { honor = 1 } } },
        { text = "Undercut him and drive him out. That's business.", next = "BACK", reply = "Ha, I've thought of it, but then who would I complain about? No, I'll beat him fair and enjoy it more.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    magar = {
      lines = { { id = "ma_default", text = "He'd rather be bent over a needle all day, teaching young tailors how to make a straight seam. Haggling makes him grumpy, so I do the haggling and he does the grumbling about my prices." } },
      choices = {
        { text = "Do you sew at all?", next = "magar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magar2 = {
      lines = { { id = "ma2_default", text = "I can sew a button on, and that's the end of it. Every orc in this city learned a trade after the camps, and mine turned out to be talking, which is useful in a shop if nowhere else." } },
      choices = { { text = "Something else, Tor'phan.", next = "BACK" } },
    },
    handor2 = {
      lines = { { id = "ha2_default", text = "Since the Drag had awnings. His shop opened a week before ours, and he has never once let me forget that week. But when a fire took our back room two winters ago, it was Handor who came across with buckets before the grunts did, and he'd deny it if you asked." } },
      choices = {
        { text = "So the feud is mostly for show.", next = "handor3" },
        { text = "Something else, Tor'phan.", next = "BACK" },
      },
    },
    handor3 = {
      big = true,
      lines = { { id = "ha3_default", text = "Don't say that where customers can hear! A little rivalry brings people down the Drag to see who's shouting, and they leave with a robe from one of us. He knows it and I know it, and neither of us would be fool enough to make peace." } },
      choices = {
        { text = "An honest rivalry sharpens you both.", next = "BACK", reply = "It does, and it's kept us both fed. I'll tell him you said so, and he'll scowl, and that's as near as he comes to smiling.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A clever trick to play on your customers.", next = "BACK", reply = "Trick is a hard word, friend. Call it theatre. They get a good robe and a story, and nobody's the poorer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    finest = {
      lines = { { id = "fi_default", text = "Ah, but each is the finest of its kind, you see. This is the finest linen robe, and that is the finest woollen one, and the one you're looking at is the finest in the Drag at that price. I've never told a lie in this shop; I've only been generous with my categories." } },
      choices = {
        { text = "Which one would you buy yourself?", next = "finest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    finest2 = {
      lines = { { id = "fi2_default", text = "The plain grey travelling robe on the second peg, with the double seam. Magar cut it himself, it'll outlast three of the fancy ones, and I can never sell it because it doesn't look like anything. There, now you know more than most of my customers." } },
      choices = { { text = "I'll remember the second peg. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "More than you'd guess. The mages and priests from the Valley of Spirits, every warlock in the Cleft, and half the shaman in Grommash Hold. Then the grunts' mates want a tabard mended, and the tauren want everything let out at the shoulders, and it adds up to a living." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "ta_default", text = "He would, and he'd tell you every fault in it before he found a kind word. Go and show him, he's right there at the bench, and if he grunts twice it means it's good. If any of it's fit to sell, I'm the one you'll haggle with." } },
      choices = { { text = "Two grunts. I'll hope for them. Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "So I've noticed, and I've learned from it. Your people come in wanting silk and a proper cuff, cut the way it was done in Lordaeron, and they know good work when they see it. Magar grumbles and then spends all night on the order." } },
      choices = { { text = "Standards survive the grave. Something else.", next = "BACK" } },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "We all wore the same sacking in the camps, friend. I think that's why I love a shop where no two things on the wall match." } },
    thrall = { { id = "tp_thrall", text = "The Warchief dresses for war and nothing else. A great orc, but between us, a wasted opportunity for a tailor." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins bring dyes we can't make here, and they know it. I haggle with them the way you'd wrestle a crocolisk, carefully and for a long time." } },
    advice = { { id = "tp_ad", text = "Buy the plain one with the good seam. I'll deny I said it." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend, but I could sell you a robe while you wonder." } },
  },
}

---------------------------------------------------------------------------
-- Kor'jus: mushroom seller at Dark Earth, the Cleft of Shadow.
---------------------------------------------------------------------------
P:NPC {
  key = "korjus", id = TODO_NPC("Kor'jus"), name = "Kor'jus", title = "Mushroom Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "craft", "patient" },
  notices = { "race", "hunger" },
  impression = {
    first = "He is calm, sun-starved and proud of every cap he grows.",
    third = "{name} met Kor'jus, who sells mushrooms at Dark Earth in the Cleft of Shadow.",
  },
  greetings = {
    { id = "g_default", text = "Dark Earth, mushrooms of every kind that's safe to eat, and a few that are only mostly safe. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? The spores have taken to you, I think." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. Your people eat my mushrooms more than anyone, and I've stopped asking why." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. If you've come for the grey caps with the ring, they're on the top shelf, and I'll want to hear a teacher's name before I sell them." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook, by the smell of woodsmoke. Don't wash them, whatever you do, only brush them, or you'll boil out everything I spent a month growing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kor'jus, and I grow mushrooms here in the Cleft, where the sun never comes to dry them out. Most people walk past my door to see the warlocks, but sooner or later everyone gets hungry." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Ask away, the mushrooms aren't going anywhere." },
        { id = "h_again3", text = "Take your time. Nothing down here grows quickly, and I've learned not to either." },
      },
      choices = {
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "You don't mind living down here?", next = "cleft" },
        { text = "Mushrooms only mostly safe?", next = "safe" },
        { text = "You look like you never see the sun.", next = "sun" },
        { text = "Growing food underground is a strange trade for an orc.", next = "trade" },
        { text = "Who are your neighbours down here?", next = "neighbours" },
        { text = "I gather herbs. Mushrooms aren't so different.", next = "herb", when = { profession = "Herbalism" } },
        { text = "Do the Forsaken truly eat these?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Good day, Kor'jus.", next = "END" },
      },
    },
    cleft = {
      big = true,
      lines = { { id = "cl_default", text = "The Cleft gets a bad name, because of the warlocks and the shadowy types, but the Warchief lets them stay so long as they keep his law. My neighbours keep to themselves and pay on time, which is more than I can say for some in the Drag." } },
      choices = {
        { text = "Which neighbours do you mean?", next = "cleft2" },
        { text = "Thrall is wise to keep them where he can see them.", next = "BACK", reply = "That's how I see it. Better under the city's eye than out in the hills plotting with the Burning Blade.", fx = { align = { light = 1 } } },
        { text = "Their magic is power. The Horde should use more of it.", next = "BACK", reply = "Maybe, but I remember what that sort of power cost us once. I'll stick to mushrooms.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Ha! Most are, if you cook them, and a few are better raw, and a couple you only eat if a shaman tells you to. I label them all, so read the labels and you'll be fine." } },
      choices = {
        { text = "What do the shaman want with them?", next = "safe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe2 = {
      lines = { { id = "sa2_default", text = "Visions, they say, though the visions I've had from them were mostly of my own floor. The old orc shamans used them before the demons came, and some of the young ones are trying it again." } },
      choices = { { text = "Something else, Kor'jus.", next = "BACK" } },
    },
    sun = {
      lines = { { id = "su_default", text = "I don't, and I don't miss it much, since mushrooms hate the sun and I've come to agree with them. A grunt told me I look like a Forsaken, and I took it as a compliment, since they're my best customers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cleft2 = {
      lines = { { id = "cl2_default", text = "Rekkul sells poisons two doors along and buys my deathcaps without a word. Muragus has his staves, the Shattered Hand come and go by the back, and Neeru Fireblade holds court farther in, where I don't go. It's a quiet street, in its way." } },
      choices = {
        { text = "You don't go near Neeru. Why?", next = "cleft3" },
        { text = "Something else, Kor'jus.", next = "BACK" },
      },
    },
    cleft3 = {
      big = true,
      lines = { { id = "cl3_default", text = "Because his visitors come at odd hours, and they don't buy mushrooms. I notice who walks past my door, and I've noticed that some who walk in toward Neeru wear the Burning Blade's look about them. I've said as much to a grunt, once, and was told it's known." } },
      choices = {
        { text = "You did right to report it. Keep watching.", next = "BACK", reply = "I will. A shopkeeper sees a great deal if he keeps his mouth shut and his door open.", fx = { affinity = 1, align = { order = 1 }, learn = { "neeru" } } },
        { text = "Safer to see nothing in a street like this.", next = "BACK", reply = "Safer, yes. But it's my city too, and I'd not have it rot from the cellar up.", fx = { align = { order = -1 }, learn = { "neeru" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "It is, and I came to it by accident. I was a peon digging these tunnels when Orgrimmar was founded, and where we broke through to damp rock, things started growing by themselves. Everyone else cursed the mould, and I ate one to see what would happen." } },
      choices = {
        { text = "And what happened?", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      lines = { { id = "tr2_default", text = "Nothing, the first time, which is the best thing a mushroom can do. The fourth kind I tried put me on my back for two days, and that's the one Rekkul buys. I put down my pick the week after and I've not dug for anyone since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = { { id = "ne_default", text = "Warlocks, poisoners and people who'd rather not be asked, and I'll tell you they're the best neighbours I've had. Nobody down here borrows anything, nobody sings, and when my roof leaked it was a warlock's voidwalker that held the beam while I patched it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    herb = {
      lines = { { id = "he_default", text = "They're different in the one way that matters, which is that a herb you've mistaken leaves you with a bad poultice and a mushroom you've mistaken leaves you dead. Jandi up in the Drag knows her leaves. If you find anything with a cap, bring it to me before you taste it." } },
      choices = { { text = "I'll bring it to you first. Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Your people buy more than they could possibly eat, so I've stopped assuming they eat them. The apothecaries take the spotted ones by the crate. I don't ask what for, and I notice you aren't telling me." } },
      choices = { { text = "No, I'm not. Something else.", next = "BACK" } },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "They're under this city, in the fire caves, and everyone in the Cleft knows it. It's the ones who aren't in the caves that worry me." } },
    thrall = { { id = "tp_thrall", text = "The Warchief came down here once, with no guard, and bought a bag of browncaps. I've kept the coin." } },
    forsaken = { { id = "tp_forsaken", text = "Good customers. They never haggle and they never complain about the damp." } },
    neeru = { { id = "tp_neeru", text = "He's a warlock with the Warchief's leave to be here, and more visitors than a warlock needs. That's all I know, and all I want to." } },
    _none = { { id = "tp_none", text = "That doesn't grow in the dark, so I couldn't tell you." } },
  },
}

---------------------------------------------------------------------------
-- Muragus: staff merchant in the Cleft of Shadow.
---------------------------------------------------------------------------
P:NPC {
  key = "muragus", id = TODO_NPC("Muragus"), name = "Muragus", title = "Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "craft" },
  notices = { "class" },
  impression = {
    first = "He weighs each staff in his hand before he hands it over.",
    third = "{name} met Muragus, the staff merchant in the Cleft of Shadow.",
  },
  greetings = {
    { id = "g_default", text = "Staves. Oak, ironwood, and a few with more in them than wood, if you know what to look for." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did the last staff serve you, or break on something?" },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, of course. You all come to me after Mirket and Zevrost, and you all want the darkest wood I've got." },
    { id = "n_staff", cat = "kit", when = { class = { "MAGE", "PRIEST", "DRUID", "SHAMAN" } },
      text = "You hold that one too near the top. Drop your hand a span, and it will stop pulling your shoulder." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior among the staves. If you're lost, the axes are in the Valley of Honor, and if you aren't, I'm curious." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Muragus. I sell staves to the mages, the warlocks, and anyone else who'd rather keep their enemies at arm's length. A good staff is a weapon and a walking stick both, and a wise one is never without it." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Ask, if you need to." },
        { id = "h_again3", text = "You've more to ask. Go on; wood keeps." },
      },
      choices = {
        { text = "Show me your staves.", next = "BUSINESS" },
        { text = "What does a warlock want in a staff?", next = "locks" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "You weigh every staff before you hand it over.", next = "weigh" },
        { text = "The Cleft seems an odd place for an honest shop.", next = "cleft" },
        { text = "I'm a mage. Your warlock stock won't suit me.", next = "mage", when = { class = "MAGE" } },
        { text = "A druid's staff should be living wood.", next = "druid", when = { class = "DRUID" } },
        { text = "Is a staff any use to someone who can't cast?", next = "plain" },
        { text = "Not today, Muragus.", next = "END" },
      },
    },
    locks = {
      big = true,
      lines = { { id = "lo_default", text = "Something that holds a spell without splitting, and something that looks frightening, which matters to them more than it should. I sell to them because their coin is good and the Warchief allows them, but I don't ask what they do with my wood." } },
      choices = {
        { text = "Has one of your staves ever come back wrong?", next = "locks2" },
        { text = "A trader shouldn't ask. Coin is coin.", next = "BACK", reply = "That's how I've kept this shop open. What happens after the staff leaves my hand is the Warchief's business, not mine.", fx = { align = { order = -1 } } },
        { text = "Maybe you should ask. The Horde remembers fel magic.", next = "BACK", reply = "Maybe, and I do watch who comes back for a second one. Grunts from the Hold walk this Cleft too, you know.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "wo_default", text = "Not from Durotar, that's sure, since there's hardly a tree here worth cutting. Most comes up from the Barrens and Ashenvale, where the Warsong cut timber and the night elves try to kill them for it." } },
      choices = {
        { text = "Ashenvale wood is worth that much?", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      lines = { { id = "wo2_default", text = "Every staff from it carries a little of that forest, the mages tell me, and they pay double for it. I only know it bends without breaking, which is all I ask of wood." } },
      choices = { { text = "Something else, Muragus.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    locks2 = {
      lines = { { id = "lo2_default", text = "Once. A young one came back with a staff I'd sold him, charred black from the grip up, and wanted his coin returned because it had cracked. I asked what he had put through it, and he wouldn't say, and I've thought about that crack more than I'd like." } },
      choices = {
        { text = "Did you tell anyone?", next = "locks3" },
        { text = "Something else, Muragus.", next = "BACK" },
      },
    },
    locks3 = {
      big = true,
      lines = { { id = "lo3_default", text = "I told Zevrost, who teaches them, since it seemed his affair. He looked at the staff for a long time and then asked for the student's name, very quietly. I've not seen that student in the Cleft since, and I've not asked." } },
      choices = {
        { text = "The warlocks police their own. That's as it should be.", next = "BACK", reply = "So the Warchief requires, and so far they have. I sleep a little easier next door to them for it.", fx = { align = { order = 1 } } },
        { text = "You should have kept quiet. It wasn't your business.", next = "BACK", reply = "Perhaps. But my name was burned into that staff under the grip, and I'd not have it found somewhere worse.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weigh = {
      lines = { { id = "we_default", text = "Balance. A staff that's heavy at the head tires the wrist in an hour, and a tired caster drops a word. I weigh it, I look at who's buying, and if the two don't suit, I take down another one whether they asked or not." } },
      choices = {
        { text = "Do customers mind being overruled?", next = "weigh2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weigh2 = {
      lines = { { id = "we2_default", text = "The young ones do. They want the tallest staff with the most carving, and I hand them something plain that fits. The ones who come back a year later are the ones who took the plain staff, and I've stopped arguing with the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cleft = {
      lines = { { id = "cf_default", text = "The rent's low and the customers come to me. Kor'jus grows his mushrooms across the way, Rekkul has his poisons, and none of us are troubled by sightseers. I'd make twice the coin in the Drag and spend it all on shouting to be heard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "ma_default", text = "No. For you I keep the pale ash on the left wall, straight-grained, nothing bound into it that you didn't put there yourself. The mages in the Valley of Spirits send their students to me for exactly those, and I keep them well away from the dark stock." } },
      choices = { { text = "Pale ash it is. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "So the tauren tell me, and I've nothing living to sell you. What I can do is tell you which of these was cut from deadfall and which from a standing tree, because I ask, and I'll understand if that decides it for you." } },
      choices = {
        { text = "Deadfall only. Thank you for asking it.", next = "BACK", reply = "Three on the end rack, then. I'd keep more if the suppliers were more careful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wood is wood. Show me the strongest.", next = "BACK", reply = "As you like. The ironwood, then, and I'll not tell you where it stood.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      lines = { { id = "pl_default", text = "More than you'd think. It's reach, it's a third leg on a bad road, and it breaks a wrist as well as any mace if you know where to put it. Half the caravan drivers out of the Barrens carry one of mine and have never cast a spell in their lives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    warsong = { { id = "tp_warsong", text = "They cut the wood and I shape it. I'm told the forest objects, and I believe it; some of those logs arrive with arrows in them." } },
    thrall = { { id = "tp_thrall", text = "The Warchief fights with a hammer and speaks with the elements. He's never needed a staff, and I don't hold it against him." } },
    burning_blade = { { id = "tp_blade", text = "Bad customers. They want things bound into the wood that I won't bind, and they don't ask twice." } },
    advice = { { id = "tp_ad", text = "Buy the staff that fits your hand and not your pride. I say it daily, to no one who listens." } },
    _none = { { id = "tp_none", text = "I sell staves. Ask someone who sells answers." } },
  },
}

---------------------------------------------------------------------------
-- Shan'ti: fruit vendor between the Valley of Strength and the Valley of Wisdom.
---------------------------------------------------------------------------
P:NPC {
  key = "shanti", id = TODO_NPC("Shan'ti"), name = "Shan'ti", title = "Fruit Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "warm" }, values = { "practical", "kind" },
  notices = { "hunger", "race" },
  impression = {
    first = "In a city of meat-eaters, she means to feed them fruit.",
    third = "{name} met Shan'ti, the orc fruit seller on the way to the Valley of Wisdom.",
  },
  greetings = {
    { id = "g_default", text = "Fruit, fresh from the coast and the Barrens! Something sweet before you go back to all that meat." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, good. I kept the best apples aside, or I meant to." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! You're my best customers, all of you, because you never ask me if I've got any meat instead." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! You'll want the mangoes, and I've none, because the goblins say the boat sank. They say that every time the price is about to go up." },
    { id = "n_child", cat = "greenness", when = { maxLevel = 10 },
      text = "You're new to the city, I can tell by the way you look up at everything. Here, take your bearings: the Valley of Strength is behind you, and Wisdom's ahead." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Shan'ti, and I sell fruit to anyone in Orgrimmar who'll eat it. That's fewer orcs than I'd like, but the tauren and the trolls keep me in business." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Go on, I've a moment between grunts." },
        { id = "h_again3", text = "Ask away, and have a slice while you do. It's bruised, I can't sell it anyway." },
      },
      choices = {
        { text = "Let me see the fruit.", next = "BUSINESS" },
        { text = "Where does fruit come from, in Durotar?", next = "where" },
        { text = "Orcs don't eat fruit?", next = "orcs" },
        { text = "You know every grunt who passes by what they buy.", next = "grunts" },
        { text = "This road sees half the city go by.", next = "road" },
        { text = "A troll will always take fruit over dried meat.", next = "troll", when = { race = "Troll" } },
        { text = "The dead don't trouble your stall much, I imagine.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I cook. What keeps well on a long march?", next = "cook", when = { profession = "Cooking" } },
        { text = "Farewell, Shan'ti.", next = "END" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "Not from Durotar, I'll tell you that, unless you count the prickly pears, and they fight back. Most comes up from Ratchet on the goblin boats, and some from the oases in the Barrens, if the caravans make it." } },
      choices = {
        { text = "The goblins charge a lot, I'd guess.", next = "where2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where2 = {
      lines = { { id = "wh2_default", text = "They charge for everything, including the bruises. I complain, and they laugh, and then I pay, because nobody else is bringing apples to Orgrimmar." } },
      choices = { { text = "Something else, Shan'ti.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    orcs = {
      big = true,
      lines = { { id = "or_default", text = "Some do, and the ones who do live longer, if you ask me. In the camps we ate what the humans threw us, and some of us swore we'd only ever eat meat again, but a warrior who never eats a green thing gets slow and sour." } },
      choices = {
        { text = "Slow and sour? What happens to them?", next = "orcs2" },
        { text = "You're right. A strong Horde eats well.", next = "BACK", reply = "Tell that to the grunts in the Hold, would you? They might listen to someone with an axe.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them eat what they like. They've earned it.", next = "BACK", reply = "They have, I won't argue that. I'll just keep the fruit out, in case they change their minds.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs2 = {
      lines = { { id = "or2_default", text = "Slow, then tired, then their gums bleed, and then one day an old wound opens that closed years ago. I watched it happen to orcs in the camps who had nothing else wrong with them. The human guards had a name for it, and I never learned the word, but I learned the cure." } },
      choices = {
        { text = "And the cure was fruit.", next = "orcs3" },
        { text = "Something else, Shan'ti.", next = "BACK" },
      },
    },
    orcs3 = {
      big = true,
      lines = { { id = "or3_default", text = "Sour apples, thrown over the fence by a farm child who felt sorry for us. Six of us shared them and six of us got our teeth back, and I've never forgotten it. So when a grunt tells me fruit is for peons, I tell him about his gums until he buys something to make me stop." } },
      choices = {
        { text = "That child's kindness deserves remembering.", next = "BACK", reply = "I remember it every day I set out this stall. Not all of them hated us, and I'll say so even here.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "One apple doesn't pay for the camps.", next = "BACK", reply = "No, it doesn't, and I never said it did. But I'll not pretend it wasn't thrown.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grunts = {
      lines = { { id = "gr_default", text = "I do. The one on the east tower buys a pear every morning and pretends it's for his wolf. The pair by the bank split a melon and argue over the bigger half, and Gamon, poor soul, buys whatever's cheapest and has it knocked out of his hand before he's past the inn." } },
      choices = {
        { text = "Why does everyone pick on Gamon?", next = "grunts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grunts2 = {
      lines = { { id = "gr2_default", text = "I've never found out, and I've asked. It started before I had this stall, and now the young ones do it because the old ones did. I put a bruised apple aside for him most days, and neither of us mentions it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "ro_default", text = "All of it, sooner or later. Shaman going up to the Valley of Wisdom, petitioners for the Warchief, wolf riders coming down, and the children who run between the valleys all day and steal my grapes when they think I'm not looking. I'm always looking; I only pretend I'm not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tl_default", text = "And that's why I like you all. The trolls in the Valley of Spirits send up for a basket every few days, and they send it back empty with a flower in it. I don't know what the flower means, and I've decided it's thanks." } },
      choices = { { text = "It's thanks. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "One of you buys from me, every week, a single red apple. He doesn't eat it. He told me once that he likes to hold it and remember what it was to want one, and I've not charged him since." } },
      choices = { { text = "That was kindly done. Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Dried, all of it. Apples in rings, the Barrens pears sliced thin, and prickly pear boiled down to a paste that'll keep a month in a skin. Zamja in the Drag buys the paste from me and puts pepper in it, which I think is a crime, but the trolls love it." } },
      choices = { { text = "I'll try it without the pepper. Something else.", next = "BACK" } },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "I learned what hunger does to a body in those camps, slowly, on people I knew. It's why I sell what I sell." } },
    thrall = { { id = "tp_thrall", text = "The Warchief stops when he walks this road, if he's no one with him. He takes a pear and pays for it, though I've told him not to." } },
    ratchet = { { id = "tp_ratchet", text = "Everything sweet in this city came through Ratchet first and cost me dearly on the dock. I'd grow my own, if Durotar grew anything." } },
    oases = { { id = "tp_oases", text = "The Barrens oases grow fruit I can't get anywhere else, when the caravans can reach them. Lately the drivers say the centaur are thick around the water." } },
    _none = { { id = "tp_none", text = "I only know fruit and gossip, and that's neither." } },
  },
}

---------------------------------------------------------------------------
-- Stone Guard Zarg: weapons for the Horde's highest ranks, in the Hall of Legends.
---------------------------------------------------------------------------
P:NPC {
  key = "zarg", id = TODO_NPC("Stone Guard Zarg"), name = "Stone Guard Zarg",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "honorable", "loyal" },
  notices = { "class", "soldier" },
  impression = {
    first = "He measures how far everyone who walks in has yet to go.",
    third = "{name} met Stone Guard Zarg, who keeps the champions' weapons in the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "This is the Hall of Legends. Speak quietly, and only if you have earned the right to be here." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you climbed any higher since we last spoke?" },
    { id = "g_away", when = { away = 14 }, text = "You have been absent from the Hall. I trust the time was spent where the tally is kept, and not where it is talked about." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Every axe on these walls was made for one like you, and every one of them must still be earned." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "I know that insignia. You have earned your place in this hall, and I will not ask you to lower your voice." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 20 },
      text = "You are young to be standing here. Look at the walls as long as you like; wanting is where every name up there began." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Zarg, a Stone Guard of the Horde, and I keep the weapons forged for our High Warlords. No coin buys them unless your deeds come first, and the Warchief keeps the tally of those deeds." },
      },
      again = {
        { id = "h_again", text = "What else, soldier?" },
        { id = "h_again2", text = "Ask what you will. The Hall listens." },
        { id = "h_again3", text = "Speak. I have stood this post long enough to have patience for questions." },
      },
      choices = {
        { text = "Let me see the weapons.", next = "BUSINESS" },
        { text = "What makes a High Warlord?", next = "warlord" },
        { text = "Who are the legends honored here?", next = "legends" },
        { text = "You wear a Stone Guard's rank yourself.", next = "rank" },
        { text = "Not every champion fights for the right reasons.", next = "reasons" },
        { text = "I've bled on those fields. I know what they cost.", next = "veteran", when = { pvpRank = 3 } },
        { text = "Does the Hall honor those who fight unseen?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll come back when I've earned it.", next = "END" },
      },
    },
    warlord = {
      lines = { { id = "wa_default", text = "Battle, and more battle, at Warsong Gulch, in Alterac Valley and wherever the Alliance raises its banner. Each week the Horde's champions are weighed against each other, and only the very few at the top ever hold a weapon from this wall." } },
      choices = {
        { text = "That sounds like a lifetime of war.", next = "warlord2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "alterac" } } },
      },
    },
    warlord2 = {
      big = true,
      lines = { { id = "wa2_default", text = "It is, and some who climb that high forget why they began. The Warchief wants peace for his people, but while the Alliance comes at us, he needs warriors who will not stop, and he rewards them here." } },
      choices = {
        { text = "Then I'll fight for the Horde until it's safe.", next = "BACK", reply = "Spoken like a grunt with a future. Keep your purpose, and the honor will follow.", fx = { align = { honor = 1 } } },
        { text = "I fight for glory, and these weapons.", next = "BACK", reply = "At least you are honest about it. The wall does not care why you climb, only that you do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legends = {
      lines = { { id = "le_default", text = "Those who fought for the Horde when it had nothing, and those who still fight for it now. Brave Stonehide keeps the trinkets and accessories by the other wall, so ask her if you wish to know what the officers wear." } },
      choices = {
        { text = "Is there one weapon here you'd point to?", next = "legends2" },
        { text = "Something else, Zarg.", next = "BACK" },
      },
    },
    legends2 = {
      lines = { { id = "le2_default", text = "There is a blade on the north wall with a notch a hand's width from the hilt. It was carried at Hyjal by a grunt whose name I was never told, and it stopped something that should have killed the orc behind him. The smiths wanted to grind the notch out, and I refused." } },
      choices = {
        { text = "Why keep a flawed blade on the wall?", next = "legends3" },
        { text = "Something else, Zarg.", next = "BACK" },
      },
    },
    legends3 = {
      big = true,
      lines = { { id = "le3_default", text = "Because the weapons I guard are perfect, and they are given for a tally of kills. That one is ruined, and it was given for a single moment when one orc stood where he was. The young ones should see both, and decide which they came here for." } },
      choices = {
        { text = "One moment of standing firm outweighs any tally.", next = "BACK", reply = "I think so. I am not permitted to say it to those who come to buy, so I let the notch say it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The tally is what wins wars. Sentiment doesn't.", next = "BACK", reply = "That is what the tally-keepers say, and they are not wrong about wars. I only wonder what it is we win them for.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rank = {
      lines = { { id = "ra_default", text = "I do, and I earned it before there was a hall to hang it in. A Stone Guard is no great rank beside the warlords whose weapons I keep, and I am content with that. Someone must stand still in this place while the others climb." } },
      choices = {
        { text = "Where did you earn it?", next = "rank2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rank2 = {
      lines = { { id = "ra2_default", text = "In Ashenvale, with the Warsong, in the first year after the founding. We held a lumber camp for nine days against the night elves, and at the end of it there were enough of us left to be given ranks. I do not tell it as a boast." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    reasons = {
      lines = { { id = "re_default", text = "No, and the Hall cannot see into them. Some come for the Horde, some for the weapon, and some because they have found they like the killing and this gives it a name. The tally counts them all the same, and I hand over the blade to whichever stands before me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran = {
      lines = { { id = "ve_default", text = "Then you need no lecture from a quartermaster. I will say only this, as one soldier to another: write down the names of the ones who fell beside you while you still remember them. The Hall keeps weapons, and nobody keeps those." } },
      choices = { { text = "I'll write them down. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "rg_default", text = "It honors those whose deeds are counted, and yours seldom are. But the daggers on the lower rack were not forged for grunts, and someone has earned every one of them, so the Hall remembers more than it admits." } },
      choices = { { text = "That's enough for me. Something else.", next = "BACK" } },
    },
  },
  topics = {
    warsong = { { id = "tp_warsong", text = "Grom's clan, still in Ashenvale, still cutting. They fight in the gulch for every tree, and many of the names in this hall were made there." } },
    alterac = { { id = "tp_alterac", text = "The Frostwolves hold their valley against the dwarves of Stormpike. It is the Warchief's own clan, and the champions who return from there are quieter than the rest." } },
    thrall = { { id = "tp_thrall", text = "The Warchief would have peace if the Alliance allowed it. Until it does, he honors those who fight, and I keep what he honors them with." } },
    second_war = { { id = "tp_second_war", text = "There were no halls for heroes in the old Horde, only the next battle. I think this is better, though I am not always sure." } },
    _none = { { id = "tp_none", text = "That is not a matter for the Hall of Legends." } },
  },
}

---------------------------------------------------------------------------
-- Brave Stonehide: tauren officers' accessories quartermaster, Hall of Legends.
---------------------------------------------------------------------------
P:NPC {
  key = "stonehide", id = TODO_NPC("Brave Stonehide"), name = "Brave Stonehide", title = "Officer Accessories Quartermaster",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "honorable", "patient" },
  notices = { "race", "soldier" },
  impression = {
    first = "She cares more about the people wearing her goods than the goods.",
    third = "{name} met Brave Stonehide, the tauren quartermaster in the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "Peace, traveler. Even in the Hall of Legends, a little quiet is welcome." },
    { id = "g_back", when = { metBefore = true }, text = "You return. May the Earth Mother have kept you safe on the field." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A brave of the herd. It does my heart good to see another tauren among these orcs." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You carry an officer's bearing, and an officer's weariness with it. Sit, if you wish; the Hall can spare you a moment's rest." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, far from the green places. I hope the stone of this city does not weigh on you as it sometimes does on me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Stonehide, and I keep the accessories earned by the Horde's officers: tabards, cloaks and the marks of rank. They are only cloth and metal, but on the field they tell everyone who you are." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, if the Hall's quiet doesn't trouble you." },
        { id = "h_again3", text = "I am listening. There is no hurry in me, whatever the Hall may think." },
        { id = "h_again4", text = "Speak as you would by a fire. The banners will not mind." },
      },
      choices = {
        { text = "Let me see what you keep.", next = "BUSINESS" },
        { text = "Why does a tauren serve here?", next = "why" },
        { text = "Do ranks matter on a battlefield?", next = "ranks" },
        { text = "This hall is a loud place for a quiet voice.", next = "quiet" },
        { text = "Stone Guard Zarg seems a hard one to share a hall with.", next = "zarg" },
        { text = "I've earned a mark or two on those fields.", next = "veteran", when = { pvpRank = 3 } },
        { text = "It's good to hear the Earth Mother named in Orgrimmar.", next = "tauren", when = { race = "Tauren" } },
        { text = "Do the Darkspear send their own to these battles?", next = "troll", when = { race = "Troll" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the Horde is my tribe now as much as Thunder Bluff is, and Cairne sent braves to fight beside the orcs in Warsong Gulch and Alterac. Someone must keep the honors of those braves, and I asked to be that one." } },
      choices = {
        { text = "Did you know the braves who went?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ranks = {
      big = true,
      lines = { { id = "ra_default", text = "They matter when the arrows fly and someone must give the order. But I have seen officers wear their tabards like a crown, and forget that every rank was paid for by the braves who followed them." } },
      choices = {
        { text = "An officer serves those beneath them.", next = "BACK", reply = "So the elders teach in Thunder Bluff, and so it should be here. You would make a fine officer, I think.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rank is earned. Wear it proudly.", next = "BACK", reply = "Proudly, yes, but never forget whose blood bought it. The cloak remembers, even when the officer does not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wh2_default", text = "I knew many of them. My own brother went to the gulch with the first braves Cairne sent, to stand with the Warsong, and he came home with an officer's cloak and a silence I had not seen in him before. He hung the cloak on the lodge wall and has not worn it since." } },
      choices = {
        { text = "What did he see there?", next = "why3" },
        { text = "Something else, Stonehide.", next = "BACK" },
      },
    },
    why3 = {
      big = true,
      lines = { { id = "wh3_default", text = "He has not said, and I do not press him. I think it was only war, which our people have known since the centaur, but war for a forest that the elves have tended ten thousand years. He told me once that he was proud to stand with the orcs and was not sure the Earth Mother was proud of him." } },
      choices = {
        { text = "Loyalty to allies is its own kind of balance.", next = "BACK", reply = "That is what I told him, and I believe it on most days. Thank you for saying it to me in turn.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "He was right to doubt. That fight isn't the tauren's.", next = "BACK", reply = "Perhaps it is not. But the orcs bled for us against the centaur when no one else would, and a herd does not count such debts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "qu_default", text = "It is, and so I have made a quiet corner in it. The warlords come to Zarg for their blades with their blood still up, and afterward some of them drift to this wall and stand a while, and say nothing. I think they come for the cloth less than for the stillness." } },
      choices = {
        { text = "What do you say to them?", next = "quiet2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet2 = {
      lines = { { id = "qu2_default", text = "Very little. I ask where they are from, and whether anyone waits for them there. It is surprising how many have not been asked in a year, and how long they will talk once they begin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zarg = {
      lines = { { id = "za_default", text = "He is stone on the outside, as his rank says, and he would be displeased to hear me tell you otherwise. But there is a notched blade on his wall that he will not let the smiths mend, and when you have a moment, you might ask him why." } },
      choices = { { text = "I'll ask him. Something else.", next = "BACK" } },
    },
    veteran = {
      lines = { { id = "ve_default", text = "Then wear them without shame and without too much pride, if I may say so. I have fitted cloaks to champions who could no longer sleep, and to champions who slept too easily, and I was more afraid for the second kind." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "I say her name aloud here every morning, so that the walls grow used to it. The orcs do not mind. One of the grunts at the door has begun to say it with me, badly, and I have not the heart to correct him." } },
      choices = { { text = "May she hear you both. Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tl_default", text = "They do, and they fight with a laughter that unsettles the orcs. The Darkspear who come to me for their insignia always ask if it can be worn on a tusk, and I have learned to say yes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "Our High Chieftain gave his word to the Warchief, and so his braves go where the Horde fights. He grieves each one, and I am told he knows their names." } },
    earth_mother = { { id = "tp_em", text = "She is under this stone as she is under the grass of Mulgore. I remind myself of it when the Hall is loud." } },
    warsong = { { id = "tp_warsong", text = "The Warsong fight for timber the Horde truly needs. I only wish the need and the forest did not stand in the same place." } },
    thrall = { { id = "tp_thrall", text = "The Warchief honors those who fight and mourns that they must. I have seen both on his face in this very hall." } },
    alterac = { { id = "tp_alterac", text = "A cold valley, far to the east, where the Frostwolves stand against the dwarves. The braves who return from it bring frostbite and few words." } },
    _none = { { id = "tp_none", text = "That is beyond my knowing, traveler. Perhaps the elders could help you." } },
  },
}

---------------------------------------------------------------------------
-- Nazgrel: Frostwolf warrior, advisor to Thrall and captain of his guard, Grommash Hold.
---------------------------------------------------------------------------
P:NPC {
  key = "nazgrel", id = TODO_NPC("Nazgrel"), name = "Nazgrel", title = "Advisor to Thrall",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "orgrimmar" }, temper = { "stern", "watchful" }, values = { "loyal", "honorable" },
  notices = { "class", "race" },
  impression = {
    first = "Nazgrel stands near the Warchief's throne and watches the door more than the throne. He is a Frostwolf of the old kind, plain in speech and slow to trust, and he measures everyone who enters by what they might do with a blade.",
    third = "{name} met Nazgrel, the Frostwolf warrior who advises Thrall and commands the Warchief's guard in Grommash Hold.",
  },
  greetings = {
    { id = "g_default", text = "State your business in the Warchief's hall, and keep your hands where I can see them while you state it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I remember your face, and I remember that you gave me no cause to." },
    { id = "g_orc", when = { race = "Orc" }, text = "Throm-ka. Stand straight, you are in Grommash Hold, and the name over the door was paid for in blood." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone some weeks. The reports that crossed my table with your name in them were mostly to your credit." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I saw you count the guards as you came in. So did they. Shenthul trains his people well, but not well enough for this room." },
    { id = "n_dead", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's. The Warchief has given your people his word, and I keep his word for him, but do not ask me to like the smell of the bargain." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "You carry your axe like one who has used it. Good. The Warchief has enough who carry it like a banner." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nazgrel of the Frostwolves. I rode at the Warchief's side when this land was won, and now I stand at it, and I will tell you plainly that I liked the riding better." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Nazgrel of the Frostwolves. Your people stood with us at Stonetalon and at Hyjal, and I do not forget who was beside me when the sky burned." },
        { id = "h_troll", when = { race = "Troll" }, text = "I am Nazgrel of the Frostwolves. Vol'jin sits at the Warchief's right hand and has earned the seat, and I extend to his tribe the trust I give to him." },
      },
      again = {
        { id = "h_again", text = "Speak, but briefly. I am listening to you with one ear and to the hall with the other." },
        { id = "h_again2", text = "You have another question. Ask it." },
        { id = "h_again3", text = "Go on. The Warchief likes his people to be heard, and so I hear them." },
      },
      choices = {
        { text = "What does the Warchief's advisor advise?", next = "advise" },
        { text = "You speak of the Frostwolves as if they stood apart.", next = "frostwolf" },
        { text = "You don't seem to trust anyone who walks in here.", next = "trust" },
        { text = "Gar'Thok at Razor Hill speaks of you often.", next = "garthok" },
        { text = "I'm a Frostwolf's kin in spirit. I hear the wind.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What would you have a young orc learn first?", next = "young", when = { race = "Orc", maxLevel = 30 } },
        { text = "Strength and honor, Nazgrel.", next = "END" },
      },
    },
    advise = {
      lines = { { id = "ad_default", text = "Caution, for the most part, and he does not always thank me for it. The Warchief sees what the Horde could become, and I see what is standing outside the gate tonight. He needs both, and so he keeps me where I can be heard." } },
      choices = {
        { text = "Where do the two of you disagree?", next = "advise2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advise2 = {
      lines = { { id = "ad2_default", text = "On the humans. He was raised among them and knows there is good in some, and he keeps faith with the sorceress across the water in Theramore. I was not raised among them. I knew them as the ones who built the camps, and I counsel him to keep the peace and sharpen the axes both." } },
      choices = {
        { text = "And when he overrules you?", next = "advise3" },
        { text = "Something else, Nazgrel.", next = "BACK" },
      },
    },
    advise3 = {
      big = true,
      lines = { { id = "ad3_default", text = "Then I obey, wholly, and I see his order done better than he asked. I gave my oath to Thrall before he was Warchief, when he was a young shaman with no army, and I did not give it on condition that he agree with me." } },
      choices = {
        { text = "An oath that bends to disagreement is no oath.", next = "BACK", reply = "So the Frostwolves have always held. You would have been welcome at our fires.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If he's wrong about the humans, obedience won't save us.", next = "BACK", reply = "If he is wrong, I will be standing between him and the proof of it. That is what the axes are sharpened for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "theramore" } } },
      },
    },
    frostwolf = {
      lines = { { id = "fw_default", text = "We did stand apart. When Gul'dan offered the clans the demon's cup, Durotan refused it, and for that the Frostwolves were cast out to the mountains of Alterac. We kept the old ways in the snow while the rest of the Horde burned a world and then rotted in cages." } },
      choices = {
        { text = "That exile spared you the blood-curse.", next = "frostwolf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frostwolf2 = {
      lines = { { id = "fw2_default", text = "It did, and it cost Durotan his life, for he was murdered bringing word of Gul'dan's treachery to Doomhammer. His son was found by humans and raised a slave. That son is the Warchief, and when he came to us in the mountains, Drek'Thar knew whose blood he carried before he had spoken a word." } },
      choices = {
        { text = "The Frostwolves kept the honor the Horde lost.", next = "BACK", reply = "We kept a little of it, in a cold place, until someone came who could carry it back. I will take no more credit than that.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's easy to stay clean when you sit out the war.", next = "BACK", reply = "Say that in Alterac Valley, where my clan holds the line today against the Stormpike. Say it to their faces.", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "alterac" } } },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "It is not my task to trust. The Burning Blade has agents inside these walls, the Alliance has sent spies before, and a Warchief who walks among his people as freely as ours does needs someone beside him who assumes the worst of every stranger." } },
      choices = {
        { text = "The Burning Blade is inside Orgrimmar?", next = "trust2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust2 = {
      lines = { { id = "tr2_default", text = "In the caves beneath it, certainly, and I believe nearer than that. The Warchief has his own means of looking into the matter and does not share all of them with me. If he asks something of you concerning it, do it quickly and speak of it to no one." } },
      choices = { { text = "Understood. Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    garthok = {
      lines = { { id = "ga_default", text = "He should. I took him from the camps with nothing in him but anger and taught him to write a report, hold a wall and send the right grunt to the right place. Razor Hill stands at the crossing of every road in Durotar, and I would trust it to no one else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Then you have something my clan values above any axe. Drek'Thar is blind and has seen more than all of us, and he taught the Warchief in a cave in the snow. Go to Kardris here in the hold if you would learn, and learn humbly." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
    young = {
      lines = { { id = "yo_default", text = "To obey before you lead, and to know why you fight before you learn how. The old Horde had strength enough to break a world and no reason worth the name. Find your reason first, young one, and the axe will follow it." } },
      choices = { { text = "I'll find it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Frostwolf, a wolf rider, and the Warchief's sworn blade. There is nothing else about me that need concern you." } },
    advice = { { id = "tp_ad", text = "Watch the door, wherever you are. Most who died surprised were looking at something more interesting." } },
    thrall = { { id = "tp_thrall", text = "He is Durotan's son and Doomhammer's heir, and he freed our people when they had forgotten they were one. I would die for him, and I intend that it should not come to that." } },
    theramore = { { id = "tp_theramore", text = "The humans' city in the marsh. Their lady fought beside us at Hyjal, and the Warchief calls her friend. I call her a human with an army a week's march from our walls." } },
    alterac = { { id = "tp_alterac", text = "My clan's home, and they hold it still under Drek'Thar. The dwarves of Stormpike would dig it out from under us. They will find the Frostwolves harder than the rock." } },
    internment = { { id = "tp_internment", text = "The Frostwolves were never caged. I saw the camps when we broke them open, and I have never forgotten the look of orcs who would not lift their heads." } },
    burning_legion = { { id = "tp_legion", text = "They were thrown back at Hyjal, at a price. Anyone who serves them in this city will answer to me before he answers to the Warchief, and I am the less patient." } },
    _none = { { id = "tp_none", text = "That is not a matter for this hall, and so it is not a matter for me." } },
    _gated = { { id = "tp_gated", text = "I do not discuss that with those I have not yet measured. Serve the Horde a while longer, and ask again." } },
  },
}

---------------------------------------------------------------------------
-- Kor'ghan: Darkspear poison-master outside Rekkul's Poisons, the Cleft of Shadow (Finding the Antidote).
---------------------------------------------------------------------------
P:NPC {
  key = "korghan", id = TODO_NPC("Kor'ghan"), name = "Kor'ghan",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "severe", "exacting" }, values = { "craft", "cunning" },
  notices = { "class", "craft" },
  impression = {
    first = "Kor'ghan stands outside the poison shop in the Cleft of Shadow and teaches venoms the hard way. He speaks of his apprentice Rhinag with nothing but scorn, and went to work on the antidote the moment he heard the boy was stung.",
    third = "{name} met Kor'ghan, a Darkspear master of venoms in the Cleft of Shadow whose apprentice Rhinag lay poisoned outside the city.",
  },
  greetings = {
    { id = "g_default", text = "Don't touch de jars, mon. Dere be three kinds of people who touch my jars, and two of dem be dead." },
    { id = "g_active", when = { questActive = TODO_QUEST("Finding the Antidote") }, text = "You got de venom sacs yet? Four, mon, from de venomtails, and fresh, because Rhinag don't have till tomorrow." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, and you be breathin'. So you listened about de jars." },
    { id = "g_done", when = { questDone = TODO_QUEST("Need for a Cure") }, text = "Ah, de one who ran my antidote out to dat fool boy. He lives, mon, and he be sorry he does, I make sure of it every mornin'." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A knife-hand. You buy your poisons from Rekkul already mixed, I know, and you never once asked what be in dem. Dat be how a rogue dies with his own blade in his thumb." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You brew, mon, I see de stains. Den you know de dose makes de poison, and maybe you and I can talk like grown people." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Kor'ghan. I know every venom between de Echo Isles and de Stonetalon peaks, mon, what it does, how fast, and what stops it, and I teach dat to de few with de patience not to die learnin'." },
        { id = "h_need", tags = { "news" }, when = { questActive = TODO_QUEST("Need for a Cure") },
          text = "Rhinag sent you? Stung by a venomtail, de careless whelp, after everything I taught him! I can make de antidote, mon, but I got no venom to make it from, and he got an hour at most." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Finding the Antidote") },
          text = "Four venomtail poison sacs, mon, from de scorpids on de dry flats outside de city. De cure for a venom be always made from de venom, so go and cut dem out quick and bring dem whole." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Finding the Antidote"), days = 3 } },
          text = "Dose sacs were cut clean, mon, better dan Rhinag ever managed. De antidote took, and now de boy owes me forty boars and you owe me nothin', which be rare in dis Cleft." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Finding the Antidote"), days = 7 } },
          text = "Rhinag be back at his hut and back at his lessons, and I made de first one milkin' a venomtail by hand. He did not get stung, mon, so maybe near dyin' taught him what I couldn't." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Ask, but keep your elbows in." },
        { id = "h_again2", text = "Another question. Good, de ones who ask be de ones who live." },
        { id = "h_again3", text = "Go on. De brew needs to sit anyway." },
      },
      choices = {
        { text = "How does venom become its own cure?", next = "cure" },
        { text = "You're hard on Rhinag for a boy who nearly died.", next = "rhinag" },
        { text = "Why does a venom-master keep shop in the Cleft?", next = "cleft" },
        { text = "What in Durotar should I fear being stung by?", next = "stings" },
        { text = "Teach me which venom goes on a blade.", next = "blade", when = { class = "ROGUE" } },
        { text = "The Darkspear knew poisons long before the Horde.", next = "troll", when = { race = "Troll" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "I'll mind the jars, Kor'ghan.", next = "END" },
      },
    },
    cure = {
      lines = { { id = "cu_default", text = "Slow, mon, and in small steps. You take de venom, you thin it till it would not kill a mouse, and you teach de blood to know it. A body dat has met a little of de poison fights de rest of it, and my antidote be only a way to make dat meetin' happen fast." } },
      choices = {
        { text = "You've taught your own blood this way.", next = "cure2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure2 = {
      lines = { { id = "cu2_default", text = "Every week for thirty years, mon. Scorpid, spider, snake, de little blue frog from de islands. I been sick more days dan I been well, and dere be not a thing crawlin' in Kalimdor dat could put me down now. Rhinag was meant to start de same road dis season." } },
      choices = {
        { text = "Is that road worth what it costs?", next = "cure3" },
        { text = "Something else, Kor'ghan.", next = "BACK" },
      },
    },
    cure3 = {
      big = true,
      lines = { { id = "cu3_default", text = "It cost me my stomach, most of my sleep and de feelin' in two fingers. And because I paid it, mon, dere be an antidote in dis city tonight for a boy who would be dead by mornin' without one. You tell me if dat be worth it." } },
      choices = {
        { text = "A craft that saves lives is worth the suffering.", next = "BACK", reply = "Hm. Don't go soft on me, mon. But yes, dat be why I never stopped.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It was worth it for the power. Nothing can touch you.", next = "BACK", reply = "Dat be what I told myself at twenty. Now I be old and I just be glad de boy lives. You will see.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rhinag = {
      lines = {
        { id = "rh_default", text = "Hard? I told him a hundred times, mon, you come at a venomtail from de front where it can see you, never from de side. He reached past de tail for de sac like he was pickin' fruit. If I be soft on him now, de next one kills him." },
        { id = "rh_done", when = { questDone = TODO_QUEST("Need for a Cure") }, text = "I be hard on him because I sat by his mat dat whole night and counted his breaths, mon, and I never want to do it again. Don't you tell him dat. Forty boars, I told him, and forty it be." },
      },
      choices = {
        { text = "Fear for him is why you shout. Let him see it once.", next = "BACK", reply = "Bah. Maybe when he be a master himself. Till den he gets de shoutin', and he be alive to hear it.", fx = { align = { light = 1 } } },
        { text = "Good. A soft teacher buries his students.", next = "BACK", reply = "Dat be de truth of dis trade, and of most trades. You understand more dan you look like you do.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "Because Rekkul buys what I brew and de Shattered Hand buys what Rekkul sells, and nobody down here asks what it be for. Up in de Drag de grunts get nervous when dey see a troll with a jar. Down here I be just another neighbour dat Kor'jus sells mushrooms to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stings = {
      lines = {
        { id = "st_default", text = "De venomtails on de flats, first, dey be de ones dat got Rhinag. De clatterin' scorpids in de north be slower and weaker, and de armored ones by de river be all shell and little sting. Past de river, in de Barrens, it be a different lesson, and I charge for dat one." },
        { id = "st_high", when = { minLevel = 30 }, text = "In Durotar? Nothin', for one who has walked as far as you. But you been to de deserts, I think, and to de jungle, and if you ever find a venom dere you don't know, bring me a little in a jar. I pay well for a new sickness." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blade = {
      lines = { { id = "bl_default", text = "De one dat matches de work, mon. A cripplin' venom for de one who must not run, a slow one for de one who must not know, and a quick one only when you got no other choice, because quick venom be loud. Rekkul sells all three, and now at least you know to ask which." } },
      choices = { { text = "I'll ask from now on. Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tl_default", text = "Long before, cousin. My grandmother tipped her darts with frog-skin on de islands when de orcs were still on another world. De Horde calls it a rogue's trick, but for de Darkspear it be how a small tribe hunted big things, and I don't let de young ones forget it." } },
      choices = { { text = "Nor should they. Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I be a Darkspear who knows poisons, mon, and dat be de whole of it. De rest be thirty years of bein' sick on purpose." } },
    advice = { { id = "tp_ad", text = "Come at de scorpid from de front. Dat be good for scorpids and good for most trouble." } },
    echo_isles = { { id = "tp_isles", text = "De best frogs and de worst spiders I ever met be on dose isles. Zalazane got dem now, and I hope one bites him." } },
    burning_blade = { { id = "tp_blade", text = "Dey come to de Cleft wantin' things brewed dat I don't brew. I tell dem to ask a warlock, and I remember deir faces." } },
    thrall = { { id = "tp_thrall", text = "De Warchief lets de Cleft be what it is, so long as it serves de Horde. Dat be wiser dan pretendin' a city don't need a shadow." } },
    _none = { { id = "tp_none", text = "If it don't sting or bite, mon, I got nothin' to tell you." } },
  },
}

---------------------------------------------------------------------------
-- Krathok Moltenfist: master of the Burning Anvil; sends smiths to the armorsmith or weaponsmith.
---------------------------------------------------------------------------
P:NPC {
  key = "krathok", id = TODO_NPC("Krathok Moltenfist"), name = "Krathok Moltenfist",
  bible = "bibles/more_folk.md", role = "blacksmith", tier = "quest",
  communities = { "orgrimmar" }, temper = { "gruff", "exacting" }, values = { "craft", "honorable" },
  notices = { "craft", "kit" },
  impression = {
    first = "Krathok Moltenfist decides which of Orgrimmar's smiths are ready to choose between armor and arms, and he does not decide quickly. He looks at a smith's hands before the work, and at the work for a long time after.",
    third = "{name} met Krathok Moltenfist, the master smith at the Burning Anvil who sets Orgrimmar's blacksmiths on the path of armor or of weapons.",
  },
  greetings = {
    { id = "g_default", text = "The Burning Anvil. If you've come to buy, speak to the others, and if you've come to learn, show me your hands." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith. There's scale on your forearms and a burn on your thumb, so you've at least stood near a fire. We'll see about the rest." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my anvil. Have you made anything since that's worth my looking at?" },
    { id = "g_away", when = { away = 14 }, text = "It's been some weeks. A smith who stays away that long has either been working hard or not at all, and I can tell which from the hands." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Whoever made that armor did sound work, and you've beaten it half to scrap. Get it to an anvil before it shames the both of you." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You dig your own ore. Good. A smith who has never swung a pick doesn't know what his metal cost." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Krathok Moltenfist. Every smith in this valley who wants to be more than a mender of dents comes to me in the end, and I tell them whether they're ready to choose a path." },
        { id = "h_ready", when = { profession = { name = "Blacksmithing", min = 200 } },
          text = "I am Krathok Moltenfist, and your hands tell me you've come to the fork in the road. Armor or arms, smith. You'll master one, and I'll hear which before I send you to the one who'll test you." },
        { id = "h_armor", tags = { "news" }, when = { questActive = TODO_QUEST("The Art of the Armorsmith") },
          text = "Okothos Ironrager has your trial, and he'll not pass a single loose rivet. Make what he asked for as if your own kin would wear it into Blackrock, and bring it to him, not to me." },
        { id = "h_weapon", tags = { "news" }, when = { questActive = TODO_QUEST("The Way of the Weaponsmith") },
          text = "Borgosh Corebender has your trial. He'll swing everything you bring him before he says a word, so see that the balance is true, because he forgives a plain blade and never a clumsy one." },
      },
      again = {
        { id = "h_again", text = "What else? Talk over the hammer, I'll hear you." },
        { id = "h_again2", text = "Ask it. The iron's got a while before it's ready to move." },
        { id = "h_again3", text = "Another question. Fine, but mind the sparks." },
      },
      choices = {
        { text = "Why must a smith choose at all?", next = "choose" },
        { text = "This valley rings like a battle from dawn to dark.", next = "valley" },
        { text = "What separates a master from a mender?", next = "master" },
        { text = "Who tests the ones you send on?", next = "testers" },
        { text = "I'm near the fork. Which path would you counsel?", next = "counsel", when = { profession = { name = "Blacksmithing", min = 150 } } },
        { text = "I carry what your kind makes. Does that count for anything?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "I'll leave you to the anvil.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "ch_default", text = "Because a life is short and steel is deep. An armorsmith thinks about where a blow will land and how to send it elsewhere, and a weaponsmith thinks about where it should land and how to get it there. I've met smiths who tried to think both ways, and their work was neither." } },
      choices = {
        { text = "Which did you choose?", next = "choose2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose2 = {
      lines = { { id = "ch2_default", text = "Armor. I was a young smith in the old Horde, turning out axes by the hundred for a war I'd no say in, and every one of them went out to kill. When I was free to choose, I chose to make the thing that brings a warrior home." } },
      choices = {
        { text = "Do you regret the axes?", next = "choose3" },
        { text = "Something else, Krathok.", next = "BACK" },
      },
    },
    choose3 = {
      big = true,
      lines = { { id = "ch3_default", text = "I regret what they were used for, and I can't unmake that. But I'll not teach a young smith that a weapon is a shameful thing. The Horde has enemies who would put us back in cages, and Borgosh's blades are the reason they haven't." } },
      choices = {
        { text = "Steel has no shame. Only the hand that swings it.", next = "BACK", reply = "That's what I tell them, near enough word for word. Mind your own hand, then, and I'll mind the steel.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The maker shares the guilt for what's done with it.", next = "BACK", reply = "Then I've a great deal to answer for, and maybe I have. I'll keep making breastplates until the ledger's nearer even.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = { { id = "va_default", text = "It should. Saru Steelfury teaches the trade from first hammer to last, Snarl and Ug'thok take the beginners off her hands, and Orokk Omosh keeps the oldest patterns alive. Between us we arm the wall, the wolf riders and half the Barrens garrisons, and the fires have not gone out since the founding." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = { { id = "ma_default", text = "A mender asks what's broken. A master asks what broke it, and makes the next one so that it won't. I can teach anyone to hit hot iron; what I look for is the one who stops, turns the piece over and frowns." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    testers = {
      lines = { { id = "te_default", text = "Okothos Ironrager for armor, and he's as hard as his name. Borgosh Corebender for weapons, and he dreams of forging a hammer fit for a warchief, so he measures every student against that dream. Neither will pass you out of kindness, which is why their word means something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    counsel = {
      lines = { { id = "co_default", text = "I'll not choose for you, and I'd think less of you if you let me. Ask yourself which you look at first on a warrior walking past, the thing in his hand or the thing on his chest. Your eye already knows, and your hands will follow it." } },
      choices = { { text = "I'll watch my own eye. Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "wr_default", text = "It counts for more than you'd think. A smith works blind without someone to tell him where the strap chafed and which plate took the blow. Come back after a hard fight and show me the dents, and you'll have taught this forge something." } },
      choices = { { text = "I'll bring you the dents. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've stood at a forge since before the Dark Portal. The fires were hotter then and the cause was worse." } },
    advice = { { id = "tp_ad", text = "Turn the piece over. Whatever you've made, the fault is on the side you didn't look at." } },
    second_war = { { id = "tp_second_war", text = "I made axes for it, more than I could count, and saw none of them again. I think about where they went." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's plate was Doomhammer's, black and older than this city. I've been allowed to mend it once, and my hands shook." } },
    blackrock = { { id = "tp_blackrock", text = "The orcs under that mountain still follow the old Horde's ways, and they've smiths as good as any here. That's the pity of it." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. It's not something you can put on an anvil." } },
  },
}

---------------------------------------------------------------------------
-- Borgosh Corebender: weaponsmith of the Valley of Honor (The Way of the Weaponsmith).
---------------------------------------------------------------------------
P:NPC {
  key = "borgosh", id = TODO_NPC("Borgosh Corebender"), name = "Borgosh Corebender", title = "Blacksmithing Trainer",
  bible = "bibles/more_folk.md", role = "blacksmith", tier = "quest",
  communities = { "orgrimmar" }, temper = { "driven", "proud" }, values = { "craft", "ambitious" },
  notices = { "craft", "class" },
  impression = {
    first = "Borgosh Corebender forges weapons in the Valley of Honor and tests every one by swinging it himself. He means to make a hammer fit for a warchief before he dies, and he talks about it the way other orcs talk about a battle they have yet to win.",
    third = "{name} met Borgosh Corebender, the Orgrimmar weaponsmith who dreams of forging a hammer worthy of a warchief.",
  },
  greetings = {
    { id = "g_default", text = "Stand back from the swing. I test what I make, and I don't look behind me when I do it." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Another smith. Pick up that axe on the bench and tell me what's wrong with it, and then we'll see if we've anything to say to each other." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The hammer isn't finished, before you ask. It's never finished." },
    { id = "g_away", when = { away = 14 }, text = "You've been out in the world. Tell me what the best weapon you saw was, and who carried it, and leave nothing out." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your grip's worn the wrap smooth on the left side only. You're overreaching on the backswing, and a better-balanced haft would cure it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The Warchief carries a hammer and speaks to the storm with it, and I've wondered for years how much is the orc and how much is the steel." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Borgosh Corebender, and I make weapons for the Horde. Anyone here can make you an axe that cuts; I make the ones that still feel right in the hand at the end of the day." },
        { id = "h_before", when = { all = { { profession = { name = "Blacksmithing", min = 200 } }, { questBefore = TODO_QUEST("The Way of the Weaponsmith") } } },
          text = "Krathok says you're ready to choose, and that you've chosen arms. Then prove it to me the only way that counts. I'll give you a list, you'll forge every piece on it, and I'll swing each one until I know what kind of smith made it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Way of the Weaponsmith") },
          text = "You have my list. Don't bring me half of it and ask how you're doing. Bring me all of it, laid out on the bench, and say nothing while I work through them." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Way of the Weaponsmith"), days = 3 } },
          text = "I swung every one. The second axe is a hair heavy at the beard, and the rest I'd put in a grunt's hand without a second thought. You're a weaponsmith, and I'll say so to anyone who asks." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Way of the Weaponsmith"), days = 7 } },
          text = "I've a blade of yours on my own rack, the best of the lot you brought me. I pick it up when the hammer won't come right, to remind myself that somebody's work in this valley is going well." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and file at once." },
        { id = "h_again2", text = "Ask. The steel's in the quench and I've a moment." },
        { id = "h_again3", text = "Go on, then, while my arm rests." },
      },
      choices = {
        { text = "Tell me about this hammer of yours.", next = "hammer" },
        { text = "You swing everything you make yourself.", next = "swing" },
        { text = "Krathok chose armor. You chose the other road.", next = "krathok" },
        { text = "What makes a weapon feel right?", next = "balance" },
        { text = "I fight with what I'm given. Teach me to judge it.", next = "judge", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "SHAMAN" } } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Good forging, Borgosh.", next = "END" },
      },
    },
    hammer = {
      lines = { { id = "hm_default", text = "A warhammer fit for a warchief. Doomhammer's own weapon is older than the Horde and nobody living knows who forged it, and I mean to make its equal before I'm too old to lift my tools. I've begun eleven times, and broken up every one for scrap." } },
      choices = {
        { text = "What was wrong with the eleven?", next = "hammer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer2 = {
      lines = { { id = "hm2_default", text = "Nothing a warrior would notice. The ninth was the best weapon I've ever made, and Saru Steelfury wept when I cut it up. But I held it, and it was only a very good hammer, and the thing I'm after is supposed to feel like it was waiting for someone." } },
      choices = {
        { text = "And if the twelfth is only very good?", next = "hammer3" },
        { text = "Something else, Borgosh.", next = "BACK" },
      },
    },
    hammer3 = {
      big = true,
      lines = { { id = "hm3_default", text = "Then there'll be a thirteenth. I know what they say in the valley, that I've wasted enough thorium to arm a warband on a dream. Perhaps I have. But a people who came out of cages ought to make one thing that's simply the best there is." } },
      choices = {
        { text = "Chase it. A people need something great to point to.", next = "BACK", reply = "That's it exactly. Come back in a year, and I'll either show it to you or show you the scrap from the twelfth.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "That thorium would have served the Horde better as axes.", next = "BACK", reply = "Krathok says the same, and I can't call either of you wrong. I'll make my axes by day and my folly by night.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    swing = {
      lines = { { id = "sw_default", text = "I was a grunt before I was a smith, and I carried a bad axe through a long war. It pulled left, and I learned to pull right, and I was tired an hour before the orc beside me. Nobody who buys from me will ever have to learn around my mistakes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    krathok = {
      lines = { { id = "kr_default", text = "He did, and he's the finest armorer in the city, so every day I'm trying to make something that goes through his work and he's trying to make something that stops mine. Neither of us has won. We drink together on the last night of each month and don't discuss it." } },
      choices = {
        { text = "That contest makes you both better.", next = "BACK", reply = "It's made us both stubborn, which in a smith comes to the same thing.", fx = { align = { honor = 1 } } },
        { text = "One day you'll find the weak point in his plate.", next = "BACK", reply = "I found one, three years ago, and I told him where it was. He's not thanked me yet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance = {
      lines = { { id = "ba_default", text = "The weight sitting where the hand expects it. Hold any weapon out at arm's length and let the point drop; if it falls slowly and stops where you meant, the smith knew his work. If it dives, he was thinking about the edge and forgot the arm behind it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    judge = {
      lines = {
        { id = "ju_default", text = "Three things. Flick the blade with a nail and listen for a clean ring, sight down it for a twist, and then do the arm's-length test I'd show any apprentice. A weapon that passes all three will outlast you, and one that fails the first isn't worth carrying home." },
        { id = "ju_hunter", when = { class = "HUNTER" }, text = "For your sort it's the off-hand blade that kills you, because you never think about it until something's inside your bow's reach. Flick it for a ring, sight it for a twist, and carry a plain good one in place of a fine bad one." },
      },
      choices = { { text = "Ring, twist and balance. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried an axe in the old Horde and a hammer in the new one. The hammer's the one I'm proud of." } },
    advice = { { id = "tp_ad", text = "Never keep a weapon you have to fight before you fight the enemy. Sell it, and buy one that fits." } },
    thrall = { { id = "tp_thrall", text = "I've seen the Doomhammer close, once, when the Warchief walked this valley. I didn't sleep for two nights after, and I started the fourth hammer on the third." } },
    second_war = { { id = "tp_second_war", text = "Bad steel and too much of it. The clans' smiths were made to count, not to care, and I carried the proof on my shoulder for years." } },
    blackrock = { { id = "tp_blackrock", text = "Dark iron comes out of that mountain, and I'd give a year of my life for a cartload. The ones who hold it aren't selling." } },
    _none = { { id = "tp_none", text = "I don't know. If it had an edge, I would." } },
  },
}

---------------------------------------------------------------------------
-- Barkeep Morag: runs the taproom of the Orgrimmar inn, Valley of Strength.
---------------------------------------------------------------------------
P:NPC {
  key = "morag", id = TODO_NPC("Barkeep Morag"), name = "Barkeep Morag", title = "Barkeep",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "easy", "sharp" }, values = { "practical", "loyal" },
  notices = { "drink", "class" },
  impression = {
    first = "Barkeep Morag pours for half of Orgrimmar from the ground floor of the inn and hears what the other half is saying. He keeps the peace with a rag in one hand and a short club under the bar.",
    third = "{name} met Barkeep Morag, who runs the taproom of the inn in Orgrimmar's Valley of Strength.",
  },
  greetings = {
    { id = "g_default", text = "Find a bench, if there is one. Meat's on the spit, ale's in the barrel, and fights are outside." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The usual, or have you finally got some coin?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You've picked the loud hour. Shout your order, I'll not hear it otherwise." },
    { id = "g_away", when = { away = 14 }, text = "Well, you're not dead. Somebody at that table owes me a silver; I'd bet you'd come back." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had enough, and I say that as the orc who profits from you having more. Sit down before the floor comes up to meet you." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Leave the axe on the peg by the door, same as everyone, and you can have it back when you can still find the door." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Morag, and this is my floor. Gryshka runs the beds upstairs and I run the barrels down here, and between us nobody in the Valley of Strength goes to sleep hungry, sober or unheard." },
        { id = "h_dead", when = { race = "Scourge" }, text = "I'm Morag, and this is my floor. I'll pour for the Forsaken as for anyone, and I've stopped asking where it goes. Your coin spends, and you're quieter than the grunts." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, there are six mugs waiting." },
        { id = "h_again2", text = "Go on, I'm listening. I'm always listening, it's half the job." },
        { id = "h_again3", text = "Still here? Then you're either thirsty or curious, and I can serve both." },
      },
      choices = {
        { text = "Show me what's on the spit.", next = "BUSINESS" },
        { text = "A barkeep hears everything. What's the talk?", next = "talk" },
        { text = "It must take a firm hand to keep peace in here.", next = "peace" },
        { text = "That poor orc Gamon seems to live in your doorway.", next = "gamon" },
        { text = "Where does Orgrimmar's ale come from?", next = "ale" },
        { text = "Trolls drink differently than orcs, I've noticed.", next = "troll", when = { race = "Troll" } },
        { text = "My people brew a milder cup than this.", next = "tauren", when = { race = "Tauren" } },
        { text = "That's all, Morag.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "ta_default", text = "This week? The Warsong want more axes in Ashenvale, the caravans say the Kolkar are thick on the Gold Road, and a grunt off the Cleft watch swears there are robed strangers going in and out of the fire caves under the city. He was on his fifth mug, mind." } },
      choices = {
        { text = "Do you believe him about the caves?", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      lines = { { id = "ta2_default", text = "I believe he saw something. I've had three different grunts tell me the same tale on three different nights, and none of them knew the others had. When the drunk ones and the sober ones start agreeing, a barkeep pays attention." } },
      choices = {
        { text = "Have you passed that to anyone?", next = "talk3" },
        { text = "Something else, Morag.", next = "BACK" },
      },
    },
    talk3 = {
      big = true,
      lines = { { id = "ta3_default", text = "I passed it to a quiet orc who drinks water in the corner and reports to Grommash Hold. I don't know his name, and he pays for the water. What's said over my bar stays here, unless it's the kind of thing that gets my customers killed." } },
      choices = {
        { text = "The city's safety comes before a drinker's secrets.", next = "BACK", reply = "That's where I draw it. Everything short of that, I've never heard and can't recall.", fx = { align = { order = 1 }, learn = { "burning_blade" } } },
        { text = "A barkeep who tells tales loses his trade.", next = "BACK", reply = "He does, and that's why I tell exactly one kind. Don't give me cause to tell one about you.", fx = { align = { order = -1 }, learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "pe_default", text = "A firm hand and a short memory. Two orcs will quarrel over an insult from the Second War, and I let them shout until one reaches for something, and then they're both in the street. By tomorrow I've forgotten it, and so have they, and they're back on the same bench." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gamon = {
      lines = { { id = "ga_default", text = "Gamon. I don't know what he did, and I've stopped asking, but every young blade in the city takes a swing at him on the way past. I've a rule that nobody touches him inside my door. He drinks slowly, and I don't hurry him." } },
      choices = {
        { text = "That's decent of you. Someone should.", next = "BACK", reply = "It's little enough. He tips, which is more than his tormentors do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If he can't defend himself, that's his failing.", next = "BACK", reply = "Maybe. You try being hit by every stranger for a year and see how your guard holds.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale = {
      lines = { { id = "al_default", text = "The grog's brewed here, from Barrens grain, and it'll strip paint. The good ale comes by goblin ship to Ratchet and overland from there, and I pay through the tusk for it. Now and then a tauren caravan brings something from Mulgore that's sweet and far too gentle, and the trolls buy all of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tl_default", text = "You do. An orc drinks to get somewhere, and your people drink to stay where you are a while longer. The Darkspear sit in that corner half the night on two mugs and laugh more than the grunts do on ten, and I've come to prefer the corner." } },
      choices = { { text = "Save me a seat there. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "tn_default", text = "I've had it, and I'll be honest, I couldn't tell it was working until I stood up. Your people sit by my fire and say almost nothing all evening, and the whole room is calmer for it. I'd pay a few of you to come in every night." } },
      choices = { { text = "Our company is free. Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "The Warchief's been in, once, with his hood up, and sat an hour listening. Nobody knew him but me, and I said nothing." } },
    advice = { { id = "tp_ad", text = "Eat before you drink, and pay before you forget. Those two rules would empty half the infirmaries in Durotar." } },
    ratchet = { { id = "tp_ratchet", text = "Goblins. Every barrel I buy from them is a little smaller than the last and costs a little more. I've measured." } },
    centaur = { { id = "tp_centaur", text = "The caravan drivers curse them over every mug. Kolkar on the roads, and the price of everything from the Barrens goes up." } },
    second_war = { { id = "tp_second_war", text = "I hear that war refought at these tables every night. It goes better for us here than it did there." } },
    _none = { { id = "tp_none", text = "Nobody's said a word about that over my bar, and that's the only place I learn anything." } },
  },
}

---------------------------------------------------------------------------
-- Zayus: Darkspear high priest, Valley of Spirits.
---------------------------------------------------------------------------
P:NPC {
  key = "zayus", id = TODO_NPC("Zayus"), name = "Zayus", title = "High Priest",
  bible = "bibles/more_folk.md", role = "priest", tier = "service",
  communities = { "orgrimmar" }, temper = { "grave", "gentle" }, values = { "wise", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Zayus is the Darkspear's high priest in Orgrimmar, an old troll who speaks of the loa the way one speaks of difficult elders. He teaches healing and shadow together, and sees no quarrel between them.",
    third = "{name} met Zayus, the Darkspear high priest who teaches in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of de sun, child. De spirits be easier to hear in de shade, and so am I." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah. One who already walks between. Sit, and tell me which side you been leanin' toward since last de loa looked at you." },
    { id = "g_back", when = { metBefore = true }, text = "You come again. De loa noticed, and so did I." },
    { id = "g_away", when = { away = 14 }, text = "It be many days. You carry more ghosts dan when you left, child, and I mean dat kindly." },
  },
  notice = {
    { id = "n_dead", cat = "race", when = { race = "Scourge" },
      text = "You died and you came back, and no loa had a hand in it. I do not know what to call dat, child, but I will not call it nothin'." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "You carry de humans' Light. It be a strong spirit, dat one, and a jealous one. I greet it, and I ask it to mind its manners in my house." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Zayus, and I speak to de loa for de Darkspear in dis city. I teach de young ones to mend flesh and to wound de spirit, because a priest who can only do one be half a priest." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Zayus, child of de tribe, and you know what I be. When you need de loa, come to me before you go to dem alone, because dey be kinder to dose who are introduced." },
      },
      again = {
        { id = "h_again", text = "What else weighs on you? Speak it." },
        { id = "h_again2", text = "Ask, child. De loa be patient today, and I borrow from dem." },
        { id = "h_again3", text = "You got another question. Good, de ones with no questions frighten me." },
      },
      choices = {
        { text = "Teach me, Zayus.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who are the loa you speak for?", next = "loa" },
        { text = "Healing and shadow seem strange companions.", next = "shadow" },
        { text = "The Valley of Spirits is a troll place in an orc city.", next = "valley" },
        { text = "The orcs' shaman and your priests share one Horde.", next = "shaman" },
        { text = "What do you make of the Forsaken's priests?", next = "forsaken" },
        { text = "Spirits walk with you, Zayus.", next = "END" },
      },
    },
    loa = {
      lines = { { id = "lo_default", text = "Dey be de old powers, older dan trolls, and each tribe got de ones dat chose it. Dere be de one who keeps de dead, and I do not say his name idly. Dere be de bat and de snake and de tiger, and many small ones of river and tree. De Darkspear be a small tribe, so we be polite to all of dem." } },
      choices = {
        { text = "What do they ask in return?", next = "loa2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loa2 = {
      lines = { { id = "lo2_default", text = "Remembrance, mostly, and a gift now and den. De old tribes gave blood, and some still do. De Darkspear gave dat up when we cast our lot with de Horde, because a loa fed on de blood of your own people gets a taste for it. Not every loa has forgiven us for de change." } },
      choices = {
        { text = "The other tribes still sacrifice their own?", next = "loa3" },
        { text = "Something else, Zayus.", next = "BACK" },
      },
    },
    loa3 = {
      big = true,
      lines = { { id = "lo3_default", text = "De Gurubashi in de south do, and worse dan dat. Dey say we be weak for havin' stopped, and dat de orcs made us soft. I say a tribe dat eats its own children to please its gods has already been conquered, child, only by de gods and not by an enemy." } },
      choices = {
        { text = "The Darkspear chose rightly. Mercy isn't weakness.", next = "BACK", reply = "So Vol'jin believes, and I with him. It cost us our place among de tribes, and I never once wished it back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old powers demand old prices. You may yet pay for it.", next = "BACK", reply = "We may. If de bill comes, child, I will stand in front of de tribe to receive it, and I will not hand dem a knife.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow = {
      lines = { { id = "sh_default", text = "Only to de humans, who cut de world in two and kept one half. De same hand dat sets a bone can stop a heart, and de loa never pretended otherwise. I teach de shadow so dat my students know what dey be holdin' back each time dey choose to heal." } },
      choices = {
        { text = "Knowing the dark makes the mercy a real choice.", next = "BACK", reply = "Dat be it, child. A healer who cannot harm be only harmless, and dat be a different thing from good.", fx = { align = { light = 1 } } },
        { text = "Then the shadow is simply the stronger half.", next = "BACK", reply = "It be de louder half. Sit with a dyin' friend one night and den tell me which half you wanted in your hands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = { { id = "va_default", text = "De Warchief gave it to us when de city was built, and we made it as near to home as red rock allows. De mages keep deir circle here too, Pephredo and her sisters, and Ur'kyo and X'yera teach de young priests when my knees say no. It be small, but it be ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sm_default", text = "We do, and we be more alike dan de orcs first believed. Dey speak to earth and storm, and we speak to de ones who walk on de earth and ride de storm. Kardris and I have argued about it for years, pleasantly, and neither of us has moved an inch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Dey learned from de humans' Light and den de Light let dem die, and now dey hold to de shadow like a drownin' one holds a spar. I pity dem, and I teach dem when dey ask. But I watch de ones who say dere be nothin' left worth healin', because I heard dat said before, on de Echo Isles." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
  },
  topics = {
    voljin = { { id = "tp_voljin", text = "De loa speak to Vol'jin without my help, and dat be de mark of a shadow hunter. I be his priest, child, and some days I think I be his student." } },
    echo_isles = { { id = "tp_isles", text = "Zalazane was a witch doctor of great gift, and he took what de loa lend and called it his own. De isles be full of what comes of dat." } },
    darkspear = { { id = "tp_darkspear", text = "We be de least of de troll tribes in number and de only one dat changed its ways. I believe de second matters more dan de first." } },
    thrall = { { id = "tp_thrall", text = "De orc who listened when a dyin' troll asked him to save a tribe not his own. De loa marked him dat day, whether he knows it or not." } },
    holy_light = { { id = "tp_light", text = "A strong spirit, and it gives much, but it wants to be de only one in de room. De loa be many, and so dey be used to sharin'." } },
    advice = { { id = "tp_ad", text = "Be introduced before you ask a favour, of a loa or of anyone. De ones who skip dat part pay more." } },
    _none = { { id = "tp_none", text = "De loa be silent on dat, child, and so must I be." } },
  },
}

---------------------------------------------------------------------------
-- Pephredo: Darkspear mage trainer, Valley of Spirits.
---------------------------------------------------------------------------
P:NPC {
  key = "pephredo", id = TODO_NPC("Pephredo"), name = "Pephredo", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp", "amused" }, values = { "curious", "craft" },
  notices = { "class", "arcane" },
  impression = {
    first = "Pephredo teaches magic in the Valley of Spirits beside Deino and Enyo, and the three of them finish one another's sentences. She is the sharpest-tongued of the circle, and she seems to enjoy watching students work out that she was right.",
    third = "{name} met Pephredo, a Darkspear mage who trains spellcasters in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_default", text = "Stand dere, where de floor be scorched already. Now, what you want from de mages, mon?" },
    { id = "g_mage", when = { class = "MAGE" }, text = "A student! Good, show me your hands. Hm. You been castin' angry, I can see de burn on de fingertips." },
    { id = "g_back", when = { metBefore = true }, text = "You be back. Deino said you would be, and Enyo said you wouldn't, so now Enyo owes me." },
    { id = "g_away", when = { away = 14 }, text = "Look who de winds blew home. You been gone so long we gave your spot on de scorched floor to somebody else." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You be from de Cleft, mon, I can smell de brimstone. We keep de arcane clean up here, so wipe your feet." },
    { id = "n_water", cat = "arcane", when = { class = "MAGE", maxLevel = 20 },
      text = "You still be conjurin' water dat tastes like a boot, I can tell by your face. Dere be a trick to it, and I show you if you ask nice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Pephredo. Deino and Enyo and I keep de mages' circle in dis valley, and between de three of us dere be not a spell cast in Orgrimmar dat one of us did not teach or scold." },
        { id = "h_mage", when = { class = "MAGE" }, text = "I be Pephredo, and you be one of ours. Deino will tell you what a spell does, Enyo will tell you why, and I be de one who tells you what you did wrong." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Pephredo, cousin. Deino, Enyo and I be de proof dat de Darkspear can do with a word what de orcs do with an axe, so walk tall in dis valley." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Ask it before Deino answers for me." },
        { id = "h_again2", text = "Go on. I got a ward to mend, but it holds a while yet." },
        { id = "h_again3", text = "More questions! Enyo, dis one be worth keepin'." },
      },
      choices = {
        { text = "Teach me, Pephredo.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Three teachers in one circle must quarrel.", next = "three" },
        { text = "How do orcs take to mages in their capital?", next = "orcs" },
        { text = "Where do Horde mages learn what you can't teach?", next = "beyond" },
        { text = "Thuul opens portals here. That seems reckless.", next = "portals" },
        { text = "The Forsaken brought Dalaran's learning with them.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Farewell, Pephredo.", next = "END" },
      },
    },
    three = {
      lines = { { id = "th_default", text = "All day, mon, and we would not have it another way. Deino be de careful one, Enyo be de bold one, and I be de one who says when each of dem has gone too far. A student who hears all three learns to argue with a spell before castin' it." } },
      choices = {
        { text = "What do you quarrel about most?", next = "three2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    three2 = {
      lines = { { id = "th2_default", text = "How much to teach, and how soon. Enyo would hand a child de strongest fire she knows and let de child sort it out. Deino would make dem draw circles for a year. I say you give dem a little more dan dey can hold, and stand close." } },
      choices = {
        { text = "Has standing close ever not been enough?", next = "three3" },
        { text = "Something else, Pephredo.", next = "BACK" },
      },
    },
    three3 = {
      big = true,
      lines = { { id = "th3_default", text = "Once. A boy, very gifted, and I gave him a spell a season early because he begged and because I was proud of him. He lives, mon, but he does not cast any more, and he will not come up dis valley. Deino never said she told me so, and dat be worse." } },
      choices = {
        { text = "You taught from pride. Now you teach from care.", next = "BACK", reply = "Dat be de kindest way anybody put it. I be sharper with dem now because of him, and dey think it be temper.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The gifted must be pushed. Some will break.", next = "BACK", reply = "Enyo says de same, and she never had to carry one home. Push your own self, mon, and leave de children to me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "Better each year. At de foundin' a grunt would cross de road sooner dan walk past our door, because all he knew of magic was warlocks. Now dey send for us when a well runs dry or a caravan needs a ward, and one of de wolf riders even brought his daughter to be tested." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beyond = {
      lines = { { id = "be_default", text = "From de Forsaken in de Undercity, who kept more of Dalaran's books dan dey admit, and from de tauren seers at Thunder Bluff, who know things dat were never in a book. And some go to Tabetha in de marsh, a human, which de grunts would not like to hear." } },
      choices = {
        { text = "Knowledge has no banner. Learn it where it lives.", next = "BACK", reply = "So I tell dem, and so I did myself. A spell don't ask who taught it to you.", fx = { align = { order = -1 } } },
        { text = "The Horde's mages should learn from the Horde.", next = "BACK", reply = "And when de Horde has a library, mon, dey will. Till den I send dem where de books be.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    portals = {
      lines = { { id = "po_default", text = "Thuul be de least reckless troll I know, and dat be why he has de work. A portal be a door, mon, and he never opens one till he has checked what be standin' on de other side. He has refused de Warchief's own messengers when de weave looked wrong, and nobody argued." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "You did, and I be grateful and a little afraid. Your mages know more dan we do and feel less about it, and I have seen one of you cast a thing in jest dat would have made Deino faint. Teach us, mon, but slowly, and tell us what it costs." } },
      choices = { { text = "We seldom mention the cost. I'll try. Something else.", next = "BACK" } },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "De humans' city of mages, shut under a dome since de war. Everything in it we had to work out for ourselves, and I be proud how much we got right." } },
    darkspear = { { id = "tp_darkspear", text = "De witch doctors had de arcane all along and called it somethin' else. We just took it out in de daylight." } },
    thrall = { { id = "tp_thrall", text = "De Warchief be a shaman and made a home for mages anyway. He said a Horde dat only had one kind of power would be de old Horde again." } },
    burning_legion = { { id = "tp_legion", text = "De arcane be what drew dem to dis world in de first place, long ago. Every mage should know dat, and cast like somebody might be listenin'." } },
    advice = { { id = "tp_ad", text = "Argue with de spell before you cast it, mon. If you can't say why it could go wrong, you don't know it yet." } },
    _none = { { id = "tp_none", text = "Ask Deino, she reads more. I only know what I burned my fingers on." } },
  },
}

---------------------------------------------------------------------------
-- Koma: banker, Valley of Strength; brother of Karus and Soran.
---------------------------------------------------------------------------
P:NPC {
  key = "koma", id = TODO_NPC("Koma"), name = "Koma", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "orgrimmar" }, temper = { "bluff", "boastful" }, values = { "loyal", "proud" },
  notices = { "purse", "class" },
  impression = {
    first = "Koma keeps a counter at the Bank of Orgrimmar beside his brothers Karus and Soran, and tells anyone who will listen that the three of them fought at Mount Hyjal. He counts coin carefully and stories generously.",
    third = "{name} met Koma, one of three brothers who keep the Bank of Orgrimmar and who all claim to have fought at Mount Hyjal.",
  },
  greetings = {
    { id = "g_default", text = "The Bank of Orgrimmar. Your goods are as safe here as behind the line at Hyjal, and I should know, I stood in that line." },
    { id = "g_back", when = { metBefore = true }, text = "Back to the vault. Did I tell you about the infernal that came down beside me? No? Remind me after." },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Now there's a purse with some weight to it. Step up, step up, the vault's got room for a hero's earnings." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone a while. Everything's where you left it; I walked past your vault every day and glared at it." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Light purse. No shame in it, I came out of the camps with less. Put by one copper in ten and you'll surprise yourself." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Then you'll understand me when I say a bank counter is harder duty than a battle line. Nobody ever asked me to count at Hyjal." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Koma. My brothers Karus and Soran and I keep this bank for the Warchief, and before that we kept a stretch of hillside at Mount Hyjal against everything the Legion had. The hillside was easier on the feet." },
        { id = "h_veteran", when = { minLevel = 50 }, text = "I'm Koma. You've the look of someone who's been where the fighting is, so I'll not bore you with my one battle unless you ask. My brothers will tell you I can't help myself." },
        { id = "h_orc", when = { race = "Orc", maxLevel = 20 }, text = "I'm Koma, young one. My brothers and I were grunts at Mount Hyjal before we were bankers, so when I tell you to put something by for a bad season, hear it from one who has seen a bad season." },
      },
      again = {
        { id = "h_again", text = "What else? The ledger can wait a moment." },
        { id = "h_again2", text = "Go on. Karus says I talk too much, so I may as well earn it." },
        { id = "h_again3", text = "Ask away. I've a story for most questions." },
      },
      choices = {
        { text = "Open my vault, Koma.", next = "BUSINESS" },
        { text = "Tell me about Hyjal, then.", next = "hyjal" },
        { text = "How did three soldiers end up as bankers?", next = "bankers" },
        { text = "Your brother Karus seems the careful one.", next = "karus" },
        { text = "What do people keep in an orc bank?", next = "vault" },
        { text = "My people stood on that mountain too.", next = "ally", when = { race = { "Tauren", "Troll" } } },
        { text = "Guard it well, Koma.", next = "END" },
      },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "We were grunts under the Warchief's own banner, on the slope below the summit, the three of us in one rank. The sky was green and the ground was burning, and the dead came uphill in a line with no end to it. Our orders were to hold till the horn, and we held." } },
      choices = {
        { text = "What happened when the horn blew?", next = "hyjal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal2 = {
      lines = { { id = "hy2_default", text = "We fell back through the human lines, and then the humans fell back through the elves, each buying a little more time. I'd hated humans all my life, and I walked past a line of them who knew they were about to die so that I could reach the next ridge. I've not known what to do with that since." } },
      choices = {
        { text = "Your brothers tell it the same way?", next = "hyjal3" },
        { text = "Something else, Koma.", next = "BACK" },
      },
    },
    hyjal3 = {
      big = true,
      lines = { { id = "hy3_default", text = "Karus tells it shorter and Soran won't tell it at all. I tell it loud, with an infernal in it that gets bigger every year, because if I told it the way it was I'd have to stop halfway. Let an old grunt have his infernal." } },
      choices = {
        { text = "Tell it however lets you tell it. You were there.", next = "BACK", reply = "I was, and so were they. Thank you. The infernal was at least as tall as that door, mind.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A soldier owes the dead the truth, not a tavern tale.", next = "BACK", reply = "Maybe so. Soran thinks it too, and he's the best of us. I'll try it plain, one night, when the bank's empty.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bankers = {
      lines = { { id = "ba_default", text = "The Warchief needed orcs he could trust with other people's goods, and after Hyjal he said three brothers who'd held a rank together could hold a vault. None of us could count past our fingers. Karus learned first and beat it into the other two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    karus = {
      lines = { { id = "ka_default", text = "He is. Karus counts everything three times and writes it down twice, and he's never been wrong by a copper. Soran keeps the armory accounts across the way as well, so he's the busy one. I'm the one who talks to the customers, since somebody must." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vault = {
      lines = { { id = "va_default", text = "Less gold than you'd think and more trophies. Tusks, banners, a human general's boot, somebody's first axe. Orcs have only had things of their own for a few years, and they keep what reminds them of how they got them. I treat a cracked tusk as carefully as a bag of gold." } },
      choices = {
        { text = "Memory is worth more than gold. Guard it so.", next = "BACK", reply = "That's how we see it at this counter. Half of what's back there you couldn't sell, and none of it's for sale.", fx = { align = { honor = 1 } } },
        { text = "Sentiment takes up space that coin could fill.", next = "BACK", reply = "You sound like a goblin, and they've their own bank. This one's for orcs and whoever stands with them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally = {
      lines = { { id = "al_default", text = "You did, and I saw it. There were Darkspear axe-throwers on our left who never missed, and Cairne's braves came through the smoke like a rockslide when our line was about to go. I'll not hear a word against either people at my counter." } },
      choices = { { text = "Nor I against yours. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "I saw their lord fall at the World Tree, from a long way down the slope. It was the best thing I ever saw and I hope never to see its like." } },
    thrall = { { id = "tp_thrall", text = "He stood in the line with us, not behind it. That's all I need to know about a warchief." } },
    jaina = { { id = "tp_jaina", text = "The human sorceress. Her people held the ridge behind ours and died doing it. I don't like humans, and I'd not let anyone spit on her name." } },
    internment = { { id = "tp_internment", text = "Five years behind a fence, the three of us. We'd nothing to put in a bank then, and I think that's why we guard this one so hard." } },
    advice = { { id = "tp_ad", text = "Put by one coin in ten, and keep one thing that isn't coin. You'll want both when you're old." } },
    _none = { { id = "tp_none", text = "That wasn't at Hyjal and it isn't in the vault, so I can't help you." } },
  },
}

---------------------------------------------------------------------------
-- Roxxik: goblin engineering trainer at Nogg's Machine Shop, the Drag.
---------------------------------------------------------------------------
P:NPC {
  key = "roxxik", id = TODO_NPC("Roxxik"), name = "Roxxik", title = "Engineering Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fast", "cheerful" }, values = { "craft", "greedy" },
  notices = { "craft", "class" },
  impression = {
    first = "Roxxik teaches engineering at Nogg's Machine Shop in the Drag, and prices every lesson, spark and scorch mark as he goes. He treats an explosion as a result like any other, so long as someone else is paying for the bench.",
    third = "{name} met Roxxik, the goblin who teaches engineering at Nogg's Machine Shop in Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_default", text = "Whoa, whoa, not that lever, pal, that one's load-bearing. Now, what can Roxxik do for ya, and what's your budget?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "Hey, a colleague! Still got all ten fingers, I see, so you're either careful or new. Step up, I got schematics hot off the press." },
    { id = "g_back", when = { metBefore = true }, text = "Look who's back, my favourite repeat customer! That's a compliment and a billing category, friend." },
    { id = "g_away", when = { away = 14 }, text = "Hey, long time! We blew out the back wall while you were gone, twice, and Nogg says the second one's on my account." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You mine your own ore? Smart, real smart, cuts out the middleman. I am the middleman, so I say that with mixed feelings." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter with a bow! Pal, listen, I can put you in a rifle by sundown and you'll never string anything again. Louder, sure, but think of the range." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Roxxik's the name, engineering's the game, and Nogg's is the shop, so he takes a cut and I do the teaching. You wanna build something that goes bang, whirr or zap, you came to the only bench in Orgrimmar that's insured for all three." },
      },
      again = {
        { id = "h_again", text = "What else ya got? Talk fast, the boiler's on a timer." },
        { id = "h_again2", text = "Sure, sure, ask. Questions are free the first three times." },
        { id = "h_again3", text = "Still here, still not on fire. Good day so far, pal. What else?" },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "How does a goblin end up teaching orcs?", next = "orcs" },
        { text = "How often does this shop explode?", next = "boom" },
        { text = "Goblin engineering or gnomish? Settle it.", next = "gnomes" },
        { text = "Nogg owns the shop. What's your arrangement?", next = "nogg" },
        { text = "I've been building for a while. What's next?", next = "expert", when = { profession = { name = "Engineering", min = 150 } } },
        { text = "The spirits don't care for black powder, I think.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Try not to blow up, Roxxik.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "Supply and demand, pal. The Horde's got a brand-new city, a war on three sides and exactly zero engineers who can read a schematic, and the Cartel's got goblins who'll go anywhere there's a contract. I came for six months, and that was years ago, so do the arithmetic on my rates." } },
      choices = {
        { text = "Are orcs any good at it?", next = "orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs2 = {
      lines = { { id = "or2_default", text = "Better than you'd figure! They got big hands, sure, so the fine work's a struggle, but tell an orc a thing might blow up and he leans in. Back home an apprentice runs when the fuse is lit. Here they stand there and take notes, and half of 'em survive, which is a great ratio." } },
      choices = {
        { text = "Half of them survive?", next = "orcs3" },
        { text = "Something else, Roxxik.", next = "BACK" },
      },
    },
    orcs3 = {
      big = true,
      lines = { { id = "or3_default", text = "Survive unsinged, I mean, relax! Nobody's died on my bench, and I got the paperwork to prove it. Listen, between us, I like the big lugs. One of my students rebuilt my whole steam press after it went up, wouldn't take a copper, said it was owed. I didn't know what to do with that, so I gave him a wrench." } },
      choices = {
        { text = "That's the Horde. Debts of honor, not coin.", next = "BACK", reply = "Yeah, I'm getting that, and it's wrecking my bookkeeping. Good wrench, though. He cried a little.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You should have billed him for the lesson in repairs.", next = "BACK", reply = "Ha! Now you're talking my language, friend. I thought about it, and then I didn't, and don't tell the Cartel.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boom = {
      lines = { { id = "bo_default", text = "Define explode. Full structural, maybe twice a year. Contained energetic events, call it weekly. That's just the cost of doing business, and Nogg's got it itemised under overhead. The neighbours used to complain, and now Zamja just yells that we owe her for the soup." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "Oh, pal, don't get me started. Gnomes build a thing with nine hundred parts that does something clever one time in three. We build a thing with four parts that does something loud every single time. You want reliable results, you want goblin, and you want to stand back about twenty paces." } },
      choices = {
        { text = "Loud and reliable. I'm sold on goblin.", next = "BACK", reply = "That's the spirit! Stick with me, and you'll be removing your own eyebrows professionally in no time.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Clever beats loud. The gnomes have a point.", next = "BACK", reply = "Whoa, hey, not so loud! Sure, they got a couple neat gizmos. They also lost a whole city to their own gizmos, so who's counting?", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nogg = {
      lines = { { id = "no_default", text = "Nogg's got the lease, the tools and the Warchief's permit, and I got the know-how, so we split it sixty-forty, his way, on account of the walls. Sovik sells the parts out front and Thund takes the beginners. It's a real nice little operation when it's all standing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    expert = {
      lines = { { id = "ex_default", text = "Next, friend, is where it gets interesting and expensive. Once your hands know the basics you're gonna want to pick a school, and for the goblin side that means a trip to Nixx Sprocketspring down in Gadgetzan. Tell him Roxxik sent ya, and he'll charge you the regular price, which for Nixx is a favour." } },
      choices = { { text = "Gadgetzan, Nixx. Something else.", next = "BACK", fx = { learn = { "gadgetzan" } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Yeah, I get that a lot. Had one of your guys stand in the door and tell me the fire spirits were offended. I said, pal, I give those fire spirits more work than anybody in this city, they oughta send me a fruit basket. He left. I think that's a win?" } },
      choices = { { text = "It wasn't a win. Something else.", next = "BACK" } },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_cartel", text = "Best outfit there is, pal. Neutral, punctual and open for business with anybody whose coin is round." } },
    ratchet = { { id = "tp_ratchet", text = "Gazlowe's town. Good guy, pays on time, built half this city for the orcs. I still owe him for the boat ride, and he hasn't forgot." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Middle of the desert, hot as a boiler, and the finest engineers in the world per square foot. Also the most craters." } },
    thrall = { { id = "tp_thrall", text = "The big guy? Pays his contracts in full and on the day. Never met a king or a prince who did that, so yeah, I'm a fan." } },
    venture_company = { { id = "tp_venture", text = "Those guys give goblins a bad name, and that takes real effort. Strip a place, burn what's left, skip town. No repeat business in that." } },
    advice = { { id = "tp_ad", text = "Measure twice, light once, and always know which way you're gonna run. That last one's the important one." } },
    _none = { { id = "tp_none", text = "No clue, pal. If it don't have moving parts, it's outside my department." } },
  },
}

---------------------------------------------------------------------------
-- Godan: enchanting trainer, Godan's Runeworks, the Drag.
---------------------------------------------------------------------------
P:NPC {
  key = "godan", id = TODO_NPC("Godan"), name = "Godan", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet", "intent" }, values = { "craft", "curious" },
  notices = { "craft", "kit" },
  impression = {
    first = "Godan keeps the Runeworks in the Drag and teaches enchanting in a voice that never rises. He handles a glowing shard and a rusted buckle with the same care, and says most of what he knows he learned by breaking things on purpose.",
    third = "{name} met Godan, the orc who teaches enchanting at Godan's Runeworks in Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Runeworks. Touch nothing that glows, and if something that did not glow begins to, tell me at once." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "There is dust on your cuffs, and it is the right kind. Come to the bench, and show me the last thing you took apart." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. The runes I showed you will have faded by now, so we begin by looking at how." },
    { id = "g_away", when = { away = 14 }, text = "It has been some time. The world leaves a residue on those who travel it, and you have a good deal on you." },
  },
  notice = {
    { id = "n_gear", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is close to failing. I could set a rune in it, but a rune in cracked metal is a candle in a broken lantern, so see a smith first." },
    { id = "n_mage", cat = "craft", when = { class = "MAGE" },
      text = "A mage. You spend your power in an instant, and I spend mine persuading it to stay. We ought to understand each other better than we do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Godan. I teach the setting of magic into steel, hide and cloth, so that it stays when the caster has gone home. It is a patient craft, and the first half of it is learning to destroy things carefully." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "I am Godan, and you are already of the craft. Then you know its sorrow, which is that everything we learn, we learn by unmaking something another hand made well." },
      },
      again = {
        { id = "h_again", text = "Ask. I can listen while the rune sets." },
        { id = "h_again2", text = "There is more you would know. Good." },
        { id = "h_again3", text = "Speak quietly, if you would. The shards are sensitive to noise, or I am." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "Why must you destroy a thing to learn from it?", next = "unmake" },
        { text = "Orc enchanters can't have been common before.", next = "orcs" },
        { text = "Who works the Runeworks with you?", next = "shop" },
        { text = "What would you set into a weapon like mine?", next = "weapon", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "SHAMAN", "PALADIN" } } },
        { text = "This looks close to what warlocks do with souls.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your runes.", next = "END" },
      },
    },
    unmake = {
      lines = { { id = "un_default", text = "Because the magic in a made thing is knotted into it, and there is no reading a knot without untying it. I take a blade that someone enchanted, and I draw the magic out as dust and essence, and in the drawing I feel how it was tied. The blade does not survive the lesson." } },
      choices = {
        { text = "Does that ever trouble you?", next = "unmake2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unmake2 = {
      lines = { { id = "un2_default", text = "Every time, a little. A grunt brought me his father's axe last winter, a fine old piece with a rune I had never seen, and asked what it was worth. I could have had the secret of that rune for the price of the axe. I told him it was worth keeping, and sent him home." } },
      choices = {
        { text = "You gave up the knowledge.", next = "unmake3" },
        { text = "Something else, Godan.", next = "BACK" },
      },
    },
    unmake3 = {
      big = true,
      lines = { { id = "un3_default", text = "I did, and I think of that rune often. But the axe had come through the camps hidden in a roof-beam, and the father had not. Some things are knotted to more than magic, and I have not yet learned a way to draw that out as dust." } },
      choices = {
        { text = "Some knowledge isn't worth what it would cost.", next = "BACK", reply = "No. I am glad to hear another say it, because the craft itself never will.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The rune would have served many. The axe serves one.", next = "BACK", reply = "That is true, and I knew it as I spoke. I chose the one. I would again, and I do not claim it was wise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "They were not. The old clans had shaman to bless a weapon and, later, warlocks to curse one, and neither wrote anything down. What I teach I pieced together from Forsaken who had studied in Dalaran, from a goblin text bought at ruinous cost, and from a great deal of dust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "sh_default", text = "Jhag takes the beginners, and has more patience with them than I do. Kithas keeps the rods, vials and dusts for sale, and keeps the accounts, which I am not permitted near. The Drag is loud outside the door, but the three of us have made it quiet within." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    weapon = {
      lines = {
        { id = "we_default", text = "I would ask how you fight before I answered. A rune of striking for one who ends things quickly, and a rune that feeds the wielder for one who must endure. Most ask for the brightest glow, and I tell them a glow is only the magic leaking." },
        { id = "we_rogue", when = { class = "ROGUE" }, text = "For you, nothing that shines. There are runes that sit dark in the steel and wake only when it bites, and those are the ones your trade wants. They cost more, because they are harder, and because nobody admires them." },
      },
      choices = { { text = "No glow, then. Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "It is nearer than I like. You draw the essence from a living thing, and I draw it from a made one, and the shard you carry and the shard on my bench are cousins. I keep to objects. I would ask you not to tell me how the other is done." } },
      choices = {
        { text = "The line you keep is the right one.", next = "BACK", reply = "It is the only one I have. I hold it carefully.", fx = { align = { light = 1 } } },
        { text = "A craftsman shouldn't fear to know his own craft.", next = "BACK", reply = "Perhaps not. But I have seen where that sentence leads, and I learned my trade in its ashes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "Much of what I know came from there by way of the dead. I would give a great deal to read one of its books with my own eyes." } },
    forsaken = { { id = "tp_forsaken", text = "They taught me without warmth and without holding back. I have had kinder teachers who told me less." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's hammer needs nothing from me. I looked at it once, across a hall, and it was already full." } },
    second_war = { { id = "tp_second_war", text = "The warlocks bound dead men's souls into dead men's bodies and called them knights. That was an enchantment too, and I do not forget it." } },
    advice = { { id = "tp_ad", text = "A glow is only magic leaking. Buy the enchantment you cannot see." } },
    _none = { { id = "tp_none", text = "I have not taken that apart, and so I do not understand it." } },
  },
}
