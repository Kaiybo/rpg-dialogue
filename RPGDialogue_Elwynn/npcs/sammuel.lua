-- Brother Sammuel, paladin trainer, Northshire Abbey (Brotherhood of Northshire). Voice: bibles/sammuel.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sammuel", id = TODO_NPC("Brother Sammuel"), name = "Brother Sammuel",
  bible = "bibles/sammuel.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "pious", "kind", "brave" },
  spiritSensitive = true,
  notices = { "affliction", "light" },
  impression = {
    first = "Brother Sammuel speaks softly and senses curses and sickness the way a healer feels for a pulse. He teaches those the Light has chosen and prays for the rest without complaint.",
    third = "{name} met Brother Sammuel of Northshire Abbey, who hears the oaths of new paladins and prays for everyone else.",
  },

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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Something did. The Light chooses some, and others are chosen differently. I pray for all of them." } },
      choices = {
        { text = "Then pray for me too, Brother. I'll gladly take it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I chose myself, Brother. No one chose me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It favours those who protect, and a warrior who holds the line for others is doing the Light's work, whether they pray or not. I've seen the sword do more good in Northshire than a dozen sermons." } },
      choices = {
        { text = "Then I'll fight for those who can't.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I fight for myself. The Light can watch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I believe the Light cares for all that lives, and a hunter who takes life with care honours it. The ones who take more than they need, though, worry me, and they should worry themselves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a living thing in your keeping, child. Remember that you answer for it." },
      },
      choices = {
        { text = "I take only what I need, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The woods are full. Taking more won't harm them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It watches over everyone, though some walk in its sight more easily than others, and your trade doesn't make it easy. I'd ask you to remember that every purse you lift belongs to someone the Light loves just as much as you." } },
      choices = {
        { text = "I'll remember that, Brother. My knives will serve the innocent.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light can love whom it likes. I'll lift what I need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They share this one, though not always comfortably, and Khelden and I have had words over whose candles burn in the Library Wing. The Light asks for faith, and the arcane asks for will, and I think a person can have both." } },
      choices = {
        { text = "Both serve the Abbey. Faith and will in their proper place.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The arcane needs no faith. My will is enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the Light never stops reaching for anyone, and I'd be a poor priest if I stopped reaching with it. La Salle calls me a fool for it, but I've seen her students come back to the Light more than once." } },
      choices = {
        { text = "Keep praying, Brother. I may need it one day.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save your prayers for those who want them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I wouldn't go that far, but I've seen the Light heal and I've seen druids heal, and I'm not sure the wounded can tell the difference." } },
      choices = {
        { text = "All healing comes from the same good place.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nature needs no Light to be whole.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in Northshire! The Light has many faces, I'm told, and perhaps nature is one of them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Abbey. Jorik's student, I suppose, and the Light watches over you as well, though it sometimes looks away." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Khelden's student, I suppose, and you'll want to know whether the Light and the arcane can share a roof." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You come from the graveyard, and I can feel the darkness on you. I'll still pray for you, though I suspect you'd rather I didn't." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the Abbey. You stand like Llane's yard, child, but you might find the Light stands with you too." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The Light walks in the woods as well as the Abbey, child, and I think you know that better than most." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I sense no curse on you, only the spirits you walk with. The Light chose me, and something chose you, I think." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on; the practice swords can wait a while." },
      },
      choices = {
        { text = "Do you think the Light and nature are the same?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does the Light ask of me?", next = "light" },
        { text = "How did you come to the Abbey?", next = "path" },
        { text = "Tell me about the Abbey's history.", next = "abbey" },
        { text = "What do you teach that Anetta doesn't?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was a novice here, Brother.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I fled Lordaeron as a child.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Does the Light truly watch over rogues, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can the Light and the arcane share a roof, Brother?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would you pray for a warlock, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Light favour warriors, Brother Sammuel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you think the Light cares for beasts, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think the spirits chose me, Brother Sammuel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Mercy that costs me is a price I won't pay.", next = "BACK", fx = { align = { light = -2 } } },
      },
    },
    light_ask = {
      lines = {
        { id = "la_default", text = "It is. The old clerics of this house held that a pain shared among everyone weighs less on each. That's the ask: carry a little of somebody else's." },
      },
      choices = {
        { text = "A little, I can manage.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "I've enough of my own to carry.", next = "BACK", fx = { align = { light = -1 } } },
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
      choices = {
        { text = "I'll try to be that for someone.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some doubts don't go quiet, however busy I keep.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    abbey = {
      lines = {
        { id = "ab_default", text = "Northshire's clerics went into the First War to heal soldiers, and the orcs hunted them for it. Faol saw the cost, and founded the Silver Hand to fight back." },
      },
      choices = {
        { text = "And after the war?", next = "abbey_after" },
        { text = "They died healing. That's hard to hear.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healers who walk into a war should expect to die.", next = "BACK", fx = { align = { light = -1 } } },
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
      choices = {
        { text = "Then I'll keep my oath the same way.", next = "BACK", fx = { learn = { "northshire_abbey" }, align = { order = 1 } } },
        { text = "An oath to a broken order seems a waste to me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Anetta teaches you to mend, and I teach my lot to stand in front of the ones you're mending. It's the same Light, held at a different end of the sword." },
      },
      choices = {
        { text = "Then we'd better work together.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather keep to my own work than yours.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I left the Abbey behind me, and I don't miss it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    lordaeron = {
      lines = {
        { id = "lo_default", text = "Then you've seen what the Silver Hand couldn't save. I pray for the north every morning. I'll add your name, if you'll let me." },
      },
      choices = {
        { text = "Please do.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Keep your prayers, because the north is past saving.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Pray for the ones who stayed.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Abbey hears a good deal through its doors, and some of it reaches me between lessons. Ask me about any of this." },
    },
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
