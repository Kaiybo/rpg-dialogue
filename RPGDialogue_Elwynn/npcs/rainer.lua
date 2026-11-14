-- Deputy Rainer, at the gate of Westbrook Garrison. Voice: bibles/rainer.md
-- Asked for soldiers; got adventurers. Makes the best of it, loudly.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rainer", id = TODO_NPC("Deputy Rainer"), name = "Deputy Rainer",
  bible = "bibles/rainer.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "lawful", "brave" },
  notices = { "trophy", "kit" },

  greetings = {
    { id = "g_gate", text = "Westbrook Garrison. What there is of it." },
    { id = "g_help", when = { questActive = TODO_QUEST("Westbrook Garrison Needs Help!") }, text = "Dughan sent you? Good. I asked for a squad. You'll do." },
    { id = "g_bounty", when = { questActive = TODO_QUEST("Riverpaw Gnoll Bounty") }, text = "Proof off the gnolls. Bring me a fistful." },
  },

  notice = {
    { id = "n_hogger", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("WANTED: \"Hogger\"") },
      text = "Is that- that's Hogger's claw. Hogger's! Dughan's going to have to sit down when he sees that." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Gnolls got their teeth into you, I see. They go for the gaps in the armor. Close the gaps." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deputy Rainer. Westbrook's the last post before Westfall, and the kingdom's sent most of its soldiers abroad. I've got what's left." },
        { id = "h_bounty", tags = { "news" }, when = { questRecent = { TODO_QUEST("Riverpaw Gnoll Bounty"), days = 3 } },
          text = "Fewer gnolls on the west road this week. My lads are even walking patrols in pairs instead of fives. Progress." },
        { id = "h_hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "See the notice? Hogger. Big gnoll, bigger appetite. The Army wants him dead. So does everybody he's ever looked at." },
        { id = "h_gryan", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Westfall's worse than here, believe it or not. Gryan Stoutmantle's holding Sentinel Hill with farmers. Go. Tell him Westbrook sends what it can, which is you." },
        { id = "h_raelen", when = { heardLine = "raelen.h_rainer" },
          text = "Raelen said that? She sent word about bears near Eastvale. Eastvale! I'm at the other end of the forest. Somebody tell her where Westbrook is." },
      },
      choices = {
        { text = "Why so few soldiers?", next = "soldiers" },
        { text = "I'll help hold the road.", next = "END", fx = { affinity = 1, standing = { goldshire = 1 } } },
        { text = "Good luck, deputy.", next = "END" },
      },
    },
    soldiers = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the court decides where the Army goes, and the court doesn't live in Elwynn. So I write to the Marshal, and the Marshal sends adventurers, and here we are.",
          fx = { hear = "stormwind_abandoned_westfall" } },
      },
      choices = {
        { text = "The court should come and see.", next = "END", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "Adventurers are doing fine.", next = "fine", fx = { trait = { brave = 1 } } },
      },
    },
    fine = {
      lines = { { id = "f_default", text = "You are. That's what worries me. If you're good enough, they'll never send soldiers." } },
      choices = { { text = "Ha.", next = "END" } },
    },
  },

  topics = {
    hogger = { { id = "tp_hogger", text = "South-west, in the hills. You'll know him. He'll know you first." } },
    defias = { { id = "tp_defias", text = "Coming up from Westfall like rats from a flood. We hold the road. Mostly." } },
    westfall = { { id = "tp_westfall", text = "Next door, and worse off. Stoutmantle's doing the Army's job with pitchforks." } },
    _none = { { id = "tp_none", text = "Not on the west road, not my problem. Try Dughan." } },
  },
}
