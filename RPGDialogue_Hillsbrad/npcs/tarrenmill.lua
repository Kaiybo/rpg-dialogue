-- Tarren Mill (Horde, Forsaken). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "darthalia", id = TODO_NPC("High Executor Darthalia"), name = "High Executor Darthalia",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "tarren_mill" }, temper = { "cold" }, values = { "loyal", "relentless" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_front", text = "You stand at the Dark Lady's front. Be useful to it, or stand somewhere else." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, good. The front moves forward only when people like you push it." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living allies. The Horde lends us blades and we are grateful. Keep them pointed south." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "Scourge" },
      text = "A warrior of the Forsaken, good. The dead don't tire, and neither should we." },
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
          text = "Vardus is a baron of a kingdom that no longer exists, hiding among thieves in the Uplands. Bring me his head; he may keep the title." },
        { id = "h_dangerous", when = { questActive = TODO_QUEST("Dangerous!") },
          text = "There are four names on that list. Each one killed one of mine and hides among the farmers, but the living are very bad at hiding from the dead." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "You've met Lydon, then: brilliant, devoted, and forever complaining about the fresh air. Leave him his complaints, for the plague will need them." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The living sleep and we do not, so every night the line moves a little closer to Southshore." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief about it." },
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
      lines = { { id = "v_default", text = "So were we, once, until the plague came and the villagers threw stones at us. Go and fight, or go away." } },
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
        { text = "Patience wins wars. Let the apothecaries do their work.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    orders = {
      lines = {
        { id = "or_default", text = "Quell the human settlements of Hillsbrad until the Society's plague is ready: the farms first, then the smith who arms them, then Southshore." },
      },
      choices = {
        { text = "Why the farms first?", next = "farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farms = {
      big = true,
      lines = {
        { id = "fa_default", text = "Food, iron and nerve. Take the farms and they lose the first; kill the smith and they lose the second. The third leaves on its own." },
      },
      choices = {
        { text = "Cold, but sound.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Starving farmers out isn't a war I'd want to win.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Someone should be asking.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    forsaken = {
      lines = {
        { id = "fs_default", text = "Then you remember the stones, and the doors that shut in your face. Good; remember them when you walk into Hillsbrad." },
      },
      choices = {
        { text = "I remember.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'd rather forget.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    orc = {
      lines = {
        { id = "oc_default", text = "Durnholde, yes. Then we both have scores to settle here, yours older and mine fresher, and the Syndicate keep its ruins now, so start there." },
      },
      choices = {
        { text = "Gladly.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Your scores are your own. I'll settle mine my own way.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "So I am told. Then hunt the Syndicate, who hide better than deer, and whose hides are worth more to me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      big = true,
      lines = {
        { id = "ta_default", text = "Your Earth Mother does not walk these fields. The plague did, out of human granaries, and it took my life. Your scruples are noted, tauren, but the order stands." },
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
    knows = {
      { id = "tp_knows", text = "I will answer what it serves the Dark Lady for you to know. Choose your questions carefully." },
    },
    new_plague = { { id = "tp_plague", text = "The Society's work. Until it is ready, we hold the fields.", next = "plague" } },
    background = { { id = "tp_bg", text = "I died for Lordaeron, and now I take it back for the Dark Lady. The account is simple.", next = "why" } },
    advice = { { id = "tp_ad", text = "Do not linger near Southshore's walls. Their guards are bored, and bored men shoot first." } },
    _none = { { id = "tp_none", text = "That is irrelevant to the front. Ask someone with less to do." } },
  },
}

P:NPC {
  key = "lydon", id = TODO_NPC("Apothecary Lydon"), name = "Apothecary Lydon",
  bible = "bibles/hillsbrad.md", role = "scholar", tier = "quest",
  communities = { "tarren_mill" }, temper = { "glum" }, values = { "devoted" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_bored", text = "Oh, a visitor, how thrilling. Please don't touch anything; most of it will kill you, and the rest will make you wish it had." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I'd say I'm pleased, but I'm not anything, really, though you are useful." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. Do you enjoy it? I used to enjoy things. Now I just find them interesting, in a distant sort of way." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You're alive, warm and breathing, and it's very distracting. Try to breathe more quietly, would you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lydon, of the Royal Apothecary Society. I make things that hurt, for the Dark Lady's work, and it's the only thing that still makes me feel much of anything, that and Umpi." },
        { id = "h_pain", tags = { "news" }, when = { questActive = TODO_QUEST("Elixir of Pain") },
          text = "A new elixir needs testing, on something living. Don't look at me like that; the frog's busy." },
        { id = "h_suffering", when = { questActive = TODO_QUEST("Elixir of Suffering") },
          text = "Suffering, in a bottle, is harder to make than you'd think. Suffering out of a bottle is everywhere, of course." },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Master Apothecary Faranell in the Undercity wants this finished. When the Master wants something, one finishes it." },
        { id = "h_helbrim", when = { heardLine = "helbrim.h_default" },
          text = "Helbrim, in the Barrens, bottling cactus? Good for him; someone in the Society should be getting a tan." },
        { id = "h_spring", when = { timeOfDay = "day" },
          text = "Flowers again, and birdsong, and fresh clean air in every direction. Hillsbrad is unbearable in this weather." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night, finally, and fewer birds." },
        { id = "h_innocents", tags = { "news" }, when = { questActive = TODO_QUEST("Blood of Innocents") },
          text = "A toxin to bleed the violence out of goblins. It needs innocent blood, and the Syndicate's shadow mages have been collecting it for me. How generous of them." },
      },
      again = {
        { id = "h_again", text = "What else? Not that it matters." },
        { id = "h_again2", text = "Go on; Umpi's listening too, since she has nothing better to do." },
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
      lines = { { id = "u_default", text = "Umpi is my frog. She sits there and I test things on her, and she's had a remarkable career, most of it brief." } },
      choices = {
        { text = "Brief?", next = "umpi_brief" },
        { text = "...poor Umpi.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    umpi_brief = {
      lines = {
        { id = "ub_default", text = "I poison her, she dies, and I bring her back, over and over again. She's very forgiving, more so than most of my colleagues." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      big = true,
      lines = {
        { id = "w_default", text = "The Society's work: remedies, officially. Unofficially, the Dark Lady's enemies will one day be very ill and I'll have helped, which is the closest I come to happiness." },
      },
      choices = {
        { text = "The new plague?", next = "plague" },
        { text = "That's grim.", next = "BACK" },
        { text = "For the Dark Lady.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    plague = {
      lines = {
        { id = "pq_default", text = "For the humans, and for the Scourge too. If it were up to me, I'd let them kill each other and save the reagents, but it isn't up to me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    misery = {
      lines = {
        { id = "mi_default", text = "Look out of the window: flowers, clean air, birdsong. Everything here is alive, and it insists on telling me so." },
      },
      choices = {
        { text = "Do you remember being alive?", next = "misery_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    misery_before = {
      lines = {
        { id = "mb_default", text = "I remember liking things, but I can't remember what liking felt like, and that's the part that bores me." },
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
        { id = "al_default", text = "Mountain lion blood, gray bear tongue, and mudsnout blossom from the gnoll fields at Nethander Stead. And patience, which is the rarest of them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "tu_default", text = "Would she? I've never met her, but tell her the clean air here is suffering enough for me, and she may stop weeping." },
      },
      choices = {
        { text = "You're beyond help.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Fair enough. Clean air never did me much good either.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "tl_default", text = "A troll's blood potion, not the blood itself, so don't look so worried; I'd ask first, probably." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Miss it? No. I know there was something, and I can see where it was, like a stain on the wall where a picture hung." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know a few things, mostly about what hurts and how much. Ask, if you've the stomach for it." },
    },
    new_plague = { { id = "tp_plague", text = "We're close, so very close, and I'd be excited if I still did that.", next = "plague" } },
    syndicate = { { id = "tp_syndicate", text = "Their shadow mages collect innocent blood, and I collect it from them; it's a sort of partnership." } },
    background = { { id = "tp_bg", text = "Royal Apothecary Society, and before that, alive. I think I preferred it, though I can't recall why.", next = "misery" } },
    advice = { { id = "tp_ad", text = "Never test on yourself; use a frog. Frogs complain less, and they come back." } },
    venture_company = { { id = "tp_venture", text = "Goblins in Stonetalon, cutting down everything that grows. I'd almost admire them, if they'd do it quietly." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't much care. Few things interest me, and that isn't one." } },
  },
}

P:NPC {
  key = "shay", id = TODO_NPC("Innkeeper Shay"), name = "Innkeeper Shay",
  bible = "bibles/hillsbrad.md", role = "innkeeper", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry" }, values = { "practical" },
  notices = { "race", "weary" },

  greetings = {
    { id = "g_inn", text = "Rest here, if you rest. Some of my guests don't need to, but they like the chairs." },
    { id = "g_home", when = { homeInn = { "Tarren Mill" } }, text = "Back at the Mill, then. Your bed's where you left it, and nobody's slept in it, since nobody here sleeps." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living, I see. I keep a little food back for your kind, and don't ask where it came from; it's fine, mostly." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The humans got a few licks in, I see. Sit down and I'll find you something, since we don't get many customers who bleed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Shay, and I keep the inn. When this town was alive someone else did, and the customers complain less now." },
        { id = "h_clean", when = { metBefore = true }, text = "I polished the bar today. Nobody here eats or drinks much anymore, but a clean bar is a clean bar. Habit's what's left." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's our busy hour, though everyone's always up here, so I've stopped putting the chairs on the tables." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all night, and every night after it." },
        { id = "h_again2", text = "Go on. The bar won't polish itself... well, it might, in this town." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What was Tarren Mill like before?", next = "before" },
        { text = "Who stays here?", next = "guests" },
        { text = "Just passing through.", next = "END" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Quiet, the old ones say, with farms, the mill and a fair in summer. They remember all of it, but they don't feel any of it, and that's the strange part." } },
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
    knows = {
      { id = "tp_knows", text = "The dead don't gossip much, but the living who pass through here do. Ask, and I'll tell you what I've overheard." },
    },
    background = { { id = "tp_bg", text = "I keep the inn. What came before that I don't talk about, and nobody here does." } },
    advice = { { id = "tp_ad", text = "Don't sit by the window after dark. Southshore's scouts like windows." } },
    _none = { { id = "tp_none", text = "Ask the High Executor, or better, don't; she doesn't like questions." } },
  },
}
