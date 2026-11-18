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
    first = "Zamek is a goblin who belongs to neither racing team and sells to both, and he finds this hilarious. He offered me a repair, a rumor and a distraction in the same breath, and the distraction was the only one with a fixed price.",
    third = "{name} met Zamek, an independent goblin at the Mirage Raceway who sells repairs and, for the right customer, a diversion.",
  },

  greetings = {
    { id = "g_hello", text = "Step right up, pal, independent goblin, no team colors, no loyalties, and no refunds!" },
    { id = "g_pace", when = { questActive = TODO_QUEST("Keeping Pace") }, text = "Pozzik sent you, didn't he? I can smell the fuel on the request. Say the word and I'll make a scene." },
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
        { text = "A man should stand by his side.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart. Take everybody's money.", next = "BACK", fx = { align = { honor = -1 } } },
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
  },

  topics = {
    knows = { { id = "tp_knows", text = "Who's broke, who's cheatin', and what everybody on these flats would pay to know about everybody else." } },
    steamwheedle = { { id = "tp_steam", text = "Good people, the Cartel, and I mean that in a strictly invoiced way." } },
    mirage_raceway = { { id = "tp_race", text = "Two teams, one track, and one goblin in the middle with a cash box. Guess who always wins." } },
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
    first = "Jandia is a tauren trader who keeps Freewind Post in thread, dye and salt, and knows exactly how much of each the lifts can carry. She is practical, warm, and cross about the harpies.",
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
        { id = "h_default", key = true, text = "I am Jandia, and I keep the trade goods of Freewind Post. Everything up here comes up the lifts from the canyon floor, and I make sure we never run out of what matters." },
        { id = "h_screech", when = { questActive = TODO_QUEST("Stop the Screeching") }, text = "That screeching from the cliffs keeps the whole post awake at night. If you can quiet it, we'll all sleep better." },
      },
      again = { { id = "h_again", text = "What else do you need?" } },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What troubles the post?", next = "trouble" },
        { text = "How do you get goods up here?", next = "lifts" },
        { text = "Farewell, Jandia.", next = "END" },
      },
    },
    trouble = {
      lines = { { id = "tr_default", text = "Supplies go missing between the lifts and the storehouses, and the harpies in the cliffs scream all night. Some say they're the same trouble, and I'm beginning to think so too." } },
      choices = {
        { text = "What should be done?", next = "trouble_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_stance = {
      big = true,
      lines = { { id = "ts_default", text = "Cliffwatcher Longhorn wants patrols, and the braves want to burn the nests. I want my crates back and a quiet night, and I'm not particular about how." } },
      choices = {
        { text = "Burn the nests. Drive them off for good.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Patrol and guard. No need to burn anything.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lifts = {
      lines = { { id = "li_default", text = "Rope, pulleys and strong backs, and a prayer to the Earth Mother that the rope holds. Once a crate of salt fell all the way to the canyon floor, and the centaur down there thought it was raining." } },
      choices = {
        { text = "Did they keep the salt?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Thread, salt, dye, and how much rope it takes to lift a crate of each." } },
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
    first = "Turhaw is an orc butcher on a mesa full of tauren, and he cheerfully admits it took him a season to stop offering them kodo steak. He talks with a cleaver in his hand and waves it for emphasis.",
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
      again = { { id = "h_again", text = "Hungry for more? Talk, then." } },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What about the kodo?", next = "kodo" },
        { text = "What's an orc doing here?", next = "why" },
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
        { text = "Respect their ways. The Horde's built on it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Meat is meat. Sell what people buy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "The Warchief wanted orcs and tauren to live side by side, so some of us came to the tauren posts. I came for a season, and I've stayed four, because the views are good and nobody steals my knives." } },
      choices = {
        { text = "Sounds like a good life.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Meat, fire, and what the tauren will and won't eat. I've learned that last one the hard way." } },
    advice = { { id = "tp_ad", text = "Eat before you go down to the canyon. You won't want to after you've seen the scorpids." } },
    _none = { { id = "tp_none", text = "I don't know that one, but ask me about meat and I'll talk all day." } },
  },
}
