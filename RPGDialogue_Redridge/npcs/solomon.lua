-- Magistrate Solomon, Lakeshire Town Hall. Voice: bibles/solomon.md
-- Elected, besieged, and out of patience with everyone who isn't sending help.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "solomon", id = TODO_NPC("Magistrate Solomon"), name = "Magistrate Solomon",
  bible = "bibles/solomon.md", role = "noble", tier = "major",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "lawful", "stern" },
  notices = { "reputation", "deputy" },

  greetings = {
    { id = "g_brief", text = "Be brief. Orcs are not." },
    { id = "g_letters", when = { questActive = TODO_QUEST("Messenger to Westfall") }, text = "Why are you still here? Westfall. The letter. Go." },
    { id = "g_hero", when = { townStanding = { town = "lakeshire", min = 55 } }, text = "Lakeshire's champion. Sit, if you like. You're the only visitor I don't mind." },
    { id = "g_distrust", when = { townStanding = { town = "lakeshire", max = -20 } }, text = "The court has heard your name. Not kindly." },
  },

  notice = {
    { id = "n_deputy", cat = "deputy", place = "before", when = { questDone = TODO_QUEST("The True Masters") },
      text = "The Regent's deputy. I asked Stormwind for an army and it sent me you. I've stopped being insulted. You've earned that." },
    { id = "n_hero", cat = "reputation", when = { townStanding = { town = "lakeshire", min = 30 } },
      text = "The fishermen say your name now when they talk about the lake being safe. The fishermen never agree on anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Solomon. Magistrate, elected, which means the people of Lakeshire chose me to be the one who writes letters nobody answers." },
        { id = "h_new", when = { maxLevel = 17 },
          text = "You've come up from Elwynn. Good. Lakeshire needs every blade it can borrow, even the short ones." },
        { id = "h_westfall", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Westfall") },
          text = "I hear they've a militia in Westfall. Farmers with spears, holding their own. Take my letter to their leader. If anyone understands, it's him." },
        { id = "h_westfall_done", tags = { "news" }, when = { questDone = TODO_QUEST("Messenger to Westfall") },
          text = "Stoutmantle can't spare a man. I'd be angrier if I didn't know exactly how he feels." },
        { id = "h_gath", when = { questActive = TODO_QUEST("Wanted: Gath'Ilzogg") },
          text = "Gath'Ilzogg sits in Stonewatch Keep as if he built it. He didn't. We did. Bring me his head, and the court will consider the matter closed." },
        { id = "h_fangore", when = { questActive = TODO_QUEST("Wanted: Lieutenant Fangore") },
          text = "Fangore. Every raid on the south shore has his fingerprints on it. The court has ruled. You carry out the sentence." },
        { id = "h_masters", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "Orcs don't plan like this. Somebody is directing them. I need proof the Regent can't ignore, and I need it before the next raid." },
        { id = "h_masters_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The True Masters"), days = 5 } },
          text = "The Highlord read it all and still won't send soldiers without more. So he sent a deputy. You. I suppose that's an answer." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "An elf from the sky. If your people could fly, I'd want a dozen on the walls. You glide, I'm told? I'll take gliders." },
      },
      choices = {
        { text = "What does Lakeshire need?", next = "need" },
        { text = "Why won't Stormwind help?", next = "stormwind" },
        { text = "I'll leave you to your letters.", next = "END" },
      },
    },
    need = {
      lines = {
        { id = "n_default", text = "A bridge that stays up. Walls that stay manned. And for once, a week where nobody comes to this office carrying someone else's blood." },
      },
      choices = {
        { text = "I'll help where I can.", next = "END", fx = { affinity = 2, align = { order = 1 }, standing = { lakeshire = 1 } } },
        { text = "That's a lot to ask.", next = "END", fx = { affinity = -1 } },
      },
    },
    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "I've asked. Every territory of the kingdom, one after another. The answers were polite. None of them were soldiers." },
        { id = "s_heard", when = { heardLine = "bolvar.t_westfall" },
          text = "The Highlord told Westfall the kingdom is stretched thin? He told me the same. Word for word, almost. Someone's writing his answers." },
      },
      choices = {
        { text = "The kingdom's failing you.", next = "END", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "Maybe the city has its reasons.", next = "reasons", fx = { opinion = { westfall = "patience" } } },
      },
    },
    reasons = {
      lines = { { id = "r_default", text = "Reasons don't man walls. Come back when you've buried someone, and tell me about reasons." } },
      choices = { { text = "...", next = "END", fx = { affinity = -1 } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "Render's Valley and Stonewatch Keep. Too many, too organized, and getting bolder." } },
    everstill_bridge = { { id = "tp_bridge", text = "Oslow says before the rains. Oslow said that last year." } },
    westfall = { { id = "tp_westfall", text = "They have it worse. I wrote anyway. Desperation makes poor manners." } },
    morganth = { { id = "tp_morganth", text = "The tower on the south shore. The gnolls there serve him. That's all I know and more than I like." } },
    _none = { { id = "tp_none", text = "If it's not a threat to Lakeshire, it can wait until there aren't any." } },
  },
}
