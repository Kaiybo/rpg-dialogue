-- The Eastvale stables: Katie Hunter, horse breeder, and Randal Hunter, riding trainer.
-- A human's first horse, at level 40. Voice: bibles/eastvale_stables.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "katie_hunter", id = TODO_NPC("Katie Hunter"), name = "Katie Hunter", title = "Horse Breeder",
  bible = "bibles/eastvale_stables.md", role = "vendor", tier = "service",
  communities = { "eastvale" }, temper = { "brisk" }, values = { "proud", "careful" },
  notices = { "mount", "race" },

  greetings = {
    { id = "g_default", text = "Mind the gate. They're gentle, but they're not stupid, and they know an open gate." },
    { id = "g_ready", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 }, text = "Look at you. Come to choose one, have you? Take your time." },
  },

  notice = {
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Off that, please, before my mares get ideas. And let me see its hooves. Habit." },
    { id = "n_other", cat = "race", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
      text = "I'll talk horses with anyone. Selling them is another matter; Stormwind keeps these for its own." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Katie Hunter. I breed the horses Stormwind rides: bred for years, cared for daily, and worth every coin. Randal teaches you to stay on them." },
        { id = "h_young", when = { race = "Human", maxLevel = 39 }, text = "Soon, love. You'll need Randal's lessons first, and he won't teach anyone who's still green. Come back seasoned." },
        { id = "h_trusted", when = { ["not"] = { race = "Human" }, reputation = { faction = "Stormwind", min = "exalted" } },
          text = "Stormwind trusts you completely, I hear. Then so do I. Come and meet them." },
        { id = "h_other", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } }, text = "These are Stormwind's horses. Earn the kingdom's full trust and we'll do business; until then, you're welcome to pat one." },
      },
      again = { { id = "h_again", text = "Anything else? They'll want feeding soon." } },
      choices = {
        { text = "Show me the horses.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 } },
        { text = "How do I choose?", next = "choose" },
        { text = "Why only for Stormwind's people?", next = "only" },
        { text = "Do you name them?", next = "names" },
        { text = "Good day.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "c_default", text = "Not by the colour. By how it stands when you walk up. A horse that turns to look at you is a horse that'll look after you." } },
      choices = {
        { text = "And if it turns away?", next = "choose_away" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_away = {
      lines = { { id = "ca_default", text = "Then it's not stupid either, and you've some work ahead. Bring apples. Bring patience. Mostly apples." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    only = {
      lines = { { id = "o_default", text = "Because good horses in the wrong hands are a cavalry charge waiting to happen. I'm not saying you're the wrong hands. Prove you're the right ones." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    names = {
      lines = { { id = "n_default", text = "Every one, and then I give them to you and you rename them something silly. It's all right. They don't listen to names anyway. They listen to hands." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Horses since before I could walk properly. They taught me. I'm still learning." } },
    advice = { { id = "tp_ad", text = "Walk the last mile. A horse that's cooled down is a horse that's ready tomorrow." } },
    trade = { { id = "tp_tr", text = "Horses, and the bridles to call them. Stormwind's best, for Stormwind's own." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask me about horses." } },
  },
}

P:NPC {
  key = "randal_hunter", id = TODO_NPC("Randal Hunter"), name = "Randal Hunter", title = "Riding Trainer",
  bible = "bibles/eastvale_stables.md", role = "trainer", tier = "service",
  communities = { "eastvale" }, temper = { "patient", "dry" }, values = { "careful", "practical" },
  notices = { "class", "mount" },

  greetings = {
    { id = "g_default", text = "Heels down, back straight. Oh, you're not on a horse. Habit." },
    { id = "g_ready", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 }, text = "Ready for a saddle? You look ready. Most people look ready. Let's find out." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", minLevel = 40 },
      text = "A paladin. Your order calls its own warhorse, I'm told. Learn on one of ours anyway. Even a holy horse can throw you." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK", minLevel = 40 },
      text = "I've heard what warlocks ride. Don't bring it near the stables. The mares will never forgive me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Randal Hunter. Katie breeds them, I teach people to stay on them. It's taken years to get the order of those two jobs right." },
        { id = "h_outsider", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } }, minLevel = 40 },
          text = "I teach horses, and Stormwind's people. Your own folk will have their own mounts and their own teachers; I'd go to them." },
        { id = "h_young", when = { maxLevel = 39 }, text = "Patience. Riding's for people who've lived long enough to be careful. Forty seasons on the road, give or take. Come back then." },
      },
      again = { { id = "h_again", text = "More questions? Good. Questions now are cheaper than falls later." } },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 } },
        { text = "What's the hardest part?", next = "hardest" },
        { text = "Why make people wait so long?", next = "wait" },
        { text = "Can a priest ride like a knight?", next = "priest", when = { class = "PRIEST" } },
        { text = "Good day.", next = "END" },
      },
    },
    hardest = {
      lines = { { id = "hd_default", text = "Not the riding. The stopping. Everyone wants to go fast. Nobody practises stopping until there's a wall." } },
      choices = {
        { text = "How do you practise stopping?", next = "hardest_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest_stop = {
      lines = { { id = "hs_default", text = "With a wall that's further away than you think. Then a bit nearer. Then, once, by surprise. That's the lesson." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    wait = {
      lines = { { id = "w_default", text = "A horse doubles how fast you get into trouble. I'd like you to have practised getting out of it on foot first." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Better, usually. Knights ride to arrive. Priests ride to arrive in one piece, with something left to heal the knights." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fell off a lot when I was young. Now I teach so other people fall off less." } },
    advice = { { id = "tp_ad", text = "Look where you want to go, not at the thing you want to miss. Horses follow your eyes." } },
    trade = { { id = "tp_tr", text = "Riding lessons. One lesson, really. The rest you learn by falling." } },
    _none = { { id = "tp_none", text = "Not my field. Ask me about saddles." } },
  },
}
