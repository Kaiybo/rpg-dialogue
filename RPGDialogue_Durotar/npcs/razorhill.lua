-- Razor Hill: the barracks on Durotar's crossroads. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "garthok", id = TODO_NPC("Gar'Thok"), name = "Gar'Thok",
  bible = "bibles/durotar.md", role = "soldier", tier = "major",
  communities = { "razor_hill" }, temper = { "terse" }, values = { "dutiful", "loyal" },
  notices = { "kit", "greenness" },

  greetings = {
    { id = "g_barracks", text = "Speak quickly. Razor Hill has work, and work doesn't wait for conversation." },
    { id = "g_back", when = { metBefore = true }, text = "Report, and keep it short." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear is falling off you, so fix it. A grunt who can't hold his armor together can't hold a line." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Out of the valley and already at my door. Good, but don't think that makes you a veteran." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gar'Thok, commander of Razor Hill. I served under Nazgrel before this. Now I hold Durotar's crossroads, and I hold them well." },
        { id = "h_betrayers", tags = { "news" }, when = { questActive = TODO_QUEST("Vanquish the Betrayers") },
          text = "Kul Tirans hold a keep on our coast. They call it a garrison and I call it a knife at our throat, so pull it out." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Admiral's Orders") },
          text = "Get these Kul Tiran orders to Orgrimmar, and quickly; they were taken off their own officers." },
        { id = "h_encroach", when = { questActive = TODO_QUEST("Encroachment") },
          text = "Quilboar out of the Barrens are pushing into Durotar. Push harder than they do." },
        { id = "h_wreckage", when = { questActive = TODO_QUEST("From The Wreckage....") },
          text = "There's a wreck on the coast with things worth salvaging. Get there before the sea or the Kul Tirans do." },
      },
      choices = {
        { text = "Why does Razor Hill matter?", next = "why" },
        { text = "Lok'tar, commander.", next = "END", fx = { affinity = 1, standing = { razor_hill = 1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Roads to Orgrimmar, to Sen'jin and to the Barrens all run through here. Hold Razor Hill and you hold Durotar. Lose it and you lose the rest." } },
      choices = { { text = "Then we won't lose it.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "That's Orgnil's business, and he's good at it. I give him whatever he asks for." } },
    _none = { { id = "tp_none", text = "Not now; ask Orgnil, or the innkeeper." } },
  },
}

P:NPC {
  key = "orgnil", id = TODO_NPC("Orgnil Soulscar"), name = "Orgnil Soulscar",
  bible = "bibles/durotar.md", role = "soldier", tier = "quest",
  communities = { "razor_hill" }, temper = { "grim" }, values = { "lawful", "protective" },
  notices = { "class", "stealth" },

  greetings = {
    { id = "g_watch", text = "Young orcs and trolls train here. Traders rest here. Nothing gets into Razor Hill that I don't allow." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Any word from the canyons?" },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I'll be watching you, the way I watch every one of you, so don't take it personally; take it seriously." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You're light on your feet, and the Blade use people like you to carry their messages. Make sure you never carry one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Orgnil Soulscar. The Burning Blade crawl through Durotar like lice in a pelt, and I find them, and I end them." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "So Gadrin sent you. Good; the old witch doctor has an eye for the useful ones." },
        { id = "h_storms", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Storms") },
          text = "The cultists talk of storms, and not the kind that bring rain. Find out what they mean." },
      },
      choices = {
        { text = "Where do the Blade hide?", next = "hide" },
        { text = "I'll hunt them with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
    },
    hide = {
      big = true,
      lines = {
        { id = "hd_default", text = "In caves in the canyons, and under rocks like scorpids. Sometimes they hide inside the walls of cities, smiling at you, and those are the ones I'd most like to meet." },
      },
      choices = { { text = "Inside the cities?", next = "END", fx = { affinity = 1, trait = { skeptical = 1 }, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "They're orcs who chose the demons twice. Once might be forgiven, but twice, never." } },
    _none = { { id = "tp_none", text = "I hunt the Blade, and nothing else is my concern." } },
  },
}

P:NPC {
  key = "grosk", id = TODO_NPC("Innkeeper Grosk"), name = "Innkeeper Grosk",
  bible = "bibles/durotar.md", role = "innkeeper", tier = "service",
  communities = { "razor_hill" }, temper = { "dry" }, values = { "practical" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Sit and eat. Razor Hill is safe enough to sleep in, which is more than you can say for most of Durotar." },
    { id = "g_home", when = { homeInn = { "Razor Hill" } }, text = "Your bed's where you left it, and it's scorpid-free; I checked." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the spirit healer sent you back with a list of complaints. Sit down before you fall down." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's enough for now. The grunts don't carry drunks home; they leave them for the scorpids." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Grosk, the innkeeper. I've a bed, ale and a roof against the sun, and everything outside is rocks and scorpids." },
        { id = "h_burden", when = { questActive = TODO_QUEST("A Peon's Burden") },
          text = "That bundle is for the right hands only. Get it there, and don't let a peon sit on it." },
        { id = "h_scorpid", when = { metBefore = true }, text = "I shook a scorpid out of the blankets this morning. They weren't yours, probably, but check anyway." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the grunts on the wall, singing the old songs? They sing them badly, and I wouldn't change it for anything." },
      },
      choices = { { text = "Just a meal, thanks.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I pour drinks; I don't keep track of things. Ask Gar'Thok." } },
  },
}

-- Forever's camping: the adventurer on the road near Razor Hill.
P:NPC {
  key = "brakk", id = TODO_NPC("Brakk"), name = "Brakk",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "easygoing" }, values = { "generous", "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_fire", text = "Throm-ka. Sit, if you're not in a hurry. If you are, sit anyway; the road will keep." },
    { id = "g_back", when = { metBefore = true }, text = "The one who found my journal, welcome back! Sit down; the fire remembers you." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook? Then you can build a real campfire, and everything else in a camp is built around one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Brakk. I walk Durotar and camp wherever I stop, and my journal says more about it than I do." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "My journal! I thought the scorpids had it. Every camp I've ever made is written in there, so you have my thanks." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Rest by the fire until your bones stop arguing with you. You'll know when." },
      },
      choices = {
        { text = "Why sleep out here?", next = "why" },
        { text = "Lok'tar, Brakk.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Walls are for people who've stopped walking. Out here, any traveler can share the fire. A camp belongs to whoever sits at it." } },
      choices = { { text = "Show me how.", next = "END", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Fire first, and then whatever your trade adds: a tent, a rack for fish, a pot. The more hands, the better the rest." } },
    _none = { { id = "tp_none", text = "I only know the road and the fire. Ask in Razor Hill." } },
  },
}
