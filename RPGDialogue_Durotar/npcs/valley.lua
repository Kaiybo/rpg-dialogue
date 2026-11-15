-- The Valley of Trials: where young orcs (and trolls) become the Horde. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kaltunk", id = TODO_NPC("Kaltunk"), name = "Kaltunk",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "greenness" },

  greetings = {
    { id = "g_road", text = "Fresh off the road, are you? Good. The Horde has room for you, if you earn it." },
    { id = "g_back", when = { metBefore = true }, text = "Still in the valley? Then you've still got work to do, so go on." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "You've never swung a weapon at something that swings back, have you? You will, and probably today." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kaltunk, and every recruit who walks into this valley starts with me. I send you to Gornek in the Den, and he sends you to work." },
        { id = "h_place", tags = { "news" }, when = { questActive = TODO_QUEST("Your Place In The World") },
          text = "Gornek's in the Den, the cave just ahead. Tell him Kaltunk sent you, and stand up straight when you do." },
        { id = "h_dust", when = { metBefore = true }, text = "I came off a ship with nothing but my axe and Durotar's dust in my teeth, and that was enough. It's enough for you too." },
      },
      choices = {
        { text = "How did you come to Durotar?", next = "came" },
        { text = "What happens in the valley?", next = "valley" },
        { text = "I'm on my way.", next = "END" },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Boars, scorpids and cultists in the northern caves. You'll fight all three, and you'll come out the other end Horde, or you won't." } },
      choices = { { text = "I will.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    came = {
      lines = {
        { id = "c_camps", text = "Out of the camps, like most of us, and then across the sea to this red land with the Warchief. I've been greeting new blood ever since, because somebody greeted me once, and I remember who." },
      },
      choices = { { text = "I'll remember you, then.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Gornek; I just point the way." } },
  },
}

P:NPC {
  key = "gornek", id = TODO_NPC("Gornek"), name = "Gornek",
  bible = "bibles/durotar.md", role = "soldier", tier = "major",
  communities = { "valley_of_trials" }, temper = { "hard" }, values = { "stern", "dutiful" },
  notices = { "greenness", "class" },

  greetings = {
    { id = "g_den", text = "Stand up straight, recruit. The valley is watching you, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You're back on your feet, and that's the first lesson. Most never learn it." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Soft hands, I see. That'll change, along with everything else soft about you, here." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, in my Den. The Burning Blade wear your colors in the caves north of here. Prove you aren't one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gornek, and I run the Den. The Valley of Trials makes Horde out of whatever walks in, though some days that takes longer than others." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Recruits keep dropping their training weapons out among the boars. Kzan needs every one. Go and pick up after your betters." },
        { id = "h_sarkoth", when = { questActive = TODO_QUEST("Sarkoth") },
          text = "Sarkoth has been killing in the north for too long. If you've seen his work, you've seen why it ends with you." },
        { id = "h_parchment", when = { any = { { questActive = TODO_QUEST("Glyphic Parchment") }, { questActive = TODO_QUEST("Tainted Tablet") } } },
          text = "Your trainer left word for you. Read it, then go and find them. The Horde has a place for what you can do." },
      },
      choices = {
        { text = "What do I need to prove?", next = "prove" },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { valley_of_trials = 1 } } },
      },
    },
    prove = {
      big = true,
      lines = {
        { id = "p_default", text = "That you'll get back up. Strength comes later. Anyone can swing an axe; not everyone stands again after the first one hits them." },
      },
      choices = { { text = "I'll stand.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "There are cultists in the coven to the north, calling up imps. Zureetha deals with them, and you'll help her." } },
    _none = { { id = "tp_none", text = "That's not your concern yet, recruit, so finish the valley first." } },
  },
}

P:NPC {
  key = "zureetha", id = TODO_NPC("Zureetha Fargaze"), name = "Zureetha Fargaze",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "watchful" }, values = { "sharp", "dutiful" },
  notices = { "class" },

  greetings = {
    { id = "g_blade", text = "The Burning Blade crawl out of their caves after dark, and I'd rather they didn't. Help me with that." },
    { id = "g_back", when = { metBefore = true }, text = "You've been north? Tell me what you saw, all of it." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. The Blade will try to tempt you; they try with every one of us. Say no, and keep saying it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Zureetha Fargaze. The Burning Blade have taken the caves to the north and they're spilling into the valley, so I watch them, and I send recruits to thin them." },
        { id = "h_familiars", when = { questActive = TODO_QUEST("Vile Familiars") },
          text = "The Blade's pet imps swarm the north end of the valley. Kill them before they set the scrub alight." },
        { id = "h_medallion", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Blade Medallion") },
          text = "Their leader in the coven wears a medallion. Bring it to me. I want to see whose mark is on it." },
        { id = "h_senjin", when = { questActive = TODO_QUEST("Report to Sen'jin Village") },
          text = "Your time in the valley is done. Go south to Sen'jin and find Master Gadrin, and try not to embarrass us." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "I'll go north.", next = "END" },
      },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Orcs who never let go of the old fire. The Warchief broke the demons' hold on us, and these fools want it back. I won't let them have it." },
      },
      choices = { { text = "Neither will I.", next = "END", fx = { affinity = 2, align = { light = 1 }, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "They hide in caves because they know what we'd do to them in daylight." } },
    _none = { { id = "tp_none", text = "I don't know, but I know the Blade, so ask me about them." } },
  },
}

