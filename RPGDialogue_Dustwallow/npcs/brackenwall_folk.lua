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
    { id = "g_mok", when = { questDone = TODO_QUEST("Justice Dispensed") }, text = "Overlord Mok'Morokk is happy, so Logok is happy, so everybody gets extra stew tonight." },
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
        { id = "h_dd_spies", tags = { "news" }, when = { questDone = TODO_QUEST("Theramore Spies") }, text = "Nazeer says you find the little Theramore spies on the islands and squash them. Logok is glad, because they watch Logok's inn and never once buy stew." },
      },
      again = { { id = "h_again", text = "What else does small friend want? More stew?" } },
      choices = {
        { text = "I'd like to rest here.", next = "BUSINESS" },
        { text = "Why do they call you Little?", next = "name" },
        { text = "What's in the stew?", next = "stew" },
        { text = "How do the Stonemaul feel about the Horde?", next = "horde" },
        { text = "The Theramore spies were watching your inn, Logok?", next = "dd_spies", when = { questDone = TODO_QUEST("Theramore Spies") } },
        { text = "Farewell, Logok.", next = "END" },
      },
    },
    dd_spies = {
      lines = {
        { id = "dd_spies_1", text = "Watching everything, Nazeer says, the ogres and the orcs and the wyverns, and counting with little sticks. Logok thinks counting is rude when you don't buy anything, so Logok is happy you made them stop." },
      },
      choices = {
        { text = "Spies deserve what they get. I'd do it again.", next = "BACK", reply = "Good! Logok will tell the Stonemaul you are a friend, and the Stonemaul like friends who squash things.", fx = { align = { honor = -1 } } },
        { text = "They were only soldiers doing their job, Logok.", next = "BACK", reply = "Hmm. Logok does a job too, and Logok does not sneak. But Logok will think about it while the stew cooks.", fx = { align = { honor = 1 } } },
        { text = "Something else, Logok.", next = "BACK" },
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
      lines = { { id = "st_default", text = "Crocolisk, mostly, and some mushrooms from the bog, and a thing Ogg'marr the butcher sold Logok that he says is a goose. Logok does not ask, because Logok's mother said never ask the butcher." } },
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
        { text = "Stay with the Horde. Stronger together.", next = "BACK", reply = "Logok thinks so too, because Horde brings meat and Logok cooks it. Overlord will be glad small friend says so.", fx = { align = { order = 1 } } },
        { text = "The Stonemaul should stand on their own.", next = "BACK", reply = "Young ogres would like small friend very much, Logok thinks. But dragons are big, and Logok would rather cook for many than bury a few.", fx = { align = { order = -1 } } },
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
    first = "Shardi is an orc woman with a scarred chin who keeps Brackenwall's wind riders flying through fog that would ground anyone sensible. She has opinions about the marsh, and not one of them is polite.",
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
        { id = "h_dd_drown", when = { deathCause = "drowning" }, text = "You've drowned in the marsh, I'd bet, because you've still got that bog water in your ears. The riders fly over it for a reason, so let them, and save your lungs for shouting." },
      },
      again = { { id = "h_again", text = "Anything else? The fog's getting thicker." } },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "How do the riders fly in this fog?", next = "fog" },
        { text = "Do you ever fly near Theramore?", next = "theramore" },
        { text = "What do you think of the marsh?", next = "marsh" },
        { text = "That scar on your chin looks like a bite.", next = "scar" },
        { text = "Lok'tar, Shardi. Who taught you to handle riders?", next = "orc", when = { race = "Orc" } },
        { text = "How do your riders take to beasts like mine?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the riders mind carrying a tauren?", next = "tauren", when = { race = "Tauren" } },
        { text = "Farewell, Shardi.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "ma_default", text = "It's wet, it stinks, it bites, and it grows things that bite back, and that's the nice half. The other half belongs to the black dragons in the Wyrmbog, and my riders won't fly south of the Stonemaul ruins for any amount of gold." } },
      choices = {
        { text = "What happened at the Stonemaul ruins?", next = "ma_ruins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ma_ruins = {
      lines = { { id = "mar_default", text = "Dragons. The ogres had a proper village there until the blacks came down and burned it, and the Stonemaul that lived came north and threw in with us. Ask Logok sometime, though he tells it like it was weather." } },
      choices = {
        { text = "Who leads the black dragons down there?", next = "ma_dragons" },
        { text = "Something else.", next = "BACK", fx = { learn = { "stonemaul" } } },
      },
    },
    ma_dragons = {
      lines = { { id = "mad_default", text = "The grunts say a great black broodmother sits in a lair beyond the Wyrmbog, and Mok'Morokk won't say her name aloud. I've seen her whelps from the air, and that's as close as any rider of mine will ever get." } },
      choices = {
        { text = "Someone should go in and kill her.", next = "BACK", fx = { trait = { brave = 1 } },
          reply = "Someone should. Write to me after, if you still have hands." },
        { text = "Something else.", next = "BACK", fx = { learn = { "black_dragonflight" } } },
      },
    },
    scar = {
      lines = { { id = "sc_default", text = "It is a bite, and you've a good eye. A young rider took me for supper the first week I had the roost, and I let him know who was supper and who wasn't, and we've been friends ever since." } },
      choices = {
        { text = "You kept the rider that bit you?", next = "sc_rider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sc_rider = {
      lines = { { id = "scr_default", text = "Kept him, and he's the best flier in the roost now. A rider that bites once has spirit, and a rider that bites twice goes back to the Barrens, so he learned quickly, and so did I." } },
      choices = {
        { text = "Spirit is worth a scar. Strength earns loyalty.", next = "BACK", fx = { align = { honor = 1 } },
          reply = "That's the orc way, and the wind rider way too. Good." },
        { text = "I'd have put him down. A beast that bites can't be trusted.", next = "BACK", fx = { align = { honor = -1 } },
          reply = "Then you'd have a dead rider and no friend, and I'd have a lot less to tell you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "or_default", text = "Lok'tar, {class}. An old Warsong rider at Crossroads taught me, back when the Horde first came to Kalimdor and nobody knew if the riders would take orcs on their backs. They did, after a few bites, and here I am." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "They tolerate a pet if it rides still and doesn't eat anything on the way. Keep {pet} calm over the marsh, hunter, because a rider who smells a crocolisk below will want to go down and have a look." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "They grumble, and I don't blame them, but they carry you all the same. Your folk lend us the riders in the first place, so I'd never turn a tauren away from my roost." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fog = {
      lines = { { id = "fo_default", text = "By smell, mostly. The riders know the reek of Brackenwall from a mile up, and they know the Barrens smell of dust and sun, so they fly from one stink to the other." } },
      choices = {
        { text = "That's oddly reassuring.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore = {
      lines = { { id = "th_default", text = "We give it a wide berth. There's a peace, but nobody told the gryphon riders' crossbows, and I won't be the one who tests it." } },
      choices = {
        { text = "Do you trust the peace?", next = "theramore_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_stance = {
      big = true,
      lines = { { id = "ts_default", text = "I trust Thrall, and Thrall trusts the human woman. Some of the grunts here say she's just buying time to build up her walls." } },
      choices = {
        { text = "Trust the Warchief. The peace is real.", next = "BACK", reply = "Then I'll hold my tongue at the fire, though it won't be easy. Thrall's never led us wrong yet, and I'd sooner be wrong trusting him than right doubting him.", fx = { align = { light = 1 } } },
        { text = "The grunts are right. Be ready for her.", next = "BACK", reply = "I keep my axe by my bunk either way, so nobody needs tell me twice. If she means it, it costs me nothing, and if she doesn't, I'm ready.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Winds, fog, and how far a rider can fly before it gets cranky." } },
    advice = { { id = "tp_ad", text = "Hold on tight over the marsh. If you fall, the crocolisks will be glad of you." } },
    stonemaul = { { id = "tp_stonemaul", text = "Big, slow and loyal, once the dragons burned them out and they came north to us." } },
    black_dragonflight = { { id = "tp_black", text = "They own the Wyrmbog. My riders won't go south of the Stonemaul ruins." } },
    theramore = { { id = "tp_theramore", text = "We give it a wide berth. The gryphon riders' crossbows didn't hear about the peace." } },
    _none = { { id = "tp_none", text = "I haven't a clue, because I spend my days up in the clouds." } },
  },
}
