-- Brave Windfeather, walking the road between Camp Narache and Grull Hawkwind's camp. Voice: bibles/windfeather.md
-- A young brave who has watched others fail against Chief Sharptusk and is tired of watching.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "windfeather", id = TODO_NPC("Brave Windfeather"), name = "Brave Windfeather",
  bible = "bibles/windfeather.md", role = "soldier", tier = "quest",
  communities = { "narache" }, temper = { "earnest" }, values = { "brave", "protective" },
  notices = { "class", "kit" },
  impression = {
    first = "Brave Windfeather walks the road on Red Cloud Mesa with a spear and no patience left for Chief Sharptusk. She speaks plainly about the price the tauren paid for their home and means to see it paid back.",
    third = "{name} met Brave Windfeather on the road through Red Cloud Mesa, a young brave who wanted Chief Sharptusk Thornmantle's head.",
  },

  greetings = {
    { id = "g_road", text = "Walk with me, if you like. I don't stop moving on this road, and the quilboar have learned to respect that." },
    { id = "g_active", when = { questActive = TODO_QUEST("Break Sharptusk!") }, text = "Sharptusk is in Brambleblade Ravine, east of here, and he keeps to the middle of his camp like a coward." },
    { id = "g_done", when = { questDone = TODO_QUEST("Break Sharptusk!") }, text = "The ravine's quieter since Sharptusk fell. I still walk this road, though, because quiet never lasts." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}! I wondered if you'd gone back to Narache or gone on to Bloodhoof." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "Look at you! You were a newcomer when you went into that ravine for me, and now you walk like a proper brave." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The camp says you've been helping wherever you're asked. That's what a brave does, and it's good to hear." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "HUNTER" } },
      text = "You carry your weapon like you mean it. Good, because the quilboar only listen to people who do." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's half falling off you. The Bristleback will find every hole in it, so mend it first." },
  },

  start = "hello",
  nodes = {
    op_quilboar = {
      lines = {
        { id = "opq_q", text = "Some of the elders say the quilboar were here first, and that we should treat with them. I say look at what they've done on Red Cloud Mesa, and then tell me how. What do you say?" },
      },
      choices = {
        { text = "They kill our young. There's nothing to talk about.", next = "op_quilboar_r1", fx = { affinity = 2, align = { light = -1 }, opinion = { quilboar = "war" } } },
        { text = "They were here first. We should try to make peace.", next = "op_quilboar_r2", fx = { affinity = -1, align = { light = 1 }, trait = { kind = 1 }, opinion = { quilboar = "peace" } } },
        { text = "Drive them off Mulgore and let them have the Barrens.", next = "op_quilboar_r3", fx = { trait = { practical = 1 }, opinion = { quilboar = "drive_out" } } },
        { text = "I'll leave that to the elders, Windfeather.", next = "BACK" },
      },
    },
    op_quilboar_r1 = {
      lines = {
        { id = "op_quilboar_r1", text = "That's what I tell the elders, and they tell me I'm young and angry. I'm both, and I'm still right about Sharptusk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_quilboar_r2 = {
      lines = {
        { id = "op_quilboar_r2", text = "Try it, then, and take a spear with you when you go. If Sharptusk sits down to talk, I'll eat my own feathers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_quilboar_r3 = {
      lines = {
        { id = "op_quilboar_r3", text = "The Barrens already have more quilboar than grass, so they'd hardly notice. I'll take that, if the elders will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brave Windfeather. I walk the road between Camp Narache and Grull's hunting camp, because the Bristleback like to ambush anyone who walks it alone, and their chief, Sharptusk Thornmantle, sends them." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Break Sharptusk!") },
          text = "{name}, I've heard of you, newcomer, and perhaps you're the one who will help us where others have failed. We tauren carved a home out of this land, but not without a cost, and the Bristleback of Brambleblade Ravine make us pay it again every day. Their chief is Sharptusk Thornmantle, and I want his head." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Break Sharptusk!"), days = 3 } },
          text = "Justice was done today, {name}, and quickly. Let Sharptusk's head serve as a warning to every quilboar who'd threaten our home." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bristleback", min = 25 } }, text = "The Bristleback on the mesa are thinning out, and I can walk this road without a spear in both hands. I know who to thank for it." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep walking while you ask; the plains reward the ones who keep moving." },
        { id = "h_again2", text = "Go on, I'm listening, but I'm watching the brush too." },
      },
      choices = {
        { text = "Who is Sharptusk Thornmantle?", next = "sharptusk" },
        { text = "How did the tauren win this land?", next = "cost" },
        { text = "Why walk the road alone?", next = "road" },
        { text = "I'm a warrior. How do I fight a quilboar chief?", next = "fight", when = { class = "WARRIOR" } },
        { text = "What can I do?", next = "BUSINESS" },
        { text = "Walk safely, Windfeather.", next = "END" },
      },
    },
    sharptusk = {
      lines = { { id = "s_default", text = "Chief of the Bristleback in Brambleblade Ravine, east of here, in a camp of thorns and stolen hides. He sends his raiders up onto the mesa, and when they come back with blood on them, he gives them bigger tusks to wear." } },
      choices = {
        { text = "So others have tried to kill him.", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Two braves from Narache, last season, and they came back carried. Sharptusk is cunning for a quilboar, and he never fights at the edge of his camp, only in the middle where his warriors are thickest." } },
      choices = {
        { text = "Then I'll go through his warriors first.", next = "others_end" },
        { text = "The braves must have been badly hurt.", next = "others_end" },
      },
    },
    others_end = {
      big = true,
      lines = { { id = "oe_default", text = "One walks with a limp now, and the other won't go near the ravine. I don't blame him, but I won't be him, and I won't let this road belong to Sharptusk." } },
      choices = {
        { text = "There's no shame in fear. He did his part.", next = "BACK", reply = "He did, and I've told him so, though he doesn't hear it yet. Maybe someday he'll walk the ravine road again, and I'll be glad to walk it with him.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A brave who won't fight isn't a brave.", next = "BACK", reply = "Don't say that where he can hear it, please. He fought, and he bled for it, and the fear he carries now was earned the hard way.", fx = { align = { light = -1 } } },
        { text = "Something else, Windfeather.", next = "BACK" },
      },
    },
    cost = {
      lines = { { id = "c_default", text = "We wandered for generations, chased by the centaur, until the Warchief helped us drive them from Mulgore. Then we built Thunder Bluff and Bloodhoof and Narache, and each was paid for with someone's life." } },
      choices = {
        { text = "What do you think should be done about the quilboar?", next = "op_quilboar" },
        { text = "Then the land is yours by right.", next = "BACK", reply = "By right and by blood both, and I'll hold it the same way. The Earth Mother gave it to us after a long walk, and I won't give it up to Sharptusk.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The quilboar have a claim to this land too.", next = "BACK", reply = "Maybe they did once, but they gave it up when they took up with the dead. Let them claim it peacefully, and maybe the elders would listen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Because when I walk it, nobody else has to walk it alone. The young ones going to Grull for their first hunt know there's a brave somewhere on the road, and that makes them braver." } },
      choices = { { text = "That's a good reason.", next = "BACK", fx = { affinity = 1 } } },
    },
    fight = {
      lines = { { id = "f_default", text = "Cut through to him fast, before his warriors close in, and don't let him get his back to the thorns. A quilboar chief fights best when he's got somewhere to hide." } },
      choices = { { text = "Fast and through. Understood.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a brave of Camp Narache. I walk this road, and I'll keep walking it until it's safe." } },
    advice = { { id = "tp_ad", text = "Never walk a road you don't know without a spear in your hand. The quilboar can smell an empty one." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback under Chief Sharptusk have killed our people and burned our camps. I mean to see Sharptusk dead, and I will not rest until he is." } },
    cairne = { { id = "tp_cairne", text = "Cairne led us to this land, and we paid for it in blood. I mean to see that price paid back, every drop, by those who would take it from us." } },
    centaur = { { id = "tp_centaur", text = "The centaur were our enemies on the plains, and the quilboar are our enemies here. A tauren must always be ready to fight, and I am always ready." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us this land, and I will defend it with my life. That is the only thanks she asks of me." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask Chief Hawkwind, or Grull at the hunting camp; may the Earth Mother speed your hooves." } },
  },
}
