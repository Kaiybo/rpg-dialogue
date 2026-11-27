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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. We could use a few more of your sort in the line." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Say what you came to say, and then leave us to our work." },
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
        { text = "A soldier's word should be as strong as his shield.", next = "BACK", reply = "Aye, and the good ones are. I've stood beside a few.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever soldier lies to the enemy and lives.", next = "BACK", reply = "Maybe so, but don't make a habit of it with your friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Could the Dark Portal ever open again?", next = "portal" },
        { text = "What's the worst of the Blasted Lands?", next = "worst" },
        { text = "This posting must be miserable.", next = "posting" },
        { text = "Where are you from originally?", next = "xfrom" },
        { text = "Have you fought the Dreadmaul?", next = "xogres" },
        { text = "What do you do to stay awake on watch?", next = "xawake" },
        { text = "I'm an orc. Does that worry you?", next = "BACK", when = { race = "Orc" }, reply = "Aye, it worries me, but I'll say this: you're the first orc to talk to me instead of charging. I'll take that as a good sign." },
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
    xfrom = {
      lines = {
        { id = "xxfrom_0", text = "Lakeshire, in Redridge. My family keeps an inn by the water. I joined up to see the world, and the world turned out to be red dust." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xogres = {
      lines = {
        { id = "xxogres_0", text = "Twice, on the supply road. They're slow and stupid and hit like a falling wall. The second time I lost my shield and nearly my arm." },
      },
      choices = {
        { text = "What would you do about them?", next = "xogre2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xogre2 = {
      lines = {
        { id = "xxogre2_0", text = "Some say hit their holds hard and burn them out. Others say guard the road and leave the ogres be. What would you do?" },
      },
      choices = {
        { text = "Burn their holds. Teach them to fear us.", next = "BACK", reply = "Aye, I'd like to see it. If we ever get enough men.", fx = { align = { order = -1 } } },
        { text = "Guard the road. Don't start a war you can't finish.", next = "BACK", reply = "That's what the officer says. I suppose he's right.", fx = { align = { order = 1 } } },
      },
    },
    xawake = {
      lines = {
        { id = "xxawake_0", text = "Songs from home, mostly under my breath. The officer pretends he doesn't hear, and the other lads join in when it's late enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lakeshire = { { id = "tp_xlakeshire", text = "Home. Blue water and green hills, nothing like this." } },
    dreadmaul = { { id = "tp_xdreadmaul", text = "Ogres. Big, angry and hungry. Stay off the north road at night." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. We could use a few more of your sort in the line." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'd not trust you to hold a line, and I'll not pretend otherwise." },
    { id = "g_default", text = "You're not one of mine, so you must be a volunteer, a merchant or a fool. Which is it, then?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. If you're here to help, report to the quartermaster, and if you're here to talk, be brief." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A {class}, and a capable one, by the look of you. I could use a dozen like you on the north road." },
  },
  start = "hello",
  nodes = {
    yworst = {
      lines = {
        { id = "ybblanethergardeofficer1", text = "A patrol of six that went south toward the Tainted Scar and came back as one, raving about demons and fire. The mages took him away, and I never saw him again. I put his name in my report, and nothing else." },
        { id = "ybblanethergardeofficer2", when = { class = "WARLOCK" }, text = "You'll know what's down there better than I do, I expect. I'd rather you didn't tell me." },
      },
      choices = {
        { text = "A soldier's word should be as strong as his shield.", next = "BACK", reply = "Aye, and the good ones are. I've stood beside a few.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever soldier lies to the enemy and lives.", next = "BACK", reply = "Maybe so, but don't make a habit of it with your friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    yfrom = {
      lines = {
        { id = "yblanethergardeofficer1", text = "Lakeshire, in Redridge. My father was a fisherman on the lake, and I joined the army to get away from the smell of fish. Now I'm in a wasteland that smells of brimstone, and I'd give a year's pay for that fish smell." },
        { id = "yblanethergardeofficer2", when = { race = "Human" }, text = "You'll know Redridge, perhaps. The lake's the prettiest thing in the kingdom, when the orcs aren't burning it." },
      },
      choices = {
        { text = "Will you go back?", next = "yback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yback = {
      lines = {
        { id = "yblanethergardeofficer3", text = "When Stormwind relieves us. Which they promise every season, and never do. I've written to the Marshal three times. I'll write a fourth." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I command a watch on the walls of Nethergarde, and I keep the soldiers awake, armed and sober, which out here is three separate battles. The Keep stands because we never stop standing." } },
      again = { { id = "h_again", text = "Go on. Briefly." } },
      choices = {
        { text = "How do you keep morale up out here?", next = "morale" },
        { text = "Who actually runs Nethergarde?", next = "runs" },
        { text = "Your soldiers seem worn thin.", next = "worn" },
        { text = "How long have you been posted here?", next = "xlong" },
        { text = "Do you trust the Kirin Tor mages?", next = "xmages" },
        { text = "What do you think of the Horde in Stonard?", next = "xstonard" },
        { text = "I'm a warrior. Need another sword on the wall?", next = "BACK", when = { class = "WARRIOR" }, reply = "Always. Report to the barracks, and tell them I sent you. You'll stand the night watch, which is the honest test." },
        { text = "Where are you from?", next = "yfrom" },
        { text = "What's the worst thing you've seen here?", next = "yworst" },
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
    xlong = {
      lines = {
        { id = "xxlong_0", text = "Four years, three months, and nine days. I count because the soldiers count, and they need to see I'm in it with them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmages = {
      lines = {
        { id = "xxmages_0", text = "I trust them to do magic. I don't trust them to understand soldiers. They'd keep us here forever if they could, watching a gate that may never open." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xstonard = {
      lines = {
        { id = "xxstonard_0", text = "They're north of us across the swamp, and they watch us as we watch them. Some of my men want to strike first, before the orcs think of it. Others say we'd only bleed for it. What's your view?" },
      },
      choices = {
        { text = "Strike first. Don't wait for them to come.", next = "BACK", reply = "Bold. I'd need orders from Stormwind, which won't come.", fx = { align = { order = -1 } } },
        { text = "Hold the wall. Our task is the Portal.", next = "BACK", reply = "Exactly my thinking. We're here for the Portal, nothing else.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    lakeshire = { { id = "yblanethergardeofficer4", text = "Home. My father fishes the lake still, I hope." } },
    kirin_tor = { { id = "tp_xkirin_tor", text = "Clever folk who think soldiers are furniture." } },
    dark_portal = { { id = "tp_xdark_portal", text = "Dead and broken. I'll keep watching it anyway." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
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
        { text = "The Light forgives all who truly seek it.", next = "BACK", reply = "It does, and I pray we're all given the chance to seek.", fx = { align = { light = 1 } } }, -- dp_stance
        { text = "Some deeds are beyond the Light's forgiveness.", next = "BACK", reply = "Careful, friend. That's a judgment best left to the Light itself.", fx = { align = { light = -1 } } }, -- dp_stance
        { text = "Can the Light heal this land?", next = "heal" },
        { text = "What wounds do you see most?", next = "wounds" },
        { text = "Do you ever regret coming here?", next = "regret" },
        { text = "What do you pray for over the Portal?", next = "xpray" },
        { text = "Do the mages and the clergy get along?", next = "xmages" },
        { text = "Who sent you here?", next = "xsent" },
        { text = "I'm a paladin. Put me to work.", next = "BACK", when = { class = "PALADIN" }, reply = "Gladly, and the Light be thanked for you. The infirmary is past the armoury, and every cot in it is full." },
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
    xpray = {
      lines = {
        { id = "xxpray_0", text = "That it stays shut, mostly, and that the souls of the soldiers who died holding it the first time have found their rest. The ground here remembers them, I think." },
      },
      choices = {
        { text = "Do you sense them?", next = "xsense" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsense = {
      lines = {
        { id = "xxsense_0", text = "Sometimes, on the wind from the south, a voice that might be a prayer or might be the dust. Some here say I should ask the mages to banish whatever lingers. Others say leave the dead in peace. What would you do?" },
      },
      choices = {
        { text = "Leave them be. Pray for them, nothing more.", next = "BACK", reply = "That is my heart's answer too. Thank you.", fx = { align = { light = 1 } } },
        { text = "Let the mages clear it. Safety first.", next = "BACK", reply = "Practical. The Kirin Tor would agree, I think.", fx = { align = { light = -1 } } },
      },
    },
    xmages = {
      lines = {
        { id = "xxmages_0", text = "Politely, and at arm's length. They think prayer is superstition, and I think their wards are vanity. But we both want the Portal closed, and that's enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsent = {
      lines = {
        { id = "xxsent_0", text = "The Cathedral of Light in Stormwind, when the garrison asked for a healer and nobody older wanted the post. I was young enough to say yes before I understood the question." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dark_portal = { { id = "tp_xdark_portal", text = "A wound in the world. I pray over it every night." } },
    cathedral_of_light = { { id = "tp_xcathedral_of_light", text = "Home, and a long way from this dust." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
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
        { text = "How many miners have you lost?", next = "xlost" },
        { text = "What do you think of the clerics?", next = "xclerics" },
        { text = "How did you become foreman?", next = "xrise" },
        { text = "I'm a dwarf, and I know a mine when I see one.", next = "BACK", when = { race = "Dwarf" }, reply = "Then you know this one's poor rock and bad air. I could use a dwarf's eye on the supports, if you've an hour." },
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
    xlost = {
      lines = {
        { id = "xxlost_0", text = "Seven this year. Two to cave-ins, three to the Dreadmaul and two to the red cough. I write the letters myself, because a clerk would get the names wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xclerics = {
      lines = {
        { id = "xxclerics_0", text = "Good folk with soft hands. They pray for my miners and patch them up after, and I'm grateful, even if I'd sooner have more timber for the shafts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrise = {
      lines = {
        { id = "xxrise_0", text = "The last foreman ran off one night with the payroll and a mule. I was the only man left who could read the tally board, so here I am." },
      },
      choices = {
        { text = "Did anyone chase him?", next = "xchase" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xchase = {
      lines = {
        { id = "xxchase_0", text = "Nobody had the time. Some say I should've sent men after him to set an example. Others say let the coward go. What would you have done?" },
      },
      choices = {
        { text = "Send men after him. A thief must answer.", next = "BACK", reply = "Aye, maybe. Too late now, but I'll remember.", fx = { align = { order = 1 } } },
        { text = "Let him go. The mine needed the men more.", next = "BACK", reply = "My thought exactly. Good riddance to him and the mule.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    dreadmaul = { { id = "tp_xdreadmaul", text = "Ogres with clubs and no manners. They think the ore's theirs." } },
    stormwind = { { id = "tp_xstormwind", text = "Late with the pay and short with the timber." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'd rather you were brief today." },
    { id = "g_default", text = "Oh, a visitor! Talk slow, friend, it gives me a reason to rest my arms." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back to the mines unless they owe somebody money." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You've got miner's hands, I can tell. Then you know what it's like to dig all day and see the sky for an hour." },
  },
  start = "hello",
  nodes = {
    yogres = {
      lines = {
        { id = "ybblanethergardeminer1", text = "Twice this season. The Dreadmaul come down from the hills for the ore carts, and the guards drive them off. Last time an ogre picked up a cart with a miner still in it. We got him back, mostly." },
        { id = "ybblanethergardeminer2", when = { race = "Dwarf" }, text = "Your kin would know how to deal with ogres, I'd wager. Ironforge ought to send us a few riflemen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "yblanethergardeminer1", text = "Mary bakes at the Goldshire inn, and Tom is seven, and he wants to be a miner like his da. I tell him no, be a baker like your mum, it's warmer. He'll do what he likes, I expect, same as I did." },
        { id = "yblanethergardeminer2", when = { class = { "PRIEST", "PALADIN" } }, text = "If you pass through Goldshire, would you say a prayer for them? I'd be grateful." },
      },
      choices = {
        { text = "Do you plan to go home?", next = "yhome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhome = {
      lines = {
        { id = "yblanethergardeminer3", text = "When my contract ends, next spring. Unless the Keep asks me to stay, and pays double. Mary says come home. The foreman says the Keep needs every pick. I don't know." },
      },
      choices = {
        { text = "Stay. The Keep needs your iron.", next = "BACK", reply = "Aye. The money would help, at least.", fx = { align = { order = 1 } } },
        { text = "Go home. Family matters more.", next = "BACK", reply = "You're right. I'll tell the foreman in spring.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I dig iron and coal for the Keep, same as every day, and I'll dig tomorrow too unless an ogre gets me first. It's honest work, if you don't count the red dust that gets into your lungs." } },
      again = { { id = "h_again", text = "Something else? Take your time, please." } },
      choices = {
        { text = "How did you end up here?", next = "how" },
        { text = "Have you seen anything strange down there?", next = "strange" },
        { text = "The foreman says you're paid late.", next = "pay" },
        { text = "What's Goldshire like these days?", next = "xgold" },
        { text = "What do you do when you're not digging?", next = "xoff" },
        { text = "Are the green crystals dangerous?", next = "xcrystal" },
        { text = "I'm a dwarf. I'd dig with you any day.", next = "BACK", when = { race = "Dwarf" }, reply = "Ha! Then grab a pick, friend. Dwarves always seem to find the good seam first, and I'd like to learn how." },
        { text = "Tell me about your wife and son.", next = "yfamily" },
        { text = "Do the ogres bother the mine?", next = "yogres" },
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
    xgold = {
      lines = {
        { id = "xxgold_0", text = "Last I saw it, still the same inn, the same blacksmith and kobolds in every hole. My wife and boy are there. I send money when it comes, which isn't often." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xoff = {
      lines = {
        { id = "xxoff_0", text = "Sleep, mostly, and dice with the lads. Some of them drink, but the officer doesn't like it, and the cleric gives you a look that's worse than any punishment." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcrystal = {
      lines = {
        { id = "xxcrystal_0", text = "The old-timers say they make you ill, and the mages want them anyway. Some of us think we should smash them and seal the seam. Others want to sell them to the mages. Which would you do?" },
      },
      choices = {
        { text = "Seal the seam. Some things belong underground.", next = "BACK", reply = "That's what my gut says too. I'll talk to the foreman.", fx = { align = { light = 1 } } },
        { text = "Sell them. The mages pay well.", next = "BACK", reply = "Aye, and coin's coin. I'll think on it.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    mary = { { id = "yblanethergardeminer4", text = "My wife, in Goldshire. She bakes the best bread in Elwynn." } },
    goldshire = { { id = "tp_xgoldshire", text = "Home. I miss the smell of the bakery more than anything." } },
    defias = { { id = "tp_xdefias", text = "They took my old mine. I'll not forgive them for it." } },
    background = { { id = "tp_bg", text = "I'm a Stormwind miner, far from home, digging for the Keep." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. I only see the inside of a mine." } },
  },
}

-- Nethergarde Engineer: one of the gnome engineers working the mines and armoury of Nethergarde Keep.
P:NPC {
  key = "bla_nethergarde_engineer", id = 5997, name = "Nethergarde Engineer", gender = "male",
  role = "engineer", tier = "service",
  temper = { "busy", "nervous" }, values = { "work", "safety" },
  notices = { "race" },
  impression = {
    first = "A soot-smudged gnome engineer fiddles with a drill and glances often towards the Portal.",
    third = "{name} spoke with a Nethergarde Engineer in the mines of Nethergarde Keep.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Oh! Careful there, that's a live boiler. Nethergarde Keep, engineering division, at your service." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Still in one piece? Good, good. That's always nice to see out here." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "A fellow gnome! Wonderful. Nobody else here understands a pressure valve." },
  },
  start = "hello",
  nodes = {
    yworst = {
      lines = {
        { id = "ybblanethergardeengineer1", text = "The main gate winch, the night the Dreadmaul came. It jammed halfway, and I had to climb inside with a hammer while the soldiers held the ogres off. I fixed it in four minutes. My hands didn't stop shaking for two days." },
        { id = "ybblanethergardeengineer2", when = { class = { "WARRIOR", "PALADIN" } }, text = "You'd have been on the other side of that gate, holding the line. Thank you for that, whoever you were." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrain = {
      lines = {
        { id = "yblanethergardeengineer1", text = "At the Gnomeregan Academy of Applied Pressure, top of my class in boilers and second in valves. The fellow who beat me in valves is somewhere in Gnomeregan still, I think. I hope he's well, whatever he's become." },
        { id = "yblanethergardeengineer2", when = { race = "Gnome" }, text = "You'll have known the Academy, perhaps. The cafeteria had the best sprocket stew anywhere." },
      },
      choices = {
        { text = "Will you go back?", next = "yback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yback = {
      lines = {
        { id = "yblanethergardeengineer3", text = "When the King calls, aye. Mekkatorque says we'll retake the city. Some say we should rebuild elsewhere and leave Gnomeregan to the troggs. I'd rather go home, radiation and all." },
      },
      choices = {
        { text = "Follow the King. Gnomeregan will be retaken.", next = "BACK", reply = "That's the spirit! I'll bring my best wrench.", fx = { align = { order = 1 } } },
        { text = "Build anew. The past is poisoned.", next = "BACK", reply = "Hmph. Perhaps. But I'd miss the old pipes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "We keep the drills turning in the mines and the machines running in the armoury. The keep needs ore for weapons, and weapons for whatever comes out of the Dark Portal." } },
      again = { { id = "h_again", text = "Anything else? This valve won't tighten itself." } },
      choices = {
        { text = "What comes through the Dark Portal?", next = "portal" },
        { text = "Why gnomes, so far from Ironforge?", next = "gnomes" },
        { text = "What's the most useful machine here?", next = "xdrill" },
        { text = "Do the soldiers appreciate your work?", next = "xsoldiers" },
        { text = "What would you build, if funds allowed?", next = "xdream" },
        { text = "Dwarves and gnomes, building together again?", next = "BACK", when = { race = "Dwarf" }, reply = "Always, friend! Your lot bring the stubbornness and we bring the springs. The walls stay up, so somebody's doing something right." },
        { text = "Where did you train?", next = "ytrain" },
        { text = "What's the worst thing that's broken here?", next = "yworst" },
        { text = "Good luck with the boiler.", next = "END" },
      },
    },
    portal = {
      lines = { { id = "p_default", text = "Nothing, for now, but the Kirin Tor sent mages here to watch it all the same. The demons in the south of the Blasted Lands are proof enough that something stirs." } },
      choices = {
        { text = "Then the keep must be held at all costs.", next = "BACK", reply = "Quite! That's why we work double shifts.", fx = { align = { honor = 1 } } },
        { text = "Sounds like a good place to leave quickly.", next = "BACK", reply = "Ha! I've thought the same, believe me.", fx = { align = { honor = -1 } } },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "Since Gnomeregan fell, plenty of us took work wherever our skills were needed. Nethergarde pays well and the machines are interesting, even if the scenery is dreadful." } },
      choices = {
        { text = "Do you miss Gnomeregan?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Every day. But we'll take it back one day, and until then, I'll build things here that keep people safe." } },
      choices = { { text = "That's a good way to think. Something else.", next = "BACK" } },
    },
    xdrill = {
      lines = {
        { id = "xxdrill_0", text = "The steam drill, by a mile. It does the work of ten miners and only explodes once a month, which by Nethergarde standards is extremely reliable." },
      },
      choices = {
        { text = "Once a month?", next = "xexplode" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xexplode = {
      lines = {
        { id = "xxexplode_0", text = "Ah, well, the dust gets into the gears. The foreman wants me to slow it down to keep his miners safe. I say a faster drill means more iron and fewer shifts underground. What do you think?" },
      },
      choices = {
        { text = "Slow it down. Lives come before quotas.", next = "BACK", reply = "Hmph, very well. I'll try a gentler setting, for the foreman's sake.", fx = { align = { honor = 1 } } },
        { text = "Keep it fast. The Keep needs iron.", next = "BACK", reply = "Thank you! Speed is safety, in its own way.", fx = { align = { honor = -1 } } },
      },
    },
    xsoldiers = {
      lines = {
        { id = "xxsoldiers_0", text = "Only when something breaks. Nobody thanks the gnome for the gate that works, only curses her for the one that doesn't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdream = {
      lines = {
        { id = "xxdream_0", text = "A mechanical wall-walker, to patrol the battlements so the soldiers can sleep. I've drawn plans, but Stormwind sends ore, not gold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mekkatorque = { { id = "yblanethergardeengineer4", text = "High Tinker Mekkatorque. He'll lead us home." } },
    gnomeregan = { { id = "tp_xgnomeregan", text = "Home. We'll get it back. I've a wrench with the trogg king's name on it." } },
    dark_portal = { { id = "tp_xdark_portal", text = "A broken gate. I check the readings twice a day all the same." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Try one of the advisors." } },
  },
}
