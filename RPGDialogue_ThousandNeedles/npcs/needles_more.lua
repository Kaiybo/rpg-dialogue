-- More of Thousand Needles: Zamek, the independent goblin at the Mirage Raceway (Zamek's Distraction), and
-- Freewind Post's Jandia (trade goods) and Turhaw (butcher). Voice: bibles/needles_more.md
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Zamek
---------------------------------------------------------------------------
P:NPC {
  key = "zamek", id = TODO_NPC("Zamek"), name = "Zamek",
  bible = "bibles/needles_more.md", role = "vendor", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "gleeful", "shifty" }, values = { "profit", "mischief" },
  notices = { "race", "class" },

  impression = {
    first = "He sells to both racing teams and finds this hilarious.",
    third = "{name} met Zamek, an independent goblin at the Mirage Raceway who sells repairs and, for the right customer, a diversion.",
  },

  greetings = {
    { id = "g_hello", text = "Step right up, pal, independent goblin, no team colors, no loyalties, and no refunds!" },
    { id = "g_pace", when = { questActive = TODO_QUEST("Keeping Pace") }, text = "Pozzik sent you, didn't he? You've got his garage grease on your boots. Say the word and I'll make a scene." },
    { id = "g_done", when = { questDone = TODO_QUEST("Zamek's Distraction") }, text = "Rizzle still doesn't know what hit him, and I've been dining out on it all week, pal." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Don't worry, sweetheart, I'm independent, so I'll sell to you just as gladly as I'll sell you out." },
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin who didn't pick a team! Smart, kid, very smart; the money's always in the middle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zamek, pal, independent contractor, repairs, odd jobs and anything else that pays. The gnomes race the goblins out on the flats, and I stand right here in the middle and take money off both of 'em." },
        { id = "h_pace", when = { questActive = TODO_QUEST("Keeping Pace") },
          text = "So Pozzik wants Rizzle's plans, and Rizzle never leaves his hut, and you need him out of it. Listen, listen, that's my specialty, chum: you give me the nod, I make the commotion, and you go in the back while the whole camp's lookin' at me." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Zamek's Distraction"), days = 3 } },
          text = "Did you see Rizzle's face? He came out of that hut like his beard was on fire, which, for the record, it wasn't, mostly." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, and you're spendin' both." },
        { id = "h_again2", text = "Keep talkin', I'm listenin' and I'm billin'." },
      },
      choices = {
        { text = "Why don't you pick a team?", next = "teams" },
        { text = "What kind of distraction?", next = "distraction" },
        { text = "What's the deal with Rizzle?", next = "rizzle" },
        { text = "Who's the best racer out here?", next = "racers" },
        { text = "Let's do business.", next = "BUSINESS" },
        { text = "I build a few gadgets of my own.", next = "eng", when = { profession = "Engineering" } },
        { text = "A gnome can't get a straight answer out here.", next = "gnome", when = { race = "Gnome" } },
        { text = "See you around, Zamek.", next = "END" },
      },
    },

    teams = {
      lines = { { id = "te_default", text = "Pick a team? And lose half my customers? The gnomes break their cars, the goblins break their cars, and they both come to me because I'm the only one who doesn't care who wins." } },
      choices = {
        { text = "So you play both sides.", next = "teams_both" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teams_both = {
      big = true,
      lines = { { id = "tb_default", text = "Both sides, the middle, and the bleachers, kid. The way I see it, loyalty's just a discount you give somebody for nothin', and I don't do discounts." } },
      choices = {
        { text = "A man should stand by his own side.", next = "BACK", reply = "Stand by it all you like, kid, and I'll be standin' right next to you with a repair bill when your side's car blows up.", fx = { align = { honor = 1 } } },
        { text = "Smart. Take everybody's money.", next = "BACK", reply = "Now you're talkin' like a real professional, kid, and if you ever want to open a stall next to mine, I'll only charge you half the rent.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    distraction = {
      lines = { { id = "di_default", text = "A professional one, pal, which means loud, harmless and over before anybody thinks to count their valuables. I've got a crate of fireworks, a very angry turtle, and a song about Rizzle's mother, and I'm not sayin' which one I use." } },
      choices = {
        { text = "The turtle. It has to be the turtle.", next = "distraction_turtle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    distraction_turtle = {
      lines = { { id = "dt_default", text = "Everybody wants the turtle, chum. The turtle's on retainer, the turtle's got a manager, and the turtle bites, so the turtle costs extra." } },
      choices = {
        { text = "That's the best thing I've heard all day.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rizzle = {
      lines = { { id = "ri_default", text = "Rizzle Brassbolts does the plans for the gnome team, and lately their cars have been runnin' faster with the same designs as before. Pozzik reckons Rizzle's found some new wonder metal, and he's been sleepin' on those plans like a dragon on a pile of gold." } },
      choices = {
        { text = "Is stealing them fair?", next = "rizzle_fair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rizzle_fair = {
      lines = { { id = "rf_default", text = "Fair? Pal, this is a race between goblins and gnomes in the middle of a salt flat; fair packed up and left years ago. Anyway, they'll steal ours back by Tuesday, and I'll sell 'em the distraction for that too." } },
      choices = {
        { text = "You've thought this through.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "mirage_raceway" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    racers = {
      lines = {
        { id = "ra_default", text = "Depends who's payin' me to say so, pal. Off the record, the gnomes build better and the goblins drive crazier, and crazier wins more often than the gnomes' math says it should." },
        { id = "ra_gnome", when = { race = "Gnome" }, text = "Your lot build better, sweetheart, I'll give you that for free. But the goblins drive like they've got nothin' to lose, and mostly they don't." },
      },
      choices = {
        { text = "I'll put my money on the goblins.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eng = {
      lines = {
        { id = "eng_d", text = "No kiddin'? Then listen, pal, you and me are the only two people on this whole salt pan who know a torque wrench from a soup spoon. Fizzle's rig runs hot and Pozzik's runs rich, and I'll tell ya which one blows first for a very reasonable consulting fee." },
      },
      choices = {
        { text = "Keep the fee. I'll watch for the smoke.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gnome_d", text = "Sure ya can, friend, it just costs extra. Here's one on the house: your boys are better with numbers and our boys are better with fuel, and the day somebody hires both is the day I go out of business." },
      },
      choices = {
        { text = "Then nobody had better tell them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Who's broke, who's cheatin', and what everybody on these flats would pay to know about everybody else." } },
    steamwheedle = { { id = "tp_steam", text = "Good people, the Cartel, and I mean that in a strictly invoiced way." } },
    mirage_raceway = { { id = "tp_race", text = "Two teams, one track, and one goblin in the middle with a cash box, sweetheart. Guess who goes home rich every single race, crash or no crash." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, but give me a day and I'll sell you a rumor about it." } },
  },
}

---------------------------------------------------------------------------
-- Jandia
---------------------------------------------------------------------------
P:NPC {
  key = "jandia", id = TODO_NPC("Jandia"), name = "Jandia",
  title = "Trade Supplies",
  bible = "bibles/needles_more.md", role = "vendor", tier = "service",
  communities = { "freewind" }, temper = { "practical", "warm" }, values = { "trade", "community" },
  notices = { "craft" },

  impression = {
    first = "She is practical, warm, and cross about the harpies.",
    third = "{name} met Jandia, who sells trade supplies at Freewind Post.",
  },

  greetings = {
    { id = "g_hello", text = "Thread, cloth, salt, dye. Whatever you need, it came up the lift on someone's back, so treat it kindly." },
    { id = "g_supplies", when = { questActive = TODO_QUEST("Stolen Freewind Supplies") }, text = "Any sign of our supplies? Every crate matters up here." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stolen Freewind Supplies") }, text = "The supplies came back thanks to you. I've put the crates where I can see them." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "You work with your hands, I can see it. I have good thread today, if you need it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_grimtotem", when = { killed = { name = "Grimtotem", min = 20 } },
          text = "You've been fighting the Grimtotem in the canyons, I hear. Good, because they've been raiding our supply lines, and every one of them you put down means fewer stolen crates for me to count." },
        { id = "h_default", key = true, text = "I am Jandia, and I keep the trade goods of Freewind Post. Everything up here comes up the lifts from the canyon floor, and I make sure we never run out of what matters." },
        { id = "h_screech", when = { questActive = TODO_QUEST("Stop the Screeching") }, text = "That screeching from the cliffs keeps the whole post awake at night. If you can quiet it, we'll all sleep better." },
      },
      again = { { id = "h_again", text = "What else do you need?" } },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What troubles the post?", next = "trouble" },
        { text = "How do you get goods up here?", next = "lifts" },
        { text = "What sells best up here?", next = "sells" },
        { text = "What's the canyon floor like?", next = "canyon" },
        { text = "Where does your thread come from?", next = "thread", when = { profession = { "Tailoring", "Leatherworking" } } },
        { text = "Is Freewind a good home?", next = "tauren_home", when = { race = "Tauren" } },
        { text = "I could stand guard over your crates tonight.", next = "guard", when = { class = { "WARRIOR", "HUNTER" } } },
        { text = "Farewell, Jandia.", next = "END" },
      },
    },
    trouble = {
      lines = { { id = "tr_default", text = "Supplies go missing between the lifts and the storehouses, and the harpies in the cliffs scream all night. Some say they're the same trouble, and I'm beginning to think so too." } },
      choices = {
        { text = "What should be done?", next = "trouble_stance" },
        { text = "Who would steal from Freewind?", next = "trouble_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_stance = {
      big = true,
      lines = { { id = "ts_default", text = "Cliffwatcher Longhorn wants patrols, and the braves want to burn the nests. I want my crates back and a quiet night, and I'm not particular about how." } },
      choices = {
        { text = "Burn the nests. Drive them off for good.", next = "BACK", reply = "Burn them, and the smoke will reach the Pinnacle by morning, but I'll admit I wouldn't weep for a single nest.", fx = { align = { light = -1 } } },
        { text = "Patrol and guard. There's no need to burn anything.", next = "BACK", reply = "That's the sensible way, and I'll tell Longhorn you said so, though the braves won't thank you for it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lifts = {
      lines = { { id = "li_default", text = "Rope, pulleys and strong backs, and a prayer to the Earth Mother that the rope holds. Once a crate of salt fell all the way to the canyon floor, and the centaur down there thought it was raining." } },
      choices = {
        { text = "I hope the centaur enjoyed it.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_who = {
      lines = { { id = "tw_default", text = "Harpies, if the feathers by the storehouse mean anything, though I've heard the Galak come up the paths at night as well. Whoever it is knows when the lift runs and when the guard changes, and that troubles me more than the theft." } },
      choices = {
        { text = "Have you told Cliffwatcher Longhorn?", next = "trouble_longhorn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_longhorn = {
      lines = { { id = "tl_default", text = "Twice, and he listens, and then he tells me he hasn't the braves to guard every crate on the mesa. He's right, and I hate that he's right, so I've started counting the crates myself every morning." } },
      choices = {
        { text = "Something else, Jandia.", next = "BACK" },
        { text = "Farewell, Jandia.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "se_default", text = "Salt, always, because meat won't keep without it and Turhaw goes through it like water. After that it's thread and dye for the weavers, and rope, because everyone on a mesa thinks about rope more than they'd like to." } },
      choices = {
        { text = "Turhaw, the orc butcher?", next = "sells_turhaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_turhaw = {
      lines = { { id = "st_default", text = "He's loud and he burns everything, but he pays on time and he's never once haggled with me. After his trouble with the kodo steaks he asked me for a whole season what tauren will and won't eat, and I respect anyone who asks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    canyon = {
      lines = { { id = "ca_default", text = "Hot and dusty and full of things that bite, and the Galak centaur hold most of the western needles. I went down once when I was young and came back up in a hurry, and I've been content to trade from the top ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thread = {
      lines = { { id = "th_default", text = "Fine thread from the traders at the Crossroads, and coarse thread spun right here from the hair the kodo shed in spring. If you're stitching for the canyon, take the coarse one, because it holds up against the thorns." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren_home = {
      lines = { { id = "tn_default", text = "The best I've had, though the wind never stops and the harpies never sleep. We came up here because the mesas are high and the centaur can't climb them easily, and the Earth Mother's sky feels very close at night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "gu_default", text = "That's kind of you, though I've nothing to pay a guard with but my thanks. If you do, watch the eastern storehouse, because that's where the feathers keep turning up." } },
      choices = {
        { text = "I'll keep an eye on it.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Thread, salt, dye, and how much rope it takes to lift a crate of each." } },
    centaur = { { id = "tp_ce", text = "The Galak hold the canyon floor. They don't climb well, and I thank the Earth Mother for it daily." } },
    earth_mother = { { id = "tp_em", text = "She keeps the rope from fraying, I like to think, though I check it myself all the same." } },
    advice = { { id = "tp_ad", text = "Never stand under the lift when it's loaded. Never." } },
    _none = { { id = "tp_none", text = "I don't know. I only know what comes up the lifts." } },
  },
}

---------------------------------------------------------------------------
-- Turhaw
---------------------------------------------------------------------------
P:NPC {
  key = "turhaw", id = TODO_NPC("Turhaw"), name = "Turhaw",
  title = "Butcher",
  bible = "bibles/needles_more.md", role = "vendor", tier = "service",
  communities = { "freewind" }, temper = { "cheerful", "loud" }, values = { "food", "work" },
  notices = { "race" },

  impression = {
    first = "It took him a season to stop offering the tauren kodo steak.",
    third = "{name} met Turhaw, the orc butcher of Freewind Post.",
  },

  greetings = {
    { id = "g_hello", text = "Meat and drink! Good meat, honest drink, and none of it kodo, I swear on my axe." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "No kodo here, friend, I promise. Plainstrider, boar, and something the hunters call cougar." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Turhaw, butcher of Freewind, and the only orc on this rock who cooks. The tauren eat well enough, but they boil everything, and a man needs something with char on it now and then." },
      },
      again = { { id = "h_again", text = "Hungry for more? Talk, then, while I cut." } },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What about the kodo?", next = "kodo" },
        { text = "What's an orc doing here?", next = "why" },
        { text = "What's good today?", next = "food" },
        { text = "Lok'tar, brother. You've gone soft among the tauren.", next = "orc_soft", when = { race = "Orc" } },
        { text = "Thank you for honouring the kodo.", next = "tauren_thanks", when = { race = "Tauren" } },
        { text = "Do you need meat brought up?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Farewell, Turhaw.", next = "END" },
      },
    },
    kodo = {
      lines = { { id = "ko_default", text = "My first week here I put kodo steaks on the board, and the whole post went silent, and an old tauren woman cried. I've never felt so ashamed with a cleaver in my hand, and I've done some things with cleavers." } },
      choices = {
        { text = "An honest mistake.", next = "kodo_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo_stance = {
      big = true,
      lines = { { id = "ks_default", text = "That's what Abeqwa said. Some of the orcs at the Crossroads still sell it, though, and say the tauren should get used to it, because meat is meat." } },
      choices = {
        { text = "Respect their ways. The Horde's built on it.", next = "BACK", reply = "Respect, aye. My people learned that the hard way, and Cairne's people earned it twice over, so I don't sell kodo here.", fx = { align = { order = 1 } } },
        { text = "Meat is meat. Sell what people buy.", next = "BACK", reply = "Meat is meat, maybe, but this is Freewind, and I'll not spit on the hosts who let an orc keep a butcher's block on their mesa.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "The Warchief wanted orcs and tauren to live side by side, so some of us came to the tauren posts. I came for a season, and I've stayed four, because the views are good and nobody steals my knives." } },
      choices = {
        { text = "Sounds like a good life.", next = "BACK", fx = { affinity = 1 } },
        { text = "Four seasons? What keeps you here?", next = "why_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_stay = {
      lines = { { id = "ws_default", text = "The view, first, because on a clear morning you can see across the needles to the salt flats. And the tauren, second, because they treated an orc with a cleaver like a neighbour from the first day, even after the kodo business." } },
      choices = {
        { text = "Don't you miss the orcs at the Crossroads?", next = "why_crossroads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_crossroads = {
      lines = { { id = "wc_default", text = "Some days I miss a good loud argument over supper, because the tauren won't argue, they just look at you sadly. But the Crossroads is all dust and grunts and Razormane, and up here the worst that happens is a harpy steals your washing." } },
      choices = {
        { text = "Something else, Turhaw.", next = "BACK" },
        { text = "Farewell, Turhaw.", next = "END" },
      },
    },
    food = {
      lines = { { id = "fo_default", text = "Plainstrider leg roasted till the skin cracks, and a cougar flank the hunters brought up this morning. There's spiced wolf too, if you've the stomach for it, from a recipe an old cook taught me in Durotar." } },
      choices = {
        { text = "Do the tauren like it charred?", next = "food_char" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_char = {
      lines = { { id = "fc_default", text = "They like it fine once they've tried it! Abeqwa won't admit it, but I've caught him back for seconds twice, and he told me it was only to check I hadn't burned the post down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_soft = {
      lines = { { id = "os_default", text = "Soft? I chased a cougar off the lift with this cleaver two days ago! I'll grant you I've started thanking my meat before I cut it, and if you laugh, your supper gets burned." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren_thanks = {
      lines = { { id = "tt_default", text = "You don't need to thank me for doing what's right, friend, though I'll take it. Just tell the old ones down the post that Turhaw learns, slow as he is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Always! Boar and plainstrider from up top, cougar if you're brave, and nothing from the canyon floor, because the scorpids taste like old boots. Take it to Jandia for salt first, or it'll spoil before it reaches my fire." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    thrall = { { id = "tp_th", text = "The Warchief said orcs and tauren should share a fire. I took him at his word and brought my own." } },
    centaur = { { id = "tp_ce", text = "The Galak raid the canyon. None of them has ever tried my cooking, and it's their loss." } },
    knows = { { id = "tp_knows", text = "Meat, fire, and what the tauren will and won't eat. I've learned that last one the hard way." } },
    advice = { { id = "tp_ad", text = "Eat before you go down to the canyon. You won't want to after you've seen the scorpids." } },
    _none = { { id = "tp_none", text = "I don't know that one, but ask me about meat and I'll talk all day." } },
  },
}
