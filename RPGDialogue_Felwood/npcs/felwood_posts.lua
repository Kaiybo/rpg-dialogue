-- Felwood's outpost hands (0.39.0): the hippogryph master at Talonbranch Glade, and the wind rider master
-- and the general goods seller at Bloodvenom Post. Voice: bibles/felwood.md ("Outpost hands")
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "mishellena", id = TODO_NPC("Mishellena"), name = "Mishellena", title = "Hippogryph Master",
  bible = "bibles/felwood.md", role = "flightmaster", tier = "service",
  communities = { "talonbranch" }, temper = { "solemn" }, values = { "dutiful", "nature" },
  notices = { "race" },

  impression = {
    first = "Mishellena keeps the hippogryphs at Talonbranch Glade and grieves for Felwood every time she flies over it. She speaks softly and won't let her birds drink anything but moonwell water.",
    third = "{name} met Mishellena, the night elf hippogryph master at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. The hippogryphs are rested, and they would be glad to leave this poisoned forest behind them, as would I." },
    { id = "g_horde", when = { faction = "Horde" }, text = "My hippogryphs fly for the Alliance, stranger, not for you. Your people keep their wind riders at Bloodvenom Post, away to the southwest." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Sister or brother of the forest, welcome. It hurts to see Felwood with kaldorei eyes, doesn't it? Rest a while before you fly." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "When the Sentinels ask it, yes, though I keep the birds high and the passengers quiet. Satyr archers in Jadefire Glen have tried for my hippogryphs before, so I would rather carry one silent scout than a whole noisy patrol." } },
      choices = {
        { text = "Scouting from the air is safer for everyone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner go in on foot and do it properly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll remember to keep quiet up there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They will, because I ask it of them, and because the Alliance asks it of me. But I will check their feathers twice tonight, and I hope you understand that it is the fire I mistrust and not, perhaps, you." } },
      choices = {
        { text = "I understand. The fel ruined this land, and I won't excuse it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire is fire. It burns whoever doesn't master it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my distance from the birds.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk softly, which my birds appreciate, because a hippogryph startled in this forest does not always come down where you meant it to." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You carry the smell of the same fire that burned this forest, warlock, and my birds have noticed it before I have. Stand back a little, please, while I calm them." },
        { id = "h_default", key = true,
          text = "I am Mishellena, and I keep the hippogryphs of Talonbranch Glade. From here they carry the Alliance to Ashenvale and Darkshore and to Everlook in the snows, and away from the corruption, for a little while." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask? The birds are patient, but the light is fading." },
        { id = "h_again2", text = "Speak, then, and I will listen." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do the hippogryphs bear this forest?", next = "corrupt" },
        { text = "What was Felwood before?", next = "before" },
        { text = "Do you ever fly scouts over the Jaedenar camps?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will your hippogryphs carry me, even so?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    corrupt = {
      lines = { { id = "c_default", text = "Poorly. They will not eat what grows here, and they drink only from the moonwell in the glade, which is still clean. I check their feathers every evening for the green taint, and so far I have found none." } },
      choices = {
        { text = "What happens if you do find it?", next = "corrupt_taint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupt_taint = {
      lines = { { id = "ct_default", text = "Then I would send the bird south to Ashenvale and pray to Elune the druids could cleanse it. I do not like to think about what happens if they can't." } },
      choices = {
        { text = "Elune will watch over them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to put a sick bird down quickly.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Part of Ashenvale, green and quiet and full of life. Then the demons came in the war and poisoned it to the roots, and now the wolves are mad and the trees are sick, and the water burns." },
        { id = "b_nelf", when = { race = "NightElf" }, text = "You remember, surely, or your elders do: it was Ashenvale, green and quiet. The demons poisoned it to the roots in the war, and every flight over it reminds me of what we lost." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I have kept hippogryphs for the Sentinels for a long time, and I go where they are needed. That is enough to know." } },
    advice = { { id = "tp_ad", text = "Drink nothing in Felwood that does not come from a clean moonwell, no matter how thirsty you are." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids of the Emerald Circle are trying to heal this forest. I pray they have more patience than I do." } },
    _none = { { id = "tp_none", text = "I cannot help you with that. My knowledge is of birds and of sky." } },
  },
}

P:NPC {
  key = "brakkar", id = TODO_NPC("Brakkar"), name = "Brakkar", title = "Wind Rider Master",
  bible = "bibles/felwood.md", role = "flightmaster", tier = "service",
  communities = { "bloodvenom_post" }, temper = { "gruff" }, values = { "dutiful", "honor" },
  notices = { "race" },

  impression = {
    first = "Brakkar keeps the wind riders at Bloodvenom Post and has no patience for this forest or anything that crawls out of it. He talks about his beasts with more warmth than he shows any person.",
    third = "{name} met Brakkar, the orc wind rider master at Bloodvenom Post.",
  },

  greetings = {
    { id = "g_default", text = "You want a wind rider? Good, because nobody should stay in this cursed forest a moment longer than they must." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "No wind rider for you, Alliance. Your elves keep their birds at Talonbranch Glade, away to the northeast, and you can walk there." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. Don't let this place get into your head; the green fire here is the same that once burned in our own blood, and we're done with it." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's what Gul'dan's people said, and the Horde paid for it with its whole spirit until Thrall pulled us out. I'll fly you where you need to go, but you'll not summon anything on my landing, and that's not a request." } },
      choices = {
        { text = "You're right. We must never wear those chains again.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thrall's way is slow. Power wins wars.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "No summoning on the landing, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a goblin from who knows where tried to walk off with a saddle, and my best beast nearly took his arm for it. The riders know their handlers, so thieves get bitten long before they get far, and I let them." } },
      choices = {
        { text = "A thief who gets bitten deserves it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Poor fool. Everyone's got to eat.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep my hands off the saddles.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Warlock. We drank the demon's blood once and it nearly finished us, so don't expect me to smile when I see that green light in your hands." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Hm, a rogue, and I didn't hear you come up the path, which is more than I can say for the satyrs. Want a ride, or did you just want to prove you could sneak up on an old orc?" },
        { id = "h_default", key = true,
          text = "Brakkar, wind rider master at Bloodvenom Post. My beasts fly to Splintertree Post, to Everlook in the snows and to Valormok, and from there to anywhere the Horde can reach, so tell me where you're going and let's be done." },
      },
      again = {
        { id = "h_again", text = "What else? The beasts are waiting." },
        { id = "h_again2", text = "Speak. I've time, but not much patience." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why keep a post in this forest at all?", next = "post" },
        { text = "How do your wind riders stand it here?", next = "riders" },
        { text = "The power's the same. What matters is who holds the leash.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does anyone try to steal your wind riders?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    post = {
      lines = { { id = "p_default", text = "Because the demons' leavings are still in this forest, and Orgrimmar wants eyes on them. Trull Failbane does the watching, and I make sure he can get word home quickly when he sees something." } },
      choices = {
        { text = "What does Trull watch for?", next = "post_trull" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_trull = {
      lines = { { id = "pt_default", text = "Ask him yourself; he doesn't share his business with me, and I don't ask. But I've flown his messages home, and they weren't short." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    riders = {
      lines = { { id = "r_default", text = "They hate it. They won't land outside the post and they won't touch the water, so I carry their drink up from the clean stream by hand, every morning. A wind rider deserves better than poison." } },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're beasts. They'll drink what they're given.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I fly wind riders for the Horde. Where I came from and what I did before is my business." } },
    advice = { { id = "tp_ad", text = "Don't sleep under the trees in Felwood. Sleep at the post, or don't sleep at all." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who isn't busy." } },
  },
}

P:NPC {
  key = "bale", id = TODO_NPC("Bale"), name = "Bale", title = "General Goods",
  bible = "bibles/felwood.md", role = "vendor", tier = "service",
  communities = { "bloodvenom_post" }, temper = { "calm" }, values = { "nature", "kind" },
  notices = { "race" },

  impression = {
    first = "Bale sells general goods at Bloodvenom Post, from water skins to bread, and he grieves quietly for the land around it. He is slow to speak and careful with his words, like a tauren who has seen a lot of bad soil.",
    third = "{name} met Bale, the tauren who sells general goods at Bloodvenom Post.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, traveler. I have clean water and bread that did not grow in this forest, and that is the best thing I can offer you here." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother keep you, child of the plains. It hurts, doesn't it, walking on land that's been poisoned like this? Sit with me a moment if you need to." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I sell bread and water to anyone of the Horde who is hungry, and a warlock gets as hungry as anyone. What I cannot do is tell you the earth here forgives, because it does not, and I would not want you to learn that the hard way." } },
      choices = {
        { text = "I'll respect this land. It has suffered enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The earth doesn't get a say in what I do.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll take the bread, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The druids at the Emerald Sanctuary are trying, but every spring here drinks from the same poisoned ground, so I haul barrels up the road from Ashenvale instead. If a mage knew a spell to make the water clean, I would trade all my stock to learn it." } },
      choices = {
        { text = "Patience will heal this land, as the druids say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cleanse it all at once with fire, if need be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll leave the hauling to you.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "You are a warlock, I think; the land shivers a little where you stand, as it does in the hollows of Jaedenar. I do not judge you, but I would ask you to tread gently here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage of the Horde, and far from any city. Could you keep my water cold with a spell, I wonder, or is that a foolish question to ask someone who studies the arcane?" },
        { id = "h_default", key = true,
          text = "I am Bale, and I keep the general goods at Bloodvenom Post. Water, food, thread and tools, all of it brought in from outside, because nothing that grows in Felwood is fit to eat." },
      },
      again = {
        { id = "h_again", text = "Is there something more I can find for you on these shelves, friend?" },
        { id = "h_again2", text = "Take your time. There's no hurry in my corner." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Nothing here is fit to eat?", next = "food" },
        { text = "Why is a tauren out here?", next = "why" },
        { text = "You'd sell goods to a warlock, knowing what fel did here?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why carry all the water in? Can't the springs be cleansed?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Nothing. The fruit is bitter and the animals are mad, and even the water in the river runs green with venom; that's why we call this place Bloodvenom. Everything I sell came in on a wind rider's back." } },
      choices = {
        { text = "Can the land ever heal?", next = "food_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_heal = {
      lines = { { id = "fh_default", text = "The druids at the Emerald Sanctuary believe it can, and I want to believe them. The Earth Mother is patient, and she has healed worse wounds than this, though I do not know of any." } },
      choices = {
        { text = "With enough care, it will heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some land is lost for good.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Horde needed someone to keep the stores, and an orc would rather be fighting than counting bread. I don't mind the counting, but I do mind the forest." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell bread and water to tired people. There isn't much more to say than that, and I prefer it that way." } },
    advice = { { id = "tp_ad", text = "Buy more water than you think you need, because you can't refill it anywhere in Felwood." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids at the Emerald Sanctuary want to heal the forest, and I wish them all the strength the Earth Mother can give." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, but I don't know anything about that." } },
  },
}
