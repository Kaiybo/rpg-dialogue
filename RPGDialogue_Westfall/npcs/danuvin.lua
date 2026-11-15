-- Captain Danuvin, Sentinel Hill. Voice: bibles/danuvin.md
-- Organizes the farmers who stayed. Won't forgive the city for leaving.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "danuvin", id = TODO_NPC("Captain Danuvin"), name = "Captain Danuvin", title = "The People's Militia",
  bible = "bibles/danuvin.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "sharp" }, values = { "brave", "stern" },
  notices = { "trophy", "kit" },
  impression = {
    first = "Captain Danuvin has made soldiers of farmers who were too stubborn to leave, and he speaks of that stubbornness with real respect. He counts gnoll paws the way a banker counts coin.",
    third = "{name} met Captain Danuvin of the People's Militia, who turns Westfall's stubborn farmers into soldiers.",
  },

  greetings = {
    { id = "g_line", text = "Fall in or move along." },
    { id = "g_paws", when = { questActive = TODO_QUEST("Patrolling Westfall") }, text = "Paws, is it? Count them out on the table, and if it isn't eight, back out you go." },
    { id = "g_after", when = { questDone = TODO_QUEST("Patrolling Westfall") }, text = "You patrol like you mean it, and that's rarer than you'd think." },
  },

  notice = {
    { id = "n_gnoll", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Patrolling Westfall") },
      text = "You smell of gnoll, which is good news. Empty that bag on the table, and don't wipe your hands on the map." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor won't last a week on the Dust Plains, so use the smith's fire we keep on the hill." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Danuvin, of the People's Militia. I organize the farmers who were too stubborn to leave, and stubborn makes good soldiers." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Patrolling Westfall") },
          text = "The gnolls aren't just raiding; they work with the thieves in the mines. Somebody feeds them and points them at us." ,
          fx = { hear = "gnolls_with_defias" } },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Get out across the grass, south along the road, and bring me paws. Every paw is one less hand on a farmer's door." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Patrolling Westfall"), days = 3 } },
          text = "The south road was quiet last night for the first time this month, and that was your doing." },
        { id = "h_city", key = true,
          text = "Stormwind left us to the thieves. Folk out here have long memories and short patience. They won't forget it.",
          fx = { hear = "stormwind_abandoned_westfall" } },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "You've had real training, I can see, and good. Half my lot learned to fight last spring, from me, with hoes." },
        { id = "h_drill", when = { metBefore = true }, text = "I drilled the new ones till they dropped, let them sleep, then drilled them again. By harvest they'll be soldiers, or else very tired farmers." },
      },
      again = {
        { id = "h_again", text = "Next question, and be quick about it." },
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
        { id = "w_default", text = "A man should be able to plant a field and expect to harvest it, that's all. Out here, that's what dignity means." },
      },
      choices = {
        { text = "Then I'll fight for it too.", next = "BACK", fx = { affinity = 2, align = { order = 1, honor = 1 } } },
        { text = "I'd sooner pay the Defias off than bleed for a field.", next = "BACK", fx = { align = { order = -1, honor = -1 } } },
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
      lines = { { id = "di_default", text = "It's the right word. The thieves don't just take crops, they take the right to grow them, and that's what Lord Stoutmantle is fighting for. So am I." } },
      choices = {
        { text = "And when it's won?", next = "dignity_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dignity_after = {
      lines = { { id = "da_default", text = "Then I'm a farmer again, and I never pick up a spear for as long as I live. That's the whole of the dream, and I don't dream much." } },
      choices = {
        { text = "I hope you get it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Soldiers rarely go back.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    gnolls = {
      lines = {
        { id = "gn_default", text = "Riverpaw, they call themselves, and they're bigger and bolder than Elwynn's lot. They don't take farms; they just make sure nobody keeps one." },
      },
      choices = {
        { text = "Who's feeding them?", next = "gnoll_work" },
        { text = "I'll thin them out.", next = "BACK", fx = { learn = { "riverpaw" } } },
      },
    },
    gnoll_work = {
      lines = {
        { id = "gw_default", text = "The thieves under Moonbrook do. Gnolls don't plan, so someone plans for them, and every paw you bring me is a message sent back down that hole.",
          fx = { hear = "gnolls_with_defias", learn = { "riverpaw" } } },
        { id = "gw_active", when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Eight paws, from south along the road where the grass grows long. They'll find you before you find them, so let them come." },
      },
      choices = {
        { text = "Eight paws, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      big = true,
      lines = { { id = "ci_default", text = "Forgive them? Nobody's asked us to. When a king's house leaves its farmers to the knives, the farmers remember, and I was a farmer before I was anything else." } },
      choices = {
        { text = "The Highlord says he regrets it.", next = "city_bolvar", when = { heardLine = "bolvar.t_westfall" } },
        { text = "Not all of Stormwind forgot you.", next = "city_noble", when = { origin = "human_minor_noble" } },
        { text = "The city has its own wars.", next = "city_wars", fx = { affinity = -1, opinion = { westfall = "patience" } } },
        { text = "I'd remember too.", next = "BACK", fx = { affinity = 2, opinion = { westfall = "abandoned" } } },
      },
    },
    city_bolvar = {
      lines = { { id = "cb_default", text = "Regret's cheap, friend. Let him send a company of soldiers down that road, and I'd forgive a company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city_noble = {
      lines = { { id = "cn_default", text = "Then where are they? Oh, standing in front of me, one of them at least. Well, it's a start, and I'll take it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    city_wars = {
      lines = { { id = "cw_default", text = "So do we, and ours just happens to be on the road to their bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drill = {
      lines = { { id = "dr_default", text = "Hoes first, then spears. A man who's swung a hoe all his life has the shoulders for it; what he needs to learn is when to stop." } },
      choices = {
        { text = "When to stop?", next = "drill_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drill_stop = {
      lines = { { id = "ds_default", text = "My farmers want to keep swinging till the thief stops moving, so I teach them to stop when he's down and tie him up. Gryan wants prisoners, because prisoners talk." } },
      choices = {
        { text = "Mercy and sense, both.", next = "BACK", fx = { affinity = 1, align = { light = 1, order = 1 } } },
        { text = "Dead thieves don't come back.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Ha! Go on, then, and show them how a real soldier holds a shield. Then show them how to hold it when they're tired, because that's the lesson they need." } },
      choices = {
        { text = "I'll start at dawn.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 2 } } },
        { text = "Farmers will never be soldiers.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Back, are you? Most who went east stayed east. If you mean it, there's a spear by the door, and if you're only visiting, visit somewhere safer." } },
      choices = {
        { text = "I mean it.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 2 } } },
        { text = "I'm only visiting.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I command what passes for an army out here, so most of the bad news comes to me first. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I was a farmer until the farm was taken, and a captain since, because somebody had to be. I'll be a farmer again someday, if Lord Stoutmantle's right.", next = "dignity" } },
    advice = { { id = "tp_ad", text = "Never turn your back on long grass, because gnolls crawl. And keep your blade where you can reach it sitting down." } },
    riverpaw = { { id = "tp_gnolls", text = "They're south, down by the river. Get them before they get to the farms." } },
    defias = { { id = "tp_defias", text = "They're thieves with a cause, and that makes them worse, not better." } },
    people_militia = { { id = "tp_militia", text = "Every one of them volunteered. None of them should have had to." } },
    westfall = { { id = "tp_westfall", text = "It's my homeland. The ones who stayed in it deserve someone who stayed with them."} },
    _none = { { id = "tp_none", text = "That's not my patrol and not my concern. Ask Gryan." } },
  },
}
