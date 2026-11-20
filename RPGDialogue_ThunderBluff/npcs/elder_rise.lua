-- Elder Rise: Magatha's attendant, the Archdruid's daughter, and two druid trainers in the Hall of Elders.
-- Voice: bibles/rahauro.md, bashana.md, elder_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Rahauro: Magatha's attendant, who hands out her tasks.
---------------------------------------------------------------------------
P:NPC {
  key = "rahauro", id = TODO_NPC("Rahauro"), name = "Rahauro",
  bible = "bibles/rahauro.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "loyal", "cunning", "proud" },
  notices = { "origin", "dungeon" },
  impression = {
    first = "His devotion to Magatha is either very sincere or very well rehearsed.",
    third = "{name} met Rahauro, the Grimtotem attendant who handles Magatha's business on Elder Rise.",
  },

  greetings = {
    { id = "o_mag_distrust", when = { gossip = { topic = "magatha", stance = "distrust" } }, text = "I hear you told the sage on the lower rise that the Elder Crone is a viper. She hears these things too, outsider, and she has a long memory." },
    { id = "o_cairne_admire", when = { gossip = { topic = "cairne", stance = "admire" } }, text = "The Elder Crone tells me you sang Cairne Bloodhoof's praises at her own fire. That was bold of you, and not very wise." },
    { id = "g_hi", text = "The Elder Crone is occupied, but I speak for her in small matters. Is yours a small matter?" },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Magatha remembers those who are useful, and so do I." },
    { id = "g_troggs", when = { questActive = TODO_QUEST("Testing an Enemy's Strength") }, text = "The troggs are in Ragefire Chasm, beneath Orgrimmar itself. The orcs built their capital on top of a nest and never thought to look down." },
    { id = "g_satchel", when = { questActive = TODO_QUEST("Searching for the Lost Satchel") }, text = "Maur's body lies somewhere in the Chasm. Search it well, and bring anything he carried back to the Elder Crone." },
    { id = "g_grimborn", when = { origin = "tauren_grimtotem_born" }, text = "Ah. One who was born to the Grimtotem and walks with the Bloodhoof now. The Elder Crone has not forgotten you, and neither have I." },
  },

  notice = {
    { id = "n_grim", cat = "origin", when = { origin = "tauren_grimtotem_born" },
      text = "You still stand like one of ours, whatever banner you've chosen. The blood remembers, even when the heart forgets." },
    { id = "n_rfc", cat = "dungeon", when = { cleared = "Ragefire Chasm" },
      text = "You smell of sulfur and trogg. You've been in Ragefire, then, and come out again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Rahauro, and I attend the Elder Crone, Magatha Grimtotem. She has a great many burdens on behalf of all tauren, and I take the smaller ones from her shoulders so that she can bear the larger. The largest just now is the troggs beneath Orgrimmar, who killed her diplomats." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Testing an Enemy's Strength"), minLevel = 9 },
          text = "Troggs have come up from the depths beneath Orgrimmar, into a place called Ragefire Chasm. The Elder Crone sent diplomats to make peace with them, and the troggs killed every one, so now she sees them as a threat to the whole Horde and would like them destroyed before they overwhelm it from below." },
        { id = "h_satchel", when = { questDone = TODO_QUEST("Testing an Enemy's Strength"), questBefore = TODO_QUEST("Searching for the Lost Satchel") },
          text = "One of the diplomats was Maur Grimtotem, and he went deeper than the rest. The Elder Crone wishes his body found, and any sign of what he discovered while he tried to speak with the troggs." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Returning the Lost Satchel"), days = 3 } },
          text = "Maur's satchel has come home, and the Elder Crone is pleased. She does not often say so to outsiders, so you may take my word for it." },
        { id = "h_scourge", when = { race = "Scourge" },
          text = "One of the Dark Lady's dead, on Elder Rise. The High Chieftain insists you are welcome everywhere in his city, and I am sure he knows best." },
      },
      again = {
        { id = "h_again", text = "Is there something more? Be brief, if you can; the Grimtotem do not waste breath the way the plains-folk do." },
        { id = "h_again2", text = "Ask what you came to ask. The Elder Crone's time is not the only time I guard." },
      },
      choices = {
        { text = "Why would Magatha make peace with troggs?", next = "troggs" },
        { text = "Who were the diplomats the troggs killed?", next = "maur" },
        { text = "What does Magatha want for the tauren?", next = "magatha" },
        { text = "I was born Grimtotem. I chose the Bloodhoof.", next = "o_grim", when = { origin = "tauren_grimtotem_born" } },
        { text = "What task do you have?", next = "BUSINESS" },
        { text = "I studied under the Elder Crone once, Rahauro.", next = "xorig_magatha", when = { origin = "tauren_magatha_acolyte" } },
        { text = "Good day, Rahauro.", next = "END" },
      },
    },
    xorig_magatha = {
      lines = {
        { id = "xmg_default", text = "I remember. You sat at the back of her tent and listened a little too closely, and one morning you simply didn't come. The Elder Crone said nothing about it, which is how I knew she had noticed. Why did you leave her?" },
      },
      choices = {
        { text = "I didn't like how she spoke of Cairne.", next = "xorig_magatha2", fx = { affinity = -1 } },
        { text = "The elements called me elsewhere. That's all it was.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "That's between me and the Elder Crone.", next = "BACK" },
      },
    },
    xorig_magatha2 = {
      lines = {
        { id = "xmg2_default", text = "Then you understood her better than most of her students ever do. I won't repeat what you just said, but I'd advise you not to say it again on the Elder Rise, where the tents are thin." },
      },
      choices = {
        { text = "I won't hide from the Grimtotem, Rahauro.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Thank you for the warning.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "Because peace is cheaper than war, and the Elder Crone is wiser than the orcs who would rather fight first. She offered, the troggs answered with clubs, and now she knows what they are, which is worth something even at that price." } },
      choices = {
        { text = "Her diplomats paid that price, not her.", next = "troggs_cost", fx = { learn = { "troggs" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    troggs_cost = {
      big = true,
      lines = { { id = "tc_default", text = "They went willingly, as Grimtotem do when she asks. A leader who never risks her people never learns anything, and the Elder Crone grieves each of them, whatever the Bloodhoof whisper about her." } },
      choices = {
        { text = "A leader should go first into danger.", next = "BACK", reply = "Then you would understand the Elder Crone better than most Bloodhoof do. She has walked into more danger than any of the young bulls who whisper about her.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "A leader who dies first leads no one.", next = "BACK", reply = "A leader who never risks herself leads no one worth following. Keep your caution, if it comforts you, but don't mistake it for wisdom.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    maur = {
      lines = { { id = "m_default", text = "Grimtotem, all of them, and Maur Grimtotem mattered most, for he could speak a little of the tongue of the deep places. He went further into the Chasm than the others, because he believed he could reach the troggs where the others had failed." } },
      choices = {
        { text = "He must have hoped to find something.", next = "maur_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maur_find = {
      lines = { { id = "mf_default", text = "That is for the Elder Crone to say, and she has not said it to me. I deliver her wishes, {class}; I don't ask her to explain them, and you would be wise not to either." } },
      choices = {
        { text = "That sounds like something worth hiding.", next = "maur_hide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maur_hide = {
      lines = {
        { id = "mh_default", text = "Everything on Elder Rise is worth hiding from someone. The druids keep their secrets in the Hall of Elders and the Bloodhoof keep theirs in the chieftain's tent, and nobody calls those suspicious." },
        { id = "mh_cold", when = { disposition = { max = 34 } }, text = "You have a Bloodhoof tongue, I see. Take it somewhere it will be appreciated." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magatha = {
      big = true,
      lines = { { id = "mg_default", text = "Strength for the tauren, and an end to bending our necks to outsiders. The High Chieftain gave our people to the orcs out of gratitude, and gratitude is a debt that grows larger every year you pay it." } },
      choices = {
        { text = "The Horde saved the tauren. That debt is honorable.", next = "BACK", reply = "Honorable to whom? The orcs took our gratitude and gave us a war that was never ours, and the Elder Crone remembers who paid for it.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "The tauren should stand on their own.", next = "BACK", reply = "Magatha would be pleased to hear it from an outsider. Many think it and few say it, and fewer still say it so near the High Chieftain's lodge.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    o_grim = {
      lines = { { id = "og_default", text = "So you did, and nobody on this rise will hold it against you aloud. The Grimtotem are patient, though, and a calf who wanders from the herd sometimes finds that the herd was right after all." } },
      choices = {
        { text = "I chose well. I won't be back.", next = "BACK", fx = { affinity = -1 } },
        { text = "Perhaps. I haven't decided everything yet.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Elder Crone, and have for many years. The rest of my story is not your concern." } },
    advice = { { id = "tp_ad", text = "Learn whose favor matters on this mesa. It is not always the one sitting in the biggest tent." } },
    grimtotem = { { id = "tp_gt", text = "The oldest of the tribes and the proudest. We remember what the tauren were before the orcs came, and someone ought to." } },
    _none = { { id = "tp_none", text = "That is not a matter the Elder Crone has asked me to know about, and the Grimtotem keep their own counsel." } },
  },
}

---------------------------------------------------------------------------
-- Bashana Runetotem: the Archdruid's daughter, of the Cenarion Circle.
---------------------------------------------------------------------------
P:NPC {
  key = "bashana", id = TODO_NPC("Bashana Runetotem"), name = "Bashana Runetotem",
  bible = "bibles/bashana.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "brisk" }, values = { "nature", "practical", "curious" },
  notices = { "class", "dungeon" },
  impression = {
    first = "She would rather grow something than discuss it.",
    third = "{name} met Bashana Runetotem, Hamuul's daughter and a druid of the Cenarion Circle on Elder Rise.",
  },

  greetings = {
    { id = "o_ne_hate", when = { gossip = { topic = "night_elves", stance = "hate" } }, text = "Father says you've no love for the kaldorei. I'd keep that quiet in Moonglade, if I were you, because they remember everything for ten thousand years." },
    { id = "g_hi", text = "If you're here for my father, he's thinking, which could take until An'she sets. If you're here for seeds, I'm faster." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. Did anything you planted come up, or did the Earth Mother have other ideas?" },
    { id = "g_morrow", when = { questActive = TODO_QUEST("Morrowgrain Research") }, text = "The Tharlendris seeds want soil from Un'Goro Crater and the patience of a kodo in the dry season. I can give you the first, and the second is your affair." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of my father's students, then, or one of the Circle's. You're standing like you've spent too long as a bear, so stretch before you go." },
    { id = "n_bfd", cat = "dungeon", when = { cleared = "Blackfathom Deeps" },
      text = "You've been in Blackfathom Deeps. There's black water still in the cracks of your boots, and it smells wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Bashana Runetotem, the Archdruid's daughter, which most people say before I can. My father carries the Cenarion Circle's burdens on Elder Rise, and I carry its seeds, and lately its worries about Blackfathom Deeps." },
        { id = "h_bfd", when = { questActive = TODO_QUEST("Blackfathom Villainy") },
          text = "You have something from Blackfathom Deeps for me? Good. The Twilight's Hammer have been doing something foul in those flooded halls, and anything that tells us who leads them down there is worth having." },
        { id = "h_bfd_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackfathom Villainy"), days = 3 } },
          text = "Kelris is dead, then. I'll send word to those who need to know, and the Circle will breathe a little easier about the old temple." },
        { id = "h_morrow_before", when = { questBefore = TODO_QUEST("Morrowgrain Research"), minLevel = 50 },
          text = "My father's sent you? Then you'll want a pouch and some Tharlendris seeds, and you'll want to know that they only grow into morrowgrain in soil from Un'Goro Crater." },
        { id = "h_tauren_m", when = { race = "Tauren", gender = "male" },
          text = "A young bull with the plains still in his hide. Don't go telling my father you've come to be a druid unless you mean it, because he'll believe you." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if you can, I've seedlings that need turning." },
        { id = "h_again2", text = "Go on. I can listen and sort seeds at once; my grandmother could do it with a kodo calving beside her." },
      },
      choices = {
        { text = "What is morrowgrain?", next = "morrow" },
        { text = "What's it like being Hamuul's daughter?", next = "father" },
        { text = "What happened in Blackfathom Deeps?", next = "bfd" },
        { text = "How do I join the Cenarion Circle?", next = "circle", when = { class = "DRUID" } },
        { text = "Show me your seeds.", next = "BUSINESS" },
        { text = "Earth Mother keep you, Bashana.", next = "END" },
      },
    },
    morrow = {
      lines = { { id = "m_default", text = "A grain the Circle is studying, grown from Tharlendris seeds in the soil of Un'Goro Crater, where everything grows too large and too fast. If we learn why it grows there, we might learn to heal lands that grow nothing at all." } },
      choices = {
        { text = "Which lands?", next = "morrow_lands" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morrow_lands = {
      lines = { { id = "ml_default", text = "Felwood, where the demons poisoned the forest, and the Barrens, which get drier every year whatever the Circle does. My father is patient about those places, and I'm less so, because I've walked through them." } },
      choices = {
        { text = "Patience or haste, then: which one heals the land?", next = "morrow_way" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morrow_way = {
      big = true,
      lines = { { id = "mw_default", text = "My father says patience, and he's older than I am by a long way. I say a sick forest doesn't care how patient we are, and sometimes you have to dig." } },
      choices = {
        { text = "Your father's right. Land heals at its own pace.", next = "BACK", reply = "You and my father would get along, which doesn't surprise me at all. Patience is easy, though, when it isn't your forest that's dying.", fx = { align = { order = 1 } } },
        { text = "You're right. Dig, and dig now.", next = "BACK", reply = "Thank you, I needed someone to say it besides me. My father will sigh, and I'll go and dig anyway, and the forest will be the better for it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = {
        { id = "f_default", text = "Like growing up beside a very old tree, which is lovely until you want some sunlight of your own. He's wise and kind and right about nearly everything, and he takes a full day to say it." },
        { id = "f_warm", when = { disposition = { min = 65 } }, text = "Like growing up beside a very old tree, which is lovely until you want some sunlight of your own. Don't tell him, but I'd follow him into the Emerald Dream itself if he asked, and I'd complain the whole way." },
      },
      choices = {
        { text = "Does anyone on this rise trouble him?", next = "father_magatha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_magatha = {
      lines = { { id = "fm_default", text = "Only Magatha, and everyone knows it. She watches all of us from the other end of this rise, and my father bows to her very politely, and neither of them has ever once turned their back on the other." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } } },
    },
    bfd = {
      lines = { { id = "b_default", text = "An old night elf temple off the coast of Ashenvale, sunk into the sea, and now full of naga and the Twilight's Hammer. Something the Hammer is doing down there has the Circle very worried, and a Twilight Lord named Kelris is said to lead them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } } },
    },
    circle = {
      lines = { { id = "c_default", text = "You keep learning, and you go to Moonglade when my father sends you, and one day you look around and realize the Circle has decided you're one of them. Nobody ever asks to join, they just keep showing up." } },
      choices = { { text = "Then I'll keep showing up.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Hamuul's daughter, a druid of the Circle, and the one who actually remembers to water things." } },
    advice = { { id = "tp_ad", text = "If a plant is dying, look at the roots before you blame the sky." } },
    cenarion_circle = { { id = "tp_cc", text = "Druids of every race who swore to keep the world's balance. It's a fine oath, and most days it means sorting seeds." } },
    _none = { { id = "tp_none", text = "I don't know that one, and my father would take a week of slow seasons to tell you he doesn't either." } },
  },
}

---------------------------------------------------------------------------
-- Sheal Runetotem: a druid trainer who teaches the bear form first.
---------------------------------------------------------------------------
P:NPC {
  key = "sheal", id = TODO_NPC("Sheal Runetotem"), name = "Sheal Runetotem", title = "Druid Trainer",
  bible = "bibles/elder_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "nature", "patient" },
  notices = { "form" },
  impression = {
    first = "She thinks most problems can be solved by sitting still long enough.",
    third = "{name} met Sheal Runetotem, a druid trainer on Elder Rise.",
  },

  greetings = {
    { id = "o_ne_admire", when = { gossip = { topic = "night_elves", stance = "admire" } }, text = "The Arch Druid says you think well of the kaldorei. Sit with that a while, and you'll find it makes a druid's lessons easier." },
    { id = "g_hi", text = "Sit, and breathe, and let the Earth Mother settle you. Then tell me what you've come to learn." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. The Great Bear Spirit has been patient with you, I hope." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear" } },
      text = "You've come in as a bear. Good, then you'll understand me when I say the bear's strength comes from sitting still, not from charging about." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sheal Runetotem, and I teach those who would walk the druid's path, as Hamuul taught me. Come when you are ready, as the grass comes when the rain does, and not before." },
        { id = "h_notdruid", when = { ["not"] = { class = "DRUID" } }, text = "You're no druid, friend, but the Hall of Elders welcomes listeners. Sit if you wish, and don't step on the moss." },
        { id = "h_dr_rebirth", when = { class = "DRUID", minLevel = 20, maxLevel = 29 },
          text = "You've come far enough now that I can teach you to call a fallen friend back to their feet. Sit first, because that is a gift I won't hand to anyone who hasn't thought about it." },
        { id = "h_dr_tranq", when = { class = "DRUID", minLevel = 30, maxLevel = 39 },
          text = "There's a stillness in you now that wasn't there when you first came up the lift. Good, because the next thing I teach needs all of it, and a druid who can't be still can't give Tranquility to anyone." },
        { id = "h_dr_bark", when = { class = "DRUID", minLevel = 44 },
          text = "You've grown bark of your own, I think, the kind that blows don't get through. The Earth Mother lends it to us when we're ready to stand like an old tree, and you're ready." },
      },
      again = { { id = "h_again", text = "Something else? Take your time; the land has never once hurried." } },
      choices = {
        { text = "I'm ready to learn.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What's the first thing a druid learns?", next = "first" },
        { text = "The Archdruid must be a good teacher.", next = "hamuul" },
        { text = "Where do druids go to learn beyond this hall?", next = "moonglade" },
        { text = "What do you think of the night elves?", next = "kaldorei" },
        { text = "I find the bear slow and heavy.", next = "bear_slow", when = { class = "DRUID" } },
        { text = "Rebirth. Should a druid really call back the dead?", next = "d_rebirth", when = { class = "DRUID", minLevel = 20 } },
        { text = "Tranquility. What does it cost the one who gives it?", next = "d_tranq", when = { class = "DRUID", minLevel = 30 } },
        { text = "Barkskin. Is it a shield, or something more?", next = "d_bark", when = { class = "DRUID", minLevel = 44 } },
        { text = "Is the druid's path closed to my people, Sheal?", next = "d_closed", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "Shaman speak with spirits too. How is it different?", next = "shaman_diff", when = { class = "SHAMAN" } },
        { text = "Farewell, Sheal.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "To be still. A druid who can't sit quietly in the grass for an hour will never hear what the Earth Mother is saying, and the forms come only after that." } },
      choices = {
        { text = "Some of us aren't made for stillness.", next = "first_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_still = {
      big = true,
      lines = { { id = "fs_default", text = "Then you'll learn slower, and the bear will teach you the hard way instead of the easy one. The young bulls on Hunter Rise always think the claws are the lesson, and they always come back here bruised." } },
      choices = {
        { text = "Stillness first, then. I'll try.", next = "BACK", reply = "Good, that's all I ask of a young druid. The bear is patient with those who are patient with it, and much less so with anyone else.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll learn by doing, bruises and all.", next = "BACK", reply = "Then I'll see you back here soon with fur in your teeth and a bruise on your pride. Come in quietly when you do, and I won't say I told you.", fx = { align = { order = -1 } } },
      },
    },
    hamuul = {
      lines = { { id = "hm_default", text = "The best, and the slowest. He once spent a whole afternoon showing me a beetle, and it was years before I understood why." } },
      choices = {
        { text = "What did the beetle teach you?", next = "beetle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beetle = {
      lines = { { id = "be_default", text = "That it carried something many times its own weight, slowly and without complaint, and never once tried to be anything but a beetle. Hamuul said a druid takes a form the same way, by accepting it whole, and not by wearing it like a cloak." } },
      choices = {
        { text = "Is that why you teach the bear first?", next = "beetle_form" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beetle_form = {
      lines = { { id = "bf_default", text = "In part. The bear is the form least like a cloak, heavy and patient and sure of itself, and it punishes a druid who only pretends. If you can be a bear honestly, the other forms come easier after." } },
      choices = {
        { text = "I'll remember the beetle.", next = "BACK" },
        { text = "Farewell, Sheal.", next = "END" },
      },
    },
    moonglade = {
      lines = { { id = "mg_default", text = "To Moonglade, in the north, where the Cenarion Circle gathers and the kaldorei have kept the old ways longer than our tribes have had names. Nara Wildmane sends our young ones there when they're ready, and they come home very quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
      learn = { "cenarion_circle" },
    },
    kaldorei = {
      big = true,
      lines = { { id = "kd_default", text = "They are an old people, and their druids taught Hamuul much of what he knows, so I owe them something. They can be cold, and they carry their own griefs, but they love the forests as we love the plains." } },
      choices = {
        { text = "The land matters more than banners. Work with them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Horde comes first. The elves chose their side.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear_slow = {
      lines = { { id = "bs_default", text = "It is, and that is what it's for. The bear stands where it chooses and lets the fight come to it, which is a lesson the young never want and always need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    d_rebirth = {
      big = true,
      lines = {
        { id = "dr_rb_default", text = "Only the ones who've just fallen, while the spirit is still near enough to hear you and the body still wants to live. The Earth Mother lets a druid ask her for that once in a long while, and she always answers, which is exactly why I make my students sit with it before I teach it." },
        { id = "dr_rb_tammra", when = { heardLine = "tammra.h_default" }, text = "Only the ones who've just fallen, while the spirit is still close. You've met Tammra Windfield at Sun Rock, I think, so you've heard her say death feeds life, and she's right; Rebirth is the rare moment when a druid asks the Earth Mother to let the cycle wait." },
      },
      choices = {
        { text = "Then I'll use it sparingly, and only for those who'd want it.", next = "BACK",
          reply = "That's the answer I wait for, and it's rarer than you'd think. Some young druids hear 'once in a long while' and start counting how soon that is.",
          fx = { affinity = 1, align = { light = 1 } } },
        { text = "If I can bring a friend back, I always will.", next = "BACK",
          reply = "A kind heart says that, and I'll not fault it, but the land doesn't keep a ledger of friends. Mind that you don't start thinking the cycle bends for you.",
          fx = { align = { light = -1 } } },
        { text = "Has anyone ever refused to come back?", next = "d_rebirth2" },
      },
    },
    d_rebirth2 = {
      lines = { { id = "dr_rb2_default", text = "Once, that I know of, an old brave who'd fallen in the Barrens with a smile on his face. Hamuul knelt over him and called, and the spirit simply didn't come, and Hamuul said afterwards that some people have finished their walk and know it." } },
      choices = { { text = "Something else, Sheal.", next = "BACK" } },
    },
    d_tranq = {
      lines = { { id = "dr_tq_default", text = "Everything you have, for as long as you can hold it, and you can't move while you give it. You stand still in the middle of the fight and pour the Earth Mother's peace over everyone around you, and you'll feel every blow that lands on you while you do, so learn to stand still before you learn the spell." } },
      choices = {
        { text = "So that's why you taught me to be still first.", next = "d_tranq2" },
        { text = "Something else, Sheal.", next = "BACK" },
      },
    },
    d_tranq2 = {
      lines = { { id = "dr_tq2_default", text = "It is, and you're one of the few who's worked it out without being told. Everyone thinks I teach stillness because I'm slow, and I let them, because the ones who understand are the ones I'd trust with Tranquility." } },
      choices = { { text = "Something else, Sheal.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    d_bark = {
      lines = { { id = "dr_bk_default", text = "A shield, yes, and more than that if you let it. The bark doesn't stop the axe from coming; it only lets you take the blow and keep your mind clear, which is how an old tree stands through a storm that topples the young ones." } },
      choices = { { text = "Something else, Sheal.", next = "BACK" } },
    },
    d_closed = {
      big = true,
      lines = {
        { id = "dr_cl_default", text = "Closed is a strong word, friend, but I won't pretend the door stands open. The night elves taught Hamuul, and Hamuul taught us, and none of us has yet been asked by an orc, so nobody has had to decide." },
        { id = "dr_cl_troll", when = { race = "Troll" }, text = "Closed is a strong word, friend, but I won't pretend it's open either. The night elves taught Hamuul, and they remember your people's old empires with no fondness at all, so they've never been asked to teach a troll and would likely refuse if they were." },
        { id = "dr_cl_scourge", when = { race = "Scourge" }, text = "I'm sorry, friend, but I think it may be, at least for now. The forms are lent by living spirits, the bear and the cat and the sea lion, and I don't know how a spirit that has died and risen would even begin to speak with them." },
      },
      choices = {
        { text = "Then the Circle should ask, and decide.", next = "BACK",
          reply = "You may be right, and I'll say so to Hamuul over tea, though he'll only smile. Doors open slowly on Elder Rise, but they do open.",
          fx = { align = { order = -1 }, opinion = { druids = "closed" } } },
        { text = "My people have their own ways. That's enough.", next = "BACK",
          reply = "They do, and good ones, from what I've seen of your shamans. The Earth Mother made more than one road to her door.",
          fx = { align = { order = 1 }, opinion = { druids = "respect" } } },
        { text = "Something else, Sheal.", next = "BACK" },
      },
    },
    shaman_diff = {
      lines = { { id = "sd_default", text = "A shaman asks the elements for help, and a druid asks the land to let her become part of it for a while. Tigor Skychaser and I have argued over which is harder for many seasons, and neither of us has won." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The druids' circle, kaldorei and tauren together. Hamuul sits with them in Moonglade, and they listen when he speaks." } },
    earth_mother = { { id = "tp_em", text = "She is in the grass and the stone and the stillness between them. Sit long enough and you'll feel her." } },
    background = { { id = "tp_bg", text = "A Runetotem, and a student of Hamuul's before I taught anyone myself. There isn't more to tell." } },
    advice = { { id = "tp_ad", text = "Breathe before you shift. A bear born in a panic is a frightened bear." } },
    _none = { { id = "tp_none", text = "I couldn't say. Sit with the question for a while, as the herd sits out a storm; it may answer itself." } },
  },
}

---------------------------------------------------------------------------
-- Kym Wildmane: a druid trainer who prefers the cat and the long run.
---------------------------------------------------------------------------
P:NPC {
  key = "kym", id = TODO_NPC("Kym Wildmane"), name = "Kym Wildmane", title = "Druid Trainer",
  bible = "bibles/elder_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "eager" }, values = { "nature", "brave" },
  notices = { "form" },
  impression = {
    first = "She would plainly rather be running across Mulgore.",
    third = "{name} met Kym Wildmane, a druid trainer on Elder Rise.",
  },

  greetings = {
    { id = "g_hi", text = "There you are! Let's not waste An'she's light, what do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Good, you've been running, I can tell." },
  },

  notice = {
    { id = "n_cat", cat = "form", when = { form = { "cat", "travel" } },
      text = "Now that's a good way to arrive. Sheal would tell you to walk in on your own hooves, but I won't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kym Wildmane, and I teach druids here alongside Turak and Sheal, though I'm the one who'll take you out onto the plains to practice. You learn the cat on grass, not on stone floors." },
        { id = "h_notdruid", when = { ["not"] = { class = "DRUID" } }, text = "You're not one of ours, are you? That's all right. Ask what you like, but I warn you I talk fast." },
        { id = "h_dr_cat", when = { class = "DRUID", minLevel = 20, maxLevel = 29 },
          text = "You've got the cat! I can tell from the way you came up the lift, all shoulders and no noise. Come on, ask me about it, because I've been waiting all season for someone to talk cats with." },
        { id = "h_dr_travel", when = { class = "DRUID", minLevel = 30, maxLevel = 39 },
          text = "There it is, the cheetah's shape, finally! Now you'll understand why I never sit down, because once the plains are that fast under you, walking feels like standing still." },
        { id = "h_dr_dire", when = { class = "DRUID", minLevel = 40 },
          text = "You've grown into a dire bear, haven't you? I can smell the den on you from here, and I mean that kindly, because that shape keeps whole war bands alive." },
      },
      again = { { id = "h_again", text = "What else? Quick, the wind's changing, and the plains won't wait for us." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why do you prefer the plains?", next = "plains" },
        { text = "Do you have kin among the druids here?", next = "nara" },
        { text = "What's the cat form like?", next = "cat" },
        { text = "Sheal says you're always in a hurry.", next = "sheal" },
        { text = "When will I learn the travel form?", next = "travel", when = { class = "DRUID", maxLevel = 29 } },
        { text = "Teach me to hunt properly as the cat, Kym.", next = "d_cat", when = { class = "DRUID", minLevel = 20 } },
        { text = "I have the cheetah's shape now. Race me?", next = "d_travel", when = { class = "DRUID", minLevel = 30 } },
        { text = "The dire bear. Is it just a bigger bear?", next = "d_dire", when = { class = "DRUID", minLevel = 40 } },
        { text = "Could you outrun a hunter's arrow?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Farewell, Kym.", next = "END" },
      },
    },
    plains = {
      lines = { { id = "p_default", text = "Because that's where the Earth Mother actually is, running with the plainstriders and hunting with the lions. The Hall of Elders is beautiful, and it's also where the old ones go to talk for a very long time." } },
      choices = {
        { text = "The elders must have some wisdom worth hearing.", next = "plains_elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plains_elders = {
      big = true,
      lines = { { id = "pe_default", text = "They do, and I listen, mostly. I just think a druid ought to earn her wisdom with sore legs and a scratched nose, and the elders seem to think it comes from a good cushion." } },
      choices = {
        { text = "Listen to the elders. They've earned it.", next = "BACK", reply = "The elders would thank you for that, and so would my aching legs some evenings. Still, I've never learned a thing worth knowing while sitting on a cushion.", fx = { align = { order = 1 } } },
        { text = "You're right. Learn it on the plains.", next = "BACK", reply = "Then come running with me sometime, and we'll see how far your wisdom carries you. The cat has taught me more on one night's hunt than the Hall has in a season.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    nara = {
      lines = { { id = "n_default", text = "Nara Wildmane is kin, though the Wildmanes are a big family and I couldn't tell you exactly how. She's the one who sends young druids off to Moonglade, and I'm the one who teaches them to run fast enough to get there." } },
      choices = {
        { text = "Why send them to Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "mg_default", text = "Because that's where the Cenarion Circle meets, kaldorei and tauren both, and a young druid learns there's more to the craft than Mulgore. They come back changed and quieter, and usually wanting to tell me everything at once." } },
      choices = {
        { text = "Have you been there yourself?", next = "moon_go" },
        { text = "Something else.", next = "BACK" },
      },
      learn = { "cenarion_circle" },
    },
    moon_go = {
      lines = { { id = "mo_default", text = "Twice, and I ran most of the way, which Sheal says was showing off. The glade is beautiful and terribly still, and after a day there I couldn't wait to get back to grass I could run on." } },
      choices = {
        { text = "Something else, Kym.", next = "BACK" },
        { text = "Farewell, Kym.", next = "END" },
      },
    },
    cat = {
      lines = { { id = "ct_default", text = "Like the whole world got louder and slower at once. You hear a plainstrider's heartbeat at forty paces and you'd swear the wind had stopped, and the first time it happened I laughed so hard I fell right out of it." } },
      choices = {
        { text = "Do you hunt as the cat?", next = "cat_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cat_hunt = {
      big = true,
      lines = { { id = "ch_default", text = "Only what I'll eat, and I thank it after, the same as any tauren hunter. Some young druids get drunk on the speed and kill for the joy of it, and I send those ones to Sheal to sit still for a month." } },
      choices = {
        { text = "Only what you need. That's the right way.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The thrill is part of it. Let them run.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_cat = {
      big = true,
      lines = {
        { id = "dr_kc_default", text = "Properly means low, slow and downwind, and then very fast for about four heartbeats. Prowl until you're close enough to hear it breathing, open it up with your claws, and finish it before it knows which way to run, because a cat in a long fight is a cat in trouble." },
        { id = "dr_kc_form", when = { form = "cat" }, text = "You're wearing it right now, so you can feel what I mean: everything wants you to go low and slow and downwind, and then very fast for four heartbeats. Listen to that, and finish the hunt before your prey knows which way to run." },
      },
      choices = {
        { text = "Quick and clean. The prey shouldn't suffer.", next = "BACK",
          reply = "That's how the lions do it, and that's how I teach it. A clean hunt honors the beast, and it's less work for you besides.",
          fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll play with it a little. The cat does.", next = "BACK",
          reply = "A housecat does, maybe, in some human's barn. A plains lion doesn't waste the breath, and neither should you.",
          fx = { align = { light = -1 } } },
        { text = "Did you learn it from the lions themselves?", next = "d_cat2" },
      },
    },
    d_cat2 = {
      lines = { { id = "dr_kc2_default", text = "Every bit of it, lying in the grass near the Golden Plains for a whole summer and watching them hunt. One old lioness let me follow her for three days before she turned round and growled, and I took that as my graduation." } },
      choices = { { text = "Something else, Kym.", next = "BACK" } },
    },
    d_travel = {
      big = true,
      lines = { { id = "dr_kt_default", text = "Race you? Ha! I'll take that, and you'll lose, but I like you better for asking. The cheetah's shape isn't for fighting, mind; it's for getting where you're needed before the trouble's finished, which on these plains is half of what a druid is for." } },
      choices = {
        { text = "Then I'll use it to get where I'm needed.", next = "BACK",
          reply = "Good answer, and you can still race me on the way. Mulgore's big, and the Barrens are bigger, and someone's always waiting for a healer.",
          fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll use it to go wherever the wind takes me.", next = "BACK",
          reply = "Now that's a druid after my own heart! Just don't let Sheal hear you say it, because she'll have you sitting on a cushion for a month.",
          fx = { affinity = 1, align = { order = -1 } } },
        { text = "Who taught you to run like that?", next = "d_travel2" },
      },
    },
    d_travel2 = {
      lines = { { id = "dr_kt2_default", text = "The plainstriders, mostly, and a lot of falling over. Turak gave me the shape, but nobody can teach you to love it; you either feel the wind and laugh, or you're a sensible druid like Sheal, and I've never managed sensible." } },
      choices = { { text = "Something else, Kym.", next = "BACK" } },
    },
    d_dire = {
      lines = { { id = "dr_kd_default", text = "Bigger, heavier and much harder to knock over, which is the whole point. The young bear guards one friend, and the dire bear stands in front of the whole war band and lets the ogres break their clubs on it, and I'll tell you a secret: I'm hopeless at it, because I keep wanting to run." } },
      choices = {
        { text = "Then who taught you the dire bear?", next = "d_dire2" },
        { text = "Something else, Kym.", next = "BACK" },
      },
    },
    d_dire2 = {
      lines = { { id = "dr_kd2_default", text = "Turak, with enormous patience, and Sheal, with none at all. Between them they made me stand in one place for a whole afternoon while the braves on Hunter Rise threw things at me, and I've never been so bored or so bruised in my life." } },
      choices = { { text = "Something else, Kym.", next = "BACK" } },
    },
    sheal = {
      lines = { { id = "sh_default", text = "Sheal says that about everyone except Hamuul and the moss. We're good friends, really, and she's the only one who can make me sit still, which I resent with my whole heart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    travel = {
      lines = { { id = "tv_default", text = "When you're ready and Turak says so, which will feel like forever and isn't. Until then, run everywhere on your own hooves, because the legs you build now are the legs the cheetah gets later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "No, and I tried once, against Kary Thunderhorn on a wager. She put an arrow through the tassel on my horn at a full gallop, and I've been very polite to hunters ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "Moonglade's lot. Wise, slow and very fond of long meetings, but they mean well, and they love the land." } },
    earth_mother = { { id = "tp_em", text = "She's out there running with the herds, not sitting in a hall. Go and find her." } },
    background = { { id = "tp_bg", text = "Wildmane, druid, runner. Ask me something interesting." } },
    advice = { { id = "tp_ad", text = "If you can outrun it, outrun it. Fighting is for when you can't." } },
    _none = { { id = "tp_none", text = "No idea! Ask someone slower; the elders have more seasons to think about it." } },
  },
}
