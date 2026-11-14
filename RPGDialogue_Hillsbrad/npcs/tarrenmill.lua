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
      },
      choices = {
        { text = "Why fight for Southshore?", next = "why" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 2 } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because this was Lordaeron, and the living drove us out of it after we died for it. We do not ask for it back. We take it back." },
      },
      choices = {
        { text = "That's fair.", next = "END", fx = { affinity = 2 } },
        { text = "They're just villagers.", next = "villagers" },
      },
    },
    villagers = {
      lines = { { id = "v_default", text = "So were we. Once. Then the plague came and the villagers threw stones at us. Go and fight, or go away." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
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
      },
      choices = {
        { text = "Who's Umpi?", next = "umpi" },
        { text = "What are you working on?", next = "work" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    umpi = {
      lines = { { id = "u_default", text = "My frog. He sits there and I test things on him. He's had a remarkable career. Most of it brief." } },
      choices = { { text = "...poor Umpi.", next = "END" } },
    },
    work = {
      big = true,
      lines = {
        { id = "w_default", text = "The Society's work. Remedies, officially. Unofficially, the Dark Lady's enemies will one day be very ill, and I'll have helped. It's the closest I come to happiness." },
      },
      choices = {
        { text = "That's grim.", next = "END" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
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
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What was Tarren Mill like before?", next = "before" },
        { text = "Just passing through.", next = "END" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Quiet, the old ones say. Farms, the mill, a fair in summer. They remember all of it. They don't feel any of it. That's the strange part." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the High Executor. Or don't. She doesn't like questions." } },
  },
}
