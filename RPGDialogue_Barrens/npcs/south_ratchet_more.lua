-- More of Ratchet: Brewmaster Drohn, who learned Chen Stormstout's recipe second-hand; Crane
-- Operator Bigglefuzz, one dropped crate from losing his job; and Wrenix the Wretched, who
-- sends young thieves aboard pirate ships. Voices: bibles/south_ratchet_more.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Brewmaster Drohn: an orc brewer in a goblin port.
---------------------------------------------------------------------------
P:NPC {
  key = "drohn", id = TODO_NPC("Brewmaster Drohn"), name = "Brewmaster Drohn",
  bible = "bibles/south_ratchet_more.md", role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "cheerful", "warm" }, values = { "loyal", "honest" },
  notices = { "drink", "race" },
  impression = {
    first = "Brewmaster Drohn sits outside his house in Ratchet with a mug in his fist and a barrel at his back, an orc brewer who learned his craft from a master who learned it from a pandaren. He grows misty about old brews the way other people do about old friends.",
    third = "{name} met Brewmaster Drohn, an orc brewer in Ratchet who keeps Chen Stormstout's recipe.",
  },

  greetings = {
    { id = "g_hi", text = "Pull up a crate, friend, they're all as good as chairs in Ratchet. Thirsty?" },
    { id = "g_keg", when = { questActive = TODO_QUEST("Chen's Empty Keg") }, text = "Well, I'll be, is that a keg with a placard on the end? Bring it here, bring it here." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { race = "Tauren" },
      text = "A tauren! Your people brew a fine cactus ale in Mulgore, and I've been trying to get the recipe out of Innkeeper Byula for years." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in Ratchet, and you're looking at my barrel like it owes you money. I know that look, and I respect it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brewmaster Drohn, and I brew the best ale between Orgrimmar and Booty Bay, which the goblins say isn't much of a boast. My mentor was taught by Chen Stormstout himself, the pandaren, and he passed it all down to me." },
        { id = "h_keg", when = { questDone = TODO_QUEST("Chen's Empty Keg") },
          text = "This was one of Chen Stormstout's own kegs, and I haven't seen or heard about him in a kodo's age. Would you like a taste of his namesake? The stormstout's a mighty brew, and the kick is worth the trouble." },
        { id = "h_brewed", when = { questDone = TODO_QUEST("Chen's Empty Keg (2)") },
          text = "I never thought I'd make another batch of that stuff, and you've stirred up a great deal of nostalgia in me. The memories warm my stomach nearly as much as the brew does." },
      },
      again = {
        { id = "h_again", text = "Another question? Have another sip while you think of it." },
        { id = "h_again2", text = "Go on, friend, I've nowhere to be but here." },
      },
      choices = {
        { text = "Who is Chen Stormstout?", next = "chen" },
        { text = "What goes into a stormstout?", next = "stormstout" },
        { text = "Why brew in a goblin town?", next = "ratchet" },
        { text = "What was trogg brew like?", next = "trogg", when = { questDone = TODO_QUEST("Chen's Empty Keg") } },
        { text = "I'll leave you to your barrel.", next = "END" },
      },
    },
    chen = {
      lines = { { id = "ch_default", text = "A pandaren, big and round and furry, who wandered the world looking for ingredients and traveled with Rexxar for a while, when Thrall first came to Kalimdor. Some folk say pandaren are a fairy story, but I've seen the keg, and that's proof enough for me." } },
      choices = {
        { text = "Did you ever meet him?", next = "chen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chen2 = {
      lines = { { id = "c2_default", text = "Once, when I was still my mentor's apprentice in Durotar and fetching his water, and he patted me on the head and told me never to brew angry. I've broken most rules in my life, but I've never broken that one." } },
      choices = { { text = "Something else, Drohn.", next = "BACK" } },
    },
    stormstout = {
      lines = { { id = "st_default", text = "Five savannah lion tusks, five plainstrider kidneys, and one thunder lizard horn, and don't ask me what the kidneys do, because my mentor never told me either. Chen said a good brew should taste like the land it came from, and this one tastes like the Barrens, kick and all." } },
      choices = {
        { text = "Is that much drink good for a warrior?", next = "drink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      big = true,
      lines = { { id = "dr_default", text = "Good for the spirit, if not the aim, and a grunt with a full belly and a warm head fights for something worth coming home to. Mind, I've seen good warriors drown in it, too, so not every mug is medicine, whatever I'd like to tell you." } },
      choices = {
        { text = "A warrior needs his ale. It's earned.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A clear head keeps you alive. I'll pass.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ratchet = {
      lines = { { id = "ra_default", text = "Because the goblins drink more than anyone and pay on time, mostly, and the sea air is good for the barrels. Gazlowe takes a cut of every keg, of course, but he takes a cut of the air too, so I don't mind it much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trogg = {
      lines = { { id = "tr_default", text = "Terrible, friend, the worst thing I ever brewed, and Chen taught my mentor the recipe as a joke, I'm sure of it. The troggs loved it, though, and that's how my mentor got out of a cave in the Badlands with his head still on." } },
      choices = { { text = "Something else, Drohn.", next = "BACK", fx = { learn = { "troggs" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fetched water for a brewmaster in the camps, which is where I learned that a good ale can keep a broken people going." } },
    advice = { { id = "tp_ad", text = "Never brew angry, friend. The beer can taste it." } },
    _none = { { id = "tp_none", text = "Can't say I know, but I'll pour you something while you find someone who does." } },
  },
}

---------------------------------------------------------------------------
-- Crane Operator Bigglefuzz: dropped the morning cargo, lost the Baron's port.
---------------------------------------------------------------------------
P:NPC {
  key = "bigglefuzz", id = TODO_NPC("Crane Operator Bigglefuzz"), name = "Crane Operator Bigglefuzz",
  bible = "bibles/south_ratchet_more.md", role = "worker", tier = "quest",
  communities = { "ratchet" }, temper = { "anxious", "cheerful" }, values = { "greedy", "loyal" },
  notices = { "class", "kit" },
  impression = {
    first = "Crane Operator Bigglefuzz runs the big cargo crane on Ratchet's docks, and the pile of smashed crates beside it is his fault. He talks very fast, says \"I say\" a great deal, and is terrified that Gazlowe will find out exactly what went missing.",
    third = "{name} met Crane Operator Bigglefuzz, the goblin who runs Ratchet's dockside crane.",
  },

  greetings = {
    { id = "g_hi", text = "Whoa, whoa, mind the crates, pal, they're stacked very carefully, I say, very carefully indeed, now. What can I do ya for?" },
    { id = "g_port", when = { questActive = TODO_QUEST("Trouble at the Docks") }, text = "Did ya get it? The port? Tell me ya got the port, because Gazlowe's been askin' about his shipment twice this morning." },
  },

  notice = {
    { id = "n_engineer", cat = "class", when = { profession = "Engineering" },
      text = "An engineer! Listen, listen, the boom arm's got a wobble in the third gear, and if you could just look at it I'd put it on my account, which is to say Gazlowe's account." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look like a crate fell on you, pal, and believe me, I know the look. Was it one of mine?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Crane Operator Bigglefuzz, and I move more cargo in a day than any three crews in Ratchet, I say, any three. Had a little mishap this morning, as ya can see, but nothin' that can't be made right with a small investment of your time." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Trouble at the Docks") },
          text = "The morning shipment from Booty Bay was huge, I say, huge, never seen so many crates. I tried to speed things up, unloaded a bit more than she could handle, and down it all came, and that menace Mad Magglish ran off with a bottle of ninety-nine-year-old port." },
        { id = "h_done", when = { questDone = TODO_QUEST("Trouble at the Docks") },
          text = "Superb, superb, and just as I was about to lose my job, too! Gazlowe got his port and never even knew it went walkin', and that's what I call a sound investment, friend." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick, the next ship's due and the boom's still wobbly." },
        { id = "h_again2", text = "Talk to me, pal, time's money and I'm runnin' a deficit." },
      },
      choices = {
        { text = "Who is Mad Magglish?", next = "magglish" },
        { text = "Why does one bottle of port matter so much?", next = "port" },
        { text = "How does this crane work?", next = "crane" },
        { text = "Does Gazlowe know what happened?", next = "gazlowe" },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },
    magglish = {
      lines = { { id = "ma_default", text = "A goblin who went a bit funny in the head, and lives in the Wailing Caverns now, of all places, with the snakes and the druids that went bad. I chased him all the way there, and no way was I goin' in after him, not on a crane operator's wages." } },
      choices = {
        { text = "The Wailing Caverns? Where?", next = "caverns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caverns = {
      lines = { { id = "ca_default", text = "West of the Crossroads, down in the oasis with the big skull-shaped mouth, and you'll hear it moanin' before you see it. He'll be hidin' in some corner near the entrance, since he can't run far with a bottle that heavy." } },
      choices = { { text = "Something else, Bigglefuzz.", next = "BACK" } },
    },
    port = {
      lines = { { id = "po_default", text = "Ninety-nine years old, pal, and worth more than this crane, and it was a gift for Gazlowe from somebody in Booty Bay who wants a favour. If he finds out it's gone, I'm sweepin' the docks for the rest of my natural life, and I've got a lot of life left." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crane = {
      lines = { { id = "cr_default", text = "Steam, pulleys, a counterweight full of scrap, and three gears that only half agree with each other, and I'm the only one in Ratchet who knows which lever not to touch. The last operator touched it, and they found him in Tanaris, more or less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gazlowe = {
      big = true,
      lines = { { id = "ga_default", text = "Not yet, and if you're a friend of mine, he won't. I'm not askin' ya to lie, exactly, I'm just askin' ya to not mention it, which is a completely different line on the ledger." } },
      choices = {
        { text = "Tell him yourself. He'll respect the honesty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your secret's safe. Get the port back first.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I worked the cranes in Undermine as a kid, and these Ratchet ones are toys by comparison. Leaky, temperamental toys, I say." } },
    advice = { { id = "tp_ad", text = "Never stand under anything that's hangin' from a rope, pal. That's the whole of crane safety, right there." } },
    _none = { { id = "tp_none", text = "No idea, pal, and if I did I'd charge ya for it." } },
  },
}

---------------------------------------------------------------------------
-- Wrenix the Wretched: sends thieves aboard the Tide Razor, and most don't come back.
---------------------------------------------------------------------------
P:NPC {
  key = "wrenix", id = TODO_NPC("Wrenix the Wretched"), name = "Wrenix the Wretched",
  bible = "bibles/south_ratchet_more.md", role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "smooth", "cheerful" }, values = { "greedy", "cunning" },
  notices = { "stealth", "class" },
  impression = {
    first = "Wrenix the Wretched stands beside his Gizmotronic Apparatus in Ratchet and hires thieves to rob pirates, which he describes as a public service with a modest commission. He is unbothered that most of his thieves don't come back.",
    third = "{name} met Wrenix the Wretched, a goblin in Ratchet who sends thieves after Southsea pirate treasure.",
  },

  greetings = {
    { id = "g_hi", text = "Step right up, step right up, but not too close to the apparatus, pal, it bites the unpaid." },
    { id = "g_zando", when = { questActive = TODO_QUEST("Wrenix of Ratchet") }, text = "Another one? The last five that crazy troll sent me ended up as shark food. Let's hope you fare a little better, eh?" },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice, nice, I almost didn't see ya, and I see everything that walks past my apparatus. That's the kind of skill I pay for." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You clank, pal. You'd make a lousy thief and a great distraction, and I've got openings for both." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wrenix the Wretched, entrepreneur, inventor, and the finest fence on this stretch of coast, and don't let the name put ya off, it's a family title. I specialize in reclaiming property from people who stole it first, which makes it barely stealing at all." },
        { id = "h_rogue", when = { class = "ROGUE", questDone = TODO_QUEST("Wrenix of Ratchet") },
          text = "South along the coast you'll find the Tide Razor, the Southsea Freebooters' ship, and in the hold is the payoff, the Southsea treasure. Grab your tools from the apparatus first, because the last five went aboard without them, and look how that went." },
        { id = "h_done", when = { questDone = TODO_QUEST("Plundering the Plunderers") },
          text = "Incredible, improbable, simply amazing! Either you've got real talent, pal, or you're the luckiest thief alive, and I'll take either one on my books." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, and you're spendin' mine." },
        { id = "h_again2", text = "Go on, ask, the first question's free and the rest go on account." },
      },
      choices = {
        { text = "What is that machine?", next = "apparatus" },
        { text = "Who sent the last five thieves?", next = "zando" },
        { text = "What's aboard the Tide Razor?", next = "ship" },
        { text = "Why do they call you Wretched?", next = "name" },
        { text = "I'll be going.", next = "END" },
      },
    },
    apparatus = {
      lines = { { id = "ap_default", text = "Wrenix's Gizmotronic Apparatus, patent pending, which dispenses thieves' tools and one E.C.A.C. to anybody I've approved, and don't ask what the letters stand for, because I've forgotten. It cost me more than my house, and I sleep next to it, so you could say it is my house." } },
      choices = {
        { text = "What does the E.C.A.C. do?", next = "ecac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ecac = {
      lines = { { id = "ec_default", text = "It keeps the pirates' guard beasts busy while you get to work, and if anything unusually hostile comes after ya on that ship, use it and run. It's only exploded on one customer, and he was standin' on it wrong." } },
      choices = { { text = "Something else, Wrenix.", next = "BACK" } },
    },
    zando = {
      lines = { { id = "za_default", text = "Zando'zan of the Shattered Hand, in Orgrimmar, a troll who sees visions and shouts about daggers and poison and the Warchief's back. He sends me his recruits to toughen 'em up, and the sharks have been eatin' very well this season." } },
      choices = {
        { text = "Five dead, and you keep sending them?", next = "sharks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sharks = {
      big = true,
      lines = { { id = "sh_default", text = "They knew the risks, pal, and they'd have been very rich if they'd come back, which is the whole point of risk. I don't push anybody aboard, I just make it worth their while to climb." } },
      choices = {
        { text = "Risk is the price of profit. That's fair.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're spending lives to fill your pockets.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship = {
      lines = { { id = "si_default", text = "The Tide Razor, anchored south along the coast, and on the second deck there's a den where the pirates train their own thieves, so it's thieves robbin' thieves robbin' thieves. Down in the hold is the treasure, and the cut of it ya get is better than fair." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "na_default", text = "My grandpa was Wrenix the Wretched, and his dad, and it's good for business, because nobody ever suspects a fella called Wretched of havin' money. Besides, Wrenix the Wonderful was already taken by a cousin in Gadgetzan." } },
      choices = { { text = "Something else, Wrenix.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came over from Undermine with a cart of spare parts and a talent for finding things other people lost on purpose." } },
    advice = { { id = "tp_ad", text = "Never rob a pirate on a full moon, pal. They can see ya, and they're all awake drinkin'." } },
    _none = { { id = "tp_none", text = "Don't know, and I don't sell what I don't know. Try Gazlowe, he sells everything." } },
  },
}
