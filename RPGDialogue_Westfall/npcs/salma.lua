-- Salma Saldean, Saldean's Farm. Voice: bibles/salma.md
-- Feeds anyone who needs a meal and someone to listen.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "salma", id = TODO_NPC("Salma Saldean"), name = "Salma Saldean",
  bible = "bibles/salma.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "hunger", "craft" },

  greetings = {
    { id = "g_welcome", text = "Come in, come in! There's always a pot on." },
    { id = "g_stew", when = { questActive = TODO_QUEST("Westfall Stew") }, text = "Stew business? The pot's getting impatient." },
    { id = "g_after", when = { questDone = TODO_QUEST("Westfall Stew") }, text = "My stew-gatherer! Sit. Eat. You're too thin." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! I can tell by how you looked at the pot. Taste that and tell me it needs nothing. Go on, lie to me." },
    { id = "n_hungry", cat = "hunger", when = { resSick = true },
      text = "You look like death warmed over, and I think you've met death recently. Sit by the stove. Death doesn't like my kitchen." },
    { id = "n_thin", cat = "hunger", when = { nearlyNaked = true },
      text = "Where are your clothes? And when did you last eat? Those two questions usually go together." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Salma. My husband farms, I cook, and anyone who comes to that door hungry leaves full. That's the rule of this house." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Westfall Stew") },
          text = "In the lean years, Westfall cooks made do with murloc eyes and buzzard meat. These are lean years. Don't make that face." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Whatever the list says, bring it. Murloc eyes are better than they sound. Most things are, in a stew." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Westfall Stew"), days = 3 } },
          text = "Three pots gone by sundown. Half the hill came down for it. One of them cried. I didn't ask." },
        { id = "h_pie", when = { questActive = TODO_QUEST("Goretusk Liver Pie") },
          text = "Goretusk liver. Fresh, mind. A pie's only as good as what's in it, and that's a fact Verna will argue with." },
        { id = "h_furlbrows", when = { topicKnown = "old_blanchy" },
          text = "Verna and Theodore are up at the old Jansen place, poor dears. Their wagon broke. Theodore's pride broke worse." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Thin as a rake, even for an elf. Sit down. Sky or no sky, everyone eats at my table." },
        { id = "h_thin", when = { metBefore = true }, text = "Sit down, sit. You're thinner than last time. Everyone's thinner in Westfall. I won't have it at my table." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Himself's asleep in the chair again. Snores like a harvest golem. Don't you dare tell him I said so." },
      },
      choices = {
        { text = "What's cooking?", next = "pot" },
        { text = "How do you keep going out here?", next = "going" },
        { text = "I'd best be off.", next = "END" },
      },
    },
    pot = {
      lines = {
        { id = "p_default", text = "Whatever Westfall gives me. Today it gave me a buzzard and some regret. It'll be lovely." },
      },
      choices = {
        { text = "Smells wonderful.", next = "END", fx = { affinity = 1 } },
        { text = "Buzzard?", next = "vulture", fx = { trait = { witty = 1 } } },
      },
    },
    vulture = {
      lines = { { id = "v_default", text = "Buzzard. They eat well out here, which is more than I can say for the people." } },
      choices = { { text = "Fair point.", next = "END" } },
    },
    going = {
      big = true,
      lines = {
        { id = "g_default", text = "You feed people. They come back. You listen to them. They stay. Do that long enough and you've got a village again." },
      },
      choices = {
        { text = "That's a fine way to live.", next = "END", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "It won't stop the Defias.", next = "defias", fx = { trait = { stern = 1 } } },
      },
    },
    defias = {
      lines = { { id = "d_default", text = "No. That's Gryan's work. Mine's making sure there's someone left to thank him." } },
      choices = { { text = "Fair enough.", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Some of them have been to my door, you know. Hungry. I fed them. I'd do it again." } },
    people_militia = { { id = "tp_militia", text = "Good boys and girls, every one, and every one of them hungry. I see to that." } },
    westfall = { { id = "tp_westfall", text = "It'll come back. Land always comes back if there's people who love it." } },
    old_blanchy = { { id = "tp_blanchy", text = "That horse has more years than sense. Verna loves her like a daughter." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. More stew?" } },
  },
}
