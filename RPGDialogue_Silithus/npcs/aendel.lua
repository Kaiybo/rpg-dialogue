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
    first = "She came back as a ghost to teach the living her craft.",
    third = "{name} met Aendel Windspear, the ghost of a famous Southwind leatherworker who returned to pass on her craft.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "My friend returns, and not a beetle among you! Come up, and I'll find you a chair that has all its legs." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Mind the broken stair. Say what you need, and let me get back to my work before the light goes." },
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
        { text = "Something terrible happened to Southwind, I think.", next = "southwind" },
        { text = "What do you work with now?", next = "chitin" },
        { text = "Will you teach me your craft?", next = "teach", when = { profession = "Leatherworking" } },
        { text = "Let me see your patterns.", next = "BUSINESS" },
        { text = "Rest well, Aendel.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because every craft dies a little with each crafter, and I had too much left in my hands to let it go. Elune allowed it, or at least did not forbid it, and here I am." } },
      choices = {
        { text = "It must be lonely out here.", next = "why_lonely" },
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
        { text = "I understand. Something else, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Does anyone try to free the dead here?", next = "southwind_layo" },
      },
    },
    southwind_layo = {
      lines = { { id = "sl_default", text = "Layo Starstrike, the young druid from Valor's Rest, tries to. He is kind, and he means well, and some of them go gladly with him. I am not ready to go, and he has the grace not to insist." } },
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
        { text = "Take back what you can. They owe you that.", next = "BACK", reply = "They owe Southwind a great deal more than hides, little one, but I take no joy in the taking, and you would not either if you had seen what I saw.", fx = { align = { light = -1 } } },
        { text = "Even craft shouldn't carry vengeance. Let it rest, Aendel.", next = "BACK", reply = "You speak gently, and the Earth Mother would agree with you, but my hands remember the village even when my heart tries to forget.", fx = { align = { light = 1 } } },
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
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives grow like tumors on the desert, and the chitin they shed is the finest hide I have ever worked. I wish it came from a gentler beast." } },
    elune = { { id = "tp_elune", text = "I died with Elune's name on my lips, a long time ago, and she let me come back to teach. I do not question a gift like that." } },
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "I saw the walls of Ahn'Qiraj from a distance, in life, when the Shifting Sands war was young. I was a craftswoman, not a soldier, and I made armor for those who went closer." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande was High Priestess even in my day, and she will be High Priestess long after mine. Some lights do not go out." } },
    _none = { { id = "tp_none", text = "That was not in the world when I lived, or not in my corner of it." } },
  },
}
