-- More of the Sepulcher: Astor Hadren (a courier with a secret employer, and the mark of
-- the rogues' Deathstalkers chain), Sarah Goode (stable master), Andrew Hilbert (trade
-- supplies), Patrice Dwyer (poisons), Johan Focht (mining) and Nadia Vernon (bowyer).
-- Voices: bibles/sepulcher_folk.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Astor Hadren
---------------------------------------------------------------------------
P:NPC {
  key = "astor", id = TODO_NPC("Astor Hadren"), name = "Astor Hadren",
  bible = "bibles/sepulcher_folk.md", role = "citizen", tier = "quest",
  communities = { "sepulcher" }, temper = { "evasive" }, values = { "secretive", "practical" },
  notices = { "class", "stealth" },

  impression = {
    first = "Astor Hadren is a courier who walks the road between the Sepulcher and Brill and is always late for someone. He won't name his employer, and he keeps his back to the wall and his satchel close.",
    third = "{name} met Astor Hadren, a close-mouthed courier at the Sepulcher who carries letters for an employer he won't name.",
  },

  greetings = {
    { id = "g_default", text = "Make it quick, {class}. I'm expected in Brill by nightfall, and the people I carry for don't forgive a late arrival." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Either you like my company or you like my satchel, and I'd prefer the first." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can hear you breathing, or rather I can't, which is the same thing among the dead. Step out where I can see you." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of Carkad's, by the way you stand. I've nothing to say to the Rogues' Quarter, and you can tell them so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Astor Hadren, courier, and late as usual, so whatever you want, ask it while I'm buckling my satchel. My employer has no patience for couriers who stop to chat on the road." },
        { id = "h_hunted", tags = { "news" }, when = { questActive = TODO_QUEST("The Deathstalkers") },
          text = "You're looking at my satchel the way a cat looks at a birdcage, {class}. Keep your hands where I can see them, because I'm not paid enough to be robbed twice in one week." },
        { id = "h_robbed", when = { questDone = TODO_QUEST("The Deathstalkers") },
          text = "Somebody took my letter of introduction on the road and went to my appointment wearing my name, so if you've heard anything about that, I'd pay to hear it. No? Then you won't mind if I keep my back to the wall." },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly." },
        { id = "h_again2", text = "Go on, the road isn't getting any shorter." },
      },
      choices = {
        { text = "Who do you carry letters for?", next = "employer" },
        { text = "What's the road to Brill like?", next = "road" },
        { text = "How long have you been a courier?", next = "past" },
        { text = "Mennet Carkad sends his regards.", next = "carkad", when = { class = "ROGUE" } },
        { text = "Safe travels, Astor.", next = "END" },
      },
    },

    -- His employer
    employer = {
      lines = { { id = "e_default", text = "A merchant house with interests in the north, which pays well and asks only that I keep my mouth shut. I'd be a poor courier if I told the first stranger at the Sepulcher whose letters I carry." } },
      choices = {
        { text = "A merchant house in Alterac, perhaps?", next = "employer2" },
        { text = "I won't pry. Something else.", next = "BACK" },
      },
    },
    employer2 = {
      big = true,
      lines = { { id = "e2_default", text = "You've a sharp tongue for someone nobody asked, and I'll pretend I didn't hear it. Tell me something instead: do you serve the Dark Lady out of love, or because she pays on time?" } },
      choices = {
        { text = "I serve the Dark Lady, and I ask no wages.", next = "employer3", fx = { align = { order = 1 } } },
        { text = "I serve whoever pays best, same as you.", next = "employer3", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Why does it matter to you?", next = "employer3" },
      },
    },
    employer3 = {
      lines = {
        { id = "e3_default", text = "Because people who serve for love are dangerous to stand near, and people who serve for coin can be reasoned with. I like to know which sort is walking behind me on a forest road." },
      },
      choices = { { text = "Now you know. Something else.", next = "BACK" } },
    },

    -- The road
    road = {
      lines = { { id = "r_default", text = "It's pines and worgen the whole way, and Dalaran's wizards in Ambermill who think every Forsaken is a walking crime. I keep to the middle of the road, I never stop after dark, and I've lost only one letter in two years." } },
      choices = {
        { text = "How did you lose the one?", next = "road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road2 = {
      lines = { { id = "r2_default", text = "A worgen took it, along with most of my left sleeve, somewhere north of the Dead Field. I told my employer the letter was at the bottom of the lake, which was true by the time I'd finished running." } },
      choices = { { text = "Quick thinking. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    -- His past
    past = {
      lines = { { id = "p_default", text = "Since I woke, more or less, which in Silverpine means since the Dark Lady planted her banner here at the Sepulcher. A dead man doesn't tire on the road and doesn't mind the rain, and that makes him a very cheap courier." } },
      choices = {
        { text = "What did you do in life?", next = "past2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past2 = {
      lines = { { id = "p2_default", text = "I don't remember, if you want the truth, and I've stopped trying to find out. A man who remembers who he was starts wanting things, and a courier who wants things starts reading the letters." } },
      choices = { { text = "And you've never read one?", next = "past3" } },
    },
    past3 = {
      lines = { { id = "p3_default", text = "Never, and I'd advise you not to ask me again in that tone, because people have been found in the lake for less. I'm a very honest courier, {class}, which is the only reason anyone trusts me with anything." } },
      choices = { { text = "Of course. Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },

    -- Rogues only
    carkad = {
      lines = { { id = "c_default", text = "Then Carkad can send them by letter, and I'll carry it down to him myself, for the usual fee. I mind my own business, {class}, and the Rogues' Quarter would do well to mind theirs." } },
      choices = { { text = "I'll pass that along.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my business, and I make my living by keeping it that way." } },
  },
}

---------------------------------------------------------------------------
-- Sarah Goode
---------------------------------------------------------------------------
P:NPC {
  key = "sarah_goode", id = TODO_NPC("Sarah Goode"), name = "Sarah Goode", title = "Stable Master",
  bible = "bibles/sepulcher_folk.md", role = "stablemaster", tier = "service",
  communities = { "sepulcher" }, temper = { "gentle" }, values = { "patient", "kind" },
  notices = { "pet" },

  impression = {
    first = "Sarah Goode keeps the hunters' beasts at the Sepulcher. Every animal growls at her for a day or two because it can smell what she is, and she waits until it stops.",
    third = "{name} met Sarah Goode, the Sepulcher's stable master.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. The animals are just getting used to me today." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine animal, your {pet}. It's been sniffing at the crypt doors since you arrived, so keep it close until it learns what's down there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sarah Goode, stable master of the Sepulcher. I'll keep your beast fed and safe while you're about the forest, and I'll keep it away from the worgen, which is more than the forest will do." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've feed to measure." },
      },
      choices = {
        { text = "I need to stable my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What animals do you keep here?", next = "animals" },
        { text = "Do the animals mind the dead?", next = "mind" },
        { text = "I'll go.", next = "END" },
      },
    },
    animals = {
      lines = { { id = "a_default", text = "Hunters' wolves and cats, a few bats for Karos when his own fall sick, and once a bear belonging to a tauren who swore it was the gentlest creature alive. It ate a deathguard's boot, with his foot still in it, though he never felt a thing." } },
      choices = {
        { text = "What happened to the deathguard?", next = "animals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    animals2 = {
      lines = { { id = "a2_default", text = "The apothecaries sewed him back together and he walks with a limp now, which he blames on the bear and I blame on the boot. The tauren apologized for an hour, and I liked him for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mind = {
      big = true,
      lines = { { id = "m_default", text = "Every beast that comes here takes a day or two to stop growling at me, because they smell what we are and their noses don't lie. I don't blame them and I don't force them, and in the end they let me close, which is more than most of the living do." } },
      choices = {
        { text = "Let them come to you. Kindness wins them over.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A firm hand would teach them faster.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know animals, dear, not that. Ask the High Executor." } },
  },
}

---------------------------------------------------------------------------
-- Andrew Hilbert
---------------------------------------------------------------------------
P:NPC {
  key = "hilbert", id = TODO_NPC("Andrew Hilbert"), name = "Andrew Hilbert", title = "Trade Supplies",
  bible = "bibles/sepulcher_folk.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "dry" }, values = { "practical", "honest" },
  notices = { "craft" },

  impression = {
    first = "Andrew Hilbert sells trade supplies at the Sepulcher and never asks what a customer is stitching, since most of them are sewing themselves back together. He adds the road's losses to his prices and says so.",
    third = "{name} met Andrew Hilbert, who sells trade supplies at the Sepulcher.",
  },

  greetings = {
    { id = "g_default", text = "Thread, vials, flux and dye. I don't ask what it's for, and you don't ask why it costs what it does." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy" } },
      text = "A crafter! Good, because most of my customers only buy needles to stitch their own arms back on." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andrew Hilbert, trade supplies, and the only man in Silverpine who'll sell you thread without asking what you're stitching. Most of my customers are sewing themselves back together, so I've learned not to ask." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm not going anywhere." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Who buys from you out here?", next = "who" },
        { text = "How do you get goods to the Sepulcher?", next = "supply" },
        { text = "Good day.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Andrea Boynton buys cloth for her coats, Renferrel's people buy every vial I can get, and the deathguards buy needles to mend what the worgen chew on. Business is steady, since the dead are very hard on their clothes." } },
      choices = {
        { text = "What does Renferrel need so many vials for?", next = "who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who2 = {
      lines = { { id = "w2_default", text = "His work, which is the Apothecary Society's business and not mine, as he reminded me the one time I asked. I sell him the vials and he sends back the empties, and some of the empties I wash twice." } },
      choices = { { text = "Wise man. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    supply = {
      big = true,
      lines = { { id = "s_default", text = "Up the road from Brill by wagon when the wagons make it, and by boat to the coast when they don't. Half of what I sell has been robbed at least once on the way, so I've stopped counting the losses and started adding them to the price." } },
      choices = {
        { text = "Your customers shouldn't pay for bandits.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pass it on to the customer. Smart business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Bates at the inn, he hears more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Patrice Dwyer
---------------------------------------------------------------------------
P:NPC {
  key = "patrice_dwyer", id = TODO_NPC("Patrice Dwyer"), name = "Patrice Dwyer", title = "Poison Supplies",
  bible = "bibles/sepulcher_folk.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "cheerful" }, values = { "curious", "proud" },
  notices = { "class" },

  impression = {
    first = "Patrice Dwyer sells poison supplies at the Sepulcher and talks about them the way other people talk about their gardens. The apothecaries look down on her, and she returns the favor.",
    third = "{name} met Patrice Dwyer, who sells poisons to the Sepulcher's rogues.",
  },

  greetings = {
    { id = "g_default", text = "Don't touch the green jars, or the blue ones, and actually, keep your hands behind your back." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "A rogue! Come closer, I've a fresh batch that'll make a Dalaran wizard forget his own name." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Patrice Dwyer, poison supplies, and everything on my shelf is perfectly legal in the Undercity before you say a word. Rogues buy from me, apothecaries sneer at me, and the worgen have never once complained." },
      },
      again = {
        { id = "h_again", text = "Something else, dear? Mind the green jars." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Do the apothecaries mind your trade?", next = "apoth" },
        { text = "Do poisons even work on the dead?", next = "dead" },
        { text = "I'll go.", next = "END" },
      },
    },
    apoth = {
      big = true,
      lines = { { id = "a_default", text = "Oh, they mind terribly, because they think anyone who mixes a poison outside the Apothecarium is a dabbler and a danger. I think a poison that drops one worgen at a time is a good deal tidier than some of what goes into their cauldrons, but nobody asked me." } },
      choices = {
        { text = "Poison is a coward's weapon, whoever brews it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Poison wins fights. Pride loses them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Not much, which is a great comfort to me, since I spill more than I'd like. On the worgen they work beautifully, and on Dalaran's wizards they work slowly, which is better, because a slow wizard can't cast." } },
      choices = {
        { text = "Have you tested them on worgen yourself?", next = "dead2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead2 = {
      lines = { { id = "d2_default", text = "A deathstalker brought me a worgen pelt with a dart still in it, and I studied that pelt for a week. I've been working on something stronger ever since, though whatever lives in Shadowfang Keep seems to shrug most of it off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a clue, dear. If it isn't in a jar, it isn't my business." } },
  },
}

---------------------------------------------------------------------------
-- Johan Focht
---------------------------------------------------------------------------
P:NPC {
  key = "johan_focht", id = TODO_NPC("Johan Focht"), name = "Johan Focht", title = "Mining Trainer",
  bible = "bibles/sepulcher_folk.md", role = "trainer", tier = "service",
  communities = { "sepulcher" }, temper = { "gruff" }, values = { "practical", "craft" },
  notices = { "craft" },

  impression = {
    first = "Johan Focht teaches mining at the Sepulcher with the patience of a man who spent half his life underground. He keeps clear of Ambermill, where Dalaran's mages carry crates into the old workings and nothing out.",
    third = "{name} met Johan Focht, the Sepulcher's mining trainer.",
  },

  greetings = {
    { id = "g_default", text = "Mind the pick. It's sharper than it looks, and so am I." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Copper dust on your boots! You've been in the hills, then, and come back with all your fingers, which is a good start." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Johan Focht. I teach mining, which in Silverpine means teaching you to swing a pick without waking anything in the hills that ought to stay asleep." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask it plain." },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where's the good ore around here?", next = "ore" },
        { text = "Did you mine in life?", next = "past" },
        { text = "I'll go.", next = "END" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper in the hills east of the road and tin if you look harder, and silver now and then where the rock's been split open. Keep clear of the old workings near Ambermill, because Dalaran's mages have taken a liking to them and they don't like visitors." } },
      choices = {
        { text = "Why would mages want old mine shafts?", next = "ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore2 = {
      lines = { { id = "o2_default", text = "For whatever lies under Ambermill, I expect, which is none of my business and all of my curiosity. I've watched them carry crates in and nothing out, and that's all I'll say about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      big = true,
      lines = { { id = "p_default", text = "I dug silver in the hills north of the capital for twenty years, and the plague found me underground, which was a poor joke on its part. When I woke, the first thing I asked for was a pick, and the Dark Lady's people were good enough to give me one." } },
      choices = {
        { text = "Honest work is what keeps us whole.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Twenty years underground? I'd want something new.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know rock, and that isn't rock, so ask somebody at the inn." } },
  },
}

---------------------------------------------------------------------------
-- Nadia Vernon
---------------------------------------------------------------------------
P:NPC {
  key = "nadia_vernon", id = TODO_NPC("Nadia Vernon"), name = "Nadia Vernon", title = "Bowyer",
  bible = "bibles/sepulcher_folk.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "brisk" }, values = { "practical", "careful" },
  notices = { "class" },

  impression = {
    first = "Nadia Vernon sells bows and guns at the Sepulcher to anyone who would rather kill a worgen from across a clearing. She won't take sides between bow and gun, though she notes that a bow has never blown up in her hand.",
    third = "{name} met Nadia Vernon, the Sepulcher's bowyer.",
  },

  greetings = {
    { id = "g_default", text = "Bows on the left, guns on the right, and keep your fingers off the strings unless you're buying." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll want something with a better draw than that if the worgen are going to be your trade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nadia Vernon, bowyer. I sell bows and guns to anyone who'd rather kill a worgen from across a clearing than across a table, which is the sensible choice." },
      },
      again = {
        { id = "h_again", text = "Something else? Aim your questions as carefully as your arrows." },
      },
      choices = {
        { text = "Show me your bows and guns.", next = "BUSINESS" },
        { text = "Bow or gun, which is better?", next = "which" },
        { text = "What's the hardest thing to shoot out here?", next = "worgen" },
        { text = "I'll go.", next = "END" },
      },
    },
    which = {
      big = true,
      lines = { { id = "wh_default", text = "Guns are louder, which some dwarves seem to think is the point, and bows are quieter, which is the point in Silverpine. I sell both and I'll not take sides, though I'll say a bow has never once blown up in my hand." } },
      choices = {
        { text = "A bow, always. Patience wins in the woods.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A gun. Let them hear me coming.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen = {
      lines = { { id = "wo_default", text = "The worgen, by a long way, since they come at you out of the trees faster than a horse and they don't stop for one arrow. Aim low, for the legs, and then aim again, because the first arrow only makes them angry." } },
      choices = {
        { text = "Where do they come from?", next = "worgen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen2 = {
      lines = { { id = "wo2_default", text = "From the south, around Pyrewood and that keep of Arugal's, and nobody at the Sepulcher will say much more than that. Dalar Dawnweaver might, if you can get him to stop talking about Dalaran long enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldn't tell you, since I sell bows and not answers." } },
  },
}
