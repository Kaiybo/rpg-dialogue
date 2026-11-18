-- The Park: Stormwind's kaldorei, a druid and an herbalist among the trees inside the walls.
-- Voices: bibles/park.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sheldras Moontree: balance inside stone walls.
P:NPC {
  key = "sheldras", id = TODO_NPC("Sheldras Moontree"), name = "Sheldras Moontree", title = "Druid Trainer",
  prejudice = { class = "MAGE", amount = 8, why = "Kaldorei memory of the Sundering; polite but cool to arcanists." },
  bible = "bibles/park.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "form", "priest", "kaldorei" },
  impression = {
    first = "Sheldras Moontree teaches druids under the trees of Stormwind's Park and insists that peace can be found even inside stone walls. He seemed amused by the city and fond of it all the same.",
    third = "{name} met Sheldras Moontree, a night elf druid who teaches in Stormwind's Park.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Peace, {class}, though I'll ask you to keep your spells sheathed under these trees. The last time your kind of magic was loved this much, the sea swallowed my people's capital." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, and welcome. I've watched you walk the park without a spark at your fingers, and I find I've stopped bracing when you come near." },
    { id = "g_balance", text = "Even within stone walls, there is peace, if you look for it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Ishnu-alah, young druid. Sit beneath the leaves a moment." },
    { id = "g_moonglade", when = { questActive = TODO_QUEST("Moonglade") }, text = "Moonglade waits for you. It is patient; be less so." },
  },

  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "You've walked into a human city wearing another shape, and the guards haven't run screaming. That is progress, for them and for us." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest of the human Light, come to the trees. Your Cathedral rings a bell at sunset for my people, did you know? It is a kindness I never thanked them for." },
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Far from Teldrassil, aren't we both? I come here when the walls feel close; the trees are young and human-planted, but they try very hard." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I care for them the way you'd care for a forge left burning in a hayloft. My people drank deep of the arcane once, and the Well of Eternity tore the world in two because of it, and I see the same hunger in the young ones from the Mage Quarter." } },
      choices = {
        { text = "Magic needs rules and study, not fear. That's what we practise.", next = "prej_a", fx = { align = { order = 1 } } },
        { text = "Then I'll learn what the wild can teach me instead.", next = "prej_b", fx = { align = { order = -1 } } },
        { text = "What did you lose, Sheldras?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Rules and study, yes, and the Highborne had libraries finer than anything in Stormwind. I hope your rules hold better than theirs did, but I shall keep watching all the same." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Then you're wiser than most who walk out of that tower. The wild doesn't ask you to master it, only to listen, and the listening takes longer than any spell." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "A sister, a city I barely remember, and the shape of the coast I grew up on. It was a long time ago, but grief keeps poorly in a people who live so long." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    xpt_sheldras = {
      big = true,
      lines = { { id = "xpt_sheldras_default", text = "Not at first, for your kind talk quickly and build quickly and forget quickly, and we do none of those things. But a company is a small forest of its own, and in time the roots find each other, if nobody insists on pulling them up to check." } },
      choices = {
        { text = "We should learn your patience. It would serve us well.", next = "BACK", reply = "Perhaps it would, though I don't wish your people slow. Only a little more listening, and a little less hammering.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Quickness keeps us alive. Your people could learn that from us.", next = "BACK", reply = "Perhaps we could, and Teldrassil may be proof that we are trying. I will think on that, young one.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We share a listening, I think, though we answer different voices. Cenarius taught us; I wonder who taught you." } },
      choices = {
        { text = "The earth teaches us all. That's enough kinship for me.", next = "BACK", reply = "It is enough for me as well. Go with the earth beneath you, and with whatever spirits listen when you call.", fx = { align = { light = 1 } } },
        { text = "Our paths are different. Let them stay apart.", next = "BACK", reply = "As you wish, though I think the earth would laugh at us both for the distinction. Go in peace.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "There is balance in everything, though some things find it more easily than others, and yours is the hard road. A hunter in the forest takes only what it must, and when it takes more, the forest notices; the city notices too, though it is slower to answer." },
      },
      choices = {
        { text = "Then I'll take only what I must, Sheldras.", next = "BACK", reply = "Then the forest will keep a place for you, even in this city of stone. Walk lightly.", fx = { align = { honor = 1 } } },
        { text = "The city's slow, Sheldras. I'll take what I like.", next = "BACK", reply = "The city is slow, but it is not deaf, and neither is the forest. Remember that when you are taken in turn.", fx = { align = { honor = -1 } } },
        { text = "Something else, Sheldras.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because my people once drank too deeply of it, and the world still remembers the wound, though few of the young ever learn why. I don't ask you to put your magic down, only to remember that it has a cost the world pays, and not always you." } },
      choices = {
        { text = "I'll use it carefully, Sheldras, and remember the cost.", next = "BACK", reply = "That is all I ask, and more than most of your Quarter would give. Elune guide your hands.", fx = { align = { light = 1 } } },
        { text = "The arcane is a tool. The world can bear it.", next = "BACK", reply = "My ancestors said the same, the night before the Well tore the world apart. I hope you are wiser than they were.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I fear what it hungers for, which is everything this Park was planted to protect. The Legion's servants were driven from this world once at a terrible price, and every door you open invites them back a little further." } },
      choices = {
        { text = "Then I'll open my doors rarely, and close them firmly.", next = "BACK", reply = "Then perhaps this Park will forgive your coming, in time. I will hold you to your word.", fx = { align = { light = 1 } } },
        { text = "The Legion's servants serve me now. That's the difference.", next = "BACK", reply = "So they always seem, until they don't. I will not stand between you and your choices, but I will watch them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every creature can, though warriors find it hardest, because they live in the place where rage and discipline meet. The Sentinels of my people learn to let their fury go silent before they draw their glaives, and they fight the better for it." } },
      choices = {
        { text = "I'll learn to fight with a calm heart.", next = "BACK", reply = "Then you will learn in a season what took me a century under Elune's moon. The Sentinels would welcome a warrior who carries it.", fx = { align = { order = 1 } } },
        { text = "My anger is my strength. I won't silence it.", next = "BACK", reply = "Then guard it well, and know it may one day guard you no longer. Rage has no loyalty.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everything that burns must rest, or it burns out, and I've seen your kind wear themselves thin in the name of duty. Even the moon wanes, and Elune is no weaker for it." } },
      choices = {
        { text = "Duty needs discipline, and discipline needs rest. You're right.", next = "BACK", reply = "You learn more quickly than most of your order. Rest tonight, then, and burn brightly tomorrow.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Evil doesn't rest, Sheldras, and neither will I.", next = "BACK", reply = "Then you will burn out, young paladin, and evil will have one less foe to fear. I hope you prove me wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_sheldras", tags = { "news" }, when = { party = { race = "NightElf" } },
          text = "You travel with one of my people, I see. {companion} still smells of moss and rain, even here among the stones, and I'd guess they make the city feel a little less like a cage to you as well." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the human Light. You carry it like a lantern held high, young one, and I wonder whether you ever let it rest." },
        { id = "h_default", text = "I am Sheldras Moontree. Even within cold stone walls like these, one may find tranquillity, and in truth you may find it anywhere at all, if you look inside yourself for balance. The Park only makes it easier." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You are far from the Cenarion Circle, young one, and closer than you think. Every druid carries the Dream with them, even through the gates of a human city." },
        { id = "h_moonglade", key = true, tags = { "news" }, when = { class = "DRUID", questBefore = TODO_QUEST("Moonglade") },
          text = "It is time you saw Moonglade, where the Circle meets and every druid is welcome. The way there is a spell you'll soon know, and the journey is one you'll never quite finish." },
        { id = "h_child", tags = { "news" }, when = { questRecent = { TODO_QUEST("Child of Nature"), days = 3 } },
          text = "So you've learned the first lesson, that nature isn't a thing you stand apart from. Good. The rest of the lessons are only the first one, said more slowly." },
        { id = "h_human", when = { race = "Human" },
          text = "Your people planted these trees inside your walls, which tells me you missed the forest even while you were building against it. I find that very human, and rather touching." },
        { id = "h_dusk", when = { timeOfDay = "dusk" },
          text = "Listen: the Cathedral's sunset bell. Your priests ring it for my people, so we remember the day is ending. In Darnassus we'd only look at the sky." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "The arcane hums off you like a beehive, young one, and the trees lean away from it a little. They mean no offence by it, and neither do I." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There is something burning in your shadow, young one, and the birds have gone quiet in the branches above you. Sit, if you wish, but sit gently." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the Park. Let the stillness of this place ease your shoulders a little; you carry your anger high, as your kind often do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You walk like a cat in the undergrowth, and I suspect the city has taught you that. Come and stand among the trees a while." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who listens to the earth. The druids would call it kin to our own path, though rougher. Welcome to the Park." },
      },
      again = {
        { id = "h_again", text = "What else would you ask beneath the leaves?" },
        { id = "h_again2", text = "Go on. The trees and I are in no hurry." },
      },
      choices = {
        { text = "You don't care for mages, do you, Sheldras?", next = "prej", when = { prejudiced = true } },
        { text = "Train me, Sheldras.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why live in a human city?", next = "city" },
        { text = "I'm not sure I understand balance.", next = "balance" },
        { text = "Is there a sacred place for druids, Sheldras?", next = "moonglade" },
        { text = "Your Elune must differ from our Light.", next = "light", when = { class = "PRIEST" } },
        { text = "What should I practise hardest, Sheldras?", next = "practise", when = { class = "DRUID" } },
        { text = "Should druids take sides in the Alliance's wars?", next = "war", when = { class = "DRUID" } },
        { text = "My people honour the winds more than Elune.", next = "skyborne", when = { race = "Skyborne", class = "DRUID" } },
        { text = "Do you mind a hunter's beast in your Park?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The city's other teachers must seem strange to you.", next = "others" },
        { text = "Humans planted these trees for you, didn't they?", next = "human", when = { race = "Human" } },
        { text = "Why do the trees shy from the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can a warrior find balance, Sheldras?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you fear what I've summoned, Sheldras?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a paladin's Light ever rest, Sheldras?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is there balance in what I do, Sheldras?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think shamans and druids share a path, Sheldras?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Does a night elf feel at home in a company of humans?", next = "xpt_sheldras", when = { party = { race = "NightElf" } } },
        { text = "Peace be with you.", next = "END" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "Because the Alliance is a long word for a short friendship, and someone must stand in it and listen. The humans need to see that we're not ghosts in the trees, and I need to remember that walls aren't only prisons." } },
      choices = {
        { text = "Are you welcome here?", next = "city_welcome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_welcome = {
      big = true,
      lines = { { id = "cw_default", text = "Mostly. The children ask whether I sleep in the trees, and the guards ask whether my cat bites. Some of the older folk remember that elves meant the quel'dorei, and they look at me as if I've come to the wrong house." } },
      choices = {
        { text = "The Alliance is stronger with you here.", next = "BACK", reply = "I believe it too, most days. Even the guards have stopped asking whether my cat bites.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Every people should keep to its own lands.", next = "BACK", reply = "Some of my own people would agree with you, and they would tell me to go home. But Teldrassil is far, and here the trees need tending.", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "The wolf and the deer, the storm and the calm, growth and decay, each answering the other. Nature doesn't take sides, young one; it keeps the scales level, and a druid's work is to help when they tip." } },
      choices = {
        { text = "Sometimes one side is simply evil.", next = "balance_evil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance_evil = {
      big = true,
      lines = { { id = "be_default", text = "Then it is no longer part of nature, and we fight it, the Burning Legion and its servants most of all. But a hungry wolf is not evil, and a forest fire is not evil, and much harm is done by people who cannot tell the difference." } },
      choices = {
        { text = "Some things are simply evil.", next = "BACK", reply = "Some things are, yes, and the Legion first among them. I only ask that you be certain before you name a thing so.", fx = { align = { light = 1 } } },
        { text = "Nothing is evil, only hungry.", next = "BACK", reply = "That is a generous view, and mostly true. But I have seen the Legion's work, and hunger does not explain it.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "A sacred vale in the north of Kalimdor, between Felwood and Winterspring, where the Cenarion Circle gathers and where no blood is spilled. Every druid goes there, sooner or later, and comes back a little quieter.",
        fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "Could I go there, not being a druid?", next = "moonglade_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade_go = {
      lines = { { id = "mg_default", text = "Anyone may walk there who comes in peace, though the road is long and passes through a sick forest. Bring nothing you'd be ashamed to set down, because Moonglade has a way of making you set things down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "Elune is the Mother Moon, and your Light, I think, is something more like a promise. Both are kind to those who suffer, and both have been used as an excuse by those who caused it. I like your bell, at least." } },
      choices = {
        { text = "The Light and Elune can stand together.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The Light is the only truth.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Changing back. Every young druid practises the bear and the cat until they're proud of them, and forgets that the hardest shape to return to is your own." },
        { id = "practise_old", when = { minLevel = 40 },
          text = "Choosing. You can heal, and claw, and call the moon's fire now, and the forest won't tell you which it needs; listen longer before you act, and you'll be right more often." },
      },
      choices = {
        { text = "Why is my own shape the hardest?", next = "practise_own" },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise_own = {
      lines = { { id = "practise_own_l", text = "Because the beast never doubts, and you do. Some of my people stayed too long in the wild shapes, once, and forgot how to come back at all." } },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    war = {
      big = true,
      lines = { { id = "war_l", text = "The Circle says we serve the balance, not a banner, and there are tauren in it as well as kaldorei. Yet Ashenvale burns where the orcs cut, so every druid in the Alliance answers that question alone." } },
      choices = {
        { text = "The balance comes before any banner.", next = "BACK", reply = "That is the Circle's teaching, and you speak it well. Ashenvale will need such druids before long.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll stand with the Alliance, Circle or not.", next = "BACK", reply = "Then stand there, and stand well. The Circle would ask only that you remember the forest is not a banner.", fx = { align = { order = 1 } } },
        { text = "Tauren in the Circle?", next = "war_tauren" },
      },
    },
    war_tauren = {
      lines = { { id = "war_tauren_l", text = "Archdruid Hamuul Runetotem's people, and good druids, many of them. Meet one in Moonglade and you'll find the war matters much less there than it does in Ashenvale." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skyborne = {
      lines = {
        { id = "skyborne_l", text = "So I've heard, and the Circle has heard it too. You come to the Dream by a different road than we do, and I don't understand that road, but you're welcome on it." },
        { id = "skyborne_nightclaw", when = { origin = "skyborne_nightclaw" },
          text = "And you learned from druids who kept their own counsel even among your own people, I think. I won't ask what you were told never to speak of; you're welcome on the path all the same." },
      },
      choices = {
        { text = "The winds and the moon needn't quarrel.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Our ways are our own, Sheldras.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_l", text = "Not at all; the beast is better behaved than the pigeons. A hunter and a druid want the same thing from a forest, and only argue over how much to take from it." },
        { id = "hunter_human", when = { race = "Human" },
          text = "A human hunter, and that is still rare enough that I'll stop to say so. The beast is better behaved than the pigeons; a hunter and a druid only argue over how much to take from a forest." },
      },
      choices = {
        { text = "I take only what I need.", next = "BACK", reply = "Then you and I want the same thing, and we will not argue. Go with the forest's blessing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I take what the hunt gives me.", next = "BACK", reply = "The hunt gives a great deal to those who do not ask how much. Take care it does not ask for something back.", fx = { align = { order = -1 } } },
      },
    },
    others = {
      lines = { { id = "others_l", text = "The priests ring their bell for me, the mages ask if I can grow reagents faster, and the warriors in Old Town ask if I can turn into a bear for their tavern wagers. I've said no to all of it except the bell." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    human = {
      lines = { { id = "human_l", text = "Not for me; they were here before I came, planted by your grandparents' grandparents. I think your people built a city of stone and then grew lonely in it, and I find that hopeful." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    elune = { { id = "tp_elune", text = "Elune watches over all living things, even those who live inside stone walls, and I've found her light in this Park every night. The humans think it's only the moon, and that's well enough." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Emerald Dream is the world as it was meant to be, untouched by the hands of mortals, and the druids walk it in their sleep. Something troubles it lately, and I've felt it in my own dreams." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil was the World Tree, and it gave our people immortality until it gave its strength to stop the Legion. Now we're as mortal as you, and I've found it makes the days sweeter." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion Stormrage is the greatest of our druids, and he sleeps in the Emerald Dream while the world goes on without him. I hope he wakes soon, because the Circle needs his voice." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind is the high priestess of Elune and the leader of our people, and she waits for Malfurion to wake. Her patience is longer than your kingdom's history, and still it's being tested." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons guard the Emerald Dream, and Ysera is their mother and queen. They watch over the great trees where the Dream touches our world, and they've no patience for anyone who disturbs them." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the last furbolgs untouched by corruption, and they guard their tunnels in Felwood and Winterspring. I'd count them friends, though they'd not count me one until I proved it." } },
    knows = {
      { id = "tp_knows", text = "The trees of this park hear every whisper on these paths, and so do I, sitting among them. Ask what you will." },
    },
    background = { { id = "tp_bg", text = "A druid of the Cenarion Circle who has spent longer among humans than he expected to. The trees here are young; perhaps I am keeping them company." } },
    advice = { { id = "tp_ad", text = "Look inside yourself for balance before you look for it in the world. The world is very noisy, and you are much quieter than it." } },
    cenarion_circle = { { id = "tp_circle", text = "The Cenarion Circle is the druids of Kalimdor, sworn to the balance, and they meet in Moonglade.", next = "moonglade" } },
    teldrassil = { { id = "tp_teldrassil", text = "Teldrassil is our new world-tree, rising off Kalimdor's northern coast, and I miss its shade even here." } },
    _none = { { id = "tp_none", text = "I don't know, and I'm content not to. Not every question needs to be caught." } },
  },
}

-- Shylamiir: an herbalist with no patience and a great deal of skill.
P:NPC {
  key = "shylamiir", id = TODO_NPC("Shylamiir"), name = "Shylamiir", title = "Herbalism Trainer",
  bible = "bibles/park.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "proud", "curious" },
  notices = { "herbalist", "druid" },
  impression = {
    first = "Shylamiir greeted me as an interruption and then decided I might be useful. She is the finest herbalist in the Park and quite certain of it, and she wants a plant from inside Dalaran's walls.",
    third = "{name} met Shylamiir, a night elf herbalist in Stormwind's Park who doubts anyone's skill matches her own.",
  },

  greetings = {
    { id = "g_work", text = "I hope this interruption is for a good cause, because I was busy, and I have been busy since long before this city's first stone was laid." },
    { id = "g_sample", when = { questActive = TODO_QUEST("A Green Sample") }, text = "Well? Did you get into Dalaran, or did the Kirin Tor shoo you off?" },
  },

  notice = {
    { id = "n_herbalist", cat = "herbalist", when = { profession = "Herbalism" },
      text = "Another herbalist, hmm. I doubt your skill matches mine, but I can teach you a few proper techniques, so you'll at least stop tearing the roots." },
    { id = "n_druid", cat = "druid", when = { class = "DRUID" },
      text = "A druid. Then you'll know why I can't stand the way humans pick flowers: by the stem, all at once, as if the plant had done something to them." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "One that grows only behind its walls, and I'll not say which until I trust you. The spirits might help, if they're not too crude." } },
      choices = {
        { text = "I'll respect your secrets, Shylamiir, and help where I can.", next = "BACK", reply = "Good. That is the right beginning, and perhaps one day I will show you where the silverleaf grows.", fx = { align = { order = 1 } } },
        { text = "Crude spirits find what refined ones miss.", next = "BACK", reply = "Perhaps they do, and I have been unkind. Still, my secrets are mine until I know your hands.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Perhaps, if you can tell me why the grave moss growing outside the Slaughtered Lamb is twice the size of any I have found in Elwynn's crypts. I suspect the answer, and I do not like it, but a herbalist should know what feeds the things she studies." },
      },
      choices = {
        { text = "I'll tell you what I know, and leave the moss alone.", next = "BACK", reply = "Then you are more sensible than I feared. Leave the moss to me, and I will let you know what feeds it.", fx = { align = { light = 1 } } },
        { text = "Whatever feeds it is my business, Shylamiir.", next = "BACK", reply = "Then I will find out on my own, as I always do, and I will not thank you for the trouble.", fx = { align = { light = -1 } } },
        { text = "Something else, Shylamiir.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It does, which is exactly why I want Dalaran's garden, because mana seeps into the soil and the roots drink it like rain. The Mage Quarter's own window boxes grow stranger every year, and nobody there has noticed but me." } },
      choices = {
        { text = "Magic shouldn't seep into living things. It's unnatural.", next = "BACK", reply = "You sound like a Sentinel, and they are not wrong. But the roots do not ask permission, and nor will I.", fx = { align = { light = 1 } } },
        { text = "Stranger is often stronger, Shylamiir. Let it grow.", next = "BACK", reply = "That is exactly what I think, and it is why the Circle frowns at me. Thank you for being on my side.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cuttings from gardens whose owners won't share, mostly, and the nobles of this city keep some very jealous gardens. I've never stolen a leaf in my life, and I'm beginning to think that's been a mistake." } },
      choices = {
        { text = "A garden's owner deserves to be asked first.", next = "BACK", reply = "That is how my people were raised, and how I still try to live. The humans do not always return the courtesy.", fx = { align = { honor = 1 } } },
        { text = "A cutting isn't really theft. The plant won't mind.", next = "BACK", reply = "The plant may not, but its owner will, and some of them keep dogs. I prefer asking, and waiting, and asking again.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Peacebloom for small wounds and earthroot for bruises, and briarthorn if you can stand the smell. On Teldrassil, the Sentinels carry a little pouch of each, and they rarely need a priest." } },
      choices = {
        { text = "I'll learn the herbs and carry my own.", next = "BACK", reply = "Good. Then you will not need to bleed in front of a priest who sighs at you.", fx = { align = { order = 1 } } },
        { text = "That's why we have priests and potions.", next = "BACK", reply = "And when the priest is dead and the potions broken, you will wish you had a pouch of earthroot. Learn them anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Silverleaf, which should never grow in a human city, and a kind of moss that only grows where water runs underground. The humans planted this Park for its beauty, and the land quietly decided to grow something useful in it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Silverleaf, which should never grow in a human city, and a kind of moss that only grows where water runs underground. Your {pet} walks carefully among the roots. It understands, I think, that a garden should be walked through, not over." },
      },
      choices = {
        { text = "We should take from the land only what we need.", next = "BACK", reply = "That is the kaldorei way, and the only way a forest lives long. I am glad to hear it from a human mouth.", fx = { align = { light = 1 } } },
        { text = "The land is there to be used. Take what you can.", next = "BACK", reply = "Then the land will remember you as the orcs' axes are remembered in Ashenvale. Take care what you leave behind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I need someone who can get behind Dalaran's wards without being burned to a cinder, and you're as likely as anyone, I suppose. The plants inside those walls drank more magic than any in Kalimdor, and I want to see what it did to them." } },
      choices = {
        { text = "Those plants belong to Dalaran. We should ask permission.", next = "BACK", reply = "You are welcome to ask, and the violet mages are welcome to ignore you, as they have ignored me. I admire your manners, at least.", fx = { align = { order = 1 } } },
        { text = "If the plants are there, I'll fetch them. Wards be hanged.", next = "BACK", reply = "I like you a great deal more than I expected. Mind the wards, paladin, for your Light will not stop them biting.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You've trampled two of my seedlings already, so stand still and tell me what you want." },
        { id = "h_default", text = "Shylamiir. I train herbalists, when they can be trained, and in between I study what grows here, which is more than you would think for a park the humans planted only a few lifetimes ago." },
        { id = "h_sample", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("A Green Sample"), minLevel = 40 },
          text = "If you're going to bother me, you can make yourself useful. Dalaran has a surprising interest in botany for a city of mages, and I'd very much like a sample of whatever grows in their central garden." },
        { id = "h_sample_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Green Sample") },
          text = "The Kirin Tor keep to themselves behind that barrier of theirs, but you seem comfortable going where you're not wanted. Find a way in, and bring me whatever is growing in the middle." },
        { id = "h_sample_done", when = { questDone = TODO_QUEST("A Green Sample") },
          text = "That blossom is wrong in a dozen fascinating ways; the mana has twisted it into something the Kirin Tor surely never planted on purpose. I haven't slept, and I'm delighted." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. Your healers in the Cathedral buy my peacebloom by the basket and never once ask how it grows. You might, as a novelty." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and the Sanctum's apprentices trample my silverleaf every time they cut through the Park. You might mention it to them, since they won't listen to me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so I'll assume you know your way into places that aren't yours. I may have work for you one day, though I'd rather not admit it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You walk past the herbs as if they were nothing, as warriors always do, and yet you'll be grateful for them when you bleed." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Then you've walked through more of the world than most who come to this Park, and you'll know how to look at what grows underfoot." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, in my Park. The peacebloom will close if you linger, so be quick, and be useful if you can manage it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, which is an interruption, but perhaps a useful one. Do your spirits know where plants grow best, or only where the stone is loudest?" },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it quickly, then, for I have centuries of work ahead of me and would like to begin it today." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Herbalism" } },
        { text = "Not much wild can grow in a park like this.", next = "grows" },
        { text = "Why do you want Dalaran's plants?", next = "dalaran", when = { any = { { questActive = TODO_QUEST("A Green Sample") }, { questDone = TODO_QUEST("A Green Sample") }, { heardLine = "shylamiir.h_sample" } } } },
        { text = "Peacebloom seems fussy about where it grows.", next = "peacebloom", when = { class = "PRIEST" } },
        { text = "I'd think magic changes how your plants grow.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would a herbalist want from a rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which herbs should a warrior carry, Shylamiir?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What grows here that surprises you, Shylamiir?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you need help gathering herbs, Shylamiir?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a warlock be useful to an herbalist, Shylamiir?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What plant do you want from Dalaran, Shylamiir?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance", any = { { questActive = TODO_QUEST("A Green Sample") }, { questDone = TODO_QUEST("A Green Sample") }, { heardLine = "shylamiir.h_sample" } } } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "g_default", text = "Elwynn's ordinary weeds, mostly, and peacebloom where the humans haven't trampled it, and a little silverleaf by the pond that I'm watching very closely. Every city park is an experiment nobody meant to run." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    dalaran = {
      big = true,
      lines = { { id = "d_default", text = "Because nobody else has seen what centuries of mana in the soil does to a living thing, and the Kirin Tor won't tell anyone. Knowledge kept behind a barrier is knowledge wasted, and I don't care how many archmagi disagree." } },
      choices = {
        { text = "Agreed. Knowledge shouldn't be locked away.", next = "dalaran_more", fx = { align = { order = -1 } } },
        { text = "The Kirin Tor have their reasons.", next = "dalaran_more", fx = { align = { order = 1 } } },
        { text = "You must expect to find something there.", next = "dalaran_more" },
      },
    },
    dalaran_more = {
      lines = { { id = "dm_default", text = "Something changed, something that drinks magic instead of water, perhaps. If it's dangerous, better that a herbalist understands it than a mage who only knows how to set it on fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peacebloom = {
      lines = { { id = "pb_default", text = "In sunlight, near running water, and only where the ground has been left alone for a season. That's why there's so much in Elwynn and so little in Westfall now; a field that's been fought over forgets how to grow gentle things." } },
      choices = {
        { text = "That's sad, and true.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "There's a plant that grows only in the gardens of Dalaran, and I mean to have a cutting before I die. The Kirin Tor won't open their gates, and I'm sure it's to keep me out personally." } },
    elune = { { id = "tp_elune", text = "Elune blesses every herb that grows by moonlight, and I pick mine only after dark for that reason. The humans think I'm mad, and they buy my herbs anyway." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Emerald Dream holds plants that would make your herbalists weep, and I've seen a few of them in my sleep. I've tried to find them when I wake, and I never can, which is very annoying." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil was the World Tree, and the herbs that grew at its roots had no equal anywhere. I'd go to Hyjal to see what's left, if the guardians there would let me." } },
    teldrassil = { { id = "tp_teldrassil", text = "Teldrassil is our home now, and its herbs are fine, though not as fine as Nordrassil's. I don't say that in front of the druids, because they're sensitive about it." } },
    knows = {
      { id = "tp_knows", text = "I know plants, and the people who walk through the Park on their way to somewhere else. Ask, but make it worth my time." },
    },
    background = { { id = "tp_bg", text = "I tended the groves of Ashenvale for longer than this city has stood, and now I study the herbs here, which I know better than anyone in this city. What more would you need to know?" } },
    advice = { { id = "tp_ad", text = "Take the leaf and leave the root. Then there's something to pick next year." } },
    _none = { { id = "tp_none", text = "If it isn't a plant, I don't care, and I have had a very long life in which to decide what deserves my care." } },
  },
}
