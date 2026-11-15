-- Captain Danuvin, Sentinel Hill. Voice: bibles/danuvin.md
-- Organizes the farmers who stayed. Won't forgive the city for leaving.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "danuvin", id = TODO_NPC("Captain Danuvin"), name = "Captain Danuvin", title = "The People's Militia",
  bible = "bibles/danuvin.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "sharp" }, values = { "brave", "stern" },
  notices = { "trophy", "kit" },

  greetings = {
    { id = "g_line", text = "Fall in or move along." },
    { id = "g_paws", when = { questActive = TODO_QUEST("Patrolling Westfall") }, text = "Paws. How many? Not enough. Back out." },
    { id = "g_after", when = { questDone = TODO_QUEST("Patrolling Westfall") }, text = "You patrol like you mean it. That's rarer than you'd think." },
  },

  notice = {
    { id = "n_gnoll", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Patrolling Westfall") },
      text = "You smell of gnoll. Good. Empty that bag on the table, and don't wipe your hands on the map." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor won't last a week on the Dust Plains. We've a smith's fire on the hill. Use it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Danuvin. I organize the farmers who were too stubborn to leave. Stubborn makes good soldiers." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Patrolling Westfall") },
          text = "The gnolls aren't just raiding. They work with the thieves in the mines. Somebody feeds them and points them at us." ,
          fx = { hear = "gnolls_with_defias" } },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Out across the grass, south along the road. Bring me paws. Every paw's one less hand on a farmer's door." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Patrolling Westfall"), days = 3 } },
          text = "The south road was quiet last night. First time this month. That was you." },
        { id = "h_city", key = true,
          text = "Stormwind left us to the thieves. Folk out here have long memories and short patience. They won't forget it.",
          fx = { hear = "stormwind_abandoned_westfall" } },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "You've had real training. Good. Half my lot learned to fight last spring, from me, with hoes." },
        { id = "h_drill", when = { metBefore = true }, text = "Drilled the new ones till they dropped. Let them sleep. Drilled them again. By harvest they'll be soldiers. Or they'll be very tired farmers." },
      },
      again = {
        { id = "h_again", text = "Next question. Quick." },
        { id = "h_again2", text = "Ask. I can count recruits and listen at the same time." },
      },
      choices = {
        { text = "Why fight for Westfall?", next = "why" },
        { text = "Tell me about the gnolls.", next = "gnolls" },
        { text = "You'll never forgive Stormwind, will you?", next = "city" },
        { text = "How do you make soldiers out of farmers?", next = "drill" },
        { text = "Let me drill your recruits a while.", next = "teach", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "My family farmed out here. I've come back.", next = "home", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "A man should be able to plant a field and expect to harvest it. That's all. That's dignity, out here." },
      },
      choices = {
        { text = "Then I'll fight for it too.", next = "BACK", fx = { affinity = 2, align = { order = 1, honor = 1 } } },
        { text = "Sounds like a lot of dying for wheat.", next = "wheat", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Dignity's a big word for a farm fight.", next = "dignity" },
      },
    },
    wheat = {
      lines = { { id = "wh_default", text = "Everyone eats wheat. Remember that next time you're hungry in the city." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
    dignity = {
      big = true,
      lines = { { id = "di_default", text = "It's the right word. The thieves don't just take crops; they take the right to grow them. Lord Stoutmantle's fight is for that. So's mine." } },
      choices = {
        { text = "And when it's won?", next = "dignity_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dignity_after = {
      lines = { { id = "da_default", text = "Then I'm a farmer again, and I never pick up a spear as long as I live. That's the whole dream. I don't dream much." } },
      choices = {
        { text = "I hope you get it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Soldiers rarely go back.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    gnolls = {
      lines = {
        { id = "gn_default", text = "Riverpaw, they call themselves. Bigger and bolder than Elwynn's lot. They don't take farms; they just make sure nobody keeps one." },
      },
      choices = {
        { text = "Who's feeding them?", next = "gnoll_work" },
        { text = "I'll thin them out.", next = "BACK", fx = { learn = { "riverpaw" } } },
      },
    },
    gnoll_work = {
      lines = {
        { id = "gw_default", text = "The thieves under Moonbrook. Gnolls don't plan; someone plans for them. Every paw you bring me is a message sent back down that hole.",
          fx = { hear = "gnolls_with_defias", learn = { "riverpaw" } } },
        { id = "gw_active", when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Eight paws. South along the road, out where the grass gets long. They'll find you before you find them. Let them." },
      },
      choices = {
        { text = "Eight paws, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      big = true,
      lines = { { id = "ci_default", text = "Forgive them? Nobody's asked. When a king's house leaves its farmers to the knives, the farmers remember. I was a farmer. I remember." } },
      choices = {
        { text = "The Highlord says he regrets it.", next = "city_bolvar", when = { heardLine = "bolvar.t_westfall" } },
        { text = "Not all of Stormwind forgot you.", next = "city_noble", when = { origin = "human_minor_noble" } },
        { text = "The city has its own wars.", next = "city_wars", fx = { affinity = -1, opinion = { westfall = "patience" } } },
        { text = "I'd remember too.", next = "BACK", fx = { affinity = 2, opinion = { westfall = "abandoned" } } },
      },
    },
    city_bolvar = {
      lines = { { id = "cb_default", text = "Regret's cheap. Send a company. I'd forgive a company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city_noble = {
      lines = { { id = "cn_default", text = "Then where are they? Oh. Here. One of them. Well. It's a start, and I'll take it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    city_wars = {
      lines = { { id = "cw_default", text = "So do we. Ours just happens to be on the road to their bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drill = {
      lines = { { id = "dr_default", text = "Hoes first, then spears. A man who's swung a hoe all his life has the shoulders for it. What he needs to learn is when to stop." } },
      choices = {
        { text = "When to stop?", next = "drill_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drill_stop = {
      lines = { { id = "ds_default", text = "My farmers want to keep swinging till the thief stops moving. I teach them to stop when he's down and tie him up. Gryan wants prisoners. Prisoners talk." } },
      choices = {
        { text = "Mercy and sense, both.", next = "BACK", fx = { affinity = 1, align = { light = 1, order = 1 } } },
        { text = "Dead thieves don't come back.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Ha. Go on, then. Show them how a real soldier holds a shield. Then show them how to hold it when they're tired. That's the lesson they need." } },
      choices = {
        { text = "I'll start at dawn.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 2 } } },
        { text = "Farmers will never be soldiers.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Back? Most who went east stayed east. If you mean it, there's a spear by the door. If you're visiting, visit somewhere safer." } },
      choices = {
        { text = "I mean it.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 2 } } },
        { text = "I'm only visiting.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer, until the farm was taken. A captain since, because somebody had to be. A farmer again someday, if Lord Stoutmantle's right.", next = "dignity" } },
    advice = { { id = "tp_ad", text = "Never turn your back on long grass. Gnolls crawl. And keep your blade where you can reach it sitting down." } },
    riverpaw = { { id = "tp_gnolls", text = "South, by the river. Get them before they get the farms." } },
    defias = { { id = "tp_defias", text = "Thieves with a cause. That makes them worse, not better." } },
    people_militia = { { id = "tp_militia", text = "Every one of them volunteered. None of them should have had to." } },
    westfall = { { id = "tp_westfall", text = "Mine. The ones who stayed in it deserve someone who stayed with them."} },
    _none = { { id = "tp_none", text = "Not my patrol, not my concern. Ask Gryan." } },
  },
}
