-- Barrens folk the roster scan found missing, part one: Camp Taurajo's Gahroot (butcher), Kelsuwa (stable
-- master) and Sanuye Runetotem (leather armor); Brine (Call of Water) in the southern hills; Takar the Seer
-- (the Alliance warlocks' seer, camped east of Taurajo); Vrang Wildgore (smith and trapper north-west of
-- Dreadmist Peak); Lanti'gah at Regthar's bunker; Jorb, Lizzarik's ogre; and Pilot Wizzlecrank of the
-- Sludge Fen shredder. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Gahroot: butcher, Camp Taurajo.
P:NPC {
  key = "gahroot", id = TODO_NPC("Gahroot"), name = "Gahroot", title = "Butcher", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "taurajo" }, temper = { "calm", "thorough" }, values = { "hunt", "thrift" },
  notices = { "class" },
  impression = {
    first = "Gahroot is the butcher of Camp Taurajo, a broad tauren who works slowly and wastes nothing. He thanks each animal under his breath before the knife goes in, and he sells the meat without hurrying anyone.",
    third = "{name} met Gahroot, the butcher of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Peace to you, {class}. The meat is fresh today, and the hunters who brought it were thankful, as you should be when you eat it." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter is always welcome at my block. Tell me what you have taken lately, and whether you used all of it." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and hungry, I think. The road through the southern Barrens does that to everyone." },
  },
  notice = {
    { id = "n_skin", cat = "class", when = { profession = "Skinning" },
      text = "I see a skinning knife on your belt, and it is well kept. Sanuye will want to speak with you, for he is always short of good hides." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Gahroot, and I cut the meat for Camp Taurajo. The hunters bring me kodo and zhevra and the long-legged striders, and I see that none of what the Earth Mother gave is thrown away." } },
      again = {
        { id = "h_again", text = "What else would you ask? My knife can rest a moment." },
        { id = "h_again2", text = "Speak, friend. The meat will keep in this shade." },
      },
      choices = {
        { text = "What does it mean to waste nothing?", next = "waste" },
        { text = "How is the hunting near Taurajo?", next = "hunting" },
        { text = "What game would you have me bring in?", next = "bring", when = { class = "HUNTER" } },
        { text = "Walk with the Earth Mother, Gahroot.", next = "END" },
      },
    },
    waste = {
      lines = { { id = "w_default", text = "The meat feeds the camp, the hide goes to Sanuye, the sinew to the bowyers, and the bones are boiled for Byula's stew pot. Even the horn of a kodo becomes a cup or a call, so the animal goes on being useful long after it has stopped running." } },
      choices = {
        { text = "And what do you say to it, before the knife?", next = "thanks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks = {
      lines = { { id = "t_default", text = "Only what my father said, which is that we know what it gave and we will not forget. It is a small thing to say, but I have never eaten well on a day I forgot to say it." } },
      choices = { { text = "That's a good custom. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunting = {
      lines = { { id = "h2_default", text = "The herds are thinner than they were, and it troubles me. The quilboar of the Razorfen kill more than they eat, and the dwarves' blasting at Bael Modan drives the kodo north, so our hunters walk farther each season for the same meat.", fx = { learn = { "razorfen" } } } },
      choices = { { text = "Something else, Gahroot.", next = "BACK" } },
    },
    bring = {
      lines = { { id = "b_default", text = "Bring whatever you take cleanly, and nothing you killed only to see it fall. A thunderhawk is tough eating and a hyena is worse, but I can make a meal of either, and I would sooner do that than see them left for the flies." } },
      choices = { { text = "I'll take only what I'll use. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father cut meat for the tribe when we still wandered, and I cut it now that we have a camp. The work is the same, though the walking is less." } },
    razorfen = { { id = "tp_rf", text = "The quilboar leave carcasses to rot along the south road. I have seen it, and it is a hard thing for a butcher to look at." } },
    _none = { { id = "tp_none", text = "That I do not know, friend. Ask Jorn Skyseer, who sees further than a butcher does." } },
  },
}

-- Kelsuwa: stable master, Camp Taurajo.
P:NPC {
  key = "kelsuwa", id = TODO_NPC("Kelsuwa"), name = "Kelsuwa", title = "Stable Master", gender = "male",
  bible = "bibles/missed.md", role = "stablemaster", tier = "service",
  communities = { "taurajo" }, temper = { "gentle", "watchful" }, values = { "beasts", "patience" },
  notices = { "pet" },
  impression = {
    first = "Kelsuwa keeps the stable at Camp Taurajo, and the hunters' beasts go quiet when he walks among them. He speaks to animals at the same unhurried pace he speaks to people, and he seems to get better answers from them.",
    third = "{name} met Kelsuwa, the stable master of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, {class}. Step softly past the pens, for there is a raptor in the third one who has not yet decided to like anyone." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Welcome, hunter. I will look at your companion before I look at you, if you will forgive it, since that is where I learn the most." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and the beasts knew your step before I did. They remember kindly, which is a good sign." },
  },
  notice = {
    { id = "n_cat", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} stands easily beside you, and that tells me much. Keep that one fed, friend, for a hungry beast remembers what it was before it knew you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Kelsuwa, and I tend the beasts that hunters leave in my care while they rest or travel on. Every creature here is somebody's companion, and I treat it as I would want mine treated." } },
      again = {
        { id = "h_again", text = "Is there more you would know? The beasts are settled for now." },
        { id = "h_again2", text = "Ask, friend, but quietly, for the raptor is listening." },
      },
      choices = {
        { text = "How do you calm a beast that isn't yours?", next = "calm" },
        { text = "What worries a stable master down here?", next = "worry" },
        { text = "What do you see when you look at my beast?", next = "see", when = { class = "HUNTER" } },
        { text = "May the winds be kind to you, Kelsuwa.", next = "END" },
      },
    },
    calm = {
      lines = { { id = "c_default", text = "I do nothing, for as long as it takes. A beast left behind is afraid its hunter will not come back, so I sit where it can see me and let it learn that I am not in a hurry and neither is the day." } },
      choices = {
        { text = "And the raptor in the third pen?", next = "raptor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptor = {
      lines = { { id = "r_default", text = "She belongs to a troll who went south toward the Razorfen eleven days ago, and she counts the days better than I do. I have told her he will return, and I hope the Earth Mother does not make a liar of me.", fx = { learn = { "razorfen" } } } },
      choices = { { text = "I hope he comes back for her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    worry = {
      lines = { { id = "w_default", text = "The hyenas come close to the pens at night and laugh, and the beasts do not sleep. Worse is the thunder from Bael Modan when the dwarves blast, because I cannot explain to a frightened kodo that the sky is not falling." } },
      choices = { { text = "Something else, Kelsuwa.", next = "BACK" } },
    },
    see = {
      lines = { { id = "s_default", text = "I see whether it watches you or watches the horizon. A beast that watches its hunter has been treated well, and from the way yours stands, I think you have little to learn from me." } },
      choices = { { text = "That's good to hear. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I herded kodo as a calf, before the tribes came to rest in Mulgore. Beasts taught me patience, and I am still their student." } },
    razorfen = { { id = "tp_rf", text = "The quilboar keep boars as we keep kodo, yet they treat them cruelly. I do not understand a people who would do that." } },
    _none = { { id = "tp_none", text = "I have no answer for that, friend. The beasts do not speak of such things, and they are my chief company." } },
  },
}

-- Sanuye Runetotem: leather armor merchant, Camp Taurajo.
P:NPC {
  key = "sanuye", id = TODO_NPC("Sanuye Runetotem"), name = "Sanuye Runetotem", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "taurajo" }, temper = { "thoughtful", "dry" }, values = { "craft", "balance" },
  notices = { "kit" },
  impression = {
    first = "Sanuye Runetotem sells leather armor at Camp Taurajo, and every piece on his racks is soft at the joints and hard where a spear would land. He is of the Runetotem, and he talks about hides the way his kin talk about the seasons.",
    third = "{name} met Sanuye Runetotem, who sells leather armor at Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, {class}. Feel the leather before you ask the price, for a hide will tell you more than I can." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid, and welcome. My kin walk your path in Thunder Bluff, and I only dress those who walk it." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and the leather has shaped itself to you. It does that for those who wear it honestly." },
  },
  notice = {
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a great deal of iron, friend. I do not sell it, and I confess I do not understand wanting to clank across land this quiet." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sanuye of the Runetotem. I take the hides Gahroot sets aside and make of them something that will bring a hunter home, which seems to me a fair second life for a kodo." } },
      again = {
        { id = "h_again", text = "What more would you ask? I am in no hurry, and neither is the leather." },
        { id = "h_again2", text = "Speak on, friend." },
      },
      choices = {
        { text = "A Runetotem selling armor? I expected a druid.", next = "runetotem" },
        { text = "What makes good leather?", next = "leather" },
        { text = "Does a druid need armor at all?", next = "druid", when = { class = "DRUID" } },
        { text = "May the eternal sun shine on you, Sanuye.", next = "END" },
      },
    },
    runetotem = {
      lines = { { id = "r_default", text = "Not every calf of my tribe hears the Dream, and I did not, though I listened for it long enough. Arch Druid Hamuul told me there are many ways to keep the balance, and that clothing its keepers is one of them." } },
      choices = {
        { text = "Do you regret not hearing it?", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = { { id = "rg_default", text = "I did when I was young, and I do not now. A hide worked well is its own kind of listening, and I have fewer strange dreams than my cousins do." } },
      choices = { { text = "A dry answer, and a fair one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    leather = {
      lines = { { id = "l_default", text = "Time, more than anything else. I smoke each hide for many days over a slow fire and work it by hand, because leather that is hurried cracks in the first rain, and the southern Barrens gives little warning of its rain." } },
      choices = { { text = "Something else, Sanuye.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Your bear's hide is thicker than anything I sell, it is true. But you will not always have time to change your shape, and the quilboar of the Razorfen do not wait politely while you do." } },
      choices = { { text = "Then I'll wear it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born under the Runetotem's lodge poles and trained to the tanning fire. Both have served me well." } },
    _none = { { id = "tp_none", text = "I cannot say, friend. The wind carries much news through this camp, but it does not always stop at my racks." } },
  },
}

-- Brine: orc shaman alone in the southern Barrens hills; Call of Water.
P:NPC {
  key = "brine", id = TODO_NPC("Brine"), name = "Brine", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "taurajo" }, temper = { "still", "searching" }, values = { "water", "hope" },
  notices = { "class" },
  impression = {
    first = "Brine is an orc shaman who lives by herself on a hill in the south of the Barrens, with quilboar country all around her. She studies water in a land that has almost none, and she asks every visitor why they have come before she tells them anything.",
    third = "{name} met Brine, an orc shaman of the southern Barrens who guides young shaman toward the spirit of water.",
  },
  greetings = {
    { id = "g_default", text = "You climbed a long way to find one orc on a hill, {class}. Tell me why, and tell it truly, because I'll know if you don't." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman on my hill, and thirsty for more than drink. Islen sends them to me when they're ready, so we'll see whether she judged you well." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back up the hill. The water said you would, though it doesn't always say when." },
  },
  notice = {
    { id = "n_troll", cat = "class", when = { race = "Troll" },
      text = "A Darkspear, born with the sea on every side. You'll find it strange that I look for water here, and some days so do I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_call", when = { questActive = TODO_QUEST("Call of Water") },
          text = "Islen Waterseer sent you from her shore, so you already know that water gives life back and that fouled water takes it. What you don't know yet is how far you'll walk to learn the rest." },
        { id = "h_default", text = "I am Brine. I came to the driest place I could find to learn about water, because you only understand a thing properly when you've had to go without it." },
      },
      again = {
        { id = "h_again", text = "Ask what else you carried up the hill with you." },
        { id = "h_again2", text = "Go on. I've nothing but time and a little water." },
      },
      choices = {
        { text = "Why study water where there is none?", next = "dry" },
        { text = "Aren't you afraid, alone among the quilboar?", next = "alone" },
        { text = "You said hope. What do you hope for?", next = "hope" },
        { text = "What must I do to hear the water?", next = "task", when = { class = "SHAMAN" } },
        { text = "I'll go back down the hill.", next = "END" },
      },
    },
    dry = {
      lines = { { id = "d_default", text = "There is some, and that's the lesson. The oases north of here are green in the middle of dust, and every beast in the Barrens knows the way to them, so tell me which is stronger, the dust or the water.", fx = { learn = { "oases" } } } },
      choices = {
        { text = "The water, since everything walks to it.", next = "dry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry2 = {
      lines = { { id = "d2_default", text = "Good, and you answered without stopping to think, which is how I know you believe it. Fire and earth announce themselves, {class}, but water wins by being needed, and that's a quieter sort of power than most orcs are taught to respect." } },
      choices = {
        { text = "Is that why so few orcs follow it?", next = "dry3" },
        { text = "Something else, Brine.", next = "BACK" },
      },
    },
    dry3 = {
      lines = { { id = "d3_default", text = "Our people chose fire once, the worst sort, and it burned us hollow. I think the Horde needs shaman who know how to mend more than it needs ones who know how to scorch, though I wouldn't say so in front of Kranal Fiss." } },
      choices = { { text = "I won't repeat it to him. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    alone = {
      lines = { { id = "a_default", text = "The Bristlebacks know I'm here, and they leave me be, for the most part. A quilboar respects a shaman even when it's the wrong sort of shaman, and I've made it plain that this hill would be costly to take.", fx = { learn = { "quilboar" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hope = {
      lines = { { id = "ho_default", text = "When I was small, someone told me that even in the worst pain there is a sliver of hope, some small thing a person can rally to. I've come to think that for our people the small thing was water, the first clean drink after the camps." } },
      choices = { { text = "That's worth climbing a hill for. Something else.", next = "BACK" } },
    },
    task = {
      lines = { { id = "t_default", text = "You'll carry water for me, from three places that are a long way apart. The first is the old well below this hill, and after that the spirits will send you north to Ashenvale and then across the sea to Tarren Mill." } },
      choices = {
        { text = "Why those three, and not any water?", next = "task2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task2 = {
      lines = { { id = "t2_default", text = "Because each has kept itself pure with ruin all around it, and you need to taste what that's like before Islen sends you to water that hasn't. Bring them all back to her, and don't spill any on the road." } },
      choices = { { text = "I'll carry them carefully. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I left Orgrimmar to learn the one element nobody there had time for. That's all there is to tell, and the rest is water." } },
    oases = { { id = "tp_oa", text = "The oases are the Barrens' heart, and something has been troubling them lately. The water tastes of it." } },
    quilboar = { { id = "tp_qb", text = "They pray to their own spirits in the thorns below me. I don't love them, but I'd be lying if I said they had no faith." } },
    _none = { { id = "tp_none", text = "The water hasn't told me anything of that, {class}, and I don't hear much else up here." } },
  },
}

-- Takar the Seer: human seer camped east of Camp Taurajo; Alliance warlocks' succubus quest.
P:NPC {
  key = "takar", id = TODO_NPC("Takar the Seer"), name = "Takar the Seer", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "serene", "odd" }, values = { "sight", "solitude" },
  notices = { "class" },
  impression = {
    first = "Takar the Seer is a human who keeps a small camp alone in the grass east of Camp Taurajo, a long way from any Alliance wall. He speaks to visitors as though he had already had the conversation once, and is being polite about hearing it again.",
    third = "{name} met Takar the Seer, a human hermit in the southern Barrens who looks through time for those who ask.",
  },
  greetings = {
    { id = "g_default", text = "There you are, {class}. I had the kettle on a little early, I'm afraid, but you've made good time across the grass." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Was the crossing hard, warlock? You've come a long way from the Mage Quarter, and I know who sent you and what you're after." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, just as I thought you'd be. Do sit, since the hyenas rarely trouble this fire." },
  },
  notice = {
    { id = "n_nelf", cat = "class", when = { race = "NightElf" },
      text = "One of the kaldorei, here in the open sun. I've looked at a great deal of your people's past, and I hope you'll forgive the intrusion." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_devourer", when = { questActive = TODO_QUEST("Devourer of Souls") },
          text = "Gakin was wise to send you to me, and fear not, for I can help. You need a symbol of love to tempt the creature you mean to bind, and I've looked across the world for one on your behalf." },
        { id = "h_default", text = "I am Takar, and people call me a seer, which is near enough. I look over the world and back through the mists of its years, and now and then somebody crosses an ocean to ask me what I saw." },
      },
      again = {
        { id = "h_again", text = "Yes, I thought you'd ask something more. Go on." },
        { id = "h_again2", text = "Ask away, {class}. I'll try to look surprised." },
      },
      choices = {
        { text = "Why would a seer live out here, among the Horde?", next = "why" },
        { text = "What do you see when you look?", next = "see" },
        { text = "The tauren camp is close. Do they trouble you?", next = "tauren" },
        { text = "Where is this symbol of love?", next = "heart", when = { questActive = TODO_QUEST("Devourer of Souls") } },
        { text = "What do you know of my craft, Seer? Speak plainly.", next = "craft", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because a city is terribly loud to a man with my sort of ears. In Stormwind I saw every stone's whole history every time I crossed the street, and here there is only grass, which remembers very little and says less." } },
      choices = {
        { text = "Don't your friends want you back?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Gakin writes now and then to say I ought to return to civilization, as he puts it. I always mean to answer, and then I look ahead and see that I didn't, so I save myself the ink." } },
      choices = { { text = "That's one way to keep up a friendship.", next = "BACK", fx = { affinity = 1 } } },
    },
    see = {
      lines = { { id = "s_default", text = "Whatever I turn toward, though the old things are clearest, because they have stopped moving. I've watched the War of the Ancients more times than I'd like, and it doesn't get any easier to see how it ends for most of them." } },
      choices = {
        { text = "And the future?", next = "see2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    see2 = {
      lines = { { id = "s2_default", text = "The future is mist with shapes in it, and I've learned not to describe the shapes. A man who is told what's coming walks straight into it trying to get out of the way, and I've enough on my conscience." } },
      choices = {
        { text = "You must have seen something of mine.", next = "see3" },
        { text = "Something else, Takar.", next = "BACK" },
      },
    },
    see3 = {
      lines = { { id = "s3_default", text = "I saw you arrive, and I saw you leave again on your own feet, which is more than I see for many who come this way. You'll have to be content with that, {class}, and so will I." } },
      choices = { { text = "On my own feet will do. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "Their braves come to the edge of the firelight, look at me for a while, and go away again. I think they've decided a lone old man talking to the air is more likely holy than dangerous, and I've done nothing to correct them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heart = {
      lines = { { id = "h2_default", text = "Long ago two elven lovers fought the Legion side by side, and they died within a breath of each other on the same ground. A tree grew where they fell, which the elves call the heartswood, and you'll find it in the ruins of Ordil'Aran in the north-west of Ashenvale." } },
      choices = {
        { text = "It seems a poor use for such a thing.", next = "heart2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heart2 = {
      lines = { { id = "h3_default", text = "It is, and I'm glad that it troubles you, because a warlock it didn't trouble is one I'd not have helped. The demon you're after feeds on exactly this, so see that you remain the one holding the bait." } },
      choices = { { text = "I'll remember who holds it. Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "c_default", text = "Enough to know that those who practise it rarely grow old, and that Gakin has managed to, which is why I trust his students more than most. He teaches them to be afraid at the proper moments." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a man of Stormwind once, and I left when the seeing grew too loud. I'd rather not say more, and I know that you won't press me." } },
    _none = { { id = "tp_none", text = "I haven't looked that way, {class}, and I'd rather not guess. Guessing is how seers get a bad name." } },
  },
}

-- Vrang Wildgore: weaponsmith, armorcrafter and trapper camped north-west of Dreadmist Peak; a bad leg.
P:NPC {
  key = "vrang", id = TODO_NPC("Vrang Wildgore"), name = "Vrang Wildgore", title = "Weaponsmith & Armorcrafter", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "proud", "sore" }, values = { "self_reliance", "word" },
  notices = { "soldier" },
  impression = {
    first = "Vrang Wildgore keeps a camp north-west of Dreadmist Peak, where he sells arms and armor and sets his own traps for supper. His leg is bound and stiff, and it clearly galls him to ask anyone for anything.",
    third = "{name} met Vrang Wildgore, a smith and trapper camped north-west of Dreadmist Peak, laid up with a wounded leg.",
  },
  greetings = {
    { id = "g_default", text = "Hail, {class}. I'd stand to greet you properly, but this cursed leg has other ideas today." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior, and with a sword arm that looks as if it's been used. I may have steel worth your coin, and I may have work for you as well." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The leg is no better, since I can see you looking at it." },
  },
  notice = {
    { id = "n_hunter", cat = "soldier", when = { class = "HUNTER" },
      text = "A hunter, and one who knows a snare from a deadfall, I'd wager. My traps are strewn all over the valley below, so mind you don't step in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_tanner_done", when = { questDone = TODO_QUEST("The Hermit Tanner") },
          text = "The hides reached the ridge, so I've kept my word for another season, and I owe that to you. It doesn't sit easily with me, {class}, but I'll say it plainly all the same." },
        { id = "h_hides", when = { questActive = TODO_QUEST("Bruised Pride and Lion Hides") },
          text = "How goes the hunt? The matriarchs and patriarchs carry the best hides, and I need six of them without a spear hole through the middle." },
        { id = "h_default", text = "I'm Vrang Wildgore. I forge what I sell, I trap what I eat, and I've never owed anyone a thing, until a savannah lion opened my leg and made a liar of me." },
      },
      again = {
        { id = "h_again", text = "What else? Sit, if you're staying, so I needn't look up." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "What happened to your leg?", next = "leg" },
        { text = "Why camp out here, away from the Crossroads?", next = "camp" },
        { text = "Who are the lion hides for?", next = "tanner" },
        { text = "What steel would you put in a warrior's hand?", next = "steel", when = { class = "WARRIOR" } },
        { text = "Rest that leg, Vrang.", next = "END" },
      },
    },
    leg = {
      lines = { { id = "l_default", text = "I went after a patriarch for his hide, and I was thinking about the hide and not about his mate. She came out of the grass on my blind side, and I got the worst of it before I got my axe round." } },
      choices = {
        { text = "It stings to ask a stranger for help, I'd guess.", next = "pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      lines = { { id = "p_default", text = "More than the leg does. But I have obligations, and an orc who lets his word fail to spare his pride has kept the wrong one of the two." } },
      choices = { { text = "That's the right one to keep. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "c_default", text = "The Crossroads has smiths enough, and walls, and too many people telling each other what to do. Out here there's game in the valley and nobody to answer to, though I'll grant the warlocks up on Dreadmist Peak are poor neighbours.", fx = { learn = { "burning_blade" } } } },
      choices = {
        { text = "What do you catch in your traps?", next = "traps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    traps = {
      lines = { { id = "t_default", text = "Hares and prairie fowl, and now and then a young strider that should have known better. I can't walk the line with this leg, so whatever's been caught is sitting there for the hyenas unless somebody fetches it in." } },
      choices = { { text = "Something else, Vrang.", next = "BACK" } },
    },
    tanner = {
      lines = { { id = "ta_default", text = "They go to a tanner I trade with, who cures them and sends me finished leather for my armor work. He's a hermit, and he lives alone on top of the ridge behind my camp, looking out over the Dry Hills." } },
      choices = {
        { text = "What sort of hermit?", next = "tanner2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tanner2 = {
      lines = { { id = "ta2_default", text = "The sort whose looks will give you a start, so I'll warn you now and you needn't reach for your weapon. Whatever he seems to be, he's dealt honestly with me for years and he's a threat to nobody, and I'll swear to that." } },
      choices = {
        { text = "You trust him that far?", next = "tanner3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tanner3 = {
      lines = { { id = "ta3_default", text = "I trust anyone who has never come up short on a bargain, whatever face he wears. There are orcs in Orgrimmar I couldn't say as much for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    steel = {
      lines = { { id = "s_default", text = "For this country, a broadsword and a good coat of scale. The quilboar jab low and the centaur strike from above, so you want something quick in the hand and something solid over the hips and thighs." } },
      choices = { { text = "Sound counsel. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the forge young and the snare younger. Between them I've never needed a village, and I mean to keep it so once this leg knits." } },
    burning_blade = { { id = "tp_bb", text = "Robed fools on Dreadmist Peak, chanting at night. They leave my camp alone, and I've an axe by the bed in case they stop." } },
    _none = { { id = "tp_none", text = "News doesn't climb up to my camp, {class}. Ask at the Crossroads, where they have more of it than they need." } },
  },
}

-- Lanti'gah: keeps Regthar Deathgate's bunker west of the Crossroads. (Our regthar.lua calls him a troll.)
P:NPC {
  key = "lantigah", id = TODO_NPC("Lanti'gah"), name = "Lanti'gah", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "crossroads" }, temper = { "sharp", "grumbling" }, values = { "watchfulness", "mercy" },
  notices = { "soldier" },
  impression = {
    first = "Lanti'gah keeps Regthar Deathgate's bunker in order, a lean troll with a sharp tongue who walks the perimeter and complains about the pigs. No centaur has ever reached the door on his watch, and he will tell you so.",
    third = "{name} met Lanti'gah, the troll who keeps Regthar Deathgate's bunker and watches the Kolkar.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your feet, {class}. Dis be a bunker, I know, but somebody got to sweep it, and dat somebody be me." },
    { id = "g_counter", when = { questActive = TODO_QUEST("Counterattack!") }, text = "Keep counting, mon, you're only halfway there. The Kolkar got plenty more where those came from." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Regthar's in a mood, so nothing has changed since ya left." },
  },
  notice = {
    { id = "n_troll", cat = "soldier", when = { race = "Troll" },
      text = "Another Darkspear, praise the loa. Maybe now somebody here will understand a joke when I make one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Lanti'gah, and I keep this hole in the ground standing while Regthar goes out and shouts at centaur. I mind the stores, I walk the line at night, and I feed those pigs, which nobody thanks me for." } },
      again = {
        { id = "h_again", text = "What else, mon? I got a perimeter to walk." },
        { id = "h_again2", text = "Go on, I'm listening with one ear." },
      },
      choices = {
        { text = "What's wrong with the pigs?", next = "pigs" },
        { text = "How close do the Kolkar come?", next = "kolkar" },
        { text = "Regthar says you'd spare the centaur who run.", next = "spare" },
        { text = "Keep the door shut, Lanti'gah.", next = "END" },
      },
    },
    pigs = {
      lines = { { id = "p_default", text = "Dey scream at dawn, dey eat the stores if I turn my back, and one of them has learned to open the gate. Regthar says they feed his scouts, and dat's true, but he don't have to sleep downwind." } },
      choices = { { text = "A pig that opens gates? Something else.", next = "BACK" } },
    },
    kolkar = {
      lines = { { id = "k_default", text = "Close enough that I hear their hooves when the wind be from the west. They come in out of the Forgotten Pools and down from the hills, and their khans keep sending them because a centaur would sooner die than be called slow.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "And none has reached the bunker?", next = "kolkar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kolkar2 = {
      lines = { { id = "k2_default", text = "Not one, mon, and I'd like dat written down somewhere. Regthar gets the songs because he kills them in daylight, but it's the night watch dat keeps his bed from being trampled." } },
      choices = { { text = "I'll remember who keeps the night. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    spare = {
      lines = { { id = "s_default", text = "I said a beaten enemy who runs home tells the others what it cost, and a dead one tells nobody. Regthar calls dat soft, but my people been hunted to the edge more than once, and I know what it teaches you." } },
      choices = { { text = "It's a hard-won sort of soft. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came over the sea with Vol'jin's people and ended up keeping house for an orc in a burrow. The loa got a strange sense of humor." } },
    centaur = { { id = "tp_ce", text = "Kolkar, mon, all hooves and pride. They hate us for being here, and they'd hate each other if we left." } },
    _none = { { id = "tp_none", text = "Dat's not come past my door, mon, and everything comes past my door. Ask Regthar, if you like being shouted at." } },
  },
}

-- Jorb: ogre bodyguard walking beside Lizzarik's cart, Crossroads to Ratchet.
P:NPC {
  key = "jorb", id = TODO_NPC("Jorb"), name = "Jorb", title = "Lizzarik's Bodyguard", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "ratchet" }, temper = { "slow", "placid" }, values = { "pay", "food" },
  notices = { "soldier" },
  impression = {
    first = "Jorb is the ogre who walks beside Lizzarik's cart on the road between the Crossroads and Ratchet. He carries no weapon because he has never needed one, and he watches the goblin's customers with the patience of a boulder.",
    third = "{name} met Jorb, the ogre who guards the weapon merchant Lizzarik on the Ratchet road.",
  },
  greetings = {
    { id = "g_default", text = "You talk to little boss if you want to buy. Jorb only stands here and looks at you." },
    { id = "g_back", when = { metBefore = true }, text = "Jorb knows your face now. You did not steal last time, so Jorb likes you a little." },
    { id = "g_big", when = { race = { "Tauren", "Orc" } }, text = "You are big, for a small one. Jorb is still bigger, so you be nice to little boss." },
  },
  notice = {
    { id = "n_rogue", cat = "soldier", when = { class = "ROGUE" },
      text = "Jorb sees your hands, sneaky one. Keep them where Jorb sees them and nobody gets sat on." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Me Jorb. Little boss Lizzarik sells the swords, and Jorb makes sure nobody takes a sword without giving the shiny first. It is easy work, because Jorb only has to stand close." } },
      again = {
        { id = "h_again", text = "You want to ask Jorb more? Jorb has time while the cart goes slow." },
        { id = "h_again2", text = "Ask. Jorb listens and walks." },
      },
      choices = {
        { text = "Why does an ogre work for a goblin?", next = "why" },
        { text = "Have you ever had to fight for him?", next = "fight" },
        { text = "Where does an ogre come from, out here?", next = "from" },
        { text = "Walk well, Jorb.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Little boss pays every week and never hits Jorb, and there is meat at the end of the road. Ogre bosses hit a lot and pay nothing, so Jorb thinks the goblin way is smarter." } },
      choices = {
        { text = "Does he pay you fairly?", next = "pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      lines = { { id = "p_default", text = "Little boss says it is fair, and he says it very fast with a lot of numbers. Jorb cannot follow the numbers, but Jorb counts the coins after, and it is the same count every week, so maybe it is fair." } },
      choices = { { text = "Keep counting them, Jorb. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fight = {
      lines = { { id = "f_default", text = "One time the horse-men came at the cart, and Jorb picked one up and threw him at the others. After that they went away, and little boss was happy until he saw the dent in his cart.", fx = { learn = { "centaur" } } } },
      choices = { { text = "A dent seems a fair price. Something else.", next = "BACK" } },
    },
    from = {
      lines = { { id = "fr_default", text = "Jorb came up from the hot sand in the south, where the goblins have a town with a wall around it. A goblin there told Jorb there was work on the Ratchet road, and Jorb walked until he found the cart." } },
      choices = { { text = "That's a long walk. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Jorb was in the sand, and now Jorb is on the road. Jorb likes the road better because it has more shade and more meat." } },
    _none = { { id = "tp_none", text = "Jorb does not know that. Ask little boss, he knows everything and tells it fast." } },
  },
}

-- Pilot Wizzlecrank: climbs out of his shredder at the end of The Escape.
P:NPC {
  key = "pilot_wizzlecrank", id = TODO_NPC("Pilot Wizzlecrank"), name = "Pilot Wizzlecrank", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "ratchet" }, temper = { "jumpy", "fast" }, values = { "profit", "survival" },
  notices = { "craft" },
  impression = {
    first = "Pilot Wizzlecrank is a goblin who drove a Venture Company shredder at the Sludge Fen until he decided the company's secrets were worth more in Ratchet. He is out of the machine now and talking very quickly, with one eye on the road behind him.",
    third = "{name} met Pilot Wizzlecrank, a goblin shredder pilot who ran from the Venture Company with their plans.",
  },
  greetings = {
    { id = "g_default", text = "Whoa, whoa, easy, pal, I'm one of the good ones now, or good-adjacent anyway. Keep your voice down and we'll both live to see a payday." },
    { id = "g_escape", when = { questDone = TODO_QUEST("The Escape") }, text = "There's my escort! Listen, that was the best protection I never paid for, and I mean that as the highest compliment a goblin's got." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good, good. You see anybody in Venture Company colors behind you on the way here?" },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Then you know what that shredder cost, and you know it about killed me to walk away from the thing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Wizzlecrank's the name, formerly of the Venture Company, shredder division, and currently between employers. I walked out of the Sludge Fen with their shredder plans in my head, and that's the kind of severance package they send people after you for.", fx = { learn = { "venture_company" } } } },
      again = {
        { id = "h_again", text = "Make it quick, friend, I'm on a schedule and the schedule is don't get caught." },
        { id = "h_again2", text = "Yeah, yeah, go on, I'm listening and watching the road." },
      },
      choices = {
        { text = "Why turn on the Venture Company?", next = "why" },
        { text = "What happens to the shredder?", next = "shredder" },
        { text = "Where do the plans go now?", next = "plans" },
        { text = "A shredder's a fine machine. Who built yours?", next = "built", when = { profession = "Engineering" } },
        { text = "Good luck, pilot.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I ran the numbers, pal, and the numbers stank. The company pays a pilot in scrip, bills him for the fuel, and docks him for every tree he doesn't cut, so I figured the plans were worth more to somebody else than my whole career was to them." } },
      choices = {
        { text = "So it's only about the money.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "It's always about the money, that's just honest bookkeeping. But I'll tell you for free that I've seen what they pour into that fen, and I wouldn't drink downstream of it for all the gold in Undermine." } },
      choices = { { text = "That's nearly a conscience. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shredder = {
      lines = { { id = "s_default", text = "She stays where she stopped, sparks and sprockets, and it breaks my heart. The boiler's cooked and the left saw arm was never right, so I shut her down for good before the company could tow her home and put some other sap in the seat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plans = {
      lines = { { id = "p_default", text = "Straight to Sputtervalve in Ratchet, who's with the Tinkers' Union and pays cash on delivery. The Union's wanted a look inside a Venture Company shredder for years, and I'm about to become their favorite person, at very reasonable rates.", fx = { learn = { "steamwheedle" } } } },
      choices = { { text = "Something else, Wizzlecrank.", next = "BACK" } },
    },
    built = {
      lines = { { id = "b_default", text = "Company shop, lowest bidder, and you could tell. I rebuilt the pressure valves myself on my own time, which the company called unauthorized modification, and which I called not blowing up." } },
      choices = { { text = "I'd have done the same. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Six years cutting timber for the Venture Company and nothing to show for it but a cough. I'm in business for myself now, as of about an hour ago." } },
    venture_company = { { id = "tp_vc", text = "Worst outfit I ever worked for, and I've worked for my uncle. They'd strip the Barrens to bedrock and bill the bedrock." } },
    _none = { { id = "tp_none", text = "No idea, pal, and I'm not sticking around to find out. Ask in Ratchet, everybody there knows somethin'." } },
  },
}
