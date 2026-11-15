-- Powderfuse Port: the goblin town on the Riverglades coast, at the end of the Steamwheedle boat. Neutral. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "melbin", id = TODO_NPC("Melbin Powderfuse"), name = "Melbin Powderfuse", title = "Master Goblin Engineer",
  bible = "bibles/riverglades.md", role = "trainer", tier = "major",
  communities = { "powderfuse_port" }, temper = { "shrewd" }, values = { "greedy", "proud" },
  notices = { "craft", "purse", "race" },

  greetings = {
    { id = "g_default", text = "Hands off the walls, pal; I built those." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Spending today, or just admiring?" },
    { id = "g_engineer", when = { profession = "Engineering" }, text = "A fellow engineer! That's lovely, but touch nothing anyway." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "So you're an engineer, are you? Gnomish or goblin... no, don't answer, I can tell by the eyebrows, since some of yours are missing." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Rich, eh? I like you, and I like your purse even more. Ever thought about property? I've got some; all of it, actually." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in MY port, measuring things with your eyes; I can see you doing it, so stop it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Melbin Powderfuse, Master Goblin Engineer. The docks, the inn, every plank and every nail: mine, and I built it all. Before me there was nothing here but sand and murlocs.",
          fx = { hear = "melbin_built_port", learn = { "powderfuse_port" } } },
        { id = "h_partner", when = { townStanding = { town = "powderfuse_port", min = 30 } },
          text = "My favourite customer! Everybody in the port says so, because I told them to." },
      },
      again = {
        { id = "h_again", text = "More questions? Questions are free, and answers are free too, but the building you're standing in is not." },
        { id = "h_again2", text = "Go on, go on. I'm listening and invoicing at the same time." },
      },
      choices = {
        { text = "You really built all of this yourself?", next = "built" },
        { text = "What can I do for you?", next = "deal" },
        { text = "Why build a port here, of all places?", next = "why" },
        { text = "Who are your neighbours?", next = "neighbors" },
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "A gnome would have built it faster.", next = "gnome", when = { race = "Gnome" } },
        { text = "Am I a partner yet?", next = "partner", when = { townStanding = { town = "powderfuse_port", min = 30 } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    built = {
      lines = { { id = "b_default", text = "Every board! Well, I designed every board, and some goblins I paid did the nailing. Paid them well, too, so ask them... actually, don't ask them." } },
      choices = {
        { text = "So you didn't build it.", next = "built_push", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    built_push = {
      lines = { { id = "bp_default", text = "I built it the way the Baron built Booty Bay: by being the one who owns it afterwards. That's what building means, kid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deal = {
      lines = { { id = "d_default", text = "Now you're talking. The Brotherhood buys, the Horde buys, the pirates buy when they think I'm not looking. I need hands that can carry things past all three without getting stabbed." } },
      choices = {
        { text = "What's the pay?", next = "deal_pay", fx = { trait = { greedy = 1 } } },
        { text = "I don't work for goblins.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    deal_pay = {
      lines = { { id = "dp_default", text = "Fair. Goblin fair, which means you'll complain and come back anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Rivers! Three of them, bending like a drunk's walk home, all coming down to this coast. Timber, ore, pelts, they all float to me, and I just had to be here first." } },
      choices = {
        { text = "Smart.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Steamwheedle Cartel?", next = "why_cartel" },
      },
    },
    why_cartel = {
      lines = { { id = "wc_default", text = "The Cartel says I owe them a cut, and I do: a small one, a very carefully calculated small one.",
        fx = { learn = { "steamwheedle" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbors = {
      lines = {
        { id = "n_default", text = "The Brotherhood's south of here, honest and broke, and the Horde's west, honest, broke and louder. The cultists in the middle aren't paying, and up north there's ogres who changed sides, the most goblin thing I ever saw an ogre do.",
          fx = { learn = { "twilights_hammer", "brotherhood_horse" } } },
      },
      choices = {
        { text = "And the pirates at Windstead?", next = "neighbors_pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_pirates = {
      lines = { { id = "np_default", text = "They're customers, is what they are, so don't you go telling the Brotherhood." } },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I might.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Faster, sure, and then it'd explode. Mine's only exploded twice, and once was on purpose." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    partner = {
      lines = { { id = "p_default", text = "Partner? Ha! No, but you're a valued customer, and in Powderfuse that's better, because partners pay rent." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born with nothing, somewhere with less, and now I own a port. Do the sums; it's a very inspiring story." } },
    advice = { { id = "tp_ad", text = "Never build on land somebody else owns. Build first, and make them prove it." } },
    powderfuse_port = { { id = "tp_port", text = "Mine, all of it, so next question." } },
    steamwheedle = { { id = "tp_cartel", text = "Fine people, thirsty people, and every cut they take, I take back from the boat fares." } },
    twilights_hammer = { { id = "tp_hammer", text = "Terrible customers. They never buy anything, and they keep looking at the sky like it owes them money." } },
    _none = { { id = "tp_none", text = "Is it for sale? If it isn't, I haven't got an opinion." } },
  },
}

P:NPC {
  key = "zizplink", id = TODO_NPC("Innkeeper Zizplink"), name = "Innkeeper Zizplink",
  bible = "bibles/riverglades.md", role = "innkeeper", tier = "service",
  communities = { "powderfuse_port" }, temper = { "cheerful", "chatty" }, values = { "generous" },
  notices = { "guest", "drink" },

  greetings = {
    { id = "g_default", text = "Another explorer! Come in, come in, and mind the smell; it's the sea, mostly." },
    { id = "g_home", when = { homeInn = { "Powderfuse Port" } }, text = "Your room's ready! I aired it out, but the air came back in, so it smells like fish again." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Oh, you've been at Argo's bottle! Sit down before the floor comes up to meet you; it does that here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zizplink, innkeeper. Beds upstairs, food down here, and everybody off the Tanaris boat comes through that door. You hear things, running the inn at the end of a boat route." },
        { id = "h_list", tags = { "news" }, when = { questActive = TODO_QUEST("Zizplink's Grocery List") },
          text = "You've got my list! Don't lose it, and don't read it out loud; some of those are for Fimbo, and he's sensitive." },
      },
      again = { { id = "h_again", text = "Anything else, explorer?" }, { id = "h_again2", text = "More? I'll top you up while you think." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Heard anything?", next = "gossip" },
        { text = "Who's the grumpy one at the bar?", next = "gray" },
        { text = "Does Melbin really own everything?", next = "melbin" },
        { text = "Goodbye.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "Plenty! Most of it's Argo's, so half of it's sea monsters. Sit a while; the other half comes round eventually." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gray = {
      lines = { { id = "gr_default", text = "Gray? He's Brotherhood. He comes down from the keep, drinks, grumbles, tips well and goes back up again. Don't sit in his chair; he doesn't own it, but don't anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
    },
    melbin = {
      lines = { { id = "m_default", text = "He owns the land, or so he says. I own the stew pot and the good blankets, and I never once let him forget it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I ran a kitchen, then a galley, and now an inn, and every step was a bigger pot." } },
    advice = { { id = "tp_ad", text = "Breathe through your mouth on the docks at low tide. Trust me." } },
    powderfuse_port = { { id = "tp_port", text = "Best little port on the coast! It's the only little port on the coast, but that still counts." } },
    _none = { { id = "tp_none", text = "Never heard of it! Ask me tomorrow, though; somebody'll have told me by then." } },
  },
}

P:NPC {
  key = "gray", id = TODO_NPC("Gray Dawnbright"), name = "Gray Dawnbright",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port", "brotherhood_horse" }, temper = { "surly" }, values = { "loyal" },
  notices = { "standing", "drink" },

  greetings = {
    { id = "g_default", text = "What is it? Can't you see I'm busy?" },
    { id = "g_drink", text = "If you're going to stand there, stand there with a drink for me." },
  },

  notice = {
    { id = "n_hero", cat = "standing", when = { townStanding = { town = "farholde", min = 30 } },
      text = "You're the one they talk about up at the keep. Fine, sit, but don't make a habit of it." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're further gone than me, and that's a first this week. Sit, sit." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gray Dawnbright, Brotherhood of the Horse, on leave from it, or it's on leave from me; I haven't decided. Make yourself useful and get Zizplink to fill this." },
        { id = "h_resolved", tags = { "news" }, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "I went up to the keep and sat with Demar. We didn't talk about her, not really; we drank to her, alive or not, and that's the first time in years." },
        { id = "h_soured", when = { thread = { id = "farholde_lost", state = "soured" } },
          text = "Don't. Whatever it is, I've heard it." },
        { id = "h_tessa", when = { metBefore = true }, text = "I wrote Tessa a letter, tore it up and wrote another, and that one's in the stew, I think. Don't eat the stew." },
      },
      again = { { id = "h_again", text = "Still here? Fine, then, talk." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "Why aren't you up at the keep?", next = "keep" },
        { text = "Tell me about the Brotherhood.", next = "brotherhood" },
        { text = "Who's Tessa?", next = "tessa", when = { metBefore = true } },
        { text = "Fern Crimsonleaf. Did you know her?", next = "fern", when = { topicKnown = "fern_crimsonleaf" } },
        { text = "I spoke to Demar about Fern.", next = "fern_word",
          when = { thread = { id = "farholde_lost", beat = "b4_demar", state = { "stirring", "unfolding" } } } },
        { text = "Buy you a drink?", next = "drink" },
        { text = "Leave you to it.", next = "END" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Because up at the keep everyone stands up straight and talks about the dead. Down here they slouch and talk about fish. A man needs a break from standing up straight." } },
      choices = {
        { text = "Demar would call that desertion.", next = "keep_demar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_demar = {
      lines = { { id = "kd_default", text = "Demar would call breathing desertion if you did it facing Stormwind. I'll go back; I always go back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brotherhood = {
      lines = {
        { id = "b_default", text = "Best riders east of the mountains, and nobody west of them remembers we exist. We ride, we bleed, we carve names into stone, and then we do it again.",
          fx = { learn = { "brotherhood_horse" } } },
      },
      choices = {
        { text = "Why stay with it?", next = "brotherhood_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_why = {
      lines = { { id = "bw_default", text = "Because I've stood in front of those names. You don't walk away from them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tessa = {
      lines = { { id = "t_default", text = "Tessa's my wife, and that's all you're getting. She'd tell you more; she always does." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fern = {
      big = true,
      lines = {
        { id = "f_alive", key = true,
          text = "Knew her? Everyone did, and nobody did. Here's what the stone doesn't say: nobody found her, only her knife, and Fern didn't drop knives.",
          fx = { hear = "fern_lives" } },
      },
      choices = {
        { text = "You think she's alive.", next = "fern_alive" },
        { text = "Demar says she's dead.", next = "fern_demar", when = { heardLine = "demar.fl_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fern_alive = {
      lines = { { id = "fa_default", text = "I think she's somewhere. Ravenholdt taught her to vanish, and maybe she just never stopped." } },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's a long time to stay vanished.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    fern_word = {
      big = true,
      lines = { { id = "fw_default", text = "Did you, now? Go on, and don't soften it; I've had years of soft." } },
      choices = {
        { text = "He found her dagger and nothing else. That's not a grave.", next = "fern_hope",
          fx = { thread = { id = "farholde_lost", state = "resolved" }, affinity = 3, align = { light = 1 } },
          journal = { first = "Told Gray that a dagger isn't a grave. He looked at me a long time, then got up and walked towards the keep.",
                      third = "{name} told Gray Dawnbright that Fern Crimsonleaf's dagger was no grave. He went up to the keep." } },
        { text = "Let her rest, Gray. He's right.", next = "fern_rest",
          fx = { thread = { id = "farholde_lost", state = "soured" }, affinity = -2, align = { light = -1 }, trait = { stern = 1 } },
          journal = { first = "Told Gray to let Fern Crimsonleaf rest. He didn't argue. He didn't say anything at all.",
                      third = "{name} told Gray Dawnbright to let Fern Crimsonleaf rest. He fell silent." } },
      },
    },
    fern_hope = {
      lines = { { id = "fh_default", text = "No... it isn't, is it? Hold my chair, because I'm going up to the keep. Someone ought to tell the Commander he's allowed to hope." } },
      choices = { { text = "Go on, then.", next = "END" } },
    },
    fern_rest = {
      lines = { { id = "fr_default", text = "Right, right. Zizplink, another one over here! No, I'm fine, so go on, then; you've done your bit." } },
      choices = { { text = "...", next = "END" } },
    },
    fern_demar = {
      lines = { { id = "fd_default", text = "Demar says a lot of things are dead. Half of them are just quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drink = {
      lines = { { id = "d_default", text = "Now you're talking sense! Zizplink, whatever this one's having, and one for me, on them." } },
      choices = {
        { text = "Cheers.", next = "BACK", fx = { affinity = 2 } },
        { text = "I said a drink. Not two.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Brotherhood, married and thirsty, in that order, most days." } },
    advice = { { id = "tp_ad", text = "Don't stand too close to Demar when he's talking about Stormwind. He waves his hands." } },
    fern_crimsonleaf = { { id = "tp_fernnext", text = "Fern? Sit down and buy something, and then I'll tell you.", next = "fern" }, { id = "tp_fern", text = "She's alive, and don't argue with me about it." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Family, the kind you'd leave for an afternoon and never for good." } },
    _none = { { id = "tp_none", text = "Ask somebody sober, and that's not me, not tonight." } },
  },
}

P:NPC {
  key = "jazzle", id = TODO_NPC("Jazzle Cheapshot"), name = "Jazzle Cheapshot",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "brash" }, values = { "greedy", "ambitious" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_default", text = "No fights today, pal, but soon, very soon!" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Look at the shoulders on you! I can see the poster already." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear! A talking bear? Could you do that on command, twice a night, maybe with a little hat?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jazzle Cheapshot, and this is my arena. It's empty, yeah, for now, while the Horde and the Alliance are out in the fields killing each other for free. For free!" },
      },
      again = { { id = "h_again", text = "What else? Make it quick, I've posters to paint." } },
      choices = {
        { text = "When does it open?", next = "open" },
        { text = "Who would even fight here?", next = "fighters" },
        { text = "Put me on the card.", next = "card", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Isn't selling tickets to a fight a bit grim?", next = "grim" },
        { text = "Good luck with it.", next = "END" },
      },
    },
    open = {
      lines = { { id = "o_default", text = "When I've got fighters, a crowd, and Melbin off my back about the rent, so soon. Goblin soon!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fighters = {
      lines = { { id = "f_default", text = "Ogres, if Bolder'ok'll sign, and Brotherhood knights, if they'd stop being so noble. Pirates, if I can get 'em to fight one at a time, and you, if you've got a gimmick." } },
      choices = {
        { text = "A gimmick?", next = "gimmick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gimmick = {
      lines = { { id = "gm_default", text = "Everybody needs one! 'The Bear Who Was a Person', say, or 'The Gnome With the Big Hammer'. Think on it, and come back with a name." } },
      choices = {
        { text = "'The One Who Gets On With It.'", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'll pass.", next = "BACK" },
      },
    },
    card = {
      lines = { { id = "c_default", text = "Opening night, top of the bill. There's no opening night yet, but you're on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    grim = {
      lines = { { id = "gr_default", text = "Grim? It's the same fighting with a roof and a snack cart, so I'm civilizing it." } },
      choices = {
        { text = "Selling seats to a bloodbath isn't civilizing it, Jazzle.", next = "BACK", fx = { align = { honor = 1 }, trait = { skeptical = 1 } } },
        { text = "Fair point, actually.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a promoter, born one. Some goblins come out with a silver tongue; mine came with a ticket booth." } },
    advice = { { id = "tp_ad", text = "Every fight's a show. Win it pretty and somebody'll pay to watch the next one." } },
    _none = { { id = "tp_none", text = "Can it fight? If it can't, I don't book it." } },
  },
}

P:NPC {
  key = "fimbo", id = TODO_NPC("Fimbo Greasemitz"), name = "Fimbo Greasemitz",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "dramatic" }, values = { "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_default", text = "Table for one? Every table's for one, since nobody eats here in pairs." },
    { id = "g_menu", text = "It's boar or fish, same as yesterday, and same as forever." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Finally, somebody who'll understand my suffering." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fimbo Greasemitz, and welcome to my cafe on the water! Today we have roast boar and roast fish, and tomorrow, roast boar and roast fish. I'm dying inside." },
        { id = "h_stew", tags = { "news" }, when = { questActive = TODO_QUEST("A Taste of the Sea") },
          text = "Murloc eyes and crab meat, off the beaches. Fast in the pan with the eyes; that's the secret, because it keeps the sea in them." },
        { id = "h_stew_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("A Taste of the Sea"), days = 3 } },
          text = "Seafood stew, on the menu! Three customers tried it and two came back, which is the best this cafe has ever done." },
      },
      again = { { id = "h_again", text = "What else? The pot's on, so I can talk." } },
      choices = {
        { text = "Why not cook something else?", next = "menu" },
        { text = "Murloc eyes? Really?", next = "eyes" },
        { text = "Who eats here?", next = "customers" },
        { text = "Trade recipes?", next = "recipes", when = { profession = "Cooking" } },
        { text = "Goodbye, Fimbo.", next = "END" },
      },
    },
    menu = {
      lines = { { id = "m_default", text = "Because boars walk up to the door and fish jump in the pot! Everything else costs money and imagination. I've got the imagination." } },
      choices = {
        { text = "What would you cook, if you could?", next = "menu_dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menu_dream = {
      lines = { { id = "md_default", text = "A stew so good the Brotherhood and the Horde sit at the same table to eat it. They'd fight over seconds, sure, but at the same table!" } },
      choices = {
        { text = "I'd eat that.", next = "BACK", fx = { affinity = 2, opinion = { peace = "for" } } },
        { text = "They'd fight over the table first.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "Really! Crunchy outside, salty inside, like the sea gave you a little kiss... a wet, crunchy kiss." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "Sailors, goblins, Gray when Zizplink cuts him off, and Argo, who eats anything if you call it a toast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recipes = {
      lines = { { id = "r_default", text = "Yes! Give me something with a sauce, anything with a sauce, and I'll give you the boar. You'll never need another boar recipe as long as you live." } },
      choices = { { text = "Deal.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A cook, always a cook. This cafe's the first kitchen that's mine, and it's on the water, which counts as floating." } },
    advice = { { id = "tp_ad", text = "Murloc eyes go in last. Everything goes in before the murloc eyes." } },
    _none = { { id = "tp_none", text = "Is it a recipe? If it isn't, it's wasted on me." } },
  },
}

P:NPC {
  key = "argo", id = TODO_NPC("Argo Brinewhistle"), name = "Argo Brinewhistle",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "jovial" }, values = { "brave", "generous" },
  notices = { "drink", "craft" },

  greetings = {
    { id = "g_default", text = "Ahoy! *hic* Pull up a crate." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're keeping up, and nobody keeps up! Have another, have mine." },
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Good, then you know there's things in this water bigger than your pole." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Argo Brinewhistle, captain of the finest boat in the port. *hic* Well, the finest boat with a monster problem." },
        { id = "h_monster", tags = { "news" }, when = { questActive = TODO_QUEST("The Monster Surfaces") },
          text = "The bait goes in by the fresh wreckage off the murloc islands, not here, out there! Then it comes up, and you take its head for my stern!" },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Monster Surfaces"), days = 3 } },
          text = "Look at 'er, up on my stern! Ugliest, finest figurehead on the whole coast, and drinks are on me, again." },
      },
      again = { { id = "h_again", text = "What else can I do for you, matey? *hic*" } },
      choices = {
        { text = "What kind of monster?", next = "monster" },
        { text = "Are you ever sober?", next = "sober" },
        { text = "Tell me about your boat.", next = "boat" },
        { text = "I fish these waters too.", next = "fish", when = { profession = "Fishing" } },
        { text = "Cheers, Argo.", next = "END" },
      },
    },
    monster = {
      lines = { { id = "m_default", text = "Big, with teeth, and more teeth than that. It sank three boats I know of, and one I made up to scare Gritta." } },
      choices = {
        { text = "Which one did you make up?", next = "monster_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monster_lie = {
      lines = { { id = "ml_default", text = "Ha! Wouldn't you like to know? *hic* The third, or maybe the second." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    sober = {
      lines = { { id = "s_default", text = "Once, and I didn't care for it; everything was so... clear." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    boat = {
      lines = { { id = "b_default", text = "Little, leaky and loyal, like me! She's never sunk, though she's thought about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = { { id = "f_default", text = "Then stay off the murloc islands at dusk, friend, because that's when it feeds, and not on fish, on fishermen." } },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born on a boat, *hic* and I'll die on a boat, and in between, I'm on a boat." } },
    advice = { { id = "tp_ad", text = "Never trust a calm sea or a sober sailor." } },
    _none = { { id = "tp_none", text = "Don't know! *hic* Ask me after the next one." } },
  },
}

P:NPC {
  key = "gritta", id = TODO_NPC("Gritta Chumwater"), name = "Gritta Chumwater", title = "Fisherman",
  bible = "bibles/riverglades.md", role = "vendor", tier = "service",
  communities = { "powderfuse_port" }, temper = { "blunt" }, values = { "practical" },
  notices = { "craft" },

  greetings = {
    { id = "g_default", text = "Chum's fresh, or as fresh as chum gets." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a fisher's squint, good. The catfish up the rivers bite like dogs, so you'll want a better pole." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gritta Chumwater. I sell chum, lures, fish and advice, and only the advice is free." },
      },
      again = { { id = "h_again", text = "What else? Buy something while you think." } },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where's the best fishing?", next = "fishing" },
        { text = "Who buys chum?", next = "chum" },
        { text = "Goodbye.", next = "END" },
      },
    },
    fishing = {
      lines = { { id = "f_default", text = "Where the rivers come down to the sea. The catfish up there have whiskers like Melbin's, but don't tell him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chum = {
      lines = { { id = "c_default", text = "Fimbo buys it for soup and Argo for his monster. I don't ask which pot it ends up in, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've fished every coast a boat can reach, and came here because the fish are stupider. Don't tell them." } },
    advice = { { id = "tp_ad", text = "Fish at dawn, sell by noon, and never eat what you can't name." } },
    _none = { { id = "tp_none", text = "Fish don't talk about that, so neither do I." } },
  },
}
