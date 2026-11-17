-- Stonetalon folk: Piznik (Venture Co. miner spying for Ziz Fizziks, Gerenzo's Orders), and Sun Rock's
-- Tharm (wind rider master), Gereck (stable master) and Jeeda (apprentice witch doctor). Voice: bibles/stonetalon_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Piznik
---------------------------------------------------------------------------
P:NPC {
  key = "piznik", id = TODO_NPC("Piznik"), name = "Piznik",
  title = "Venture Co.",
  bible = "bibles/stonetalon_folk.md", role = "worker", tier = "quest",
  communities = { "windshear_crag" }, temper = { "nervous", "shrewd" }, values = { "profit", "grudge" },
  notices = { "race", "stealth" },

  impression = {
    first = "Piznik is a goblin in a Venture Company hard hat two sizes too big, and he talks out of the side of his mouth while he swings a pick he obviously resents. He checked the tunnel behind me three times before he said anything worth hearing.",
    third = "{name} met Piznik, a demoted Venture Company foreman working the Windshear Mine and quietly reporting to Ziz Fizziks.",
  },

  greetings = {
    { id = "g_hello", text = "Keep swingin' at something, pal, anything, because if the shift boss sees us talkin' I'm docked a day and you're docked a head." },
    { id = "g_active", when = { questActive = TODO_QUEST("Gerenzo's Orders") }, text = "Right, right, watch the tunnel while I dig, and if a patrol comes, you hit it and I hide. That's the partnership." },
    { id = "g_done", when = { questDone = TODO_QUEST("Gerenzo's Orders") }, text = "Ziz got the sample? Good, good, then somebody up there's finally payin' attention to what Gerenzo's diggin' up." },
    { id = "g_hidden", when = { stealthed = true }, text = "Whoa, whoa, where'd you come from? Do that again and I'll need a new pair of trousers, and those come out of my wages too." },
  },

  notice = {
    { id = "n_gob", cat = "race", when = { race = "Goblin" },
      text = "A goblin who isn't on the Venture payroll? Lucky you, pal, and keep it that way, because the contract here has a clause about your firstborn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Piznik, and once upon a time I was second most important goblin on this whole site, with a desk and a chair with a cushion on it. Then Gerenzo Wrenchwhistle took over, fired my boss Ziz, and sent me down the hole with a pick." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Gerenzo's Orders") },
          text = "Ziz told me to stay down here and keep my ears open, and listen, I've heard plenty, chum. Gerenzo's got us diggin' tons of this gold-green ore, and I can get you a sample for Ziz, if you'll watch my back while I dig it." },
        { id = "h_active", when = { questActive = TODO_QUEST("Gerenzo's Orders") },
          text = "Patrols and workers walk past here all day, so keep your weapon out and your voice down. If we get caught it's gonna get ugly, and I mean ugly for me first." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gerenzo's Orders"), days = 3 } },
          text = "Nobody's noticed the missing ore yet, and with Venture bookkeeping nobody ever will. Ziz owes us both a drink, pal, and I'm keepin' the ledger." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the foreman counts pick swings." },
        { id = "h_again2", text = "Keep talkin', but keep it low, pal." },
      },
      choices = {
        { text = "What happened between Ziz and Gerenzo?", next = "ziz" },
        { text = "What is this green ore?", next = "ore" },
        { text = "Why does the Venture Company want these mountains?", next = "venture" },
        { text = "Who's Ziz working for now?", next = "boss" },
        { text = "Get to it, Piznik.", next = "BUSINESS" },
        { text = "I'll leave you to your digging.", next = "END" },
      },
    },

    ziz = {
      lines = { { id = "zi_default", text = "Ziz ran this site the old-fashioned way: cut the trees, sell the timber, pay the crew on Fridays, mostly. Gerenzo came in with new orders from somewhere up the ladder and decided Ziz was too soft, which is like calling a shark a vegetarian." } },
      choices = {
        { text = "And what's Gerenzo like?", next = "ziz_gerenzo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ziz_gerenzo = {
      lines = { { id = "zg_default", text = "He's a leper gnome with more gears than skin and more mean than either, pal, and he spends his days up in the tower at the crag barkin' into a voice tube. Nobody's seen him eat, sleep or smile, and I've got three silver says he can't do any of 'em." } },
      choices = {
        { text = "Why do you stay, then?", next = "ziz_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ziz_stay = {
      big = true,
      lines = { { id = "zs_default", text = "Because quittin' the Venture Company costs more than workin' for it, chum: there's a fee for leavin', a fee for the pick, and a fee for the air you breathed. So I dig, and I listen, and I sell what I hear to Ziz on account." } },
      choices = {
        { text = "Sell them out. They earned it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A man who spies on his own crew can't be trusted.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ore = {
      lines = { { id = "or_default", text = "Nobody down here knows, pal, and that's the part that scares me. It's gold-green, it's warm when it shouldn't be, and it goes up to Gerenzo by the cartload and never comes back down." } },
      choices = {
        { text = "Warm? Is it dangerous?", next = "ore_warm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_warm = {
      lines = { { id = "ow_default", text = "Two of the lads came off the night shift with their eyebrows singed and swearin' they didn't go near the furnace. In a Venture mine that's practically a normal Tuesday, but even I noticed." } },
      choices = {
        { text = "I'll find out what Gerenzo wants with it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    venture = {
      lines = { { id = "ve_default", text = "Trees, ore, and anything else you can put a price tag on, chum, which is everything. The Charred Vale used to be green, you know, before the fires, and nobody in the head office lost a minute's sleep over it." } },
      choices = {
        { text = "Do you lose sleep over it?", next = "venture_sleep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    venture_sleep = {
      lines = { { id = "vs_default", text = "I lose sleep over my back, pal, and over the eight silver the company says I owe for this hat. The trees I try not to think about, because a goblin who starts countin' trees stops countin' coin." } },
      choices = {
        { text = "Maybe you should start counting trees.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boss = {
      lines = { { id = "bo_default", text = "Ziz says he's got a new boss who'll pay well for whatever we learn about Gerenzo's plans, and I don't ask who, because the less I know the less they can squeeze out of me. Rivals, the Horde, a trade prince with a grudge, it's all the same color of gold." } },
      choices = {
        { text = "Smart. Keep your head down.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Tunnels, shifts, who's skimmin' what, and where Gerenzo's ore goes. That last one's extra, pal." } },
    background = { { id = "tp_bg", text = "Second in command of Windshear Crag once, and now a pick and a grudge. Ask Ziz how that happened.", next = "ziz" } },
    venture_company = { { id = "tp_venture", text = "They pay in scrip, they charge in gold, and they never, ever forget a debt." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it's not ore or gossip, it doesn't pay." } },
  },
}

---------------------------------------------------------------------------
-- Tharm
---------------------------------------------------------------------------
P:NPC {
  key = "tharm", id = TODO_NPC("Tharm"), name = "Tharm",
  title = "Wind Rider Master",
  bible = "bibles/stonetalon_folk.md", role = "flightmaster", tier = "service",
  communities = { "sun_rock" }, temper = { "calm", "slow" }, values = { "sky", "care" },
  notices = { "race", "weary" },

  impression = {
    first = "Tharm is a broad, unhurried tauren who speaks to his wind riders before he speaks to anyone else. He scratched one under the jaw the whole time we talked, and it purred like a mountain cat.",
    third = "{name} met Tharm, who keeps the wind riders of Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_hello", text = "The winds are kind over the peaks today. Where would you have them carry you?" },
    { id = "g_back", when = { metBefore = true }, text = "You return, and in one piece. The riders will be pleased; they remember who sits gently." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Walk with the Earth Mother, and fly with An'she watching over you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tharm, and these are the wind riders of Sun Rock. They fly to Thunder Bluff and the Crossroads, and anywhere else the Horde keeps a roost." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "They fly by night as well as day, though they grumble about it. The stars guide them, and they know every peak between here and the Barrens." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask?" },
        { id = "h_again2", text = "The riders are patient, and so am I. Ask." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Are the harpies a danger to your riders?", next = "harpy" },
        { text = "Why is this place called Sun Rock?", next = "name" },
        { text = "Farewell, Tharm.", next = "END" },
      },
    },
    harpy = {
      lines = { { id = "ha_default", text = "The Windshear harpies have tried to bring down a rider twice this season. Both times the rider brought down the harpy, and both times I had to wash the feathers out of its teeth." } },
      choices = {
        { text = "The harpies should be driven out.", next = "harpy_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpy_stance = {
      big = true,
      lines = { { id = "hs_default", text = "Maggran says the same, and sends young braves up the cliffs to do it. I am less sure; the harpies nested here before the tauren came, and a flyer understands wanting the high places." } },
      choices = {
        { text = "They raid and kill. Drive them out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Share the sky, if they'll let you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "The elders say An'she kissed this mountain long ago, and that the spirit world lies closer here than anywhere in the Stonetalon. Tauren once came to Sun Rock to cross over in their rites, and some still do." } },
      choices = {
        { text = "Have you ever crossed over?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The winds, the roosts, and the peaks. A rider learns little else, but he learns those well." } },
    advice = { { id = "tp_ad", text = "Do not pull on the harness. The rider knows the way better than you do." } },
    _none = { { id = "tp_none", text = "That is not something the winds have told me about." } },
  },
}

---------------------------------------------------------------------------
-- Gereck
---------------------------------------------------------------------------
P:NPC {
  key = "gereck", id = TODO_NPC("Gereck"), name = "Gereck",
  title = "Stable Master",
  bible = "bibles/stonetalon_folk.md", role = "stablemaster", tier = "service",
  communities = { "sun_rock" }, temper = { "gruff", "fond" }, values = { "beasts", "work" },
  notices = { "class" },

  impression = {
    first = "Gereck is an old orc with a wolf-bitten ear and a voice like gravel in a bucket. He is gentler with the animals in his pens than with anyone who walks on two legs.",
    third = "{name} met Gereck, the gruff orc stable master of Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_hello", text = "If you've got a beast, I'll keep it fed. If you've got questions, I'll keep it short." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good; you lot are the only ones who come here who actually know what a stable's for." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gereck. I keep the pens at Sun Rock, and I keep them clean, which is more than I can say for half the beasts in them." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Bring {pet} here if you need to swap it out. I'll see it fed and brushed, and I won't let the tauren children feed it sweetgrass." },
      },
      again = { { id = "h_again", text = "Something else? The beasts are waiting on their supper." } },
      choices = {
        { text = "I need to stable my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's the strangest beast you've kept?", next = "strange" },
        { text = "How did you lose part of that ear?", next = "ear" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A hunter brought me a thunder lizard calf once and swore it wouldn't grow. It grew, and it ate a fence, and then it ate the hunter's tent with the hunter still asleep in it." } },
      choices = {
        { text = "Was the hunter all right?", next = "strange_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_end = {
      lines = { { id = "se_default", text = "He was fine, just wet and very quiet for a week. The lizard was fine too; it didn't care for the taste of canvas and spat him out." } },
      choices = {
        { text = "That's a fine story, Gereck.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ear = {
      big = true,
      lines = { { id = "ea_default", text = "A wolf in the internment camps, when the humans kept us penned like beasts ourselves. I had to break that wolf before I could break out of there, and I've never been proud of how I did it." } },
      choices = {
        { text = "You did what you had to. Freedom comes first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A beast deserves better, even in a cage.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Wolves, kodo, cats and the fools who ride them. Ask." } },
    advice = { { id = "tp_ad", text = "Feed your beast before you feed yourself. It'll remember." } },
    _none = { { id = "tp_none", text = "Don't know. Ask somebody who doesn't smell of the pens." } },
  },
}

---------------------------------------------------------------------------
-- Jeeda
---------------------------------------------------------------------------
P:NPC {
  key = "jeeda", id = TODO_NPC("Jeeda"), name = "Jeeda",
  title = "Apprentice Witch Doctor",
  bible = "bibles/stonetalon_folk.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "eager", "sharp" }, values = { "learning", "craft" },
  notices = { "class" },

  impression = {
    first = "Jeeda is a young orc woman with ash on her fingers and too many pouches on her belt. She wants very badly to be taken seriously and talks fast to make sure she is.",
    third = "{name} met Jeeda, an orc apprentice witch doctor who sells reagents at Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_hello", text = "Reagents, powders, a few things for the careful! Don't sniff the jars, please, I mean it." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You'll want the powders on the left. No, the other left, the ones that don't explode." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Jeeda, and I'm the apprentice witch doctor of Sun Rock, which means I sell the reagents and grind the powders and wait for somebody to teach me the interesting parts." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "SHAMAN", "WARLOCK", "DRUID" } }, text = "A caster! Then you'll know what you need better than I do, but I'll tell you anyway which jars are freshest, because that's half my job." },
      },
      again = { { id = "h_again", text = "What else? I've time, if you've coin, and even a little if you haven't." } },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Who are you an apprentice to?", next = "master" },
        { text = "What are the interesting parts?", next = "interesting" },
        { text = "Farewell, Jeeda.", next = "END" },
      },
    },
    master = {
      lines = { { id = "ma_default", text = "Nobody, properly, and that's my problem. I've asked Witch Doctor Jin'Zil down at Malaka'jin three times, and three times he laughed and sent me to fetch something horrible from the Webwinder." } },
      choices = {
        { text = "Maybe the fetching is the lesson.", next = "master_lesson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_lesson = {
      big = true,
      lines = { { id = "ml_default", text = "That's what Jayka at the inn says too, and I hate it when she's right. But I'm not waiting forever; there are books in Orgrimmar, and I can read." } },
      choices = {
        { text = "Wait for Jin'Zil. A master's teaching is worth it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Don't wait. Teach yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    interesting = {
      lines = { { id = "in_default", text = "Talking to the spirits, binding a hex, reading bones without guessing. I can grind a powder so fine it floats, but nobody pays an apprentice to make dust that floats." } },
      choices = {
        { text = "You'll get there.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Reagents, mostly, and a little about everything else, in bits." } },
    advice = { { id = "tp_ad", text = "Keep your powders dry. The mountain fog gets into everything." } },
    _none = { { id = "tp_none", text = "I don't know that one, but I'd like to. Tell me if you find out?" } },
  },
}
