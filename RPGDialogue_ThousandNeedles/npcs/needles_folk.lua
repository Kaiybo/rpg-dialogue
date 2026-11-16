-- Freewind Post's and the Mirage Raceway's quiet hands (0.39.0): the wind rider master, the stable master,
-- and the gnome who sells engineering supplies at the raceway. Voice: bibles/thousandneedles.md ("Quiet hands")
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nyse", id = TODO_NPC("Nyse"), name = "Nyse", title = "Wind Rider Master",
  bible = "bibles/thousandneedles.md", role = "flightmaster", tier = "service",
  communities = { "freewind" }, temper = { "calm" }, values = { "dutiful", "nature" },
  notices = { "race" },

  impression = {
    first = "Nyse keeps the wind riders at the top of Freewind Post, where the air is thin and the drop is long. She talks about the mesas as if they were old friends.",
    third = "{name} met Nyse, the tauren wind rider master at Freewind Post.",
  },

  greetings = {
    { id = "g_default", text = "The wind is good today, and the riders are eager to be off the mesa. Where are you bound?" },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "My wind riders don't carry the Alliance, stranger. You'll have to find your way down the lift and out of the canyons on foot." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome, child of the Earth Mother. You can feel it up here, can't you? The wind off the needles is the closest thing to flying without wings." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Nyse, and I keep the wind riders of Freewind Post. From the top of this mesa they'll carry you to Thunder Bluff, to the Crossroads, or south over the salt flats to Gadgetzan." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The wind is changing." },
        { id = "h_again2", text = "Speak, friend. The riders can wait a little longer." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why build a post on top of a mesa?", next = "mesa" },
        { text = "Is it hard flying between the needles?", next = "flying" },
        { text = "Goodbye.", next = "END" },
      },
    },
    mesa = {
      lines = { { id = "m_default", text = "Because the centaur can't climb it, and the Galak have hated our people for as long as anyone remembers. Up here, with the lifts drawn and the bridges watched, we can sleep at night." } },
      choices = {
        { text = "Can there ever be peace with the centaur?", next = "mesa_centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa_centaur = {
      lines = { { id = "mc_default", text = "I don't know. Cliffwatcher Longhorn doesn't think so, and he's buried more of our people than I have, but I'd like to think the Earth Mother wants something better for us all." } },
      choices = {
        { text = "Peace is worth hoping for.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The centaur only understand the spear.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying = {
      lines = { { id = "f_default", text = "Only if you fight the wind. The riders know how the air moves around the needles, and they ride the gusts like a river, so the trick is to sit still and let them work." } },
      choices = {
        { text = "Do the harpies ever bother them?", next = "flying_harpy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying_harpy = {
      lines = { { id = "fh_default", text = "They screech and they follow, but they don't dare come close to a wind rider. The riders would tear them out of the sky, and the harpies know it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've kept wind riders on these mesas for many seasons. That's my life, and I'm content with it." } },
    advice = { { id = "tp_ad", text = "Stay off the canyon floor at night. That's when the centaur ride." } },
    _none = { { id = "tp_none", text = "I don't know, friend. The wind carries a great deal past this mesa, but not that." } },
  },
}

P:NPC {
  key = "awenasa", id = TODO_NPC("Awenasa"), name = "Awenasa", title = "Stable Master",
  bible = "bibles/thousandneedles.md", role = "stablemaster", tier = "service",
  communities = { "freewind" }, temper = { "warm" }, values = { "kind", "nature" },
  notices = { "pet" },

  impression = {
    first = "Awenasa keeps the stables at Freewind Post and speaks to the animals in the same gentle voice she uses for people. She seems to know every hunter in the Needles by their pet's name.",
    third = "{name} met Awenasa, the tauren stable master at Freewind Post.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, friend. The beasts are calm today, which means the wind is kind. Have you brought me someone to look after?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Oh, your {pet} has climbed a long way to get up here. Let it rest by the water a moment, the climb is hard on four legs." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Most are, though the cats pace at night when the Galak drums start below. I sit with them until it stops, which is not a stable master's work, but what else can I do?" } },
      choices = {
        { text = "That's kindness, and kindness is never wasted.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Leave them be. They'll grow used to the drums.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Awenasa, and I keep the stables of Freewind Post. Hunters leave their companions with me, and I keep them fed and watered, and away from the edge of the mesa." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! The animals settle when your kind walks in, as if they know you would understand them." },
      },
      again = {
        { id = "h_again", text = "Is there more you would like to know about the stables?" },
        { id = "h_again2", text = "Take your time; the animals aren't going anywhere." },
      },
      choices = {
        { text = "Are the beasts content up here on the mesa?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like to see my stabled pets.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you get animals up a mesa?", next = "lift" },
        { text = "What do hunters tame around here?", next = "tame" },
        { text = "Goodbye.", next = "END" },
      },
    },
    lift = {
      lines = { { id = "l_default", text = "On the lifts, very slowly, with a lot of soft words. The cats hate it and the wolves don't mind, and I once had a hunter's bear refuse to step off at the top for most of an afternoon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    tame = {
      lines = { { id = "t_default", text = "Wind serpents, sometimes, from the dens below the cliffs, though they're hard to calm. Most hunters bring cats or wolves from the Barrens and leave the needles' creatures where they belong." },
        { id = "t_hunter", when = { class = "HUNTER" }, text = "Some of you try the wind serpents from the dens below the cliffs. I'll board one if you tame it, but it'll crackle with lightning at night and keep the others awake." } },
      choices = {
        { text = "Wild things should stay wild.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A good hunter can tame anything.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've always been better with animals than with people, and Freewind needed someone with patience." } },
    advice = { { id = "tp_ad", text = "Keep your companion close on the rope bridges, because a frightened animal doesn't look where it's stepping." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Ask me about the animals, though, and I'll tell you everything." } },
  },
}

P:NPC {
  key = "jinky", id = TODO_NPC("Jinky Twizzlefixxit"), name = "Jinky Twizzlefixxit", title = "Engineering Supplies",
  bible = "bibles/thousandneedles.md", role = "vendor", tier = "service",
  communities = { "mirage_raceway" }, temper = { "eager" }, values = { "craft", "profit" },
  notices = { "craft", "race" },

  impression = {
    first = "Jinky Twizzlefixxit sells engineering supplies at the Mirage Raceway, to gnomes and goblins both, and keeps a cheerful tally of which team buys more bolts. She's a gnome, but she'll tell you business doesn't take sides.",
    third = "{name} met Jinky Twizzlefixxit, the gnome who sells engineering supplies at the Mirage Raceway.",
  },

  greetings = {
    { id = "g_default", text = "Bolts, tubes, blasting powder and gears! Both teams buy from me, and both teams think the other one's cheating." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll want to see my parts, then, and you'll want to see them before the pit crews buy them all." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Don't let the goblins hear you cheering for Fizzle, though; I have to sell to them too, and I'd like to keep the peace." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jinky Twizzlefixxit, engineering supplies, right here on the Shimmering Flats! The racers burn through parts faster than they burn through fuel, so I'm never short of customers." },
      },
      again = {
        { id = "h_again", text = "Anything else? The next race starts soon!" },
        { id = "h_again2", text = "Ask away! I can talk and count gears at the same time." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You sell to both teams?", next = "both" },
        { text = "Which team will win?", next = "winner" },
        { text = "Goodbye.", next = "END" },
      },
    },
    both = {
      lines = { { id = "b_default", text = "Of course I do! A gnome car and a goblin car both need bolts, and both of them break down about as often. If I only sold to the gnomes, I'd be half as rich and twice as bored." } },
      choices = {
        { text = "That's smart. Trade with everyone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A gnome should stand with the gnomes.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winner = {
      lines = { { id = "w_default", text = "Fizzle's car is cleverer and Pozzik's car is faster, so it depends on whether the race is long or short. I don't bet, but if I did, I'd bet on whoever bought the most parts from me that week." } },
      choices = {
        { text = "Do you know who's buying more?", next = "winner_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winner_more = {
      lines = { { id = "wm_default", text = "I do, and I'm not telling, because a merchant who talks about her customers' orders soon has no customers. Ask Kravel Koalbeard, if you want rumors; he always seems to know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell parts. Wherever there are engineers breaking things, there's somebody like me selling them the bits to fix it." } },
    advice = { { id = "tp_ad", text = "Always carry a spare tube, because the one you need is always the one you didn't bring." } },
    mirage_raceway = { { id = "tp_race", text = "The best place in Kalimdor to watch things explode at speed, and the best place to sell bolts." } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that, but I'd be happy to sell you something that does!" } },
  },
}
