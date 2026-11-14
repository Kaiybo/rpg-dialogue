-- Brother Wilhelm, Paladin Trainer, Goldshire. Voice: bibles/wilhelm.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wilhelm", id = TODO_NPC("Brother Wilhelm"), name = "Brother Wilhelm", title = "Paladin Trainer",
  bible = "bibles/wilhelm.md", role = "trainer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "pious", "kind", "honest" },
  spiritSensitive = true,
  notices = { "kit", "affliction" },

  greetings = {
    { id = "g_default", text = "Brother Wilhelm. Mind the forge smoke, it gets everywhere." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Back for more? Good. Sit, if you can find a dry spot." },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "Lost? The smith's round the front. I only mend souls, and slowly." },
    { id = "g_rall", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tome of Divinity"), days = 3 } },
      text = "Well? Did Rall frighten you? He frightens everyone. It's a kindness, mostly." },
  },

  notice = {
    { id = "n_dented", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "Your plate's half off you. A paladin who can't stand up can't protect anyone. Smith first, then me." },
    { id = "n_shining", cat = "kit", when = { class = "PALADIN", durability = { min = 0.95 } },
      text = "Polished. Every buckle. Somebody at the Abbey taught you right." },
    { id = "n_sick", cat = "affliction", place = "before", when = { debuffType = { "Disease", "Poison" } },
      text = "You've picked something up out there. Hold still. A paladin learns to cleanse that soon enough, and not soon enough for you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I teach the paladins who come through Goldshire. Most of them stand a little straighter when they leave. Some only limp less." },
        { id = "h_new", when = { class = "PALADIN", maxLevel = 9 },
          text = "Fresh down from the Abbey. Brother Sammuel gives you the oath; I teach you what it weighs." },
        { id = "h_tome_before", when = { class = "PALADIN", questBefore = TODO_QUEST("Tome of Divinity") },
          text = "Duthorian Rall keeps the Tome of Divinity at the Cathedral. One day soon he'll want to see what you're made of. I'll tell you when." },
        { id = "h_tome_active", tags = { "news" }, when = { questActive = TODO_QUEST("Tome of Divinity") },
          text = "Rall's in the Cathedral of Light, in the city. Go. He's said kind things about you, and he doesn't say many." },
        { id = "h_tome_done", when = { questDone = TODO_QUEST("Tome of Divinity") },
          text = "So the Cathedral's seen you. Whatever you're set to, do it properly. Rall always finds out, and so does the Light." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "This far from the mountain? Ironforge must be running out of anvils to pray at." },
        { id = "h_outgrown", when = { class = "PALADIN", minLevel = 20 },
          text = "You've outgrown my little patch behind the smithy. The Cathedral has teachers who forgot more than I'll learn. Still. Come by." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "Something in you has gone quiet. The kind of quiet people get when they stop arguing with their conscience." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "I hear things, here behind the forge. Not all of them about you were kind. Tell me they were wrong." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What is the Tome of Divinity?", next = "tome" },
        { text = "What's the hardest part of the oath?", next = "oath" },
        { text = "Another time, Brother.", next = "END" },
      },
    },
    tome = {
      lines = {
        { id = "t_default", key = true,
          text = "A book the Abbey's clerics kept, long before me. Ogres carried it off in the First War, down into the Deadmines. Even Lothar went after it and needed rescuing." },
      },
      choices = {
        { text = "But it came back.", next = "tome2" },
        { text = "Ogres reading. That's a thought.", next = "END", fx = { trait = { witty = 1 } } },
      },
    },
    tome2 = {
      lines = {
        { id = "t2_default", text = "It came back. Now the paladins of the Silver Hand learn from it, in Stormwind and Ironforge. Every page of it was paid for by someone." },
        { id = "t2_paladin", when = { class = "PALADIN" },
          text = "It came back, and you'll read it, if Rall judges you ready. Read it like it cost something. It did." },
      },
      choices = {
        { text = "I'll remember that.", next = "END", fx = { learn = { "tome_of_divinity" }, affinity = 1 } },
        { text = "What's the hardest part of the oath?", next = "oath" },
      },
    },
    oath = {
      big = true,
      lines = {
        { id = "o_default", text = "Mercy. Anyone can be brave in a crowd. Being patient with someone who's wronged you, alone, with nobody watching. That's the hard part." },
        { id = "o_squire", when = { origin = "human_paladin_squire" },
          text = "You squired for the Silver Hand. You've seen good knights forget mercy. Don't think it can't happen to you. It's how it always happens." },
      },
      choices = {
        { text = "Then I'll practise mercy.", next = "END", fx = { align = { light = 2 }, trait = { kind = 1 }, affinity = 1 } },
        { text = "Some people don't deserve it.", next = "deserve", fx = { trait = { stern = 1 } } },
      },
    },
    deserve = {
      lines = {
        { id = "d_default", text = "No. That's rather the point of it. If they deserved it, it would just be fairness." },
      },
      choices = {
        { text = "I hadn't thought of it like that.", next = "END", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fairness suits me fine.", next = "END", fx = { align = { order = 1 } } },
      },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "The Abbey's book. Rall keeps it now. Ask him, and be ready for homework." } },
    defias = { { id = "tp_defias", text = "Some of them were honest men, once. I pray for those. I watch the rest." } },
    hogger = { { id = "tp_hogger", text = "I don't pray for Hogger. I have limits, and he found them." } },
    lions_pride = { { id = "tp_inn", text = "Farley pours a fair cup. I've been known to sit in the corner and pretend I'm not listening." } },
    northshire_abbey = { { id = "tp_abbey", text = "Brother Sammuel's floor. Worn smooth where every one of us has knelt." } },
    _none = { { id = "tp_none", text = "I'm a trainer behind a smithy, friend. That's beyond my little patch." } },
  },
}
