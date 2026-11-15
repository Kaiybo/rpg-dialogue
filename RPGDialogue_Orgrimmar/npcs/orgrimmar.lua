-- Orgrimmar. Voice: bibles/orgrimmar.md
-- Neeru Fireblade's secret (he runs the Burning Blade) never slips from his own mouth;
-- Thrall's lines show he already suspects.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thrall", id = TODO_NPC("Thrall"), name = "Thrall",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "steady" }, values = { "honorable", "compassionate", "cunning" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "Thrall carries Orgrim Doomhammer's hammer and spends every day trying to deserve it. He listens like a shaman and speaks like a chieftain, and he has plainly never forgotten what it was to be a slave.",
    third = "{name} stood before Thrall, Warchief of the Horde, in Grommash Hold in Orgrimmar.",
  },

  greetings = {
    { id = "g_warchief", text = "Lok'tar. Speak freely, warrior. In this hall, every voice of the Horde is heard." },
    { id = "g_orc", when = { race = "Orc" }, text = "{g:Brother|Sister}, we were slaves once, and now we have a home. Never let anyone make us forget either." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and the Horde is stronger for every warrior who comes back. Sit with me a while." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The elements spoke to me when I had nothing else. Listen to them, and they'll never leave you alone." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. The Horde has a long, bitter history with your arts, and I'll judge you by what you do with them, as will everyone else." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken stand with us. I won't pretend I understand the Dark Lady, but I understand being made into something you never chose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thrall, Warchief of the Horde. Orgrim Doomhammer gave me his hammer and his people with his last breath. I've spent every day since trying to deserve both." },
        { id = "h_garthok", when = { heardLine = "garthok.h_default" },
          text = "You've reported to Gar'Thok at Razor Hill. Nazgrel trained him well, and I sleep easier knowing he holds the crossroads." },
        { id = "h_hidden", tags = { "news" }, when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "Some in my city wear the Horde's colours and serve older masters. I need someone they'll trust, so earn that trust, and then bring me what they know." },
        { id = "h_hidden_done", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You did well in the chasm. The rot isn't gone; it never is entirely. But it's weaker, and it knows I'm watching." },
        { id = "h_neeru", when = { heardLine = "neeru.h_default" },
          text = "The Cleft, was it? Neeru Fireblade is very helpful, isn't he? Keep being helpful back, quietly, and tell me what he says." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "The Windshapers, then. The Earthen Ring vouched for you and the tauren took you in, and that's good enough for me. Welcome to the Horde." },
      },
      choices = {
        { text = "What does the Horde stand for?", next = "horde" },
        { text = "What of the humans at Theramore?", next = "theramore" },
        { text = "You already suspect Neeru Fireblade, don't you?", tag = "Persuade", next = "neeru_suspect",
          when = { heardLine = "neeru.h_default" },
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Hidden Enemies") }, { trait = "skeptical" } } } },
          fail = { next = "neeru_not_yet", fx = { affinity = -1 } } },
        { text = "For the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I fight for myself first, Warchief.", next = "END", fx = { align = { honor = -1 } } },
      },
    },
    horde = {
      big = true,
      lines = {
        { id = "hd_default", text = "Once it stood for conquest. The demons made us into a weapon and pointed us at the world. Now it stands for survival, and for honour, and for each other. I mean to keep it that way." },
      },
      choices = {
        { text = "I'll help you keep it.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Survival matters more than honour, Warchief.", next = "END", fx = { align = { honor = -1 } } },
        { text = "Not everyone agrees.", next = "agree" },
      },
    },
    agree = {
      lines = { { id = "a_default", text = "No. Some still dream of the old fire, so I watch them, and I give them chances, and when they betray us, I don't miss." } },
      choices = { { text = "...", next = "END" } },
    },
    neeru_suspect = {
      lines = {
        { id = "ns_default", text = "Since the day he offered to watch the Burning Blade for me. Nobody knows that much about a fire without standing close to it, and Neeru knows a great deal. I keep him where I can see him, and I let him think I'm grateful." },
        { id = "ns_chasm", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You've been down in the chasm and seen what crawls there, so yes, I suspect him. A snake I can see is safer than one I can't, and so he stays in the Cleft, and I watch him smile." },
      },
      choices = {
        { text = "Your secret is safe with me, Warchief.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep listening to him, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    neeru_not_yet = {
      lines = {
        { id = "nn_default", text = "Neeru serves the Horde, as you do. If you have proof, bring it to me; if you have only a feeling, keep it to yourself for now." },
        { id = "nn_stranger", text = "I don't speak ill of my advisors to someone I barely know. Earn that, and ask me again." },
      },
      choices = { { text = "Understood, Warchief.", next = "BACK" } },
    },
    theramore = {
      lines = { { id = "t_default", text = "Jaina Proudmoore is a friend, though her people and mine aren't. We keep the peace between us with our own hands, because nobody else will. It is harder than any battle I've fought." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Warchief hears from every corner of the Horde, though not always the truth. Ask me about these, and I'll tell you what I believe." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've earned straight answers from me, and I'll give you as many as I have." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, because a Warchief answers his people, even the ones he isn't sure of yet." },
    },
    cenarion_circle = { { id = "tp_circle", text = "The tauren walk with them, and I'm glad of it; the world needs more who heal than wound." } },
    wailing_caverns = { { id = "tp_caverns", text = "The tauren have told me of something sick under the Barrens. When our young warriors are ready, they'll go in." } },
    burning_blade = { { id = "tp_blade", text = "Some of my own people still kneel to the old fire. They hide better than they think, and not as well as they hope." } },
    echo_isles = { { id = "tp_isles", text = "The Darkspear will have their home back. I gave Vol'jin my word, and I don't give it lightly." } },
    _none = { { id = "tp_none", text = "I don't know, but ask my advisors, and then come and tell me what they said, in plain words." } },
  },
}

P:NPC {
  key = "voljin", id = TODO_NPC("Vol'jin"), name = "Vol'jin",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "wry" }, values = { "cunning", "loyal", "wise" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "Vol'jin only talks to the interesting ones, he says, and he watched me the whole time as if deciding which I was. His humour is sly, but his debt to Thrall runs deeper than any joke.",
    third = "{name} met Vol'jin, chief of the Darkspear trolls, who stands at the Warchief's side in Orgrimmar.",
  },

  greetings = {
    { id = "g_hall", text = "Come, sit. The Warchief talk to everybody, but Vol'jin only talk to the interesting ones, so let's see which you be." },
    { id = "g_troll", when = { race = "Troll" }, text = "Darkspear! Stand up straight, mon. You carry the tribe's name everywhere you walk now." },
    { id = "g_back", when = { metBefore = true }, text = "You come back, good. That mean you still alive, and still interesting." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You talk to the spirits too, eh? Careful which ones answer, because some of them be hungry." },
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, in the Warchief's hall. Elves don't trust trolls easy, and that be fair, since we got history. I don't take offense, not yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Vol'jin, chief of the Darkspear. Thrall stand with my people when nobody else would. Now I stand at his side and tell him what he don't want to hear." },
        { id = "h_nimboya", when = { heardLine = "nimboya.h_default" },
          text = "Nimboya find you in the jungle, eh? Then you know my youngest be lost down there. Nimboya bring him home, or nobody will." },
        { id = "h_gadrin", when = { heardLine = "gadrin.h_default" },
          text = "You see old Gadrin? He still tell people I be his best student? Good, because he right." },
      },
      choices = {
        { text = "Why follow Thrall?", next = "thrall" },
        { text = "What happened to the Echo Isles?", next = "isles" },
        { text = "Farewell, Vol'jin.", next = "END" },
      },
    },
    thrall = {
      big = true,
      lines = {
        { id = "t_default", text = "When the murlocs come for us, Thrall fight beside us. My father die that day, and Thrall don't leave. A debt like that, you pay with your whole life." },
      },
      choices = {
        { text = "That's a heavy debt.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A debt's only as heavy as you let it be.", next = "END", fx = { align = { honor = -1 } } },
      },
    },
    isles = {
      lines = {
        { id = "i_default", text = "Zalazane be my friend since we was small, and now he wear our home like a mask. Gadrin work to take it back, and one day we do it, mon. One day." },
      },
      choices = {
        { text = "I'll help when that day comes.", next = "END", fx = { affinity = 2, learn = { "echo_isles" } } },
        { text = "Part of you still hopes to find your friend in him.", tag = "Persuade", next = "zalazane_friend",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Troll" }, { heardLine = "gadrin.h_default" } } } },
          fail = { next = "zalazane_closed", fx = { affinity = -1 } } },
      },
    },
    zalazane_friend = {
      lines = {
        { id = "zf_default", text = "When we was small, Zalazane dare me to swim to the far rock, and when I tire, he swim out after me. Some nights I think that boy still be in there, under all the voodoo. Then I remember what he do to our people, and I know I got to stop him anyway." },
        { id = "zf_troll", when = { race = "Troll" },
          text = "You be Darkspear, so you know what it mean to lose a brother to bad magic. Yes, I hope. Hope be a foolish thing for a chief to carry, and I carry it anyway, and I don't tell the Warchief." },
      },
      choices = {
        { text = "Hope isn't foolish, Vol'jin.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep that to myself.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    zalazane_closed = {
      lines = {
        { id = "zc_default", text = "Zalazane be my enemy, and that be all you need to know about him, mon." },
        { id = "zc_quick", text = "You reach for a chief's heart quick, mon. Slow down, and maybe one day I show you." },
      },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Vol'jin hear plenty, mon: from the Warchief, from the spirits, and from the trolls who whisper in the corners. Ask me about these." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You be a friend now, so I tell you straight, with no riddles, or not many." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I tell you some, but Vol'jin don't hand his whole mind to strangers." },
    },
    yenniku = { { id = "tp_yenniku", text = "He be my son. Say his name careful, mon; I say it every night." } },
    echo_isles = { { id = "tp_isles", text = "I see them in my sleep: the sand, the sea, the old huts, and Zalazane's puppets walking where my father walked." } },
    burning_blade = { { id = "tp_blade", text = "Orcs who miss the demons. The Warchief watch them closer than they think, and so do I." } },
    _none = { { id = "tp_none", text = "Vol'jin don't know that one, and Vol'jin don't pretend." } },
  },
}

P:NPC {
  key = "neeru", id = TODO_NPC("Neeru Fireblade"), name = "Neeru Fireblade",
  bible = "bibles/orgrimmar.md", role = "questgiver", tier = "major",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "proud" },
  notices = { "class", "fel" },
  impression = {
    first = "Smooth-spoken Neeru Fireblade calls himself a loyal servant of the Warchief, which may well be true. He watches the Horde's fire-worshippers very closely, and I cannot quite tell how he feels about what he sees.",
    third = "{name} met Neeru Fireblade in the Cleft of Shadow, who claims to keep watch over those in the Horde who still play with fire.",
  },

  greetings = {
    { id = "g_cleft", text = "The Cleft of Shadow welcomes you. Don't be alarmed by the dark; it keeps the curious out, and the useful in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my capable friend. I was hoping you'd return. I have more work for capable friends." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A fellow student of the deeper arts. We're misunderstood, you and I. Thankfully, we understand each other." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, how quaint. The elements are so very polite, aren't they? Do come back if you ever want more than politeness." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Neeru Fireblade, loyal servant of the Warchief. I keep an eye on those in the Horde who still play with fire. Someone with experience must, after all." },
        { id = "h_burning", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Shadows") },
          text = "An eye, taken from a cultist's body? How dreadful. Bring it to me, and I'll see that it's dealt with properly." },
        { id = "h_akzeloth", when = { questActive = TODO_QUEST("Ak'Zeloth") },
          text = "My assistant will guide you. There's a seed of something unpleasant in the Barrens. We wouldn't want it growing where the wrong people could tend it." },
        { id = "h_hidden", when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "The Searing Blade in Ragefire are so eager, so very eager to prove themselves. Deal with their leaders, would you? It will clarify things, I think." },
      },
      choices = {
        { text = "What is the Burning Blade?", next = "blade" },
        { text = "What do you think of Thrall?", next = "thrall" },
        { text = "Thrall's patience will be the death of the Horde.", tag = "Deceive", next = "neeru_opinion",
          check = { pass = { any = { { disposition = { min = 60 } }, { class = "WARLOCK" }, { trait = "cruel" } } } },
          fail = { next = "neeru_loyal", fx = { affinity = -1 } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Fanatics, leftovers from the old days who still crave the fire the demons gave us. They're dangerous, foolish, and ever so useful to watch, and I watch them very closely." },
      },
      choices = {
        { text = "Good. Keep watching.", next = "END", fx = { affinity = 1 } },
        { text = "You seem to know them well.", next = "know", fx = { trait = { skeptical = 1 } } },
      },
    },
    know = {
      lines = { { id = "k_default", text = "One studies one's enemies, as surely you know. Now, I'm terribly busy." } },
      choices = { { text = "...", next = "END" } },
    },
    neeru_opinion = {
      lines = {
        { id = "no_default", text = "Careful, speaking that way in Orgrimmar. Though between friends, the Warchief's patience is a marvel: he waits so long to strike that his enemies grow old and comfortable, and some of them grow rather powerful." },
        { id = "no_warlock", when = { class = "WARLOCK" },
          text = "A fellow practitioner, saying such things aloud! I agree entirely, in theory, of course. The Horde was strong once, when it wasn't afraid of what made it strong, and some of us haven't forgotten how that felt." },
      },
      choices = {
        { text = "We understand each other.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll remember you said that.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    neeru_loyal = {
      lines = {
        { id = "nl_default", text = "What a curious thing to say to the Warchief's loyal servant. I shall pretend I didn't hear it, and you'll pretend you never said it." },
        { id = "nl_clumsy", text = "Oh, that was clumsy, friend. If you want to know what I think, you'll have to be far more interesting than that." },
      },
      choices = { { text = "Forget I spoke.", next = "BACK" } },
    },
    thrall = {
      lines = { { id = "t_default", text = "A great leader, with such vision, such patience, such faith in people. It's very touching." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I hear all sorts of things down here in the Cleft, and I'm generous with most of them. Ask about whatever catches your eye." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "For a friend as capable as you, I'll share everything I know, or nearly everything; one must keep a little back." },
    },
    _none = { { id = "tp_none", text = "I couldn't say, but do tell me if you hear anything interesting. I collect interesting things." } },
  },
}

P:NPC {
  key = "gryshka", id = TODO_NPC("Innkeeper Gryshka"), name = "Innkeeper Gryshka",
  bible = "bibles/orgrimmar.md", role = "innkeeper", tier = "service",
  communities = { "orgrimmar" }, temper = { "hearty" }, values = { "generous" },
  notices = { "weary", "hunger" },
  impression = {
    first = "Innkeeper Gryshka insists on meat first and stories after, and nobody leaves the Broken Tusk hungry. Mention Zargh, though, and she grows flustered, which is the most charming thing I have seen in Orgrimmar.",
    third = "{name} found a seat at the Broken Tusk, where Innkeeper Gryshka feeds Orgrimmar's warriors and keeps the inn loud.",
  },

  greetings = {
    { id = "g_tusk", text = "Sit, warrior. Food first, then you tell me who you fought. That's the price of a seat at the Tusk." },
    { id = "g_home", when = { homeInn = { "Orgrimmar", "Valley of Strength" } }, text = "The Tusk missed you! Your bed's warm and there's a haunch on the spit, so your timing's good." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've got blood everywhere, and some of it's yours. Sit down and eat before you fall down. Meat first, always meat first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Gryshka, and I keep the Broken Tusk, and I keep it fed. Nobody leaves my inn hungry, and a few leave too full to walk." },
        { id = "h_zargh", when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "From Zargh? Choice cuts from the Barrens! He remembered, of course he remembered. Tell him, well, tell him the meat was very good." },
        { id = "h_zargh_ack", when = { heardLine = "zargh.h_default" },
          text = "Zargh, at the Crossroads? Did he mention me, did he really, and what did he say? No, don't tell me, or, well... yes, tell me!" },
        { id = "h_bones", when = { questDone = TODO_QUEST("Meats to Orgrimmar") }, text = "Zargh's kept sending cuts since that first delivery, and I send back the bones, clean. Let him wonder what it means; I'm still wondering myself." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, and the Tusk is loud, which is good. A quiet inn in Orgrimmar means something's wrong." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What's the best thing you cook?", next = "best" },
        { text = "Just resting.", next = "END" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, slow-roasted, or boar if the hunters are lucky, or anything Zargh sends, if I'm lucky." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone who eats at the Tusk talks with their mouth full, and I hear every word of it. Ask me about any of this, and then eat something." },
    },
    _none = { { id = "tp_none", text = "Ask the regulars; they know everything, and drink to the rest." } },
  },
}

P:NPC {
  key = "gamon", id = TODO_NPC("Gamon"), name = "Gamon",
  bible = "bibles/orgrimmar.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "resigned" }, values = { "patient" },
  notices = { "class", "drink" },
  impression = {
    first = "Gamon was a warrior once and now spends most days on the inn floor, knocked down by whoever wants an easy fight. He always gets back up, which is the saddest and bravest thing about him.",
    third = "{name} met Gamon, a weary tauren in Orgrimmar who has been knocked down so often he no longer asks why.",
  },

  greetings = {
    { id = "g_sigh", text = "Oh, hello. You're not going to hit me, are you? Everyone hits me, and I've stopped asking why." },
    { id = "g_low", when = { maxLevel = 5 }, text = "Another young one. Let me guess: you heard there's a tauren in the inn you can beat up. There is, but please don't." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior? I was one too, once, and then I started drinking, and then people started hitting me. I'm not sure which came first anymore." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're drunk too, finally someone who understands! Sit down, only please don't hit me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gamon. I help Tazan with his trade when I'm sober, and I'm usually here, lying on the floor because someone's knocked me down again." },
        { id = "h_bruise", when = { metBefore = true }, text = "Oh, you again. You didn't hit me last time, which makes you my favourite person in Orgrimmar. It's a short list." },
      },
      choices = {
        { text = "Why does everyone attack you?", next = "why" },
        { text = "I won't hit you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Bye, Gamon.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I'm here, I suppose, and I always get back up. Maybe that's the trouble; maybe if I stayed down, they'd get bored." },
      },
      choices = {
        { text = "Never stay down, Gamon.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then stay down, and let them get bored.", next = "END", fx = { align = { honor = -1 } } },
        { text = "...", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. I spend most days looking at the ceiling, and it's a nice ceiling." } },
  },
}
