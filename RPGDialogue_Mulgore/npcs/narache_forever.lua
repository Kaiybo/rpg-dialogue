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
    first = "He talks about crafts as if each had its season.",
    third = "{name} met Karne Grayhoof, who guides the young tauren of Camp Narache toward a trade.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, {name}, my friend. Sit, and let me tell you about the trades. You'd be good at any of them." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ah, {name}. Have you thought about a trade? It might do you good to learn some patience." },
    { id = "g_default", text = "Ah, {name}. Have you thought about taking up a trade? Sit, and let us talk about it." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and I am glad, because a trade is not chosen in one morning. Take all the time you need." },
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
        { id = "h_default", key = true, text = "I am Karne Grayhoof, and I help the young of Narache find a trade. It can feel like a lot at first, but you can always come back to me, or to the teachers in Thunder Bluff when you're older." },
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
        { text = "Narache feels like a camp built to be left.", next = "narache" },
        { text = "Which trades does the tribe need most?", next = "need" },
        { text = "Can a druid take up a trade as well?", next = "druid_trade", when = { class = "DRUID" } },
        { text = "What trade did you follow, before you guided others?", next = "w7_own" },
        { text = "Thank you, elder.", next = "END" },
      },
    },
    w7_own = {
      lines = {
        { id = "w7_own_l1", text = "Leather, little one, for forty winters, until my hands began to ache in the cold and the needle would not obey them. Now I teach the young to choose, and I find it is the better work, though I miss the smell of a fresh hide." },
      },
      choices = {
        { text = "Do you regret giving it up?", next = "w7_own2" },
        { text = "You should still keep a hand in.", next = "w7_own3" },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    w7_own2 = {
      lines = {
        { id = "w7_own2_l1", text = "No, for a trade is like a long walk across the plains: there comes a place where you sit down and let the young go on ahead. I sit here, and I point, and every one of them is a little of the work I can no longer do." },
        { id = "w7_own2_l2", when = { race = "Tauren" }, text = "No. Our grandmothers said a tauren lives three lives: the calf who learns, the hunter who does, and the elder who points the way. I am in my third life now, and it is not the least of them." },
      },
      choices = {
        { text = "That's a fine way to see it.", next = "BACK", reply = "It is the only way that lets an old bull sleep at night." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_own3 = {
      lines = {
        { id = "w7_own3_l1", text = "I mend my own boots, and Chaw Stronghide in Bloodhoof sends me a scrap now and then to keep my fingers honest. That is enough hand for me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    narache = {
      lines = { { id = "narache_d", text = "It is, little one, and that is no insult to it. Chief Hawkwind keeps it so that the young may learn to stand on their own hooves, and when Grull says they are ready, they walk down the road to Bloodhoof Village and do not often come back up." } },
      choices = {
        { text = "What waits for them in Bloodhoof?", next = "narache_down" },
        { text = "Leaving home is the first trial.", next = "BACK", reply = "It is, and the one nobody prepares you for. You have a wise head for one so young." },
        { text = "Something else.", next = "BACK" },
      },
    },
    narache_down = {
      lines = { { id = "narache_down_d", text = "Better teachers than I am, and more of them, in every craft the tribe keeps. There are skinners and leatherworkers among the tents there, and Innkeeper Kauth, who will tell you he has fed every brave in Mulgore." } },
      choices = {
        { text = "Then I'll go down hungry.", next = "BACK", reply = "Do, and tell him Karne sent you. He will feed you twice to spite me." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "need_d", text = "Skinning and leather, always, for the herds give us hides and the tribe needs them turned into everything from tents to shoes. Herbs are next, for the healers, and since the Horde came to us, there is more call for smiths than any tauren ever expected." } },
      choices = {
        { text = "Smiths? The tauren never needed them before.", next = "need_smiths" },
        { text = "Hides and herbs. The old ways endure.", next = "BACK", reply = "They do. The Earth Mother does not change her gifts because we change our friends." },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_smiths = {
      lines = { { id = "need_smiths_d", text = "We did not, little one, for a spear of stone and a harness of hide were enough against the centaur. Now our braves fight beside orcs in far lands, and they come home asking for iron, so the young who take up the hammer will never want for work." } },
      choices = {
        { text = "Then perhaps I'll take up the hammer.", next = "BACK", reply = "Perhaps. Ask in Thunder Bluff when you are older, and feel the weight first." },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    druid_trade = {
      lines = { { id = "druid_trade_d", text = "A druid more than anyone, for who better knows the herbs that grow and the hides the beasts give? The old druids say that a healer who cannot gather her own leaves has only learned half her path." } },
      choices = {
        { text = "Then I'll learn both halves.", next = "BACK", reply = "That is the spirit of the Earth Mother speaking, little one. Go well." },
        { text = "Something else.", next = "BACK" },
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
        { text = "Choose whatever the tribe needs. What I want matters less.", next = "BACK", reply = "That is an old answer, and a good one, though a tired heart serves the tribe poorly. Find the work the tribe needs that you can also love, and you will do it well for many years.", fx = { align = { order = 1 } } },
        { text = "Choose what calls to you. The tribe will benefit anyway.", next = "BACK", reply = "I think so too, young one. A tauren who loves her work does it with care, and care is what the tribe needs most.", fx = { align = { order = -1 } } },
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
    first = "He talks to the plants as he picks them.",
    third = "{name} met Garan Sunstrider, the gentle junior herbalism trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Peace, friend. The Earth Mother has been generous, and I'm glad to share her gifts with you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Peace. The Earth Mother gives to all. I teach because she asks it, not because I wish it." },
    { id = "g_default", text = "Peace, friend. The Earth Mother has been generous this season; come and see." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You smell of earthroot. You've been digging, then, and listening." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The silverleaf has come on nicely since you were last here." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You stepped around the peacebloom without looking down. Someone raised you well." },
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
        { id = "h_again3", text = "Yes, friend? Mind the seedlings by your hoof." },
        { id = "h_again", text = "What else, friend? Speak gently; the silverleaf by the tent pole has only just decided to bloom." },
        { id = "h_again2", text = "Ask what you like. The plants are patient, and so am I." },
      },
      choices = {
        { text = "What grows on the mesa?", next = "herbs" },
        { text = "Do you really talk to the plants?", next = "talk" },
        { text = "Why take them with thanks?", next = "thanks" },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Who else teaches the young ones here?", next = "others" },
        { text = "The quilboar must trample what you tend.", next = "bristle" },
        { text = "I brew potions from what I pick.", next = "brew", when = { profession = "Alchemy" } },
        { text = "My grandmother picked herbs the same way.", next = "gran", when = { race = "Tauren" } },
        { text = "What is the hardest herb to find on the mesa?", next = "w7_rare" },
        { text = "Peace, Garan.", next = "END" },
      },
    },
    w7_rare = {
      lines = {
        { id = "w7_rare_l1", text = "Earthroot, which hides under the stones on the windward side of Red Cloud Mesa and only shows a single leaf above the ground. The young ones walk past it every day and never see it, and I let them, until they learn to look down." },
      },
      choices = {
        { text = "How do you spot it?", next = "w7_rare2" },
        { text = "Why not just tell them where it grows?", next = "w7_rare3" },
        { text = "Something else, Garan.", next = "BACK" },
      },
    },
    w7_rare2 = {
      lines = {
        { id = "w7_rare2_l1", text = "By the stone, more than the leaf. Earthroot likes a flat grey stone with a little shade on the north side, and when you have found one, you lift it slowly, and say thank you to whatever was living under it." },
        { id = "w7_rare2_l2", when = { profession = "Herbalism" }, text = "By the stone, as you will learn. A flat grey stone with shade on the north side, lifted slowly. Take one root in three, and leave the smallest, so the plant can find its way back to the light." },
      },
      choices = {
        { text = "I'll look under the stones.", next = "BACK", reply = "And thank them, friend. The stones have kept a secret for you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_rare3 = {
      lines = {
        { id = "w7_rare3_l1", text = "Because a gatherer who is told where everything grows learns nothing about the land. One who searches learns its every fold, and is never lost on it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
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
        { text = "Take only what you need, and the land provides.", next = "BACK", reply = "My grandmother would have liked you. Leave the rest to seed, and you will be gathering here when you are as old as she was.", fx = { align = { order = 1 } } },
        { text = "The land is wide. Take what you can carry.", next = "BACK", reply = "It is wide, and still it has edges, as my grandmother learned when the near hills went bare. Carry what you need, and let the land keep the rest.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_d", text = "Nawka Wildsong teaches the skinning knife and Vartha Rockmane the pick, and between the three of us a calf can learn to live from the land. Nawka says I am too soft with my plants, and Vartha says nothing at all, which from her is agreement." },
      },
      choices = {
        { text = "And who uses what you gather?", next = "others_moodan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_moodan = {
      lines = {
        { id = "others_moodan_d", text = "Moodan Sungrain takes my wild herbs for his loaves, and Seer Graytongue burns the dried earthroot when he speaks with the spirits. The rest goes down to Bloodhoof by the bundle, where the healers are always short." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bristle = {
      lines = {
        { id = "bristle_d", text = "They do, and worse than that, their brambles follow them. Where the Bristleback camp for a season, the thorn vines come up thick and choke everything gentle, and I have lost a whole bed of peacebloom below the ravine to them." },
      },
      choices = {
        { text = "Can the thorns be cleared?", next = "bristle_thorn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bristle_thorn = {
      big = true,
      lines = {
        { id = "bristle_thorn_d", text = "They can be cut, but they come back, and I do not like to hate a plant for growing where it was sown. The thorns did not choose the quilboar any more than the peacebloom chose me." },
      },
      choices = {
        { text = "Even a thorn is the Earth Mother's.", next = "BACK", reply = "That is what I tell myself when I am picking them out of my hands. Thank you for saying it aloud.", fx = { align = { light = 1 } } },
        { text = "Burn them out. Your herbs matter more than their weeds.", next = "BACK", reply = "Fire on the mesa would take more than the brambles, friend. I will keep my knife and my patience.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = {
        { id = "brew_d", text = "Then you are the one I gather for, in a way. Tell the alchemists on the bluff that Bena Winterhoof still owes me a visit, and that the silverleaf she likes is at its best after rain." },
      },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gran = {
      lines = {
        { id = "gran_d", text = "Then she and mine would have got on well, and probably argued over the best patch. One in three, and thanks for each, and never the first you find; is that how she taught it?" },
      },
      choices = {
        { text = "Word for word.", next = "BACK", fx = { affinity = 1 } },
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
    first = "She thanks every beast she skins and expects the same of students.",
    third = "{name} met Nawka Wildsong, the junior skinning trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, a skinner worth teaching! Come, friend. I'll show you how to take a hide whole and clean." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Care to learn properly this time? Or have you come to waste another hide?" },
    { id = "g_default", text = "Care to learn how to take a hide from a beast properly? Or have you come for tools?" },
    { id = "g_skin", when = { profession = "Skinning" }, text = "You've been working. Did you thank them before you cut, as I taught you?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Show me your knife before you show me anything else." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry a hunter's patience in your shoulders. Good, because the skinning is no faster than the stalking, whatever the young ones think." },
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
        { id = "h_again3", text = "Speak while I scrape, because I can do both." },
        { id = "h_again", text = "What else? Quickly, the hides are drying." },
        { id = "h_again2", text = "Ask, I'm listening, though my eyes stay on this hide; a scraper that wanders makes a hole." },
      },
      choices = {
        { text = "What should I skin around here?", next = "beasts" },
        { text = "What do you mean, waste nothing?", next = "waste" },
        { text = "Do you thank the beasts?", next = "thank" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "Who sends you your students?", next = "students" },
        { text = "That knife has seen a great deal of work.", next = "knife" },
        { text = "My beast makes most of my kills.", next = "beast", when = { class = "HUNTER" } },
        { text = "I work the hides I take.", next = "lw", when = { profession = "Leatherworking" } },
        { text = "What happens to the hides once you've taken them?", next = "w7_hides" },
        { text = "Not now, Nawka.", next = "END" },
      },
    },
    w7_hides = {
      lines = {
        { id = "w7_hides_l1", text = "The best go down the road to Chaw Stronghide in Bloodhoof, and the rough ones stay here for Varia Hardhide's leathers. A few I keep, the ones from a beast that fought hard, to remind the students what they are cutting." },
      },
      choices = {
        { text = "Which beast fought the hardest?", next = "w7_hides2" },
        { text = "Keeping hides seems morbid.", next = "w7_hides3" },
        { text = "Something else, Nawka.", next = "BACK" },
      },
    },
    w7_hides2 = {
      lines = {
        { id = "w7_hides2_l1", text = "An old prairie wolf, grey to the muzzle, who held off three students for a whole afternoon to give its pack time to run. I took its hide myself, slowly, and hung it above my bench, and I tell every student its story." },
        { id = "w7_hides2_l2", when = { class = "HUNTER" }, text = "A grey old prairie wolf who stood against three students so its pack could flee. You know beasts; you know that kind of courage. I hung its hide above my bench, and every hunter I train hears of it." },
      },
      choices = {
        { text = "A brave beast.", next = "BACK", reply = "Braver than most braves I have met. Remember it, as they do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_hides3 = {
      lines = {
        { id = "w7_hides3_l1", text = "Not morbid. Honest. A skinner who forgets that the hide was once alive becomes careless, and carelessness wastes the gift." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "Plainstriders and prairie wolves on the mesa, and the cougars in the hills, if you are brave enough. The battleboars of the Bristleback have tough hides too, but they bite back hard enough to break a young hunter's spear." },
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
        { text = "You're right. Every part honors the beast.", next = "BACK", reply = "It does, and the wolf will rest easier for it. Come, I will show you how to take the sinew without spoiling the hide.", fx = { align = { light = 1 } } },
        { text = "A dead wolf doesn't care. Take the hide and move on.", next = "BACK", reply = "The wolf may not care, but the Earth Mother does, and so do I. Take the hide, then, but you will never learn the craft that way.", fx = { align = { light = -1 } } },
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
    students = {
      lines = {
        { id = "students_d", text = "Lanka Farshot sends me her hunters once they can hit what they aim at, because she says a hunter who cannot dress a kill has only done half the work. Grull Hawkwind sends the rest, usually with a carcass already going stiff." },
      },
      choices = {
        { text = "And the other junior trainers?", next = "students_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students_others = {
      lines = {
        { id = "students_others_d", text = "Garan Sunstrider talks to his flowers and Vartha Rockmane talks to her rocks, and I am the only one of us whose work ever tried to bite back. They are good neighbours, though, and Garan's salve has saved my fingers more than once." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    knife = {
      lines = {
        { id = "knife_d", text = "It has, and I sharpen it every evening whether I have used it or not. A dull knife tears the hide and shames the beast, and I would rather go hungry than do either." },
      },
      choices = {
        { text = "What do you say to a careless student?", next = "knife_careless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knife_careless = {
      big = true,
      lines = {
        { id = "knife_careless_d", text = "I make them carry the ruined hide to Chief Hawkwind and explain it to him themselves. He does not shout, he only looks at them, and I have never had to send the same calf twice." },
      },
      choices = {
        { text = "Shame teaches quickly.", next = "BACK", reply = "It does, and it leaves no scar on the hide. I will keep to my way.", fx = { align = { order = 1 } } },
        { text = "That's harsh for a calf's first mistake.", next = "BACK", reply = "The beast had only one life to give, little one. I think a calf can bear one long walk across the camp.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast = {
      lines = {
        { id = "beast_d", text = "Then teach it to kill cleanly, at the throat, and not to worry the body afterward. A hide full of tooth holes is worth half as much, and a beast that plays with its kill has forgotten what the kill is for." },
      },
      choices = {
        { text = "I'll see to it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lw = {
      lines = {
        { id = "lw_d", text = "Good, then you see the whole road from the beast to the boot. When you get down to Bloodhoof, show your work to Chaw Stronghide, and tell him Nawka says your cuts are clean, if they are." },
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
    first = "She asks the Earth Mother's leave before she breaks the rock.",
    third = "{name} met Vartha Rockmane, the junior mining trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, my friend! How can I help you today? Anything you like." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "How can I help you? Quickly, please." },
    { id = "g_default", text = "How can I help you?" },
    { id = "g_mine", when = { profession = "Mining" }, text = "There is stone dust on your hands, so you have been working. Good." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and that is good. The stone has waited." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have broad shoulders, young one. They would suit a pick as well as a totem." },
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
        { id = "h_miner", when = { profession = "Mining" }, text = "I am Vartha Rockmane. You carry a pick already, so I will not tell you which end to hold, but there is always more the stone can teach." },
      },
      again = {
        { id = "h_again3", text = "Yes? Speak up over the pick; I have a stubborn vein of copper here and it does not like conversation." },
        { id = "h_again", text = "What else would you know? Ask slowly, the way stone answers, and I will give you a slow, true answer." },
        { id = "h_again2", text = "Ask. The stone will wait." },
      },
      choices = {
        { text = "Where is the ore near Narache?", next = "ore" },
        { text = "Do tauren mine much?", next = "tauren" },
        { text = "Why does mining suit a tauren?", next = "suit" },
        { text = "Does the Earth Mother mind?", next = "mind" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "The goblins dig without asking anyone.", next = "venture" },
        { text = "Who shares the teaching with you?", next = "others" },
        { text = "I've worked veins outside Mulgore.", next = "veins", when = { profession = { name = "Mining", min = 50 } } },
        { text = "What do you do with the stone you dig out?", next = "w7_stone" },
        { text = "Not today, Vartha.", next = "END" },
      },
    },
    w7_stone = {
      lines = {
        { id = "w7_stone_l1", text = "Nothing is wasted, as Nawka would tell you. The good copper goes to the smiths, the broken rock lines the paths of the camp, and the round stones I give to the calves to carry up the mesa, so their legs grow strong." },
      },
      choices = {
        { text = "The calves carry stones?", next = "w7_stone2" },
        { text = "That's a lot of work for rocks.", next = "w7_stone3" },
        { text = "Something else, Vartha.", next = "BACK" },
      },
    },
    w7_stone2 = {
      lines = {
        { id = "w7_stone2_l1", text = "Every morning, up the long path from the spring to the top of the mesa, one stone each. They grumble, and then one day they find they can run the path without stopping, and they look at me as if I have done magic." },
        { id = "w7_stone2_l2", when = { race = "Tauren" }, text = "Every morning, one stone each. You may have carried one yourself, not long ago. Those stones line the path to Chief Hawkwind's tent now, and every calf's stone is in it somewhere." },
      },
      choices = {
        { text = "A clever lesson.", next = "BACK", reply = "The Earth Mother teaches slowly. I only help her a little." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_stone3 = {
      lines = {
        { id = "w7_stone3_l1", text = "It is, and that is the point. The work is the lesson; the rocks are only what we carry it in." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
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
        { text = "Asking is right. Respect the earth and it provides.", next = "BACK", reply = "I think so too, and it is good to hear it from someone so young. The old miners on the bluffs ask before every strike, and their veins have never run dry.", fx = { align = { light = 1 } } },
        { text = "The earth is stone. Strike it and take what's there.", next = "BACK", reply = "It is stone, and stone is her bones, young one. Strike if you must, but you may find the veins run thinner for a careless miner.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    venture = {
      lines = {
        { id = "venture_d", text = "They do. The Venture Company has cut a mine into the hills east of Bloodhoof, and they take everything, down to the last pebble, and leave the hole open like a wound." },
      },
      choices = {
        { text = "What should be done about them?", next = "venture_done" },
        { text = "Something else.", next = "BACK" },
      },
    },
    venture_done = {
      big = true,
      lines = {
        { id = "venture_done_d", text = "The braves of Bloodhoof are already doing it, with axes. I would only ask that when the goblins are gone, someone goes back and closes what they opened, because the earth should not be left gaping." },
      },
      choices = {
        { text = "I'd close it. The land should be made whole.", next = "BACK", reply = "Then you think as I do. I will remember that you said so.", fx = { align = { light = 1 } } },
        { text = "Leave it open. The ore's still good, whoever dug it.", next = "BACK", reply = "The ore is good, yes. I had hoped you would think of more than the ore.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_d", text = "Garan Sunstrider teaches the herbs and Nawka Wildsong the skinning knife. Garan talks enough for all three of us, so I have never needed to." },
      },
      choices = {
        { text = "And who takes your copper?", next = "others_copper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_copper = {
      lines = {
        { id = "others_copper_d", text = "It goes down to Bloodhoof for Mahnott Roughwound's blades and Harant Ironbrace's shield bosses. What they cannot use is carried up to the Stonehoof smiths in Thunder Bluff." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    veins = {
      lines = {
        { id = "veins_d", text = "Then you have seen more stone than I have. Tell me, is it true that there are veins of silver and gold in the Barrens that simply lie in the open?" },
      },
      choices = {
        { text = "It's true, though the quilboar guard some.", next = "BACK", reply = "Then I will stay on my mesa with my copper. It is quieter.", fx = { affinity = 1 } },
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

---------------------------------------------------------------------------
-- Mesa Brave: the guards at the entrance to Red Cloud Mesa. Light entry.
---------------------------------------------------------------------------
P:NPC {
  key = "mesa_brave", id = TODO_NPC("Mesa Brave"), name = "Mesa Brave",
  role = "guard", tier = "service",
  communities = { "narache" }, temper = { "calm" }, values = { "duty" },
  notices = { "race", "level" },
  impression = {
    first = "A tauren brave with a long spear planted in the red dust, watching the path up onto Red Cloud Mesa.",
    third = "{name} spoke with a brave guarding the way onto Red Cloud Mesa.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Walk in peace, friend. Camp Narache is glad of you, and so are the young ones." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Walk in peace, {class}, and keep it. The young ones of Narache are watching you, and learning." },
    { id = "g_default", text = "Walk in peace, {class}. The young ones of Camp Narache are beyond me, and I keep the path safe for them." },
    { id = "g_nottauren", when = { ["not"] = { race = "Tauren" } }, text = "A guest on Red Cloud Mesa. The young of Camp Narache rarely see outsiders, so forgive them if they stare." },
  },
  notice = {
    { id = "n_high", cat = "level", when = { minLevel = 20 },
      text = "You have walked farther than this mesa, I can see. The young ones would ask you a hundred questions, if you let them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "We braves watch the way up onto Red Cloud Mesa, so the Bristleback and the wolves bother the camp no more than the elders intend. The trials of the young are meant to be hard, but not that hard." },
        { id = "h_young", when = { race = "Tauren", maxLevel = 10 }, text = "You're one of Grull's young ones, aren't you? Keep your spear high and your eyes higher, and you'll come back from the ravine." },
      },
      again = {
        { id = "h_again", text = "Anything else? I can talk and watch at once." },
        { id = "h_again2", text = "Ask on. The wolves are quiet today." },
      },
      choices = {
        { text = "Is the mesa dangerous?", next = "danger" },
        { text = "Who leads Camp Narache?", next = "leaders" },
        { text = "What is the trial of the young?", next = "trial" },
        { text = "You must get bored up here.", next = "bored" },
        { text = "I passed my trial here once.", next = "mine", when = { race = "Tauren", minLevel = 11 } },
        { text = "What do you see from the edge of the mesa?", next = "edge" },
        { text = "Your spear looks older than you are.", next = "spear" },
        { text = "Do the wolves up here make good companions?", next = "wolves", when = { class = "HUNTER" } },
        { text = "Earth Mother keep watch with you.", next = "END" },
      },
    },
    edge = {
      lines = { { id = "edge_d", text = "All of Mulgore, from the smoke of Bloodhoof Village to the great bluffs in the north where the High Chieftain keeps his city. On a clear day you can see the lifts moving, and the young ones always stop here to stare before they go down." } },
      choices = {
        { text = "Thunder Bluff from here must be a sight.", next = "edge_bluff" },
        { text = "I stopped and stared too.", next = "BACK", reply = "Everyone does. I still do, some mornings, and I've stood here for years." },
        { text = "Something else.", next = "BACK" },
      },
    },
    edge_bluff = {
      lines = { { id = "edge_bluff_d", text = "It is, and it was a dream for most of my life. When I was young our people slept wherever the centaur let us, and now there is a city on the mesas that no raider can climb, and I can see it from my post." } },
      choices = {
        { text = "That's worth guarding, then.", next = "BACK", reply = "It is, and that's why I don't mind the long watches." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    spear = {
      lines = { { id = "spear_d", text = "It belonged to the brave who stood this post before me, and to the one before her. A Narache spear is never thrown away, for it has watched over more young ones than any of us will, and we only borrow it." } },
      choices = {
        { text = "Does it need much care?", next = "spear_care" },
        { text = "A spear that remembers. I like that.", next = "BACK", reply = "So do I, though I'd never say so to the other braves." },
        { text = "Something else.", next = "BACK" },
      },
    },
    spear_care = {
      lines = { { id = "spear_care_d", text = "Oil for the haft and a whetstone for the point, every evening, and a new binding when the wind wears the old one through. The care is part of the watch, and a brave with a dull spear is only standing about." } },
      choices = {
        { text = "Then I'll keep my own weapon sharp.", next = "BACK", reply = "Good. The Bristleback won't wait for you to sharpen it." },
        { text = "Another question.", next = "BACK" },
      },
    },
    wolves = {
      lines = { { id = "wolves_d", text = "Not these ones, {class}. The wolves on the mesa are lean and bad-tempered and they've learned to wait for stragglers, though Grull says a patient hunter could tame one in the end, if they had patience to spare." } },
      choices = {
        { text = "I've patience enough.", next = "BACK", reply = "Then try it below the mesa, where there's room to run if you're wrong." },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "The quilboar in Brambleblade Ravine grow bolder every season, and the prairie wolves are always hungry. Grull Hawkwind sends the young against them, and we make sure the young come back." } },
      choices = {
        { text = "Let the young face it alone. That's the trial.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Good. The herd guards its calves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Why are the quilboar so bold?", next = "quilboar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "The Bristleback come up out of the Barrens, pushed by their own chieftains, and they plant their thorns wherever they stop. Chief Hawkwind sends the young to hunt them, so they learn that an enemy is something you can face." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leaders = {
      lines = { { id = "l_default", text = "Chief Hawkwind, who was a great hunter before her hooves grew old, and Grull Hawkwind, her son, who sets the hunts. Seer Ravenfeather tends the spirits, and Brave Windfeather watches the high ground, and the rest of us do as we're told." } },
      choices = {
        { text = "And Cairne?", next = "cairne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cairne = {
      lines = { { id = "c_default", text = "The High Chieftain was a calf on this very mesa, they say, and every young one hopes the same of themselves. When they pass their trials, they walk down the road to Bloodhoof Village, and then up to the bluff, and they never forget where they began." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cairne" } } } },
    },
    trial = {
      lines = { { id = "t_default", text = "To hunt the plainstrider and the wolf, to drive back the quilboar, and to carry a message to Bloodhoof Village on your own hooves. A young tauren who does all of that has shown the herd they can walk alone, and that they will come home." } },
      choices = { { text = "A good trial. Something else.", next = "BACK" } },
    },
    bored = {
      lines = { { id = "b_default", text = "Some days, I admit it. But I was one of those calves once, and a brave watched this path for me, and I never even knew his name. I think of that, and the hours go by easier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mine = {
      lines = { { id = "m_default", text = "Then you know what it is to walk down from here and feel the whole world open in front of you. Come back up when you are old, and stand where I stand, and you'll understand the other half of it." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    quilboar = { { id = "tp_qb", text = "Bristleback, in the ravine. Keep your spear between you and their tusks." } },
    _none = { { id = "tp_none", text = "Ask Grull Hawkwind in the camp, friend; I only watch the path." } },
  },
}
