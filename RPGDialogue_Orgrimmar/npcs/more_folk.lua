-- More of Orgrimmar: Sagorne Creststrider and Sian'tsu (shaman trainers in Grommash Hold), Zamja (cooking,
-- the Drag), Thuwd (skinning, the Drag), Handor and Tor'phan (cloth and leather, the Drag), Kor'jus and
-- Muragus (mushrooms and staves, the Cleft of Shadow), Shan'ti (fruit), Stone Guard Zarg and Brave Stonehide
-- (the Hall of Legends). Voices: bibles/more_folk.md
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
    thrall = { { id = "tp_thrall", text = "The Warchief wears black plate that was Doomhammer's. Under it there's a wolf-pelt mantle, and whoever skinned that wolf knew the trade." } },
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
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. You'll want the soft leather, the kind that doesn't creak, and I've got it if you've got the coin." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in my shop, and you're looking at the kodo hides as if you knew them. Don't tell me, I'd rather not know." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 30 } },
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
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! The robes on the left are cut for spellwork, with room in the sleeves so your hands move freely." },
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
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "You and Handor don't get along?", next = "handor" },
        { text = "Magar doesn't like selling?", next = "magar" },
        { text = "I'll look elsewhere.", next = "END" },
      },
    },
    handor = {
      big = true,
      lines = { { id = "ha_default", text = "We get along fine, so long as he keeps to his side of the Drag. A city this size has room for two armor shops, but only one of them can be the best, and it isn't his." } },
      choices = {
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
  },
  topics = {
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
      },
      choices = {
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "You don't mind living down here?", next = "cleft" },
        { text = "Mushrooms only mostly safe?", next = "safe" },
        { text = "You look like you never see the sun.", next = "sun" },
        { text = "Good day, Kor'jus.", next = "END" },
      },
    },
    cleft = {
      big = true,
      lines = { { id = "cl_default", text = "The Cleft gets a bad name, because of the warlocks and the shadowy types, but the Warchief lets them stay so long as they keep his law. My neighbours keep to themselves and pay on time, which is more than I can say for some in the Drag." } },
      choices = {
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
  },
  topics = {
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
      },
      choices = {
        { text = "Show me your staves.", next = "BUSINESS" },
        { text = "What does a warlock want in a staff?", next = "locks" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "Not today, Muragus.", next = "END" },
      },
    },
    locks = {
      big = true,
      lines = { { id = "lo_default", text = "Something that holds a spell without splitting, and something that looks frightening, which matters to them more than it should. I sell to them because their coin is good and the Warchief allows them, but I don't ask what they do with my wood." } },
      choices = {
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
  },
  topics = {
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
      },
      choices = {
        { text = "Let me see the fruit.", next = "BUSINESS" },
        { text = "Where does fruit come from, in Durotar?", next = "where" },
        { text = "Orcs don't eat fruit?", next = "orcs" },
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
        { text = "You're right. A strong Horde eats well.", next = "BACK", reply = "Tell that to the grunts in the Hold, would you? They might listen to someone with an axe.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them eat what they like. They've earned it.", next = "BACK", reply = "They have, I won't argue that. I'll just keep the fruit out, in case they change their minds.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
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
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Every axe on these walls was made for one like you, and every one of them must still be earned." },
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
      },
      choices = {
        { text = "Let me see the weapons.", next = "BUSINESS" },
        { text = "What makes a High Warlord?", next = "warlord" },
        { text = "Who are the legends honored here?", next = "legends" },
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
      choices = { { text = "Something else, Zarg.", next = "BACK" } },
    },
  },
  topics = {
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
      },
      choices = {
        { text = "Let me see what you keep.", next = "BUSINESS" },
        { text = "Why does a tauren serve here?", next = "why" },
        { text = "Do ranks matter on a battlefield?", next = "ranks" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the Horde is my tribe now as much as Thunder Bluff is, and Cairne sent braves to fight beside the orcs in Warsong Gulch and Alterac. Someone must keep the honors of those braves, and I asked to be that one." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
  },
  topics = {
    _none = { { id = "tp_none", text = "That is beyond my knowing, traveler. Perhaps the elders could help you." } },
  },
}
