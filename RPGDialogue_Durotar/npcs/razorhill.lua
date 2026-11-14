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
    { id = "g_back", when = { metBefore = true }, text = "You again. Report." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear is falling off you. Fix it. A grunt who can't hold his armor together can't hold a line." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Out of the valley and already at my door. Good. Don't think that makes you a veteran." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gar'Thok, commander of Razor Hill. I served under Nazgrel before this. Now I hold Durotar's crossroads, and I hold them well." },
        { id = "h_betrayers", tags = { "news" }, when = { questActive = TODO_QUEST("Vanquish the Betrayers") },
          text = "Kul Tirans hold a keep on our coast. They call it a garrison. I call it a knife at our throat. Pull it out." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Admiral's Orders") },
          text = "Kul Tiran orders, taken off their own officers. These go to Orgrimmar, and quickly." },
        { id = "h_encroach", when = { questActive = TODO_QUEST("Encroachment") },
          text = "Quilboar out of the Barrens, pushing into Durotar. Push harder than they do." },
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
    burning_blade = { { id = "tp_blade", text = "Orgnil's business. He's good at it. I give him whatever he asks for." } },
    _none = { { id = "tp_none", text = "Not now. Ask Orgnil, or the innkeeper." } },
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
      text = "A warlock. I'll be watching you, the way I watch every one of you. Don't take it personally. Take it seriously." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Light on your feet. The Blade use people like you to carry their messages. Make sure you never carry one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Orgnil Soulscar. The Burning Blade crawl through Durotar like lice in a pelt. I find them, and I end them." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "Gadrin sent you. Good. The old witch doctor has an eye for the useful ones." },
        { id = "h_storms", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Storms") },
          text = "The cultists talk of storms. Not the kind that bring rain. Find out what they mean." },
      },
      choices = {
        { text = "Where do the Blade hide?", next = "hide" },
        { text = "I'll hunt them with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
    },
    hide = {
      big = true,
      lines = {
        { id = "hd_default", text = "Caves in the canyons. Under rocks, like scorpids. And sometimes inside the walls of cities, smiling at you. Those are the ones I'd most like to meet." },
      },
      choices = { { text = "Inside the cities?", next = "END", fx = { affinity = 1, trait = { skeptical = 1 }, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "They're orcs who chose the demons twice. Once might be forgiven. Twice, no." } },
    _none = { { id = "tp_none", text = "Not my concern. The Blade is." } },
  },
}

P:NPC {
  key = "grosk", id = TODO_NPC("Innkeeper Grosk"), name = "Innkeeper Grosk",
  bible = "bibles/durotar.md", role = "innkeeper", tier = "service",
  communities = { "razor_hill" }, temper = { "dry" }, values = { "practical" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Sit. Eat. Razor Hill is safe enough to sleep in, which is more than most of Durotar." },
    { id = "g_home", when = { homeInn = { "Razor Hill" } }, text = "Your bed's where you left it. Scorpid-free, I checked." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the spirit healer sent you back with a list of complaints. Sit down before you fall down." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's enough for now. The grunts don't carry drunks home. They leave them for the scorpids." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Grosk. Bed, ale and a roof against the sun. Everything outside is rocks and scorpids." },
        { id = "h_burden", when = { questActive = TODO_QUEST("A Peon's Burden") },
          text = "That bundle is for the right hands only. Get it there, and don't let a peon sit on it." },
      },
      choices = { { text = "Just a meal, thanks.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I pour drinks. I don't keep track of things. Ask Gar'Thok." } },
  },
}
