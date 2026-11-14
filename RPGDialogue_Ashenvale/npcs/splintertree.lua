-- Splintertree Post (Horde). Voice: bibles/ashenvale.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "senani", id = TODO_NPC("Senani Thunderheart"), name = "Senani Thunderheart",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "reflective" }, values = { "reverent", "kind" },
  notices = { "pet", "class" },

  greetings = {
    { id = "g_forest", text = "This forest. Truly look at it. Whatever happens tomorrow, it was beautiful today." },
    { id = "g_back", when = { metBefore = true }, text = "In one piece still. The Hunt hasn't eaten you yet. Good." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you'll understand the Hunt isn't killing. It's knowing a beast well enough to earn the right." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your companion walks proudly. Treat it well. The forest is watching how we treat its children." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senani Thunderheart. I came from Thunder Bluff to hunt, and stayed because this forest is the most beautiful thing I've ever seen. That we're at war in it is a sorrow I carry." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("The Ashenvale Hunt") },
          text = "Three great beasts walk this forest: Ursangous the bear, Shadumbra the nightsaber, Sharptalon the hippogryph. The bear is the gentlest test, the cat the quickest. The bird will try to kill you." },
        { id = "h_bear", when = { questActive = TODO_QUEST("Ursangous's Paw") },
          text = "Ursangous. Old, strong, and slow to anger. Honour him with a clean kill. He deserves that much." },
        { id = "h_cat", when = { questActive = TODO_QUEST("Shadumbra's Head") },
          text = "Shadumbra. You won't see her until she wants you to. Listen more than you look." },
        { id = "h_bird", tags = { "news" }, when = { questActive = TODO_QUEST("Sharptalon's Claw") },
          text = "Sharptalon. Proud, fierce, and the most dangerous of the three. Bring friends. That's not shameful. It's wise." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Hunt Completed") },
          text = "All three. The forest knows your name now, hunter. Carry it gently." },
      },
      choices = {
        { text = "Why hunt them, if you love the forest?", next = "why" },
        { text = "I'll take on the Hunt.", next = "END", fx = { affinity = 1 } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because loving a forest means knowing all of it, teeth included. The beasts don't hate us. They test us. I'd rather we passed." },
      },
      choices = { { text = "That's a good way to see it.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The druids would weep to see this war. Some of them do. I've met a few, under the trees, where neither side was looking." } },
    _none = { { id = "tp_none", text = "I don't know. But walk out under those trees a while. You might find out." } },
  },
}

P:NPC {
  key = "mastok", id = TODO_NPC("Mastok Wrilehiss"), name = "Mastok Wrilehiss",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "gruff" }, values = { "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_gruff", text = "What. I'm counting wagons. Speak fast or speak elsewhere." },
    { id = "g_back", when = { metBefore = true }, text = "Fine. You're one of the few who doesn't waste my time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like a wagon the elves got to. Get mended. I can't count you if you're dead." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mastok. I track every caravan in and out of Splintertree. People are trouble. Wagons are just wagons. I prefer wagons." },
        { id = "h_element", tags = { "news" }, when = { questActive = TODO_QUEST("The Befouled Element") },
          text = "Something foul's stirring the water and earth out there. Even I can feel it. Deal with it before it gets into the supplies." },
        { id = "h_standstill", when = { questActive = TODO_QUEST("Stonetalon Standstill") },
          text = "Trouble on the Stonetalon side, and nothing's getting through. Deal with it, and things start moving again." },
      },
      choices = {
        { text = "Why don't you like people?", next = "people" },
        { text = "Fine. Bye.", next = "END" },
      },
    },
    people = {
      lines = { { id = "p_default", text = "People ask questions. Like that one. Wagons never ask anything. Go away now." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a wagon. Not my problem." } },
  },
}

P:NPC {
  key = "kuraybin", id = TODO_NPC("Kuray'bin"), name = "Kuray'bin",
  bible = "bibles/ashenvale.md", role = "soldier", tier = "quest",
  communities = { "splintertree" }, temper = { "wary" }, values = { "loyal", "cunning" },
  notices = { "stealth", "race" },

  greetings = {
    { id = "g_wary", text = "Easy, mon. Eyes open, back to the wall. That's how we live in these woods." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "A shadow-walker. Good. We need folk who can see the elves before the elves see us." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Good to see a cousin this far from the Echo Isles. The forest be strange to us, but we be stranger to it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kuray'bin. I watch the paths into Splintertree. The night elves send runners through the trees, quick and quiet. I make sure they don't get home." },
        { id = "h_outrunners", tags = { "news" }, when = { questActive = TODO_QUEST("Ashenvale Outrunners") },
          text = "Silverwing outrunners, sneaking through our ground. They see our numbers, they tell their captains, the captains come. Stop them before they get home." },
      },
      choices = {
        { text = "How bad is the fighting?", next = "fighting" },
        { text = "Stay sharp.", next = "END" },
      },
    },
    fighting = {
      big = true,
      lines = {
        { id = "f_default", text = "The elves think every tree we cut be a murder. We think we need the wood to live. Both of us be right a little. That never stopped a war, mon." },
      },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, mon. Ask the shamans." } },
  },
}
