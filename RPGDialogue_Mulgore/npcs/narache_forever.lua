-- Camp Narache's Forever-only teachers: Karne Grayhoof, who helps young tauren choose a trade,
-- and the junior trainers of herbs (Garan Sunstrider), skinning (Nawka Wildsong) and mining
-- (Vartha Rockmane). Voices: bibles/narache_forever.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC = P.TODO_NPC

-- Karne Grayhoof: Camp Narache's profession guide.
P:NPC {
  key = "karne", id = TODO_NPC("Karne Grayhoof"), name = "Karne Grayhoof",
  bible = "bibles/narache_forever.md", role = "citizen", tier = "service",
  communities = { "narache" }, temper = { "warm" }, values = { "patient", "helpful" },
  notices = { "craft", "greenness" },
  impression = {
    first = "Karne Grayhoof is an old tauren at Camp Narache who helps the young ones choose a trade. He talks about crafts the way some elders talk about the seasons, as if each had its time.",
    third = "{name} met Karne Grayhoof, who guides the young tauren of Camp Narache toward a trade.",
  },
  greetings = {
    { id = "g_default", text = "Ah, {name}. Have you thought about taking up a trade? Sit, and let us talk about it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. A trade is not chosen in one morning, and I am glad you are taking your time." },
    { id = "g_gather", when = { any = { { profession = "Mining" }, { profession = "Skinning" }, { profession = "Herbalism" } } }, text = "You have begun to gather, I see. Now you must think about what your hands will make of it." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You are very new to the mesa, little one. Do not let the choice weigh on you, because a trade can always be changed, though it costs something to change it." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Karne Grayhoof, and I help the young of Narache find a trade. It can feel like a great deal at first, but you can always come back to me, or to the teachers in Thunder Bluff when you're older." },
        { id = "h_nontauren", when = { ["not"] = { race = "Tauren" } }, text = "A guest on Red Cloud Mesa, and far from home. The Earth Mother's gifts are the same here as anywhere, so let me tell you which of our teachers can show you how to use them." },
      },
      again = {
        { id = "h_again", text = "What else would you know, little one?" },
        { id = "h_again2", text = "Ask. There is no hurry on the mesa." },
      },
      choices = {
        { text = "What are professions?", next = "what" },
        { text = "How many trades can I learn?", next = "many" },
        { text = "Who teaches here in Narache?", next = "who" },
        { text = "Are you related to Mor Grayhoof?", next = "mor" },
        { text = "Show me the way to a trainer.", next = "BUSINESS" },
        { text = "Thank you, elder.", next = "END" },
      },
    },
    what = {
      lines = {
        { id = "w_default", text = "Skills for making, gathering and surviving, little one. One tauren digs the ore and another shapes it, one picks the herbs and another brews them, and once you learn a recipe you may make it as often as you have what it needs." },
      },
      choices = {
        { text = "And how do I choose?", next = "choose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = {
        { id = "c_default", text = "Choose what gives you peace in the doing, because you will do it a great many times. Some are happiest out on the plains, and others at the fire with their hands busy, and only you know which you are." },
      },
      choices = {
        { text = "Choose what helps the tribe most, not what pleases you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Choose what calls to you. The tribe will benefit anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    many = {
      lines = {
        { id = "m_default", text = "Two of the great trades at a time, and no more, because each asks a lifetime. If you leave one you lose what you learned, but cooking, fishing and first aid you may learn all together, for they keep a body alive." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Garan Sunstrider teaches the herbs, Nawka Wildsong the skinning, and Vartha Rockmane the mining, all here at the camp. The rest you will find in Bloodhoof Village and in Thunder Bluff, and I can show you the way to any of them." },
      },
      choices = {
        { text = "What are they like?", next = "like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    like = {
      lines = {
        { id = "l_default", text = "Garan is gentle and talks to his plants, Nawka is quick and fierce and wastes nothing, and Vartha is as steady as the rock she cuts. Each of them is a good teacher, if you are willing to listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go and see them.", next = "END" },
      },
    },
    mor = {
      lines = {
        { id = "mo_default", text = "Many ask, little one, and I will say only that the Grayhoof name is an old one, and there are a great many of us on the plains. I am no hero, and I am content to sit here and help the young find their way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have tried my hooves at many trades, and mastered few. That is why I am good at advising." } },
    advice = { { id = "tp_ad", text = "Pair a gathering trade with a making trade, and they will feed each other." } },
    _none = { { id = "tp_none", text = "That is beyond me, little one. Ask Chief Hawkwind; he knows the wider world." } },
  },
}

-- Garan Sunstrider: junior herbalism trainer at Camp Narache.
P:NPC {
  key = "garan", id = TODO_NPC("Garan Sunstrider"), name = "Garan Sunstrider", title = "Junior Herbalism Trainer",
  bible = "bibles/narache_forever.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "gentle" }, values = { "nature", "patient" },
  notices = { "craft", "class" },
  impression = {
    first = "Garan Sunstrider teaches herbs at Camp Narache and talks to the plants as he picks them. He believes every leaf is a gift of the Earth Mother and should be taken with thanks.",
    third = "{name} met Garan Sunstrider, the gentle junior herbalism trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "Peace, friend. The Earth Mother has been generous this season; come and see." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You smell of earthroot. You've been digging, then, and listening." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism", min = 50 } },
      text = "Your satchel is full and your hands are careful. You have learned to take only what the plant can spare, and I am glad." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you know the green things listen, and perhaps you hear them answer more clearly than I do." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Garan Sunstrider, and I teach the gathering of herbs. Everything that grows on Red Cloud Mesa is a gift of the Earth Mother, and a gift should be taken with care and thanks." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask what you like. The plants are patient, and so am I." },
      },
      choices = {
        { text = "What grows on the mesa?", next = "herbs" },
        { text = "Do you really talk to the plants?", next = "talk" },
        { text = "Why take them with thanks?", next = "thanks" },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Peace, Garan.", next = "END" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf in the open grass, and earthroot in the soft ground where it holds its water. Further down, in the plains around Bloodhoof, you will find mageroyal, and the herbs grow richer the further you walk." },
      },
      choices = {
        { text = "What are they used for?", next = "uses" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uses = {
      lines = {
        { id = "us_default", text = "Salves for the braves who come back from the quilboar with scratches, and potions for the alchemists in Thunder Bluff. Peacebloom and silverleaf together make a fine healing draught, if the hand that mixes them is patient." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    druids = {
      lines = {
        { id = "dr_default", text = "When they pass through, they do, and I listen hard. Most of them live up on Elder Rise in Thunder Bluff now, close to the sky, and they come down to the plains only when the land calls them." },
        { id = "dr_druid", when = { class = "DRUID" }, text = "When they pass through, and today one has, I think. Tell me, when you take the shape of the bear, do the herbs smell different to you?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    talk = {
      lines = {
        { id = "ta_default", text = "I do, and they say very little back, but I find it makes me gentler with my hands. The druids say all living things listen, and I would rather be polite to a peacebloom than rude to one." },
      },
      choices = {
        { text = "Do the druids teach you?", next = "druids" },
        { text = "That's very kind of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks = {
      big = true,
      lines = {
        { id = "th_default", text = "Because the land gives, and if you take too much it stops giving. My grandmother took only one in three, and left the rest to seed, so that there would be more the next spring." },
      },
      choices = {
        { text = "Take only what you need, and the land provides.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The land is wide. Take what you can carry.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have walked these plains picking herbs since I was a calf. There is no other story worth telling." } },
    advice = { { id = "tp_ad", text = "Leave the smallest plants to grow. Next season they will thank you." } },
    _none = { { id = "tp_none", text = "I do not know, friend. I know leaves and roots, and little else." } },
  },
}

-- Nawka Wildsong: junior skinning trainer at Camp Narache.
P:NPC {
  key = "nawka", id = TODO_NPC("Nawka Wildsong"), name = "Nawka Wildsong", title = "Junior Skinning Trainer",
  bible = "bibles/narache_forever.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "fierce" }, values = { "respect", "practical" },
  notices = { "craft", "pet" },
  impression = {
    first = "Nawka Wildsong teaches skinning at Camp Narache, quick-handed and fierce, and she will not waste any part of a kill. She thanks every beast she skins and expects her students to do the same.",
    third = "{name} met Nawka Wildsong, the junior skinning trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "Care to learn how to take a hide from a beast properly? Or have you come for tools?" },
    { id = "g_skin", when = { profession = "Skinning" }, text = "You've been working. Did you thank them before you cut, as I taught you?" },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { name = "Skinning", min = 50 } },
      text = "Clean cuts, and whole hides. You have become good at this, and I am proud of you." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} watches my knife very closely, hunter. Tell it that I only skin the ones who've passed on." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Nawka Wildsong. I teach the young ones to take a hide cleanly and to waste nothing of the beast. A creature that dies to feed us deserves that much respect from us." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc on the mesa. Your people are good hunters, I'm told, but wasteful, and here we waste nothing, so mind that while you learn." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, the hides are drying." },
        { id = "h_again2", text = "Ask, I'm listening." },
      },
      choices = {
        { text = "What should I skin around here?", next = "beasts" },
        { text = "What do you mean, waste nothing?", next = "waste" },
        { text = "Do you thank the beasts?", next = "thank" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "Not now, Nawka.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "Plainstriders and prairie wolves on the mesa, and the cougars in the hills, if you are brave enough. The battleboars of the Bristleback have tough hides too, but they bite back harder than you'd think." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      lines = {
        { id = "w_default", text = "The hide for leather, the meat for the fire, the bones for tools and the sinew for thread. What is left goes back to the earth, and the Earth Mother takes it gladly, so nothing is lost." },
      },
      choices = {
        { text = "Seems a lot of work for a wolf.", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      big = true,
      lines = {
        { id = "wk_default", text = "It is work, and it is respect. The wolf gave everything it had, so the least we can do is use everything it gave." },
      },
      choices = {
        { text = "You're right. Every part honors the beast.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A dead wolf doesn't care. Take the hide and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thank = {
      lines = {
        { id = "t_default", text = "Every time, and quietly, before the first cut. It's a short thing, a few words, but it reminds me what I'm holding, and I teach every student to say them." },
      },
      choices = {
        { text = "What do you say?", next = "words" },
        { text = "Something else.", next = "BACK" },
      },
    },
    words = {
      lines = {
        { id = "wd_default", text = "Only that I am grateful, and that its hide will keep someone warm. You may say what you like, little one, so long as you mean it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted with my mother on the plains, and she taught me to waste nothing. I teach the same." } },
    advice = { { id = "tp_ad", text = "Thank the beast before you cut. It makes your hands steadier." } },
    _none = { { id = "tp_none", text = "Ask Karne, he likes questions. I'm busy." } },
  },
}

-- Vartha Rockmane: junior mining trainer at Camp Narache.
P:NPC {
  key = "vartha", id = TODO_NPC("Vartha Rockmane"), name = "Vartha Rockmane", title = "Junior Mining Trainer",
  bible = "bibles/narache_forever.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "steady" }, values = { "patient", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Vartha Rockmane teaches mining at Camp Narache, slow-spoken and steady as stone. She asks the Earth Mother's leave before she breaks the rock and expects her students to do the same.",
    third = "{name} met Vartha Rockmane, the junior mining trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "How can I help you?" },
    { id = "g_mine", when = { profession = "Mining" }, text = "There is stone dust on your hands, so you have been working. Good." },
  },
  notice = {
    { id = "n_mine", cat = "craft", when = { profession = { name = "Mining", min = 50 } },
      text = "Your hands have hardened, and your swing is steadier. The stone has been teaching you, I see." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, here on the mesa. Your bones will not tire, I suppose, but be careful, because the earth does not forgive brittleness." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Vartha Rockmane, and I teach the young ones to take ore from the earth. It is hard work and slow work, and I find it suits a tauren very well." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. The stone will wait." },
      },
      choices = {
        { text = "Where is the ore near Narache?", next = "ore" },
        { text = "Do tauren mine much?", next = "tauren" },
        { text = "Why does mining suit a tauren?", next = "suit" },
        { text = "Does the Earth Mother mind?", next = "mind" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "Not today, Vartha.", next = "END" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Copper, in the cliff walls of the mesa and in the hills around it, where the stone shows green. Further out on the plains you'll find more, and tin too, once your arm is strong enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "t_default", text = "Less than the dwarves, I am told, and we do not dig deep into the earth as they do. We take what the land shows us near the surface, and we leave the deep places alone." },
      },
      choices = {
        { text = "Why leave the deep places?", next = "deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deep = {
      lines = {
        { id = "d_default", text = "Because the Earth Mother keeps her own counsel down there, and we are her guests. The dwarves dig until they find things they wish they had not found, and I would rather not." },
      },
      choices = {
        { text = "Are there dwarves digging in Mulgore?", next = "baeldun" },
        { text = "Something else.", next = "BACK" },
      },
    },
    suit = {
      lines = {
        { id = "su_default", text = "Because it asks for strength and patience, and a tauren has plenty of both. The stone does not care how quick you are, only how long you keep swinging." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    baeldun = {
      lines = {
        { id = "bd_default", text = "At Bael'dun, to the west of Bloodhoof, where the Bael'dun dwarves tear at the earth looking for something they will not name. Our braves watch them, and I do not like what I hear of their digging." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mind = {
      big = true,
      lines = {
        { id = "m_default", text = "I ask her leave before I swing, and I take only what I need. I think she does not mind a careful hand, though I have never heard her say so. What do you think?" },
      },
      choices = {
        { text = "Asking is right. Respect the earth and it provides.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The earth is stone. Strike it and take what's there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family has cut stone on the mesa for generations. I am only the latest." } },
    advice = { { id = "tp_ad", text = "Swing slow and steady. The stone is in no hurry, and neither should you be." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Karne; he enjoys questions more than I do." } },
  },
}
