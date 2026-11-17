-- Aendel Windspear, ghostly leatherworker upstairs in the ruins of Southwind (0.72.0). Voice: bibles/aendel.md
-- A famous artisan in life, she chose to come back to teach; she has learned new tricks with chitin since dying.
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "aendel", id = TODO_NPC("Aendel Windspear"), name = "Aendel Windspear",
  bible = "bibles/aendel.md", role = "vendor", tier = "service",
  temper = { "serene", "precise" }, values = { "craft", "patient" },
  notices = { "craft", "death" },
  impression = {
    first = "Aendel Windspear was a famous leatherworker of Southwind centuries ago, and she came back as a ghost to teach the living what she knows. She is gentle and exacting, and she talks about silithid chitin like a fine hide.",
    third = "{name} met Aendel Windspear, the ghost of a famous Southwind leatherworker who returned to pass on her craft.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor who isn't a beetle. Come up, and mind the broken stair; I no longer need it, but you do." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and willingly. The living so rarely visit twice." },
    { id = "g_circle", when = { reputation = { faction = "Cenarion Circle", min = "honored" } }, text = "The Circle speaks well of you, even to the dead. Come, I have something worth your hands." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have a leatherworker's hands, I can see the calluses from here. Sit; I've waited a long time for someone like you." },
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "You've been where I am, not long ago, and come back from it. It's colder there than they tell you, isn't it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aendel Windspear. When I lived, people came to Southwind from far away for my work, and when I died, I found I had not finished teaching, so I chose to come back." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of my people, after so long. Do they still tan with oak bark in Ashenvale, or has that been forgotten too?" },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! Your people's hide-work was the only rival to ours, in my day, and I will not tell you which I thought better." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have nothing but time." },
        { id = "h_again2", text = "Ask, then. The dead are good listeners and better talkers." },
      },
      choices = {
        { text = "Why did you come back?", next = "why" },
        { text = "What happened to Southwind?", next = "southwind" },
        { text = "Silithid chitin, for leather?", next = "chitin" },
        { text = "Will you teach me your craft?", next = "teach", when = { profession = "Leatherworking" } },
        { text = "Let me see your patterns.", next = "BUSINESS" },
        { text = "Rest well, Aendel.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because every craft dies a little with each crafter, and I had too much left in my hands to let it go. Elune allowed it, or at least did not forbid it, and here I am." } },
      choices = {
        { text = "Is it lonely?", next = "why_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_lonely = {
      lines = { { id = "wl_default", text = "Less than you would think. The druids of the Hold come sometimes, and a scout or two, and the dead of Southwind are restless company, but company all the same." } },
      choices = { { text = "I'll visit when I can.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    southwind = {
      lines = { { id = "s_default", text = "It was a fine village, a watch post of our people at the edge of the sands, and the hives overran it. I do not speak of how it ended, and I would ask you not to ask the others either." } },
      choices = {
        { text = "I understand. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Layo Starstrike frees the dead here.", next = "southwind_layo" },
      },
    },
    southwind_layo = {
      lines = { { id = "sl_default", text = "The young druid from Valor's Rest. He is kind, and he means well, and some of them go gladly with him. I am not ready to go, and he has the grace not to insist." } },
      choices = { { text = "Something else, Aendel.", next = "BACK" } },
    },
    chitin = {
      lines = { { id = "c_default", text = "I have had a long time to watch the silithid, and much of their deadliness is in their shells: light and very strong. Worked properly, it sits on leather like a second hide, and the creatures would hate to know it." } },
      choices = {
        { text = "Wearing the enemy's shell seems wrong.", next = "chitin_stance" },
        { text = "How do you work it?", next = "chitin_stance" },
      },
    },
    chitin_stance = {
      big = true,
      lines = { { id = "cs_default", text = "Slowly, with patience the living rarely have, and with the reverence you would give any hide. The beasts of this land took everything from Southwind, and I take a little back, stitch by stitch." } },
      choices = {
        { text = "Take back what you can. They owe you that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Vengeance even in craft? Let it rest, Aendel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Gladly, if the Circle trusts you, for they guard my patterns as jealously as I once did. Earn their friendship, and my work is yours to learn." } },
      choices = { { text = "I'll earn it.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A leatherworker of Southwind, famous once, dead a long while, and not finished yet." } },
    advice = { { id = "tp_ad", text = "Never hurry a hide. The hide remembers, and so does whoever wears it." } },
    southwind = { { id = "tp_sw", text = "My home. Speak of it gently, if you speak of it at all." } },
    _none = { { id = "tp_none", text = "That was not in the world when I lived, or not in my corner of it." } },
  },
}
