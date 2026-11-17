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
    first = "Rahauro attends Magatha Grimtotem on Elder Rise and hands out her lesser tasks so that she can attend to greater ones. He speaks of her with a devotion that is either very sincere or very well rehearsed.",
    third = "{name} met Rahauro, the Grimtotem attendant who handles Magatha's business on Elder Rise.",
  },

  greetings = {
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
        { id = "h_default", key = true, text = "I am Rahauro, and I attend the Elder Crone, Magatha Grimtotem. She has a great many burdens on behalf of all tauren, and I take the smaller ones from her shoulders so that she can bear the larger." },
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
        { id = "h_again", text = "Is there something more? Be brief, if you can." },
        { id = "h_again2", text = "Ask what you came to ask. The Elder Crone's time is not the only time I guard." },
      },
      choices = {
        { text = "Why would Magatha make peace with troggs?", next = "troggs" },
        { text = "Who was Maur Grimtotem?", next = "maur" },
        { text = "What does Magatha want for the tauren?", next = "magatha" },
        { text = "I was born Grimtotem. I chose the Bloodhoof.", next = "o_grim", when = { origin = "tauren_grimtotem_born" } },
        { text = "What task do you have?", next = "BUSINESS" },
        { text = "Good day, Rahauro.", next = "END" },
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
        { text = "A leader should go first into danger.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "A leader who dies first leads no one.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    maur = {
      lines = { { id = "m_default", text = "A Grimtotem of some learning, who could speak a little of the tongue of the deep places. He went further into the Chasm than the others, because he believed he could reach the troggs where the others had failed." } },
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
        { text = "The Horde saved the tauren. That debt is honorable.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "The tauren should stand on their own.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
    _none = { { id = "tp_none", text = "That is not a matter the Elder Crone has asked me to know about." } },
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
    first = "Bashana Runetotem is Hamuul's daughter and a member of the Cenarion Circle, a brisk druid who would rather grow something than discuss it. She sells seeds and pouches on Elder Rise and runs her father's errands with more energy than he does.",
    third = "{name} met Bashana Runetotem, Hamuul's daughter and a druid of the Cenarion Circle on Elder Rise.",
  },

  greetings = {
    { id = "g_hi", text = "If you're here for my father, he's thinking, which could take until sundown. If you're here for seeds, I'm faster." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. Did anything you planted come up?" },
    { id = "g_morrow", when = { questActive = TODO_QUEST("Morrowgrain Research") }, text = "The Tharlendris seeds want soil from Un'Goro Crater and a great deal of patience. I can give you the first, and the second is your affair." },
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
        { id = "h_default", key = true, text = "I'm Bashana Runetotem, the Archdruid's daughter, which most people say before I can. I'm of the Cenarion Circle too, and while my father carries the Circle's burdens on Elder Rise, I carry its seeds." },
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
        { id = "h_again2", text = "Go on. I can listen and sort seeds at once." },
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
        { text = "Patience or haste. Which heals land?", next = "morrow_way" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morrow_way = {
      big = true,
      lines = { { id = "mw_default", text = "My father says patience, and he's older than I am by a long way. I say a sick forest doesn't care how patient we are, and sometimes you have to dig." } },
      choices = {
        { text = "Your father's right. Land heals slowly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Dig, and dig now.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = {
        { id = "f_default", text = "Like growing up beside a very old tree, which is lovely until you want some sunlight of your own. He's wise and kind and right about nearly everything, and he takes a full day to say it." },
        { id = "f_warm", when = { disposition = { min = 65 } }, text = "Like growing up beside a very old tree, which is lovely until you want some sunlight of your own. Don't tell him, but I'd follow him into the Emerald Dream itself if he asked, and I'd complain the whole way." },
      },
      choices = {
        { text = "Magatha seems to be watching him.", next = "father_magatha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_magatha = {
      lines = { { id = "fm_default", text = "Everyone knows. Magatha watches all of us from the other end of this rise, and my father bows to her very politely, and neither of them has ever once turned their back on the other." } },
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
    _none = { { id = "tp_none", text = "I don't know that one, and my father would take a week to tell you he doesn't either." } },
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
    first = "Sheal Runetotem teaches druids in the Hall of Elders, slowly and with a great deal of silence between the words. She seems to think most problems can be solved by sitting still long enough.",
    third = "{name} met Sheal Runetotem, a druid trainer on Elder Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Sit, and breathe, and then tell me what you've come to learn." },
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
        { id = "h_default", key = true, text = "I am Sheal Runetotem, and I teach those who would walk the druid's path, as Hamuul taught me. Come when you are ready, and not before." },
        { id = "h_notdruid", when = { ["not"] = { class = "DRUID" } }, text = "You're no druid, friend, but the Hall of Elders welcomes listeners. Sit if you wish, and don't step on the moss." },
      },
      again = { { id = "h_again", text = "Something else? Take your time." } },
      choices = {
        { text = "I'm ready to learn.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What's the first thing a druid learns?", next = "first" },
        { text = "The Archdruid must be a good teacher.", next = "hamuul" },
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
        { text = "Stillness first, then. I'll try.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll learn by doing, bruises and all.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hamuul = {
      lines = { { id = "hm_default", text = "The best, and the slowest. He once spent a whole afternoon showing me a beetle, and it was years before I understood why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Runetotem, and a student of Hamuul's before I taught anyone myself. There isn't more to tell." } },
    advice = { { id = "tp_ad", text = "Breathe before you shift. A bear born in a panic is a frightened bear." } },
    _none = { { id = "tp_none", text = "I couldn't say. Sit with the question for a while; it may answer itself." } },
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
    first = "Kym Wildmane trains druids in the Hall of Elders and plainly would rather be running across Mulgore than standing in it. Her lessons come fast and go straight to the point.",
    third = "{name} met Kym Wildmane, a druid trainer on Elder Rise.",
  },

  greetings = {
    { id = "g_hi", text = "There you are! Let's not waste the daylight, what do you need?" },
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
      },
      again = { { id = "h_again", text = "What else? Quick, the wind's changing." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why do you prefer the plains?", next = "plains" },
        { text = "You must be kin to Nara Wildmane.", next = "nara" },
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
        { text = "Listen to the elders. They've earned it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Learn it on the plains.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    nara = {
      lines = { { id = "n_default", text = "We're both Wildmanes, and that's a big family, so I'll let you work out the rest. She's the one who sends young druids off to Moonglade, and I'm the one who teaches them to run fast enough to get there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Wildmane, druid, runner. Ask me something interesting." } },
    advice = { { id = "tp_ad", text = "If you can outrun it, outrun it. Fighting is for when you can't." } },
    _none = { { id = "tp_none", text = "No idea! Ask someone slower; they've more time to think about it." } },
  },
}
