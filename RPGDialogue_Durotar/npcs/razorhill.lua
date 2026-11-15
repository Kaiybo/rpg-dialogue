-- Razor Hill: the barracks on Durotar's crossroads. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "garthok", id = TODO_NPC("Gar'Thok"), name = "Gar'Thok",
  bible = "bibles/durotar.md", role = "soldier", tier = "major",
  communities = { "razor_hill" }, temper = { "terse" }, values = { "dutiful", "loyal" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Gar'Thok speaks in orders and expects reports in return, and he holds Razor Hill as if all of Durotar depended on it. Having seen the roads that meet there, I think perhaps it does.",
    third = "{name} met Gar'Thok, the terse commander of Razor Hill, who holds Durotar's crossroads for the Horde.",
  },

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
        { text = "Put me on the wall, commander.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can scout Tiragarde Keep without being seen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I track well. Where do you need eyes?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the Darkspear stand your watch too?", next = "troll", when = { race = "Troll" } },
        { text = "Lok'tar, commander.", next = "END", fx = { affinity = 1, standing = { razor_hill = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else? Make it a report, not a story." },
        { id = "h_again2", text = "Go on. I've a minute before the next runner comes in." },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "The wall has grunts enough, and what I'm short of is grunts who'll march out to Tiragarde and back without being told twice. Nazgrel taught me that a fort is only as strong as its willingness to leave it." },
        { id = "wa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "You already stood a watch on that wall, so you know every stone of it. Now I want you beyond it, where the Kul Tirans are." },
      },
      choices = {
        { text = "Then I'll march, and I'll hit them head on.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll march, but I'll pick my own fights out there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who was Nazgrel to you?", next = "warrior_nazgrel" },
      },
    },
    warrior_nazgrel = {
      lines = { { id = "wn_default", text = "My commander, and a hard one. He made me stand watch for a week after I left my post to chase a raider, and he was right to, because the raider was bait. Don't chase bait, warrior." } },
      choices = { { text = "I won't, commander.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Without being seen is what every scout says before the Kul Tirans hang him from their tower. Bring me a count of their sentries and the hour they change, and then I'll believe you." } },
      choices = {
        { text = "You'll have it, and no one will know I was there.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll bring the count. Maybe a few of their throats too.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "On the Barrens border, where the quilboar keep pushing in from the west. Track their raiding parties back to where they camp, and I'll know where to put my grunts." } },
      choices = { { text = "I'll find their camps.", next = "BACK", fx = { affinity = 2, standing = { razor_hill = 1 } } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "They do, and they keep better watch at night than my orcs, which I'll deny if you repeat it. The Darkspear hold Sen'jin and I hold Razor Hill, and between us the coast stays ours." } },
      choices = { { text = "Your secret's safe, commander.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Roads to Orgrimmar, to Sen'jin and to the Barrens all run through here. Hold Razor Hill and you hold Durotar. Lose it and you lose the rest." } },
      choices = {
        { text = "Then we won't lose it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A good ambush on those roads would do more than any wall.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report from Durotar crosses my table, so I know what's happening and where. Ask, and be quick about it." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've done good work for Razor Hill, so you'll get more than a short answer from me, this once." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Ask your question, and then get out of my barracks." },
    },
    burning_blade = { { id = "tp_blade", text = "That's Orgnil's business, and he's good at it. I give him whatever he asks for." } },
    _none = { { id = "tp_none", text = "Not now; ask Orgnil, or the innkeeper." } },
  },
}

P:NPC {
  key = "orgnil", id = TODO_NPC("Orgnil Soulscar"), name = "Orgnil Soulscar",
  bible = "bibles/durotar.md", role = "soldier", tier = "quest",
  communities = { "razor_hill" }, temper = { "grim" }, values = { "lawful", "protective" },
  notices = { "class", "stealth" },
  impression = {
    first = "There is a patience in how Orgnil Soulscar hunts the Burning Blade that frightens me a little. The cultists he most wants to meet, he says, are the ones smiling inside the city walls.",
    third = "{name} met Orgnil Soulscar of Razor Hill, a grim orc who hunts the Burning Blade wherever it hides.",
  },

  greetings = {
    { id = "g_watch", text = "Young orcs and trolls train here, and traders rest here, and nothing gets into Razor Hill that I don't allow." },
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
        { text = "You watch me like I'm one of them, Orgnil.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I could carry false messages to the Blade for you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll hunt them with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
      again = {
        { id = "h_again", text = "What else? Speak low; the Blade have ears in more places than you'd think." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "I watch you because the last warlock I trusted carried a Blade medallion under his shirt for two years. Earn my trust in the caves, where I can see what your demon does when the cultists call to it." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A troll warlock is a stranger thing than an orc one, and the Blade would love to recruit the first of your people. They'll come to you sweetly, and when they do, you'll come straight to me." },
      },
      choices = {
        { text = "Fair. Watch me, then, and judge me by what I do.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I don't answer to you, lawman.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Hm. That's a dangerous game, and it's exactly the one I've wanted someone to play. Not yet, though, because a messenger needs to be trusted by them first, and I won't send a youngster in to be found out." } },
      choices = { { text = "When I'm ready, then.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    hide = {
      big = true,
      lines = {
        { id = "hd_default", text = "In caves in the canyons, and under rocks like scorpids. Sometimes they hide inside the walls of cities, smiling at you, and those are the ones I'd most like to meet." },
      },
      choices = { { text = "Inside the cities?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 }, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear what the Blade whisper, and what the grunts whisper about the Blade. Ask about these, and I'll tell you what I've found." },
    },
    burning_blade = { { id = "tp_blade", text = "They're orcs who chose the demons twice. Once might be forgiven, but twice, never." } },
    _none = { { id = "tp_none", text = "I hunt the Blade, and nothing else is my concern." } },
  },
}

P:NPC {
  key = "grosk", id = TODO_NPC("Innkeeper Grosk"), name = "Innkeeper Grosk",
  bible = "bibles/durotar.md", role = "innkeeper", tier = "service",
  communities = { "razor_hill" }, temper = { "dry" }, values = { "practical" },
  notices = { "weary", "drink" },
  impression = {
    first = "Innkeeper Grosk offers a bed, ale and a roof against the sun, and treats everything beyond the door as rocks and scorpids. He is as dry as Durotar, but he does check the blankets.",
    third = "{name} rested at Innkeeper Grosk's inn in Razor Hill, the safest bed in a land of rocks and scorpids.",
  },

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
  impression = {
    first = "Walls, says Brakk, are for people who have stopped walking, and he camps wherever he stops across Durotar. His fire felt like the most welcoming place in that whole red land.",
    third = "{name} met Brakk, a wandering orc who camps across Durotar and keeps a journal of every fire he has ever built.",
  },

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
        { text = "My beast and I sleep rough too.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do you ever hear the spirits by the fire?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Lok'tar, Brakk.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? There's no hurry at a campfire; that's the whole point of one." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Then you know the best watchman in any camp has four legs and a nose. Mine was a raptor once, until it decided it liked the Barrens better than me, and I can't say I blame it." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And this must be {pet}! Come sit by the fire, both of you. Every camp I've built was better for a beast lying beside it." },
      },
      choices = {
        { text = "Mine stays with me. We look after each other.", next = "BACK", fx = { affinity = 2 } },
        { text = "What happened to the raptor?", next = "hunter_raptor" },
      },
    },
    hunter_raptor = {
      lines = { { id = "hr_default", text = "I wrote it down in my journal, the day it left: it stood at the edge of the firelight and looked back once, and then it went. I like to think it found a pack of its own out there past the river." } },
      choices = { { text = "I hope it did.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "I'm no shaman, but fire's an element, isn't it? Some nights it talks louder than others, and on those nights I bank it down and listen. Maybe you could tell me what it says." } },
      choices = { { text = "It says it's glad of the company.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Walls are for people who've stopped walking. Out here, any traveler can share the fire. A camp belongs to whoever sits at it." } },
      choices = { { text = "Show me how.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Fire first, and then whatever your trade adds: a tent, a rack for fish, a pot. The more hands, the better the rest." } },
    _none = { { id = "tp_none", text = "I only know the road and the fire. Ask in Razor Hill." } },
  },
}
