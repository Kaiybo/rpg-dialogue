-- Ashenvale's missed folk, Horde side: Andruk, Kil'Hiwana and Wik'Tar at Zoram'gar Outpost; Ertog Ragetusk,
-- Fahrak, Framnali, Har'alen, Pixel and Vera Nightshade at Splintertree Post; Feran Strongwind at the camp
-- southwest of it; and two Forsaken in the wilds, Apothecary Falthis at Bathran's Haunt and Darkslayer
-- Mordenthal at the Forsaken camp. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Fahrak: an orc of Splintertree Post.
P:NPC {
  key = "fahrak", id = TODO_NPC("Fahrak"), name = "Fahrak", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "splintertree" }, temper = { "blunt", "restless" }, values = { "strength", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Fahrak is an orc of Splintertree Post who sharpens his axe whenever he has nothing to hit with it. He is blunt, restless and tired of waiting behind a palisade for the elves to come to him.",
    third = "{name} met Fahrak, a restless orc warrior at Splintertree Post.",
  },
  greetings = {
    { id = "g_default", text = "What do you want, {class}? Unless you bring word of a fight, make it short." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you have seen battle since we spoke, because I have not." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, with an edge that has been used. Good, for there are too many at this post who carry axes like walking sticks." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Fahrak. I came to Ashenvale to fight elves, and instead I guard wagons and count logs, so forgive me if I am poor company." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak. The axe is sharp enough for now." },
      },
      choices = {
        { text = "You sound eager for a battle.", next = "eager" },
        { text = "What is there to fight around here?", next = "fight" },
        { text = "Guarding wagons is honest duty.", next = "duty" },
        { text = "Lok'tar, Fahrak.", next = "END" },
      },
    },
    eager = {
      lines = { { id = "e_default", text = "I was too young for Hyjal, and I heard the tale of it from warriors with scars I had not earned. Every orc at this post has a story, and I have a whetstone." } },
      choices = {
        { text = "Stories come to those who wait.", next = "wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wait = {
      lines = { { id = "w_default", text = "So the old ones say, and then they go back to their fire. Ertog tells me a raider who cannot wait is a dead raider, and I am trying to believe him before an arrow teaches me." } },
      choices = { { text = "Believe him. Something else.", next = "BACK" } },
    },
    fight = {
      lines = { { id = "f_default", text = "Elves in the trees, who shoot and vanish. Satyrs to the north, at Satyrnaar, who at least stand still, and demons at Felfire Hill beyond them, if you want an enemy nobody will weep for.", fx = { learn = { "satyrs" } } } },
      choices = { { text = "I may visit the satyrs. Something else.", next = "BACK" } },
    },
    duty = {
      lines = { { id = "d_default", text = "It is, and I do it, and I do not have to like it. Mastok counts every wagon that comes through the gate, and the day one goes missing on my watch I will wish I had been bored." } },
      choices = { { text = "Then stay bored a while. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in the camps and freed as a whelp. I have been trying to earn it ever since." } },
    warsong = { { id = "tp_war", text = "The clan that holds this forest. I would be prouder of it with an elf's glaive on my wall." } },
    _none = { { id = "tp_none", text = "I do not know and I do not care. Ask Ertog, who cares about everything." } },
  },
}

-- Framnali: a Darkspear troll at Splintertree Post.
P:NPC {
  key = "framnali", id = TODO_NPC("Framnali"), name = "Framnali", gender = "female",
  bible = "bibles/missed.md", role = "villager", tier = "service",
  communities = { "splintertree" }, temper = { "wry", "watchful" }, values = { "spirits", "clever" },
  notices = { "class", "race" },
  impression = {
    first = "Framnali is a Darkspear troll at Splintertree Post who leans in the shade and misses nothing. She says the forest has more spirits in it than the orcs have axes, and she does not think the orcs have noticed.",
    third = "{name} met Framnali, a watchful Darkspear troll at Splintertree Post.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon. Come stand in de shade a while, because nobody thinks straight in the sun." },
    { id = "g_back", when = { metBefore = true }, text = "There you be again. The trees been whispering about you, and it was not all bad." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" }, faction = "Horde" },
      text = "You hear dem too, don't you? This forest be thick with spirits, and they are not happy with what the saws be doing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear face among all these orcs, and about time. I be Framnali, and I been keeping an eye on this place for the tribe, since somebody has to watch what the watching don't see." },
        { id = "h_default", text = "I be Framnali of the Darkspear. The orcs came here for the wood, and I came because where the orcs go, somebody ought to be listening for what they stir up." },
      },
      again = {
        { id = "h_again", text = "What else you want, mon?" },
        { id = "h_again2", text = "Ask. I got the whole day and a good patch of shade." },
      },
      choices = {
        { text = "What have the orcs stirred up?", next = "stirred" },
        { text = "How do the Darkspear find Ashenvale?", next = "ashenvale" },
        { text = "You do not seem busy.", next = "busy" },
        { text = "Can the spirits here be calmed?", next = "spirits", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "Stay out of the sun, Framnali.", next = "END" },
      },
    },
    stirred = {
      lines = { { id = "s_default", text = "Old things, mon. Every tree they drop had something living in it besides the birds, and those somethings got nowhere to go now but round and round the stumps at night." } },
      choices = {
        { text = "Have you told the overseers?", next = "told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    told = {
      lines = { { id = "t_default", text = "I told dem, and they laughed, and then one saw crew would not go back to the east camp after dark. Now they do not laugh so loud, but the Horde still needs its lumber, so the saws keep going." } },
      choices = { { text = "A hard bargain. Something else.", next = "BACK" } },
    },
    ashenvale = {
      lines = { { id = "a_default", text = "It be a jungle with no heat in it, and that feels wrong in the bones. Still, we be a people who lost our islands, and Thrall gave us a place, so when the Horde needs trolls in a cold forest, here we be.", fx = { learn = { "darkspear" } } } },
      choices = { { text = "The Horde is lucky in its trolls. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    busy = {
      lines = { { id = "b_default", text = "That be what watching looks like, mon. An orc works with his arms where all can see, and a troll works with her eyes, and at the end of de day I know more about this post than Ertog does." } },
      choices = { { text = "I believe it. Something else.", next = "BACK" } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "Maybe, by somebody who asks nice and brings dem something. I leave a little offering by the north gate every night, and the ones near the post be quieter for it, but I am one troll with one bowl." } },
      choices = { { text = "I will leave one too. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I be Darkspear, from Sen'jin Village. I go where the tribe wants eyes." } },
    darkspear = { { id = "tp_dark", text = "My tribe, mon. Vol'jin leads us, and we stand with Thrall because he stood with us." } },
    _none = { { id = "tp_none", text = "I been watching, and I did not see dat. Ask Kuray'bin, he watches the other half." } },
  },
}

-- Har'alen: a tauren at Splintertree Post.
P:NPC {
  key = "haralen", id = TODO_NPC("Har'alen"), name = "Har'alen", gender = "female",
  bible = "bibles/missed.md", role = "villager", tier = "service",
  communities = { "splintertree" }, temper = { "gentle", "troubled" }, values = { "nature", "balance" },
  notices = { "class", "race" },
  impression = {
    first = "Har'alen is a tauren at Splintertree Post who looks at the forest the way the others look at the lumber. She is loyal to the Horde and troubled by the saws, and she manages both with a great deal of quiet.",
    third = "{name} met Har'alen, a thoughtful tauren at Splintertree Post.",
  },
  greetings = {
    { id = "g_default", text = "The winds bring you to Splintertree, {class}. Rest a while, for there is good shade here, and there will be less of it each year." },
    { id = "g_back", when = { metBefore = true }, text = "You walk back into the post with the forest's dust on you. I hope it was kind to you." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", faction = "Horde" },
      text = "A {g:brother|sister} of the Cenarion Circle. Then you feel it as I do, each time a great trunk falls, like a drum that has stopped." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_tauren", when = { race = "Tauren" }, text = "It is good to see one of the Shu'halo so far from Mulgore. I am Har'alen, and I confess that I have missed the sound of our own speech among all this shouting." },
        { id = "h_default", text = "I am Har'alen. I came north with the Horde because Cairne gave his word to Thrall, and a tauren's word binds the whole herd, though this forest has given me a great deal to think about since." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, friend?" },
        { id = "h_again2", text = "Speak when you are ready. I am in no hurry." },
      },
      choices = {
        { text = "What troubles you about the forest?", next = "troubles" },
        { text = "You miss Mulgore.", next = "mulgore" },
        { text = "The Horde needs this lumber.", next = "lumber" },
        { text = "How does a druid serve here?", next = "druid", when = { class = "DRUID" } },
        { text = "Walk with the Earth Mother, Har'alen.", next = "END" },
      },
    },
    troubles = {
      lines = { { id = "t_default", text = "A hunter takes one kodo from the herd and the herd goes on. Here we take the whole herd, valley by valley, and I do not know what prayer one says to the Earth Mother for that." } },
      choices = {
        { text = "Have you spoken of it to the orcs?", next = "spoken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spoken = {
      lines = { { id = "s_default", text = "To Senani Thunderheart, who feels as I do, and to Kuray'bin, who listens. The Warsong hear only that I am soft, so with them I speak of where to cut and where to leave a grove standing, and sometimes they heed me." } },
      choices = { { text = "Then you do some good. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mulgore = {
      lines = { { id = "m_default", text = "I miss the open sky, where you can see the weather a day before it arrives. Under these trees it is always evening, and though it is beautiful, a plains-born heart never quite settles.", fx = { learn = { "cairne" } } } },
      choices = { { text = "May you see that sky soon. Something else.", next = "BACK" } },
    },
    lumber = {
      lines = { { id = "l_default", text = "It does, and I do not say otherwise. Orgrimmar's walls shelter my people as well as the orcs, and so I carry the trouble and the gratitude together, as one carries two full waterskins." } },
      choices = { { text = "That is a heavy load. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "By walking behind the saw crews and coaxing the seedlings up where they have passed. It is slow, and the Warsong think it foolish, but Yama Snowhoof's brother came here to do the same, and I pray he is found." } },
      choices = { { text = "I will plant where I can. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Bloodhoof, born beneath Thunder Bluff. I came because the herd was asked." } },
    cairne = { { id = "tp_cairne", text = "Our high chieftain, wise and strong. He bound us to the Horde, and I trust his reasons." } },
    _none = { { id = "tp_none", text = "The winds have not carried that to me. Ask Senani Thunderheart, who walks further than I." } },
  },
}

-- Vera Nightshade: a Forsaken at the inn of Splintertree Post.
P:NPC {
  key = "vera_nightshade", id = TODO_NPC("Vera Nightshade"), name = "Vera Nightshade", gender = "female",
  bible = "bibles/missed.md", role = "villager", tier = "service",
  communities = { "splintertree" }, temper = { "dry", "cold" }, values = { "forsaken", "curiosity" },
  notices = { "race", "class" },
  impression = {
    first = "Vera Nightshade is a Forsaken who keeps to the inn at Splintertree Post, where the orcs give her a wide berth and she seems to prefer it. She studies the living around her with a dry, patient interest.",
    third = "{name} met Vera Nightshade, a Forsaken who keeps to the inn at Splintertree Post.",
  },
  greetings = {
    { id = "g_default", text = "Yes? You may sit, if you must, though I warn you the orcs think this corner is unlucky." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Dark Lady watch over you. How pleasant to see a face here that does not flinch at mine." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still breathing, I notice. Do sit down." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You are standing rather far away, friend. I assure you that death is not catching, or not from me, at any rate." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Vera Nightshade, and you find me among allies who would rather I waited outside. We are useful to them, and they are useful to the Dark Lady, and I suppose that is as much friendship as our kind may expect." },
        { id = "h_default", text = "I am Vera Nightshade, of the Forsaken. Innkeeper Kaylisk feeds everyone who walks in under the Horde's colours, and since I do not eat, she is not certain what to do with me, so I sit and I observe." },
      },
      again = {
        { id = "h_again", text = "Was there something more?" },
        { id = "h_again2", text = "Do go on. I have nothing but time, as you may imagine." },
      },
      choices = {
        { text = "What brings a Forsaken to Ashenvale?", next = "brings" },
        { text = "The orcs do not seem to trust you.", next = "trust" },
        { text = "What do you observe?", next = "observe" },
        { text = "Does the Undercity miss you?", next = "undercity", when = { race = "Scourge" } },
        { text = "I will leave you to your corner.", next = "END" },
      },
    },
    brings = {
      lines = { { id = "b_default", text = "The Royal Apothecary Society has an interest in this forest, as it has in most living things. There are plants here found nowhere in Lordaeron, and some of my colleagues are already in the field, collecting." } },
      choices = {
        { text = "Collecting for what purpose?", next = "purpose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purpose = {
      lines = { { id = "p_default", text = "For the Dark Lady's purposes, which are not discussed in inns. You may take it that the Scourge will like the results even less than you would, and let that comfort you." } },
      choices = { { text = "It is cold comfort. Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "t_default", text = "They are not fools, then. An orc trusts what bleeds, and I gave that up some time ago, along with my house in Lordaeron and everyone who lived in it." } },
      choices = {
        { text = "I am sorry for what you lost.", next = "BACK", reply = "How novel. Keep your sorrow, for you will find better uses for it than I can." },
        { text = "Something else.", next = "BACK" },
      },
    },
    observe = {
      lines = { { id = "o_default", text = "That the living are extraordinarily loud, and that they fight over trees. I was alive once and cannot recall caring so much about timber, though perhaps I did, and it rotted away with the rest." } },
      choices = { { text = "A grim way to see it. Something else.", next = "BACK" } },
    },
    undercity = {
      lines = { { id = "u_default", text = "Nothing in the Undercity misses anyone, which is among its comforts. I shall return when the Society recalls me, and until then I have this charming corner and the smell of boar stew." } },
      choices = { { text = "Endure it well, sister.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I had a life in Lordaeron once, and then the Plague. What I am now serves the Dark Lady, and that suffices." } },
    _none = { { id = "tp_none", text = "I have not observed that, and I do not speculate. Ask one of the living, who are so fond of talking." } },
  },
}

-- Feran Strongwind: a tauren at the small camp southwest of Splintertree Post, with Gurda Ragescar.
P:NPC {
  key = "feran_strongwind", id = TODO_NPC("Feran Strongwind"), name = "Feran Strongwind", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "splintertree" }, temper = { "calm", "dry" }, values = { "patience", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "Feran Strongwind is a tauren who keeps the small camp southwest of Splintertree, where Gurda Ragescar frets over her shredder. He is as calm as she is anxious, and he watches the trees while she watches the machine.",
    third = "{name} met Feran Strongwind, a calm tauren at the camp southwest of Splintertree Post.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Come to the fire, but come quietly, for the forest listens here." },
    { id = "g_back", when = { metBefore = true }, text = "You find our little camp again. Sit, and I will tell you nothing has changed, which is good news." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", faction = "Horde" },
      text = "You carry yourself as one who reads sign. Then look at the moss on the north side of those trunks, and tell me who else has passed this way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_tauren", when = { race = "Tauren" }, text = "Ancestors watch over you, {g:brother|sister}. I am Feran Strongwind, and I keep this camp for the Warsong, though I think of it as keeping an orc from wandering off after her own machine." },
        { id = "h_default", text = "I am Feran Strongwind. Splintertree lies up the road, and this camp is its eyes on the southern trees, so I sit, and I watch, and I keep Gurda Ragescar from taking her shredder apart with a rock." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, friend. The fire has a while to burn yet." },
      },
      choices = {
        { text = "What do you watch for out here?", next = "watch" },
        { text = "Gurda seems worried about her machine.", next = "gurda" },
        { text = "A tauren beside a shredder is a strange sight.", next = "strange" },
        { text = "May the winds favor you, Feran.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Elf scouts, who move through the canopy and count our wagons. They are very good, but the birds go silent where they pass, and I have had a long life of listening to birds." } },
      choices = {
        { text = "What do you do when the birds go silent?", next = "silent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silent = {
      lines = { { id = "s_default", text = "I stand up, so that they can see that I have seen them, and most often they withdraw. A fight that is not fought costs no one a son, and the Earth Mother does not count it against a warrior." } },
      choices = { { text = "There is wisdom in that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gurda = {
      lines = { { id = "g_gurda", text = "She lost the pages that tell her how it works, and she fears her overseer more than she fears the elves. I cannot read goblin diagrams any better than she can, so I make tea and tell her the wind will bring the pages back." } },
      choices = { { text = "Perhaps I can help her. Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "st_default", text = "It is, and I have not made my peace with the thing. It eats a tree in the time it takes me to greet one, and I have asked to be posted where I can at least see which groves it is pointed at." } },
      choices = { { text = "Someone should watch it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted the plains of Mulgore before I came north with the Horde. Watching is the half of hunting I was always best at." } },
    warsong = { { id = "tp_war", text = "A fierce clan, and loyal. I wish they loved the forest half as much as they love the fight." } },
    _none = { { id = "tp_none", text = "The birds have not told me. Ask at Splintertree, where there are more mouths than at this fire." } },
  },
}

-- Apothecary Falthis: a Forsaken apothecary at Bathran's Haunt. (Forever: Apothecary's Concoction.)
P:NPC {
  key = "apothecary_falthis", id = TODO_NPC("Apothecary Falthis"), name = "Apothecary Falthis", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "clinical", "impatient" }, values = { "science", "forsaken" },
  notices = { "profession", "race" },
  impression = {
    first = "Apothecary Falthis works among the ruins of Bathran's Haunt, cutting specimens from plants the elves hold sacred. He regards the forest as a cabinet of ingredients and me as a possible pair of hands.",
    third = "{name} met Apothecary Falthis, a Forsaken apothecary gathering specimens at Bathran's Haunt in Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "Do not step on the samples. If the Horde has sent you, state your purpose, and if not, kindly stand somewhere less in my light." },
    { id = "g_concoction", when = { questActive = TODO_QUEST("Apothecary's Concoction") }, text = "You have my ingredients, I trust? The mixture will not wait, and neither, I assure you, shall I." },
    { id = "g_done", when = { questDone = TODO_QUEST("Apothecary's Concoction") }, text = "Ah, my assistant. The concoction is maturing nicely, and it has only killed two of the test rats so far." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "The Dark Lady's blessing. At last, someone who will not ask me whether the work is 'right'." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, for I have need of hands that are not my own." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know plants, or think you do. Then you will appreciate that nothing in Tirisfal has grown properly in years, and this forest has not yet learned to die." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_concoction", when = { questActive = TODO_QUEST("Apothecary's Concoction") }, text = "The concoction requires what I listed and nothing else, so resist the urge to improvise. Bring every item to me here, and take care that none of it is crushed." },
        { id = "h_default", text = "I am Apothecary Falthis, of the Royal Apothecary Society. The night elves buried something old in this place, and the plants that grow over it have properties I have seen nowhere else, so I am here to take them apart and learn why." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? My reagents are oxidising." },
        { id = "h_again2", text = "Ask it, and be concise." },
      },
      choices = {
        { text = "What is special about the plants here?", next = "plants" },
        { text = "What does the Society want with them?", next = "society" },
        { text = "The elves will not thank you for this.", next = "elves" },
        { text = "What became of whoever was buried here?", next = "bathran" },
        { text = "Apothecary to apothecary, what have you found?", next = "alch", when = { profession = "Alchemy" } },
        { text = "I will leave you to your samples.", next = "END" },
      },
    },
    plants = {
      lines = { { id = "p_default", text = "They are saturated with something, a residue of whatever magic the elves laid down here long ago. A cutting from this soil stays green in a sealed jar for weeks, and I should very much like to know what it would do in a body." } },
      choices = {
        { text = "In whose body?", next = "body" },
        { text = "Something else.", next = "BACK" },
      },
    },
    body = {
      lines = { { id = "b_default", text = "The Scourge's, ideally, since that is the Dark Lady's stated enemy. I begin with rats, proceed to whatever the forest supplies, and do not trouble the Society with details it has not requested." } },
      choices = { { text = "That is a chilling answer. Something else.", next = "BACK" } },
    },
    society = {
      lines = { { id = "s_default", text = "A new plague, naturally, one that will unmake Arthas's servants as his unmade us. Every apothecary in the field is looking for the ingredient that tips the formula, and I intend that it shall be found in my jars." } },
      choices = {
        { text = "And the others like you in Ashenvale?", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "There is a camp of ours to the south and east, where the brewing is done under Darkslayer Mordenthal's guard. He is a tiresome soldier who breaks glassware, and I am happier here among the ruins." } },
      choices = { { text = "I may pay him a visit. Something else.", next = "BACK" } },
    },
    elves = {
      lines = { { id = "e_default", text = "They have already sent archers to say so, and I have sent the archers back in a condition suitable for study. If they valued this place they ought to have guarded it before I arrived." } },
      choices = { { text = "You make enemies easily. Something else.", next = "BACK" } },
    },
    bathran = {
      lines = { { id = "ba_default", text = "Some druid of theirs named Bathran, as far as I can tell from the stones, though the inscriptions are too worn to say what he did. Whatever he was, he has made excellent compost." } },
      choices = { { text = "You have no reverence at all. Something else.", next = "BACK" } },
    },
    alch = {
      lines = { { id = "a_default", text = "That the residue survives distillation, which nothing living should. Reduce the root over a cold flame and you obtain a grey salt that will not dissolve, and I have a theory about it that I shall not be sharing with a competitor." } },
      choices = { { text = "A cold flame. I will remember that.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was an herbalist in Brill before the Plague. Death has improved my focus considerably." } },
    cenarion_circle = { { id = "tp_cc", text = "Druids, who believe plants have feelings. I have dissected a great many plants and found none." } },
    _none = { { id = "tp_none", text = "That is not my field, and I do not guess outside it. Ask at Splintertree." } },
  },
}

-- Darkslayer Mordenthal: a Forsaken soldier guarding the Forsaken camp in southeastern Ashenvale.
P:NPC {
  key = "darkslayer_mordenthal", id = TODO_NPC("Darkslayer Mordenthal"), name = "Darkslayer Mordenthal", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "ashenvale_road" }, temper = { "grim", "curt" }, values = { "forsaken", "vengeance" },
  notices = { "race", "class" },
  impression = {
    first = "Darkslayer Mordenthal guards the Forsaken camp in the south of Ashenvale, where the apothecaries brew behind him. He is a grim soldier with a rusted blade and a short answer for everything.",
    third = "{name} met Darkslayer Mordenthal, the Forsaken soldier who guards the apothecaries' camp in Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "Halt. This camp belongs to the Dark Lady, and you will touch nothing in it." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Dark Lady watch over you. You, at least, I need not explain the smell to." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Keep to the path between the tents, as before." },
  },
  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN" }, faction = "Horde" },
      text = "A healer. Do not waste your arts on me, for there is nothing here that wants mending." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Darkslayer Mordenthal. The apothecaries work, and I see that nothing living interrupts them, which in this forest means elves by day and worse things by night." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What are the apothecaries brewing?", next = "brewing" },
        { text = "What worse things come by night?", next = "night" },
        { text = "Darkslayer is a heavy title.", next = "title" },
        { text = "Guard it well, Darkslayer.", next = "END" },
      },
    },
    brewing = {
      lines = { { id = "b_default", text = "A disease, and a strong one. I am told it is meant for the Scourge, and I do not ask what else it might be meant for, because a soldier who asks the Society questions is soon assisting with the answers." } },
      choices = {
        { text = "Do the elves know of it?", next = "know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = { { id = "k_default", text = "They suspect, and their watchers at Forest Song send thieves to steal a sample. I have buried four of them beside the lake, which is more courtesy than they would show to me." } },
      choices = { { text = "Then your watch is no idle one. Something else.", next = "BACK" } },
    },
    night = {
      lines = { { id = "n_default", text = "There is a barrow den to the east, Dor'Danil, where the elves' druids once slept. They did not all wake in their right minds, and the ones that walk now do not care whose camp they wander into.", fx = { learn = { "emerald_dream" } } } },
      choices = { { text = "Mad druids. I will go carefully. Something else.", next = "BACK" } },
    },
    title = {
      lines = { { id = "t_default", text = "I was a soldier of Lordaeron, and the Scourge made me kill for it until the Dark Lady broke its hold. I have been repaying the Lich King ever since, one of his creatures at a time, and the title keeps the count." } },
      choices = {
        { text = "May the count grow long.", next = "BACK", reply = "It will. I have nothing else to do with eternity." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A soldier of Lordaeron once. Now a soldier of the Forsaken, and better at it." } },
    _none = { { id = "tp_none", text = "I guard a camp, and that is not part of it. Ask the apothecaries, if you can bear them." } },
  },
}
