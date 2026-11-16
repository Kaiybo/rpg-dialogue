-- The Mirage Raceway on the Shimmering Flats: a gnome and a goblin settling an argument with rockets. Voice: bibles/thousandneedles.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pozzik", id = TODO_NPC("Pozzik"), name = "Pozzik",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "eager" }, values = { "ambitious", "proud" },
  notices = { "craft", "status" },

  impression = {
    first = "Pozzik built a raceway to prove goblins are better engineers than gnomes, and he means to keep proving it every single day. He talks like a man always ten minutes from the next heat.",
    third = "{name} met Pozzik, the goblin half of the rivalry that runs the Mirage Raceway.",
  },

  greetings = {
    { id = "g_race", text = "Hey hey! Here for the race? There's always a race, every day, rain or shine, and mostly shine, since it's a salt flat." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite spectator returns! You bet on us last time? Smart, so bet again." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Ever thought about rockets, or about bigger rockets? We should talk." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? Bet you're cheering for the gnomes, and that's fine; cheer loud, it makes winning sweeter." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Disturb them? There's nothing out here but salt, scorpids and vultures, and the vultures love us, because every crash is lunch. The flats were dead long before I built a track on them." } },
      choices = {
        { text = "Even salt flats have life. Race with care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dead ground is fair ground. Race all you like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pozzik. I built this raceway with that gnome, Fizzle, to settle whose engineers are better, and the answer's goblins. We just have to prove it every day." },
        { id = "h_load", when = { questActive = TODO_QUEST("Load Lightening") },
          text = "Vulture bones: light, strong, and the flats are covered in vultures. Bring me a sack and I'll pay a fair price, fair for me." },
        { id = "h_pilot", when = { questActive = TODO_QUEST("The Eighteenth Pilot") },
          text = "Razzeric's our pilot, the eighteenth, if you're counting, and he does his own modifications. Try not to look surprised when you meet him." },
        { id = "h_rizzle", when = { questActive = TODO_QUEST("Rizzle's Schematics") },
          text = "Rizzle's plans! Let me see them, for safety reasons; our safety, from losing." },
        { id = "h_ore", when = { questActive = TODO_QUEST("Indurium Ore") },
          text = "Indurium. The gnomes found it first, which is how they've been beating us, but not for much longer." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at the raceway? Don't tell me the vultures sent you, because I only take the bones they're done with." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you talk the earth into staying flat? Every rumble on the Shimmering Flats knocks a bolt loose somewhere." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, the next heat's in ten minutes." },
        { id = "h_again2", text = "Still here? Good, because spectators who stay, bet." },
      },
      choices = {
        { text = "Does the racing disturb the salt flats?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who usually wins?", next = "wins" },
        { text = "Why race at all?", next = "why" },
        { text = "How do you make a rocket car faster?", next = "faster" },
        { text = "Who pays for all this?", next = "sponsors" },
        { text = "I'm cheering for the goblins.", next = "cheer", when = { faction = "Horde" } },
        { text = "Aren't you worried I'm a gnome spy?", next = "spy", when = { race = "Gnome" } },
        { text = "Could a tauren even fit in one of those cars?", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Do the earth spirits mind your raceway, Pozzik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Good luck out there.", next = "END" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "Depends who you ask. Ask me, and it's goblins; ask Fizzle, and he'll lie to you with a straight face and a crooked wrench." } },
      choices = {
        { text = "And lately?", next = "wins_lately" },
        { text = "Something else.", next = "BACK", fx = { learn = { "mirage_raceway" } } },
      },
    },
    wins_lately = {
      lines = { { id = "wl_default", text = "Lately the gnomes are faster, with the same designs, and nobody can say why. Rizzle Brassbolts has been scribbling something day and night. I'd love a look at it." } },
      choices = {
        { text = "I could get you a look.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Stealing their plans would be cheating, Pozzik.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe they're just better.", next = "BACK", fx = { affinity = -2, trait = { witty = 1 } } },
      },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "Because some arguments you can't win talking. You need a mile of salt, two rockets and a crowd, plus wagers, mostly wagers." } },
      choices = { { text = "Makes a strange kind of sense.", next = "BACK", fx = { affinity = 2, learn = { "mirage_raceway" } } } },
    },
    faster = {
      lines = { { id = "f_default", text = "Every bit counts: tension coils, power output, weight. We use vulture bones for the small frame work, because they're light and strong, and the sky here rains vultures." } },
      choices = {
        { text = "What about fuel?", next = "faster_fuel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faster_fuel = {
      lines = { { id = "ff_default", text = "Fuel's where races are won, and I'm fitting a new regulator, if it ever arrives. Fizzle's cooking his out of scorpid venom, I hear: brilliant and disgusting." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    sponsors = {
      lines = { { id = "sp_default", text = "You'd be surprised who chips in. Gazlowe, over in Ratchet, finds us parts from all over. He even worked on one of our rigs once." } },
      choices = {
        { text = "What's he sending now?", next = "sponsors_part" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sponsors_part = {
      lines = { { id = "spp_default", text = "A prototype fuel regulator, weeks ago, and Gazlowe's never late. I wouldn't be pushy, except the gnomes are gaining, so ask him for me, if you're passing Ratchet?" } },
      choices = {
        { text = "I'll ask him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer = {
      lines = { { id = "c_default", text = "Ha! Somebody with taste! Cheer loud; the gnomes' pit crew pretends not to hear it, but their ears go pink." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3 } } },
    },
    spy = {
      lines = { { id = "s_default", text = "A gnome spy would've stolen the plans already, not walked up and asked, unless that's the trick. Is that the trick? Stand over there, just in case." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Fit? Sure, sure, if we took out the seat, the wheel and most of the car! But you'd make a fantastic counterweight, pal, and I've got a design in my head right now with your name on it, so don't go anywhere." },
      },
      choices = {
        { text = "Build it, and I'll ride it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll stay on the ground, thanks.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they mind, they've never filed a complaint, and I keep the noise down after sundown, mostly. The flats were nothing but empty salt before we came, so I figure we gave the spirits something worth watching." } },
      choices = {
        { text = "Respect the land, Pozzik, and it'll put up with the racing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits can watch, and buy a seat like everybody else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },


  topics = {
    knows = {
      { id = "tp_knows", text = "I know everything worth knowing about these flats, and most of it's about engines! Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "I grew up with grease under my nails and a stopwatch in my hand, and now I own half a racetrack, the better half." } },
    advice = { { id = "tp_ad", text = "Never bet against a goblin on a straight line. Corners, maybe, but straight lines, never." } },
    mirage_raceway = { { id = "tp_raceway", text = "Best thing ever built on a salt flat! Also the only thing, but that counts." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel likes anything that sells tickets. We sell tickets." } },
    _none = { { id = "tp_none", text = "Does it go fast? If not, I don't follow it." } },
  },
}

P:NPC {
  key = "fizzle", id = TODO_NPC("Fizzle Brassbolts"), name = "Fizzle Brassbolts",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "excitable" }, values = { "proud", "curious" },
  notices = { "craft", "race" },

  impression = {
    first = "Fizzle Brassbolts told me to stand very still before he said hello. He is the gnomish half of a rivalry at the Mirage Raceway, and he treats a cracked piston as a personal tragedy.",
    third = "{name} met Fizzle Brassbolts, the excitable gnome who runs the Mirage Raceway alongside his goblin rival.",
  },

  greetings = {
    { id = "g_track", text = "Mind the track, and the fuel lines, and the nitro... actually, just stand very still!" },
    { id = "g_back", when = { metBefore = true }, text = "You, excellent! I've recalibrated everything since you were here, twice." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "A fellow engineer, and from the gnomish school, I hope! No? Well, there's always time to improve." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, splendid! Gnomeregan may be lost, but gnomish engineering still wins races... well, most of them." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Salty venom burns hot and clean, very efficient! I need dozens of tails a week, though, and I'll admit the scorpids are starting to look at me funny." } },
      choices = {
        { text = "Take fewer tails. The flats need their scorpids.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "There are plenty of scorpids. Keep racing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fizzle Brassbolts, engineer and proud member of MEGA! Pozzik and I built this raceway to see whose engineering is superior, and it's gnomish, obviously." },
        { id = "h_venom", when = { questActive = TODO_QUEST("Salt Flat Venom") },
          text = "That venom is going into the fuel mix, because the scorpids' venom is full of salt, and salt burns hot, very hot! Don't ask about the math." },
        { id = "h_martek", when = { questActive = TODO_QUEST("Martek the Exiled") },
          text = "Martek! Out in the Badlands, in a camp, with a goblin! He knows more about metal than anyone alive, and I need pistons that won't crack." },
        { id = "h_news", tags = { "news" }, when = { questActive = TODO_QUEST("News for Fizzle") },
          text = "News, for me, from Martek? Give it here!" },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery to the Gnomes") },
          text = "My hydro ratchets and repeater bolts! Let me check them for rattles, because rattles are bad, and ticking is worse." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Stand very still, druid, because the last time somebody turned into a bear near my pit, the whole piston rack fell over!" },
      },
      again = {
        { id = "h_again", text = "Yes? Yes? Quickly, the pistons are cooling!" },
        { id = "h_again2", text = "Another question? Splendid, I love questions, nearly as much as rockets!" },
      },
      choices = {
        { text = "Your fuel uses scorpid venom, Fizzle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's MEGA?", next = "mega" },
        { text = "Why race the goblins?", next = "why" },
        { text = "What are you building now?", next = "engine" },
        { text = "Is it true about your brothers?", next = "brothers" },
        { text = "Martek told me about indurium.", next = "indurium", when = { questDone = TODO_QUEST("News for Fizzle") } },
        { text = "I'm an engineer too.", next = "engineer", when = { profession = "Engineering" } },
        { text = "Could a haste spell help your rocket car?", next = "x_mage", when = { class = "MAGE" } },
        { text = "I'll stand very still. Goodbye.", next = "END" },
      },
    },
    mega = {
      lines = { { id = "m_default", text = "The Mechanical Engineers' Guild of Azeroth! We meet, we argue, and we blow things up on purpose; it's very civilized." } },
      choices = {
        { text = "On purpose?", next = "mega_purpose" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    mega_purpose = {
      lines = { { id = "mp_default", text = "Mostly! An explosion you planned is an experiment, and one you didn't is a lesson. Both are very educational for the eyebrows." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    why = {
      lines = { { id = "y_default", text = "Because they're there, and because they're wrong. Mostly the second." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1, learn = { "mirage_raceway" } } } },
    },
    engine = {
      big = true,
      lines = { { id = "e_default", text = "An engine so fast the car will fly, I know it! But every piston I make cracks under the stress, so I need metal that doesn't care how hot it gets." } },
      choices = {
        { text = "Cars aren't meant to fly.", next = "engine_fly", fx = { trait = { skeptical = 1 } } },
        { text = "Who could make that metal?", next = "engine_who" },
      },
    },
    engine_fly = {
      lines = { { id = "ef_default", text = "Neither were gnomes, and here we are, flying all over the place. Mostly downward, I grant you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    engine_who = {
      lines = { { id = "ew_default", text = "Martek the Exiled! He's a smith, the best, far away in the Badlands, and nobody knows more about metal. Somebody should take him a letter... hint, hint." } },
      choices = {
        { text = "I'll take it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers = {
      lines = { { id = "b_default", text = "The Brassbolts brothers, yes! Wizzle handles the shells and fins, Rizzle handles the plans, and I handle the genius. It's a very efficient arrangement." } },
      choices = {
        { text = "Pozzik wants Rizzle's plans.", next = "brothers_plans", fx = { align = { honor = 1 } } },
        { text = "I'll keep what I know about Pozzik to myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_plans = {
      lines = { { id = "bp_default", text = "Of course he does, everyone does! That's why Rizzle sleeps on them, well, near them, well, he means to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    indurium = {
      lines = { { id = "i_default", text = "Indurium! It laughs at heat, and Martek's a genius, but flakes won't do; I need true ore, and that's deep in Uldaman. Have you been to Uldaman? You'll love it, probably." } },
      choices = {
        { text = "I'll bring you ore.", next = "BACK", fx = { affinity = 2, learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    engineer = {
      lines = { { id = "en_default", text = "Wonderful! Then you understand that 'it works' and 'it works twice' are entirely different claims. Keep your goggles on, always, even asleep." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "A spell, on my engine? Absolutely not, the tolerances are tuned to a hair, and one sparkle of arcane would throw off every gauge on the dash! Although, between us, if you could make the goblin car go slower, I'd call that science." },
        { id = "xm_orc", when = { race = "Orc", class = "MAGE" }, text = "An orc who studies magic instead of hitting things with it? That's a marvelous inversion, and I'd love to see your notes, though please don't cast anything near the fuel." },
      },
      choices = {
        { text = "Slowing the goblins would be cheating, Fizzle.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Name a price, and their car will crawl.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },


  topics = {
    background = { { id = "tp_ba", text = "Gnome, engineer, and the brains of the Brassbolts brothers. My brothers would say otherwise, but they'd be wrong.", next = "brothers" } },
    advice = { { id = "tp_ad", text = "Goggles, always! I can't say it enough, and some of my colleagues can't see it at all, any more." } },
    mirage_raceway = { { id = "tp_raceway", text = "My finest achievement, shared, regrettably, with a goblin." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I'd rather not. Let's talk about rockets instead, because rockets go up, and things should go up." } },
    _none = { { id = "tp_none", text = "Not my department, unless it has an engine!" } },
  },
}

P:NPC {
  key = "kravel", id = TODO_NPC("Kravel Koalbeard"), name = "Kravel Koalbeard",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "sly" }, values = { "cunning", "ambitious" },
  notices = { "purse", "drink" },

  impression = {
    first = "Kravel Koalbeard speaks in a low voice and treats every conversation like a bet he's already won. Neither racing crew should trust him, and I'd wager both of them do.",
    third = "{name} met Kravel Koalbeard, a sly dwarf who fetches parts and whispers tips at the Mirage Raceway.",
  },

  greetings = {
    { id = "g_flap", text = "Close the flap behind ye. Walls have ears, an' at a racetrack the ears are usually bettin'." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my discreet friend. Ye've kept quiet, I trust?" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That's a fine heavy purse. Ever had a sure thing on a race? I might know of one." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Had a few, have ye? Grand, but who bought 'em for ye? Not me, I hope, for that'd be a waste." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kravel Koalbeard. I fetch parts for the crews, pass along a word here an' there, an' now an' then the right car wins. Funny how that works." },
        { id = "h_parts", when = { any = { { questActive = TODO_QUEST("Rocket Car Parts") }, { questActive = TODO_QUEST("Parts for Kravel") } } },
          text = "There's bits of rocket all over the flats from cars that didnae finish. Bring 'em to me, an' both teams'll pay for 'em, separately." },
        { id = "h_rumors", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Rumormonger") }, { questActive = TODO_QUEST("Rumors for Kravel") } } },
          text = "Krazek, in Booty Bay. That goblin sells rumors by the pound, an' I buy 'em by the ounce an' sell 'em by the word." },
        { id = "h_goblins", when = { questActive = TODO_QUEST("Get the Goblins Drunk") },
          text = "Here's the plan: the goblin pit boss gets a stout, on me, which is very generous of me. Tomorrow, his crew's a wee bit slow." },
        { id = "h_gnomes", when = { questActive = TODO_QUEST("Get the Gnomes Drunk") },
          text = "Now the gnomes, for fair's fair. If everybody's slow, nobody's slow, an' I collect on my wager." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? A fella who talks to rocks probably hears things, an' I like a fella who hears things." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quietly, now." },
        { id = "h_again2", text = "Aye? Lean in, the tent's thin." },
      },
      choices = {
        { text = "You're rigging races. I could tell the crews.", tag = "Intimidate", next = "hush",
          check = { pass = { any = { { trait = "stern" }, { minLevel = 40 } } } },
          fail = { next = "laugh" } },
        { text = "What's the sure thing?", next = "sure" },
        { text = "What exactly do you sell?", next = "trade" },
        { text = "What was in that stout?", next = "stout", when = { any = { { questActive = TODO_QUEST("Get the Goblins Drunk") }, { questActive = TODO_QUEST("Get the Gnomes Drunk") }, { questDone = TODO_QUEST("Get the Goblins Drunk") } } } },
        { text = "The Light frowns on rigged races.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "A dwarf, out here among goblins?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "One schemer to another: what's the angle?", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "What would you pay to hear what the elements know, Kravel?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I didn't hear any of this.", next = "END", fx = { affinity = 1 } },
      },
    },
    hush = {
      lines = { { id = "hu_default", text = "Now, now, nobody's rigged a thing. Here, for yer trouble an' yer short memory; we understand each other." } },
      choices = {
        { text = "We do.", next = "END", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Keep your coin, Kravel. I saw what I saw.", next = "END", fx = { align = { order = 1 } } },
      },
    },
    laugh = {
      lines = { { id = "la_default", text = "Tell 'em! Pozzik'll think I'm helpin' Fizzle, Fizzle'll think I'm helpin' Pozzik, an' both'll pay me to stop." } },
      choices = { { text = "...", next = "BACK" } },
    },
    sure = {
      lines = { { id = "s_default", text = "There's no such thing as a sure thing. That's why I make 'em." } },
      choices = {
        { text = "How?", next = "sure_how" },
        { text = "Of course you do.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
    sure_how = {
      lines = { { id = "sh_default", text = "Little things, like a delivery that arrives one wee piece short. Who'd miss one small worthless piece? Only a car doin' its top speed, that's who." } },
      choices = {
        { text = "That's Fizzle's order you're talking about.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Clever.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "Parts, mostly, since there's rocket scattered all over these flats, an' errands, an' words. A word from Booty Bay is worth more here than a gear, if it's the right word." } },
      choices = {
        { text = "Who do you buy words from?", next = "trade_words" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_words = {
      lines = { { id = "tw_default", text = "Krazek, in Booty Bay, an' a few others who'd rather I didnae say. Every rumor has a buyer, an' the trick's sellin' it twice." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    stout = {
      lines = { { id = "st_default", text = "A Fool's Stout, an' a wee bit of somethin' extra from a friend in Booty Bay. Nothin' harmful, mostly; they'll wake up a touch slow an' very thirsty." } },
      choices = {
        { text = "That's poisoning, Kravel.", next = "BACK", fx = { align = { honor = 1 }, affinity = -2 } },
        { text = "Slow and thirsty sounds like fair racing to me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = { { id = "li_default", text = "Does it? Well, the Light's no' placin' bets, so it's no' my concern. Pray for the losers if ye like; they'll need it more than me." } },
      choices = {
        { text = "I'll pray for you too.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Fair enough. The losers can pray for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Ironforge has its forges an' its rules. Out here there's no rules, just goblins an' gnomes with more gold than sense. A dwarf could get used to it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Keep your voice down, friend, and your hands where I can see them, because I know exactly what you are. Nobody's rigged a thing out here, and if somebody had, the last soul they'd tell is a professional." },
      },
      choices = {
        { text = "Cut me in, or I talk to the crews.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'm not working today, Kravel. Relax.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Depends what they know, don't it? If the wind tells you which car's runnin' rough before the heat, that's worth a coin or two, an' nobody needs to know where the tip came from." } },
      choices = {
        { text = "The spirits aren't for sale, Kravel, and certainly not to you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make me an offer, and we'll see what the wind says.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },


  topics = {
    background = { { id = "tp_ba", text = "A dwarf who found the flats more profitable than the mountain. That's all the story ye need." } },
    advice = { { id = "tp_ad", text = "Never drink anythin' at a racetrack ye didnae pour yerself. Trust me on that one." } },
    mirage_raceway = { { id = "tp_raceway", text = "Two crews, one track, an' a crowd that'll bet on anything. Paradise." } },
    _none = { { id = "tp_none", text = "That one's not for sale, an' the trouble is, I don't have it." } },
  },
}
