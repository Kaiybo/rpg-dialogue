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
    first = "He keeps his inn with enormous care and very small spoons.",
    third = "{name} met \"Little\" Logok, the enormous ogre who keeps the inn at Brackenwall Village.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Friend! Logok saved the best bed for you, and Logok did not sit on it, not even once." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Logok has stew and beds. You pay first, and you do not break anything." },
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
        { text = "The Stonemaul and the Horde are stronger together.", next = "BACK", reply = "Yes! Logok says the same. More friends, more stew.", fx = { align = { order = 1 } } },
        { text = "The Stonemaul should go back to their own ways.", next = "BACK", reply = "Logok does not like that talk. Pay first.", fx = { align = { order = -1 } } },
        { text = "I'd like to rest here.", next = "BUSINESS" },
        { text = "Why do they call you Little?", next = "name" },
        { text = "What's in the stew?", next = "stew" },
        { text = "How do the Stonemaul feel about the Horde?", next = "horde" },
        { text = "The Theramore spies were watching your inn, Logok?", next = "dd_spies", when = { questDone = TODO_QUEST("Theramore Spies") } },
        { text = "Who comes to your inn the most?", next = "guests" },
        { text = "What was the old village like, before the dragons?", next = "village" },
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
    guests = {
      lines = { { id = "gu_default", text = "Ogres, every night, because ogres are always hungry, and orcs from the Horde who come to watch the Theramore humans. And the wyvern master, who eats very slowly and says Logok's stew is the best thing in the whole swamp, which Logok knows already." } },
      choices = {
        { text = "Do the ogres and orcs ever fight in here?", next = "guests2" },
        { text = "Every inn needs a guest who praises the stew.", next = "guests2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests2 = {
      lines = { { id = "gu2_default", text = "Sometimes, but Logok sits on whoever starts it, and then they stop. Overlord Mok'Morokk says the inn is a place for eating, not smashing, and the overlord is very big, so everybody listens. Then they eat more stew, because sitting makes them hungry." } },
      choices = { { text = "Logok the peacekeeper. Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "vg_default", text = "Bigger, and drier, and full of Stonemaul, with a big fire in the middle where Logok's mother cooked. Then the black dragons came down from their cave and burned it, and the Stonemaul had to leave, and now Logok cooks here in the bog." } },
      choices = {
        { text = "Does anyone go back there?", next = "village2" },
        { text = "The black dragons have a lot to answer for.", next = "village2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village2 = {
      lines = { { id = "vg2_default", text = "The overlord sends ogres to fight the dragons sometimes, and they come back burned, and Logok gives them extra stew. Logok wants to go back one day and light the big fire again. Then Logok will be Little Logok in the old village, and maybe Logok will understand the joke." } },
      choices = {
        { text = "I'll fight the dragons for the Stonemaul.", next = "BACK", reply = "Small friend is brave! Logok will save you the biggest bowl when you come back.", when = { faction = "Horde" } },
        { text = "I hope you light it again. Something else.", next = "BACK" },
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
    first = "She has opinions about the marsh, and not one is polite.",
    third = "{name} met Shardi, the wind rider master of Brackenwall Village.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "You again. Good. The riders trust you, fog or no fog. Where to?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Fog's thick. Pay, and don't fall off." },
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
        { text = "Flying in this fog takes real nerve.", next = "BACK", reply = "It does. Most riders won't do it.", fx = { align = { honor = 1 } } },
        { text = "Fog's nothing. The riders are just soft.", next = "BACK", reply = "Then fly yourself and find out.", fx = { align = { honor = -1 } } },
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
