-- Tarren Mill (Horde, Forsaken). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "darthalia", id = TODO_NPC("High Executor Darthalia"), name = "High Executor Darthalia",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "tarren_mill" }, temper = { "cold" }, values = { "loyal", "relentless" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_front", text = "You stand at the front. The Dark Lady's front. Be useful to it, or stand somewhere else." },
    { id = "g_back", when = { metBefore = true }, text = "Returned. Good. The front moves forward only when people like you push it." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living allies. The Horde lends us blades and we are grateful. Keep them pointed south." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "Scourge" },
      text = "A warrior of the Forsaken. Good. The dead don't tire. Neither should we." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "High Executor Darthalia. I hold Tarren Mill for the Dark Lady and Lord Varimathras, and I push the line against the humans of Southshore. One field at a time, if I must." },
        { id = "h_strike", tags = { "news" }, when = { questActive = TODO_QUEST("Time to Strike") },
          text = "The humans are slow and comfortable. Time we reminded them otherwise, before they notice how far we've come." },
        { id = "h_syndicate", when = { questActive = TODO_QUEST("WANTED: Syndicate Personnel") },
          text = "The Syndicate are thieves who think the land still belongs to their grandfathers. Remind them the land belongs to the dead now." },
        { id = "h_battle", tags = { "news" }, when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "Hillsbrad's fields feed Southshore. Take the fields, and Southshore starves. It is simple arithmetic, and I am very good at arithmetic." },
        { id = "h_vardus", when = { questActive = TODO_QUEST("WANTED: Baron Vardus") },
          text = "Vardus. A baron of a kingdom that no longer exists, hiding among thieves in the Uplands. Bring me his head. He may keep the title." },
        { id = "h_dangerous", when = { questActive = TODO_QUEST("Dangerous!") },
          text = "Four names. Each one killed one of mine, and each hides among the farmers. The living are very bad at hiding from the dead." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "You've met Lydon. Brilliant, devoted, and he complains about the fresh air. Leave him his complaints. The plague will need them." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The living sleep. We do not. Every night, the line moves a little closer to Southshore." },
      },
      again = {
        { id = "h_again", text = "What else. Be brief." },
        { id = "h_again2", text = "Continue. You are not dismissed yet." },
      },
      choices = {
        { text = "Why fight for Southshore?", next = "why" },
        { text = "What are your orders, High Executor?", next = "orders" },
        { text = "What about the Syndicate?", next = "syndicate" },
        { text = "Who do you answer to?", next = "command" },
        { text = "I was of Lordaeron too, once.", next = "forsaken", when = { race = "Scourge" } },
        { text = "My people were caged in these hills.", next = "orc", when = { race = "Orc" } },
        { text = "The Darkspear hunt well. Point me at something.", next = "troll", when = { race = "Troll" } },
        { text = "My people do not make war on farmers.", next = "tauren", when = { race = "Tauren" } },
        { text = "Hillsbrad's farms are burning.", next = "after_battle", when = { questDone = TODO_QUEST("Battle of Hillsbrad") } },
        { text = "For the Dark Lady.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because this was Lordaeron, and the living drove us out of it after we died for it. We do not ask for it back. We take it back." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2 } },
        { text = "They're just villagers.", next = "villagers" },
      },
    },
    villagers = {
      lines = { { id = "v_default", text = "So were we. Once. Then the plague came and the villagers threw stones at us. Go and fight, or go away." } },
      choices = {
        { text = "And when the new plague is ready?", next = "plague" },
        { text = "I'll fight.", next = "BUSINESS", fx = { affinity = 1 } },
      },
    },
    plague = {
      lines = {
        { id = "pl_default", text = "Then the apothecaries finish what we started. Until then, we hold the fields and wait. Waiting is easy for the dead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "That's no kind of war.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    orders = {
      lines = {
        { id = "or_default", text = "Quell the human settlements of Hillsbrad until the Society's plague is ready. The farms first. Then the smith who arms them. Then Southshore." },
      },
      choices = {
        { text = "Why the farms first?", next = "farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farms = {
      big = true,
      lines = {
        { id = "fa_default", text = "Food, iron, nerve. Take the farms and they lose the first. Kill the smith and they lose the second. The third leaves on its own." },
      },
      choices = {
        { text = "Cold, but sound.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "By the Dark Lady's decree, every one of them is wanted dead. Those we capture are executed. It saves us posting guards on them." },
      },
      choices = {
        { text = "Where do they hide?", next = "durnholde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durnholde = {
      lines = {
        { id = "du_default", text = "In the ruins of Durnholde, southeast of here, where the humans once caged orcs. The irony is lost on them. Very little is lost on me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    command = {
      lines = {
        { id = "cm_default", text = "The Dark Lady, and Lord Varimathras, who speaks for her in these matters. I do not ask what passes between them. I advance the line." },
      },
      choices = {
        { text = "Varimathras is a demon.", next = "varimathras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    varimathras = {
      lines = {
        { id = "va_default", text = "He serves the Dark Lady, and he serves well. My opinion of what he is was not requested. Neither, I notice, was yours." },
      },
      choices = {
        { text = "Understood, High Executor.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Someone should be asking.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    forsaken = {
      lines = {
        { id = "fs_default", text = "Then you remember the stones, and the doors that shut in your face. Good. Remember them when you walk into Hillsbrad." },
      },
      choices = {
        { text = "I remember.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'd rather forget.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    orc = {
      lines = {
        { id = "oc_default", text = "Durnholde. Then we both have scores to settle here. Yours is older, mine is fresher. The Syndicate keep its ruins now. Start there." },
      },
      choices = { { text = "Gladly.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } } },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "So I am told. Hunt the Syndicate. They hide better than deer, and their hides are worth more to me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      big = true,
      lines = {
        { id = "ta_default", text = "Your Earth Mother does not walk these fields. The plague did, out of human granaries, and it took my life. Your scruples are noted, tauren. The order stands." },
      },
      choices = {
        { text = "Then I'll fight soldiers, not farmers.", next = "BACK", fx = { affinity = -1, align = { honor = 2, light = 1 } } },
        { text = "The Horde stands together. I'll go.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    after_battle = {
      lines = {
        { id = "ab_default", text = "As intended. The grip tightens, field by field. My reports to the Undercity have grown pleasantly short." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { tarren_mill = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I died for Lordaeron. Now I take it back for the Dark Lady. The account is simple.", next = "why" } },
    advice = { { id = "tp_ad", text = "Do not linger near Southshore's walls. Their guards are bored, and bored men shoot first." } },
    _none = { { id = "tp_none", text = "Irrelevant to the front. Ask someone with less to do." } },
  },
}

P:NPC {
  key = "lydon", id = TODO_NPC("Apothecary Lydon"), name = "Apothecary Lydon",
  bible = "bibles/hillsbrad.md", role = "scholar", tier = "quest",
  communities = { "tarren_mill" }, temper = { "glum" }, values = { "devoted" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_bored", text = "Oh. A visitor. How thrilling. Please, don't touch anything. Most of it will kill you, and the rest will make you wish it had." },
    { id = "g_back", when = { metBefore = true }, text = "Ah. I'd say I'm pleased. I'm not anything, really. But you're useful." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. Do you enjoy it? I used to enjoy things. Now I just find them interesting, in a distant sort of way." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You're alive. Warm. Breathing. It's very distracting. Try to breathe more quietly, would you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lydon, Royal Apothecary Society. I make things that hurt, for the Dark Lady's work. It's the only thing that still makes me feel much of anything. That and Umpi." },
        { id = "h_pain", tags = { "news" }, when = { questActive = TODO_QUEST("Elixir of Pain") },
          text = "A new elixir needs testing. On something living. Don't look at me like that; the frog's busy." },
        { id = "h_suffering", when = { questActive = TODO_QUEST("Elixir of Suffering") },
          text = "Suffering, in a bottle. It's harder to make than you'd think. Suffering out of a bottle is everywhere, of course." },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Master Apothecary Faranell in the Undercity wants this finished. When the Master wants something, one finishes it." },
        { id = "h_helbrim", when = { heardLine = "helbrim.h_default" },
          text = "Helbrim? In the Barrens, bottling cactus? Good for him. Someone in the Society should be getting a tan." },
        { id = "h_spring", when = { timeOfDay = "day" },
          text = "Flowers again. Birdsong. Fresh, clean air in every direction. Hillsbrad is unbearable in this weather." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night. Finally. Fewer birds." },
        { id = "h_innocents", tags = { "news" }, when = { questActive = TODO_QUEST("Blood of Innocents") },
          text = "A toxin to bleed the violence out of goblins. It needs innocent blood, and the Syndicate's shadow mages have been collecting it for me. How generous of them." },
      },
      again = {
        { id = "h_again", text = "What else? Not that it matters." },
        { id = "h_again2", text = "Go on. Umpi's listening too. She has nothing better to do." },
      },
      choices = {
        { text = "Who's Umpi?", next = "umpi" },
        { text = "What are you working on?", next = "work" },
        { text = "Why are you so miserable?", next = "misery" },
        { text = "Who do you work with?", next = "society" },
        { text = "Which reagents do you swear by?", next = "alch", when = { profession = "Alchemy" } },
        { text = "The Earth Mother would weep at your work.", next = "tauren", when = { race = "Tauren" } },
        { text = "Troll's blood? For your elixir?", next = "troll", when = { race = "Troll" } },
        { text = "Do you miss anything, from before?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    umpi = {
      lines = { { id = "u_default", text = "My frog. She sits there and I test things on her. She's had a remarkable career. Most of it brief." } },
      choices = {
        { text = "Brief?", next = "umpi_brief" },
        { text = "...poor Umpi.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    umpi_brief = {
      lines = {
        { id = "ub_default", text = "I poison her, she dies, I bring her back. Over and over. She's very forgiving. More than most of my colleagues." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      big = true,
      lines = {
        { id = "w_default", text = "The Society's work. Remedies, officially. Unofficially, the Dark Lady's enemies will one day be very ill, and I'll have helped. It's the closest I come to happiness." },
      },
      choices = {
        { text = "The new plague?", next = "plague" },
        { text = "That's grim.", next = "BACK" },
        { text = "For the Dark Lady.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    plague = {
      lines = {
        { id = "pq_default", text = "For the humans, and for the Scourge too. If it were up to me, I'd let them kill each other and save the reagents. It isn't up to me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    misery = {
      lines = {
        { id = "mi_default", text = "Look out of the window. Flowers. Clean air. Birdsong. Everything here is alive, and it insists on telling me so." },
      },
      choices = {
        { text = "Do you remember being alive?", next = "misery_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    misery_before = {
      lines = {
        { id = "mb_default", text = "I remember liking things. I can't remember what liking felt like. That's the part that bores me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    society = {
      lines = {
        { id = "so_default", text = "Master Apothecary Faranell in the Undercity adds his colloid of decay to my best work. Renferrel at the Sepulcher sends his findings. I read them in the dark." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alch = {
      lines = {
        { id = "al_default", text = "Mountain lion blood, gray bear tongue, mudsnout blossom from the gnoll fields at Nethander Stead. And patience. The last is the rarest." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "tu_default", text = "Would she? I've never met her. Tell her the clean air here is suffering enough for me, and she may stop weeping." },
      },
      choices = {
        { text = "You're beyond help.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "tl_default", text = "A troll's blood potion. Not the blood itself. Don't look so worried. I'd ask first. Probably." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Miss? No. I know there was something. I can see where it was, like a stain on the wall where a picture hung." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Royal Apothecary Society. Before that, alive. I think I preferred it. I can't recall why.", next = "misery" } },
    advice = { { id = "tp_ad", text = "Never test on yourself. Use a frog. Frogs complain less, and they come back." } },
    venture_company = { { id = "tp_venture", text = "Goblins in Stonetalon, cutting down everything that grows. I'd almost admire them, if they'd do it quietly." } },
    _none = { { id = "tp_none", text = "Don't know. Don't much care. Few things interest me, and that isn't one." } },
  },
}

P:NPC {
  key = "shay", id = TODO_NPC("Innkeeper Shay"), name = "Innkeeper Shay",
  bible = "bibles/hillsbrad.md", role = "innkeeper", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry" }, values = { "practical" },
  notices = { "race", "weary" },

  greetings = {
    { id = "g_inn", text = "Rest here, if you rest. Some of my guests don't need to, but they like the chairs." },
    { id = "g_home", when = { homeInn = { "Tarren Mill" } }, text = "Back at the Mill. Your bed's where you left it. Nobody's slept in it. Nobody here sleeps." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living. I keep a little food back for your kind. Don't ask where it came from. It's fine. Mostly." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The humans got a few licks in, I see. Sit. I'll find you something. We don't get many customers who bleed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Shay. I keep the inn. When this town was alive, someone else did. The customers complain less now." },
        { id = "h_clean", when = { metBefore = true }, text = "I polished the bar today. Nobody here eats or drinks much anymore, but a clean bar is a clean bar. Habit's what's left." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's our busy hour. Everyone's up. Everyone's always up. I've stopped putting the chairs on the tables." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all night. I've every night." },
        { id = "h_again2", text = "Go on. The bar won't polish itself. Well. It might, in this town." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What was Tarren Mill like before?", next = "before" },
        { text = "Who stays here?", next = "guests" },
        { text = "Just passing through.", next = "END" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Quiet, the old ones say. Farms, the mill, a fair in summer. They remember all of it. They don't feel any of it. That's the strange part." } },
      choices = {
        { text = "Do you remember it?", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = { { id = "re_default", text = "The way you remember a map. I know where everything was. I couldn't tell you how it smelled." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = {
        { id = "gu_default", text = "Deathguards off watch, apothecaries who forget they don't need to eat, and the living allies, who eat everything. I keep the cellar locked for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn. Before that, I don't talk about. Nobody here does." } },
    advice = { { id = "tp_ad", text = "Don't sit by the window after dark. Southshore's scouts like windows." } },
    _none = { { id = "tp_none", text = "Ask the High Executor. Or don't. She doesn't like questions." } },
  },
}
