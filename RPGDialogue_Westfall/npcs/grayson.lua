-- Captain Grayson, the ghost of Westfall Lighthouse. Voice: bibles/grayson.md
-- A pirate whose ship struck the coast the night the lamp went dark.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "grayson", id = TODO_NPC("Captain Grayson"), name = "Captain Grayson",
  bible = "bibles/grayson.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "steady" }, values = { "honest", "kind" },
  spiritSensitive = true,
  notices = { "death", "sea" },

  greetings = {
    { id = "g_flame", text = "Keep clear of the lamp. It's the only thing here still alive, in its way." },
    { id = "g_murkeye", when = { questActive = TODO_QUEST("The Coastal Menace") }, text = "Murk-Eye still breathes. I can feel it in the tide." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Coastal Menace") }, text = "The beach is quiet. Quiet enough that I can hear the gulls again." },
  },

  notice = {
    { id = "n_ghost", cat = "death", place = "replace", when = { ghost = true },
      text = "Ha! Another one of us. Don't get comfortable; your body's waiting and it won't wait forever. Mine didn't." },
    { id = "n_undead", cat = "death", when = { race = "Scourge" },
      text = "Dead, but walking about in your own skin. Lucky. Mine's somewhere at the bottom of this bay." },
    { id = "n_fish", cat = "sea", when = { profession = "Fishing" },
      text = "A fisher. Then you know the sea keeps what it takes. Respect it and it might give a little back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Grayson. Of a ship that isn't, from a crew that aren't. I mean no harm to your kind. I mean only to keep this flame lit." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Keeper of the Flame") },
          text = "The night my ship came in, this lamp was dark. We hit the rocks. I'd not wish that on any captain, honest or otherwise." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("Keeper of the Flame") },
          text = "The flame needs feeding. I can't lift so much as a candle. You can." },
        { id = "h_coast", when = { questActive = TODO_QUEST("The Coast Isn't Clear") },
          text = "The murlocs on the shore grow bolder every tide. Thin them, and the next keeper might live to see old age." },
        { id = "h_menace", tags = { "news" }, when = { questActive = TODO_QUEST("The Coastal Menace") },
          text = "Old Murk-Eye. He drove the keeper's family off once. They came back and lit the lamp. He came back too. I watched. I couldn't do a thing." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Coastal Menace"), days = 3 } },
          text = "He's gone. I felt it. The family's beyond thanking you, so I'll do it for them. Thank you." },
        { id = "h_pirate", when = { class = "ROGUE" },
          text = "You've a pirate's way of standing. Weight on the balls of the feet, one hand near the knife. I'd have signed you on." },
      },
      choices = {
        { text = "Why do you stay?", next = "stay" },
        { text = "Were you really a pirate?", next = "pirate" },
        { text = "Rest easy, captain.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = {
        { id = "s_default", text = "Because a dark lamp killed my crew, and a dark lamp killed that family. If keeping it lit is the only good I do, dead, it'll be enough." },
      },
      choices = {
        { text = "That's a noble penance.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "You don't owe anyone anything now.", next = "owe", fx = { trait = { kind = 1 } } },
      },
    },
    owe = {
      lines = { { id = "o_default", text = "Maybe not. But I've nothing else to do, and the gulls are poor conversation." } },
      choices = { { text = "I'll visit, then.", next = "END", fx = { affinity = 1 } } },
    },
    pirate = {
      lines = { { id = "p_default", text = "A pirate, a privateer, a merchant with flexible morals. Depends who you asked and what they'd lost." } },
      choices = { { text = "Ha. Fair.", next = "END", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "I've seen their ships slip along this coast at night. Running dark. I know the trick; I used it." } },
    westfall = { { id = "tp_westfall", text = "From up here it looks peaceful. That's the trouble with lighthouses. Everything looks peaceful from a height." } },
    _none = { { id = "tp_none", text = "The dead hear less than you'd think. Mostly waves." } },
  },
}
