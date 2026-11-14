-- Theocritus, Mage of the Tower of Azora. Voice: bibles/theocritus.md
-- Above everyday affairs, except one: Morganth.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "theocritus", id = TODO_NPC("Theocritus"), name = "Theocritus", title = "Mage of Tower Azora",
  bible = "bibles/theocritus.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "curious", "ambitious" },
  notices = { "arcane", "fel" },

  greetings = {
    { id = "g_stairs", text = "You climbed all those stairs. Admirable. Pointless, probably, but admirable." },
    { id = "g_morganth", when = { questActive = TODO_QUEST("Morganth") }, text = "Is he dead? No? Then why are you here?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Morganth") }, text = "Ah. The one who dealt with Morganth. You may sit. Not on that." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. Your robes are dreadful. Never mind; Morley could do something with you. He does something with everyone." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You reek of the Nether. So did Morganth, before he went wrong. I will be watching you closely, and you will not enjoy it." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "Something has had its fingers in you. Something fel. Stand by the window; I'd like it to be the first thing I see if you change shape." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Theocritus. This is my tower. The gnomes are my servants; do not tip them, it confuses them. What do you want?" },
        { id = "h_low", when = { maxLevel = 17 },
          text = "You are very young and I am very busy. Come back when you've survived something interesting." },
        { id = "h_before", when = { minLevel = 18, questBefore = TODO_QUEST("Morganth") },
          text = "A man in Redridge, in the Tower of Ilgalar, once studied with Stormwind's mages. He went wrong. He is my problem." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Morganth") },
          text = "Morganth commands the Shadowhide gnolls and thinks himself a lord. Remind him otherwise. Permanently, if you'd be so kind." },
        { id = "h_eye", when = { questActive = TODO_QUEST("A Watchful Eye") },
          text = "The Eye of Azora sees far, but not far enough. That is where you come in, regrettably." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morganth"), days = 3 } },
          text = "Gone? Truly? Then Stormwind is a little safer, and I am a great deal less bored than I expected to be. That is not a complaint." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 20 },
          text = "The Mage Quarter sends me its brighter students now and then. You'd do. Possibly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The Kirin Tor have been insufferable about your people lately, I'm told. Highborne magisters' children, back from wherever. I'd like to see what the fuss is about. Later." },
      },
      choices = {
        { text = "Who is Morganth?", next = "morganth" },
        { text = "What do you study here?", next = "study" },
        { text = "I'll show myself out.", next = "END" },
      },
    },
    morganth = {
      lines = {
        { id = "mo_default", key = true,
          text = "A Stormwind student who turned to shadow, was thrown out, and took Ur's treatise on shadow magic with him. They want the book. I want him stopped." },
      },
      choices = {
        { text = "Why is that your duty?", next = "duty" },
        { text = "Sounds like the city's problem.", next = "END", fx = { trait = { skeptical = 1 } } },
      },
    },
    duty = {
      big = true,
      lines = {
        { id = "d_default", text = "Because I don't care about tax rolls or harvests or who the Regent is dining with. But I know what Morganth is. If I don't care about that, no one competent will." },
      },
      choices = {
        { text = "Then I'll help.", next = "END", fx = { affinity = 2, learn = { "morganth" }, align = { order = 1 } } },
        { text = "Very noble of you.", next = "END", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    study = {
      lines = {
        { id = "s_default", text = "Gnolls, currently. Morganth's gnolls wear pendants. If I understand the pendant, I understand the leash, and then the hand holding it." },
      },
      choices = { { text = "Fascinating.", next = "END", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    morganth = { { id = "tp_morganth", text = "Redridge. The Tower of Ilgalar. Bring a friend. Bring several." } },
    defias = { { id = "tp_defias", text = "Thieves. Tiresome. Somebody else's problem, I'm delighted to say." } },
    eastvale = { { id = "tp_eastvale", text = "There are loggers below, I'm told. I hear them occasionally. I try not to." } },
    _none = { { id = "tp_none", text = "If it were worth knowing, I would know it. Draw your own conclusions." } },
  },
}
