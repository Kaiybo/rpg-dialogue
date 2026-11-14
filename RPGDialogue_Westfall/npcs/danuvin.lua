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
      },
      choices = {
        { text = "Why fight for Westfall?", next = "why" },
        { text = "Tell me about the gnolls.", next = "gnolls" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "A man should be able to plant a field and expect to harvest it. That's all. That's dignity, out here." },
      },
      choices = {
        { text = "Then I'll fight for it too.", next = "END", fx = { affinity = 2, align = { order = 1, honor = 1 } } },
        { text = "Sounds like a lot of dying for wheat.", next = "wheat", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    wheat = {
      lines = { { id = "wh_default", text = "Everyone eats wheat. Remember that next time you're hungry in the city." } },
      choices = { { text = "Fair.", next = "END" } },
    },
    gnolls = {
      lines = {
        { id = "gn_default", text = "Riverpaw, they call themselves. Bigger and bolder than Elwynn's lot. They don't take farms; they just make sure nobody keeps one." },
      },
      choices = { { text = "I'll thin them out.", next = "END", fx = { learn = { "riverpaw" } } } },
    },
  },

  topics = {
    riverpaw = { { id = "tp_gnolls", text = "South, by the river. Get them before they get the farms." } },
    defias = { { id = "tp_defias", text = "Thieves with a cause. That makes them worse, not better." } },
    people_militia = { { id = "tp_militia", text = "Every one of them volunteered. None of them should have had to." } },
    _none = { { id = "tp_none", text = "Not my patrol, not my concern. Ask Gryan." } },
  },
}
