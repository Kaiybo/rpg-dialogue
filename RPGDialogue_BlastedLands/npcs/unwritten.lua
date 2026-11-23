-- Blasted Lands: the unnamed garrison of Nethergarde Keep a roster scan found with no conversation yet. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC = P.TODO_NPC

-- Nethergarde Soldier: a soldier on the walls of Nethergarde Keep.
P:NPC {
  key = "bla_nethergarde_soldier", id = TODO_NPC("Nethergarde Soldier"), name = "Nethergarde Soldier",
  bible = "bibles/blastedlands.md", role = "soldier", tier = "service",
  communities = { "nethergarde" }, temper = { "tired", "dutiful" }, values = { "duty", "alliance" },
  notices = { "race" },
  impression = {
    first = "A soldier of Nethergarde Keep, sunburned and red with the dust of the Blasted Lands. He kept glancing south toward the Portal while we talked.",
    third = "{name} spoke with a soldier of Nethergarde Keep.",
  },
  greetings = {
    { id = "g_default", text = "Halt, and state your business. Nethergarde doesn't get many visitors, and the ones we get are usually lost or mad." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Keep, are you? Good to see a face that isn't red with dust or covered in scales." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { faction = "Horde" },
      text = "Horde, this close to the Portal your people came through. I'll keep my sword sheathed, but I'll keep my eye on you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We hold Nethergarde for the Alliance and the mages, and we keep watch on the Dark Portal in case anything ever tries to come through it again. Most days it's ogres and dust, and most nights it's worse." } },
      again = { { id = "h_again", text = "Anything else? I'm due back on the wall." } },
      choices = {
        { text = "Could the Dark Portal ever open again?", next = "portal" },
        { text = "What's the worst of the Blasted Lands?", next = "worst" },
        { text = "This posting must be miserable.", next = "posting" },
        { text = "Stay sharp, soldier.", next = "END" },
      },
    },
    portal = {
      lines = { { id = "p_default", text = "The mages swear it's dead and broken, and I believe them by day. At night, though, the air near it hums, and I'd rather be here watching than home wondering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worst = {
      lines = { { id = "w_default", text = "The Dreadmaul ogres raid our supply lines from their holds to the north, and there are demons wandering the Tainted Scar still, left over from wars nobody wants to remember. The heat is the least of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    posting = {
      lines = { { id = "ps_default", text = "It is, and every soldier here would tell you so, but somebody has to stand between the Portal and Stormwind. My father fought the Horde when they first came through, and I'd not see that happen again." } },
      choices = {
        { text = "That's a duty worth any misery. Stormwind thanks you.", next = "BACK", reply = "Stormwind forgets us, mostly, but I'll take the thanks.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Guarding a dead gate is a waste of good soldiers.", next = "BACK", reply = "Then you go explain that to the next demon that walks out of the Scar.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a soldier of the Nethergarde garrison, and I've stood this wall longer than I care to count." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the quartermaster, he knows everything that passes the gate." } },
  },
}

-- Nethergarde Officer: an officer of the Keep's garrison.
P:NPC {
  key = "bla_nethergarde_officer", id = TODO_NPC("Nethergarde Officer"), name = "Nethergarde Officer",
  bible = "bibles/blastedlands.md", role = "soldier", tier = "service",
  communities = { "nethergarde" }, temper = { "stern", "clipped" }, values = { "order", "duty" },
  notices = { "class" },
  impression = {
    first = "An officer of Nethergarde Keep, armor polished despite the dust, and plainly a believer in standards for their own sake.",
    third = "{name} spoke with an officer of the Nethergarde garrison.",
  },
  greetings = {
    { id = "g_default", text = "You're not one of mine, so you must be a volunteer, a merchant or a fool. Which is it, then?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. If you're here to help, report to the quartermaster, and if you're here to talk, be brief." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A {class}, and a capable one, by the look of you. I could use a dozen like you on the north road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I command a watch on the walls of Nethergarde, and I keep the soldiers awake, armed and sober, which out here is three separate battles. The Keep stands because we never stop standing." } },
      again = { { id = "h_again", text = "Go on. Briefly." } },
      choices = {
        { text = "How do you keep morale up out here?", next = "morale" },
        { text = "Who actually runs Nethergarde?", next = "runs" },
        { text = "Your soldiers seem worn thin.", next = "worn" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    morale = {
      lines = { { id = "m_default", text = "Drill, rations and letters from home, in that order, and the occasional ogre head on a pike to remind them we're winning. The Blasted Lands kill hope faster than anything with teeth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    runs = {
      lines = { { id = "r_default", text = "The mages of the Kirin Tor watch the Portal, and the soldiers watch the mages, and Stormwind pays for both, when it remembers. We answer to the Keep and the Keep answers to the Alliance." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worn = {
      lines = { { id = "w_default", text = "They are, and I'll not pretend otherwise to a stranger. Half of them were sent here because someone in Stormwind wanted them out of sight, and they've done better than anyone expected." } },
      choices = {
        { text = "Then give them rest. Exhausted soldiers die.", next = "BACK", reply = "Rest is a luxury I'll give them when the Dreadmaul stop raiding.", fx = { align = { honor = 1 } } },
        { text = "Push them harder. Discipline holds walls.", next = "BACK", reply = "It does, up to a point. I've found that point twice already.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an officer of Stormwind's army, posted to Nethergarde, and I intend to bring every one of my soldiers home." } },
    _none = { { id = "tp_none", text = "Not my concern. Take it to the quartermaster." } },
  },
}

-- Nethergarde Cleric: a priest of the Keep's garrison.
P:NPC {
  key = "bla_nethergarde_cleric", id = TODO_NPC("Nethergarde Cleric"), name = "Nethergarde Cleric",
  bible = "bibles/blastedlands.md", role = "priest", tier = "service",
  communities = { "nethergarde" }, temper = { "gentle", "weary" }, values = { "faith", "mercy" },
  notices = { "class" },
  impression = {
    first = "A cleric of Nethergarde Keep, with bandages in one hand and a prayer book in the other. Not a moment passed without a soldier needing something.",
    third = "{name} spoke with one of the clerics of Nethergarde Keep.",
  },
  greetings = {
    { id = "g_default", text = "The Light keep you, traveller. Are you hurt? Everyone who comes to Nethergarde is hurt somewhere, whether they know it or not." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, and whole, I hope. The Light is generous, but I'd rather not test it." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "Another servant of the Light, and here of all places! If you've a prayer to spare, the infirmary is never empty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I tend the wounded of Nethergarde, and I pray over the Portal each night, for whatever good it does. This land was torn by demon magic, and you can feel it in the soil and the air." } },
      again = { { id = "h_again", text = "What else troubles you, child?" } },
      choices = {
        { text = "Can the Light heal this land?", next = "heal" },
        { text = "What wounds do you see most?", next = "wounds" },
        { text = "Do you ever regret coming here?", next = "regret" },
        { text = "Light be with you.", next = "END" },
      },
    },
    heal = {
      lines = { { id = "h2_default", text = "In time, perhaps, though I doubt I'll live to see it. The Light heals people far faster than it heals land, and this land drank in a great deal of fel." } },
      choices = {
        { text = "Everything can be redeemed through the Light.", next = "BACK", reply = "I believe that, on my better days. Thank you for reminding me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some places are lost. Burn it and move on.", next = "BACK", reply = "Then where would we stand to guard the Portal? No, we stay and pray.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds = {
      lines = { { id = "w_default", text = "Ogre clubs and sunstroke, mostly, and the strange burns from things out in the Tainted Scar that I cannot name. Those burns don't heal clean, and they itch long after the scar has closed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regret = {
      lines = { { id = "r_default", text = "Every morning, for a moment, and then the first soldier comes to my door and the moment passes. The Light sent me where I was needed, not where I was comfortable." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a cleric of the Church of the Holy Light, sent to tend the garrison at Nethergarde." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child. Ask the officers." } },
  },
}

-- Nethergarde Foreman: oversees the Keep's mines.
P:NPC {
  key = "bla_nethergarde_foreman", id = TODO_NPC("Nethergarde Foreman"), name = "Nethergarde Foreman",
  bible = "bibles/blastedlands.md", role = "worker", tier = "service",
  communities = { "nethergarde" }, temper = { "brusque", "harried" }, values = { "practical", "work" },
  notices = { "craft" },
  impression = {
    first = "The Nethergarde foreman, red dust caked into his beard and a tally board in his hand. He counted heads while he talked.",
    third = "{name} spoke with the foreman of the Nethergarde mines.",
  },
  greetings = {
    { id = "g_default", text = "If you're here to work, grab a pick, and if you're not, get out of the way of the carts." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still not holding a pick, I see. What is it this time?" },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Now that's useful, which is more than I can say for most of the heroes who wander through here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the Nethergarde mines working, which means iron for the armory and stone for the walls, and as few dead miners as I can manage. The Keep doesn't run on prayer, whatever the clerics tell you." } },
      again = { { id = "h_again", text = "Quick now, the carts are backing up." } },
      choices = {
        { text = "What do the mines produce?", next = "ore" },
        { text = "What's the danger down there?", next = "danger" },
        { text = "Do the miners get paid fairly?", next = "pay" },
        { text = "I'll get out of your way.", next = "END" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Iron and coal, mostly, enough to keep the Keep's smiths busy without waiting on Stormwind's caravans. Supplies from the north come slow and get raided, so we dig for ourselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Cave-ins, bad air, and the Dreadmaul ogres, who think anything dug out of the ground belongs to them. I've lost good men to all three this year." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      lines = { { id = "p_default", text = "They get paid what Stormwind sends, which is late and short, and I make up the rest in promises. They work anyway, because the Keep needs the iron." } },
      choices = {
        { text = "They deserve better. Someone should petition Stormwind.", next = "BACK", reply = "Someone has, twice. The letters are probably still sitting on a clerk's desk.", fx = { align = { honor = 1 } } },
        { text = "Work is work. They chose to come here.", next = "BACK", reply = "Some did. Others were told to. Either way, the iron gets dug.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the foreman of the Nethergarde mines, and I've been digging since before I could grow a beard." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, got carts to move." } },
  },
}

-- Nethergarde Miner: one of the miners who dig for the Keep.
P:NPC {
  key = "bla_nethergarde_miner", id = TODO_NPC("Nethergarde Miner"), name = "Nethergarde Miner",
  bible = "bibles/blastedlands.md", role = "worker", tier = "service",
  communities = { "nethergarde" }, temper = { "tired", "grumbling" }, values = { "practical", "work" },
  notices = { "craft" },
  impression = {
    first = "A Nethergarde miner, red dust in every crease and a pick worn smooth at the haft. He was glad of any excuse to stop swinging.",
    third = "{name} spoke with one of the miners of Nethergarde Keep.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a visitor! Talk slow, friend, it gives me a reason to rest my arms." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back to the mines unless they owe somebody money." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You've got miner's hands, I can tell. Then you know what it's like to dig all day and see the sky for an hour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I dig iron and coal for the Keep, same as every day, and I'll dig tomorrow too unless an ogre gets me first. It's honest work, if you don't count the red dust that gets into your lungs." } },
      again = { { id = "h_again", text = "Something else? Take your time, please." } },
      choices = {
        { text = "How did you end up here?", next = "how" },
        { text = "Have you seen anything strange down there?", next = "strange" },
        { text = "The foreman says you're paid late.", next = "pay" },
        { text = "Back to work with you.", next = "END" },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "I was a miner in the hills above Goldshire until the Defias took the mines, and the army said they'd pay a man to dig here instead. I didn't ask enough questions, I suppose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "s_default", text = "Green crystals in the deep seams, glowing like they're alive, and the old-timers won't touch them. The mages took a few away and we never heard another word about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      lines = { { id = "p_default", text = "Late and light, aye, but the foreman covers us out of his own pocket when he can. He's a hard man, but he's our hard man." } },
      choices = {
        { text = "You should all walk out until Stormwind pays.", next = "BACK", reply = "And leave the Keep without iron? No, friend, the Portal doesn't wait for wages.", fx = { align = { order = -1 } } },
        { text = "Good. Duty first, wages second.", next = "BACK", reply = "Easy for you to say with coin in your purse, but aye, I suppose.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Stormwind miner, far from home, digging for the Keep." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. I only see the inside of a mine." } },
  },
}
