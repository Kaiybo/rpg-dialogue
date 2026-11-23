-- Thousand Needles folk the roster scan found unwritten: Moktar Krin's war party at Ironstone Camp
-- (Bor'zehn, Nag'zehn, Tarkreu Shadowstalker), Grish Longrunner at the Great Lift, Prate Cloudseer
-- in the Weathered Nook, and the Mirage Raceway crowd: Rizzle Brassbolts, Drag Master Miglen, Race
-- Master Kronkrider, the ogre announcers Fobeed and Zuzubee, both pit crews, Quentin the soil-minded
-- night elf, and "Plucky" Johnson, who is currently a chicken.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bor'zehn: orc of Moktar Krin's war party at Ironstone Camp.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_borzehn", id = TODO_NPC("Bor'zehn"), name = "Bor'zehn", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "honor" },
  impression = {
    first = "A broad orc sits by the cookfire at Ironstone Camp, oiling an axe that has clearly seen a great deal of use. The kodo behind him snorts at you on his behalf.",
    third = "{name} met Bor'zehn, a warrior of Moktar Krin's war party at Ironstone Camp.",
  },
  greetings = {
    { id = "g_default", text = "Lok'tar. Sit if you want, but don't touch the kodo." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The kodo remembers you, and he is not impressed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bor'zehn, of Moktar Krin's war party. We hunt the beasts of the Needles for Orgrimmar, and we have found more of them than we came for." } },
      again = { { id = "h_again", text = "What else? The fire needs feeding." } },
      choices = {
        { text = "What does Moktar Krin hunt?", next = "hunt" },
        { text = "Who is Nag'zehn to you?", next = "nag" },
        { text = "Good hunting.", next = "END" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "Wind serpents, the great cats, and anything with a hide worth carrying home. Moktar says a warrior who has fought the Needles can fight anything, and he is usually right." } },
      choices = {
        { text = "Hunting for sport is a waste.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good hunt keeps the blade sharp.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    nag = {
      lines = { { id = "n_default", text = "My brother, though he will tell you he is the older and the wiser. He is neither, but he snores less, so I keep him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Nag'zehn: Bor'zehn's brother in the same war party.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_nagzehn", id = TODO_NPC("Nag'zehn"), name = "Nag'zehn", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "wry" }, values = { "loyalty" },
  impression = {
    first = "A lean orc leans against a rock at Ironstone Camp, watching the mesas with a hunter's patience. He nods at you without taking his eyes off the cliffs.",
    third = "{name} met Nag'zehn, a hunter of Moktar Krin's war party.",
  },
  greetings = {
    { id = "g_default", text = "Quiet, stranger. The cliffs have ears, and some of them have wings." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Still in one piece, I see." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Nag'zehn. My brother Bor'zehn guards the fire, Tarkreu guards the shadows, and I watch the sky. Between us, nothing reaches Moktar unseen." } },
      again = { { id = "h_again", text = "Anything else? Keep your voice low." } },
      choices = {
        { text = "What comes from the sky?", next = "sky" },
        { text = "Who else hunts the Needles?", next = "others" },
        { text = "I'll keep quiet.", next = "END" },
      },
    },
    sky = {
      lines = { { id = "s_default", text = "Wind serpents, mostly, and the harpies of the high ledges. A serpent's breath can knock a kodo flat, so you learn to look up before you look ahead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "The Grimtotem, who say the mesas are theirs, and the centaur, who say everything is theirs. We give them both a wide path, unless they make that impossible." } },
      choices = {
        { text = "Then let them come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A wide path is wise.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Tarkreu Shadowstalker: the war party's scout.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_tarkreu_shadowstalker", id = TODO_NPC("Tarkreu Shadowstalker"), name = "Tarkreu Shadowstalker", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "You almost walk past the orc crouched in the rocks at the camp's edge. He was watching you long before you noticed him.",
    third = "{name} met Tarkreu Shadowstalker, the scout of Moktar Krin's war party.",
  },
  greetings = {
    { id = "g_default", text = "You walk loudly. Everything on this mesa heard you coming." },
    { id = "g_back", when = { metBefore = true }, text = "Quieter this time. A little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tarkreu. I scout for Moktar, so I go first and come back last. The Needles hide many things, and I am paid to find them before they find us." },
        { id = "h_rogue", when = { class = { "ROGUE", "HUNTER" } }, text = "You walk like one who knows the shadows. Good, then you can stand still and listen with me." },
      },
      again = { { id = "h_again", text = "Speak softly." } },
      choices = {
        { text = "What have you found out here?", next = "found" },
        { text = "How do you move so quietly?", next = "quiet" },
        { text = "I'll go.", next = "END" },
      },
    },
    found = {
      lines = { { id = "f_default", text = "Grimtotem moving between the mesas, more of them than there should be. They watch Freewind Post the way a wolf watches a fold of sheep." } },
      choices = { { text = "Does Freewind know?", next = "BACK", reply = "They know. Whether they believe it is another matter." } },
    },
    quiet = {
      lines = { { id = "q_default", text = "Soft boots, and patience. Most people are loud because they are in a hurry, and the Needles punish hurry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Grish Longrunner: tauren at the Great Lift between the Barrens and the Needles.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_grish_longrunner", id = TODO_NPC("Grish Longrunner"), name = "Grish Longrunner", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "thunder_bluff", "freewind" }, temper = { "weary" }, values = { "duty", "tribe" },
  notices = { "race", "level" },
  impression = {
    first = "A tall tauren in runner's leathers stands at the top of the Great Lift, his hooves caked in Barrens dust. He looks like he has run a long way and expects to run further.",
    third = "{name} met Grish Longrunner, a tauren runner at the Great Lift.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, traveller. The lift is safe, but the road below it is not." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has there been word from below?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Grish Longrunner. I carry messages between Thunder Bluff and Freewind Post, and between them the Great Lift is the only easy road. The quilboar and the centaur have noticed that too." },
        { id = "h_q", when = { questActive = TODO_QUEST("Calling in the Reserves") }, text = "You carry the call for reserves? Then Freewind's need is greater than I feared. Go quickly." },
      },
      again = {
        { id = "h_again", text = "What else? I must run again soon." },
        { id = "h_again2", text = "Speak, while I catch my breath." },
      },
      choices = {
        { text = "What troubles the road?", next = "road" },
        { text = "Tell me about the Great Lift.", next = "lift" },
        { text = "What does Freewind Post need?", next = "freewind" },
        { text = "Do the runners still honour the old paths?", next = "paths", when = { race = "Tauren" } },
        { text = "Safe running.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Centaur of the Galak clan, and quilboar out of the Barrens thorns. They know a runner carries news, and news is worth killing for." } },
      choices = {
        { text = "Why not send an escort?", next = "escort" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escort = {
      lines = { { id = "e_default", text = "An escort is slow, and slow news is worse than none. A runner runs alone, and trusts the Earth Mother to keep the ground under his hooves." } },
      choices = {
        { text = "Speed matters more than safety.", next = "escort_end", fx = { align = { order = -1 } } },
        { text = "Foolish. One runner is easy prey.", next = "escort_end", fx = { align = { order = 1 } } },
      },
    },
    escort_end = {
      lines = { { id = "ee_default", text = "Perhaps. But I have run this road for many seasons, and I am still here to argue about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lift = {
      lines = { { id = "l_default", text = "The tauren built it to join the Barrens to the Needles below, ropes and wood and a great deal of patience. Without it, Freewind would be a week's climb from any friend." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    freewind = {
      lines = { { id = "f_default", text = "Warriors and more warriors. The Grimtotem grow bold in the Needles, and Cliffwatcher Longhorn has fewer braves than he has cliffs to watch." } },
      choices = { { text = "I'll help if I can.", next = "BACK", fx = { affinity = 1 } } },
    },
    paths = {
      lines = { { id = "p_default", text = "We do, those of us who remember them. My grandfather ran from Mulgore to the sea on paths no orc has ever seen, and I hope to show them to my own children." } },
      choices = { { text = "May they run them well.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}

---------------------------------------------------------------------------
-- Prate Cloudseer: tauren shaman in the Weathered Nook, who gives the Call of Air.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_prate_cloudseer", id = TODO_NPC("Prate Cloudseer"), name = "Prate Cloudseer", gender = "female",
  role = "trainer", tier = "quest",
  communities = { "freewind" }, temper = { "serene" }, values = { "balance", "spirit" },
  notices = { "class" },
  impression = {
    first = "On a high, windswept ledge called the Weathered Nook, an old tauren shaman sits facing the gusts with her eyes closed. Her braids fly, but she does not move.",
    third = "{name} met Prate Cloudseer, the shaman who keeps the Call of Air in the Weathered Nook.",
  },
  greetings = {
    { id = "g_default", text = "The wind told me someone was climbing. It did not tell me who. Sit, and let me look at you." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the high place. The wind is pleased, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Prate Cloudseer. I sit where the air is strongest, so that young shaman may learn to hear it. Air is the hardest element to hold, for it never stays." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Xanis sent you, or Kranal, or Islen. You have earned the earth, the fire and the water, and now you must earn the wind." },
        { id = "h_q", when = { questActive = TODO_QUEST("Call of Air") }, text = "You have heard the call, then. Listen closer, for the wind will tell you what it wants." },
      },
      again = {
        { id = "h_again", text = "Ask. The wind is not in a hurry, though it always seems so." },
        { id = "h_again2", text = "What more would you know?" },
      },
      choices = {
        { text = "Why is air the hardest element?", next = "air" },
        { text = "Why live up here alone?", next = "alone" },
        { text = "What are the Needles like from up here?", next = "view" },
        { text = "I'm ready for the Call of Air.", next = "call", when = { class = "SHAMAN" } },
        { text = "I'll leave you to the wind.", next = "END" },
      },
    },
    air = {
      lines = { { id = "a_default", text = "Earth waits for you, fire demands you, water carries you, but air simply leaves. To hold it, you must be willing to let it go." } },
      choices = {
        { text = "That sounds like a riddle.", next = "riddle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riddle = {
      lines = { { id = "r_default", text = "Every true thing sounds like a riddle to those who have not yet felt it. When the wind fills your totem, you will laugh at how simple it was." } },
      choices = {
        { text = "The spirits must be obeyed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits must be free.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "I am not alone. The wind speaks more than most tauren, and it never asks me to settle a quarrel. Freewind is close enough for bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    view = {
      lines = { { id = "v_default", text = "From here I see the Grimtotem moving among the mesas, and the dust of the goblin races far to the east. The land is restless, and the air carries it all to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    call = {
      lines = { { id = "c_default", text = "Then hold your totem high and let the wind find it. Do not grip it, child, for the wind does not stay where it is held." } },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}

---------------------------------------------------------------------------
-- Rizzle Brassbolts: gnome of the Brassbolts racing crew at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_rizzle_brassbolts", id = TODO_NPC("Rizzle Brassbolts"), name = "Rizzle Brassbolts", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "excitable" }, values = { "craft" },
  impression = {
    first = "A gnome with goggles pushed up on his forehead and grease up to the elbows bounces around the gnomish pit, adjusting bolts that don't seem to need it.",
    third = "{name} met Rizzle Brassbolts, one of the gnome brothers who crew the Mirage Raceway's gnomish team.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Hello! Mind the oil, it's slippery, and the wrench, it's mine." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you come to see the car? Everyone comes to see the car." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rizzle Brassbolts, engineer extraordinaire, and brother to Fizzle and Wizzle. We build the fastest car on the flats, and we'll prove it as soon as the goblins stop cheating." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A fellow gnome! Now you can see the finest engineering south of Ironforge, and a little north of it too." },
      },
      again = { { id = "h_again", text = "What else? I can talk and tighten at once!" } },
      choices = {
        { text = "How do the goblins cheat?", next = "cheat" },
        { text = "What makes your car fast?", next = "car" },
        { text = "Good luck in the race.", next = "END" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "They copy everything, and then they paint it red! Pozzik swears he thought of it first, but I have the blueprints with my own drawings on them." } },
      choices = {
        { text = "Maybe they just think alike.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Copying is cheating, plain and simple.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    car = {
      lines = { { id = "ca_default", text = "Rockets, mostly, and a very careful amount of not blowing up. Fizzle handles the design, Wizzle handles the parts, and I handle the parts that fall off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Drag Master Miglen: gnome drag master at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_drag_master_miglen", id = TODO_NPC("Drag Master Miglen"), name = "Drag Master Miglen", gender = "male",
  role = "questgiver", tier = "service",
  communities = { "mirage_raceway" }, temper = { "officious" }, values = { "order" },
  impression = {
    first = "A gnome with a clipboard and a stopwatch on a chain stands at the gnomish end of the track, scowling at the goblin pit as though it owes him money.",
    third = "{name} met Drag Master Miglen, who times the gnomish team's runs at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_default", text = "Off the track, please! The next run is due in three minutes and forty seconds." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Do you have business, or are you blocking my sight line?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Drag Master Miglen. I time the runs, I keep the records, and I make sure the goblins' numbers are as fake as I think they are." } },
      again = { { id = "h_again", text = "Quickly now, the clock is running." } },
      choices = {
        { text = "Are the goblins' times fake?", next = "fake" },
        { text = "What's a drag master?", next = "drag" },
        { text = "I'll clear the track.", next = "END" },
      },
    },
    fake = {
      lines = { { id = "f_default", text = "I can't prove it, which is the most suspicious part. Nobody's car is that fast without a fuel mix they're not telling anyone about." } },
      choices = { { text = "I could look into it.", next = "BACK", reply = "Discreetly, I hope. Very discreetly." } },
    },
    drag = {
      lines = { { id = "d_default", text = "The one who sets the line, starts the run and keeps the score, so the most important gnome on the flats. Without me, it's just two cars going very fast in no particular direction." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Race Master Kronkrider: neutral official of the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_race_master_kronkrider", id = TODO_NPC("Race Master Kronkrider"), name = "Race Master Kronkrider", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "loud" }, values = { "fairness" },
  impression = {
    first = "A stocky race official in a checkered sash stands on a platform between the two pits, a flag in one hand and a megaphone in the other.",
    third = "{name} met Race Master Kronkrider, who officiates the races at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_default", text = "Step right up! The Mirage Raceway welcomes you to the fastest show on the flats!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more speed? I knew you had the fever!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Race Master Kronkrider, keeper of the rules and waver of the flag. The gnomes and goblins race, and I make sure neither blows up the other on purpose." } },
      again = { { id = "h_again", text = "What else? The flag's getting heavy." } },
      choices = {
        { text = "Who usually wins?", next = "wins" },
        { text = "Are there any rules at all?", next = "rules" },
        { text = "Enjoy the race.", next = "END" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "Whoever crashes last, mostly. The gnomes win on paper, the goblins win on wagers, and I win because both sides pay my wages." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rules = {
      lines = { { id = "r_default", text = "Three of them: stay on the track, finish the race, and no explosions before the line. They break all three most days, but I keep reading them aloud." } },
      choices = {
        { text = "Rules are what make it a sport.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules just slow the cars down.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Fobeed: ogre race announcer.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_fobeed", id = TODO_NPC("Fobeed"), name = "Fobeed", title = "Race Announcer", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "loud" }, values = { "fun" },
  impression = {
    first = "A huge ogre in a too-small vest stands beside the track, a battered goblin megaphone looking like a toy in his fist.",
    third = "{name} met Fobeed, an ogre who announces the races at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_default", text = "Fobeed say hello! Fobeed say it loud, because Fobeed always say it loud!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Fobeed is announcer! Fobeed shout who is winning and who is on fire. Goblins pay Fobeed in meat, and Fobeed very happy." } },
      again = { { id = "h_again", text = "You want more Fobeed talk? Fobeed have lots." } },
      choices = {
        { text = "How did an ogre get this job?", next = "job" },
        { text = "Do you know Zuzubee?", next = "zuzu" },
        { text = "Enjoy the race, Fobeed.", next = "END" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "Goblin say they need someone loud. Fobeed is loudest! Fobeed even louder than the cars when they go boom." } },
      choices = { { text = "I believe you.", next = "BACK" } },
    },
    zuzu = {
      lines = { { id = "z_default", text = "Zuzubee is other announcer. Zuzubee shout for gnomes, Fobeed shout for goblins, and nobody can hear the race at all. Is very good." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Zuzubee: the other ogre race announcer.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_zuzubee", id = TODO_NPC("Zuzubee"), name = "Zuzubee", title = "Race Announcer", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "cheerful" }, values = { "fun" },
  impression = {
    first = "An ogre with a gnomish megaphone strapped to his head grins from the gnome side of the track. Someone has painted 'GO GNOMES' across his belly.",
    third = "{name} met Zuzubee, an ogre who announces for the gnomes at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_default", text = "Zuzubee welcome you! Gnomes go fast today! Maybe! Zuzubee hope so!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Zuzubee shout for gnomes. Gnomes give Zuzubee shiny hat that makes voice big. Zuzubee likes shiny hat very much." } },
      again = { { id = "h_again", text = "More talk? Zuzubee likes talk." } },
      choices = {
        { text = "Why cheer for the gnomes?", next = "why" },
        { text = "Does the hat ever explode?", next = "hat" },
        { text = "Go gnomes.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Fobeed take goblin side first, so Zuzubee take gnome side. Gnomes are small and polite, and they say thank you when Zuzubee not step on them." } },
      choices = { { text = "That's a good reason.", next = "BACK" } },
    },
    hat = {
      lines = { { id = "h2_default", text = "Only one time! Zuzubee eyebrows come back, mostly. Gnomes fixed hat, and now it only smoke a little." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Gnome Pit Crewman: generic gnomish mechanic at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_gnome_pit_crewman", id = TODO_NPC("Gnome Pit Crewman"), name = "Gnome Pit Crewman",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "busy" }, values = { "craft" },
  impression = {
    first = "A gnome in grease-stained overalls scurries between tool racks, muttering measurements to himself.",
    third = "{name} met one of the gnomish pit crew at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_default", text = "Can't stop, can't talk, well, I can talk, but I can't stop!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Pit crew, gnomish team. We fix the car between runs, which means we fix the car all the time, because it breaks all the time." } },
      again = { { id = "h_again", text = "Something else? Quickly, please." } },
      choices = {
        { text = "What breaks most?", next = "breaks" },
        { text = "What do you think of the goblin crew?", next = "goblins" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    breaks = {
      lines = { { id = "b_default", text = "The rocket housing, the steering, and our nerves, in that order. The salt on the flats gets into everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "g_default", text = "Sloppy work, very loud, surprisingly fast. I'd never admit it, so you never heard me say that last part." } },
      choices = { { text = "Heard nothing.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Goblin Pit Crewman: generic goblin mechanic at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_goblin_pit_crewman", id = TODO_NPC("Goblin Pit Crewman"), name = "Goblin Pit Crewman", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "brash" }, values = { "profit" },
  impression = {
    first = "A goblin mechanic lounges against a fuel barrel in the goblin pit, a wrench in one hand and a sandwich in the other.",
    third = "{name} met one of the goblin pit crew at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_default", text = "Hey, pal, you're in the pit. That'll cost you a tip, or a sandwich." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Pit crew for Pozzik. We make the car go, and when it stops going, we make it go again, usually with a hammer." } },
      again = { { id = "h_again", text = "What else? My sandwich is getting warm." } },
      choices = {
        { text = "What's in the fuel?", next = "fuel" },
        { text = "What about the gnome crew?", next = "gnomes" },
        { text = "Enjoy your sandwich.", next = "END" },
      },
    },
    fuel = {
      lines = { { id = "f_default", text = "Trade secret, pal. Let's just say it's flammable, and you shouldn't smoke near it, and definitely don't drink it, which Grizz learned the hard way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "g_default", text = "They measure everything twice and still lose. We measure nothing, and sometimes we win. That's the goblin way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Quentin: night elf at the Mirage Raceway, studying the salt flats' soil.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_quentin", id = TODO_NPC("Quentin"), name = "Quentin", gender = "male",
  role = "scholar", tier = "service",
  communities = { "darnassus" }, temper = { "patient" }, values = { "nature" },
  impression = {
    first = "A night elf kneels at the edge of the Shimmering Flats, rubbing salt between his fingers while the race roars behind him. He hasn't looked at the track once.",
    third = "{name} met Quentin, a night elf studying the soil of the Shimmering Flats.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Forgive me, I am not here for the races." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The salt hasn't changed since we spoke." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Quentin. I came to see whether these flats could ever bear life again. Once, I believe, there was water here, and where there was water, there can be soil." },
        { id = "h_ne", when = { race = "NightElf" }, text = "A kinsman, so far from home! You will understand, then, why I cannot look at a dead land and simply walk past it." },
      },
      again = { { id = "h_again", text = "What else? The salt is patient, and so am I." } },
      choices = {
        { text = "Can anything grow here?", next = "grow" },
        { text = "What do you make of the races?", next = "races" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Not yet, and perhaps not for an age. But the earth remembers, and with the right seeds and the right patience, the flats may bloom again." } },
      choices = {
        { text = "Nature heals itself in time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Nature needs a guiding hand.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    races = {
      lines = { { id = "r_default", text = "Loud, wasteful and strangely joyful. I disapprove, but I have caught myself cheering more than once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- "Plucky" Johnson: Mad Magus Tirth's apprentice, hiding as a chicken.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_plucky_johnson", id = TODO_NPC("\"Plucky\" Johnson"), name = "\"Plucky\" Johnson", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "nervous" }, values = { "survival" },
  impression = {
    first = "A chicken pecks at the dust near the raceway, which is odd enough. Odder still, it keeps glancing over its shoulder like a man expecting to be followed.",
    third = "{name} met \"Plucky\" Johnson, a polymorphed apprentice hiding as a chicken.",
  },
  greetings = {
    { id = "g_default", text = "Bawk. Bawk? Oh, it's you. Keep your voice down." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bawk. I mean, I'm a chicken, obviously, and certainly not Mad Magus Tirth's runaway apprentice. Please don't tell him where I am." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage! Bawk! Please, I beg you, don't turn me back. It's very peaceful being a chicken." },
      },
      again = { { id = "h_again", text = "Bawk. Anything else? Quickly." } },
      choices = {
        { text = "Why hide as a chicken?", next = "why" },
        { text = "Does Tirth know you're here?", next = "tirth" },
        { text = "Bawk to you too.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Tirth makes his apprentices test every spell first, and I've been set on fire seven times. A chicken eats bugs and naps, and nobody sets it on fire." } },
      choices = { { text = "Fair point.", next = "BACK" } },
    },
    tirth = {
      lines = { { id = "t_default", text = "If he did, he would have come by now, bawk. He's busy writing a book, I think, and nobody reads it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

-- Elder Morningdew: an ancestor spirit honoured during the Lunar Festival. She appears in Thousand Needles, among the salt and the strange goblin racing.
P:NPC {
  key = "tn_elder_morningdew", id = 15604, name = "Elder Morningdew", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A night elf spirit, looking out over the salt flats with mild disapproval.",
    third = "{name} paid respects to Elder Morningdew, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, traveller. You find me in an odd place this year, among the dust and the engines." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come round again, and the ancestors are near tonight. I am glad you came to honor them." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the salt flats are no quieter. Still, I am glad of the company." },
    { id = "g_done", when = { questDone = TODO_QUEST("Morningdew the Elder") }, text = "You have paid your respects, and my coin travels with you now. Ishnu-alah." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "NightElf" }, text = "One of my own people, so far from the forests. The festival draws us all far afield, it seems." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She wrinkles her nose as a goblin engine roars somewhere out on the flats.",
      lines = { { id = "h_default", text = "I am Elder Morningdew, and I was a priestess of Elune when this desert was green and the sea had not yet left it. My spirit is honoured at the Lunar Festival, and this year it has brought me here, to the edge of the Shimmering Flats." } },
      again = { { id = "h_again", text = "Ask what you wish, traveller. The goblins make enough noise for both of us." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "Elune keep you, Elder. My family also served the Goddess.", next = "kin", when = { race = "NightElf" } },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I served the Moon Goddess in the old kingdom, before the Sundering broke the world and drew the waters away. I remember this land as a shore, and I remember the morning dew on the grass that gave my family its name." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "Memory holds me, and the moonlight. My people live a very long time, and so we remember a very long time, and the festival lets the remembered speak back once a year." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Then you have a patient heart, and Elune favours patience. The young races often lack it.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "Perhaps, though the living build their way on what the dead left them. Even these goblins race on an old seabed.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year beneath the moon, when the elders of every people are honoured. In Moonglade the druids keep the great celebration, and Elune lets the old spirits linger near their descendants for a while." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is sacred to the druids, and Elune's light gathers there when the year turns. Most of the elders go there in the end, but some of us like to wander first." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Then I accept your respect, and I give you the coin of my line as the custom asks. Remember that this dust was once a shore, and that I saw it." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then we are sisters in the moonlight, whatever our years. Keep faith with her, and she will keep faith with you." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is beyond my memory, traveller, which is a long way to go." } },
  },
}

-- Freewind Brave: the tauren guards who keep the lifts and the ramp up to Freewind Post.
P:NPC {
  key = "tn_freewind_brave", id = 9525, name = "Freewind Brave", gender = "male",
  role = "guard", tier = "service",
  communities = { "freewind" }, temper = { "steady", "watchful" }, values = { "duty", "tribe" },
  notices = { "race", "travel" },
  impression = {
    first = "He leans on his spear and watches the canyon floor below.",
    third = "{name} spoke with a Freewind Brave guarding the lifts of Freewind Post.",
  },
  greetings = {
    { id = "g_default", text = "Peace, {class}. The lift is sound, and the post is above, if you have business there." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "Keep your weapons sheathed, stranger. Freewind Post does not welcome trouble, and I am the one who stops it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Earth Mother's blessing, {g:brother|sister}. It is good to see horns up here among the needles." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard the ramp and the lifts of Freewind Post, so that nothing climbs up here that we did not invite. The Grimtotem and the centaur would both like to try." },
                { id = "h_alli", when = { faction = "Alliance" }, text = "I guard the lifts of Freewind Post for the Horde and for Thunder Bluff. Say what you need and be on your way." } },
      again = { { id = "h_again", text = "Something more? My eyes stay on the canyon while we talk." } },
      choices = {
        { text = "Who troubles the post?", next = "threats" },
        { text = "How do the lifts work?", next = "lifts" },
        { text = "Farewell, brave.", next = "END" },
      },
    },
    threats = {
      lines = { { id = "t_default", text = "The Galak centaur raid from the west, and the Grimtotem keep camps among the needles and hate any tauren who follows Cairne. Below us the Venture Company goblins dig where they like, and nobody asked the land first." } },
      choices = {
        { text = "The Grimtotem are tauren too. Can't they be reasoned with?", next = "grimtotem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grimtotem = {
      lines = { { id = "g_default2", text = "Magatha Grimtotem's people want the tauren apart from the Horde, and they treat other races as enemies. Cairne has offered them peace more times than I can count, and they answer with spears." } },
      choices = {
        { text = "Then they should be driven from the needles.", next = "BACK", reply = "Many here agree with you, {class}. Bring their spears down, and the post will remember it.", fx = { align = { honor = 1 } } },
        { text = "Cairne is right. Keep offering peace.", next = "BACK", reply = "The High Chieftain's patience is greater than mine, and perhaps that is why he leads. I will keep my spear ready all the same.", fx = { align = { honor = -1 } } },
      },
    },
    lifts = {
      lines = { { id = "l_default", text = "Ropes, counterweights and a good deal of trust, {class}. The platforms rise and fall between the mesas, and the brave at the bottom watches the brave at the top." } },
      choices = { { text = "I'll trust them, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I keep the lifts, {class}, not the gossip. Ask at the inn above." } },
  },
}

---------------------------------------------------------------------------
-- "Plucky" Johnson: Magus Tirth's apprentice, hiding at the Mirage Raceway as a chicken.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_plucky_johnson", id = 6626, name = "\"Plucky\" Johnson", gender = "male",
  role = "vendor", tier = "quest",
  communities = { "raceway" }, temper = { "nervous" }, values = { "survival", "freedom" },
  impression = {
    first = "A chicken pecks at the salt by the Raceway stands. When you look at it, it looks back, which chickens do not usually do, and then it clucks in a way that sounds almost like a sigh.",
    third = "{name} met \"Plucky\" Johnson, a human apprentice who turned himself into a chicken to hide from his master.",
  },
  greetings = {
    { id = "g_default", text = "Bawk. Bawk-bawk? ...Oh, all right, you've seen through it. Please keep your voice down." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again. You haven't told the Magus where I am, have you? Bawk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Johnson's the name, though the racing crowd calls me Plucky, which I suppose I've earned. I was apprenticed to Magus Tirth, and I am hiding from him, and a chicken is the last place he would look." },
        { id = "h_q", when = { questActive = TODO_QUEST("Get the Scoop") }, text = "You're asking about the Magus's business? Bawk. Then you'd better hear the whole sorry tale from me first." },
      },
      again = { { id = "h_again", text = "Anything else? Quietly, please. Bawk." } },
      choices = {
        { text = "Why hide from your own master?", next = "tirth" },
        { text = "Can you turn yourself back?", next = "back" },
        { text = "Don't worry. Your secret is safe.", next = "END" },
      },
    },
    tirth = {
      lines = { { id = "t_default", text = "The Magus is a brilliant man with a short temper and a long list of chores. I broke one of his things, then another, and by the third I decided that an apprentice who runs away keeps more of his feathers." } },
      choices = {
        { text = "You owe him an apology and an honest day's work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No one should serve a master they fear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "In theory, yes. In practice, I've grown rather good at being a chicken, and the goblins here feed me for free. Bawk. I may stay a little longer." } },
      choices = { { text = "Mind the gnome racers' wheels.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Bawk. I'm a chicken; I don't know much. Ask the goblins." } } },
}
