-- Missed Orgrimmar folk, part one: the Hall of Legends (Advisor Willington, First Sergeant Hola'mahi,
-- Grunt Korf, Grunt Bek'rah), the Valley of Strength's callers (Grinkle, Furmund), the Cenarion emissary
-- in the Valley of Wisdom, and Frezza at the zeppelin tower. Voices: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Advisor Willington: the Undercity's man in the Hall of Legends.
P:NPC {
  key = "advisor_willington", id = TODO_NPC("Advisor Willington"), name = "Advisor Willington", gender = "male",
  bible = "bibles/missed_a.md", role = "advisor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "cold" }, values = { "shrewd", "loyal" },
  notices = { "race", "pvp" },
  impression = {
    first = "Advisor Willington stands in the Hall of Legends among orcs twice his width, a Forsaken with a clerk's posture and a general's opinions. He speaks for the Undercity here, and he seems to find the heat of Durotar a personal insult.",
    third = "{name} met Advisor Willington, the Forsaken who advises the officers in the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "You may approach, {class}, though I would ask you not to shout. The orcs do quite enough of that for one hall." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and in one piece, which is more than I can say for most of the reports that cross my hands." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Another of the Dark Lady's own, this far from Tirisfal. Do try to keep out of the sun, because this climate does our kind no favours at all." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "I see you have earned your place in this hall, which makes you a rarer visitor than you might suppose." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Advisor Willington, and I sit in this hall on behalf of the Undercity. The orcs supply the courage, of which they have a great deal, and I supply the arithmetic, of which they have rather less." },
      },
      again = {
        { id = "h_again", text = "Was there something further? I have despatches from Lordaeron that will not read themselves." },
        { id = "h_again2", text = "Go on, then, and I shall try to be patient." },
      },
      choices = {
        { text = "What does an advisor do here?", next = "advise" },
        { text = "You don't look comfortable in Orgrimmar.", next = "heat" },
        { text = "What do the Forsaken want from this hall?", next = "want" },
        { text = "I'll leave you to your despatches.", next = "END" },
      },
    },
    advise = {
      lines = { { id = "a_default", text = "I read what comes back from the fronts, and I tell the officers what it will cost them before they spend it. A warlord sees a hill worth taking, and I see how many graves it will need, which is a subject my people know thoroughly." } },
      choices = {
        { text = "Do they listen to you?", next = "listen" },
        { text = "Something else, Advisor.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "More often than they admit, and never in front of one another. The First Sergeant listens best, because she is the one who must fit armor to whoever comes back, and she can count as well as I can." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    heat = {
      lines = {
        { id = "ht_forsaken", when = { race = "Scourge" }, text = "You feel it too, I am sure. The dust gets into everything, and the dry air does nothing for what remains of one's complexion, though I am told the cellars under Lordaeron were worse in their own damp way." },
        { id = "ht_default", text = "I was a man of Lordaeron once, with rain and stone and decent shade, and now I serve in a red canyon full of drums. I do not complain of it, since the dead cannot afford to be particular about their allies." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    want = {
      lines = { { id = "w_default", text = "We want what any small nation wants from a large friend, which is to be remembered when the fighting is planned. The Scourge lies to our east and the Scarlet Crusade prays for our burning, and neither will wait politely while the Horde looks elsewhere.", fx = { learn = { "scourge" } } } },
      choices = {
        { text = "The Horde won't forget Lordaeron.", next = "BACK", reply = "I shall hold you to that, {class}, since I hold everyone to everything. It is the principal pleasure left to me." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept accounts for a living when I had a living, and I keep them still. Only the columns have changed, from grain to soldiers." } },
    scourge = { { id = "tp_sc", text = "The Lich King made us and lost us, and he would dearly like us back. That is all the strategy one needs to understand about Lordaeron." } },
    _none = { { id = "tp_none", text = "That is not a matter on which I have been asked to advise, and I do not offer opinions for nothing." } },
  },
}

-- First Sergeant Hola'mahi: Darkspear quartermaster of the Hall's armor.
P:NPC {
  key = "holamahi", id = TODO_NPC("First Sergeant Hola'mahi"), name = "First Sergeant Hola'mahi", gender = "female",
  bible = "bibles/missed_a.md", role = "quartermaster", tier = "service",
  communities = { "orgrimmar" }, temper = { "sly", "brisk" }, values = { "proud", "practical" },
  notices = { "pvp", "race" },
  impression = {
    first = "First Sergeant Hola'mahi keeps the armor of the Hall of Legends, and she looks a visitor over the way a tailor would, from the shoulders down. She is Darkspear, quick to laugh, and not at all quick to hand anything over.",
    third = "{name} met First Sergeant Hola'mahi, the troll who keeps the champions' armor in the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "Stand up straight and let me look at you, mon. I can tell what a soldier has earned before they open their mouth." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, eh? Let's see if you grew into anything on my racks since the last time." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear in the Hall, and about time. Dese orcs think they invented war, mon, so walk tall in here for the tribe." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You carry rank, and you carry it easy. Good, because the armor I keep hangs badly on anybody who be nervous in it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be First Sergeant Hola'mahi, and every piece of armor in this hall passes through my hands first. The Horde gives it to those who earned it on the field, and no amount of gold or sweet talk changes dat." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon?" },
        { id = "h_again2", text = "Ask it quick, because I got straps to oil." },
      },
      choices = {
        { text = "Show me what I've earned.", next = "BUSINESS" },
        { text = "How does a soldier earn this armor?", next = "earn" },
        { text = "A troll sergeant among all these orcs.", next = "troll" },
        { text = "Farewell, Sergeant.", next = "END" },
      },
    },
    earn = {
      lines = { { id = "e_default", text = "You fight the Alliance where the Horde be fighting them, and you keep doing it until the officers know your name. Rank comes slow and it goes fast, so the ones who wear my armor are the ones who never stopped." } },
      choices = {
        { text = "Where is the fighting hardest?", next = "fronts" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    fronts = {
      lines = { { id = "f_default", text = "In the Alterac snow with the Frostwolves, mon, and in the trees of Ashenvale where the Warsong cut their lumber. Advisor Willington reads me the numbers from both every morning, and he never once made them sound cheerful.", fx = { learn = { "alterac" } } } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    troll = {
      lines = {
        { id = "t_troll", when = { race = "Troll" }, text = "You know how it is, mon. We came across the sea with nothing but spears and Thrall's word, and now one of us measures orc warlords for their shoulder plates." },
        { id = "t_default", text = "The Darkspear owe Thrall a debt from the islands, and we pay it the way we know best. I was a headhunter before I was a sergeant, so I know where armor fails, and dat be half of fitting it." },
      },
      choices = {
        { text = "Where does armor fail?", next = "fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail = {
      lines = { { id = "fl_default", text = "Under the arm and at the throat, every time, because a soldier wants to move and to breathe. I not telling you more than dat, mon, in case you ever stand on the wrong side of me." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear born, headhunter raised, and a sergeant of the Horde now. The loa got a strange sense of humor, mon." } },
    alterac = { { id = "tp_alt", text = "Cold enough to crack a tusk, they tell me, and the dwarves there fight like they own the mountain." } },
    _none = { { id = "tp_none", text = "I keep armor, mon, not answers. Ask the advisor, because he got an opinion on everything." } },
  },
}

-- Grunt Korf: on guard in the Hall of Legends.
P:NPC {
  key = "grunt_korf", id = TODO_NPC("Grunt Korf"), name = "Grunt Korf", gender = "male",
  bible = "bibles/missed_a.md", role = "guard", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "dutiful", "proud" },
  notices = { "pvp", "class" },
  impression = {
    first = "Grunt Korf guards the Hall of Legends with his axe grounded and his jaw set, as if the banners themselves had been left in his care. He has little to say and says it plainly.",
    third = "{name} met Grunt Korf, one of the guards of the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "You stand in the Hall of Legends, {class}. Keep your weapons sheathed and your voice down." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You know the rules of this hall, so I will not repeat them." },
  },
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "Throm-ka, officer. The hall is yours to walk, and I will keep the door behind you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Grunt Korf. You carry your weapon like you have used it, warrior, and that is the only greeting this hall respects." },
        { id = "h_default", text = "I am Grunt Korf, and I guard this hall and the officers in it. State your business, because I do not stand here to make conversation." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be quick about it." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What is this place?", next = "hall" },
        { text = "Guarding a hall must be dull work.", next = "dull" },
        { text = "Carry on, grunt.", next = "END" },
      },
    },
    hall = {
      lines = { { id = "ha_default", text = "The Horde's officers gather here, and the arms and armor of its champions are kept here. Only those who have won rank against the Alliance are meant to walk past me, and the rest come to look and to want." } },
      choices = {
        { text = "Who should I speak to inside?", next = "inside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside = {
      lines = { { id = "in_default", text = "Stone Guard Zarg keeps the weapons, and the troll sergeant keeps the armor. The dead one by the table gives advice, and Bek'rah on the other post will tell you the same as I have, only louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dull = {
      lines = { { id = "d_default", text = "It is an honor, and I asked for it. Every orc I admire has walked through that door, and one day I mean to walk through it as something more than its guard." } },
      choices = { { text = "Lok'tar, Korf. You'll earn it.", next = "BACK", reply = "Lok'tar, {class}. I will remember that you said so.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born in the camps and I learned the axe in Durotar. That is all there is to tell." } },
    _none = { { id = "tp_none", text = "That is not my post and not my concern. Ask someone who is paid to talk." } },
  },
}

-- Grunt Bek'rah: the other guard in the Hall of Legends.
P:NPC {
  key = "grunt_bekrah", id = TODO_NPC("Grunt Bek'rah"), name = "Grunt Bek'rah", gender = "female",
  bible = "bibles/missed_a.md", role = "guard", tier = "service",
  communities = { "orgrimmar" }, temper = { "loud", "brisk" }, values = { "dutiful", "bold" },
  notices = { "pvp", "race" },
  impression = {
    first = "Grunt Bek'rah guards the Hall of Legends and greets everyone who enters at the same volume, which is considerable. She watches the officers come and go with open envy and no shame about it.",
    third = "{name} met Grunt Bek'rah, the loud guard of the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "Hold there, {class}! Walk where you like, but touch nothing on the racks unless you have the rank for it." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, you are back! Have you killed anything worth telling me about since last time?" },
  },
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "An officer! Tell me where you fought, because I hear every story in this hall second-hand and I am tired of it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mind the banners with those horns, tauren. Brave Stonehide has learned to duck, and so can you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grunt Bek'rah, guard of this hall! I keep the peace in here, which is easy, because nobody is fool enough to start a fight in a room full of warlords." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I have all day and a post I cannot leave." },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "You'd rather be at the front.", next = "front" },
        { text = "Has anyone ever caused trouble here?", next = "trouble" },
        { text = "Stand your post, grunt.", next = "END" },
      },
    },
    front = {
      lines = { { id = "f_default", text = "Of course I would, and so would any orc with blood in her! But the Warchief's officers need a door kept, and I was told to keep it, so I keep it and I listen to how the wars are going." } },
      choices = {
        { text = "And how are they going?", next = "wars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wars = {
      lines = { { id = "w_default", text = "The Warsong hold their camps in Ashenvale and the elves hate them for every tree, and that is all I am allowed to say. Korf says I talk too much already, and Korf says about four words a day.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "t_default", text = "A goblin once tried to sell the Stone Guard a better axe than the ones he keeps. Zarg only looked at him, and the goblin remembered somewhere else he had to be." } },
      choices = { { text = "A wise goblin. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Orgrimmar when the walls were still going up, and I carried stone before I carried an axe." } },
    warsong = { { id = "tp_ws", text = "Grom's clan, still cutting wood in the north. They do not ask leave of anyone, and I like them for it." } },
    _none = { { id = "tp_none", text = "I do not know, and I am not allowed to leave this door to find out!" } },
  },
}

-- Grinkle: goblin fishing promoter in the Valley of Strength.
P:NPC {
  key = "grinkle", id = TODO_NPC("Grinkle"), name = "Grinkle", title = "Fishing Promoter", gender = "male",
  bible = "bibles/missed_a.md", role = "herald", tier = "quest",
  communities = { "orgrimmar" }, temper = { "pushy", "cheerful" }, values = { "greedy", "shameless" },
  notices = { "profession", "race" },
  impression = {
    first = "Grinkle stands in the Valley of Strength with a fistful of fliers, shouting about fish at orcs who came to buy axes. He is a goblin with a contest to sell, and he has not yet met a passer-by he considered a lost cause.",
    third = "{name} met Grinkle, the goblin drumming up anglers for the Stranglethorn Fishing Extravaganza.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, you there, {class}! You look like somebody with a strong casting arm and a free day, and have I got a proposition for you." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite prospect is back! Listen, pal, the fish aren't getting any smaller, so tell me you've been practising." },
  },
  notice = {
    { id = "n_fisher", cat = "profession", when = { profession = "Fishing" },
      text = "Whoa, whoa, is that a fishing pole I smell on you? Friend, you and me need to talk, because you're exactly the customer this contest was built for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_fisher", when = { profession = "Fishing" }, text = "Grinkle's the name, and promoting the Stranglethorn Fishing Extravaganza's the game. An angler like you could walk off that dock in Booty Bay a legend, pal, and all it costs ya is a boat ride and a little bait." },
        { id = "h_default", text = "Grinkle, fishing promoter, at your service. The Stranglethorn Fishing Extravaganza is the biggest angling contest on either side of the sea, and I'm here to make sure Orgrimmar's got somebody in it worth betting on." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ya? Ask quick, because I've got fliers to move." },
        { id = "h_again2", text = "Still here, still selling, pal. What d'you need?" },
      },
      choices = {
        { text = "Could I get a fishing flier?", next = "BUSINESS" },
        { text = "How does the contest work?", next = "contest" },
        { text = "Orcs don't seem keen on fish.", next = "orcs" },
        { text = "Who pays you to stand here?", next = "pays" },
        { text = "I already fish. What does the winner actually take home?", next = "prize", when = { profession = "Fishing" } },
        { text = "Not today, goblin.", next = "END" },
      },
    },
    contest = {
      lines = { { id = "c_default", text = "It's simple, friend. The tastyfish school up along the Stranglethorn coast, everybody with a pole goes after them, and the first angler to haul a full catch back to the fishmaster in Booty Bay wins the whole pot." } },
      choices = {
        { text = "Who is the fishmaster?", next = "riggle" },
        { text = "And the ones who don't win?", next = "losers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riggle = {
      lines = { { id = "r_default", text = "Riggle Bassbait, the finest judge of a fish in the Steamwheedle Cartel, and a gnome, which I don't hold against him. He stands on the Booty Bay docks and shouts the start, and after that it's every angler for themselves.", fx = { learn = { "steamwheedle" } } } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    losers = {
      lines = { { id = "l_default", text = "They go home with a bag of fish and a story, which is still better than most days, right? And the odd rare catch is worth bringing in even after the big prize is gone, so nobody's time is a total write-off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = {
        { id = "o_troll", when = { race = "Troll" }, text = "Tell me about it, pal, but you trolls are a different market entirely. Your people were pulling dinner out of the sea before this city had walls, so I'm counting on a Darkspear to show these orcs how it's done." },
        { id = "o_default", text = "You're telling me! I've been here since sunup and the best I got was an orc asking if he could use an axe. But a hard market's still a market, and the trolls down the valley listen better." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pays = {
      lines = { { id = "p_default", text = "The Cartel does, and gladly, because a contest fills every inn bed and bar stool in Booty Bay. Every angler I send south is a customer for somebody, and I get my cut off the top, so everybody's happy." } },
      choices = {
        { text = "So the fish are just bait for the anglers.", next = "bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prize = {
      lines = { { id = "pz_default", text = "Now that's a pro's question! The winner walks off with a fine pole and a purse of gold, and the honour of having every angler in Booty Bay buy them a drink. Between you and me, pal, the drinks are worth more than the purse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bait = {
      lines = { { id = "b_default", text = "Ha! Now you're thinking like a goblin, and I mean that as the highest praise I've got. The fish are real and the prize is real, friend, and so's the bar tab, and that's what I call an honest deal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold rockets, tonics and one bridge, pal, and fish are the easiest pitch of the lot. Nobody ever got their eyebrows blown off by a fish." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel runs Booty Bay, Ratchet and Gadgetzan, and it'll sell to anybody with coin. That's not politics, friend, that's good business." } },
    _none = { { id = "tp_none", text = "Is there a fish in it? No? Then I can't help ya, pal, I'm strictly an angling man this week." } },
  },
}

-- Furmund: tauren in the Valley of Strength during the Feast of Winter Veil.
P:NPC {
  key = "furmund", id = TODO_NPC("Furmund"), name = "Furmund", gender = "male",
  bible = "bibles/missed_a.md", role = "elder", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "disapproving" }, values = { "traditional", "gentle" },
  notices = { "race", "class" },
  impression = {
    first = "Furmund stands apart from the Winter Veil stalls in the Valley of Strength, a tauren watching the goblins sell sweets with the patience of someone watching rain ruin a hide. He is not angry, only sorry, and he would like someone to ask him why.",
    third = "{name} met Furmund, a tauren troubled by what the goblins have made of Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Greetings to you this Winter Veil, {class}. Stand with me a moment, away from the noise of the stalls." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the quiet side of the valley. I am glad of it, friend." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Reason for the Season") }, text = "You carry the old story with you now, and I can see it sits well. May it warm you longer than any goblin's cider." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains, here among the stalls. You remember how the season was kept in Mulgore, I hope, before it came with a price on it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_active", when = { questActive = TODO_QUEST("The Reason for the Season") }, text = "Have you been to Sagorne Creststrider yet? He keeps to Grommash Hold, and he tells the story of the season better than I ever could." },
        { id = "h_default", text = "I am Furmund, of Thunder Bluff. I came to share the Feast of Winter Veil with our orc brothers, and I find the goblins of Smokywood Pastures have arrived before me and put the whole season up for sale." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of me, friend?" },
        { id = "h_again2", text = "Speak, and take your time. The stalls will still be shouting when we finish." },
      },
      choices = {
        { text = "What troubles you about the stalls?", next = "stalls" },
        { text = "What is the season truly about?", next = "season" },
        { text = "Tell me what you'd have me do.", next = "BUSINESS" },
        { text = "The goblins are only feeding people.", next = "feeding" },
        { text = "I am of Mulgore too. How did our elders keep the season?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Good Winter Veil, Furmund.", next = "END" },
      },
    },
    stalls = {
      lines = { { id = "s_default", text = "They have taken a time of rest and remembering and hung bright paper on it, so that it may be sold by the crate. A young orc today could believe Winter Veil was invented by a merchant, and that grieves me." } },
      choices = {
        { text = "Who are Smokywood Pastures?", next = "smokywood" },
        { text = "Something else, Furmund.", next = "BACK" },
      },
    },
    smokywood = {
      lines = { { id = "sm_default", text = "They are goblin traders who deal in holiday food and drink, and they are very good at it. I do not say their cider is poor, friend, only that a full belly is the smallest gift the winter has to give." } },
      choices = {
        { text = "Have you told them so?", next = "told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    told = {
      lines = { { id = "t_default", text = "I have, and the goblin thanked me kindly and asked whether I would like my complaint wrapped. There is no quarrelling with such people, so I speak instead to those who pass, one at a time, as the grass grows." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    season = {
      lines = {
        { id = "se_shaman", when = { class = "SHAMAN" }, text = "You speak with the elements, so you have felt the land go quiet under the snow. The season honors that quiet, and Sagorne Creststrider in Grommash Hold knows the whole of the telling, as one shaman to another." },
        { id = "se_default", text = "It is older than any stall, and it belongs to the turning of the land, when the winter lays its veil down and the earth rests beneath it. I know the heart of the story, but Sagorne Creststrider in Grommash Hold knows the words." },
      },
      choices = {
        { text = "Why not tell it yourself?", next = "yourself" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yourself = {
      lines = { { id = "y_default", text = "Because a story is best taken from the one who keeps it, as water is best taken from the spring. Sagorne is a shaman and a patient teacher, and the walk to the Hold will carry you clear of the noise besides." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "We kept it with fires on the high mesas and long tellings through the dark, and every hunter brought back a share for those who could not hunt. Nobody sold anything, little one, because nobody owned the winter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feeding = {
      lines = { { id = "f_default", text = "They are, and I would not take one sweet from a child's hand. I ask only that the feast have a reason behind it, for a herd that forgets why it gathers will one day forget to gather at all." } },
      choices = { { text = "That's fairly said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of Thunder Bluff, and I walk to Orgrimmar each winter to keep the feast with the orcs. It is a long road, and a good one." } },
    _none = { { id = "tp_none", text = "I cannot say, friend. I am only a visitor here, and I know the plains better than these canyons." } },
  },
}

-- Cenarion Emissary Blackhoof: the Cenarion Circle's voice in the Valley of Wisdom.
P:NPC {
  key = "emissary_blackhoof", id = TODO_NPC("Cenarion Emissary Blackhoof"), name = "Cenarion Emissary Blackhoof", gender = "male",
  bible = "bibles/missed_a.md", role = "emissary", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "grave" }, values = { "balance", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "Cenarion Emissary Blackhoof stands in the Valley of Wisdom in the plain leathers of the Circle, a tauren who speaks for druids of two peoples and belongs wholly to neither camp. He has come to ask Orgrimmar for help, and he asks without hurry.",
    third = "{name} met Cenarion Emissary Blackhoof, who speaks for the Cenarion Circle in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "The winds have brought you to me, {class}, and I am glad of it. The Cenarion Circle has need of willing hands." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again, friend. The sands have not grown quieter since we last spoke." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and one who has walked in Moonglade, I think. Then you know already that the Circle asks nothing lightly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Blackhoof, emissary of the Cenarion Circle. You and I answer to the same teachers, young one, so I will speak plainly: the Circle is stretched thin in Silithus, and it has sent me to ask the Horde for aid." },
        { id = "h_default", text = "I am Blackhoof, and I speak in Orgrimmar for the Cenarion Circle. We are druids, tauren and night elf together, and we tend the land's hurts wherever they open, which of late means the desert of Silithus." },
        { id = "h_dr_young", when = { class = "DRUID", maxLevel = 20 },
          text = "A young druid, so far from Elder Rise! The Circle will ask more of you than you can give for many seasons yet, so go home to Turak, and grow, and come back to me when the desert won't eat you whole." },
        { id = "h_dr_sixty", when = { class = "DRUID", minLevel = 55 },
          text = "You carry the whole of the path now, the bear and the cat and the moon, and I can feel it from here. The Circle at Cenarion Hold could use a druid like you more than it can say, and I'll say it for them." },
      },
      again = {
        { id = "h_again", text = "What more would you know?" },
        { id = "h_again2", text = "Ask, friend. A question costs the land nothing." },
      },
      choices = {
        { text = "What is happening in Silithus?", next = "silithus" },
        { text = "Tauren and night elves, working together?", next = "together" },
        { text = "How can I help the Circle?", next = "BUSINESS" },
        { text = "Why ask the orcs for help?", next = "orcs" },
        { text = "What would the Circle ask of a druid like me?", next = "d_hold", when = { class = "DRUID", minLevel = 50 } },
        { text = "Does Malfurion know what stirs in Silithus?", next = "d_stormrage", when = { class = "DRUID", minLevel = 50 } },
        { text = "Would the Circle ever take an orc or troll as a druid?", next = "d_horde", when = { race = { "Orc", "Troll" } } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    d_hold = {
      big = true,
      lines = { { id = "dr_bh_default", text = "Everything, I'm afraid, and gently. The druids at Cenarion Hold are stretched across a desert that wants them dead, and they need bears to stand before the hives and healers to keep the bears standing. They'll also ask you to set down the Horde's quarrels at the gate, which for some is the hardest part." } },
      choices = {
        { text = "Then I'll set them down. The land comes first.", next = "BACK",
          reply = "Spoken like one of the Circle, and I'll write to the Hold that you're coming. Bring water; the desert takes it from you faster than you'd think.",
          fx = { affinity = 1, align = { honor = 1 }, opinion = { druids = "balance" } } },
        { text = "I'll serve the Circle, but I won't forget the Horde.", next = "BACK",
          reply = "Nor should you, and I haven't either, whatever the elves think. Only keep your quarrels outside the Hold's walls, and we'll get along well enough.",
          fx = { align = { honor = -1 }, opinion = { druids = "duty" } } },
        { text = "Who leads the Circle in the desert?", next = "d_hold2" },
      },
    },
    d_hold2 = {
      lines = { { id = "dr_bh2_default", text = "Keepers and arch druids who answer to Moonglade, and Moonglade answers to Keeper Remulos while Malfurion sleeps. I won't pretend every one of them is glad to see a tauren in their councils, but they've all learned that a tauren bear holds a line as well as any elf." } },
      choices = { { text = "Something else, Emissary.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    d_stormrage = {
      lines = { { id = "dr_bs_default", text = "If he does, he hasn't said so; he sleeps in the Dream, and the Dream is troubled enough on its own account. The elders of the Circle say the night elves sealed something behind that great wall long ago, and I think if Malfurion were awake, he'd be standing in the desert beside us." } },
      choices = {
        { text = "Then we'll have to stand there in his place.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    d_horde = {
      big = true,
      lines = {
        { id = "dr_bo_default", text = "No orc has ever asked, which surprised me when I came here, because your shamans listen to the land as closely as any druid. The Circle is slow to open a door, friend, and it took Malfurion's own word to open one for my people, but I'd carry the request to Moonglade myself if an orc ever brought it to me." },
        { id = "dr_bo_troll", when = { race = "Troll" }, text = "None has asked, and I'll be honest, the kaldorei of the Circle remember the old troll empires as the hand that burned their first forests. I'd carry the request to Moonglade if a Darkspear brought it to me, but I'd not promise you a kind answer." },
      },
      choices = {
        { text = "Then the Circle isn't as neutral as it claims.", next = "BACK",
          reply = "It isn't, and I've said as much in Moonglade, and been glared at for it. Neutral is a thing we try to be, friend, not a thing we are.",
          fx = { align = { order = -1 }, opinion = { druids = "closed" } } },
        { text = "My people have the spirits. We don't need the Circle.", next = "BACK",
          reply = "Perhaps not, and your shamans have done well by the land without us. The Circle would still be glad of your help in Silithus, if not of your vows.",
          fx = { align = { order = 1 }, opinion = { druids = "respect" } } },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    silithus = {
      lines = { { id = "s_default", text = "The silithid are stirring there, great insects that tunnel and build and strip the land bare around their hives. The Circle keeps a hold in the desert to watch them, and those who watch are too few for what they see.", fx = { learn = { "silithid" } } } },
      choices = {
        { text = "Where do the silithid come from?", next = "from" },
        { text = "I've seen their hives elsewhere.", next = "elsewhere" },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "f_default", text = "From the far south of the desert, behind a great wall the night elves raised long ago and do not like to speak of. I have asked my elder brothers of the Circle what sleeps behind it, and they answer me with silence." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    elsewhere = {
      lines = { { id = "e_default", text = "Then you have seen more than most, for they have dug into Tanaris, Feralas and the Thousand Needles as well. One hive is a wound, friend, and many hives so far apart are a sickness, which is why the Circle no longer waits." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    together = {
      lines = {
        { id = "t_tauren", when = { race = "Tauren" }, text = "You know the tale as I do, that it was the night elves who woke the druid's gift in our people again. A herd does not forget who led it to water, whatever banners fly now." },
        { id = "t_default", text = "In Moonglade and in the Circle's camps, yes, though seldom anywhere else. The land does not ask which banner a healer was born under, and so we have agreed not to ask it of each other." },
      },
      choices = {
        { text = "That peace can't be easy to keep.", next = "peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "It is not, and I will not pretend otherwise in a city whose kin cut timber in Ashenvale. There are elves in the Circle who will not share a fire with me, and still we stand the same watch." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Because the orcs have strength to spare and a warchief who listens to shaman, and because the silithid will not stop at the desert's edge. I would sooner ask for help early than beg for it late." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a hunter on the plains of Mulgore before I was a druid, and a druid before I was an emissary. Each seemed a long walk at the time." } },
    silithid = { { id = "tp_sil", text = "They are many, and they are patient, and they do not tire. The Circle watches them from its hold in Silithus." } },
    _none = { { id = "tp_none", text = "That lies outside what the Circle sent me to speak of, friend. Ask among the orcs, whose city this is." } },
  },
}

-- Frezza: goblin zeppelin master for the Undercity run, at the tower outside Orgrimmar.
P:NPC {
  key = "frezza", id = TODO_NPC("Frezza"), name = "Frezza", title = "Zeppelin Master", gender = "male",
  bible = "bibles/missed_a.md", role = "zeppelin master", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk", "pushy" }, values = { "practical", "greedy" },
  notices = { "class", "race" },
  impression = {
    first = "Frezza runs the Undercity zeppelin from the tower outside Orgrimmar, a goblin with a schedule in one hand and a list of rules in his head. He swears the service is perfectly safe, and then explains at length what passengers must not set on fire.",
    third = "{name} met Frezza, the goblin zeppelin master on the Orgrimmar to Undercity run.",
  },
  greetings = {
    { id = "g_default", text = "Undercity zeppelin, pal, this platform right here! Stand back from the edge and have a little patience, because she comes when she comes." },
    { id = "g_back", when = { metBefore = true }, text = "A returning passenger, and that's my favourite kind, friend. It means the last trip landed." },
  },
  notice = {
    { id = "n_fire", cat = "class", when = { class = { "MAGE", "WARLOCK", "SHAMAN" } },
      text = "Whoa, whoa, I know that look and I'm telling ya now: no fire spells on my ship. That's a great big bag of gas up there, and my liability doesn't stretch to it." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Heading home to the Undercity, friend? You folks are my steadiest fares, and you never complain about the cold up top." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Frezza's the name, and I'm the zeppelin master for the Tirisfal run. One ship, straight across the sea to the tower outside the Undercity, and it's the safest way to cross that anybody's selling, pal." },
      },
      again = {
        { id = "h_again", text = "What else d'you need? Talk fast, I'm watching the sky." },
        { id = "h_again2", text = "Go on, friend, she's not in sight yet." },
      },
      choices = {
        { text = "How safe is the zeppelin, really?", next = "safe" },
        { text = "What will I find at the other end?", next = "undercity" },
        { text = "A goblin crew, flying for the Horde.", next = "goblins" },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Completely safe, friend, on my mother's ledger, so long as everybody aboard follows two little rules. There's no smoking on deck and no fire magic of any kind, and I mean not even a spark to warm your hands." } },
      choices = {
        { text = "What happens if someone breaks the rules?", next = "rules" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rules = {
      lines = {
        { id = "r_mage", when = { class = "MAGE" }, text = "Then you and me and the whole crew learn to swim from a great height, pal. I've had mages tell me they've got perfect control, and I tell every one of them the same thing: control it on the ground." },
        { id = "r_default", text = "Then we all come down a lot faster than the schedule says, and I've got paperwork till Winter Veil. It hasn't happened on my run yet, and I mean to keep it that way." },
      },
      choices = { { text = "No fire. Understood.", next = "BACK" } },
    },
    undercity = {
      lines = { { id = "u_default", text = "You land in Tirisfal Glades, which is grey and wet and smells like old flowers, and the Undercity's a short walk down through the ruins of Lordaeron. The Forsaken are polite enough hosts, but don't eat anything an apothecary hands ya." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "g_default", text = "Steamwheedle built 'em and Steamwheedle flies 'em, friend, and the Horde pays the invoice on time, which makes 'em a valued customer. My sister Snurk works the Stranglethorn run off this same tower, and between us the family's got both routes sewn up.", fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "Which of you has the better route?", next = "sister" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = { { id = "si_default", text = "She gets sunshine and the jungle, and I get rain and dead people, so you tell me. But my passengers don't get airsick, on account of most of 'em haven't got the stomach for it any more, so I come out ahead on cleaning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've been flying since before I could reach the wheel, pal. It's steady work, and the view beats a counting-house." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel does business with everybody, friend. The Horde just happened to want airships first." } },
    _none = { { id = "tp_none", text = "Not my department, pal. I do departures, arrivals and fire safety, and that's the whole list." } },
  },
}
