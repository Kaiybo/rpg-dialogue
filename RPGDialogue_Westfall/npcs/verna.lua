-- Verna Furlbrow, by the broken wagon at the Jansen Stead. Voice: bibles/verna.md
-- Practical, warm, and devoted to one exhausted horse.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "verna", id = TODO_NPC("Verna Furlbrow"), name = "Verna Furlbrow",
  bible = "bibles/verna.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "kind", "honest" },
  notices = { "animal", "craft" },

  greetings = {
    { id = "g_wagon", text = "Careful round the wagon, dear. It's held up with string and prayer." },
    { id = "g_oats", when = { questActive = TODO_QUEST("Poor Old Blanchy") }, text = "Any oats? She's been looking at me like I've forgotten her." },
    { id = "g_after", when = { questDone = TODO_QUEST("Poor Old Blanchy") }, text = "Blanchy's put on a little weight, thanks to you. Don't tell her I said." },
  },

  notice = {
    { id = "n_pet", cat = "animal", when = { pet = { type = "Beast" } },
      text = "Oh, what a sweet thing. Is {pet} eating properly? Animals out here go thin so fast." },
    { id = "n_horse", cat = "animal", when = { mounted = true },
      text = "Get down and let that poor creature breathe a minute. Blanchy, look, company." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? Then you'll know a goretusk liver's no good past a day. Folk never believe me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Verna Furlbrow. That's Theodore on the porch, pretending he isn't worried, and that's Blanchy, who's the only one of us honest about being tired." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Poor Old Blanchy") },
          text = "I fed her before we left the farm. Then the wagon broke, and we've been here since, and she's eaten everything that's grass. She needs oats." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Poor Old Blanchy") },
          text = "There are sacks of oats lying about the old farms. The thieves don't bother with them. Bring me a few handfuls, dear." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Poor Old Blanchy"), days = 3 } },
          text = "Look at her eat! That's the first time she's lifted her head properly in a week. Thank you, truly." },
        { id = "h_stew", when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Stew for Salma, is it? Good. That woman could feed an army on a turnip, and some days she has to." },
        { id = "h_pie_done", when = { questDone = TODO_QUEST("Goretusk Liver Pie") },
          text = "So there was pie. Good. Whoever made it, don't tell the other one it was better. That's how friendships last out here." },
      },
      choices = {
        { text = "Tell me about Blanchy.", next = "blanchy" },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Goodbye, Verna.", next = "END" },
      },
    },
    blanchy = {
      lines = {
        { id = "b_default", key = true, text = "She's pulled our cart since Theodore had all his hair. She's slow and stubborn and the best thing on four legs in Westfall." },
      },
      choices = {
        { text = "She's lucky to have you.", next = "END", fx = { affinity = 2, learn = { "old_blanchy" }, trait = { kind = 1 } } },
        { text = "Maybe it's time to let her rest.", next = "rest", fx = { learn = { "old_blanchy" } } },
      },
    },
    rest = {
      lines = { { id = "r_default", text = "She'll rest when we're home. All three of us will." } },
      choices = { { text = "I hope that's soon.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    old_blanchy = { { id = "tp_blanchy", text = "Over by the wagon, dear. Mind her back legs. She kicks when she's hungry, and she's always hungry." } },
    defias = { { id = "tp_defias", text = "They took our farm and Theodore's nerve. I've decided they'll not have mine." } },
    harvest_watchers = { { id = "tp_watchers", text = "Nasty things. They fill up with oats, you know, the stuffing. Waste of good oats." } },
    _none = { { id = "tp_none", text = "Couldn't say, dear. Ask Salma; she hears everything over that stove." } },
  },
}
