-- Two tauren on the Barrens coast south of Ratchet: Islen Waterseer, who teaches young shaman
-- the purity of water, and Mahren Skyseer, Jorn's sister, who hunts Isha Awak. Voices: bibles/south_coast_seers.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Islen Waterseer: shaman of water, alone by her fishing hut.
---------------------------------------------------------------------------
P:NPC {
  key = "islen", id = TODO_NPC("Islen Waterseer"), name = "Islen Waterseer",
  bible = "bibles/south_coast_seers.md", role = "questgiver", tier = "quest",
  temper = { "calm", "warm" }, values = { "honest", "loyal" },
  notices = { "class", "kit" },
  impression = {
    first = "Islen Waterseer keeps a fishing hut on the Barrens shore south of Ratchet, a powerful old shaman whose bond with the spirits of water is spoken of as far as Thunder Bluff. She is gentle and unhurried, and she seems entirely unafraid of the human patrols that pass along her beach.",
    third = "{name} met Islen Waterseer, a tauren shaman of water who lives by the sea on the Barrens coast.",
  },

  greetings = {
    { id = "g_hi", text = "Come and sit by the water, {class}. The tide is turning, and it's a good hour for talking." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "I felt you coming along the shore, little one. The water always tells me when a shaman is near." },
    { id = "g_felwood", when = { questActive = TODO_QUEST("Seeking Spiritual Aid") }, text = "You carry water from a moonwell, and it is sick. Greta sent you, didn't she? Give it to me gently." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You're battered, {class}, and salt water will sting those cuts. Wash them anyway, because it heals as well as it hurts." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and you smell of the moonwells. Greta Mosshoof is an old friend of mine, if you've walked in Felwood." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Islen Waterseer, and I listen to the spirits of water, which is a slower conversation than most people have patience for. I live out here because the sea is the oldest voice in Kalimdor, and the Barrens are very dry." },
        { id = "h_call", when = { class = "SHAMAN", questActive = TODO_QUEST("Call of Water") },
          text = "Xanis sent you, or Searn, and either way it is time you learned about water. Water means rebirth, little one, but only when it is pure, and polluted water can devastate everything it touches." },
        { id = "h_totem", when = { class = "SHAMAN", questDone = TODO_QUEST("Call of Water") },
          text = "You carry your water totem now, and you've seen what corruption does to a sacred pool. Pure water gives life back to those who are dying, so use it well." },
      },
      again = {
        { id = "h_again", text = "Is there more on your mind? The tide has time, and so do I." },
        { id = "h_again2", text = "Go on, I'm listening, and so is the sea." },
      },
      choices = {
        { text = "What does water teach a shaman?", next = "water" },
        { text = "Aren't you afraid out here, among the humans?", next = "humans" },
        { text = "Who is Brine?", next = "brine", when = { class = "SHAMAN" } },
        { text = "Can you cleanse Felwood's water?", next = "felwood", when = { questActive = TODO_QUEST("Seeking Spiritual Aid") } },
        { text = "How do you know Xanis Flameweaver?", next = "xanis" },
        { text = "I'll leave you to the tide.", next = "END" },
      },
    },
    water = {
      lines = { { id = "wa_default", text = "That it flows, it erodes, and it makes clean all manner of things, and that its power to heal and replenish has no equal. Learn that water poisoned can ruin a land, and you'll understand why it must be guarded." } },
      choices = {
        { text = "Guarded from whom?", next = "purity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purity = {
      big = true,
      lines = { { id = "pu_default", text = "From the plague in the north, from the fel in Felwood, and from those who dump their wastes in rivers because rivers carry them away. Some shaman say we must cleanse what others foul, and others say we must punish those who foul it, and I've never been sure which." } },
      choices = {
        { text = "Cleanse it and teach them. Punishment fixes nothing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Those who poison the water should pay for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "The soldiers from Northwatch walk my beach sometimes, and they look at my hut, and they walk on. I've never given them reason to stop, and the sea would not like it if they did." } },
      choices = { { text = "Something else, Islen.", next = "BACK" } },
    },
    brine = {
      lines = { { id = "br_default", text = "Brine lives deep in the southern Barrens, alone, with the quilboar all around her and no protection but what she makes. She'll ask you why you've come, and you'd do well to have an honest answer." } },
      choices = {
        { text = "And after Brine?", next = "silverpine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silverpine = {
      lines = { { id = "si_default", text = "There's a shrine on the Silverpine coast, west of the Sepulcher, where the plague has tainted the pool and the spirits there no longer speak to our people. You'll take Brine's water and set it right, and then you'll bring me the proof." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    felwood = {
      lines = { { id = "fe_default", text = "It is not for me to decide if this water will be made pure, only to ask the spirits of water and let them judge whether the cause is just. Stopping the malice in Felwood seems noble enough, so give me a moment, and we'll hear what they say." } },
      choices = { { text = "Something else, Islen.", next = "BACK" } },
    },
    xanis = {
      lines = { { id = "xa_default", text = "Xanis and I sat by the same fire as children, before the tauren had a bluff to call home. He went up to the Spirit Rise to teach, and I came down to the sea to listen, and we both think the other chose wrongly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born on the plains of Mulgore, and I followed the rivers until they reached the sea, and then I stopped." } },
    advice = { { id = "tp_ad", text = "Drink only from running water in the Barrens, {class}. The oases are sick, and they'll make you sick too." } },
    _none = { { id = "tp_none", text = "The sea hasn't spoken to me of that, and I won't guess." } },
  },
}

---------------------------------------------------------------------------
-- Mahren Skyseer: Jorn's sister, hunter of the great beasts of the sea.
---------------------------------------------------------------------------
P:NPC {
  key = "mahren", id = TODO_NPC("Mahren Skyseer"), name = "Mahren Skyseer",
  bible = "bibles/south_coast_seers.md", role = "questgiver", tier = "quest",
  temper = { "calm", "proud" }, values = { "honest", "brave" },
  notices = { "class", "pet" },
  impression = {
    first = "Mahren Skyseer camps beside Islen Waterseer on the Barrens coast and hunts the great beasts of the sea. She is Jorn Skyseer's sister, and she speaks of her prey with a reverence that borders on love.",
    third = "{name} met Mahren Skyseer, a tauren hunter of sea beasts and sister of Jorn Skyseer.",
  },

  greetings = {
    { id = "g_hi", text = "Quiet, {class}. Look at the water, there, past the rocks, and tell me what you see." },
    { id = "g_jorn", when = { questActive = TODO_QUEST("Mahren Skyseer") }, text = "My brother sent you, did he? Then you've earned Jorn's respect, and you have mine as well." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "{pet} keeps staring at the sea. Clever beast, it knows what's out there better than you do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mahren Skyseer, and I hunt where the land ends and the deep water begins. My brother Jorn teaches the hunters of the Crossroads, and I teach the few who are willing to get wet." },
        { id = "h_hunter", when = { class = "HUNTER", questDone = TODO_QUEST("Mahren Skyseer") },
          text = "A true hunter can stalk prey down any path, and mountains and swamps don't sway one, and neither does the sea. Are you ready to tread farther down the hunter's path?" },
        { id = "h_heart", when = { questDone = TODO_QUEST("Isha Awak") },
          text = "Isha Awak's heart beat for you, and now something of him stays with you. I can see him behind your eyes, and one day, if you're patient, they'll learn to see as he did." },
      },
      again = {
        { id = "h_again", text = "Ask, but keep your voice low. The sea carries sound." },
        { id = "h_again2", text = "What else, {class}? The tide is patient." },
      },
      choices = {
        { text = "Who is Isha Awak?", next = "isha" },
        { text = "Tell me about your brother.", next = "jorn" },
        { text = "How does anyone hunt in the sea?", next = "sea" },
        { text = "What does it mean, to learn to see?", next = "see", when = { questDone = TODO_QUEST("Isha Awak") } },
        { text = "I'll leave you to watch the water.", next = "END" },
      },
    },
    isha = {
      lines = { { id = "is_default", text = "Isha Awak, the Deep Doom, the great beast who is lord of these waters, and strong, and solemnly proud. The humans on the coast fear him, because he has eaten many of them, but I'm grateful that he's here." } },
      choices = {
        { text = "Grateful? He's a man-eater.", next = "prey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prey = {
      big = true,
      lines = { { id = "pr_default", text = "He's a worthy challenge and honourable prey, and a hunter is lucky to live in the same waters as such a creature. His spirit dwells in his heart, and to hear its beat is to know your fate, so whoever hunts him must hunt him with respect." } },
      choices = {
        { text = "I'll hunt him for the honour of it, as you say.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A beast is a beast. I'll hunt him for his heart.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jorn = {
      lines = { { id = "jo_default", text = "Jorn sends me those who've hunted the beasts of the Barrens, because he says a hunter must be prepared for every path. He prefers solid ground under his hooves, and I've never once seen him swim." } },
      choices = { { text = "Something else, Mahren.", next = "BACK" } },
    },
    sea = {
      lines = { { id = "se_default", text = "Patiently, and with a long spear, and with the sea's salt stinging your nose. You learn the tides the way you'd learn a herd's paths, and you wait for the beast to come to the shallows." } },
      choices = {
        { text = "And the humans on this coast?", next = "humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "The coast is held by humans from Northwatch, so be wary when you look for the deep water. They fear Isha Awak more than they fear me, which is wise of them, though not very flattering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    see = {
      lines = { { id = "sa_default", text = "It means you'll find, one day, that you know where a beast will be before it knows itself. Isha Awak lived his whole life knowing that, and now some of it lives in you." } },
      choices = { { text = "Something else, Mahren.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Jorn and I were raised by a hunter who taught us both, and we each went where our prey led us." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the sea, {class}. It has never once turned its back on you." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Jorn, he likes answering questions more than I do." } },
  },
}