P:NPC {
  key = "thazzril", id = TODO_NPC("Foreman Thazz'ril"), name = "Foreman Thazz'ril",
  bible = "bibles/durotar.md", role = "worker", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "exasperated" }, values = { "practical" },
  notices = { "idle" },

  greetings = {
    { id = "g_peon", text = "You! You're not a peon, are you? Good, because I have plenty of those, and they're all asleep." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the one who can stay awake. A rare sight." },
  },

  notice = {
    { id = "n_peon", cat = "idle", when = { race = "Orc", maxLevel = 3 },
      text = "Hmm. You've got the look of someone who'd nap behind a lumber pile. Prove me wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Foreman Thazz'ril. My peons are meant to be gathering lumber, but mostly they're gathering naps." },
        { id = "h_lazy", tags = { "news" }, when = { questActive = TODO_QUEST("Lazy Peons") },
          text = "Take this blackjack. Find a sleeping peon, give him a tap, and watch him remember he has a job." },
        { id = "h_pick", when = { questActive = TODO_QUEST("Thazz'ril's Pick") },
          text = "I left my pick in the coven while I was surveying, and it's enchanted, so don't let those cultists keep it." },
        { id = "h_peons", when = { metBefore = true }, text = "I found three peons asleep in the mine cart this morning, in the cart, while it was moving. I don't know how they managed it, and I'm almost impressed." },
      },
      choices = {
        { text = "Why not let them rest?", next = "rest" },
        { text = "I'll wake them.", next = "END" },
      },
    },
    rest = {
      lines = { { id = "r_default", text = "Rest? Orgrimmar's walls won't build themselves. Well, they will if the peons build them, and that's the problem." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't ask me; ask a peon, and wake him up first." } },
  },
}

P:NPC {
  key = "galgar", id = TODO_NPC("Galgar"), name = "Galgar",
  bible = "bibles/durotar.md", role = "worker", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "longsuffering" }, values = { "practical", "generous" },
  notices = { "hunger" },

  greetings = {
    { id = "g_cook", text = "Hungry? Of course you are; everyone in this valley is hungry." },
    { id = "g_back", when = { metBefore = true }, text = "Here for seconds? Help me with thirds and we'll talk." },
  },

  notice = {
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "A cook! Then you know nobody thanks us, and everybody notices when we stop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Galgar, and I feed the Den: recruits, grunts and peons alike. Nobody thanks the cook, but everybody notices when the pot's empty." },
        { id = "h_apples", tags = { "news" }, when = { questActive = TODO_QUEST("Galgar's Cactus Apple Surprise") },
          text = "Cactus apples, from the plants around the valley. It's an easy job. I make it easy on purpose; you'll get harder ones soon enough." },
        { id = "h_recipe", when = { metBefore = true }, text = "Scorpid tail, fried, with a pinch of cactus. Don't make that face; you'll be asking for it by next week." },
      },
      choices = {
        { text = "Where did you learn to cook?", next = "cook" },
        { text = "What's the surprise?", next = "surprise" },
        { text = "Thanks, Galgar.", next = "END" },
      },
    },
    surprise = {
      lines = { { id = "s_default", text = "That it tastes good. Nobody expects that from a cactus." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
    cook = {
      lines = {
        { id = "c_camp", text = "In the camps, where you learn to make something out of nothing or you starve. Out here we've got scorpids, and that's not nothing; that's practically a feast." },
      },
      choices = { { text = "I'll try the scorpid.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm a cook. Ask me about cactus apples." } },
  },
}

P:NPC {
  key = "kzan", id = TODO_NPC("Kzan Thornslash"), name = "Kzan Thornslash",
  bible = "bibles/durotar.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "curt" }, values = { "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_shop", text = "Weapons or repairs, so pick one, pay, and move along." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that. Hand it over, and no, I'm not doing it for free." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kzan Thornslash, and I keep the recruits armed while they keep dropping their weapons in the scrub. One of those jobs is harder than the other." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Gornek sent you about the training weapons? Good. Bring me six and I'll mend them for the next lot of recruits." },
        { id = "h_edge", when = { metBefore = true }, text = "You're back, and the blade's still in one piece? Good. That means you're using the edge and not the flat." },
      },
      choices = { { text = "I'll find them.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it's not a weapon, I don't sell it." } },
  },
}
