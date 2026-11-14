-- Deputy Willem, outside Northshire Abbey. Voice: bibles/willem.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "willem", id = TODO_NPC("Deputy Willem"), name = "Deputy Willem",
  bible = "bibles/willem.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "newcomer", "thief", "stranger" },

  greetings = {
    { id = "g_morning", when = { timeOfDay = { "dawn", "day" } }, text = "Morning! Keep to the road and you'll keep your purse." },
    { id = "g_tally", when = { questObjective = { TODO_QUEST("Brotherhood of Thieves"), left = { min = 1 } } }, text = "More bandanas for the tally? You're short a few yet." },
    { id = "g_piece", text = "Still in one piece? Good. Keep it that way." },
  },

  notice = {
    { id = "n_rogue", cat = "thief", when = { class = "ROGUE" },
      text = "A rogue, is it? I'll count the bandanas twice when you hand them in. Nothing personal." },
    { id = "n_level1", cat = "newcomer", when = { maxLevel = 1, metBefore = false },
      text = "Look at you, not a scratch on you yet. That won't last. It never does." },
    { id = "n_far", cat = "stranger", when = { outOfPlace = "far", race = { "NightElf", "Skyborne" } },
      text = "Don't get many of your sort coming down the Abbey road. Lost, or looking for work?" },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Don't do that. Every time someone does that around here, a crate goes missing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Willem, deputy to the Marshal. If it's trouble in this valley, I've likely heard of it already." },
        { id = "h_new", when = { questBefore = TODO_QUEST("A Threat Within"), band = "Greenhorn" },
          text = "Fresh off the road? Head inside the Abbey. Marshal McBride sees every new recruit himself." },
        { id = "q_thieves_before", when = { questBefore = TODO_QUEST("Brotherhood of Thieves"), questDone = TODO_QUEST("A Threat Within") },
          text = "Red bandanas in the vineyard. If you see one, it isn't fashion. Come to me when you're ready to do something about it." },
        { id = "q_thieves_short", when = { questObjective = { TODO_QUEST("Brotherhood of Thieves"), left = { min = 1 } } },
          text = "Not enough bandanas yet. The Marshal won't believe a short count. He barely believes a full one." },
        { id = "q_thieves_active", when = { questActive = TODO_QUEST("Brotherhood of Thieves") },
          text = "How many bandanas so far? I keep a tally on the stable door. Don't laugh, it's the only way the Marshal believes me." },
        { id = "q_thieves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 2 } },
          text = "Fewer red bandanas in the vineyard since you went through. Milly might even sleep tonight." },
        { id = "q_garrick_active", when = { questActive = TODO_QUEST("Bounty on Garrick Padfoot") },
          text = "Garrick Padfoot's holed up in a shack on the hillside, bold as you like. Bring me proof and the bounty's yours." },
        { id = "q_garrick_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bounty on Garrick Padfoot"), days = 3 } },
          text = "Garrick's done. The rest of them will pick a new leader by week's end, mind. They always do." },
        { id = "e_mcbride_defias", tags = { "news" }, when = { heardLine = "mcbride.d_default" },
          text = "The Marshal talked to you about the Defias? He's been chewing on that for weeks. Says they march like soldiers." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Long way from the mountains, aren't you? You'll find our hills a bit gentle." },
      },
      choices = {
        { text = "Any trouble I can help with?", next = "BUSINESS" },
        { text = "Tell me about these thieves.", next = "thieves" },
        { text = "Just passing through.", next = "END" },
      },
    },
    thieves = {
      lines = {
        { id = "t_default", key = true, text = "Defias. Red bandanas, sharp knives, and they've decided the vineyard is theirs now.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Then I'll clear them out.", next = "END", fx = { align = { order = 1 }, trait = { brave = 1 }, affinity = 1 } },
        { text = "Why would anyone join them?", next = "why", fx = { trait = { curious = 1 } } },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Hungry, mostly. Or angry. Some say Stormwind owes them. I'm a deputy, not a judge, so I'll leave that to the judges." },
      },
      choices = {
        { text = "Maybe Stormwind does owe them.", next = "END", fx = { align = { order = -2 }, opinion = { defias = "sympathetic" } } },
        { text = "Owed or not, theft is theft.", next = "END", fx = { align = { order = 2 }, opinion = { defias = "hardline" } } },
      },
    },
  },

  topics = {
    defias = { { id = "t_defias", text = "They wear red so we know who to chase. Very considerate of them." } },
    kobolds = { { id = "t_kobolds", text = "Kobolds are the Marshal's worry. I've got thieves." } },
    _none = { { id = "t_none", text = "Not something a deputy would know. Try the brothers in the Abbey." } },
  },
}
