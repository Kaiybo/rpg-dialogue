-- Hillsbrad folk we'd missed. Tarren Mill: Monika Sengutz (Vorrel's Revenge), Christoph Jeffcoat (trade goods; Soothing Turtle Bisque),
-- Theodore Mont Claire (stable master), Ott (weaponsmith). Southshore: Darla Harris (gryphon master), Wesley (stable master),
-- Hal McAllister (fish merchant), Neema (waitress).
-- Voice: bibles/hillsbrad_folk.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_VORREL = TODO_QUEST("Vorrel's Revenge")
local Q_BISQUE = TODO_QUEST("Soothing Turtle Bisque")

---------------------------------------------------------------------------
-- Monika Sengutz
---------------------------------------------------------------------------
P:NPC {
  key = "hb_monika", id = TODO_NPC("Monika Sengutz"), name = "Monika Sengutz",
  bible = "bibles/hillsbrad_folk.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "bitter", "proud" }, values = { "loyal" },
  notices = { "race", "faction" },

  impression = {
    first = "Monika Sengutz stands apart in Tarren Mill, a thin Forsaken woman who keeps looking toward the road north as if somebody is late. She greets strangers coldly and doesn't seem to notice that she's doing it.",
    third = "{name} met Monika Sengutz, a Forsaken of Tarren Mill whose husband Vorrel was taken by the Scarlet Crusade.",
  },

  greetings = {
    { id = "g_default", text = "What do you want, stranger?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you any news, or have you only come to stare?" },
    { id = "g_done", when = { questDone = Q_VORREL }, text = "You brought me his ring. I wear it on a cord now, because my fingers aren't what they were." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living thing of the Alliance in Tarren Mill. Say your piece and go, before the Deathguard notice you." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us. You'll understand, then, that waiting is the only thing we never get used to." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Monika Sengutz, and I'm waiting for my husband, though I've been told not to. Vorrel went north on the Dark Lady's business and the Scarlets took him, and nobody in this town will say the word \"dead\" to my face." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_VORREL },
          text = "You've seen him? You've spoken with him? Tell me what he said, all of it, and don't soften it for my sake." },
        { id = "h_done", when = { questRecent = { Q_VORREL, days = 7 } },
          text = "Vorrel led such a troubled existence, and what a good mate he was. You brought his ring back to me, and I'll not forget that the living helped me when the living took him." },
        { id = "h_later", when = { questDone = Q_VORREL },
          text = "I still look at the road some evenings. The Deathguard tell me I'm wasting what time I have, and I tell them the dead have nothing but time." },
      },
      again = {
        { id = "h_again", text = "Is there something else, stranger?" },
        { id = "h_again2", text = "Ask, then. I've nowhere to be." },
      },
      choices = {
        { text = "Tell me about Vorrel.", next = "vorrel" },
        { text = "Where did the Scarlets take him?", next = "scarlets" },
        { text = "How do you bear the waiting?", next = "waiting" },
        { text = "Vorrel asked me to bring you this ring.", next = "ring", when = { questActive = Q_VORREL } },
        { text = "Who was Nancy Vishas?", next = "nancy", when = { questDone = Q_VORREL } },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    vorrel = {
      lines = { { id = "vo_default", text = "He was a carter in Hillsbrad before the plague, and he was a carter for the Dark Lady after it, carrying letters where letters were not welcome. He used to hum while he drove, badly, and I miss it more than I thought anyone could miss bad humming." } },
      choices = {
        { text = "What did he carry for her?", next = "vorrel_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vorrel_work = {
      lines = { { id = "vw_default", text = "Messages for the Deathstalkers, and once a box he wouldn't let me open. He said the less I knew the safer I'd be, which is the sort of thing the living say, and I think he only half remembered he wasn't one any more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    scarlets = {
      lines = { { id = "sc_default", text = "To their monastery, in Tirisfal, where they keep our kind in cells and ask questions with hot iron. Their Interrogator Vishas has a reputation even among the Scarlets, and I've heard Vorrel's name spoken in the same breath." } },
      choices = {
        { text = "I'll look for him there.", next = "scarlets_vow" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_monastery" } } },
      },
    },
    scarlets_vow = {
      big = true,
      lines = { { id = "sv_default", text = "If you find him, and if there's nothing left of him to save, don't make him linger. And if you find Vishas, I'll not tell you what to do, but I'll not weep either." } },
      choices = {
        { text = "Vishas will answer for it, by my hand.", next = "BACK", reply = "By your hand, then, and I'll not stop you. I only hope it brings you more peace than it would bring me.", fx = { align = { light = -1 } } },
        { text = "I'll bring Vorrel peace. Revenge won't help either of you.", next = "BACK", reply = "Peace for Vorrel is all I wanted, and I'm glad you see it that way. Vishas can rot in the Monastery for all I care.", fx = { align = { light = 1 } } },
      },
    },

    waiting = {
      big = true,
      lines = { { id = "wa_default", text = "Badly, and without sleep, since we don't. The others tell me the dead should let go of the living's habits, and that loving a husband is one of them." } },
      choices = {
        { text = "Keep the habit. It's what makes you yourself.", next = "BACK", reply = "I think I will, then, whatever the others say. A dead wife who still loves her husband is no stranger than the rest of us.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They're right. The Forsaken must leave the old life behind.", next = "BACK", reply = "Perhaps they are, and perhaps one day I'll agree with them. Not today, though, and not while he might still be out there.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ring = {
      lines = { { id = "ri_default", text = "His wedding ring. That woman had it, didn't she, the Interrogator's wife, wearing my husband's ring by a lake while he screamed in a cell. Damn those filthy humans, and damn them twice for wearing what isn't theirs." } },
      choices = {
        { text = "He spoke of you at the end.", next = "ring_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ring_end = {
      lines = { { id = "re_default", text = "Did he? Don't tell me what he said, I think I'd like to imagine it. Thank you, stranger, and if you're ever in Tarren Mill with nothing to do, you may come and tell me nothing at all." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },

    nancy = {
      lines = { { id = "na_default", text = "The Interrogator's wife, living in a cottage on Lake Lordamere with a garden and a view and my husband's ring. I've tried to hate her properly and I find I can't be bothered, which frightens me more than the hate did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Vorrel, the Scarlets, and how long a night can be when you don't sleep." } },
    background = { { id = "tp_bg", text = "I was a carter's wife in Hillsbrad, then a corpse, and now a carter's wife again, after a fashion.", next = "vorrel" } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They took my husband and asked him questions he couldn't answer. That's all I know of them, and all I need to." } },
    _none = { { id = "tp_none", text = "I don't know, stranger, and I don't much care." } },
  },
}

---------------------------------------------------------------------------
-- Theodore Mont Claire
---------------------------------------------------------------------------
P:NPC {
  key = "hb_theodore", id = TODO_NPC("Theodore Mont Claire"), name = "Theodore Mont Claire",
  title = "Stable Master",
  bible = "bibles/hillsbrad_folk.md", role = "stablemaster", tier = "service",
  communities = { "tarren_mill" }, temper = { "proud", "sharp" }, values = { "craft" },
  notices = { "pet" },

  impression = {
    first = "Theodore Mont Claire keeps the stables at Tarren Mill with an old nobleman's manners and a Forsaken's patience. He speaks of horses he owned in life as though they were still waiting in a meadow somewhere.",
    third = "{name} met Theodore Mont Claire, the Forsaken stable master of Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Good day to you. If you've an animal that needs a rest, you've found the right stable." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning patron. Do come in." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "And this is {pet}. A fine animal, and not at all frightened of me, which is unusual." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Theodore Mont Claire, keeper of the stables, and once of a rather better stable near the old capital. The animals here don't care that I'm dead, which makes them better company than most." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and you've kept your beast well. I'll see it rested, and I'll not let the bats near it." },
      },
      again = {
        { id = "h_again", text = "Something further?" },
      },
      choices = {
        { text = "I'd like to stable my pet.", next = "BUSINESS" },
        { text = "A better stable? Tell me.", next = "past" },
        { text = "Do the beasts fear the Forsaken?", next = "fear" },
        { text = "Good day, Theodore.", next = "END" },
      },
    },
    past = {
      lines = { { id = "pa_default", text = "Forty horses and a coach-house on an estate north of Lordamere, before the plague came through. I bred greys, the finest in Lordaeron, and I've no idea what became of a single one." } },
      choices = {
        { text = "Would you go looking for them?", next = "past_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_look = {
      big = true,
      lines = { { id = "pl_default", text = "I've thought of it, but if I found them dead and walking I'd not know what to do. I'd rather believe they ran south and are eating some farmer's oats in Southshore." } },
      choices = {
        { text = "Look. The truth is better than a comfort.", next = "BACK", reply = "You're braver than me, then, or harder. If I do go looking, I'll tell you what I find, though I may not thank you for the advice.", fx = { align = { honor = 1 } } },
        { text = "Keep believing it. Some comforts are worth a lie.", next = "BACK", reply = "That's kind of you. Let me have my oats and my Southshore farmer, then, at least until the truth comes knocking on its own.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "At first, all of them did. I sat in the straw for three nights without moving until they decided I was furniture, and now they lean on me in the cold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, mostly, and a little of how Lordaeron's nobility used to waste its money." } },
    _none = { { id = "tp_none", text = "I'm afraid I've no idea. I'm only the stable master." } },
  },
}

---------------------------------------------------------------------------
-- Ott
---------------------------------------------------------------------------
P:NPC {
  key = "hb_ott", id = TODO_NPC("Ott"), name = "Ott",
  title = "Weaponsmith",
  bible = "bibles/hillsbrad_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "steady", "proud" }, values = { "craft", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Ott is a heavy, quiet orc who sells weapons in Tarren Mill and looks faintly uncomfortable among the Forsaken. He tests every edge on his own thumb and has the scars to show it.",
    third = "{name} met Ott, the orc weaponsmith of Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "You need a blade? I have blades." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the last one hold?" },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc. Good. I was starting to forget what breathing sounds like." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Ott, and I sell weapons to the Horde's soldiers in this dead town. The Forsaken are good allies, but they buy daggers, and an orc likes to sell an axe now and then." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior. Finally someone who'll buy an axe. Look at this one, and feel the weight." },
      },
      again = {
        { id = "h_again", text = "Something more?" },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why is an orc in Tarren Mill?", next = "why" },
        { text = "What do you think of the Forsaken?", next = "forsaken" },
        { text = "Farewell, Ott.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Thrall sent orcs to stand beside our new allies, and somebody had to keep their blades sharp. Also, Durnholde is near, and I wanted to see the place where the Warchief was a slave." } },
      choices = {
        { text = "Have you been to Durnholde?", next = "why_durn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_durn = {
      lines = { { id = "wd_default", text = "Once, to the walls. The Syndicate hold it now, humans robbing humans in a human fortress, and I stood outside and laughed until the guards started shooting." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },
    forsaken = {
      big = true,
      lines = { { id = "fo_default", text = "They fight well and they never complain about the food. But the apothecaries' cellars smell of something that isn't medicine, and the Warchief should know about it." } },
      choices = {
        { text = "Tell him. The Horde can't hide such things.", next = "BACK", reply = "I will, when he next sends a rider. A Horde that keeps secrets from itself will rot from the inside like an old tusk.", fx = { align = { order = -1 } } },
        { text = "Keep quiet. Allies don't spy on each other.", next = "BACK", reply = "Spying? I only have a nose, and it tells me what it tells me. Still, I hear you, and I'll keep my mouth shut until I know more.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know blades, and I know who in this town needs one." } },
    _none = { { id = "tp_none", text = "I don't know. I only make weapons." } },
  },
}

---------------------------------------------------------------------------
-- Darla Harris
---------------------------------------------------------------------------
P:NPC {
  key = "hb_darla", id = TODO_NPC("Darla Harris"), name = "Darla Harris",
  title = "Gryphon Master",
  bible = "bibles/hillsbrad_folk.md", role = "flightmaster", tier = "service",
  communities = { "southshore" }, temper = { "brisk", "friendly" }, values = { "dutiful" },
  notices = { "mount", "race" },

  impression = {
    first = "Darla Harris keeps Southshore's gryphons on the hill above the docks, a weathered woman with a sailor's squint who whistles to her birds instead of calling them. She watches the northern sky for bats more than she watches it for weather.",
    third = "{name} met Darla Harris, the gryphon master at Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird? They're fed, they're rested, and they're in a better mood than I am." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and in one piece. The gryphons will be pleased, they hate carrying the injured." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Down off that, please, before the birds take an interest in it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The birds always calm down for dwarves, and I've given up asking why." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darla Harris, gryphon master, and these birds will carry you anywhere the Alliance keeps a roost, so long as you don't kick. Where are you headed?" },
      },
      again = {
        { id = "h_again", text = "Anything else before you fly?" },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you watch for in the north?", next = "north" },
        { text = "How did a human get gryphons?", next = "birds" },
        { text = "Thanks, Darla.", next = "END" },
      },
    },
    north = {
      big = true,
      lines = { { id = "no_default", text = "Bats from Tarren Mill. The Forsaken ride them over the hills, and twice now they've come close enough to spook my birds. Marshal Redpath says to shoot at anything with leather wings, and I'm not sure he's wrong." } },
      choices = {
        { text = "He's right. Shoot first, here.", next = "BACK", reply = "I'm glad someone agrees with the Marshal, because I've had my bow strung since dawn and I'll not hesitate now.", fx = { align = { light = -1 } } },
        { text = "Some riders are only couriers. Hold your fire.", next = "BACK", reply = "Couriers, is it? Couriers for what, I'd like to know, though I'll mind my aim until one of them gives me cause.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds = {
      lines = { { id = "bi_default", text = "The Wildhammer lent them to Southshore after the Second War, when we had more friends than we do now. I learned the whistles from a rider called Gorran, who said I had the lungs for it, and I've been here since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know gryphons, the weather and the sky north of here." } },
    _none = { { id = "tp_none", text = "Not a thing. Ask somebody with their feet on the ground." } },
  },
}

---------------------------------------------------------------------------
-- Wesley
---------------------------------------------------------------------------
P:NPC {
  key = "hb_wesley", id = TODO_NPC("Wesley"), name = "Wesley",
  title = "Stable Master",
  bible = "bibles/hillsbrad_folk.md", role = "stablemaster", tier = "service",
  communities = { "southshore" }, temper = { "friendly", "cowardly" }, values = { "kind" },
  notices = { "pet" },

  impression = {
    first = "Wesley is a young stable master who keeps Southshore's stalls by the mailbox in front of the inn. He is eager, freckled, and jumps a little at every loud noise from the north road.",
    third = "{name} met Wesley, the young stable master of Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Hello! Oh, good, you're alive. I mean, hello, welcome to Southshore." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Your animal's stall is still clean, I made sure of it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Hello, {pet}! You're much nicer than the horses, they bite." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Wesley, and I keep the stables, well, the stalls by the inn, which is nearly a stable. I'll look after your animal like it was my own, which is easy, because I haven't got one." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Oh! Oh, you're... you're with the Horde, aren't you? I'm not supposed to... please don't hurt the horses." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not busy, I'm never busy." },
      },
      choices = {
        { text = "I'd like to stable a pet.", next = "BUSINESS" },
        { text = "Why so jumpy, Wesley?", next = "jumpy" },
        { text = "How long have you kept the stables?", next = "job" },
        { text = "Goodbye, Wesley.", next = "END" },
      },
    },
    jumpy = {
      lines = { { id = "ju_default", text = "Because Tarren Mill's just up the road, and it's full of dead people who used to live there. My aunt lived there, and I don't know if she still does, if you see what I mean." } },
      choices = {
        { text = "Do you want to know?", next = "jumpy_aunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jumpy_aunt = {
      big = true,
      lines = { { id = "ja_default", text = "No, or yes, I don't know. Everyone says the Forsaken aren't the people they were, and I'd like to believe it, because otherwise she's up there and she hasn't come to see me." } },
      choices = {
        { text = "They aren't who they were. Let her go.", next = "BACK", reply = "Let her go? I don't know if I can, but I suppose I'll have to try. It's just hard when you know she's only over the hill.", fx = { align = { order = 1 } } },
        { text = "Some of them remember. Don't give up on her.", next = "BACK", reply = "You really think so? Then I'll keep waiting, and maybe one day she'll come down the road and say my name.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    job = {
      lines = { { id = "jo_default", text = "Two summers. The old stable master went to Stromgarde with the League and didn't come back, so Magistrate Maleb gave it to me because I was standing nearby." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the stalls, the horses, and which of them bites, which is all of them." } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that. Maybe ask Magistrate Maleb?" } },
  },
}

---------------------------------------------------------------------------
-- Neema
---------------------------------------------------------------------------
P:NPC {
  key = "hb_neema", id = TODO_NPC("Neema"), name = "Neema",
  title = "Waitress",
  bible = "bibles/hillsbrad_folk.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "friendly", "brisk" }, values = { "kind" },
  notices = { "hunger", "weary" },

  impression = {
    first = "Neema carries plates through Southshore's inn with a tray on each arm and an apron pocket full of everyone's gossip. She's quick, warm, and forgets nobody's order.",
    third = "{name} met Neema, the waitress at Southshore's inn.",
  },

  greetings = {
    { id = "g_default", text = "Sit anywhere, love, I'll be right with you. Unless you're the one who ordered the stew, in which case it's coming." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The usual, love, or shall I surprise you?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like you've walked here from Arathi and fought half of it on the way. Sit down before you fall down." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Neema, and if you're hungry or thirsty I'm the one to see, not Barkeep Kelly, he only pours. Bread, cheese, a bit of meat and something to wash it down, love?" },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Another soldier for Marshal Redpath? Sit down and eat first, he can wait, and so can Tarren Mill." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've three tables waiting." },
      },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What's the gossip in town?", next = "gossip" },
        { text = "Is it hard work, keeping this place fed?", next = "work" },
        { text = "Thanks, Neema.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "go_default", text = "Marshal Redpath's been up all night again over Tarren Mill, and Brewmeister Bilger's been watering the ale, though he swears he hasn't. And a dwarf in the corner says he saw Forsaken in the hills with a cart of barrels, which nobody likes the sound of." } },
      choices = {
        { text = "Barrels? What kind?", next = "gossip_barrels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_barrels = {
      big = true,
      lines = { { id = "gb_default", text = "Nobody knows, love, and the Marshal won't say. Some want him to march on the Mill tonight, and the rest want to wait and see, and they argue about it over my tables until closing." } },
      choices = {
        { text = "Wait and see. A march could start a war.", next = "BACK", reply = "That's what I keep telling them, and they never listen to a barmaid. One wrong step and we'll all be burying sons again.", fx = { align = { order = 1 } } },
        { text = "March tonight. Waiting is how towns die.", next = "BACK", reply = "You'll get half my tables cheering and the other half shouting, love, so mind you don't say it too loud in here.", fx = { align = { order = -1 } } },
      },
    },
    work = {
      lines = { { id = "wo_default", text = "Hard on the feet and easy on the heart, mostly. The soldiers tip in stories instead of coin, but I've got a jar of the coin as well, so I'm not complaining." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know who's eating, who's drinking, and who's sweet on whom, which is everything worth knowing in Southshore." } },
    _none = { { id = "tp_none", text = "No idea, love. Try Loremaster Dibbs, he knows the dull things." } },
  },
}
