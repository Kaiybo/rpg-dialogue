-- Shadowprey Village by the water: Drulzegar Skraghook (Other Fish to Fry), Innkeeper Sikewa,
-- Thalon (wind rider master at the end of the dock). Horde. Voice: bibles/shadowprey_docks.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Drulzegar Skraghook: troll fisherman, sole survivor of a naga ambush.
P:NPC {
  key = "drulzegar", id = TODO_NPC("Drulzegar Skraghook"), name = "Drulzegar Skraghook",
  bible = "bibles/shadowprey_docks.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "bitter", "haunted" }, values = { "loyal", "vengeful" },
  notices = { "race", "class", "deeds" },
  impression = {
    first = "Drulzegar Skraghook was the only one of his fishing crew to come home when the naga struck, and he has not fished since. He pays strangers to kill naga and it never seems to be enough, because the guilt isn't something a bounty can settle.",
    third = "{name} met Drulzegar Skraghook, the troll at Shadowprey who lost his whole crew to the Slitherblade naga.",
  },

  greetings = {
    { id = "g_default", text = "You be lookin' at the sea, mon? Don't. It looks back." },
    { id = "g_active", when = { questActive = TODO_QUEST("Other Fish to Fry") }, text = "The Slitherblade still be breathin'. Go fry dem, {class}, de myrmidons and de sorceresses and all de rest." },
    { id = "g_done", when = { questDone = TODO_QUEST("Other Fish to Fry") }, text = "You fried dem good, mon. Me crew be restin' a little easier, I think, though I don't sleep no better." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, and de naga been busy. Dey always be busy." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night be when dey came, mon, in de grey before mornin'. I don't sleep at night no more, so sit, if you want." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood. Den you know de sea gives and de sea takes, and you know a troll don't forget who took from him." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Ask de water spirits where me crew be, will you? Dey don't answer me, and I stopped askin'." },
    { id = "n_naga", cat = "deeds", when = { killed = { name = "Slitherblade", min = 19 } },
      text = "You smell of naga blood, mon, and I never smelled nothin' sweeter." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Drulzegar Skraghook. Maybe you heard, maybe you didn't: me crew and me were out fishin' near Ranazjar Isle, north of de wrecked ship up de coast, where we fished every season. De naga came out of de water one mornin' and killed every one of dem but me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Other Fish to Fry") },
          text = "Me conscience can't carry it, {class}. I need you to go and fry dem naga for me, de myrmidons and de sorceresses and de rest, and I'll make it worth your while." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Other Fish to Fry") },
          text = "I want seven of de Slitherblade naga, seven of de myrmidons and five of de sorceresses, and don't let de sorceresses talk to you, because dey talk sweet before dey bite." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Other Fish to Fry"), days = 3 } },
          text = "Nineteen of dem gone, mon, and me hands still shake. I thought it would feel like somethin', and it does, but not de thing I wanted." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De sea's not goin' anywhere." },
        { id = "h_again2", text = "Ask, den. Talkin' keeps me eyes off de water." },
      },
      choices = {
        { text = "What happened that morning?", next = "morning" },
        { text = "Who are the Slitherblade?", next = "naga" },
        { text = "How do I fight them underwater?", next = "bubbles" },
        { text = "Will killing them help?", next = "help" },
        { text = "Who were your crew?", next = "crew" },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "I'm sorry about your crew, Drulzegar.", next = "END", fx = { affinity = 1 } },
      },
    },

    morning = {
      lines = {
        { id = "mo_default", text = "It was foggy on de water, mon, and de nets were out, and Zul'tek was singin' like always to bring de fish. Den de singin' stopped, and de water came up over de side full of scales and spears, and I was in de sea before I knew it, and I swam." },
      },
      choices = {
        { text = "You swam away?", next = "morning_swam" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morning_swam = {
      lines = {
        { id = "ms_default", text = "I swam, mon, all de way to de wreck and hid in de hull till dark, listenin'. Dat's de part de others in de village don't say out loud, but I hear dem not sayin' it." },
      },
      choices = {
        { text = "Anyone would have swum.", next = "morning_judge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morning_judge = {
      big = true,
      lines = {
        { id = "mj_default", text = "Maybe, but anyone wasn't de one who lived. A Darkspear be supposed to stand by his crew, and I didn't, and now I pay strangers to do de standin' for me." },
      },
      choices = {
        { text = "Living isn't a crime. You survived to remember them.", next = "BACK", reply = "Ya, maybe, mon, and I tell myself dat every mornin', but it don't stop me hearin' dem in de waves.", fx = { align = { honor = -1 } } },
        { text = "Then stand now. Take up a spear yourself.", next = "BACK", reply = "You think I haven't tried, mon? Every time I pick one up, me hands shake like de boat did dat night.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    naga = {
      lines = {
        { id = "na_default", text = "Snake people from de deep sea, with too many arms and no mercy in dem. De Slitherblade nest on de isles to de north and up de coast, and dey been comin' further south every season, like dey be lookin' for somethin'." },
      },
      choices = {
        { text = "Looking for what?", next = "naga_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_what = {
      lines = {
        { id = "nw_default", text = "Nobody knows, mon. De old trolls say de naga were elves once, before de sea swallowed dem, and dat dey still remember de land dey lost. If dat be true, dey be wantin' it back, and dey don't care who be standin' on it." },
      },
      choices = {
        { text = "That's a grim thought.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bubbles = {
      lines = {
        { id = "bu_default", text = "If you be huntin' naga, you'll need all de help you can get. Deep in de water dere be bubbly fissures, cracks in de sea floor dat breathe out air, and if you swim up close you can breathe from de bubbles and keep fightin'." },
      },
      choices = {
        { text = "How did you learn that?", next = "bubbles_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bubbles_learn = {
      lines = {
        { id = "bl_default", text = "Every fisherman on dis coast knows it, and we keep it quiet, because de good fishin' be near de fissures. Jinar'Zillen'd skin me for tellin' you, but he ain't lost a crew, so he don't get a say." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    help = {
      big = true,
      lines = {
        { id = "he_default", text = "I've paid a lot of strangers to kill a lot of naga, mon, and some of dem never came back, and it never be enough. But I don't know what else to do with me hands, now dat dey don't hold nets no more." },
      },
      choices = {
        { text = "Vengeance is owed. Every naga pays.", next = "BACK", reply = "Ya, mon, every one, and I'll keep payin' till de sea runs out of dem or I run out of coin.", fx = { align = { light = -1 } } },
        { text = "This won't heal you. Mourn them instead.", next = "BACK", reply = "Mourn dem? Mon, I been mournin' for a year, and it don't make de naga any fewer.", fx = { align = { light = 1 } } },
        { text = "The naga I killed. Did it help at all?", next = "after", when = { questDone = TODO_QUEST("Other Fish to Fry") } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "A little, mon, de way a bandage helps a missing hand. I went down to de water last night for de first time since, and I stood dere a while, and I didn't run, and dat be somethin'." },
      },
      choices = {
        { text = "That's a start. Keep going back.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crew = {
      lines = {
        { id = "cr_default", text = "Five of dem: Zul'tek de singer, his brother Makazi, old Tanga who mended de nets, and two young ones who'd only come aboard dat spring. I took dem north because de fish were fatter dere, and dat was me choice, mon, not dere's." },
        { id = "cr_troll", when = { race = "Troll" }, text = "Five Darkspear, and you'd have liked dem: Zul'tek who sang, Makazi who laughed, Tanga who mended, and two young ones from de Echo Isles who'd never seen a naga before dat mornin'. I took dem north, mon, and dat was me choice." },
      },
      choices = {
        { text = "Do they have family here?", next = "crew_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_family = {
      lines = {
        { id = "cf_default", text = "Tanga's daughter cooks for Sikewa at de inn, and she brings me fish every evenin', and she never says nothin' about it. Dat's worse than shoutin', mon, you know dat?" },
      },
      choices = {
        { text = "Maybe it's kindness, not blame.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a fisherman, once. Now I be a troll who pays for naga heads." } },
    advice = { { id = "tp_ad", text = "Never turn your back on de water, mon. Never." } },
    _none = { { id = "tp_none", text = "I don't know, mon, and I don't care much, unless it be about naga." } },
  },
}

-- Innkeeper Sikewa: tauren innkeeper of Shadowprey Village.
P:NPC {
  key = "sikewa", id = TODO_NPC("Innkeeper Sikewa"), name = "Innkeeper Sikewa", title = "Innkeeper",
  bible = "bibles/shadowprey_docks.md", role = "innkeeper", tier = "service",
  communities = { "shadowprey" }, temper = { "warm", "wry" }, values = { "hospitality", "community" },
  notices = { "race", "weary", "drink" },
  impression = {
    first = "Innkeeper Sikewa runs a tauren inn in a troll village on the edge of a dead land, and she seems to find all of that more funny than sad. She knows everyone's business and keeps most of it.",
    third = "{name} met Innkeeper Sikewa, the tauren who keeps the inn at Shadowprey Village.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Shadowprey, {class}. The beds are dry, the cheese is fresh, and the trolls only sing until midnight, mostly." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the coast! Your bed's where you left it, and nobody's slept in it but a crab, and I chased him out." },
    { id = "g_home", when = { homeInn = true }, text = "Home again, {name}. That's what this inn is to you now, whether you meant it or not." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, so you'll feel at home in this village, and you'll tell me my fish stew needs more pepper, like the rest of them do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Kin! It's good to see another tauren face. The trolls are wonderful neighbours, but they cook things I won't name." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look half drowned and half trampled. Sit down before you fall down, because I'm not strong enough to carry you upstairs." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Someone's been at the trolls' rum, I see. Water first, then bed, and no singing on my stairs." },
  },

  start = "hello",
  nodes = {
    dd_iruxos = {
      lines = {
        { id = "dd_ix_default", text = "Bury it deep, she say, and bless the ground over it so nothin' can dig it up again. The demons left their mark all over Mannoroc Coven, and Taiga don't want even a scrap of them comin' near Shadowprey. What would you have done with it?" },
      },
      choices = {
        { text = "Burned it to ash and scattered it at sea.", next = "BACK", reply = "Ha, dat be the troll way, mon, and maybe the best. Fire and salt water, nothin' comes back from that.", fx = { align = { order = -1 } } },
        { text = "Done as Taiga says. The elders know best.", next = "BACK", reply = "Spoken with respect, and Taiga would like to hear it. She be wiser than all of us put together.", fx = { align = { order = 1 } } },
        { text = "Something else, Sikewa.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_iruxos", tags = { "news" }, when = { questDone = TODO_QUEST("Hand of Iruxos") },
          text = "Taiga Wisemane sat at my table last night, and she told the whole inn you brought back the Hand of Iruxos from Mannoroc Coven. Half my guests wanted to shake your hand, mon, and the other half wanted to know if it was cursed." },
        { id = "h_default", key = true,
          text = "I'm Sikewa, and I keep the inn at Shadowprey, where the trolls fish, the tauren watch the centaur, and travellers wash the grey dust off their boots. Rest here, and I'll make this your home while you're on the coast." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? I've a pot on, but it'll keep." },
        { id = "h_again2", text = "Go on, ask. Innkeepers hear everything, so I've plenty to tell." },
      },
      choices = {
        { text = "Did Taiga say what she'll do with the hand?", next = "dd_iruxos", when = { questDone = TODO_QUEST("Hand of Iruxos") } },
        { text = "A tauren innkeeper in a troll village?", next = "trolls" },
        { text = "What's the news on the coast?", next = "news" },
        { text = "Who should I talk to here?", next = "people" },
        { text = "Make this inn my home.", next = "BUSINESS" },
        { text = "Farewell, Sikewa.", next = "END" },
      },
    },

    trolls = {
      lines = {
        { id = "tr_default", text = "Thunder Bluff asked for someone to keep an inn for the travellers, and the trolls were glad of it, because they'd rather fish than cook for strangers. We get along well, as long as I don't ask what's in their stew and they don't ask what's in mine." },
      },
      choices = {
        { text = "Do the two peoples really get along?", next = "trolls_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_along = {
      big = true,
      lines = {
        { id = "ta_default", text = "Mostly. The trolls think we're slow, and we think they're reckless, and both of us are a little right. But when the naga came up the beach last spring, nobody asked who was tauren and who was troll." },
      },
      choices = {
        { text = "That's what the Horde should be.", next = "BACK", reply = "I think so too, and I wish more of the Horde would come to Shadowprey and see it for themselves.", fx = { align = { order = 1 } } },
        { text = "Every people should keep to its own.", next = "BACK", reply = "Perhaps, but the naga did not keep to their own, and I would rather have a troll beside me than no one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    news = {
      lines = {
        { id = "ne_default", text = "The naga are bolder in the north, the Burning Blade have more fires lit at Thunder Axe than they did, and a goblin caravan lost a wheel on the road and has been arguing about it for three days. Desolace never runs short of trouble, only of rain." },
        { id = "ne_cleared", when = { cleared = "Maraudon" }, text = "The talk is all about Maraudon, friend, and someone who went to the bottom and came back. The trolls say the earth's been sleeping easier since, and I've noticed the cups don't rattle on the shelves anymore." },
      },
      choices = {
        { text = "I'll keep my ears open on the coast.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    people_drul = {
      lines = {
        { id = "pd_default", text = "Never, though I keep a bowl of fish stew aside for him every night, and Tanga's girl carries it down to the dock. He eats it, because the bowl comes back empty, and that's the most he'll let any of us do." },
      },
      choices = {
        { text = "That's kind of you both.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    people = {
      lines = {
        { id = "pe_default", text = "Taiga Wisemane if you want to fight demons, Vark Battlescar upstairs if you want to fight a satyr, and Roon if you want to hear about his hunting friend for the hundredth time. Drulzegar on the dock pays for naga, but be gentle with him, because the sea took his whole crew." },
      },
      choices = {
        { text = "Thank you, Sikewa.", next = "BACK", fx = { affinity = 1 } },
        { text = "Does Drulzegar ever come to the inn?", next = "people_drul" },
        { text = "Farewell.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept a lodge in Bloodhoof before Thunder Bluff sent me here. The view's better, and the guests are stranger." } },
    advice = { { id = "tp_ad", text = "Shake out your boots in the morning. The scorpids like a warm boot." } },
    _none = { { id = "tp_none", text = "Haven't heard, friend, and that's rare enough that you should ask someone else." } },
  },
}

-- Thalon: tauren wind rider master at the end of Shadowprey's dock.
P:NPC {
  key = "thalon", id = TODO_NPC("Thalon"), name = "Thalon", title = "Wind Rider Master",
  bible = "bibles/shadowprey_docks.md", role = "flightmaster", tier = "service",
  communities = { "shadowprey" }, temper = { "laconic", "patient" }, values = { "duty", "nature" },
  notices = { "race", "weary" },
  impression = {
    first = "Thalon keeps the wind riders at the very end of Shadowprey's dock, where the sea wind is strongest. He says little, watches the horizon a great deal, and talks to his riders more than to travellers.",
    third = "{name} met Thalon, the tauren wind rider master at the end of Shadowprey's dock.",
  },

  greetings = {
    { id = "g_default", text = "Flying, {class}? The sea wind is good for it today." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The riders are rested; they'll take you wherever you're bound." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you last flew from here. The riders have kept the sky warm for you." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You hold your footing well on a wet dock, for one of our people. Most of us look at the gaps between the planks and go pale." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You're one of the sky folk. The riders like the smell of you; it's the smell of high places." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You're in no state to hold on over the mountains. Sikewa has beds, and the riders can wait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_blade", when = { killed = { name = "Burning Blade", min = 20 } },
          text = "My riders fly over Thunder Axe Fortress on the way to Sun Rock, and lately they say the Burning Blade fires burn lower there. They say a {class} has been walking those walls, and I think they mean you." },
        { id = "h_default", key = true,
          text = "I am Thalon. My riders fly from the end of this dock to Thunder Bluff, to Sun Rock in the mountains, and south to Feralas, and they like the sea wind better than any other." },
      },
      again = {
        { id = "h_again3", text = "Yes? Speak up, the wind takes soft voices." },
        { id = "h_again", text = "What else? The riders are in no hurry, and neither am I." },
        { id = "h_again2", text = "Ask, then. The tide's turning; I've time." },
      },
      choices = {
        { text = "Why keep the riders out on the dock?", next = "dock" },
        { text = "What do you see from up there?", next = "see" },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Who do you fly for, mostly?", next = "passengers" },
        { text = "The village trusts your eyes, I think.", next = "watch" },
        { text = "I'd know the wind if you taught me.", next = "wind", when = { class = { "SHAMAN", "HUNTER", "DRUID" } } },
        { text = "A tauren who chose the sea. That's rare.", next = "tauren", when = { race = "Tauren" } },
        { text = "Farewell, Thalon.", next = "END" },
      },
    },

    dock = {
      lines = {
        { id = "do_default", text = "Because the wind comes straight off the sea here, and the riders lift into it without having to fight. Inland the air is dry and full of dust, and it gets into their wings." },
      },
      choices = {
        { text = "Do the naga trouble them?", next = "dock_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dock_naga = {
      big = true,
      lines = {
        { id = "dn_default", text = "Once a naga came up out of the water under the dock at night, and the riders woke the whole village. Some of the trolls want me to move the riders inland where they're safe, and I say a rider that's afraid of the sea is no use on this coast." },
      },
      choices = {
        { text = "Move them inland. Safety first.", next = "BACK", reply = "Perhaps you are right, and the trolls would thank you, but the riders would miss the sea wind.", fx = { align = { honor = -1 } } },
        { text = "Keep them on the dock. Fear can't rule you.", next = "BACK", reply = "That is what I tell myself, and the riders seem to agree, because they sleep soundly on the dock now.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    see = {
      lines = {
        { id = "se_default", text = "Grey land, grey sea, and the green smear of Feralas to the south, like a promise. The kodo graveyard shines white in the middle of it all, and the riders always bank wide around it." },
      },
      choices = {
        { text = "Why do they avoid it?", next = "see_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    see_names = {
      lines = {
        { id = "sn_default", text = "I name each one, though I don't tell travellers the names, because they'd only shout them in the air and confuse the poor beasts. The oldest is called Grey Wind, and that one I'll tell you, since she won't answer to it anyway." },
      },
      choices = {
        { text = "Grey Wind. I'll remember the name.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    see_why = {
      lines = {
        { id = "sw_default", text = "They feel the spirits there, I think, the old kodo walking to their rest. Beasts know things about death that we only guess at, and I've learned to trust their guessing over mine." },
      },
      choices = {
        { text = "I'll trust them too.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Do you name your riders?", next = "see_names" },
        { text = "Farewell, Thalon.", next = "END" },
      },
    },
    passengers = {
      lines = {
        { id = "passengers_d", text = "Fishermen's cargo to Thunder Bluff, messengers for Jinar'Zillen, and braves bound for Ghost Walker Post who would rather not walk past the Kolkar. Now and then Roon Wildmane sends a hunter north in a hurry, and never tells me why." },
      },
      choices = {
        { text = "And who flies in?", next = "passengers_in" },
        { text = "Something else.", next = "BACK" },
      },
    },
    passengers_in = {
      lines = {
        { id = "passengers_in_d", text = "Young ones, mostly, sent from the Crossroads with more courage than water. I can tell how long they will last in Desolace by whether they thank the wind rider when they climb down." },
      },
      choices = {
        { text = "I thanked mine.", next = "BACK", fx = { affinity = 1 } },
        { text = "It's a beast doing its work.", next = "BACK", reply = "It is. So are you, and I expect you like to be thanked.", fx = { trait = { stern = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "watch_d", text = "They do, though they have their own Shadowprey Guardians on the sand. From the end of the dock I see the sails and the fins before anyone, and I have a horn for the things that have neither." },
      },
      choices = {
        { text = "Would you sound it for one naga?", next = "watch_horn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_horn = {
      big = true,
      lines = {
        { id = "watch_horn_d", text = "That is the question I ask myself every night. Sound it too often and the village stops rising for it, and hold it too long and someone's child is taken off the sand." },
      },
      choices = {
        { text = "Sound it every time. Better tired than taken.", next = "BACK", reply = "That is what I do, and the fishermen curse me for it at dawn. I would rather be cursed.", fx = { align = { order = 1 } } },
        { text = "Trust your judgement. A horn loses its meaning.", next = "BACK", reply = "So Lui'Mala says, usually when I have woken him. Perhaps you are both right, and I will go on not listening.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wind = {
      lines = {
        { id = "wind_d", text = "Then stand here and close your eyes, and tell me which cheek is colder. Now you know where the weather is coming from, and that is the first of about a thousand lessons." },
      },
      choices = {
        { text = "And the second?", next = "BACK", reply = "The second is to come back tomorrow. The wind does not teach in a hurry.", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_d", text = "Sikewa and Aboda came for the kodo, and I came because a wind rider needed a master and nobody else would live on a dock. I thought I would hate the salt, and instead I have come to need it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I flew messages for Cairne in the early days of Thunder Bluff. Now I fly travellers, which is quieter." } },
    advice = { { id = "tp_ad", text = "Tie down anything loose before you fly over the sea." } },
    _none = { { id = "tp_none", text = "I don't know. The riders might, but they don't say." } },
  },
}
