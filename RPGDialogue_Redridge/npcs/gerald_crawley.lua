-- Gerald Crawley, poison supplier in Lakeshire. Voice: bibles/gerald_crawley.md
-- Sells what rogues need and says as little as possible about who buys it.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gerald_crawley", id = TODO_NPC("Gerald Crawley"), name = "Gerald Crawley",
  title = "Poison Supplies",
  bible = "bibles/gerald_crawley.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "smooth" }, values = { "discreet", "practical" },
  notices = { "stealth", "class" },

  impression = {
    first = "Gerald Crawley sells poison supplies in a lakeside town and talks about them as if they were spices. He asks no questions and expects none, which is somehow more unsettling than a threat.",
    third = "{name} met Gerald Crawley, Lakeshire's discreet supplier of poisons and their ingredients.",
  },

  greetings = {
    { id = "g_shop", text = "Looking for something particular? Speak softly; the walls here are thin." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon. Business must be good, or very bad." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I won't ask where; it's the house rule." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "They tell me you've been frightening people. Do it quietly, please; loud customers are bad for my trade." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word is you were caught in a lie. My advice is that the trick isn't telling fewer of them, it's telling them better." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can hear you breathing, you know. Come out and shop like a civilised person." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ah, a professional. You'll want the good stock, not the jars I keep on the front shelf." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gerald Crawley, supplier of certain powders and tinctures. Most of my custom comes in quietly and leaves the same way." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin in my shop. I sell nothing that's against the King's law, I'll have you know, and I'd thank you to stop looking at the jars like that." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of the trade. Everything you need for your blades is here, and I'll not ask what they're for." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, now." },
        { id = "h_again2", text = "Go on. I'm discreet, not deaf." },
      },
      choices = {
        { text = "Who buys poison in a town like this?", next = "who" },
        { text = "Isn't this trade a little dishonourable?", next = "honour" },
        { text = "What do you use against orcs?", next = "orcs", when = { class = "ROGUE" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Rogues, mostly, and the odd hunter with a gnoll problem. Some of the guards, though they'd never say so, because orcs don't fight fair either." },
      },
      choices = {
        { text = "The guards buy from you?", next = "who_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_guards = {
      lines = { { id = "wg_default", text = "I never said that, and if anyone asks, you never heard it. Let's say a blade that bites twice saves a life now and then." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
    honour = {
      big = true,
      lines = { { id = "h2_default", text = "Honour is a fine thing to carry into a fight, and a heavy thing to carry out of one. The Blackrock don't care how you kill them, and neither do the widows of the men they killed." },
      },
      choices = {
        { text = "A fair fight still matters, even against orcs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Win first. Worry about honour afterward.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "Something slow, for the big ones, so they tire before you do. An orc in a rage will fight through anything quick, but nothing fights through tiredness forever." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell what I sell, and I've no story worth telling you." } },
    advice = { { id = "tp_ad", text = "Always wipe your blade before you sheathe it. You'd be surprised how many lose a finger to that." } },
    _none = { { id = "tp_none", text = "I don't know, and if I did I'd charge you for it." } },
  },
}
