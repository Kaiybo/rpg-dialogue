-- Ashenvale's missed folk, Alliance side: the trainers and merchants of Silverwind Refuge (Caelyb, Cylania
-- Rootstalker, Danlaar Nightstride, Harklan Moongrove, Jayla, Kylanna, Ulthaan), three Astranaar merchants
-- (Lardan, Llana, Tandaan Lightmane), Sentinel Onaeya at Maestra's Post, Sentinel Melyria Frostshadow at
-- Raynewood, Krolg the furbolg in his hut, and the dryad Anilia at Xavian. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Caelyb: pet trainer at Silverwind Refuge.
P:NPC {
  key = "caelyb", id = TODO_NPC("Caelyb"), name = "Caelyb", title = "Pet Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "easygoing", "attentive" }, values = { "nature", "patience" },
  notices = { "pet", "class" },
  impression = {
    first = "Caelyb trains hunters' beasts at Silverwind Refuge and crouches to a companion's eye level before he says a word to its master. He is easy company, and the animals seem to think so too.",
    third = "{name} met Caelyb, the pet trainer of Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Give me a moment, for I am being introduced to someone with more legs than you." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the Refuge, {class}. The lake has been calmer than the forest, for once." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Well now, {pet} has been eating properly and sleeping badly. That is Ashenvale for you, since there is plenty to hunt and too much to listen for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Caelyb, and I teach companions what their hunters cannot. Danlaar sharpens you, and I sharpen the one who walks beside you, so between us a pair leaves the Refuge better than it arrived." },
        { id = "h_default", text = "I am Caelyb, and I train the beasts that hunters bring to Silverwind Refuge. You have no companion for me to teach, {class}, but I am glad to talk while the lake is quiet." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on. I have nowhere to be but here." },
      },
      choices = {
        { text = "Train my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you teach a beast anything?", next = "teach" },
        { text = "Do Ashenvale's beasts trouble the Refuge?", next = "beasts" },
        { text = "Which Ashenvale beast makes the best companion?", next = "best", when = { class = "HUNTER" } },
        { text = "Good hunting, Caelyb.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "You do not, exactly; you show it something worth doing and let it decide. A beast that follows a hunter is already choosing to, every day, and my lessons are only better reasons to keep choosing." } },
      choices = {
        { text = "And the stubborn ones?", next = "stubborn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stubborn = {
      lines = { { id = "s_default", text = "Bears are the worst, and I say it fondly. An Ashenvale bear will learn anything in one afternoon and then pretend for a week that it has forgotten, simply to see what you will offer." } },
      choices = { { text = "They sound like people. Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "b_default", text = "The beasts are no trouble, but the lake is another matter. Foul water elementals have risen out of Mystral, and every animal in the Refuge goes stiff when the wind comes off the water, which Sentinel Velene will gladly tell you about." } },
      choices = { { text = "I will ask her. Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "be_default", text = "A ghostpaw wolf, if you want loyalty, and a wildthorn spider if you want something that never complains. Leave the stags alone, for they belong to the forest and to no hunter." } },
      choices = { { text = "A wolf, then, perhaps. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have worked with beasts in this forest for longer than the Refuge has had a roof. I have never wanted another trade." } },
    warsong = { { id = "tp_war", text = "The orcs fell trees to the east, and the beasts flee west ahead of the axes. I see more strays every season." } },
    _none = { { id = "tp_none", text = "No beast has told me that, and they tell me most things. Ask Sentinel Velene, by the lake." } },
  },
}

-- Cylania Rootstalker: herbalism trainer at Silverwind Refuge.
P:NPC {
  key = "cylania_rootstalker", id = TODO_NPC("Cylania Rootstalker"), name = "Cylania Rootstalker", title = "Herbalism Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "earnest", "protective" }, values = { "nature", "balance" },
  notices = { "profession", "class" },
  impression = {
    first = "Cylania Rootstalker teaches herbalism at Silverwind Refuge and can name every plant on the lake shore by the sound it makes in the wind. She worries about Ashenvale's herbs as other people worry about relatives.",
    third = "{name} met Cylania Rootstalker, the herbalism trainer of Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Please mind the liferoot by your left foot, for it took three seasons to settle there." },
    { id = "g_back", when = { metBefore = true }, text = "You return, {class}, and with green on your fingers. I hope you left the roots as you found them." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "You gather herbs, for I can smell bruiseweed on your gloves. Then you know already how much this forest gives to those who ask politely." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Cylania Rootstalker, and it is a pleasure to teach a druid, who need not be told that a plant is alive. I can show you which of Ashenvale's herbs to take and which to leave standing." },
        { id = "h_default", text = "I am Cylania Rootstalker, and I teach herbalism here at the Refuge. Ashenvale is the richest garden our people have left, and I teach my students to gather from it as guests and not as owners." },
      },
      again = {
        { id = "h_again", text = "What else would you know of growing things?" },
        { id = "h_again2", text = "Ask, and watch where you stand." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows around Mystral Lake?", next = "lake" },
        { text = "You sound worried for the forest.", next = "worried" },
        { text = "Where should an herbalist look in Ashenvale?", next = "look", when = { profession = "Herbalism" } },
        { text = "May your garden thrive.", next = "END" },
      },
    },
    lake = {
      lines = { { id = "l_default", text = "Liferoot along the banks and stranglekelp below the surface, or there was, before the water turned. Since the elementals rose the kelp comes up grey, and I will not teach anyone to use an herb that looks ill." } },
      choices = {
        { text = "Will the kelp recover?", next = "recover" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recover = {
      lines = { { id = "r_default", text = "If the fouling stops, yes, for water forgives quickly. Kylanna tests it for me every few days, and when she says it is clean I shall be the first one in the lake with a basket." } },
      choices = { { text = "I hope that day is soon. Something else.", next = "BACK" } },
    },
    worried = {
      lines = { { id = "w_default", text = "I am, because the forest is being cut from the east and soured from the north, and herbs are the first to show it. Where the Warsong have logged, nothing grows back but briar, and near Felwood the mageroyal comes up black at the root.", fx = { learn = { "warsong" } } } },
      choices = {
        { text = "The orcs will answer for it.", next = "BACK", reply = "Perhaps they will. I would settle for their stopping, since no answer of theirs will regrow an oak." },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "lo_default", text = "Briarthorn hides among the roots of the great trees, and kingsblood likes the open glades south of here toward Fallen Sky Lake. Take one plant in three and no more, and the glade will still be there when you come back." } },
      choices = { { text = "One in three. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have gathered in Ashenvale since before the Refuge was raised. My name was earned, not given." } },
    warsong = { { id = "tp_war", text = "They cut whole groves for their walls. I have seen the stumps, and I could not speak for a day afterwards." } },
    _none = { { id = "tp_none", text = "That is not something that grows in my garden. Ask Sentinel Velene, or take the road to Astranaar." } },
  },
}

-- Danlaar Nightstride: hunter trainer at Silverwind Refuge.
P:NPC {
  key = "danlaar_nightstride", id = TODO_NPC("Danlaar Nightstride"), name = "Danlaar Nightstride", title = "Hunter Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "spare", "exact" }, values = { "discipline", "vigilant" },
  notices = { "class", "pet" },
  impression = {
    first = "Danlaar Nightstride trains hunters at Silverwind Refuge and stands where he can see both the road and the lake. He says little and means all of it, and he looks at a bow before he looks at its owner.",
    third = "{name} met Danlaar Nightstride, the hunter trainer of Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You came up the road upwind and in the open, so I have known about you for some time." },
    { id = "g_back", when = { metBefore = true }, text = "You are quieter on the approach than you were, {class}. That is progress." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your string is fraying near the nock, hunter. Mend it tonight, for Ashenvale does not wait for a convenient moment to test you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Danlaar Nightstride, and I teach hunters who have outgrown their first lessons. This forest has orcs to the east and demons to the north, so what I teach here is meant to bring you home." },
        { id = "h_default", text = "I am Danlaar Nightstride, and I train hunters at this Refuge. You walk another path, {class}, though you may still ask what a hunter sees in these woods." },
      },
      again = {
        { id = "h_again", text = "Ask what else you came to ask." },
        { id = "h_again2", text = "Speak. I am watching the road while I listen." },
      },
      choices = {
        { text = "Train me, Danlaar.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What does a hunter see in these woods?", next = "sees" },
        { text = "You watch the road closely.", next = "road" },
        { text = "What is the lesson that brings a hunter home?", next = "lesson", when = { class = "HUNTER" } },
        { text = "Keep your watch, Danlaar.", next = "END" },
      },
    },
    sees = {
      lines = { { id = "s_default", text = "That the forest is being hunted, and not by us. Orc scouts leave bootprints as far west as the lake now, and satyrs have tracks that no one mistakes after seeing them once.", fx = { learn = { "satyrs" } } } },
      choices = {
        { text = "How near do the orcs come?", next = "orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "Near enough that I have found their wolf sign on the south shore of Mystral. They ride in pairs and do not linger, which tells me they are counting us and not yet ready to do more than count.", fx = { learn = { "warsong" } } } },
      choices = { { text = "That is an ill sign. Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "r_default", text = "It is the only way to Astranaar that a wagon can use, and so it is the first thing an enemy would cut. Caelyb watches the beasts for warning and I watch the road, and so far both have stayed quiet." } },
      choices = { { text = "Long may they stay so. Something else.", next = "BACK" } },
    },
    lesson = {
      lines = { { id = "l_default", text = "Know your way out before you loose the first arrow. Every hunter I have buried had a fine shot and no second path, and I would rather you were alive and ashamed than brave and under a cairn." } },
      choices = {
        { text = "I will find the second path first.", next = "BACK", reply = "Then you have already learned more than most. Come back when you are ready for the rest.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I scouted this forest through the Long Vigil and through the war on Hyjal. I mean to scout it a while longer." } },
    warsong = { { id = "tp_war", text = "They are fine trackers and poor guests. I respect the first and will answer the second." } },
    satyrs = { { id = "tp_sat", text = "Kaldorei once, before they sold themselves to the Legion. They foul every place they settle." } },
    _none = { { id = "tp_none", text = "I have seen no sign of that. Raene Wolfrunner in Astranaar hears more than I do." } },
  },
}

-- Harklan Moongrove: alchemy supplies at Silverwind Refuge.
P:NPC {
  key = "harklan_moongrove", id = TODO_NPC("Harklan Moongrove"), name = "Harklan Moongrove", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "fastidious", "courteous" }, values = { "craft", "order" },
  notices = { "profession" },
  impression = {
    first = "Harklan Moongrove sells vials and alchemical goods at Silverwind Refuge and wipes each one before it leaves his hands. He is very courteous, and very sure that most accidents begin with a dirty flask.",
    third = "{name} met Harklan Moongrove, who sells alchemy supplies at Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Kindly keep your elbows in, for there is a good deal of glass on these shelves." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, {class}. You have broken a vial or run out of them, and I can remedy either." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "An alchemist, by the burns on your cuffs. Then you will appreciate that everything I sell has been washed three times in clean water, and not from this lake." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Harklan Moongrove, and I supply the alchemists of the Refuge with vials, flasks and the humbler ingredients. Kylanna does the teaching, and I see to it that her students have clean glass to make their mistakes in." },
      },
      again = {
        { id = "h_again", text = "Is there anything further?" },
        { id = "h_again2", text = "Do go on, and mind the lower shelf." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You do not trust the lake water.", next = "water" },
        { text = "How is it, working beside Kylanna?", next = "kylanna" },
        { text = "What should an alchemist stock up on here?", next = "stock", when = { profession = "Alchemy" } },
        { text = "Good day to you, Harklan.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "I trusted it for centuries, and then elementals of filth rose out of Mystral and I stopped. I carry my water from the stream above the Refuge now, which is tiresome, and far better than selling a tainted flask." } },
      choices = {
        { text = "Who fouled the lake?", next = "fouled" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fouled = {
      lines = { { id = "f_default", text = "Sentinel Velene believes some sorcerer bound those elementals and set them there, and she is hunting for proof. I hope she finds him, for I should like a word about what he has cost me in buckets." } },
      choices = { { text = "I may be able to help her. Something else.", next = "BACK" } },
    },
    kylanna = {
      lines = { { id = "k_default", text = "She is brilliant, and she leaves stoppers out. We have reached an understanding in which she invents and I tidy, and the Refuge has had only two small fires in all the years since." } },
      choices = { { text = "Only two? Well done. Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "More empty vials than you believe you need, since Ashenvale's herbs are generous and you will fill them faster than you expect. Cylania can point you to the plants, and I can promise the glass will be ready." } },
      choices = { { text = "Then I will buy plenty. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept an alchemist's stores since before the Refuge had walls. Somebody must mind the glass." } },
    _none = { { id = "tp_none", text = "I regret that I cannot say. Kylanna may know, if you can get her attention away from her cauldron." } },
  },
}

-- Jayla: skinning trainer at Silverwind Refuge.
P:NPC {
  key = "jayla", id = TODO_NPC("Jayla"), name = "Jayla", title = "Skinning Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "matter-of-fact", "respectful" }, values = { "nature", "thrifty" },
  notices = { "profession", "form" },
  impression = {
    first = "Jayla teaches skinning at Silverwind Refuge with a short knife and a shorter list of rules. She talks plainly about death and wastes nothing, which she counts as the same courtesy.",
    third = "{name} met Jayla, the skinning trainer of Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If that knife on your belt is for skinning, it wants sharpening before you insult anything with it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {class}. Show me your last hide, and I will tell you what you did wrong." },
  },
  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat" } },
      text = "Do not be alarmed, druid, for I know the difference between a beast and a friend wearing its shape. I do ask that you keep clear of the drying racks." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Jayla, and I teach skinning. When a beast falls in this forest, its hide should go on to keep someone warm, and I teach people to take it cleanly so that nothing of the animal is wasted." },
      },
      again = {
        { id = "h_again", text = "What else? I have hides to scrape." },
        { id = "h_again2", text = "Ask it, and hand me that scraper." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "What are your rules?", next = "rules" },
        { text = "Who takes the hides you prepare?", next = "hides" },
        { text = "Which Ashenvale hides are worth the walk?", next = "worth", when = { profession = "Skinning" } },
        { text = "Sharp knives to you, Jayla.", next = "END" },
      },
    },
    rules = {
      lines = { { id = "r_default", text = "Take the whole hide or take none, thank the beast, and never skin what you killed for sport. There are only the three, and I have sent students away for breaking the last one." } },
      choices = {
        { text = "Sent them away for good?", next = "away" },
        { text = "Something else.", next = "BACK" },
      },
    },
    away = {
      lines = { { id = "a_default", text = "Until they understood, which for one of them took forty years. The forest keeps its own accounts, {class}, and I would rather a student learned that from me than from the forest." } },
      choices = { { text = "A long lesson. Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "h_hides", text = "Lardan in Astranaar buys most of them for the leatherworkers, and Ulthaan here takes the meat so the rest is not left to rot. Between a skinner and a butcher, a stag goes a very long way." } },
      choices = { { text = "Nothing wasted, then. Something else.", next = "BACK" } },
    },
    worth = {
      lines = { { id = "w_default", text = "The elder ashenvale bears carry the thickest hide in the forest, and the ghostpaw alphas the finest fur. Both will object strongly to your interest, so be sure you need the leather before you go asking." } },
      choices = { { text = "I will be sure. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My mother skinned for the Sentinels, and her mother before her. The knife is older than I am." } },
    _none = { { id = "tp_none", text = "I could not say, and I do not guess. Ask Danlaar, who watches more than hides." } },
  },
}

-- Kylanna: alchemy trainer at Silverwind Refuge.
P:NPC {
  key = "kylanna", id = TODO_NPC("Kylanna"), name = "Kylanna", title = "Alchemy Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "absorbed", "bright" }, values = { "knowledge", "craft" },
  notices = { "profession", "class" },
  impression = {
    first = "Kylanna teaches alchemy at Silverwind Refuge and talks to her cauldron almost as much as to her visitors. She is quick and bright for one of her people, and she has been testing the lake water every few days with a frown.",
    third = "{name} met Kylanna, the alchemy trainer of Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, and one moment, if you please. This must come off the heat before it decides to become something else." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it is you again, {class}. Good, for I need someone to tell me whether this smells of mint or of regret." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "A fellow alchemist! You must tell me what the human apothecaries are doing with swiftthistle, because I hear the strangest things." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kylanna, and I teach alchemy to anyone with steady hands and a curious nose. Ashenvale gives us more herbs than any forest left in the world, and I mean to learn what every one of them can do before I am done." },
      },
      again = {
        { id = "h_again", text = "What else? I can stir and listen." },
        { id = "h_again2", text = "Ask away, but do not lean over the cauldron." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What have you learned from the lake?", next = "lake" },
        { text = "You are livelier than most of your kin.", next = "lively" },
        { text = "What is brewing in that cauldron?", next = "brewing", when = { profession = "Alchemy" } },
        { text = "I will leave you to your work.", next = "END" },
      },
    },
    lake = {
      lines = { { id = "l_default", text = "That the water is not poisoned so much as spoiled, as milk spoils, by the things living in it. The elementals are the sickness and not a symptom, so when they are gone, Mystral should clear within a season." } },
      choices = {
        { text = "Can alchemy speed that along?", next = "speed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speed = {
      lines = { { id = "s_default", text = "I have tried, and all I made was a very clean bucket of water and a headache. A lake is too large for a vial, so I leave the cure to Sentinel Velene's hunt and keep to measuring how bad it is." } },
      choices = { { text = "Honest work, at least. Something else.", next = "BACK" } },
    },
    lively = {
      lines = { { id = "li_default", text = "So Harklan tells me, usually while picking up after me. We have ten thousand years behind us and a mortal span ahead, and I find that makes me want to hurry, which is not thought seemly among the kaldorei." } },
      choices = {
        { text = "Hurry suits you.", next = "BACK", reply = "It does, I think, though please do not tell the druids I said so.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brewing = {
      lines = { { id = "b_default", text = "Liferoot and kingsblood, for a draught that mends the body, though I am trying it with half the kingsblood since Cylania begs me to spare the glades. It is weaker, and it tastes better, and I have not decided which matters more." } },
      choices = { { text = "A fair trade, I would say. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied under the old herbalists of Hyjal, and I have been improving on them ever since. They would not thank me for saying so." } },
    _none = { { id = "tp_none", text = "I have not the faintest idea, and I dislike not knowing. Ask in Astranaar, and tell me what you learn." } },
  },
}

-- Ulthaan: butcher at Silverwind Refuge.
P:NPC {
  key = "ulthaan", id = TODO_NPC("Ulthaan"), name = "Ulthaan", title = "Butcher", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "hearty", "plain" }, values = { "thrifty", "hospitable" },
  notices = { "pet", "profession" },
  impression = {
    first = "Ulthaan is the butcher of Silverwind Refuge, a broad and cheerful man with a cleaver he keeps cleaner than most people keep their swords. He feeds the Refuge and every hunter's beast that passes through it.",
    third = "{name} met Ulthaan, the butcher of Silverwind Refuge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah! You look as if you have walked from Astranaar on an empty stomach, and I can do something about that." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, {class}. The stag is fresh today, and I will not say the same tomorrow." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion has its eye on my counter, and I cannot fault its taste. A hunter who feeds a beast well has a friend for life." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Ulthaan, the butcher here, and hunters are the best customers I have. You feed yourself last and your beast first, as is right, so I keep the good cuts where a companion can smell them." },
        { id = "h_default", text = "I am Ulthaan, and I cut and sell the meat that keeps this Refuge on its feet. It is honest fare, taken by our own hunters and wasted by nobody, and I will stand by every cut on the block." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you?" },
        { id = "h_again2", text = "Ask on, friend, and mind the cleaver." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Where does your meat come from?", next = "meat" },
        { text = "A butcher is rare among the kaldorei.", next = "rare" },
        { text = "Safe roads, Ulthaan.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "Stag and bear from the woods south of the lake, brought in by Danlaar's students when they have learned to shoot straight. I used to take fish from Mystral as well, and I have not touched a fin from that water since it turned." } },
      choices = {
        { text = "The lake has cost you.", next = "cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cost = {
      lines = { { id = "c_default", text = "It has cost the whole Refuge its suppers, for we were a fishing place before we were anything else. Sentinel Velene means to put it right, and on the day she does I will fry the first catch myself." } },
      choices = { { text = "I would like to see that. Something else.", next = "BACK" } },
    },
    rare = {
      lines = { { id = "r_default", text = "It is, and some of the druids look at me sideways for it. I tell them the wolf eats the stag and is no enemy of the forest, and that I am only a tidier sort of wolf." } },
      choices = {
        { text = "A tidy wolf. I like that.", next = "BACK", reply = "Ha! So do I, and I thought of it myself.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fed this Refuge for many years, and my father fed the camp that stood here before it." } },
    _none = { { id = "tp_none", text = "You have me there, friend. Ask Sentinel Velene, who knows what goes on beyond my block." } },
  },
}

-- Lardan: leatherworking supplies in Astranaar.
P:NPC {
  key = "lardan", id = TODO_NPC("Lardan"), name = "Lardan", title = "Leatherworking Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "unhurried", "wry" }, values = { "craft", "thrifty" },
  notices = { "profession" },
  impression = {
    first = "Lardan sells thread, salt and dye to Astranaar's leatherworkers, and he rolls a hide between his fingers before he will say what it is worth. He has a wry word for the war, which keeps making him busier.",
    third = "{name} met Lardan, who sells leatherworking supplies in Astranaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you have hides to cure, I have the salt, and if you have not, we may still talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Astranaar, {class}. The Sentinels have been through my thread again, so choose quickly." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You work hides, by the stain on your thumbs. Then you and I will get along, for I have yet to meet a leatherworker with enough thread." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Lardan, and I keep the leatherworkers of Astranaar in thread, salt and dye. Tandaan beside me sells what they make, and I sell what they make it with, so one of us is always owed something by the other." },
      },
      again = {
        { id = "h_again", text = "What else, then?" },
        { id = "h_again2", text = "Go on. The hides are not going anywhere." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The war keeps you busy?", next = "war" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Any counsel for a leatherworker?", next = "counsel", when = { profession = "Leatherworking" } },
        { text = "Fare well, Lardan.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Busier than I care to be. Every Sentinel who rides east toward the Warsong camps comes back needing a strap mended or a quiver restitched, and the ones who do not come back needed more than I could sell them.", fx = { learn = { "warsong" } } } },
      choices = {
        { text = "Does Astranaar feel besieged?", next = "siege" },
        { text = "Something else.", next = "BACK" },
      },
    },
    siege = {
      lines = { { id = "s_default", text = "Not besieged, but watched, and we have grown used to it as one grows used to a splinter. Raene Wolfrunner keeps the count of our troubles, and you would do well to ask her where a pair of hands is needed." } },
      choices = { { text = "I will speak with her. Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "h_hides", text = "From the forest's own hunters, and a good many from Jayla's students out at Silverwind Refuge. She trains them properly, so her hides arrive whole, which is more than I can say for what the dwarves bring me." } },
      choices = { { text = "Poor dwarves. Something else.", next = "BACK" } },
    },
    counsel = {
      lines = { { id = "c_default", text = "Salt the hide the same day, or do not trouble to salt it at all. I have had a great many travellers show me a week-old bear skin and ask what went wrong, and the answer is always the week." } },
      choices = { { text = "Same day. Understood. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold to Astranaar's crafters for longer than the humans have had a kingdom. It is steady work." } },
    warsong = { { id = "tp_war", text = "They want the trees, and we will not give them. Everything else follows from that." } },
    _none = { { id = "tp_none", text = "I do not stock that answer. Try Raene Wolfrunner, or the innkeeper." } },
  },
}

-- Llana: reagent supplies in Astranaar. (Forever: Seeking Caitlin.)
P:NPC {
  key = "llana", id = TODO_NPC("Llana"), name = "Llana", title = "Reagent Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "serene", "knowing" }, values = { "balance", "discretion" },
  notices = { "class" },
  impression = {
    first = "Llana sells reagents in Astranaar and seems to know what each customer needs by the way they hesitate at her counter. She is serene, discreet and a little too observant for comfort.",
    third = "{name} met Llana, who sells reagents in Astranaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You need not tell me what you came for, since most people's hands tell me first." },
    { id = "g_caitlin", when = { questActive = TODO_QUEST("Seeking Caitlin") }, text = "You are asking after Caitlin, I think. Come closer, and I will tell you what I know of her." },
    { id = "g_back", when = { metBefore = true }, text = "You return, {class}. Your pouches are lighter than when you left, so the forest has kept you working." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You are looking for the powders that are kept under the counter. I have them, and I ask no questions, though I do remember faces." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid will want seeds and good soil for the calling back of the fallen. I keep both, and I hope you seldom need them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_caitlin", when = { questActive = TODO_QUEST("Seeking Caitlin") }, text = "Caitlin is a human alchemist across the sea, and her orders for reagents have reached me by ship before now. If you are seeking her, the trail from my counter leads to the harbor at Menethil." },
        { id = "h_default", text = "I am Llana, and I sell reagents to those whose arts require them. A spell or a prayer asks for something of the world in exchange, and I keep those small prices on my shelves so that nobody is caught without." },
      },
      again = {
        { id = "h_again", text = "What else do you seek?" },
        { id = "h_again2", text = "Ask. I am in no haste." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Who buys from you most?", next = "buys" },
        { text = "Magic always asks a price, you say.", next = "price" },
        { text = "You sell to rogues without a qualm?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Elune keep your shelves full.", next = "END" },
      },
    },
    buys = {
      lines = { { id = "b_default", text = "The priestesses, who come for holy candles, and the druids for their seeds. Of late there are humans too, bound for Maestra's Post, and they buy by the handful as though they expected to need it all at once." } },
      choices = {
        { text = "Perhaps they do expect it.", next = "expect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    expect = {
      lines = { { id = "e_default", text = "I believe so, for there is a cult at work in the ruins near that post, and the humans have taken it upon themselves to watch it. I sell them what they ask and wish them well, which is all a merchant can do.", fx = { learn = { "dark_strand" } } } },
      choices = { { text = "I may look in on them. Something else.", next = "BACK" } },
    },
    price = {
      lines = { { id = "p_default", text = "Our people learned it more dearly than any, when the Highborne took without paying and the Well of Eternity took the reckoning out of the whole world. A candle or a seed is a modest price beside that, and I think it wholesome to be reminded.", fx = { learn = { "highborne" } } } },
      choices = { { text = "A wholesome reminder indeed. Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "r_default", text = "The Sentinels have their scouts, and scouts have need of quiet tools. I would sooner you bought them from me, where someone has looked you in the eye, than from someone who looks the other way." } },
      choices = { { text = "A fair way to see it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept this counter for a very long time, and I have learned a great deal by saying little." } },
    highborne = { { id = "tp_high", text = "They loved magic past all sense. We are still paying for what they took." } },
    _none = { { id = "tp_none", text = "That I do not know, or have chosen not to. Ask Raene Wolfrunner." } },
  },
}

-- Tandaan Lightmane: leather armor in Astranaar.
P:NPC {
  key = "tandaan_lightmane", id = TODO_NPC("Tandaan Lightmane"), name = "Tandaan Lightmane", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "earnest", "careful" }, values = { "protective", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Tandaan Lightmane sells leather armor in Astranaar and remembers which scout bought which jerkin. He asks after them when they ride out, and he notices when they do not ride back.",
    third = "{name} met Tandaan Lightmane, the leather armor merchant of Astranaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Tell me where in Ashenvale you are bound, and I will tell you what to wear there." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, {class}, and I am always glad to say that to a customer." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear has been through something, and it shows at every seam. See it mended before you take the east road, I beg you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_scout", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "I am Tandaan Lightmane, and I outfit the scouts and hunters who work out of Astranaar, {class}. Tell me which border you will walk, because I cut differently for the Warsong's arrows than for a satyr's claws." },
        { id = "h_default", text = "I am Tandaan Lightmane, and I sell leather armor here in Astranaar. Most of it goes onto the backs of Sentinel scouts, and I think of each piece as a promise to bring its wearer home." },
      },
      again = {
        { id = "h_again", text = "What else may I tell you?" },
        { id = "h_again2", text = "Ask, please. I have the time." },
      },
      choices = {
        { text = "Show me your leathers.", next = "BUSINESS" },
        { text = "You remember everyone you sell to?", next = "remember" },
        { text = "Which border is the worst?", next = "border" },
        { text = "What would you cut for someone like me?", next = "cut", when = { class = { "ROGUE", "HUNTER", "DRUID" } } },
        { text = "Until I return, Tandaan.", next = "END" },
      },
    },
    remember = {
      lines = { { id = "r_default", text = "I do, and Faldreas keeps the written list of who has gone out on the roads, so between us nobody is forgotten. It is a heavy habit, and I would not give it up." } },
      choices = {
        { text = "Do many fail to return?", next = "fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail = {
      lines = { { id = "f_default", text = "More each season since the orcs dug in at their lumber camps. I altered a jerkin last moon for a scout who never collected it, and it still hangs behind me, because I cannot bring myself to sell it on.", fx = { learn = { "warsong" } } } },
      choices = {
        { text = "Keep it hung. She may yet return.", next = "BACK", reply = "That is what I tell myself each morning. Thank you for saying it aloud.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    border = {
      lines = { { id = "b_default", text = "The east has the orcs, and they at least fight in the open. I fear the north more, where Felwood's rot seeps down and the satyrs of Satyrnaar and Xavian wait in the trees with poisoned blades.", fx = { learn = { "satyrs" } } } },
      choices = { { text = "Then I will dress for the north. Something else.", next = "BACK" } },
    },
    cut = {
      lines = { { id = "c_default", text = "Close at the shoulder and loose at the hip, so that you can draw, climb and run without the leather arguing. Lardan sells the thread I use, and you may tell him I said it is the only thing he gets right." } },
      choices = { { text = "I will pass that along. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have dressed Astranaar's scouts for many years. I know most of them by their measurements." } },
    satyrs = { { id = "tp_sat", text = "Fallen kaldorei in the Legion's service. Their blades are fouled, so leather alone will not save you." } },
    _none = { { id = "tp_none", text = "I am sorry, I do not know. Faldreas keeps the lists, and Raene keeps the news." } },
  },
}

-- Sentinel Onaeya: stands outside the main building at Maestra's Post.
P:NPC {
  key = "sentinel_onaeya", id = TODO_NPC("Sentinel Onaeya"), name = "Sentinel Onaeya", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "maestras_post" }, temper = { "brisk", "guarded" }, values = { "dutiful", "vigilant" },
  notices = { "race", "class" },
  impression = {
    first = "Sentinel Onaeya stands guard outside the main building at Maestra's Post and watches the ruins to the north more than the road. She is brisk with strangers, and she seems to be making up her mind about humans.",
    third = "{name} met Sentinel Onaeya, who stands guard at Maestra's Post in Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "Hold a moment, {class}. State your business at Maestra's Post, and then you may pass." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Go on through, for I know your face." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The cultists favor the dark, so I am not in a talking mood. Say what you need quickly." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human for the post. Your paladin Delgren has earned his place here, so I will give you the benefit of his good name." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sentinel Onaeya, and I guard this post. To the north lie the ruins of Ordil'Aran and the Tower of Althalaxx, and a cult of warlocks has made itself at home in both, so I watch that way first." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Speak, and I will keep one eye on the ruins." },
      },
      choices = {
        { text = "Tell me about this cult.", next = "cult" },
        { text = "How do you find sharing a post with humans?", next = "humans" },
        { text = "Who commands here?", next = "command" },
        { text = "I know how the cult thinks. My word may be of use.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Keep your watch, Sentinel.", next = "END" },
      },
    },
    cult = {
      lines = { { id = "c_default", text = "They call themselves the Dark Strand, and they traffic with demons among stones where our ancestors once did the same and paid for it. I have counted their fires each night, and there are more of them than there were.", fx = { learn = { "dark_strand" } } } },
      choices = {
        { text = "Why not drive them out?", next = "drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drive = {
      lines = { { id = "d_default", text = "We are a handful of Sentinels holding a road, and they are many, behind old walls. Delgren the Purifier is gathering the proof and the hands to do it properly, and I would speak to him if you wish to be one of them." } },
      choices = { { text = "I will find him. Something else.", next = "BACK" } },
    },
    humans = {
      lines = { { id = "hu_default", text = "Better than I expected to. They are loud and they sleep at the wrong hours, but they came across a sea to stand watch over our ruins, and I do not forget who stood with us on Hyjal." } },
      choices = { { text = "That is generous of you. Something else.", next = "BACK" } },
    },
    command = {
      lines = { { id = "co_default", text = "The Sentinels answer to Astranaar and to Raene Wolfrunner there. Within the post, Liladris Moonriver sees to our needs, and the paladin sees to the cult, and I see to the door." } },
      choices = { { text = "A clear arrangement. Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "It may, though I will not pretend I am easy standing this close to you. If you know how such people think, tell Delgren, and tell him also that I am watching your hands." } },
      choices = { { text = "Watch away. I have nothing to hide.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Sentinel of Ashenvale, posted here since the cult first lit its fires. That is all you need of me." } },
    dark_strand = { { id = "tp_ds", text = "Warlocks in the ruins north of here. Speak to Delgren the Purifier if you mean to act." } },
    _none = { { id = "tp_none", text = "That is not my post's concern. Ask Liladris Moonriver inside." } },
  },
}

-- Sentinel Melyria Frostshadow: Raynewood Retreat. Classic: The Howling Vale, Velinde Starsong.
P:NPC {
  key = "melyria_frostshadow", id = TODO_NPC("Sentinel Melyria Frostshadow"), name = "Sentinel Melyria Frostshadow", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "grave", "conscientious" }, values = { "dutiful", "truth" },
  notices = { "class", "race" },
  impression = {
    first = "Sentinel Melyria Frostshadow holds the post at Raynewood Retreat that belonged to Velinde Starsong before she vanished. She has read her predecessor's papers too many times, and she cannot let the matter lie.",
    third = "{name} met Sentinel Melyria Frostshadow at Raynewood Retreat, who is trying to learn what became of the Sentinel Velinde Starsong.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. You find me with another's unfinished duty on my desk, and I would be glad of help with it." },
    { id = "g_vale", when = { questActive = TODO_QUEST("The Howling Vale") }, text = "Have you been to the Howling Vale? Whatever Velinde left at the shrine there, I need it in my hands." },
    { id = "g_velinde", when = { questActive = TODO_QUEST("Velinde Starsong") }, text = "Thyn'tel Bladeweaver in Darnassus must hear what we have found. Do not delay on the road, I ask you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Velinde Starsong") }, text = "You carried Velinde's story further than I could from this tower. Whatever its end, I am grateful to you." },
    { id = "g_back", when = { metBefore = true }, text = "You return to Raynewood. I am still at Velinde's papers, as you see." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You will know better than I what it means to call upon a wild god and be answered, and I may need that knowledge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_vale", when = { questActive = TODO_QUEST("The Howling Vale") }, text = "The Howling Vale lies to the north and east, beneath Felwood's shadow, and there is an old shrine there where Velinde prayed. Search it, and bring me whatever she left behind." },
        { id = "h_default", text = "I am Sentinel Melyria Frostshadow, and I was given this post when Velinde Starsong left it without a word. She was charged with cleansing Felwood of its demons, and for a time she succeeded beyond all reason, and I mean to learn how." },
      },
      again = {
        { id = "h_again", text = "What more would you ask about her?" },
        { id = "h_again2", text = "Ask it. I have turned these questions over alone for too long." },
      },
      choices = {
        { text = "Who was Velinde Starsong?", next = "velinde" },
        { text = "How did she succeed in Felwood?", next = "felwood" },
        { text = "This tower is a lonely post.", next = "post" },
        { text = "A priestess of Elune would know such prayers.", next = "priest", when = { class = "PRIEST" } },
        { text = "What does a druid make of a wild god's gift?", next = "druid", when = { class = "DRUID" } },
        { text = "I will leave you to your papers.", next = "END" },
      },
    },
    velinde = {
      lines = { { id = "v_default", text = "A Sentinel of long service and a devout one, trusted enough to be sent against the demons of Felwood with too few at her back. Those who served under her say she grew silent and troubled near the end, and then one morning she was gone.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "Gone where?", next = "gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gone = {
      lines = { { id = "g_gone", text = "South, by ship, toward the human lands, and no report of hers says why. A Sentinel does not abandon a command for a whim, so she was either fleeing something or seeking it, and I do not know which frightens me more." } },
      choices = {
        { text = "Someone in Darnassus must know more.", next = "darnassus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darnassus = {
      lines = { { id = "d_default", text = "Thyn'tel Bladeweaver, in the Warrior's Terrace, was her superior and is mine. When I have something firmer than rumor, it must go to her, and I would trust a willing traveller to carry it faster than our couriers." } },
      choices = { { text = "I would carry it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    felwood = {
      lines = { { id = "f_default", text = "She prayed to Elune for aid at a shrine in the Howling Vale, and her journal says the prayer was answered with a relic she calls the Scythe. With it she called up fighters from somewhere else, wolf-shaped and savage, and the demons fell before them." } },
      choices = {
        { text = "Fighters from where?", next = "fighters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fighters = {
      lines = { { id = "fi_default", text = "She did not know, and that is the last thing she wrote with a steady hand. After that the entries speak of the creatures refusing her commands, and of her fear that she had opened a door she could not close." } },
      choices = { { text = "That bodes ill. Something else.", next = "BACK" } },
    },
    post = {
      lines = { { id = "p_default", text = "It is, with the Warsong's axes to the east and Felwood's rot to the north. Sentinels are sent here to watch both, and I think it was the watching, with too few hands, that drove Velinde to pray as she did.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Then you should not watch alone. Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Then tell me, for I am only a soldier, whether the Goddess hands weapons to those who ask. I have always believed she gives light and mercy, and Velinde's Scythe sounds like neither." } },
      choices = { { text = "It troubles me as well. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "That is what I hoped to ask you, whether a power that answers a prayer in the shape of a wolf can be trusted. Velinde believed the Scythe was Elune's gift, and I am no longer certain it came from the Goddess at all." } },
      choices = { { text = "I would not trust it either. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served on the Felwood border before I was given this post. I did not ask for it, and I will not leave it half done as it was left to me." } },
    sentinels = { { id = "tp_sen", text = "We keep faith with our posts. That is why Velinde's leaving hers weighs on me so." } },
    warsong = { { id = "tp_war", text = "They log within sight of this tower. I count the trees that fall, for want of the strength to stop it." } },
    _none = { { id = "tp_none", text = "I know nothing of that, and I have troubles enough with what I do know. Ask in Astranaar." } },
  },
}

-- Krolg: an uncorrupted furbolg in his hut south of Mystral Lake. Classic: Raene's Cleansing (Dartol's Rod).
P:NPC {
  key = "krolg", id = TODO_NPC("Krolg"), name = "Krolg", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "wary", "sorrowful" }, values = { "tribe", "honesty" },
  notices = { "form", "class" },
  impression = {
    first = "Krolg is a furbolg who lives alone in a hut south of Mystral Lake, because the madness that took the Foulweald did not take him. He speaks slowly and sadly, and he would not have spoken at all had I not come to him wearing fur.",
    third = "{name} met Krolg, an uncorrupted furbolg of the Foulweald who lives alone south of Mystral Lake.",
  },
  greetings = {
    { id = "g_default", text = "You wear the shape of my people, but you smell of the elf town. Krolg will listen, because the one who sent you has a good smell too." },
    { id = "g_rod", when = { questActive = TODO_QUEST("Raene's Cleansing") }, text = "The rod of Dartol brought you here in a furbolg's skin. Sit by Krolg's fire, and we will speak of what must be done." },
    { id = "g_done", when = { questDone = TODO_QUEST("Raene's Cleansing") }, text = "You come back, friend of Krolg. The woods are a little quieter for what you did, and Krolg sleeps a little better." },
    { id = "g_back", when = { metBefore = true }, text = "Krolg remembers your smell. Come in, and mind the low roof." },
  },
  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, you walk as a bear and not only as a furbolg! The bear is grandfather to my people, and Krolg is glad to see him at the door." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_rod", when = { questActive = TODO_QUEST("Raene's Cleansing") }, text = "Krolg knows why the elf woman sent you. The Foulweald are sick in their hearts, and there are those among them who keep the sickness strong, and Krolg can tell you their names." },
        { id = "h_default", text = "I am Krolg, and once I was of the Foulweald tribe. A badness came into the forest and into my people, and it did not come into Krolg, so now I live here alone and they would kill me if they found the hut." },
      },
      again = {
        { id = "h_again", text = "What more do you ask of Krolg?" },
        { id = "h_again2", text = "Speak, friend. The fire is warm, and Krolg has few visitors." },
      },
      choices = {
        { text = "What happened to the Foulweald?", next = "foulweald" },
        { text = "Why did the madness spare you?", next = "spared" },
        { text = "Who keeps the sickness strong?", next = "names" },
        { text = "You are lonely out here.", next = "lonely" },
        { text = "A druid grieves with you, Krolg.", next = "druid", when = { class = "DRUID" } },
        { text = "Stay hidden, Krolg, and stay well.", next = "END" },
      },
    },
    foulweald = {
      lines = { { id = "f_default", text = "They were hunters and honey gatherers, and they sang at the full moon. Then the water and the roots turned sour, and they grew angry at everything, and now they sing only before they kill.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "Where does the sourness come from?", next = "sour" },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    sour = {
      lines = { { id = "s_default", text = "From the north, where the trees weep green and the demons walk. It creeps down in the streams, and a furbolg drinks, and a little more of him goes away each season until only the anger is left.", fx = { learn = { "burning_legion" } } } },
      choices = { { text = "Then the north must be cleansed. Something else.", next = "BACK" } },
    },
    spared = {
      lines = { { id = "sp_default", text = "Krolg does not know, and he has asked the spirits many nights. Maybe he drank from a different stream, or maybe he is only stubborn, as his mother always said he was." } },
      choices = {
        { text = "Stubbornness has its uses.", next = "BACK", reply = "Ha! So Krolg's mother also said, when she was not angry with him.", fx = { affinity = 1 } },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "n_default", text = "Ran Bloodtooth is the worst, a cruel hunter who has killed many who would not follow, and he camps to the north with the bones of the dead about him. Above him is Chief Murgut, who holds the Foulweald with his totem and his fear." } },
      choices = {
        { text = "What must be done about them?", next = "done" },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "Bloodtooth must die first, for while he lives the frightened ones cannot leave. Then the chief must be called out at the totem mound and broken there, where all the tribe can see that his strength was only a sickness." } },
      choices = { { text = "It is hard counsel, but I hear it.", next = "BACK" } },
    },
    lonely = {
      lines = { { id = "l_default", text = "Yes. A furbolg is not made to live alone, and Krolg talks to the fire so that he does not forget how. The elf woman Raene sends friends sometimes, and that is a kindness he did not expect from her people." } },
      choices = { { text = "She is a good friend to have. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The tree-speakers were friends to the furbolgs before any other of the tall folk. It was one of yours, old Dartol, who made the rod so that he could sit at our fires, and Krolg is glad it still makes friends." } },
      choices = { { text = "So am I. Something else, Krolg.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Krolg was a honey gatherer of the Foulweald. Now he is only Krolg, and the hut is his whole tribe." } },
    furbolgs = { { id = "tp_fur", text = "My people are sick, not wicked. Remember that when you must raise your weapon to them." } },
    _none = { { id = "tp_none", text = "Krolg knows the woods and the tribe, and not that. Ask the elf woman Raene, who knows the tall folk's troubles." } },
  },
}

-- Anilia: a dryad lying wounded at Xavian. Classic: found for Vile Satyr! Dryads in Danger!; gives The Branch of Cenarius.
P:NPC {
  key = "anilia", id = TODO_NPC("Anilia"), name = "Anilia", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "fading", "brave" }, values = { "nature", "duty" },
  notices = { "class" },
  impression = {
    first = "Anilia is a dryad I found lying among the satyrs' stones at Xavian, too badly hurt to rise. She spent what breath she had on the Branch of Cenarius and on her friend Illiyana, and none of it on herself.",
    third = "{name} found the dryad Anilia dying at Xavian, where the satyr Geltharis had taken the Branch of Cenarius from her.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a friendly face, here of all places. Come close, please, for I cannot speak loudly any more." },
    { id = "g_illiyana", when = { questActive = TODO_QUEST("Vile Satyr! Dryads in Danger!") }, text = "Illiyana sent you? Dear Illiyana, I knew she would not forget me. Come close, for there is little time." },
    { id = "g_branch", when = { questActive = TODO_QUEST("The Branch of Cenarius") }, text = "Do not stay with me, kind one. Find Geltharis and take back the Branch, for that is all I ask." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the grove! Father's blessing is on you, I can feel it, and it eases me to have one of his own beside me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_branch", when = { questActive = TODO_QUEST("The Branch of Cenarius") }, text = "Geltharis will be near, gloating over what he stole, for satyrs cannot keep from gloating. Take the Branch from him and carry it to Illiyana, and tell her I was not afraid." },
        { id = "h_default", text = "I am Anilia, a daughter of Cenarius, and I was the keeper of his Branch. The satyrs caught me in these woods and their lord Geltharis tore it from my hands, and I fear they have done for me in the taking." },
      },
      again = {
        { id = "h_again", text = "Ask quickly, friend, while I can still answer." },
        { id = "h_again2", text = "I am still here, a little. What would you know?" },
      },
      choices = {
        { text = "What is the Branch of Cenarius?", next = "branch" },
        { text = "Who is Geltharis?", next = "geltharis" },
        { text = "Let me tend your wounds.", next = "wounds" },
        { text = "Illiyana is waiting at the Shrine for you.", next = "illiyana" },
        { text = "A druid's healing may still reach you.", next = "druid", when = { class = "DRUID" } },
        { text = "Rest now. I will find him.", next = "END" },
      },
    },
    branch = {
      lines = { { id = "b_default", text = "A living bough that Father gave into our keeping, long ago, with his own blessing in the wood. In a dryad's hands it makes the forest glad, and I cannot bear to think what a satyr will make it do.", fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "What could a satyr do with it?", next = "misuse" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    misuse = {
      lines = { { id = "m_default", text = "Twist it, as they twist everything, until the blessing in it becomes a blight. They have already fouled the moonwells of this place, and with the Branch they could sicken groves that have stood since the world was whole." } },
      choices = { { text = "Then he will not keep it. Something else.", next = "BACK" } },
    },
    geltharis = {
      lines = { { id = "g_gel", text = "The lord of the satyrs of Xavian, and the cruellest of them. He will be close by, among his servants, for he likes to stand near what he has broken.", fx = { learn = { "satyrs" } } } },
      choices = { { text = "He will answer for this. Something else.", next = "BACK" } },
    },
    wounds = {
      lines = { { id = "w_default", text = "You are kind, but their blades were fouled, and it is past the mending of hands. Do not grieve, for a dryad goes back to the forest, and I should much rather you spent your strength on the Branch." } },
      choices = { { text = "As you wish, brave one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    illiyana = {
      lines = { { id = "i_default", text = "She will blame herself, because she always does. Tell her that we chased each other through these woods for a thousand springs, and that I would not trade one of them for a longer life." } },
      choices = { { text = "I will tell her every word. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "I feel it, like sun through leaves, and it takes the pain away. It will not hold me here, child of the grove, but it lets me go gently, and that is a great gift." } },
      choices = { { text = "Go gently, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a daughter of Cenarius, and I kept his Branch. That is all I was, and it was enough." } },
    satyrs = { { id = "tp_sat", text = "They hate everything green. Do not listen when they speak, for they only speak to wound." } },
    _none = { { id = "tp_none", text = "I cannot think of that now, friend. Please, only the Branch." } },
  },
}
