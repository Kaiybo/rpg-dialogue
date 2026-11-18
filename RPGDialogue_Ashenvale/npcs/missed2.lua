-- Ashenvale's missed folk, Horde side: Andruk, Kil'Hiwana and Wik'Tar at Zoram'gar Outpost; Ertog Ragetusk,
-- Fahrak, Framnali, Har'alen, Pixel and Vera Nightshade at Splintertree Post; Feran Strongwind at the camp
-- southwest of it; and two Forsaken in the wilds, Apothecary Falthis at Bathran's Haunt and Darkslayer
-- Mordenthal at the Forsaken camp. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Andruk: wind rider master at Zoram'gar Outpost.
P:NPC {
  key = "andruk", id = TODO_NPC("Andruk"), name = "Andruk", title = "Wind Rider Master", gender = "male",
  bible = "bibles/missed.md", role = "flightmaster", tier = "service",
  communities = { "zoramgar" }, temper = { "gruff", "steady" }, values = { "dutiful", "loyal" },
  notices = { "travel", "class" },
  impression = {
    first = "Andruk keeps the one wind rider roost at Zoram'gar Outpost, with the sea at his back and elves in every tree. He is a gruff orc who talks to his beasts more gently than he talks to anyone on two legs.",
    third = "{name} met Andruk, the wind rider master of Zoram'gar Outpost.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. If you need wings, say where, and do not waste my beasts' time." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back to the Strand alive. Good, because the wind riders remember who treats them well." },
  },
  notice = {
    { id = "n_tauren", cat = "travel", when = { race = "Tauren" },
      text = "You are a heavy one, tauren. My riders will carry you, but you will hear about it from them the whole way to the Crossroads." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Andruk, and these wind riders are the only quick way out of Zoram'gar. The road east runs through elf country from end to end, so when the naga push too hard, my beasts are how the wounded leave." },
      },
      again = {
        { id = "h_again", text = "What else? The beasts are restless." },
        { id = "h_again2", text = "Speak, then, and be quick." },
      },
      choices = {
        { text = "I need a wind rider.", next = "BUSINESS" },
        { text = "How do the beasts like the coast?", next = "coast" },
        { text = "This outpost feels cut off.", next = "cutoff" },
        { text = "Do the elves shoot at your riders?", next = "elves" },
        { text = "Strength and honor, Andruk.", next = "END" },
      },
    },
    coast = {
      lines = { { id = "c_default", text = "They hate the salt and they love the fish, so it comes out even. A wind rider is a beast of the dry cliffs, and I oil their wings every night so the sea air does not stiffen them." } },
      choices = {
        { text = "You take good care of them.", next = "care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = { { id = "ca_default", text = "A warrior cares for his axe, and these are worth more than any axe. In the camps we had nothing of our own, and I swore that whatever the Horde gave into my hands afterwards would never want for anything.", fx = { learn = { "internment" } } } },
      choices = { { text = "A good oath. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cutoff = {
      lines = { { id = "cu_default", text = "It is cut off, and Karang Amakkar holds it anyway, which is why I follow him. We have naga in front, elves behind and a handful of tents between, and still the Warchief's banner stands on this beach." } },
      choices = { { text = "Then it is in good hands. Something else.", next = "BACK" } },
    },
    elves = {
      lines = { { id = "e_default", text = "They try, when we fly low over Astranaar, so we do not fly low over Astranaar. Their archers are good, and I will say so, but a wind rider above the treetops is a hard mark even for an elf." } },
      choices = { { text = "I will keep my head down. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came out of the camps with Thrall's Horde and learned the wind riders in Durotar. I go where the beasts are needed." } },
    internment = { { id = "tp_int", text = "The humans penned us for years, and we let ourselves rot there. Thrall woke us, and I do not forget it." } },
    _none = { { id = "tp_none", text = "I know wings and weather. Take that question to Karang Amakkar." } },
  },
}

-- Kil'Hiwana: fishing trainer at Zoram'gar Outpost, beside Wik'Tar.
P:NPC {
  key = "kilhiwana", id = TODO_NPC("Kil'Hiwana"), name = "Kil'Hiwana", title = "Fishing Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "zoramgar" }, temper = { "patient", "sly" }, values = { "patience", "tradition" },
  notices = { "profession", "race" },
  impression = {
    first = "Kil'Hiwana teaches fishing on the Zoram Strand and watches her float as though it were telling her a long story. She is a Darkspear with a slow smile, and she swears the naga have made the fishing better.",
    third = "{name} met Kil'Hiwana, the fishing trainer of Zoram'gar Outpost.",
  },
  greetings = {
    { id = "g_default", text = "Hush now, mon, and walk soft on de sand. The fish hear a heavy foot from a long way off." },
    { id = "g_back", when = { metBefore = true }, text = "You be back on the Strand, {class}. The tide been asking after you." },
  },
  notice = {
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" },
      text = "I see de callus on your casting thumb, mon. A fisher knows a fisher, and you be welcome at my bit of shore." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear on this cold beach, same as me! I be Kil'Hiwana, and I teach the fishing here, the way our people did it on the Echo Isles before the sea witch took dem from us." },
        { id = "h_default", text = "I be Kil'Hiwana, and I teach the fishing to anyone with the patience for it. The sea feeds this whole outpost, mon, so there is no warrior here too proud to hold a pole when I tell him to." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon?" },
        { id = "h_again2", text = "Ask it soft. I got a nibble coming." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What bites off the Zoram Strand?", next = "bites" },
        { text = "The naga cannot be good for fishing.", next = "naga" },
        { text = "Who is the troll beside you?", next = "wiktar" },
        { text = "Tight lines, Kil'Hiwana.", next = "END" },
      },
    },
    bites = {
      lines = { { id = "b_default", text = "Oily blackmouth out past the rocks, and firefin snapper when the water is warm. The blackmouth is ugly as a murloc and worth twice as much, because the alchemists pay for de oil." } },
      choices = {
        { text = "What is the trick to catching them?", next = "trick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick = {
      lines = { { id = "t_default", text = "You wait, and then you wait some more, and you never pull on the first tug because that one be the fish asking a question. Pull on the second, when it has made up its mind." } },
      choices = { { text = "The second tug. Something else.", next = "BACK" } },
    },
    naga = {
      lines = { { id = "n_default", text = "You would think so, but the naga scare the big fish up into the shallows, right onto my hook. I thank them for it every morning, from far away, with Marukai standing between us.", fx = { learn = { "blackfathom" } } } },
      choices = { { text = "A wise distance. Something else.", next = "BACK" } },
    },
    wiktar = {
      lines = { { id = "w_default", text = "That be Wik'Tar, and he sells what I catch and a good deal of what I do not. He talks more than a fisher should, but he never yet scared off a customer, only the fish." } },
      choices = { { text = "A fair partnership. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fished the Echo Isles as a girl. When the Darkspear followed Thrall, my pole came with me." } },
    echo_isles = { { id = "tp_echo", text = "Our old home, lost to Zalazane and his voodoo now. The fishing there was the best I ever knew." } },
    _none = { { id = "tp_none", text = "The sea did not tell me dat one, mon. Go and ask Je'neu, who listens to the water better than me." } },
  },
}

-- Wik'Tar: fish merchant and fishing supplies at Zoram'gar Outpost, beside Kil'Hiwana.
P:NPC {
  key = "wiktar", id = TODO_NPC("Wik'Tar"), name = "Wik'Tar", title = "Fish Merchant & Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "zoramgar" }, temper = { "talkative", "cheerful" }, values = { "trade", "humor" },
  notices = { "profession", "race" },
  impression = {
    first = "Wik'Tar sells fish and fishing gear at Zoram'gar Outpost and never stops talking while he does it. Kil'Hiwana, who stands beside him, has plainly given up trying to hush him.",
    third = "{name} met Wik'Tar, the fish merchant of Zoram'gar Outpost.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon, come and look! Fresh from de Strand this morning, and I only dropped one of dem in the sand." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer be back! I say that to everybody, but with you I nearly mean it." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, and a hungry one. Your people eat fish like it be a punishment, mon, so let Wik'Tar show you a good one for once." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Wik'Tar, and I sell the fish, the poles, the lines and the bait, everything but the patience. For that you got to see Kil'Hiwana here, who has enough of it for the two of us." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I can talk all day." },
        { id = "h_again2", text = "Go on, ask! Kil'Hiwana says I never listen, so prove her wrong." },
      },
      choices = {
        { text = "Show me what you are selling.", next = "BUSINESS" },
        { text = "Who buys fish at an outpost like this?", next = "buys" },
        { text = "Kil'Hiwana says you scare the fish.", next = "scare" },
        { text = "What bait works on this shore?", next = "bait", when = { profession = "Fishing" } },
        { text = "Good selling, Wik'Tar.", next = "END" },
      },
    },
    buys = {
      lines = { { id = "b_default", text = "Everybody, mon, because there is nothing else to eat unless you fancy boiled naga. Karang's warriors come for supper, and the adventurers heading down into Blackfathom buy a sack so they do not go hungry in the dark.", fx = { learn = { "blackfathom" } } } },
      choices = {
        { text = "What do you hear about Blackfathom?", next = "deeps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deeps = {
      lines = { { id = "d_default", text = "That plenty go down and not so many come up, and the ones who do come up do not want fish for a week. Je'neu says there be something old and bad in that water, and I believe him, because my fish swim away from it." } },
      choices = { { text = "I will remember that. Something else.", next = "BACK" } },
    },
    scare = {
      lines = { { id = "s_default", text = "She be right, and I do not mind it. One of us got to be quiet and catch dem, and one of us got to be loud and sell dem, and I know which job I was born for." } },
      choices = {
        { text = "You were born for it, no doubt.", next = "BACK", reply = "Ha! You hear dat, Kil'Hiwana? A person of taste on our beach.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "A shiny bauble for the snapper, and nightcrawlers for the blackmouth, who be too ugly to care about pretty things. I sell both, and I will not tell you which rock to stand on, because that is Kil'Hiwana's secret." } },
      choices = { { text = "Then I will ask her. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sold fish in Sen'jin Village before this, mon. The fish be colder here, and the customers be braver." } },
    blackfathom = { { id = "tp_bfd", text = "The old elf ruin under the water, north along the Strand. The naga love it, and that tells you enough." } },
    _none = { { id = "tp_none", text = "Wik'Tar knows fish and gossip, and dat is neither. Try Karang, or Je'neu if it be a spirit thing." } },
  },
}

-- Ertog Ragetusk: Splintertree Post. Classic: Torek's Assault is reported to him.
P:NPC {
  key = "ertog_ragetusk", id = TODO_NPC("Ertog Ragetusk"), name = "Ertog Ragetusk", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "shrewd", "hearty" }, values = { "honor", "strength" },
  notices = { "class", "pvp" },
  impression = {
    first = "Ertog Ragetusk plans Splintertree's raids against the Silverwing elves and enjoys the planning nearly as much as the fighting. He has a hearty respect for his enemies and intends to beat them all the same.",
    third = "{name} met Ertog Ragetusk at Splintertree Post, who plans the Warsong's raids on the night elf outposts.",
  },
  greetings = {
    { id = "g_default", text = "Lok'tar, {class}. Come and look at this map, and tell me where you would strike." },
    { id = "g_assault", when = { questActive = TODO_QUEST("Torek's Assault") }, text = "You are the one riding with Torek? Then stop standing here, for he will start the fight without you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Torek's Assault") }, text = "The one who went in with Torek and came out again! The elves at Silverwing are still counting their dead, and I am still grinning." },
    { id = "g_back", when = { metBefore = true }, text = "You return, {class}. Good, for I have moved three stones on the map since you left." },
  },
  notice = {
    { id = "n_kills", cat = "pvp", when = { honorKills = { min = 50 } },
      text = "You have the look of one who has fought the Alliance and liked it. Sit, and tell me how their soldiers break, because I collect such things." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_report", when = { questDone = TODO_QUEST("Torek's Assault") }, text = "Torek tells me you held the line when the Sentinels struck back. He is loud, but he does not lie about a fight, so you have my respect and Splintertree's." },
        { id = "h_default", text = "I am Ertog Ragetusk, and I decide where the Warsong's raiders go when they ride out of this post. Torek and his kind do the bleeding, and I see that they bleed in the right place." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The map can wait a moment." },
        { id = "h_again2", text = "Ask it. I think better while I am talking." },
      },
      choices = {
        { text = "What do you think of the elves as fighters?", next = "elves" },
        { text = "Where are the raiders striking?", next = "strike" },
        { text = "Torek says you do the thinking.", next = "torek" },
        { text = "Where would a warrior be most use?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Victory to you, Ragetusk.", next = "END" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "They are worthy foes, lean as saplings and twice as hard to break. They fight for every tree as if it were a child of theirs, and an enemy who cares that much is one you can be proud to have beaten.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "You sound as if you like them.", next = "like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    like = {
      lines = { { id = "l_default", text = "I respect them, which is better. We stood beside them on Hyjal against the Legion, and I remember how they fought, so I do not make the mistake of thinking this will be quick." } },
      choices = {
        { text = "Then why fight them at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Orgrimmar is built of this forest's timber, and Durotar grows nothing but rock and thorn. The elves will not sell us one branch, so the Warsong take what the Horde must have, and I see that we lose as few as we can in the taking.", fx = { learn = { "warsong" } } } },
      choices = { { text = "That is plain enough. Something else.", next = "BACK" } },
    },
    strike = {
      lines = { { id = "s_default", text = "Silverwing Outpost, to the south, where their Sentinels gather to harry our lumber camps. Torek leads the assault, and the plan is simple enough that even he cannot lose it on the way." } },
      choices = { { text = "Simple plans survive. Something else.", next = "BACK" } },
    },
    torek = {
      lines = { { id = "t_default", text = "Ha! He says it as an insult, and I take it as my due. Torek is the finest raider at this post, and he would charge the moon if someone told him an elf lived there, so somebody must point him." } },
      choices = { { text = "He is lucky to have you. Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "wa_default", text = "At the front of Torek's column, where the first arrows land. I will not flatter you, {class}, for it is the worst place to stand, and it is where one good shield arm saves five raiders behind it." } },
      choices = { { text = "Then that is where I will stand.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought under Hellscream when the Warsong first came to this forest. I learned then that a raid is won before it rides." } },
    warsong = { { id = "tp_war", text = "Grom's clan, and mine. We cut the lumber that builds the Horde, and we hold what we cut." } },
    sentinels = { { id = "tp_sen", text = "The elves' warriors, women nearly all, and deadly. Do not laugh at them until they are down." } },
    _none = { { id = "tp_none", text = "That is not on my map. Ask Kuray'bin, who keeps his ears open." } },
  },
}

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

-- Pixel: a goblin supplier at Splintertree Post. Classic: Satyr Horns, Warsong Saw Blades.
P:NPC {
  key = "pixel", id = TODO_NPC("Pixel"), name = "Pixel", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "pushy", "cheerful" }, values = { "profit", "deals" },
  notices = { "purse", "class" },
  impression = {
    first = "Pixel is a goblin who delivers supplies all over the world and has parked a load of saw blades at Splintertree until somebody pays for them. She is cheerful, fast-talking and entirely unmoved by the Warsong's glaring.",
    third = "{name} met Pixel, a goblin supplier at Splintertree Post who would not release her saw blades without payment.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, a customer! Step right up, pal, because I've got saw blades, I've got overhead, and I've got about five minutes." },
    { id = "g_horns", when = { questActive = TODO_QUEST("Satyr Horns") }, text = "You got my horns yet, sweetheart? I've got a buyer in Ratchet tapping his foot, and every tap is costing me interest." },
    { id = "g_blades", when = { questDone = TODO_QUEST("Warsong Saw Blades") }, text = "My favourite paying customer! See how easy that was? Goods for payment, everybody's happy, nobody gets axed." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, pal? Good, because the blades are still here and so is the invoice." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Whoa, whoa, I can hear that purse from here, friend. You and me should talk business sometime, real business." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_horns", when = { questActive = TODO_QUEST("Satyr Horns") }, text = "Satyr horns, pal, the real thing, off the uglies up at Satyrnaar or Night Run. Bring me a good stack and we'll call it payment in kind, and those blades are as good as delivered." },
        { id = "h_default", text = "Name's Pixel, and I deliver anything to anywhere, so long as the customer pays on arrival. I've got a wagonload of Warsong saw blades sitting right here, and the Warsong seem to think 'for the Horde' is a form of currency." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Clock's running." },
        { id = "h_again2", text = "Listen, listen, ask quick, I've got a route to keep." },
      },
      choices = {
        { text = "What will it take to release the blades?", next = "blades" },
        { text = "The orcs cannot be pleased with you.", next = "orcs" },
        { text = "You deliver all over the world?", next = "route" },
        { text = "Locke Okarr is losing sleep over those blades.", next = "locke" },
        { text = "An engineer knows parts are never free.", next = "goblin", when = { profession = "Engineering" } },
        { text = "Good business to you, Pixel.", next = "END" },
      },
    },
    blades = {
      lines = { { id = "b_default", text = "Payment, friend, it's a real simple concept, and I'm flexible on the form. Coin's nice, but I've got a buyer who pays silly money for satyr horns, so bring me horns and I'll knock it off the Warsong's account." } },
      choices = {
        { text = "Who pays for satyr horns?", next = "horns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horns = {
      lines = { { id = "h_horn", text = "A fella in Ratchet who grinds 'em up for somethin' I didn't ask about, on account of asking is bad for margins. All I know is the satyrs up north grow 'em for free and he pays by the pound, and that's my favourite kind of arithmetic.", fx = { learn = { "satyrs" } } } },
      choices = {
        { text = "Satyrs do not give up horns willingly.", next = "willing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    willing = {
      lines = { { id = "w_default", text = "Which is why I'm subcontracting, pal! You handle the collection side, with the stabbing and so forth, and I handle the logistics, and nobody has to see me anywhere near a demon." } },
      choices = { { text = "A tidy division of labour. Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Oh, they glare somethin' fierce, and one big fella suggested just taking the crate. So I explained that the Cartel stops delivering to folks who do that, everywhere, forever, and he remembered his manners real quick." } },
      choices = { { text = "A persuasive argument. Something else.", next = "BACK" } },
    },
    route = {
      lines = { { id = "r_default", text = "Ratchet to Booty Bay to Gadgetzan and every mud hole between, wherever there's a buyer and a road. Steamwheedle's neutral, friend, so I've sold rope to elves and axes to orcs in the same week, and both paid up front." } },
      choices = { { text = "No loyalty to either side?", next = "loyal" }, { text = "Something else.", next = "BACK" } },
    },
    loyal = {
      lines = { { id = "lo_default", text = "I'm loyal to whoever's holding the receipt, pal, and I never once shorted an order, which is more than most patriots can say. Time is money, and I don't waste either on picking sides." } },
      choices = { { text = "At least you are honest. Something else.", next = "BACK" } },
    },
    locke = {
      lines = { { id = "l_default", text = "Locke's a good egg and he keeps beautiful lists, I mean it, I'd hire him. But his list says 'blades received' and mine says 'payment pending', and until those two match, the crate stays nailed shut." } },
      choices = { { text = "Then I will see you paid. Something else.", next = "BACK" } },
    },
    goblin = {
      lines = { { id = "g_gob", text = "Finally, somebody who reads the small print! You tinker, I can tell by the scorch marks, so you know a blade don't cut itself and a wagon don't roll for free." } },
      choices = { { text = "Parts cost money. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ratchet born, Cartel licensed, never late. That's the whole brochure, pal." } },
    warsong = { { id = "tp_war", text = "Big spenders on axes, slow payers on everything else. I love 'em anyway, they go through blades like candy." } },
    satyrs = { { id = "tp_sat", text = "Ugly, mean, and wearing my profit margin on their heads. Up north, Satyrnaar way." } },
    _none = { { id = "tp_none", text = "No idea, friend, and there's no money in guessing. Try Kuray'bin, he hears things for free." } },
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
