-- Brackenwall Village service folk: "Little" Logok (ogre innkeeper) and Shardi (wind rider master).
-- Voice: bibles/brackenwall_folk.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- "Little" Logok
---------------------------------------------------------------------------
P:NPC {
  key = "logok", id = TODO_NPC("\"Little\" Logok"), name = "\"Little\" Logok",
  title = "Innkeeper",
  bible = "bibles/brackenwall_folk.md", role = "innkeeper", tier = "service",
  communities = { "brackenwall" }, temper = { "jolly", "slow" }, values = { "food", "hearth" },
  notices = { "race", "weary" },

  impression = {
    first = "\"Little\" Logok is the biggest ogre in Brackenwall, and he keeps the inn with enormous care and very small spoons. He is proud of his stew, proud of his beds, and mildly offended by anyone who doesn't finish either.",
    third = "{name} met \"Little\" Logok, the enormous ogre who keeps the inn at Brackenwall Village.",
  },

  greetings = {
    { id = "g_hello", text = "Come in, come in! Logok has stew, and Logok has beds, and Logok only sat on one bed this week." },
    { id = "g_back", when = { metBefore = true }, text = "Small friend comes back! Logok saved you a spoon." },
    { id = "g_mok", when = { questDone = TODO_QUEST("Justice Dispensed") }, text = "Overlord is happy, so Logok is happy, so everybody gets extra stew tonight." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look like the swamp chewed you. Logok says lie down now, and Logok is bigger than you, so lie down." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Big friend! Finally somebody who fits in Logok's chairs." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Logok keeps the inn for the Stonemaul and for the Horde. Everybody calls Logok \"Little\", and Logok thinks it is very funny, and so far nobody has explained why." },
      },
      again = { { id = "h_again", text = "What else does small friend want? More stew?" } },
      choices = {
        { text = "I'd like to rest here.", next = "BUSINESS" },
        { text = "Why do they call you Little?", next = "name" },
        { text = "What's in the stew?", next = "stew" },
        { text = "How do the Stonemaul feel about the Horde?", next = "horde" },
        { text = "Farewell, Logok.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Logok thinks it is because Logok was a little ogre once, a long time ago, before the dragons came to the old village. Tharg says it is a joke, but Tharg never says what the joke is, and Tharg laughs a lot." } },
      choices = {
        { text = "It's a joke because you're huge, Logok.", next = "name_joke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_joke = {
      lines = { { id = "nj_default", text = "Oh! Oh. Logok is huge. Logok will think about this for a long time, maybe all of tonight, and then maybe Logok will laugh too." } },
      choices = {
        { text = "You've got a good laugh coming.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stew = {
      lines = { { id = "st_default", text = "Crocolisk, mostly, and some mushrooms from the bog, and a thing Ogg'marr sold Logok that he says is a goose. Logok does not ask, because Logok's mother said never ask the butcher." } },
      choices = {
        { text = "Wise words from your mother.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Rexxar brought us to the Horde, and the Horde helped when the black dragons took the old village. Some Stonemaul grumble that orcs talk too much and smash too little, but they eat Logok's stew together, so Logok says it is fine." } },
      choices = {
        { text = "Should the Stonemaul stay with the Horde?", next = "horde_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_stance = {
      big = true,
      lines = { { id = "hs_default", text = "Overlord says yes, and some young ogres say the Stonemaul should go back to the old village alone and smash the dragons themselves. Logok just cooks, but Logok listens. What does small friend think?" } },
      choices = {
        { text = "Stay with the Horde. Stronger together.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Stonemaul should stand on their own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Stew, beds, and who snores loudest in Brackenwall. That is Tharg." } },
    black_dragonflight = { { id = "tp_dragon", text = "The dragons took the old village, and Logok's old kitchen. Logok misses the kitchen most." } },
    _none = { { id = "tp_none", text = "Logok does not know that, but Logok knows stew, so have stew." } },
  },
}

---------------------------------------------------------------------------
-- Shardi
---------------------------------------------------------------------------
P:NPC {
  key = "shardi", id = TODO_NPC("Shardi"), name = "Shardi",
  title = "Wind Rider Master",
  bible = "bibles/brackenwall_folk.md", role = "flightmaster", tier = "service",
  communities = { "brackenwall" }, temper = { "dry", "tough" }, values = { "sky", "duty" },
  notices = { "race" },

  impression = {
    first = "Shardi is an orc woman with a scarred chin who keeps Brackenwall's wind riders flying through fog that would ground anyone sensible. She has opinions about the marsh, and every one of them is rude.",
    third = "{name} met Shardi, the wind rider master of Brackenwall Village.",
  },

  greetings = {
    { id = "g_hello", text = "Fog's thick today, but the riders know the way. Where to?" },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? Good. The marsh hasn't got you yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Shardi. I keep the riders at Brackenwall, and I keep them flying, which in this fog takes more nerve than most warriors ever need." },
      },
      again = { { id = "h_again", text = "Anything else? The fog's getting thicker." } },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "How do the riders fly in this fog?", next = "fog" },
        { text = "Do you ever fly near Theramore?", next = "theramore" },
        { text = "Farewell, Shardi.", next = "END" },
      },
    },
    fog = {
      lines = { { id = "fo_default", text = "By smell, mostly. The riders know the reek of Brackenwall from a mile up, and they know the Barrens smell of dust and sun, so they fly from one stink to the other." } },
      choices = {
        { text = "That's oddly reassuring.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore = {
      lines = { { id = "th_default", text = "We give it a wide berth. There's a peace, but nobody told the gryphon riders' crossbows, and I'd rather not be the one who tests it." } },
      choices = {
        { text = "Do you trust the peace?", next = "theramore_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_stance = {
      big = true,
      lines = { { id = "ts_default", text = "I trust Thrall, and Thrall trusts the human woman. Some of the grunts here say she's just buying time to build up her walls." } },
      choices = {
        { text = "Trust the Warchief. The peace is real.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The grunts are right. Be ready for her.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Winds, fog, and how far a rider can fly before it gets cranky." } },
    advice = { { id = "tp_ad", text = "Hold on tight over the marsh. If you fall, the crocolisks will be glad of you." } },
    _none = { { id = "tp_none", text = "I haven't a clue, because I spend my days up in the clouds." } },
  },
}
