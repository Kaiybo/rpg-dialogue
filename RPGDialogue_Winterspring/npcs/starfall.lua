-- Starfall Village: Wynd Nightchaser, who knows the ruins, and Jaron Stoneshaper of the
-- Explorers' League, who was chased off his dig by wildkin. Voices: bibles/wynd.md, bibles/jaron.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Wynd Nightchaser
---------------------------------------------------------------------------
P:NPC {
  key = "wynd", id = TODO_NPC("Wynd Nightchaser"), name = "Wynd Nightchaser",
  bible = "bibles/wynd.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "calm", "warm" }, values = { "wise", "careful" },
  notices = { "arcane", "travel" },

  impression = {
    first = "Wynd Nightchaser keeps a quiet watch at Starfall Village and knows every ruin in the snow by name. He speaks of the Highborne the way you'd speak of a family scandal: sadly, and not too loudly.",
    third = "{name} met Wynd Nightchaser of Starfall Village, who knows the old elven ruins of Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Starfall Village. Come in out of the wind, and tell me what brings you." },
    { id = "g_ivy", when = { questActive = TODO_QUEST("To Winterspring!") }, text = "A friend of Ivy Leafrunner's, all the way from Felwood? Then you're doubly welcome." },
    { id = "g_crystal", when = { questActive = TODO_QUEST("The Crystal of Zin-Malor") }, text = "Keep the crystal wrapped, and don't look into it too long. Darnassus is where it belongs." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the snow has covered your tracks twice over. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you first came through the snow to us, and the ruins will notice it too." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word reaches even Starfall, and it says good things of you. I'm glad to hear it." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Someone says you told them a tale that didn't hold up. Up here we rely on each other's word, so mind it." },
  },

  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = "MAGE" },
      text = "You've the arcane about you, and Kel'Theril is full of what's left of people who loved it too much. Be careful near the lake." },
    { id = "n_cold", cat = "travel", when = { mounted = true },
      text = "Let your mount rest by the fire a while. Winterspring's cold gets into the legs before anything else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Wynd Nightchaser, and I've spent more years at Starfall than I'd care to count. Winterspring is a harsh land, but it holds a great many old elven ruins, and most of them hold secrets that someone would rather were forgotten." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("The Ruins of Kel'Theril") },
          text = "Jaron Stoneshaper has been down to Kel'Theril more recently than I have, and he'll tell you what he saw. He's a dwarf, so he'll tell you at length." },
        { id = "h_remorse", tags = { "news" }, when = { questActive = TODO_QUEST("Remorseful Highborne") },
          text = "Is that what I think it is? The crystal of Zin-Malor, whole again, after all these years. I never thought I'd see it with my own eyes." },
        { id = "h_crystal_done", when = { questDone = TODO_QUEST("The Crystal of Zin-Malor") },
          text = "Fandral has the crystal now, I hear, and the spirits at the lake are quieter for it. You did a rare thing there, and an old wrong is a little less wrong." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of our own, this far north. Welcome, though I'll warn you that the ruins here are not the kind of history our people like to remember." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "We don't see many of the Horde at Starfall, and I'll not pretend the Sentinels wouldn't frown. But the snow doesn't care who you are, so come in out of it." },
      },
      again = {
        { id = "h_again", text = "What else would you know? There's always more in this snow." },
        { id = "h_again2", text = "Go on. I've little to do but talk, between the storms." },
      },
      choices = {
        { text = "What happened at Kel'Theril?", next = "kel" },
        { text = "Tell me about Starfall Village.", next = "village" },
        { text = "What other ruins are there?", next = "ruins" },
        { text = "Why give the crystal to Fandral?", next = "crystal", when = { questDone = TODO_QUEST("Remorseful Highborne") } },
        { text = "Couldn't a mage use the crystal properly?", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell, Wynd.", next = "END" },
      },
    },
    kel = {
      lines = {
        { id = "k_default", text = "The Highborne who lived there stole a sacred artifact, believing they could drain its power and become greater than they were. They tried a ritual on it, and it shattered in a great blast that drove the pieces deep under the ice of the lake." },
      },
      choices = {
        { text = "And the Highborne themselves?", next = "kel_ghosts", fx = { learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_ghosts = {
      lines = {
        { id = "kg_default", text = "They're still there, bound to the place where they tried it, and they're not friendly to the living. They wander the shore looking for the pieces of the very thing that cursed them, and they've been doing it for a very long time." },
      },
      choices = {
        { text = "Do they deserve it?", next = "kel_deserve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_deserve = {
      big = true,
      lines = {
        { id = "kd_default", text = "That's the question I've never settled. They were greedy and proud, and what they did was a crime, but an age of wandering a frozen shore is a long sentence for anyone." },
      },
      choices = {
        { text = "Their sentence is just. They chose their greed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "No crime earns forever. They should be freed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "v_default", text = "A few houses and a fire against the wind, and those of us who'd rather watch over the old places than leave them to the furbolgs and the snow. Jaron the dwarf stays with us now, since the wildkin chased him off his dig." },
      },
      choices = {
        { text = "What chased him off?", next = "wildkin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildkin = {
      lines = {
        { id = "w_default", text = "Wildkin, mad and furious, as the ones in these valleys have been for as long as I've kept watch here. He'll tell you he got too close to something they were guarding, and I believe him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = {
        { id = "r_default", text = "Kel'Theril is the one you'll hear about most, but there are older stones all through these valleys. The Highborne liked the north, once, because the snow kept curious people away from their work." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal = {
      lines = {
        { id = "c_default", text = "Because the temple it came from lies in ruin, and it can never go home. A crystal like that should rest in the hands of people who won't abuse it, and only a handful of the strongest would be able to control it at all." },
      },
      choices = {
        { text = "You trust Darnassus with it?", next = "crystal_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal_trust = {
      big = true,
      lines = {
        { id = "ct_default", text = "I trust the Arch Druid more than I trust anyone who'd be tempted to use it, and that includes me. You could have kept it, you know, and you didn't, which says a great deal about you." },
      },
      choices = {
        { text = "Power like that should be locked away.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have kept it, if I'd known what it was.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xm_default", text = "That's exactly what the Highborne said, word for word, I'd imagine. The crystal grants great power only to those truly worthy of it, and the trouble is that everyone believes they are." },
      },
      choices = {
        { text = "Then the wise mage leaves it alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some mages truly are worthy of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a watcher of old stones, and Starfall is where I watch from. That's enough of a story for me." } },
    advice = { { id = "tp_ad", text = "Don't go to Kel'Theril at night, and don't stay longer than you have to. The spirits there don't forgive company." } },
    highborne = { { id = "tp_hb", text = "Our ancestors, or some of them, and the ones who brought the sea down on all of us. Kel'Theril is one small piece of what they did." } },
    furbolgs = { { id = "tp_furb", text = "The Winterfall have gone bad lately, worse than the cold ever made them. Donova Snowden at the hot springs knows more of it than I do." } },
    _none = { { id = "tp_none", text = "That's beyond the snow I know, I'm afraid. Try Everlook; the goblins hear everything." } },
  },
}

---------------------------------------------------------------------------
-- Jaron Stoneshaper
---------------------------------------------------------------------------
P:NPC {
  key = "jaron", id = TODO_NPC("Jaron Stoneshaper"), name = "Jaron Stoneshaper",
  bible = "bibles/jaron.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds", "explorers_league" }, temper = { "jovial", "chatty" }, values = { "curious", "practical" },
  notices = { "race", "craft" },

  impression = {
    first = "Jaron Stoneshaper is an Explorers' League dwarf who digs for relics in the snow and got chased off his own camp by wildkin. He talks a great deal and laughs at himself more than most.",
    third = "{name} met Jaron Stoneshaper, an Explorers' League digger in Winterspring with a grudge against wildkin.",
  },

  greetings = {
    { id = "g_default", text = "Aye, what can I do for ye?" },
    { id = "g_wildkin", when = { questActive = TODO_QUEST("Enraged Wildkin") }, text = "Any sign o' my camp, lad? Or what's left of it?" },
    { id = "g_pick", when = { questActive = TODO_QUEST("Troubled Spirits of Kel'Theril") }, text = "Mind my pick, now. It's the only one I've got left after those feathered lunatics." },
    { id = "g_away", when = { away = 14 }, text = "There ye are, back after {away}! I thought the snow had got ye." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've filled out since I last saw ye, and I'd have ye along on any dig now." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk speak well o' ye round here, and in this cold that's worth a fire." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody's sore at ye, I hear. Best mend that; it's a small north and a long winter." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Now there's a face from home! Ye've not got any dry socks on ye, by chance? Mine went with the camp." },
    { id = "n_arch", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Then ye'll know a good pick when ye see one, and ye'll know why I'm so fond o' mine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jaron Stoneshaper, Explorers' League, at yer service. I've been hunting artifacts in Winterspring, because they say it's full of very magical things, though most of 'em are guarded by something that wants to kill ye." },
        { id = "h_harlo", tags = { "news" }, when = { questActive = TODO_QUEST("Enraged Wildkin") },
          text = "Harlo sent ye, did he? Aye, I'm the survivor he's been gossiping about. I was chased clean out of my camp in the south by a pack of bloodthirsty wildkin, and I'm lucky I've still got all my beard." },
        { id = "h_kel", tags = { "news" }, when = { questActive = TODO_QUEST("The Ruins of Kel'Theril") },
          text = "Wynd sent ye about Kel'Theril? Well, I'm no historian, mind, but I can tell ye what I saw there, and what I saw was a lot of very unhappy ghosts." },
        { id = "h_amulet", tags = { "news" }, when = { questRecent = { TODO_QUEST("Enraged Wildkin"), days = 3 } },
          text = "My tools, and the amulet besides! I wonder why those beasts fought so hard over a bit o' blue feathers and stone. Either way, I'll think twice before I dig near them again." },
        { id = "h_aurora", when = { questDone = TODO_QUEST("Troubled Spirits of Kel'Theril") },
          text = "Did Aurora Skycaller make anything of those fragments? She's a sad sort, but if anyone knows what those Highborne broke, it's her." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Don't touch my pick, it's perfect as it is, and I know that look ye're giving it." },
      },
      again = {
        { id = "h_again", text = "What else, lad? I've stories enough for a whole winter." },
        { id = "h_again2", text = "Go on, ask. I'm not going anywhere till the wildkin calm down." },
      },
      choices = {
        { text = "What happened at your camp?", next = "camp" },
        { text = "What did you see at Kel'Theril?", next = "kel" },
        { text = "What brings the Explorers' League this far north?", next = "league" },
        { text = "Who should I ask about those fragments?", next = "aurora", when = { questActive = TODO_QUEST("Troubled Spirits of Kel'Theril") } },
        { text = "Let me look at that pick, Jaron.", next = "xpick", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Good luck, Jaron.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "I was set up in southern Winterspring, digging, minding my own business, when the wildkin came down on us like a storm. I suppose I got too close to something they were guarding, but they didn't stop to explain." },
      },
      choices = {
        { text = "You said us. Who was with you?", next = "camp_friend" },
        { text = "What were you digging for?", next = "camp_amulet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_friend = {
      lines = {
        { id = "cf_default", text = "A buddy o' mine from the League, and I fear he wasn't as quick as me. I've told myself he ran the other way and he's sitting in Everlook now, laughing at me, but I haven't seen him there." },
      },
      choices = {
        { text = "I'll look for him out there.", next = "camp_promise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_promise = {
      big = true,
      lines = {
        { id = "cp_default", text = "That's kind o' ye, and I'll not stop ye, but don't go getting yerself killed over an old dwarf's guilt. One of us lost in the snow is enough for this season." },
      },
      choices = {
        { text = "No one gets left out there. I'll look.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You're right. The living matter more than the lost.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_amulet = {
      lines = {
        { id = "ca_default", text = "Nothing in particular, just whatever the ground would give up, but the day before they came I'd unearthed an amulet with blue feathers worked into it. Pretty thing, and I'd like it back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kel = {
      lines = {
        { id = "k_default", text = "Ghosts of the Highborne, wandering the lake, all moaning and looking for the bits of the relic they broke. They're still searching for pieces of the very thing that cursed them there, and that's a hard sort of punishment." },
      },
      choices = {
        { text = "Could the pieces be found?", next = "kel_pieces" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_pieces = {
      lines = {
        { id = "kp_default", text = "If ye're that curious, take my pick and go south to the lake, and see what ye can dig out of the ice. I can't tell ye what ye'll find, but I know someone who might." },
      },
      choices = {
        { text = "Who?", next = "aurora" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aurora = {
      lines = {
        { id = "a_default", text = "Aurora Skycaller, a high elf who lives near the Northpass Tower in the Eastern Plaguelands. It's a long walk and an ugly one, but she knows more about the old elves than anyone I've met." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    league = {
      lines = {
        { id = "l_default", text = "The same thing as brings us everywhere: we want to know where we came from, and where everyone else came from too. The north's full of old elf stones, and old elf stones have a way of telling ye things they shouldn't." },
      },
      choices = {
        { text = "And the danger?", next = "league_danger", fx = { learn = { "explorers_league" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_danger = {
      big = true,
      lines = {
        { id = "ld_default", text = "Part of the job, lad. Every ruin worth digging has something sitting on it, and if we waited for the north to be safe we'd never dig at all." },
      },
      choices = {
        { text = "Knowledge is worth the risk. Keep digging.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some ruins should be left in peace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpick = {
      lines = {
        { id = "xp_default", text = "Ye may look, but ye'll not tinker with it. That pick has broken more ice than any engine ever built, and it doesn't need improving." },
      },
      choices = {
        { text = "It's a fine pick, Jaron.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge born, League by trade, and cold since the day I came north. That's about the size of it." } },
    advice = { { id = "tp_ad", text = "If a wildkin's standing on something, leave it be. I'm living proof, just about." } },
    explorers_league = { { id = "tp_el", text = "Best outfit in the world, if ye ask me, though our pay's poor and our camps keep getting wrecked." } },
    highborne = { { id = "tp_hb", text = "Old elves with more magic than sense, from what I've dug up. Wynd knows the sad parts better than I do." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, lad. Ask Wynd; he's been here longer than the snow." } },
  },
}
