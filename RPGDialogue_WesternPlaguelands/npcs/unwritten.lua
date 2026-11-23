-- Western Plaguelands: Caer Darrow's nameless ghosts a roster scan found with no conversation yet: a guardsman,
-- a cannoneer, a horseman and a citizen, all seen only with the Spectral Essence. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC = P.TODO_NPC

-- Caer Darrow Guardsman: a ghostly guard still walking his rounds.
P:NPC {
  key = "wpl_cd_guardsman", id = TODO_NPC("Caer Darrow Guardsman"), name = "Caer Darrow Guardsman",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "caer_darrow" }, temper = { "dutiful", "confused" }, values = { "duty", "loyal" },
  notices = { "class" },
  impression = {
    first = "A ghostly guardsman of Caer Darrow, still walking his rounds as if nothing had happened, though the town around him is full of the dead.",
    third = "{name} spoke with the ghost of one of Caer Darrow's guardsmen.",
  },
  greetings = {
    { id = "g_default", text = "Halt, in the name of Lord Barov! State your business in Caer Darrow, traveller." },
    { id = "g_back", when = { metBefore = true }, text = "You again, traveller. Strange, I can't remember the last time anyone came twice." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A knight of the Silver Hand! Welcome, sir, Lord Barov will be glad to have one of Uther's own in the keep." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the peace in Caer Darrow, same as every day, though the town's been terribly quiet of late. The Barovs keep to the keep and the folk keep to their houses, and nobody tells a guardsman why." } },
      again = { { id = "h_again", text = "Anything else, traveller? I've my rounds to walk." } },
      choices = {
        { text = "You know you're dead, don't you?", next = "dead" },
        { text = "What happened to the Barovs?", next = "barov" },
        { text = "Who lives in the keep now?", next = "keep" },
        { text = "Carry on, guardsman.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Dead? Don't be foolish, I'm standing right here, aren't I? Although now you mention it, I can't recall when I last ate, or slept, or saw the sun come up properly." } },
      choices = {
        { text = "Let him keep his rounds. He's at peace.", next = "BACK", reply = "Peace? Yes, I suppose it is peaceful, in a way.", fx = { align = { order = 1 } } },
        { text = "He deserves the truth, however hard it is.", next = "BACK", reply = "The truth? I... no. No, I have my rounds to walk.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barov = {
      lines = { { id = "b_default", text = "Lord Barov had dealings with some strange men from the north, men in dark robes, and after that, he stopped coming down to the town. I didn't ask, because a guardsman doesn't ask his lord's business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "The Barovs, of course, and their guests, though I've not seen a living servant go in or out for some time. There's a cold that comes off those walls at night that I don't like at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a guardsman of Caer Darrow, sworn to Lord Barov." } },
    _none = { { id = "tp_none", text = "I couldn't say, traveller. Ask at the keep." } },
  },
}

-- Caer Darrow Cannoneer: a ghostly gunner still at the town's cannons.
P:NPC {
  key = "wpl_cd_cannoneer", id = TODO_NPC("Caer Darrow Cannoneer"), name = "Caer Darrow Cannoneer",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "caer_darrow" }, temper = { "gruff", "anxious" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "A ghostly cannoneer of Caer Darrow, still standing by his gun and staring out over Darrowmere Lake for an enemy that never came by water.",
    third = "{name} spoke with the ghost of one of Caer Darrow's cannoneers.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear of the gun, friend! She's loaded and she's touchy, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Stand clear, same as before, and keep your torch away from the powder." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You've the eye of a marksman, friend. Could you hit a boat at five hundred yards? I could, once." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I man the cannons of Caer Darrow, and I watch the lake for raiders, as Lord Barov ordered. Nothing has come across the water in a very long time, but I keep watching, because those are my orders." } },
      again = { { id = "h_again", text = "What else? Make it quick, I'm on watch." } },
      choices = {
        { text = "What did you expect to come across the lake?", next = "lake" },
        { text = "The danger came from inside the walls.", next = "inside" },
        { text = "When did you last fire that cannon?", next = "fire" },
        { text = "Keep watching, then.", next = "END" },
      },
    },
    lake = {
      lines = { { id = "l_default", text = "Trolls, maybe, or bandits, or the Horde come back again from the old wars. We never thought to watch the town behind us, and I suppose that was our mistake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inside = {
      lines = { { id = "i_default", text = "Inside? I don't follow you, friend. The keep is Lord Barov's, and nothing comes out of it but orders, and the orders say watch the lake." } },
      choices = {
        { text = "Orders are orders. You did your duty.", next = "BACK", reply = "I did, didn't I? I did my duty.", fx = { align = { order = 1 } } },
        { text = "Blind obedience got this whole town killed.", next = "BACK", reply = "Killed? I... I don't understand you, friend. Leave me be.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "f_default", text = "The night the screaming started in the town, I think, though I can't remember what I was aiming at. It's all mist after that, and I've been standing here ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a cannoneer of Caer Darrow, and the guns are my charge." } },
    _none = { { id = "tp_none", text = "Don't know anything about that, friend. Just the guns." } },
  },
}

-- Caer Darrow Horseman: a ghostly rider on a spectral horse.
P:NPC {
  key = "wpl_cd_horseman", id = TODO_NPC("Caer Darrow Horseman"), name = "Caer Darrow Horseman",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "caer_darrow" }, temper = { "proud", "melancholy" }, values = { "duty", "honor" },
  notices = { "class" },
  impression = {
    first = "A ghostly horseman of Caer Darrow, riding a spectral steed around the town in endless circles, as if patrolling a border that no longer exists.",
    third = "{name} spoke with the ghost of one of Caer Darrow's horsemen.",
  },
  greetings = {
    { id = "g_default", text = "Whoa, steady there! You came up so quiet, traveller, I nearly rode you down." },
    { id = "g_back", when = { metBefore = true }, text = "You again, traveller! Have you come to ride with me, or just to stare?" },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! I always dreamed of riding with the Silver Hand, and Lord Barov said one day I might." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I ride the patrol around Caer Darrow, the same circle as always, the shore, the gate, the keep and round again. My horse knows the way so well I could sleep in the saddle, and maybe I do." } },
      again = { { id = "h_again", text = "Anything else, traveller? My horse is restless." } },
      choices = {
        { text = "Your horse looks like a ghost too.", next = "horse" },
        { text = "Why ride in circles?", next = "circles" },
        { text = "Have you seen anything strange?", next = "strange" },
        { text = "Ride on, horseman.", next = "END" },
      },
    },
    horse = {
      lines = { { id = "h2_default", text = "She's pale, I'll grant you, and she doesn't eat much anymore, but she's never thrown me once. We've been together since I joined the Barov guard, and I'll not ride another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circles = {
      lines = { { id = "c_default", text = "Because those are my orders, and because I can't seem to find the road out of town. Every time I turn for the bridge, I find myself back at the gate." } },
      choices = {
        { text = "Then keep riding. Someone has to guard this place.", next = "BACK", reply = "Aye. Someone has to.", fx = { align = { light = -1 } } },
        { text = "You should be at rest. I'll pray for you.", next = "BACK", reply = "Rest? That sounds... very fine, traveller. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "Men in black robes, coming and going from the keep, and lights in the windows that aren't candles. Lord Barov told us to look the other way, and so we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a horseman of the Barov guard, and I've ridden this patrol longer than I can remember." } },
    _none = { { id = "tp_none", text = "I don't know, traveller. I only know the patrol." } },
  },
}

-- Caer Darrow Citizen: one of the town's ghostly folk.
P:NPC {
  key = "wpl_cd_citizen", id = TODO_NPC("Caer Darrow Citizen"), name = "Caer Darrow Citizen",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "caer_darrow" }, temper = { "wistful", "skittish" }, values = { "memory", "family" },
  notices = { "race" },
  impression = {
    first = "A ghostly citizen of Caer Darrow, going about errands that ended long ago, with a basket that holds nothing at all.",
    third = "{name} spoke with the ghost of one of Caer Darrow's townsfolk.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Good day to you, stranger, I didn't hear you on the cobbles. It's been so long since we had visitors in town." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! How nice, nobody ever comes back to Caer Darrow." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Oh, you poor thing, you look terribly unwell. Is it the sickness from the grain? So many in town have it now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm just on my way to the market, though I can't seem to find it, which is very silly in a town this small. Everyone's been so quiet lately, and nobody answers their door." } },
      again = { { id = "h_again", text = "Was there something else, stranger?" } },
      choices = {
        { text = "What sickness was in the grain?", next = "grain" },
        { text = "Do you remember your family?", next = "family" },
        { text = "There is no market anymore.", next = "market" },
        { text = "Good day to you.", next = "END" },
      },
    },
    grain = {
      lines = { { id = "g2_default", text = "The grain from the north came in sacks marked from Andorhal, and after we ate the bread, people started falling ill. The priests said it would pass, and then the priests fell ill too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "My husband went to work at the keep and didn't come home, and my little ones were sleeping when I went out. I should get back to them, I really should, but I can't seem to find the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    market = {
      lines = { { id = "m_default", text = "No market? But I go every week, stranger, I'm sure of it, and the baker always saves me a loaf. You must be mistaken." } },
      choices = {
        { text = "You're right. I must be mistaken.", next = "BACK", reply = "There, you see? Now, if you'll excuse me.", fx = { align = { honor = -1 } } },
        { text = "I'm sorry. Caer Darrow fell to the plague.", next = "BACK", reply = "Fell? No, no, it can't have. I'd have noticed, wouldn't I?", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've lived in Caer Darrow all my life, and I'll not leave it now." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, stranger. Ask the guardsman." } },
  },
}
