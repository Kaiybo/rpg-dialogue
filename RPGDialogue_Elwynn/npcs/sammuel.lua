-- Brother Sammuel, paladin trainer, Northshire Abbey (Brotherhood of Northshire). Voice: bibles/sammuel.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sammuel", id = TODO_NPC("Brother Sammuel"), name = "Brother Sammuel",
  bible = "bibles/sammuel.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "pious", "kind", "brave" },
  spiritSensitive = true,
  notices = { "affliction", "light" },

  greetings = {
    { id = "g_light", text = "The Light keeps you." },
    { id = "g_lesson", when = { class = "PALADIN" }, text = "Ready for your next lesson?" },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "Not one of mine, but welcome all the same." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "One of Anetta's, are you? Welcome to the hall of arms, and mind the practice swords." },
  },

  notice = {
    { id = "n_disease", cat = "affliction", place = "before", when = { debuffType = "Disease" },
      text = "You're sick. Hold still and let me look at you." },
    { id = "n_curse", cat = "affliction", place = "before", when = { debuffType = "Curse" },
      text = "There's a curse on you; I can feel it from here. A mage or a druid can lift it, but all I can do is pray." },
    { id = "n_taint", cat = "light", when = { taint = { min = 20 } },
      text = "Something clings to you that the Light doesn't like. I won't ask about it, not today." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I teach those the Light has chosen. The rest I simply pray for." },
        { id = "h_ghost", priority = 100, when = { ghost = true },
          text = "I can feel you there, though I can't see you. Go to the healer, child, and then come back to me." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Every paladin's first lesson is the same. The Light isn't a weapon you own. It's a trust you keep." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Consecrated Letter"), days = 1 } },
          text = "The Marshal sent you with a letter? Good, then we begin today." },
        { id = "h_dwarf_paladin", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ironforge sends us more of you each year, and I'm glad of it; stubbornness is half of faith." },
        { id = "h_squire", when = { origin = "human_paladin_squire" },
          text = "You were a squire of the Silver Hand. Then you know what was lost when it broke. Let's not lose the rest." },
        { id = "h_light", when = { alignment = { axis = "light", min = 50 } },
          text = "You carry yourself like someone who's been forgiven, or who forgives. Either will serve you well." },
        { id = "h_afraid", when = { metBefore = true, class = "PALADIN" }, text = "How was your first real fight? Don't tell me you won; tell me whether you were afraid, because the afraid ones listen better." },
        { id = "h_floor", when = { metBefore = true }, text = "I've knelt on this floor every morning for longer than you've been alive. The stone is worn where I kneel. I find that a comfort." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Abbey is quiet at this hour. The Light doesn't sleep, but it does seem to rest." },
        { id = "h_returned", when = { minLevel = 25, metBefore = true },
          text = "You've come back to the Abbey, as people do after they've seen what's out there. The floor's the same as it was, but you aren't." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on; the practice swords can wait a while." },
      },
      choices = {
        { text = "What does the Light ask of me?", next = "light" },
        { text = "How did you come to the Abbey?", next = "path" },
        { text = "Tell me about the Abbey's history.", next = "abbey" },
        { text = "What do you teach that Anetta doesn't?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was a novice here, Brother.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I fled Lordaeron as a child.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Another time, Brother.", next = "END" },
      },
    },

    light = {
      big = true,
      lines = {
        { id = "l_default", text = "Mercy when it costs you, and courage when it doesn't pay. The rest is detail." },
        { id = "l_healer", once = true, when = { heardLine = "pool:spirithealer.cg_default" },
          text = "You've been arguing with the healer on the hill; you have the look of it. The Light won't settle that argument for you, but it will ask what you mean to do now that you're back." },
        { id = "l_shadow", when = { alignment = { axis = "light", max = -30 } },
          text = "You've walked some way from it already. The road back is shorter than you think." },
      },
      choices = {
        { text = "That's a great deal to ask of anyone.", next = "light_ask", fx = { trait = { skeptical = 1 } } },
        { text = "I can do that.", next = "BACK", fx = { align = { light = 2 }, trait = { pious = 1 }, affinity = 1 } },
      },
    },
    light_ask = {
      lines = {
        { id = "la_default", text = "It is. The old clerics of this house held that a pain shared among everyone weighs less on each. That's the ask: carry a little of somebody else's." },
      },
      choices = {
        { text = "A little, I can manage.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "And who carries mine?", next = "light_mine" },
      },
    },
    light_mine = {
      lines = {
        { id = "lm_default", text = "Whoever's next to you; that's the trick of it. Nobody carries their own for long, if they let anyone near." },
      },
      choices = { { text = "Something else, Brother.", next = "BACK" } },
    },

    path = {
      lines = {
        { id = "p_cart", text = "Slowly, on my knees, the way everyone does. My road's a small one. The Abbey's is the one worth telling." },
      },
      choices = {
        { text = "Tell me the Abbey's, then.", next = "abbey" },
        { text = "Did you ever doubt?", next = "again" },
      },
    },
    again = {
      lines = {
        { id = "a_never", text = "Every winter. Then a recruit comes in frightened and asks something I can answer. Doubt goes quiet when there's work to do." },
      },
      choices = { { text = "I'll try to be that for someone.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } } },
    },

    abbey = {
      lines = {
        { id = "ab_default", text = "Northshire's clerics went into the First War to heal soldiers, and the orcs hunted them for it. Faol saw the cost, and founded the Silver Hand to fight back." },
      },
      choices = {
        { text = "And after the war?", next = "abbey_after" },
        { text = "They died healing. That's hard to hear.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    abbey_after = {
      lines = {
        { id = "aa_default", text = "Faol rebuilt this house and gathered us again: the Brotherhood of Northshire. Priests, paladins, the brothers in the fields. We train whoever the kingdom sends." },
      },
      choices = {
        { text = "And the Silver Hand now?", next = "abbey_hand" },
        { text = "Something else.", next = "BACK", fx = { learn = { "northshire_abbey" } } },
      },
    },
    abbey_hand = {
      lines = {
        { id = "ah_default", text = "It broke in the north, with Lordaeron, but not here. Oaths outlast orders if you keep them, and I keep mine every morning on this floor." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "northshire_abbey" }, align = { order = 1 } } } },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Anetta teaches you to mend, and I teach my lot to stand in front of the ones you're mending. It's the same Light, held at a different end of the sword." },
      },
      choices = {
        { text = "Then we'd better work together.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some of us prefer not to need the sword.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    novice = {
      lines = {
        { id = "nv_default", text = "I thought I knew the face. The novices still scrub the same floors you did, and complain about them the same way." },
      },
      choices = {
        { text = "The floors were very clean.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I've tried to deserve those years.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    lordaeron = {
      lines = {
        { id = "lo_default", text = "Then you've seen what the Silver Hand couldn't save. I pray for the north every morning. I'll add your name, if you'll let me." },
      },
      choices = {
        { text = "Please do.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Pray for the ones who stayed.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of Northshire and a paladin of the Light. Where I came from matters less than where I kneel." } },
    advice = { { id = "tp_ad", text = "Kneel every morning, even when you don't feel like it, and especially then." } },
    defias = { { id = "t_defias", text = "They're somebody's sons. That doesn't make them less dangerous." } },
    northshire_abbey = {
      { id = "t_abbey", text = "Where the first paladins learned their oaths. I try to deserve the floor I stand on." },
      { id = "t_abbey2", text = "Sit, and I'll tell you what this house cost.", next = "abbey" },
    },
    _none = { { id = "t_none", text = "The Light doesn't tell me everything. Neither does Marshal McBride." } },
  },
}
