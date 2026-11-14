-- Verner Osgood, Lakeshire's blacksmith. Voice: bibles/verner.md
-- All his iron goes to the Guard; the gnolls take his horses.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "verner", id = TODO_NPC("Verner Osgood"), name = "Verner Osgood",
  bible = "bibles/verner.md", role = "blacksmith", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "honest", "stern" },
  notices = { "kit", "mount" },

  greetings = {
    { id = "g_forge", text = "Forge is hot. Make it quick or make it useful." },
    { id = "g_shoes", when = { questActive = TODO_QUEST("The Price of Shoes") }, text = "Argus get my note? He'll grumble. He always grumbles." },
    { id = "g_yowler", when = { questDone = TODO_QUEST("Howling in the Hills") }, text = "Haven't heard a howl in a week. My horses are sleeping. So am I." },
  },

  notice = {
    { id = "n_shoes", cat = "mount", when = { mounted = true },
      text = "Hold that animal still. Front left shoe's loose. I can hear it from here. No, I haven't got iron for it. That's rather the point." },
    { id = "n_kit", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "You're coming apart at every rivet. The Guard gets my iron first, by order, but I can at least tell you what's wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Osgood. Smith. The Guard takes every scrap of iron I've got and I'm meant to shoe the town's horses with what's left. What's left is nothing." },
        { id = "h_shoes", when = { questBefore = TODO_QUEST("The Price of Shoes") },
          text = "Smith Argus in Goldshire owes me, and he's got iron. If someone carried a note down to him, I might see horseshoes this side of winter." },
        { id = "h_shoes_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Price of Shoes") },
          text = "Goldshire, the smithy. Hand him the note and stand there till he reads it, or he'll use it to light the forge." },
        { id = "h_return", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Verner"), days = 3 } },
          text = "Shoes! Real shoes, from real iron. He came through. Don't tell him I said so; he'll be unbearable." },
        { id = "h_gnolls", when = { questBefore = TODO_QUEST("A Baying of Gnolls") },
          text = "The gnolls up in the hills take any horse that wanders. Then they eat it. I've stopped naming the foals." },
        { id = "h_yowler", when = { questActive = TODO_QUEST("Howling in the Hills") },
          text = "Yowler. Big one, leads the pack. Bring me proof he's done and I'll sleep through the night for the first time since spring." },
        { id = "h_argus", when = { heardLine = "argus.s_default" },
          text = "Argus told you never to let the apprentice near the quench? He learned that from me. He won't admit it." },
        { id = "h_horse", when = { metBefore = true }, text = "Shod a grey mare this morning. Best-tempered beast in Lakeshire. Better company than most of the people. Don't tell Argus I said anything nice about anything." },
      },
      choices = {
        { text = "Let's see what you've got.", next = "BUSINESS" },
        { text = "How do you know Argus?", next = "argus" },
        { text = "Good luck with the horses.", next = "END" },
      },
    },
    argus = {
      lines = {
        { id = "a_default", text = "We go back. Long enough to have argued about everything twice. He's quicker. I'm better. We've never settled which matters." },
      },
      choices = { { text = "Which is it?", next = "which" } },
    },
    which = {
      lines = { { id = "wh_default", text = "Better. Obviously. Ask Argus and he'll say quicker, and he'll say it faster than I just did. That's his whole trouble." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    redridge_gnolls = { { id = "tp_gnolls", text = "Horse thieves with fur. Yowler leads them. Leads them right into my paddock." } },
    blackrock = { { id = "tp_blackrock", text = "They've got good steel, and I'd love to know where they get it. Not from me." } },
    everstill_bridge = { { id = "tp_bridge", text = "Oslow keeps asking for nails. I keep asking for iron. We stare at each other." } },
    _none = { { id = "tp_none", text = "Can you shoe it? No? Then I can't help you." } },
  },
}
