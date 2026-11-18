-- Petra Grossen and her kodo Dadanga, Marshal's Refuge (0.72.0). Voice: bibles/petra.md
-- An orc packmaster who raised her kodo from a calf and asks you to keep your torches stashed.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "petra", id = TODO_NPC("Petra Grossen"), name = "Petra Grossen",
  bible = "bibles/petra.md", role = "worker", tier = "service",
  communities = { "marshals_refuge" }, temper = { "calm", "warm" }, values = { "loyal", "patient" },
  notices = { "light", "pet" },
  impression = {
    first = "Petra Grossen is an orc packmaster who has walked beside her kodo Dadanga since the beast was a calf. She is calm and kind, and she asks everyone to keep their torches away because Dadanga dislikes smoke.",
    third = "{name} met Petra Grossen, an orc of the Marshal Expedition, and her pack kodo Dadanga.",
  },

  greetings = {
    { id = "g_default", text = "Hello there. If you're carrying a lit torch, stash it, please; Dadanga dislikes smoke." },
    { id = "g_fed", when = { questDone = TODO_QUEST("Dadanga is Hungry!") }, text = "Dadanga's been watching the path for you since you fed her. She remembers kindness, and so do I." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Dadanga's put on a little weight while you were away. Don't tell her I said so." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The camp's taken a shine to you. That's good; out here, friends are the only shelter worth having." },
  },

  notice = {
    { id = "n_fire", cat = "light", when = { class = { "MAGE", "WARLOCK" } },
      text = "You smell of burning, friend, so stand downwind of the kodo, would you? She's fussier about it than I am." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That {pet} of yours is well kept, I can see it in the coat. Dadanga likes most animals, so long as they're not on fire." },
  },

  start = "hello",
  nodes = {
    op_warchief = {
      lines = {
        { id = "opw_q", text = "The Warchief brought us out of those camps, and every orc I know has a different thing to say about him now. What do you think of Thrall?" },
      },
      choices = {
        { text = "He gave the orcs a future. He's the best of them.", next = "op_warchief_r1", fx = { affinity = 2, align = { light = 1 }, opinion = { warchief = "trust" } } },
        { text = "He's gone soft. Orcs were made for war, not kodo-herding.", next = "op_warchief_r2", fx = { affinity = -2, align = { light = -1 }, opinion = { warchief = "soft" } } },
        { text = "He's a good leader, but one orc can't fix everything.", next = "op_warchief_r3", fx = { trait = { practical = 1 }, opinion = { warchief = "mixed" } } },
        { text = "An honourable foe. The Alliance could use more like him.", next = "op_warchief_r4", fx = { affinity = 1, opinion = { warchief = "respect" } }, when = { faction = "Alliance" } },
        { text = "I'd rather not say, Petra.", next = "BACK" },
      },
    },
    op_warchief_r1 = {
      lines = {
        { id = "op_warchief_r1", text = "That's what I tell Dadanga on the long roads, and she's never once disagreed. Thank you for saying it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_warchief_r2 = {
      lines = {
        { id = "op_warchief_r2", text = "Then I'm soft too, and I'll not apologise for it. War made me a prisoner, and kodo-herding made me free." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_warchief_r3 = {
      lines = {
        { id = "op_warchief_r3", text = "No, he can't, and he'd tell you so himself. The rest is up to us, one kodo at a time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_warchief_r4 = {
      lines = {
        { id = "op_warchief_r4", text = "You're kind to say it here, where nobody's watching. I'll take that with me on the road to Gadgetzan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "My name's Petra, and to my right is my kodo, Dadanga. We've been with Marshal Expeditions a few years now, ever since Dadanga was a babe, and I've had more honor from that beast's trust than I ever had from an axe." },
        { id = "h_hungry", when = { questBefore = TODO_QUEST("Dadanga is Hungry!") },
          text = "Dadanga's eyeing you hopefully, which means she's hoping you brought a snack. She's a big girl, so if you find something growing out there, bring a lot of it." },
        { id = "h_fed", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dadanga is Hungry!"), days = 3 } },
          text = "Bloodpetal sprouts, and plenty of them! She's been content as a calf since, and she pushed a little parcel your way, did you see? She does that with people she likes." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Throm-ka. It's good to see another orc this far from the Barrens, even if you're only passing through." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! Dadanga always perks up around your people, and I've never worked out whether it's the smell of the plains or the size." },
      },
      again = {
        { id = "h_again", text = "Anything else? Dadanga's in no hurry, and neither am I; an orc learns patience at the end of a lead rope." },
        { id = "h_again2", text = "Go on. She likes the sound of talking, as long as nobody shouts." },
      },
      choices = {
        { text = "Why does Dadanga dislike smoke?", next = "smoke" },
        { text = "How did an orc end up with Marshal Expeditions?", next = "orc" },
        { text = "A pack kodo seems out of place down here.", next = "work" },
        { text = "Spark says Dadanga needs a bath.", next = "spark", when = { heardLine = "spark_nilminer.d_default" } },
        { text = "May I greet her?", next = "greet", when = { class = { "HUNTER", "DRUID", "SHAMAN" } } },
        { text = "How did you raise her from a calf?", next = "calf" },
        { text = "How do the humans here treat an orc?", next = "humans" },
        { text = "Any advice for keeping a beast content?", next = "tips", when = { class = "HUNTER" } },
        { text = "What does Dadanga eat?", next = "BUSINESS" },
        { text = "Take care, Petra.", next = "END" },
      },
    },
    smoke = {
      lines = { { id = "s_default", text = "There's fire in the ground here, and the mountain to the south smokes day and night, and she's never got used to it. A torch near her face and she'll sulk for a week." } },
      choices = {
        { text = "She sounds like she has opinions.", next = "smoke_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smoke_op = {
      lines = { { id = "so_default", text = "She has a great many, and most of them are about food. I trust her nose more than any map, though; she's smelled danger before I've seen it more times than I can count." } },
      choices = { { text = "A good partner, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    orc = {
      lines = { { id = "o_default", text = "The Marshals needed somebody who knew kodos and wasn't afraid of the road from Gadgetzan, and I needed work that didn't involve an axe. It's been a fair trade on both sides." } },
      choices = {
        { text = "I'd guess you didn't want to fight.", next = "orc_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc_fight = {
      big = true,
      lines = { { id = "of_default", text = "I've done my share, in the camps and after, and I found I'd rather raise something than cut it down. Dadanga taught me that, more than any shaman did." } },
      choices = {
        { text = "What do you think of the Warchief, Petra?", next = "op_warchief" },
        { text = "That's a strength, Petra, not a weakness.", next = "BACK", reply = "You sound like Dadanga, if Dadanga could talk, and I think she'd agree with you. It took me a long time to see it that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "An orc should keep her axe close, all the same.", next = "BACK", reply = "I keep it close, don't worry, and it's sharp. But I'd rather use it on firewood than on anything that breathes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Carries the Marshals' supplies down from the rim and their finds back up, and she defends herself well enough, because I taught her how. But the beasts out there are overgrown madness, so we never travel far alone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spark = {
      lines = { { id = "sp_default", text = "Does he now? Spark hasn't washed since the expedition landed, so he's hardly one to talk. Dadanga, ignore the goblin." } },
      choices = { { text = "I'll tell him you said so.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    calf = {
      lines = { { id = "c_default", text = "Her mother was taken by centaur raiders out on the Barrens, and she was left bawling in the grass, no bigger than a wolf. I fed her from a waterskin for a month, and she's followed me ever since." } },
      choices = {
        { text = "Why did you take her in?", next = "calf_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calf_why = {
      lines = {
        { id = "cw_default", text = "Because I'd seen enough left behind, I suppose, after the camps. Somebody had come for me once, and it seemed only right to do the same for something that couldn't ask." },
        { id = "cw_orc", when = { race = "Orc" }, text = "You'll know what the camps were, so I'll not explain them. Somebody came for me once, and it seemed only right to do the same for her." },
      },
      choices = { { text = "She was lucky you found her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    humans = {
      lines = {
        { id = "hu_default", text = "Williden pays me the same as any of them and has never once asked where I stood at Grim Batol or anywhere else. Some of the scholars stared at first, but a kodo who carries your books earns her keeper a lot of goodwill." },
        { id = "hu_human", when = { race = "Human" }, text = "Better than your kingdom treated my people, if you'll forgive me saying it. Williden pays me fair and never asks about the war, and Hol'anyee shares her fire, which is more than I hoped for." },
      },
      choices = {
        { text = "Does it trouble you, working for humans?", next = "humans_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans_stance = {
      big = true,
      lines = { { id = "hs_default", text = "Not out here, where the devilsaurs don't care who fought whom. Out there, in the wider world, I know it's more tangled, and I'd like to hear what you think about it." } },
      choices = {
        { text = "Old wars should stay buried. Work beside whoever's honest.", next = "BACK", reply = "That's how I feel, most days, and it's good to hear someone else say it. The devilsaurs make honest folk of us all.", fx = { align = { order = -1 } } },
        { text = "Loyalty to your own people comes first, Petra.", next = "BACK", reply = "My people are the ones who stood by me, and out here that's the Marshals. Blood's a fine thing, but the herd you choose is a better one.", fx = { align = { order = 1 } } },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    tips = {
      lines = {
        { id = "t_default", text = "Feed them before yourself, speak before you touch, and never let them see you frightened, because they'll take it as a reason to be frightened too. And brush them, friend, more often than you think." },
        { id = "t_pet", when = { pet = { type = "Beast" } }, text = "Brush {pet} more often than you think you need to, and talk to it on the road, even about nothing. A beast that knows your voice will come back to it when everything else is chaos." },
      },
      choices = { { text = "Sound advice. Thank you, Petra.", next = "BACK", fx = { affinity = 1 } } },
    },
    greet = {
      lines = { { id = "g2_default", text = "Slowly, and from the front, so she can see your hands. There, she's leaning into you, that means she approves." } },
      choices = { { text = "Hello, Dadanga.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An orc who traded the axe for a kodo's lead rope. I haven't regretted it once, not even in Un'Goro." } },
    advice = { { id = "tp_ad", text = "Look after your animals before yourself; they'll carry you when you can't carry on." } },
    thrall = { { id = "tp_thrall", text = "The Warchief walks among his people like any other orc, and I've seen him scratch a kodo behind the ears himself. Dadanga would have liked him." } },
    cairne = { { id = "tp_cairne", text = "The tauren taught my people to keep kodos, and Cairne's people raise the finest in Kalimdor. Dadanga came from a Mulgore herd, and she has their patience." } },
    earth_mother = { { id = "tp_earth_mother", text = "I'm no tauren, but I've come to think the Earth Mother watches over beasts of burden. Dadanga has never once been hurt on the road." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins in Gadgetzan want to buy Dadanga for meat, every time we pass through. I tell them she's worth more than their whole town, and I mean it." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Williden, he's the one with the books; orcs of my clan learned from the land, not from paper." } },
  },
}
