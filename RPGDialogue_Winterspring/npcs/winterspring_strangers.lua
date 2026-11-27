-- Two quieter Winterspring souls: Umbranse the Spiritspeaker (a human medium in the hills northeast of Everlook)
-- and Natheril Raincaller (general goods at Starfall Village).
-- Voice: bibles/winterspring_strangers.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Umbranse the Spiritspeaker
---------------------------------------------------------------------------
P:NPC {
  key = "umbranse", id = TODO_NPC("Umbranse the Spiritspeaker"), name = "Umbranse the Spiritspeaker",
  bible = "bibles/winterspring_strangers.md", role = "scholar", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "smooth", "quiet" }, values = { "curious", "ambitious" },
  notices = { "ghost", "undead" , "class" },

  impression = {
    first = "He is soft-voiced and very interested in what I have seen.",
    third = "{name} met Umbranse the Spiritspeaker, a human medium living in the hills of Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and close the door gently. The spirits around here are easily startled." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The spirits mentioned you might; they're often right about such things." },
    { id = "g_duke", when = { questDone = TODO_QUEST("Duke Nicholas Zverenhoff") }, text = "Gregor Greystone tells me my little book proved useful to the Argent Dawn. I'm glad; it was lonely on my shelf." },
  },

  notice = {
    { id = "n_ghost", cat = "ghost", when = { deaths = { min = 20 } },
      text = "You've crossed over more than once, haven't you? I can see it on you, the way frost stays on a window after the cold has gone. Do sit down and tell me what you saw there." },
    { id = "n_undead", cat = "undead", when = { race = "Scourge" },
      text = "Oh, how remarkable. A spirit that came back to its own body instead of drifting. You must forgive me for staring." },
    { id = "n_b1", cat = "class", when = { class = "MAGE" },
      text = "Ah, a colleague, of a sort! You'll have felt it already, I expect, how thick the old magic lies under the snow here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Umbranse, and some call me the Spiritspeaker, which is a grand name for a man who listens carefully. The dead are everywhere in Winterspring, Highborne mostly, from the old days, and if you know how to ask, they will talk until dawn." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Your sort usually wants the dead sent onward, and I usually want them to stay a little longer and talk. I hope we can be friends regardless." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've tea, if you're cold." },
        { id = "h_again2", text = "Go on. The spirits are quiet tonight, so I'm all yours." },
        { id = "h_again_b1", text = "Was there something more? Do ask; the kettle hasn't boiled yet." },
      },
      choices = {
        { text = "How do you speak to the dead?", next = "speak" },
        { text = "Which spirits haunt Winterspring?", next = "spirits" },
        { text = "What book did you give Gregor Greystone?", next = "book" },
        { text = "Why live out here alone?", next = "alone" },
        { text = "I've walked as a spirit myself.", next = "crossed", when = { deaths = { min = 20 } } },
        { text = "Your door charms are all hung upside down.", next = "charms" },
        { text = "The Light teaches that the dead should rest.", next = "rest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "What did the Highborne know that we've forgotten?", next = "forgotten", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Do the kaldorei spirits here speak with you?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I should be going.", next = "END" },
      },
    },

    speak = {
      lines = { { id = "sp_default", text = "Patience, mostly, and a little arcane training that I picked up when I was younger and more careless. Spirits are like shy animals: they come closer if you sit very still and don't want anything too obviously." } },
      choices = {
        { text = "And what do you want from them?", next = "speak_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speak_want = {
      big = true,
      lines = { { id = "sw_default", text = "Knowledge, of course. The Highborne knew things about magic that our kingdoms have spent ten thousand years forgetting, and they're happy to share, if one is polite. Some would say the dead should be left in peace, but I think they're lonely, and I'm a good listener." } },
      choices = {
        { text = "Let the dead rest. That knowledge is theirs.", next = "speak_end", fx = { align = { light = 1 } } },
        { text = "If they'll share it, take it. Knowledge is knowledge.", next = "speak_end", fx = { align = { light = -1 } } },
        { text = "What have they told you?", next = "speak_end" },
      },
    },
    speak_end = {
      lines = { { id = "se_default", text = "Volumes, though very little of it would interest a practical person. Old spells, old quarrels, the names of rivers that have changed course since. I write it all down, and someday it will make a very long book that nobody reads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    spirits = {
      lines = { { id = "sr_default", text = "Highborne in the ruins of Kel'Theril and Mazthoril, who remember the Well and the Queen and can't decide whether they're sorry. A few kaldorei sentinels who never finished their watch. And now and then something older, which I don't call, because it doesn't come when called." } },
      choices = {
        { text = "Something older?", next = "spirits_older" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_older = {
      lines = { { id = "so_default", text = "I don't know what it is, and I've decided not to find out. There are some doors a sensible man leaves closed, and I like to think I'm sensible, most days." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },

    book = {
      lines = { { id = "bo_default", text = "Studies in Spirit Speaking, my own humble notes. Gregor Greystone of the Argent Dawn came asking after ways to reach the restless dead, and I lent it to him, because the Dawn has more need of it than my shelf." } },
      choices = {
        { text = "You trust the Argent Dawn?", next = "book_dawn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_dawn = {
      lines = { { id = "bd_default", text = "I trust that they mean well, which is not quite the same thing. They want the Scourge's dead freed, and I want the dead to talk, and for now those two wishes walk the same road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },

    alone = {
      lines = { { id = "al_default", text = "Because Everlook is very loud, and the dead are very quiet, and it's hard to hear one over the other. The yetis in the hills leave me be, and the goblins only come when they want something, which suits me well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crossed = {
      lines = { { id = "cr_default", text = "Then you've seen the grey country, and you came back from it. Tell me, when you walked there, did the other spirits speak to you, or only look? I've always wondered whether the newly dead can hear each other." } },
      choices = {
        { text = "They only looked at me.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'd rather not talk about it.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    charms = {
      lines = {
        { id = "b_charms_default", text = "How observant of you! Hung the usual way they keep spirits out, and hung this way they tell the spirits that this is a house where nobody will shout at them. You'd be surprised how many come for that alone." },
      },
      choices = {
        { text = "Don't unfriendly things come in as well?", next = "charms_unfriendly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charms_unfriendly = {
      lines = {
        { id = "b_charms_unfriendly_default", text = "Now and then, yes. I offer those the same tea and the same patience as the others, and I keep a rather stronger ward folded in my sleeve in case patience fails." },
      },
      choices = {
        { text = "Has it ever failed?", next = "charms_failed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charms_failed = {
      lines = {
        { id = "b_charms_failed_default", text = "Once, with a Highborne magister who had spent ten thousand years rehearsing a grievance. We parted on poor terms, and I had to buy a new table from the goblins, who charged me for delivery." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rest = {
      lines = {
        { id = "b_rest_default", text = "So it does, and I respect the teaching, truly. But a spirit that lingers has something unsaid, and I've found that they rest a good deal easier once someone has let them say it." },
      },
      choices = {
        { text = "Then you're doing a priest's work, in your way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Or you keep them here to pick their memories.", next = "BACK", reply = "That's a hard thing to say to a man over his own tea, and I can't swear there's nothing in it. I do try to be of use to them first." },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgotten = {
      lines = {
        { id = "b_forgotten_default", text = "How to draw on a well of power without believing that it loved them back. They knew the technique perfectly, and it was only the humility that escaped them, and so the technique drowned them." },
      },
      choices = {
        { text = "That sounds like a warning.", next = "forgotten_warning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgotten_warning = {
      lines = {
        { id = "b_forgotten_warning_default", text = "It is one, and I repeat it to myself most evenings. It's the only lesson of theirs I'm quite certain of, and it cost them a continent." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kaldorei = {
      lines = {
        { id = "b_kaldorei_default", text = "Rarely, and only the sentinels who fell guarding the old roads. They want to know whether the watch was kept after them, and I tell them that it was, because your people are still here." },
      },
      choices = {
        { text = "Tell them Elune's light still falls on Winterspring.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The dead of Winterspring, the Highborne, and the art of listening." } },
    highborne = { { id = "tp_hb", text = "Brilliant, proud, and very sorry, some of them. Others are only proud." } },
    argent_dawn = { { id = "tp_ad", text = "Good people, I think. Gregor has my book; I hope he's reading it." } },
    queen_azshara = { { id = "tp_b_queen_azshara", text = "The Highborne here won't say her name, you know. They only say 'the Queen', and then they look at the floor." } },
    everlook = { { id = "tp_b_everlook", text = "A cheerful, noisy little town, and I go in once a month for tea and lamp oil. The goblins think I'm harmless, which I take as a compliment." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. The living world rather passes me by." } },
  },
}

---------------------------------------------------------------------------
-- Natheril Raincaller
---------------------------------------------------------------------------
P:NPC {
  key = "natheril", id = TODO_NPC("Natheril Raincaller"), name = "Natheril Raincaller", title = "General Goods",
  bible = "bibles/winterspring_strangers.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "calm", "gentle" }, values = { "practical", "kind" },
  notices = { "cold" },

  impression = {
    first = "He always has something warm on the fire.",
    third = "{name} met Natheril Raincaller, who sells general goods at Starfall Village.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Welcome back, friend. Come in out of the cold, and rest a while with me." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome to Starfall. Come in from the cold, if you need, but keep to yourself." },
    { id = "g_default", text = "Welcome to Starfall. Come in out of the cold; the snow will still be there when you leave." },
    { id = "g_back", when = { metBefore = true }, text = "Back safe from the hills. Elune be thanked, and come warm your hands." },
  },

  notice = {
    { id = "n_cold", cat = "cold", when = { nearlyNaked = true },
      text = "You're walking through Winterspring dressed like that? Please, sit by the fire, and then buy a cloak from someone, anyone, before you freeze." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Natheril Raincaller, and I keep Starfall supplied with food, water, thread and the little things a traveller forgets. It's a small village and a long way from Darnassus, so most of what I sell comes north through Felwood, if the furbolgs let it." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde, and this is a Darnassian village, though Everlook's goblins keep a sort of peace in these hills. I'll answer your questions, but I'd keep moving, for your own sake." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah, and welcome home, or as near to home as this snow allows. I'm Natheril Raincaller, and I keep Starfall in bread and thread, and I'd be glad of news from Darnassus if you've any to spare." },
      },
      again = {
        { id = "h_again", text = "Anything else? The kettle's nearly boiled." },
        { id = "h_again2", text = "Go on, sit a while longer. The fire's the only thing in Winterspring that's free." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What's life like in Starfall?", next = "village" },
        { text = "How do your supplies get here?", next = "road" },
        { text = "Why 'Raincaller'? There's no rain here.", next = "name" },
        { text = "What should a traveller carry in Winterspring?", next = "advice" },
        { text = "Darnassus is well. The Tree still stands tall.", next = "darnassus", when = { race = "NightElf" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    village = {
      lines = { { id = "vi_default", text = "Quiet and cold, and very beautiful when the stars come out over the snow. Wynd Nightchaser keeps watch over the ruins, and the dwarves from the Explorers' League dig where they shouldn't, and I keep everyone fed." } },
      choices = {
        { text = "The dwarves dig where they shouldn't?", next = "village_dwarves" },
        { text = "What does Wynd watch for?", next = "village_wynd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_dwarves = {
      lines = {
        { id = "vd_default", text = "Jaron Stoneshaper and his diggers, who came looking for relics and found the wildkin instead. They mean no harm, I think, but they dig up graves as cheerfully as other people dig up turnips, and the wildkin take it badly, and so, privately, do I." },
        { id = "vd_dwarf", when = { race = "Dwarf" }, text = "Your countryman Jaron Stoneshaper and his diggers, who are very good company and very bad neighbours to the dead. I like him, I truly do, but the wildkin take his digging badly, and so, privately, do I." },
      },
      choices = {
        { text = "Old graves should be left alone.", next = "dig_stance" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    dig_stance = {
      big = true,
      lines = { { id = "ds_default", text = "Wynd says the same, and Jaron says that what's buried and forgotten is lost twice over, and that a museum in Ironforge is kinder than a hole in the snow. I sell them both their bread and keep my opinion in the kettle." } },
      choices = {
        { text = "Let the dead keep their own. Leave them buried.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Jaron's right. Knowledge buried is knowledge lost.", next = "BACK", fx = { align = { order = -1 }, learn = { "explorers_league" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_wynd = {
      lines = { { id = "vw_default", text = "For whatever the Highborne left behind in Kel'Theril and Mazthoril, and for anyone foolish enough to go looking for it. He doesn't say much to me about it, and I don't ask, because some things are better kept in one head than in two." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },
    road = {
      big = true,
      lines = { { id = "ro_default", text = "Through Timbermaw Hold, when the furbolgs are friendly, and over the mountains when they're not. Some say we should buy from the goblins in Everlook instead, but their prices would empty every purse in Starfall." } },
      choices = {
        { text = "Trust the Timbermaw. Old friends are worth it.", next = "BACK", reply = "You have a kind heart, and the Timbermaw remember kindness for longer than goblins remember a debt. When the snows close the passes, it is their paths that keep us fed.", fx = { align = { order = 1 } } },
        { text = "Buy wherever it's cheapest. Sentiment won't feed anyone.", next = "BACK", reply = "Cheap bread is still bread, I grant you, but the goblins will leave the day the coin runs thin, and the furbolgs will still be here. I would rather owe a friend than a ledger.", fx = { align = { order = -1 } } },
        { text = "Are the Timbermaw ever unfriendly?", next = "road_timbermaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_timbermaw = {
      lines = { { id = "rt_default", text = "Not to us, not yet, but the Winterfall were Timbermaw cousins once, and look at them now, raving in their camps by the hot springs. Every season I worry that the sickness will climb into the hold too, and every season so far, it hasn't." } },
      choices = {
        { text = "What made the Winterfall sick?", next = "road_winterfall" },
        { text = "Something else.", next = "BACK", fx = { learn = { "timbermaw" } } },
      },
    },
    road_winterfall = {
      lines = { { id = "rw_default", text = "Something foul in what they drink, Donova Snowden says, down at the hot springs, and she'd know better than I would; she's been watching them for months. Whatever it is, it turned gentle folk into raiders in a single winter." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    name = {
      lines = { { id = "na_default", text = "It was my mother's name, and she earned it in Ashenvale, where she could tell you the rain was coming a full day before the clouds knew. I only inherited the name, I'm afraid, and here it never rains at all; it just snows, very patiently, forever." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    advice = {
      lines = { { id = "ad_default", text = "A warm cloak, more water than you think, because snow won't quench you, and something to eat that doesn't freeze solid in your pack. And keep away from the frostsabers' rock in the far north unless you've business with the riders there; the cats don't care for strangers." } },
      choices = {
        { text = "Riders on frostsabers?", next = "advice_riders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice_riders = {
      lines = { { id = "ar_default", text = "The Sentinels keep a few at Frostsaber Rock, wild ones tamed slowly over long years, and they only let those who've proven themselves to Darnassus near them. I've seen one up close once, and it looked at me the way I look at a loaf of bread." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    darnassus = {
      lines = { { id = "dn_default", text = "Then I'm glad, more than I can say. I came north before the new Tree was even planted, so I've only seen it in the Sentinels' stories, and I'd like to think there's a branch on it somewhere that will wait for me." } },
      choices = { { text = "It does. Something else.", next = "BACK", fx = { affinity = 1, learn = { "teldrassil" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, the roads north, and how to keep warm." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw carry our goods through their tunnels. The Winterfall would rather eat them." } },
    timbermaw = { { id = "tp_tim", text = "Our road, our friends, and the reason Starfall has bread at all. I hope they stay well." } },
    explorers_league = { { id = "tp_el", text = "Kind, loud, and much too fond of shovels. They pay for their bread on time, I'll grant them." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Ask Wynd; he knows the old things." } },
  },
}

-- Artorius the Amiable: a smiling traveller on Winterspring's high road who is really Artorius the Doombringer, a
-- doomguard and one of the four corrupters Vartrus the Ancient sets hunters against (Stave of the Ancients). His
-- disguise is cheerful; only hunters on the Stave hunt (and observant beasts) see through it. No fight is started here.
P:NPC {
  key = "artorius", id = TODO_NPC("Artorius the Amiable"), name = "Artorius the Amiable",
  bible = "bibles/winterspring_strangers.md", role = "citizen", tier = "quest", gender = "male",
  communities = { "winterspring_wilds" }, temper = { "cheerful", "smooth" }, values = { "ambitious", "cruel" },
  notices = { "class", "pet" },

  impression = {
    first = "Artorius the Amiable stands on the snow road as though he owned it, wishing everyone a pleasant morning in a voice like warm honey. Something about his smile goes on a little too long.",
    third = "{name} met Artorius the Amiable, a very friendly traveller on Winterspring's high road.",
  },

  greetings = {
    { id = "g_default", text = "Good morning, good morning! Splendid weather for it, whatever it is you are out here doing." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I do so enjoy a familiar face on a lonely road, and yours is very familiar now." },
    { id = "g_hunter_stave", when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") }, text = "Ah, a hunter, and alone, too. How very brave, and how very convenient." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your animal does not like me, I see, it has put its ears back and its tail down. Animals are such poor judges of character, don't you find?" },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You look at me the way hunters look at tracks in the snow, friend, and I'm not sure I care for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Artorius, at your service, and they call me the Amiable, which I think is very kind of them. I walk the high road between the springs and Everlook and wish good morning to everyone I meet, for there is so little kindness in the world, and somebody must spread it about." },
        { id = "h_hunter_stave", when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") }, text = "You have been talking to trees, I think, old dead trees in Felwood who remember things they ought to have forgotten. Never mind, friend, never mind; let us be civil for a little while longer, since we are both so far from home." },
      },
      again = {
        { id = "h_again", text = "Anything else? I have all the time in the world, quite literally." },
        { id = "h_again2", text = "Go on, go on. I do love a conversation." },
      },
      choices = {
        { text = "What brings you to Winterspring?", next = "why" },
        { text = "The beasts here flee from you.", next = "beasts" },
        { text = "You don't seem to feel the cold.", next = "cold" },
        { text = "I know what you are, Artorius.", next = "know", when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") } },
        { text = "Something about you smells of brimstone.", next = "lock", when = { class = "WARLOCK" } },
        { text = "The Sentinels would want a word with you.", next = "kal", when = { race = "NightElf" } },
        { text = "Good day to you, Artorius.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_d", text = "Oh, the views, the air, the hot springs, the company of the furbolgs, who have become so lively lately! I find the north very restful, and there are so few people up here to disturb one's work, whatever one's work happens to be." } },
      choices = {
        { text = "The furbolgs are poisoned, not lively.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_d", text = "Are they? How dreadful, and how quickly a whole people can change when they are given the right drink. I am sure whoever is responsible is very sorry, or at any rate very busy." } },
      choices = { { text = "That's an odd thing to say. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    beasts = {
      lines = { { id = "b_d", text = "They do, the silly things, and I have tried everything, sweets, songs, standing very still. Perhaps they smell the road on me, or perhaps they simply know something about me that I have not had the chance to tell you yet." } },
      choices = { { text = "Beasts are rarely wrong about such things.", next = "BACK", reply = "Rarely, friend, but not never. Let us hope this is one of the rare times, for your sake.", fx = { trait = { cautious = 1 } } } },
    },
    cold = {
      lines = { { id = "c_d", text = "I run warm, I always have, it is something of a family trait. My relations live somewhere much, much hotter than this, and I am afraid they would find Winterspring terribly dull." } },
      choices = { { text = "Somewhere hotter. I see. Something else.", next = "BACK" } },
    },
    know = {
      big = true,
      lines = { { id = "k_d", text = "Do you? Then you are cleverer than you look, and much less clever than you think, because a doomguard who has walked this world since before your grandmother's grandmother was born does not fear one hunter and a dead tree's grudge. Turn around and walk away, and I will let you keep smiling back at me." } },
      choices = {
        { text = "I'll keep my distance, demon, and my arrows ready.", next = "END", reply = "Distance! Yes, keep that, if you can. Few ever manage it for long.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "I'll face you openly. No tricks, demon.", next = "END", reply = "Openly! How charming, and how short your story will be.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I am not ready to face you yet.", next = "END", reply = "Wise, friend, very wise. I will be here whenever you are ready, which is the most terrible thing about me." },
      },
    },
    lock = {
      lines = { { id = "l_d", text = "Does it? Then you of all people should know better than to mention it, friend, for those who smell brimstone usually carry a little of it themselves. Let us say nothing more about each other's perfume, shall we?" } },
      choices = { { text = "Agreed, for now. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    kal = {
      lines = { { id = "ka_d", text = "Oh, the Sentinels! Fierce women, beautiful bows, and such long memories, which is a pity, because your people remember a great deal about my people, and so little of it is flattering. Run along and tell them, if you like, and see how long it takes them to come this far north." } },
      choices = { { text = "Long enough. Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The road, the springs, the weather, and a little about everybody I meet, which is a hobby of mine." } },
    background = { { id = "tp_bg", text = "Oh, I come from far away and I have been travelling a very long time, and that is all very dull, so let us talk about you." } },
    winterfall = { { id = "tp_winterfall", text = "The furbolgs? Charming creatures, and so very thirsty lately." } },
    burning_legion = { { id = "tp_legion", text = "What an unpleasant subject, friend, and such an unfair reputation they have, I always think." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend, and I wouldn't want to gossip, though I do love to hear it." } },
  },
}
