-- More of the Sepulcher: Astor Hadren (a courier with a secret employer, and the mark of
-- the rogues' Deathstalkers chain), Sarah Goode (stable master), Andrew Hilbert (trade
-- supplies), Patrice Dwyer (poisons), Johan Focht (mining) and Nadia Vernon (bowyer).
-- Voices: bibles/sepulcher_folk.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
        { id = "h_dd_ichor", when = { questDone = TODO_QUEST("Rot Hide Ichor") },
          text = "So you're the one who brought Renferrel his gnoll ichor. He sneers at my shelf, but he brews with worse than anything I sell, and now I know who to thank for the smell." },
      },
      again = {
        { id = "h_again", text = "Something else, dear? Mind the green jars." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Do the apothecaries mind your trade?", next = "apoth" },
        { text = "Do poisons even work on the dead?", next = "dead" },
        { text = "Where do your ingredients come from?", next = "ingred" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "Show me a trick for mixing on the road.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "My people have brewed poisons since before Lordaeron.", next = "xtroll", when = { race = "Troll" } },
        { text = "I'll go.", next = "END" },
      },
    },
    apoth = {
      big = true,
      lines = { { id = "a_default", text = "Oh, they mind terribly, because they think anyone who mixes a poison outside the Apothecarium is a dabbler and a danger. I think a poison that drops one worgen at a time is a good deal tidier than some of what goes into their cauldrons, but nobody asked me." } },
      choices = {
        { text = "Poison is a coward's weapon, whoever brews it.", next = "BACK", reply = "A coward's weapon wins wars, my dear, and the Scourge are not owed a fair duel. Buy a vial or move along.", fx = { align = { honor = 1 } } },
        { text = "Poison wins fights. Pride loses them.", next = "BACK", reply = "Exactly, and the Apothecarium has more pride than the rest of the Undercity put together. Come back when you need a refill.", fx = { affinity = 1, align = { honor = -1 } } },
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
      choices = {
        { text = "Why would the keep's worgen be any different?", next = "dead3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead3 = {
      lines = { { id = "d3_default", text = "Because Arugal's magic runs in them, or so the deathstalkers say, and magic is a very poor patient. It heals what I do to it before the poison's halfway round the heart, which is terribly rude of it." } },
      choices = {
        { text = "Then you'll need something nastier.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ingred = {
      lines = { { id = "in_default", text = "The forest, mostly, which is very generous if you know where to look. Spider glands from the webs along the road, a few of Gwyn Farrow's mushrooms that she swears are only for soup, and a root from the lake shore that I'm not telling you the name of." } },
      choices = {
        { text = "Gwyn's mushrooms are only for soup?", next = "ingred2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ingred2 = {
      lines = { { id = "i2_default", text = "That's what she tells the Deathguard, and it's even true, if you're making the soup for someone you dislike. We have an understanding, Gwyn and I, which is that she doesn't ask and I pay in full." } },
      choices = {
        { text = "And the root you won't name?", next = "ingred3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ingred3 = {
      lines = { { id = "i3_default", text = "Still not telling you, dear, but I'll say it grows where the lake meets Pyrewood's fields, and the worgen don't touch it. Make of that what you like, and wear gloves while you do." } },
      choices = { { text = "Gloves. Noted.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The Deathstalkers, by a long way, and a few deathguards who've decided an arrow ought to have opinions. The apothecaries buy nothing, of course, and then I find my empty jars in Renferrel's rubbish, scraped clean." } },
      choices = {
        { text = "Renferrel's studying your work?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "b2_default", text = "Studying it, sneering at it and copying it, in that order, and denying all three. I take it as the highest compliment the Royal Apothecary Society knows how to pay." } },
      choices = { { text = "A compliment indeed.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Never mix in the wind, never mix by firelight, and never, ever lick your thumb to turn the page of a recipe. I learned the third one from a man who isn't with us anymore, even by our standards." } },
      choices = { { text = "Thumbs stay dry. Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
    xtroll = {
      lines = { { id = "xt_default", text = "So I hear, and I'd give a good deal to see what a Darkspear puts on a spear tip. Trade me a recipe one day, and I'll trade you one back, and we'll neither of us tell the apothecaries." } },
      choices = {
        { text = "Maybe, if your recipe's worth it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Big, hairy and wonderfully susceptible to the right toxin, so long as Arugal hasn't had his hands on them. I've a soft spot for worgen, in a professional way." } },
    shadowfang = { { id = "tp_shadowfang", text = "Whatever's in that keep shrugs off my best work, and I take that very personally. One day I'll find the mix that doesn't wash off." } },
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
        { text = "What's in the hills that ought to stay asleep?", next = "hills" },
        { text = "Any advice for a new miner?", next = "tip" },
        { text = "Silverpine rock? We'd call this gravel in Ironforge.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I've been working the hills east of the road.", next = "xminer", when = { profession = "Mining" } },
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
      choices = {
        { text = "Have you told anyone about the crates?", next = "ore3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore3 = {
      lines = { { id = "o3_default", text = "Shadow Priest Allister, who listened very carefully and wrote nothing down, which is how you know he cared. Since then his people go up that road a good deal more than miners do, and I go down it a good deal less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      big = true,
      lines = { { id = "p_default", text = "I dug silver in the hills north of the capital for twenty years, and the plague found me underground, which was a poor joke on its part. When I woke, the first thing I asked for was a pick, and the Dark Lady's people were good enough to give me one." } },
      choices = {
        { text = "Honest work is what keeps us whole.", next = "BACK", reply = "It does, I think. A pick in the hand reminds me I'm still a miner, and not just something the plague left behind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Twenty years underground? I'd want something new.", next = "BACK", reply = "New? I'm dead, friend, and the dead don't get much new. The tunnels are the one place that still feels like mine.", fx = { align = { order = -1 } } },
        { text = "The plague found you underground?", next = "past2" },
      },
    },
    past2 = {
      lines = { { id = "p2_default", text = "It came down the shaft in the water, we reckoned after, because the men at the bottom took sick first. I remember the lamp going out, and then nothing at all until I woke in the dark with the Dark Lady's deathguards standing over me." } },
      choices = {
        { text = "What became of the other miners?", next = "past3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past3 = {
      lines = { { id = "p3_default", text = "Some woke with me, and some woke wrong, mindless and wandering, and the Deathguard put those down. I'd like to think I'd have done the same for them, and I'd like to think they'd have done it for me." } },
      choices = {
        { text = "That's a hard thing to carry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills = {
      lines = { { id = "hi_default", text = "Gnolls, first, the Moss-hides, who dig too, and badly, and don't like company in their holes. Past them there are worgen dens in the deep woods, and a pick makes a poor weapon against a thing that size." } },
      choices = {
        { text = "Gnolls dig for ore too?", next = "hills2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills2 = {
      lines = { { id = "h2_default", text = "They dig for whatever's shiny, and they collapse half of what they dig, so I'd not follow one of their tunnels if you paid me. Find your own vein, cut your own shaft, and prop it properly, even if it costs you a day." } },
      choices = { { text = "Prop it properly. Understood.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    tip = {
      lines = { { id = "ti_default", text = "Listen to the rock before you hit it, because good stone rings and rotten stone thuds. And mine in daylight, since the worgen hunt at night and they can hear a pick from a mile off." } },
      choices = { { text = "Daylight and listening. Thanks, Johan.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "Aye, and Ironforge sits on the best stone in the world, so you've earned your boasting. But this gravel kept my family fed for twenty years, so I'll thank you to swing at it before you sneer at it." } },
      choices = {
        { text = "Fair. I'll swing first.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xminer = {
      lines = { { id = "xm_default", text = "Good, and you came back, which is the half of mining nobody teaches. Try the split rock south of the Sepulcher next, where the silver shows, but don't go near Ambermill with that pick on your back." } },
      choices = { { text = "South, and not Ambermill. Something else.", next = "BACK" } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran's people dig at Ambermill and tell nobody why. A miner always wants to know why, and a sensible one doesn't ask." } },
    lordaeron = { { id = "tp_lordaeron", text = "The hills north of the capital had the best silver in the kingdom, and I dug it for twenty years. The kingdom's gone, but the silver's still down there." } },
    _none = { { id = "tp_none", text = "I know rock, and that isn't rock, so ask somebody at the inn." } },
  },
}
