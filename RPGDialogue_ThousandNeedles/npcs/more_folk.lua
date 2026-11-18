-- More of Thousand Needles: Myriam Moonsinger, the night elf watching the Razorfen Downs from a hill
-- outside its gate (A Host of Evil). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "myriam", id = TODO_NPC("Myriam Moonsinger"), name = "Myriam Moonsinger",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = {}, temper = { "watchful", "grave" }, values = { "duty", "balance" },
  notices = { "race", "class" },
  impression = {
    first = "Myriam Moonsinger keeps watch on a hill outside the Razorfen Downs, studying the quilboar and the cold stranger they have begun to worship. She is calm and careful, and certain the Scourge has reached the Barrens' edge.",
    third = "{name} met Myriam Moonsinger, a night elf watching the Razorfen Downs for signs of the Scourge.",
  },
  greetings = {
    { id = "g_hi", text = "Keep your voice low. The quilboar below have sharp ears, and sharper spears." },
    { id = "g_back", when = { metBefore = true }, text = "You came back up the hill. Good; I have been alone with what I've seen for too long." },
    { id = "g_host", when = { questActive = TODO_QUEST("A Host of Evil") }, text = "How goes the hunt? Every one of them you put down is one fewer kneeling to that diplomat." },
    { id = "g_hostdone", when = { questDone = TODO_QUEST("A Host of Evil") }, text = "The camps below are thinner since you went among them. I will keep watching, but I watch with more hope now." },
  },
  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, {g:brother|sister}. It is good to see one of our own this far from Ashenvale, though I wish it were somewhere kinder." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. You will understand better than most what I fear is growing down there, and you will not like it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. If what I suspect is true, your prayers will be needed below more than anywhere else in Kalimdor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Myriam Moonsinger. I came to study the quilboar of the Razorfen, but what I found below this hill is something far older and colder than any quilboar." },
        { id = "h_host", when = { questActive = TODO_QUEST("A Host of Evil") }, text = "The battleguards, the thornweavers and the cultists of the Death's Head grow in number every day. I cannot fight them alone, but with your help we may thin their ranks before they spill out into the Needles." },
        { id = "h_hostdone", when = { questDone = TODO_QUEST("A Host of Evil") }, text = "Thank you again for your hunting. If you seek greater danger, gather friends and go into the great maw below; you will find the source of this sickness inside." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak quietly." },
        { id = "h_again2", text = "Ask. I will keep one eye on the camps while I answer." },
      },
      choices = {
        { text = "What did you find below?", next = "found" },
        { text = "Who is this diplomat you mentioned?", next = "diplomat" },
        { text = "A night elf alone this far south is unusual.", next = "alone" },
        { text = "I know the Scourge well. I was one of them.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    found = {
      lines = { { id = "fo_default", text = "The quilboar have always been a fierce people, but these are something else. Some of them now walk with the stiff gait of the dead, and the Death's Head cultists burn strange fires in the camps at night." } },
      choices = {
        { text = "The Death's Head?", next = "found_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_cult = {
      lines = { { id = "fc_default", text = "Quilboar who have turned from their old gods to a new master. They come to him daily, almost begging for more power, and he grants them undeath as if it were a gift." } },
      choices = {
        { text = "Then they must be stopped.", next = "found_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_stop = {
      big = true,
      lines = { { id = "fs_default", text = "They must, and I am not strong enough to do it alone. Would you hunt them with me, or at least for me, while I keep watch here?" } },
      choices = {
        { text = "I'll hunt them. This sickness can't spread.", next = "BACK", reply = "Then Elune guide your arrows and your blade. Return when it is done.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the quilboar rot. It's not my fight.", next = "BACK", reply = "It will be your fight, when they come out of the Downs and into your lands. I hope you are ready then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat = {
      lines = { { id = "di_default", text = "That is what the quilboar call him, an envoy from far away who came to their thorny halls bearing gifts of cold power. The Forsaken do not pass on their condition, from what I have seen, but this one grants undeath to those who ask." } },
      choices = {
        { text = "Then he's one of the Scourge.", next = "diplomat_scourge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_scourge = {
      lines = { { id = "ds_default", text = "I am beginning to think so, and if I am right, the Lich King's reach is longer than any of us feared. The Scourge in Kalimdor was thought broken at Hyjal, and yet here it is, quietly gathering an army out of quilboar." } },
      choices = {
        { text = "Someone must warn the Sentinels.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "al_default", text = "It is, and I would rather have companions, but the Sentinels have their hands full in Ashenvale. A scholar can go where a warband cannot, and quilboar pay little mind to a single figure sitting very still on a hill." },
        { id = "al_horde", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } }, text = "It is, and I will admit I did not expect to share my hill with the Horde. But the Scourge is everyone's enemy, so sit, and we will speak of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "fk_default", text = "Then tell me, since you know it better than I ever will: does the diplomat's gift look to you like the Plague that made your people? I would trust your eyes in this more than my own." } },
      choices = {
        { text = "It's the same chill. You're right to fear it.", next = "BACK", reply = "Then I was not imagining it. Thank you; that helps more than you know.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Undeath is no gift, but you overrate it.", next = "BACK", reply = "Perhaps, but I would rather fear it too much than too little. I will keep watching.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I study the creatures of Kalimdor, and lately I study the things that are killing them." } },
    razorfen_downs = { { id = "tp_rfd", text = "The great maw below is the way in. I have not gone inside, and I do not plan to without many friends." } },
    _none = { { id = "tp_none", text = "I cannot say. My attention has been on the Downs for many weeks now." } },
  },
}

---------------------------------------------------------------------------
-- Elu: wind rider apprentice at Freewind Post. Classic: Wind Rider.
---------------------------------------------------------------------------
P:NPC {
  key = "elu", id = TODO_NPC("Elu"), name = "Elu", title = "Wind Rider Apprentice",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "freewind" }, temper = { "eager", "anxious" }, values = { "duty", "ambition" },
  notices = { "class", "kit", "race" },
  impression = {
    first = "Elu is the wind rider apprentice at Freewind Post, and he has not yet been allowed to fly. He talks about wyverns with a longing that is almost painful, and he flinched when one of Nyse's riders snapped at him.",
    third = "{name} met Elu, the wind rider apprentice at Freewind Post, who longs to begin his training.",
  },
  greetings = {
    { id = "g_hi", text = "Oh! You came up the lift. Did you see the riders from below? They look best from below, with the sun behind them." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Nyse still has not let me fly, in case you were wondering, and I know you were not." },
    { id = "g_eggs", when = { questActive = TODO_QUEST("Wind Rider") }, text = "Have you been to Highperch yet? Please mind the mothers; they are only guarding their young, and they are very good at it." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, and I am still on the ground. I have swept this platform so many times that it shines." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You came up from Mulgore, did you not? I did too, two summers ago, and I have been promising my mother ever since that I will fly home." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You understand beasts, then. Would you tell me, honestly, whether a wyvern can smell that someone is nervous?" },
    { id = "n_weary", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look as though you fell most of the way here. The wind riders would have been quicker, and I say that as someone who is not allowed on one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Elu, apprentice to the wind rider master, which so far has meant carrying meat and sweeping. I am to recruit new wyverns for the masters, and I cannot leave the post to do it." },
        { id = "h_active", when = { questActive = TODO_QUEST("Wind Rider") }, text = "The Highperch wyverns nest on the tall spires to the west. Bring me their eggs, and we can raise the hatchlings here as wind riders, and I may at last be given one to train." },
        { id = "h_done", when = { questDone = TODO_QUEST("Wind Rider") }, text = "The eggs you brought are warm in the straw, and one of them moved this morning. Nyse says the first to hatch may be mine, if I do not drop it." },
      },
      again = {
        { id = "h_again", text = "What else? I have nothing to do but sweep." },
        { id = "h_again2", text = "Ask me anything, I am glad of the company." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "What does a wind rider apprentice do?", next = "work" },
        { text = "Why eggs, and not grown wyverns?", next = "eggs" },
        { text = "You seem anxious to begin.", next = "anxious" },
        { text = "Who else keeps Freewind Post?", next = "post" },
        { text = "I'll go to Highperch for you.", next = "highperch", when = { questActive = TODO_QUEST("Wind Rider") } },
        { text = "A beast knows fear. I can tell you how to hide it.", next = "fear", when = { class = "HUNTER" } },
        { text = "Mulgore will see you fly home yet.", next = "home", when = { race = "Tauren" } },
        { text = "Clear skies, Elu.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "work_d", text = "I feed them, I clean their roosts, and I check every strap of every harness before a flight. Nyse says an apprentice must know a wyvern from the ground up before he is trusted on its back." },
      },
      choices = {
        { text = "That sounds like sense.", next = "work_sense" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_sense = {
      big = true,
      lines = {
        { id = "work_sense_d", text = "It is, and I know it is, and I still watch every rider take off with my heart in my mouth. I have learned which wyvern favours its left wing and which one hates the rain, and I have never been higher than this platform." },
      },
      choices = {
        { text = "The ground-work makes the rider. Be patient.", next = "BACK", reply = "That is what Nyse says, in nearly those words. I suppose two of you cannot both be wrong.", fx = { align = { order = 1 } } },
        { text = "Ask her outright. Waiting politely gets you nowhere.", next = "BACK", reply = "Do you think so? I have practised asking, but only to the wyverns, and they are not encouraging.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eggs = {
      lines = {
        { id = "eggs_d", text = "A grown wild wyvern has already decided what it thinks of us, and it does not think much. A hatchling raised by hand takes its rider for kin, and it will fly through a storm for you." },
      },
      choices = {
        { text = "Doesn't it trouble you, taking them?", next = "eggs_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eggs_trouble = {
      lines = {
        { id = "eggs_trouble_d", text = "It does, more than I admit to Nyse. But the Galak centaur and the Grimtotem take those eggs too, and not to raise them, so I tell myself that ours are the lucky ones." },
      },
      choices = {
        { text = "They are. Here they'll be cared for.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "That's a comfortable story for a nest robber.", next = "BACK", reply = "I know. I have thought so myself, on the nights when the wild ones call from the west.", fx = { trait = { stern = 1 } } },
      },
    },
    anxious = {
      lines = {
        { id = "anxious_d", text = "Is it so plain? Every wind rider master began as someone's apprentice, and I am afraid that I will be the one who stays an apprentice until his mane goes grey." },
      },
      choices = {
        { text = "What would it take for Nyse to trust you?", next = "anxious_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anxious_trust = {
      lines = {
        { id = "anxious_trust_d", text = "New wyverns for the post, raised properly, by me. If I can bring a hatchling from the egg to its first flight, she cannot say I do not know them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "post_d", text = "Cliffwatcher Longhorn leads us, and Nyse is the wind rider master, and Awenasa keeps the stable beside our roost. Innkeeper Abeqwa lets me eat at her fire for nothing, because she says I look underfed." },
      },
      choices = {
        { text = "And the hunters?", next = "post_hunters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_hunters = {
      lines = {
        { id = "post_hunters_d", text = "Hagar Lightninghoof and Rau Cliffrunner are always sending braves down the lift after something. Thalia Amberhide wants pelts, and Rau wants Grimtotem heads, and I would rather sweep than do either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    highperch = {
      lines = {
        { id = "highperch_d", text = "Then go west along the canyon floor until you see spires with nests on top and bones underneath. Take the eggs from the lower nests, where the mothers are away hunting, and please come back with all your fingers." },
      },
      choices = {
        { text = "I'll bring your eggs, Elu.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = {
        { id = "fear_d", text = "Would you? Nyse only says to stop being afraid, which is not advice. Tell me, and I will try it on old Stormfeather tonight." },
      },
      choices = {
        { text = "Breathe slowly, and don't look it in the eye.", next = "BACK", reply = "Slowly, and not in the eye. I can do that. I think I can do that.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_d", text = "Do you think so? I picture it sometimes, coming in low over Stonebull Lake with half the village pointing. I had better learn to land first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came up from Mulgore to learn the wind riders, and so far I have learned the broom. I am told it is the same for everyone." } },
    advice = { { id = "tp_ad", text = "Never walk up behind a wyvern while it is eating. I know this in a way I would rather not explain." } },
    _none = { { id = "tp_none", text = "I do not know, I am sorry. Cliffwatcher Longhorn would, he knows everything that happens on the mesa." } },
  },
}

---------------------------------------------------------------------------
-- Wizlo Bearingshiner: goblin tinker at Whitereach Post. Classic: Hypercapacitor Gizmo, A Dip in the Moonwell, Testing the Tonic.
---------------------------------------------------------------------------
P:NPC {
  key = "wizlo", id = TODO_NPC("Wizlo Bearingshiner"), name = "Wizlo Bearingshiner",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "excitable", "mercenary" }, values = { "invention", "profit" },
  notices = { "craft", "race" },
  impression = {
    first = "Wizlo Bearingshiner is a goblin tinker camped among the tauren at Whitereach Post, brewing a tonic he will not describe and building a machine to fetch its ingredients. He priced my help before I had offered it.",
    third = "{name} met Wizlo Bearingshiner, a goblin tinker working at Whitereach Post.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, hey, perfect timing, pal! I got a business proposition that needs somebody with two legs and no fear of large cats." },
    { id = "g_back", when = { metBefore = true }, text = "There's my favourite subcontractor! Tell me ya didn't come back empty-handed, because my overhead is killin' me." },
    { id = "g_gizmo", when = { questActive = TODO_QUEST("Hypercapacitor Gizmo") }, text = "The gizmo's in that cage with the panther, friend, right where I told ya. The cat's a liability, sure, but I already priced that in." },
    { id = "g_away", when = { away = 14 }, text = "{away}! Do ya know what {away} of delay costs in interest? No, don't answer, it'd only upset us both." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Whoa, whoa, is that grease under your nails? A fellow professional! Don't touch anything, I ain't insured for colleagues." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the big guys! No offence, pal, your people are swell hosts, but not one of 'em will lend me a kodo to test a theory on." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, huh? Your witch doctors and me are in the same line, friend, bottles and bubbling, only I keep receipts." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wizlo Bearingshiner, tinker, tonic-maker and sole proprietor. The tauren here let me set up shop on account of I'm quiet, which I ain't, but they're too polite to say so." },
        { id = "h_moon", when = { questActive = TODO_QUEST("A Dip in the Moonwell") }, text = "Here's the deal: my tonic wants moonwell water, and the nearest moonwell is at Thalanaar, with night elves sittin' all round it. So I built a little fella to go dip for it, and you get to carry him." },
        { id = "h_tonic", when = { questActive = TODO_QUEST("Testing the Tonic") }, text = "She's bottled, pal, and she ain't exploded yet, which in my trade is what we call a success. All I need now is a volunteer with a strong stomach." },
      },
      again = {
        { id = "h_again", text = "What else, chum? Clock's runnin', but go ahead." },
        { id = "h_again2", text = "Ask away, I can talk and solder." },
        { id = "h_again3", text = "Yeah?" },
      },
      choices = {
        { text = "What exactly is this tonic?", next = "tonic" },
        { text = "How did a goblin end up among the tauren?", next = "camp" },
        { text = "Why not fetch the moonwell water yourself?", next = "well" },
        { text = "What's a hypercapacitor gizmo doing in a panther cage?", next = "gizmo" },
        { text = "I know machines. Tell me how your robot works.", next = "robot", when = { profession = "Engineering" } },
        { text = "Night elves won't mind one of their own at the well.", next = "nelf", when = { race = "NightElf" } },
        { text = "Later, Wizlo.", next = "END" },
      },
    },
    tonic = {
      lines = {
        { id = "tonic_d", text = "A restorative, pal, the kind that puts the spring back in a tired adventurer, and I got the formula from a very reliable fella in Gadgetzan who has since left town. It needs water with some real kick in it, and nothin' kicks like a moonwell." },
      },
      choices = {
        { text = "Has anyone drunk it yet?", next = "tonic_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tonic_test = {
      lines = {
        { id = "tonic_test_d", text = "Not as such, no. I tried a drop on a scorpid and it ran clean up the canyon wall, which could mean anythin', so I'm lookin' for a tester who can tell me how it felt afterward." },
      },
      choices = {
        { text = "Find another fool. I'm no test animal.", next = "BACK", reply = "Hey, no pressure, friend! I'll put ya down as a maybe, at a slightly lower rate.", fx = { trait = { cautious = 1 } } },
        { text = "If it's safe for a scorpid, I'll risk it.", next = "BACK", reply = "That's the spirit! Sign nothin', admit nothin', and we'll get along great.", fx = { trait = { brave = 1 }, affinity = 1 } },
      },
    },
    camp = {
      lines = {
        { id = "camp_d", text = "Cheap rent, mostly. Motega Firemane lets me stay so long as nothin' of mine catches fire near his totems, and Kanati Greycloud keeps an eye on me, which I choose to take as friendly." },
      },
      choices = {
        { text = "And the tauren don't mind the noise?", next = "camp_noise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_noise = {
      lines = {
        { id = "camp_noise_d", text = "They mind it very quietly, pal, which is the best kind of mindin'. Laer Stepperunner brings me supper and asks if the machine has feelings, and I ain't had the heart to tell him it barely has gears." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    well = {
      lines = {
        { id = "well_d", text = "On account of the sentinels at Thalanaar shoot goblins on sight, friend, and Horde folk a little slower. A machine walks in, dips, and walks out, and nobody's diplomatic relations get any worse." },
      },
      choices = {
        { text = "You're stealing from a sacred well.", next = "well_sacred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_sacred = {
      big = true,
      lines = {
        { id = "well_sacred_d", text = "I'm borrowin' a cupful, pal! It refills itself, that's the whole point of a well. Where I come from, a resource that renews for free and nobody's sellin' is what we call an oversight." },
      },
      choices = {
        { text = "It's a cup of water. No harm in it.", next = "BACK", reply = "See, you get it! A reasonable person. I'll remember that when the profits come in, and I'll feel real warm about it.", fx = { align = { order = -1 } } },
        { text = "It's holy to them. You should have asked.", next = "BACK", reply = "Asked the folks with the bows? Sure, pal, I'll send a letter. Meanwhile the robot's wound up and my creditors ain't the patient kind.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gizmo = {
      lines = {
        { id = "gizmo_d", text = "Long story, short version: I had a supplier, the supplier had a disagreement with the Galak centaur, and now my hypercapacitor's sittin' in a cage with a very annoyed cat. Open the cage, deal with the cat, bring me the gizmo." },
      },
      choices = {
        { text = "And the panther?", next = "gizmo_cat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gizmo_cat = {
      lines = {
        { id = "gizmo_cat_d", text = "The panther ain't in the contract, friend. Fight it, free it, feed it a centaur, whatever lets ya sleep, so long as my gizmo comes back without tooth marks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    robot = {
      lines = {
        { id = "robot_d", text = "Clockwork drive, hypercapacitor for the juice, and a dipper arm I took off a busted shredder. He walks in a straight line and he can't turn left, so ya gotta point him real careful." },
      },
      choices = {
        { text = "Can't turn left? I could fix that.", next = "BACK", reply = "Yeah? Well, don't. Every fix I make to him breaks two other things, and I'm runnin' out of things.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nelf = {
      lines = {
        { id = "nelf_d", text = "An elf, here? Friend, I don't know how ya got this far without bein' stepped on, but if you can stroll up to that well and fill a flask, I'll cut ya in for two percent. That's gross, not net." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm outta Ratchet, by way of Gadgetzan, by way of some places that asked me not to come back. The tauren ain't asked yet." } },
    advice = { { id = "tp_ad", text = "Never test a prototype on yourself, pal. That's what partners are for." } },
    _none = { { id = "tp_none", text = "Not my department, friend. Ask one of the big guys, they know the canyon." } },
  },
}

---------------------------------------------------------------------------
-- Moktar Krin: orc at Ironstone Camp. Classic: The Swarm Grows.
---------------------------------------------------------------------------
P:NPC {
  key = "moktar", id = TODO_NPC("Moktar Krin"), name = "Moktar Krin",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "grim", "watchful" }, values = { "duty", "vigilance" },
  notices = { "class", "race" },
  impression = {
    first = "Moktar Krin holds Ironstone Camp with a handful of orcs and watches the Rustmaul dig as if it might hatch. He led the raid that drove the dwarves out of it, and he is not proud of what they left.",
    third = "{name} met Moktar Krin, the orc who watches the silithid from Ironstone Camp.",
  },
  greetings = {
    { id = "g_hi", text = "Lok'tar. If Belgrom sent you, speak quickly; if he did not, tell me why you are standing in my camp." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Good. The swarm has not waited for you, and neither have I." },
    { id = "g_swarm", when = { questActive = TODO_QUEST("The Swarm Grows") }, text = "The dig is south-east of here, on the edge of the flats. Kill what crawls out of it, and bring me pieces to send to Orgrimmar." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you stood here. I have counted new tunnels every one of those days." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Then I need not explain what it means to hold a post nobody thanks you for." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry that weapon as though you have used it. Good, because the things in the dig do not die easily." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in my camp. Your kin dug that hole and ran from what was in it, so you may guess how welcome you are." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Moktar Krin. Belgrom Rockmaul sent me to drive the dwarves from their dig, and I did. Now I sit here watching what they woke, and I like it less each day." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Swarm Grows") }, text = "The insects are called silithid. They breed in the Rustmaul Dig Site, and there are more each week. Thin them, and bring me their carapaces as proof for Belgrom." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Swarm Grows") }, text = "Belgrom has your proof, and he knows now that I was not seeing shadows. You did the Horde a service that few will ever hear of." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Ask. I am watching the ridge, not ignoring you." },
        { id = "h_again3", text = "Speak." },
      },
      choices = {
        { text = "What are the silithid?", next = "silithid" },
        { text = "Tell me about the raid on the dwarves.", next = "raid" },
        { text = "Why keep a camp here at all?", next = "camp" },
        { text = "Korran in the Barrens spoke of you.", next = "korran" },
        { text = "Orgrimmar should send you more blades.", next = "blades", when = { race = "Orc" } },
        { text = "I've seen insects like these in Tanaris.", next = "tanaris", when = { minLevel = 40 } },
        { text = "Strength and honour, Moktar.", next = "END" },
      },
    },
    silithid = {
      lines = {
        { id = "silithid_d", text = "Insects the size of wolves, and some larger, that tunnel through rock as if it were sand. They do not fight like beasts; they fight like a warband, each one knowing where the others are." },
      },
      choices = {
        { text = "Where did they come from?", next = "silithid_from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid_from = {
      lines = {
        { id = "silithid_from_d", text = "From under the dig. The dwarves broke into something while hunting for their relics, and the swarm came up through the breach. Whether there is one nest or a hundred below, I cannot tell you." },
      },
      choices = {
        { text = "What does Belgrom make of it?", next = "silithid_belgrom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid_belgrom = {
      lines = {
        { id = "silithid_belgrom_d", text = "He wants proof before he troubles the Warchief, and he is right to. An orc who cries alarm over insects had better be holding one when he does it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    raid = {
      lines = {
        { id = "raid_d", text = "It was a short fight. The Explorers' League had diggers, not soldiers, and they broke when we came over the ridge. I thought it a clean victory until I saw why half of them were already running." },
      },
      choices = {
        { text = "Do you regret the raid?", next = "raid_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_regret = {
      big = true,
      lines = {
        { id = "raid_regret_d", text = "I regret nothing I was ordered to do. But I will say this to you and not to Belgrom: the dwarves were holding that hole shut, badly, and we killed the only ones who were trying." },
      },
      choices = {
        { text = "You followed orders. The fault isn't yours.", next = "BACK", reply = "So I tell myself. An orc who questions every order is no soldier, and I am a soldier.", fx = { align = { order = 1 } } },
        { text = "Then you owe it to them to finish their work.", next = "BACK", reply = "Hm. That is a strange debt for an orc to owe a dwarf. I will think on it while I watch.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "camp_d", text = "Because someone must count them. If the swarm spreads onto the Shimmering Flats or north toward the Barrens, the Horde must hear of it from an orc who saw, and not from a goblin racer's rumour." },
      },
      choices = {
        { text = "A lonely watch.", next = "camp_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_lonely = {
      lines = {
        { id = "camp_lonely_d", text = "It is a watch, and somebody must stand it. The tauren at Freewind send water and ask no questions, and that is all the company I need." },
      },
      choices = {
        { text = "The Horde is lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    korran = {
      lines = {
        { id = "korran_d", text = "Korran is a good messenger and a worrier. He carries my reports to the Crossroads and thinks I do not know that he adds his own alarm to them, and I let him, because for once the alarm is deserved." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    blades = {
      lines = {
        { id = "blades_d", text = "They should, and they will not until the thing is bigger. That is how it was with the centaur and how it will be with this, so I do not waste my breath asking." },
      },
      choices = {
        { text = "Then I'll be one more blade while I'm here.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tanaris = {
      lines = {
        { id = "tanaris_d", text = "Have you? Then it is not one hole in one canyon, and Belgrom must hear that as well. Tell me where, exactly, and I will put it in the next report under your name." },
      },
      choices = {
        { text = "South of Gadgetzan, in the open desert.", next = "BACK", reply = "South of Gadgetzan. Then they are under half of Kalimdor already, and we are counting ants at the doorstep.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served under Belgrom Rockmaul before this, and I serve under him still. There is nothing else worth telling." } },
    advice = { { id = "tp_ad", text = "Do not fight them in their tunnels. Draw them out onto open ground, where you can see how many there are." } },
    _none = { { id = "tp_none", text = "I do not know, and it is not my post to know. Ask at Freewind." } },
  },
}

---------------------------------------------------------------------------
-- Montarr: lorekeeper and reagent vendor at Freewind Post.
---------------------------------------------------------------------------
P:NPC {
  key = "montarr", id = TODO_NPC("Montarr"), name = "Montarr", title = "Lorekeeper",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "freewind" }, temper = { "thoughtful", "dry" }, values = { "memory", "tribe" },
  notices = { "class", "race" },
  impression = {
    first = "Montarr is the lorekeeper of Freewind Post, and he sells reagents from the same mat where he keeps the stories of the mesas. He answered one question with a tale and the next with a price.",
    third = "{name} met Montarr, lorekeeper and reagent seller at Freewind Post.",
  },
  greetings = {
    { id = "g_hi", text = "Sit, if you have come for a story, and stand, if you have come for reagents. I have both, and the reagents are quicker." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Did you want the rest of the tale, or have you run out of ankhs?" },
    { id = "g_away", when = { away = 14 }, text = "{away} have gone by. I have kept your place in the story." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You will want ankhs and you will want to argue with me about the spirits, and I am ready for both." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You are of the tribes. Then some of what I keep belongs to you already, and you have only forgotten it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, this far from Moonglade. The elders say that path is the oldest one we have, and the one we lost for longest." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Montarr, lorekeeper of Freewind. I remember what happened among these spires so that the braves need not, and I sell reagents because remembering does not fill a bowl." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Montarr. Our people walked this canyon long before we raised a post above it, young one, and I can tell you which spires your ancestors camped beneath." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Montarr. The orcs keep their history in songs of battle, and we keep ours in the land itself, so you may find my stories slow. They are meant to be." },
      },
      again = {
        { id = "h_again", text = "What else would you hear?" },
        { id = "h_again2", text = "Ask. I have a long memory and a short day." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "What does a lorekeeper keep?", next = "keep" },
        { text = "Why build a post on top of a mesa?", next = "mesa" },
        { text = "Tell me about the Grimtotem here.", next = "grim" },
        { text = "What do the spirits of this canyon say?", next = "spirits", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "Which spire did my ancestors camp beneath?", next = "ancestors", when = { race = "Tauren" } },
        { text = "Tell me one of your stories.", next = "stories" },
        { text = "Keep the stories well, Montarr.", next = "END" },
      },
    },
    keep = {
      lines = {
        { id = "keep_d", text = "Names, mostly, and where each one was last spoken. Who led which herd through here, who was lost to the Galak, and which mesa the tribes held longest before the centaur came up after them." },
      },
      choices = {
        { text = "How do you remember it all?", next = "keep_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_how = {
      lines = {
        { id = "keep_how_d", text = "I walk the rim of the post each morning and say it aloud, spire by spire. Innkeeper Abeqwa says I frighten her guests, and I tell her the guests could stand to learn something." },
      },
      choices = {
        { text = "May I walk the rim with you?", next = "BACK", reply = "At dawn, then, and bring water. It is a long telling.", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa = {
      lines = {
        { id = "mesa_d", text = "Because nothing with four hooves can climb it. The centaur ruled the canyon floor for generations, and the tribes learned that the only safe ground in Thousand Needles was the ground the Galak could not reach." },
      },
      choices = {
        { text = "And now there are lifts.", next = "mesa_lifts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa_lifts = {
      lines = {
        { id = "mesa_lifts_d", text = "And now there are lifts, yes, which the old ones would have thought madness. Cliffwatcher Longhorn has them guarded day and night, because a way up for us is a way up for anyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grim = {
      lines = {
        { id = "grim_d", text = "They hold Darkcloud Pinnacle to the north-west, and they are tauren, which the young braves find hard to hold in their heads. Magatha's tribe answers to nobody but her, and what they want with this canyon they have not said." },
      },
      choices = {
        { text = "Rau Cliffrunner wants them killed.", next = "grim_rau" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grim_rau = {
      big = true,
      lines = {
        { id = "grim_rau_d", text = "Rau has lost friends to them, and I do not fault him. I only remember that every tribe of ours was called an enemy by some other tribe once, and that Cairne ended that by talking." },
      },
      choices = {
        { text = "Cairne's way is right. They're still tauren.", next = "BACK", reply = "That is what I keep, among all the other things. I am glad someone else carries it too.", fx = { align = { light = 1 } } },
        { text = "They chose to be enemies. Rau has the right of it.", next = "BACK", reply = "Perhaps he has. A lorekeeper remembers too much to be sure of anything, and that is not always a strength.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = {
        { id = "spirits_d", text = "That they are thirsty. This was a sea once, the old tales say, and the wind in the spires still sounds like water to those who listen. Tell me whether you hear it, when you go down." },
      },
      choices = {
        { text = "I'll listen for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ancestors = {
      lines = {
        { id = "ancestors_d", text = "If you are of the plains tribes, most likely beneath the twin spires east of the Great Lift, where there was once a spring. It is dry now, but the fire rings are still there under the dust." },
      },
      choices = {
        { text = "I'll look for the fire rings.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stories = {
      lines = {
        { id = "stories_d", text = "Then I will give you a short one. A calf once asked why the needles stand so far apart, and her grandmother said they were a herd that quarrelled, and the Earth Mother turned them to stone where they stood, facing away." },
      },
      choices = {
        { text = "A warning to the tribes, then.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was taught by the lorekeeper before me, and she by the one before her. It is a long rope, and I am only the latest knot." } },
    advice = { { id = "tp_ad", text = "Ask the old ones while they are still here to be asked. I have never met anyone who regretted listening too soon." } },
    _none = { { id = "tp_none", text = "That is not among the things I keep. Cliffwatcher Longhorn may know, for he keeps the present as I keep the past." } },
  },
}

---------------------------------------------------------------------------
-- Starn: gunsmith and bowyer at Freewind Post.
---------------------------------------------------------------------------
P:NPC {
  key = "starn", id = TODO_NPC("Starn"), name = "Starn", title = "Gunsmith & Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "freewind" }, temper = { "terse", "exact" }, values = { "craft", "hunt" },
  notices = { "class", "craft", "race" },
  impression = {
    first = "Starn makes bows and sells guns at Freewind Post, and sights along every shaft before he lets it go. He is a tauren of few words, most of them about wind.",
    third = "{name} met Starn, the gunsmith and bowyer of Freewind Post.",
  },
  greetings = {
    { id = "g_hi", text = "Bow or gun? Decide before you answer, because I will ask you why." },
    { id = "g_back", when = { metBefore = true }, text = "You again. How did it shoot?" },
    { id = "g_away", when = { away = 14 }, text = "{away}. Your string will have stretched; let me see it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Draw for me once, empty, so I can see your shoulder. I do not sell blind." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You are of the tribes. Then you want a bow, whatever the orcs have told you about powder." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You have powder burns on your sleeve. You make guns, or you make mistakes; either way we can talk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Starn. I make the bows and I sell the guns, and I will tell you plainly which of those I respect. The wind up here teaches a bowyer everything, if he lives." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Starn, and you are a hunter, so we can leave out the pleasantries. Tell me what you hunt and from how far, and I will tell you what you need." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Starn. Orcs come to me for guns, mostly, and I sell them, and each time I ask them to hold a bow first. One in ten walks away with the bow." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. I am only fletching." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Which do you respect, the bow or the gun?", next = "respect" },
        { text = "How does the mesa wind change a shot?", next = "wind" },
        { text = "Who buys from you at Freewind?", next = "buyers" },
        { text = "Fit me with something for the canyon.", next = "fit", when = { class = "HUNTER" } },
        { text = "I build firearms. What do you think of them?", next = "guns", when = { profession = "Engineering" } },
        { text = "Where do you find bow wood in a canyon?", next = "wood" },
        { text = "Shoot straight, Starn.", next = "END" },
      },
    },
    respect = {
      lines = {
        { id = "respect_d", text = "The bow. A gun is a clever thing, and it kills, but it asks nothing of the one who holds it. A bow must be learned for years, and it tells you every day how much you have left to learn." },
      },
      choices = {
        { text = "Then why sell guns at all?", next = "respect_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    respect_sell = {
      big = true,
      lines = {
        { id = "respect_sell_d", text = "Because the Grimtotem and the Galak do not care how elegantly they are shot. A young brave with a rifle can hold the lift this season, and a young brave with a bow can hold it in five years." },
      },
      choices = {
        { text = "Practical. The post comes before pride.", next = "BACK", reply = "It does. I tell myself so each time I hand one over.", fx = { align = { order = 1 } } },
        { text = "A craftsman shouldn't sell what he doesn't believe in.", next = "BACK", reply = "A fair blow. I have thought it myself, on quiet evenings, and then the centaur come and I stop thinking it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wind = {
      lines = {
        { id = "wind_d", text = "It never blows the same at the top of an arrow's flight as at the bottom. Shoot from the rim to the canyon floor and you pass through three winds, and each one pushes a different way." },
      },
      choices = {
        { text = "How do you teach that?", next = "wind_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wind_teach = {
      lines = {
        { id = "wind_teach_d", text = "I do not. I give them a quiver of blunt arrows and a painted rock on the canyon floor, and I come back at dusk. Those who are still shooting, I teach." },
      },
      choices = {
        { text = "And those who've given up?", next = "BACK", reply = "I sell them a gun.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_d", text = "Rau Cliffrunner's hunters, before they go after the Grimtotem. Thalia Amberhide, who shoots better than any of them and says less about it. Cliffwatcher Longhorn buys for the guards and haggles like a goblin." },
      },
      choices = {
        { text = "Thalia's the best shot here?", next = "buyers_thalia" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_thalia = {
      lines = {
        { id = "buyers_thalia_d", text = "By a hand's breadth at two hundred paces, and she uses a bow I made when I was younger and worse. I have offered her a better one, and she will not part with it." },
      },
      choices = {
        { text = "That's high praise for a bowyer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit = {
      narr = "He watches your elbow, not your face, and nods once.",
      lines = {
        { id = "fit_d", text = "Draw. Again, and hold. You pull a little to the left, so you want a stiffer limb on that side, and a shorter bow than you think, because the canyon is all close corners and sudden drops." },
      },
      choices = {
        { text = "Shorter, and stiffer on the left.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns = {
      lines = {
        { id = "guns_d", text = "They are well made, some of them. I have taken apart a dwarven rifle and admired every piece. I only wish it had cost its owner more than coin to carry it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = {
        { id = "wood_d", text = "None grows here, as you can see. I trade for ash from Feralas and horn from the kodo that die at the Great Lift's foot, and I lay the horn along the belly of the bow, the way my father did." },
      },
      choices = {
        { text = "Horn and ash. An old way of making.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father made bows for the tribe when it wandered. I make them for a post that stays put, and the bows are no different." } },
    advice = { { id = "tp_ad", text = "Unstring your bow at night. A bow kept strung is like a brave kept angry; it wears out early." } },
    _none = { { id = "tp_none", text = "I do not know. I know wind and wood. Ask Longhorn." } },
  },
}

---------------------------------------------------------------------------
-- Jawn Highmesa: general goods vendor at Freewind Post.
---------------------------------------------------------------------------
P:NPC {
  key = "jawn", id = TODO_NPC("Jawn Highmesa"), name = "Jawn Highmesa", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "freewind" }, temper = { "genial", "talkative" }, values = { "hospitality", "community" },
  notices = { "kit", "race" },
  impression = {
    first = "Jawn Highmesa sells general goods at Freewind Post and has counted, he says, every trip the lift has made since it was built. He is cheerful about living on a rock and suspicious of anyone who is not.",
    third = "{name} met Jawn Highmesa, who sells general goods at Freewind Post.",
  },
  greetings = {
    { id = "g_hi", text = "Up the lift and still on your feet! Good. Half my customers need a sit and a drink before they can say what they want." },
    { id = "g_back", when = { metBefore = true }, text = "Back up again, friend? The lift must be getting to know you." },
    { id = "g_away", when = { away = 14 }, text = "{away} down below. I hope you found some shade, because we have none to sell." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A plains tauren, by the way you keep away from the edge. Give it a week, and you will be hanging your washing over it like the rest of us." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, up on the mesa! You will find it dry, friend, after your islands, so buy an extra waterskin and thank me later." },
    { id = "n_weary", cat = "kit", when = { durability = { max = 0.3 } },
      text = "The canyon has been at you, I see. Sit on that crate, it is sturdier than it looks, and tell me what you need replacing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Jawn Highmesa, and everything on this mesa that was not born here came up the lift and across my mat. Rope, water, torches, and news from the canyon floor at no extra charge." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Jawn Highmesa. You will be bound for Whitereach or the Flats, I expect, so let me tell you now that there is no water between here and either, and sell you some." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Jawn Highmesa. We do not see many of the Forsaken up here, friend, and I will say this for you: the heat does not seem to trouble you, which is more than I can say for the orcs." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I am not going anywhere." },
        { id = "h_again2", text = "Ask away, I like the company." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What's it like, living on a rock?", next = "rock" },
        { text = "What news from the canyon floor?", next = "news" },
        { text = "Who keeps you company up here?", next = "folk" },
        { text = "Is the name Highmesa an old one?", next = "name", when = { race = "Tauren" } },
        { text = "What should I carry for the Shimmering Flats?", next = "flats", when = { minLevel = 30 } },
        { text = "How often does the lift run?", next = "lift" },
        { text = "Good day, Jawn.", next = "END" },
      },
    },
    rock = {
      lines = {
        { id = "rock_d", text = "It is the safest home I have ever had, and the smallest. I can walk all the way round it before my tea is cool, and I know which board on the bridge creaks, and I would not trade it for all of Mulgore." },
      },
      choices = {
        { text = "You don't miss open ground?", next = "rock_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rock_miss = {
      big = true,
      lines = {
        { id = "rock_miss_d", text = "I miss grass under my hooves, now and then. Then I look down at the Galak riding in circles below, shaking their spears at a rock they cannot climb, and I feel a good deal better." },
      },
      choices = {
        { text = "Safe up here while others fight below.", next = "BACK", reply = "That stings a little, friend, and I will not say it is unfair. I sell the rope they go down on, if that counts for anything.", fx = { align = { honor = -1 } } },
        { text = "Someone must keep the post supplied. That's worth doing.", next = "BACK", reply = "That is how I see it, and I am glad you do. A brave cannot fight on an empty pack.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = {
        { id = "news_d", text = "The Grimtotem have been seen farther east than usual, and Rau Cliffrunner is in a foul temper over it. The goblins and gnomes on the Shimmering Flats are still racing, and still blowing up, and one of them owes me for forty torches." },
      },
      choices = {
        { text = "And the centaur?", next = "news_centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_centaur = {
      lines = {
        { id = "news_centaur_d", text = "The Galak keep to Splithoof Crag and the canyon floor, as they always have. They tried the lift once, when it was new, and Cliffwatcher Longhorn had the ropes cut while they were halfway up." },
      },
      choices = {
        { text = "A hard answer.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk = {
      lines = {
        { id = "folk_d", text = "Innkeeper Abeqwa, who feeds me, and Turhaw the butcher, who feeds her. Starn makes his bows next to me and says perhaps four words a day, so I say enough for both of us." },
      },
      choices = {
        { text = "And young Elu?", next = "folk_elu" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_elu = {
      lines = {
        { id = "folk_elu_d", text = "The apprentice! That calf has swept the wind rider platform so thin that I can see daylight through it. Nyse will let him fly soon, I think, if only to save the boards." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "name_d", text = "My grandfather took it when the tribe first climbed up here to stay. Before that we were plains folk with a plains name, and he said a family ought to be called after where it means to remain." },
      },
      choices = {
        { text = "And you mean to remain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flats = {
      lines = {
        { id = "flats_d", text = "Water, and then more water, and something to cover your head. Nothing lives out there but basilisks, scorpids and racers, and of the three, the racers are the likeliest to run you down." },
      },
      choices = {
        { text = "Water and a hat. Noted.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lift = {
      lines = {
        { id = "lift_d", text = "Twice a day when it is quiet, and a dozen times when the braves are out. I notch the post by my tent for each one, and I have had to start on a second post." },
      },
      choices = {
        { text = "What will you do when that one's full?", next = "BACK", reply = "Start on a third, and charge visitors a copper to see all three.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born on this mesa, friend, which not many can say. I have been down the lift perhaps ten times, and that was nine too many." } },
    advice = { { id = "tp_ad", text = "Never lean on the lift rail while it is moving. I sell splints, but I would rather not." } },
    _none = { { id = "tp_none", text = "That one has not come up the lift yet, friend. Ask Cliffwatcher Longhorn." } },
  },
}
