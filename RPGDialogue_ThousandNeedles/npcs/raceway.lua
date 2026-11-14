-- The Mirage Raceway on the Shimmering Flats: a gnome and a goblin settling an argument with rockets. Voice: bibles/thousandneedles.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pozzik", id = TODO_NPC("Pozzik"), name = "Pozzik",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "eager" }, values = { "ambitious", "proud" },
  notices = { "craft", "status" },

  greetings = {
    { id = "g_race", text = "Hey hey! Here for the race? There's always a race. Every day, rain or shine. Mostly shine. It's a salt flat." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite spectator returns! You bet on us last time? Smart. Bet again." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Ever thought about rockets? Ever thought about bigger rockets? We should talk." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? Bet you're cheering for the gnomes. That's fine. Cheer loud; it makes winning sweeter." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pozzik. I built this raceway with that gnome, Fizzle, to settle whose engineers are better. The answer's goblins. We just have to prove it every day." },
        { id = "h_load", when = { questActive = TODO_QUEST("Load Lightening") },
          text = "The car needs one thing to beat those gnomes, and you're going to fetch it. Fast. Speed's sort of the theme here." },
        { id = "h_pilot", when = { questActive = TODO_QUEST("The Eighteenth Pilot") },
          text = "Seventeen pilots, and every one of them found a reason to quit. I need an eighteenth. Fearless, ideally. Slow-witted works too." },
        { id = "h_rizzle", when = { questActive = TODO_QUEST("Rizzle's Schematics") },
          text = "Rizzle's got schematics I'd love a look at. For safety reasons. Our safety, from losing." },
        { id = "h_ore", when = { questActive = TODO_QUEST("Indurium Ore") },
          text = "Indurium. Hard to come by, which is exactly why the gnomes don't have any. Let's keep it that way." },
      },
      choices = {
        { text = "Who usually wins?", next = "wins" },
        { text = "Why race at all?", next = "why" },
        { text = "Good luck out there.", next = "END" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "Depends who you ask. Ask me: goblins. Ask Fizzle: he'll lie to you with a straight face and a crooked wrench." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1, learn = { "mirage_raceway" } } } },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "Because some arguments you can't win talking. You need a mile of salt, two rockets and a crowd. Plus wagers. Mostly wagers." } },
      choices = { { text = "Makes a strange kind of sense.", next = "END", fx = { affinity = 2, learn = { "mirage_raceway" } } } },
    },
  },

  topics = {
    mirage_raceway = { { id = "tp_raceway", text = "Best thing ever built on a salt flat. Also the only thing. That counts." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel likes anything that sells tickets. We sell tickets." } },
    _none = { { id = "tp_none", text = "Does it go fast? No? Then I don't follow it." } },
  },
}

P:NPC {
  key = "fizzle", id = TODO_NPC("Fizzle Brassbolts"), name = "Fizzle Brassbolts",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "excitable" }, values = { "proud", "curious" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_track", text = "Mind the track! And the fuel lines! And the nitro! Actually, just stand very still." },
    { id = "g_back", when = { metBefore = true }, text = "You! Excellent! I've recalibrated everything since you were here. Twice." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "A fellow engineer! Gnomish school, I hope? No? Well. There's time to improve." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Splendid! Gnomeregan may be lost, but gnomish engineering still wins races. Well, most of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fizzle Brassbolts, engineer and proud member of MEGA. Pozzik and I built this raceway to see whose engineering is superior. It's gnomish. Obviously." },
        { id = "h_venom", when = { questActive = TODO_QUEST("Salt Flat Venom") },
          text = "That venom is going into the fuel mix. Don't ask me why; you wouldn't follow the math. I barely do." },
        { id = "h_martek", when = { questActive = TODO_QUEST("Martek the Exiled") },
          text = "Martek. Out in the Badlands, all alone. He knows things about engines I'd trade my goggles to learn. Go and see him." },
        { id = "h_news", tags = { "news" }, when = { questActive = TODO_QUEST("News for Fizzle") },
          text = "News? For me? From whom? Never mind, give it here!" },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery to the Gnomes") },
          text = "A delivery! Let me check it for rattles. Rattles are bad. Ticking is worse." },
      },
      choices = {
        { text = "What's MEGA?", next = "mega" },
        { text = "Why race the goblins?", next = "why" },
        { text = "I'll stand very still. Goodbye.", next = "END" },
      },
    },
    mega = {
      lines = { { id = "m_default", text = "The Mechanical Engineers' Guild of Azeroth! We meet, we argue, we blow things up on purpose. It's very civilized." } },
      choices = { { text = "Sounds loud.", next = "END", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "y_default", text = "Because they're there. And because they're wrong. Mostly the second." } },
      choices = { { text = "Fair enough.", next = "END", fx = { affinity = 1, learn = { "mirage_raceway" } } } },
    },
  },

  topics = {
    mirage_raceway = { { id = "tp_raceway", text = "My finest achievement. Shared, regrettably, with a goblin." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I'd rather not. Let's talk about rockets instead. Rockets go up. Things should go up." } },
    _none = { { id = "tp_none", text = "Not my department! Unless it has an engine." } },
  },
}

P:NPC {
  key = "kravel", id = TODO_NPC("Kravel Koalbeard"), name = "Kravel Koalbeard",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "sly" }, values = { "cunning", "ambitious" },
  notices = { "purse", "drink" },

  greetings = {
    { id = "g_flap", text = "Close the flap behind ye. Walls have ears, an' at a racetrack the ears are usually bettin'." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my discreet friend. Ye've kept quiet, I trust?" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That's a fine heavy purse. Ever had a sure thing on a race? I might know of one." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Had a few? Grand. Now, who bought 'em for ye? Not me, I hope. That'd be a waste." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kravel Koalbeard. I fetch parts for the crews, pass along a word here an' there, an' now an' then the right car wins. Funny how that works." },
        { id = "h_parts", when = { any = { { questActive = TODO_QUEST("Rocket Car Parts") }, { questActive = TODO_QUEST("Parts for Kravel") } } },
          text = "There's bits of rocket all over the flats from cars that didnae finish. Bring 'em to me. Both teams'll pay for 'em. Separately." },
        { id = "h_rumors", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Rumormonger") }, { questActive = TODO_QUEST("Rumors for Kravel") } } },
          text = "Krazek sent ye, did he? That goblin sells rumors by the pound. I buy 'em by the ounce an' sell 'em by the word." },
        { id = "h_goblins", when = { questActive = TODO_QUEST("Get the Goblins Drunk") },
          text = "Here's the plan. The goblin crew gets a round or three on me. Very generous of me. Tomorrow, they're a wee bit slow." },
        { id = "h_gnomes", when = { questActive = TODO_QUEST("Get the Gnomes Drunk") },
          text = "Now the gnomes. Fair's fair. If everybody's slow, nobody's slow, an' I collect on my wager." },
      },
      choices = {
        { text = "[Intimidate] You're rigging races. I could tell the crews.", tag = "Intimidate", next = "hush",
          check = { pass = { any = { { trait = "stern" }, { minLevel = 40 } } } },
          fail = { next = "laugh" } },
        { text = "What's the sure thing?", next = "sure" },
        { text = "I didn't hear any of this.", next = "END", fx = { affinity = 1 } },
      },
    },
    hush = {
      lines = { { id = "hu_default", text = "Now, now. Nobody's rigged a thing. Here, for yer trouble, an' yer short memory. We understand each other." } },
      choices = { { text = "We do.", next = "END", fx = { affinity = -1, align = { order = -1 } } } },
    },
    laugh = {
      lines = { { id = "la_default", text = "Tell 'em! Pozzik'll think I'm helpin' Fizzle, Fizzle'll think I'm helpin' Pozzik, an' both'll pay me to stop." } },
      choices = { { text = "...", next = "END" } },
    },
    sure = {
      lines = { { id = "s_default", text = "There's no such thing as a sure thing. That's why I make 'em." } },
      choices = { { text = "Of course you do.", next = "END", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    mirage_raceway = { { id = "tp_raceway", text = "Two crews, one track, an' a crowd that'll bet on anything. Paradise." } },
    _none = { { id = "tp_none", text = "That one's not for sale. I don't have it, is the trouble." } },
  },
}
