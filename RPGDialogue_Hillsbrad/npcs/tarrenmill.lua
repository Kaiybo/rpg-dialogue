-- Tarren Mill (Horde, Forsaken). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "darthalia", id = TODO_NPC("High Executor Darthalia"), name = "High Executor Darthalia",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "tarren_mill" }, temper = { "cold" }, values = { "loyal", "relentless" },
  notices = { "race", "class" },

  impression = {
    first = "High Executor Darthalia measures everyone by their use to the Dark Lady's front. She pushes the line toward Southshore one field at a time, and she doesn't intend to stop.",
    third = "{name} met High Executor Darthalia, who holds Tarren Mill for the Dark Lady and presses the line against Southshore.",
  },

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
    druid_q = {
      lines = { { id = "dq_default", text = "You tell me, druid, since you are the one who speaks with her. I only know that the soil of these hills took our bodies once and gave them back, and I owe it nothing either way." } },
      choices = {
        { text = "She turns away no one who seeks her.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Undeath is against nature. She owes you nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid, among the dead. Your people make their oaths to the Earth Mother, I'm told, and I have yet to decide whether she would count us among her children." },
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
        { id = "h_krusk", when = { questDone = TODO_QUEST("Gol'dir") },
          text = "Krusk's leader is free, I hear, and the orcs are grateful. Gratitude from Orgrimmar is a currency I intend to spend." },
        { id = "h_xsoldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "You carried Lordaeron's colours once; it shows in how you stand. Southshore's watchmen once served the same king, so try to remember which side of the line you are on now." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief about it." },
        { id = "h_again2", text = "Continue. You are not dismissed yet." },
      },
      choices = {
        { text = "Does the Earth Mother turn her back on the Forsaken?", next = "druid_q", when = { class = "DRUID" } },
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
        { text = "The Light answers me, High Executor, even now.", next = "xpaladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "The spirits of this land are restless.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "The Windshapers fight for the Horde.", next = "xskyborne", when = { race = "Skyborne" } },
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
    xpaladin = {
      big = true,
      lines = { { id = "xpa_default", text = "So I have heard, and I do not pretend to understand it. The Light burned many of us when we first rose, and I will not ask what it says to you now, so long as it says nothing kind about Southshore." } },
      choices = {
        { text = "The Light chose me. I'll carry it for the Forsaken.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light is a weapon. Nothing more.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Does it trouble your soldiers?", next = "xpaladin_troops" },
      },
    },
    xpaladin_troops = {
      lines = { { id = "xpt_default", text = "It troubles them very much, and I have told them that anything useful to the Dark Lady is a friend. They will learn to stand near you eventually, the same way they learned to stand near the apothecaries." } },
      choices = {
        { text = "I'll give them time.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "Restless, are they? Then they have something in common with the dead. Tell them whatever you must to keep them out of my way, and if they can be persuaded to rot Southshore's barley, so much the better." } },
      choices = {
        { text = "Spirits aren't soldiers. They won't take orders.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I'll do what I can for the land.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xskyborne = {
      lines = { { id = "xsk_default", text = "So I'm told, and Thunder Bluff vouches for you, which is more than Thunder Bluff does for us. I have no opinion about your people yet. Give me one." } },
      choices = {
        { text = "Point me at Southshore's line.", next = "orders", fx = { affinity = 1 } },
        { text = "We fight for the Horde, not the Dark Lady.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
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

  impression = {
    first = "Apothecary Lydon told me not to touch anything, since most of it would kill me. He says he feels very little now, except about his work and something called Umpi.",
    third = "{name} met Apothecary Lydon of the Royal Apothecary Society, who brews deadly things at Tarren Mill.",
  },

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
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Master Faranell says the arcane is a crutch for people who can't measure, and I agree with him because agreeing is quicker. Still, the Syndicate's shadow mages are collecting blood for me in the hills, so I suppose the Society uses magic the way it uses everything else, at arm's length." } },
      choices = {
        { text = "The Society's methods are sound. I'd follow Faranell's rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Faranell's rules are a crutch too. Use whatever works.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Only Hinott, who pretends not to look into my cellar and fails, and the occasional Southshore spy who drinks the wrong flask and saves me the trouble. I find them in the morning, though Umpi usually finds them first." } },
      choices = {
        { text = "I'd rather catch spies with a blade than a trick.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Leave a flask out for the next spy. Poison suits them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I've no idea, shaman, and I suspect you're about to tell me. The water spirits in Hillsbrad's streams are welcome to complain to the Society in writing, though I doubt Master Faranell will read it." } },
      choices = {
        { text = "The land suffers enough. I'll ask its spirits to forgive it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits serve the Horde too. They'll endure your poisons.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We poison what the humans would plant, not what we stand on, or so the Society says. I'll admit the soil around my cauldrons hasn't sprouted anything in months, and only Umpi doesn't seem to mind." } },
      choices = {
        { text = "Then keep your poisons far from these hills.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A weapon is a weapon. Use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, here among my cauldrons. I'm told you talk to the earth and the water, so please don't tell me what they think of the runoff behind the hut." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at Tarren Mill. I suspect you won't approve of my work, tauren, since most of it is about making green things die faster." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. The Light stopped visiting Tarren Mill some time ago, and the loa never came at all, so you'll have to make do with me and Umpi." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. You trade with demons and I trade in poisons, so neither of us gets invited to many dinners, though since I can't eat anymore, I don't much mind." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "One of the sneaking sort. If you've come to steal a vial, take the green ones, because those are the ones I've given up on." },
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
        { text = "Why poison the very land the Horde fights for?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Will your plague do my fighting for me, Lydon?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do your poisons do to the spirits of this land?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the Society ever use magic in its work, Lydon?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Does anyone in Tarren Mill try to steal your work?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who's Umpi?", next = "umpi" },
        { text = "What are you working on?", next = "work" },
        { text = "Why are you so miserable?", next = "misery" },
        { text = "Who do you work with?", next = "society" },
        { text = "Which reagents do you swear by?", next = "alch", when = { profession = "Alchemy" } },
        { text = "The Earth Mother would weep at your work.", next = "tauren", when = { race = "Tauren" } },
        { text = "Troll's blood? For your elixir?", next = "troll", when = { race = "Troll" } },
        { text = "Do you miss anything, from before?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I studied in Dalaran before I died.", next = "xmage", when = { race = "Scourge", class = "MAGE" } },
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
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Not all of it, warrior, but it'll thin the crowd you have to fight. Southshore won't know what's come until it's already in their wells, and then you'll find the work much easier." } },
      choices = {
        { text = "I'd rather beat Southshore with my own two hands.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then poison them, and I'll finish what's left.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Then you'll appreciate that I'm doing in a hut what Dalaran did in towers, only with less funding and more fumes. Don't tell me what the city looked like when you left it; I'd rather not have to feel anything about it." } },
      choices = {
        { text = "I won't mention them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What are you working on?", next = "work" },
      },
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

  impression = {
    first = "Innkeeper Shay keeps chairs for guests who no longer need to rest. The humour at Tarren Mill's inn is as dry as old bone, and I suspect that's deliberate.",
    third = "{name} visited the inn at Tarren Mill, kept by Innkeeper Shay, whose guests rarely need to sleep.",
  },

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
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The scouts who go down to the Hillsbrad farms, mostly, because the farmers there keep dogs and pitchforks and the Southshore guard is never far off. They come back to my bar complaining that one spell at the right moment would have saved them a long run home." } },
      choices = {
        { text = "Then I'll go down with the scouts, by the High Executor's leave.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go down alone and do it my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The Syndicate send a man through now and then pretending to be a trader, and he tips too well for an honest one. Then there's Zixil the goblin, who sells to both towns and smiles at everyone, which in my experience is the surest sign of a liar." } },
      choices = {
        { text = "Point out the Syndicate man. I'll deal with him openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pick his pockets first and read his letters.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they do, nobody's told me, and I'd be the first to hear, since I hear everything at this bar. The old ones say the mill wheel still turns some nights with no water behind it, but the old ones say a great many things." } },
      choices = {
        { text = "I'll go and listen at the mill, and leave the dead in peace.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Restless spirits are useful. I'll set them against Southshore.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman under my roof. The last one who stayed asked me to open the windows for the spirits, and I told him the spirits could pay for a room like everyone else." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Some of my guests used to pray before supper, and now they don't eat supper, so the praying stopped too, but you're welcome to start it up again." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Please don't conjure your own food and water at my tables, because I've little enough custom as it is." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Your imp can stay, but if it sets fire to my curtains, as somebody's did last month, I'll be charging you for the curtains." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "Someone who walks in without the floorboards noticing. Sit where I can see you, if you don't mind, because the last quiet one left without paying." },
        { id = "h_default", text = "I'm Shay, and I keep the inn. When this town was alive someone else did, and the customers complain less now." },
        { id = "h_clean", when = { metBefore = true }, text = "I polished the bar today. Nobody here eats or drinks much anymore, but a clean bar is a clean bar. Habit's what's left." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's our busy hour, though everyone's always up here, so I've stopped putting the chairs on the tables." },
        { id = "h_skulls", when = { questDone = TODO_QUEST("Souvenirs of Death") }, text = "Samsa's hung his skulls on the wall behind my inn, thanks to you. I've asked him to at least line them up straight." },
        { id = "h_krusk", when = { heardLine = "krusk.h_default" }, text = "You've met Krusk, then. He's the only one in town who orders a hot meal, and he eats it with his back to the wall." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all night, and every night after it." },
        { id = "h_again2", text = "Go on. The bar won't polish itself... well, it might, in this town." },
      },
      choices = {
        { text = "Is there a place to stable a beast in Tarren Mill?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do the dead of Tarren Mill trouble the spirits here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who around Tarren Mill could use a spellcaster's help, Shay?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who drinks here that I should keep an eye on?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What was Tarren Mill like before?", next = "before" },
        { text = "Who stays here?", next = "guests" },
        { text = "Do you miss sleeping?", next = "sleep", when = { race = "Scourge" } },
        { text = "Is there anything here a living body can eat?", next = "food", when = { race = { "Orc", "Tauren", "Troll", "Skyborne" } } },
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
      choices = {
        { text = "Who's the strangest?", next = "guests_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_strange = {
      lines = { { id = "gs_default", text = "Lydon's frog, who has a stool of her own by the fire, and Humbert, who sat in the corner a whole week without his sword. Neither of them tips." } },
      choices = {
        { text = "The frog has a stool?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep = {
      big = true,
      lines = { { id = "sl_default", text = "I miss the idea of it, the way you'd miss a room in a house that burned. I lie down some nights anyway and wait for something to happen, and it never does." } },
      choices = {
        { text = "We have no need of it. Better without.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd give much to dream again.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "There's a stall out back that's been empty since the last owner was eaten, so it's yours if you like. Keep the beast quiet at night, because the guards are jumpy with Southshore so close." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? There's a stall out back that's been empty since the last owner was eaten, and it'll suit your friend well enough. Keep it quiet at night, though, because the guards are jumpy with Southshore so close." },
      },
      choices = {
        { text = "I'll keep it quiet. Thank you, Shay.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It'll make what noise it likes. Let Southshore hear it.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    food = {
      lines = { { id = "fo_default", text = "Bread from the Undercity, a little stale, and whatever the hunters bring in, which I cook the way I remember cooking. I can't taste it, so you'll have to tell me if it's good." } },
      choices = {
        { text = "It's good, Shay.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
