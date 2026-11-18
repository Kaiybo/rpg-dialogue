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
    first = "She is certain the Scourge has reached the Barrens' edge.",
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
        { text = "Breathe slowly, and don't look it in the eye.", next = "BACK", reply = "Slowly, and not in the eye; I can do that, or at least I think I can.", fx = { affinity = 1 } },
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
        { text = "It's a cup of water. No harm in it.", next = "BACK", reply = "See, you get it, pal, you're a reasonable person! I'll remember that when the profits come in, and I'll feel real warm about it.", fx = { align = { order = -1 } } },
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
    { id = "g_back", when = { metBefore = true }, text = "You are back, and that is well. The swarm has not waited for you, and neither have I." },
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
    centaur = { { id = "tp_galak", text = "The Galak have ridden this canyon longer than we have held the mesas. They keep no lore that I know of, only grudges, and those they keep well." } },
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
    grimtotem = { { id = "tp_grim", text = "They shoot well, the Grimtotem, and I say that as one who has pulled their arrows out of our guards. They are tauren, after all." } },
    background = { { id = "tp_bg", text = "My father made bows for the tribe when it wandered. I make them for a post that stays put, and the bows are no different." } },
    advice = { { id = "tp_ad", text = "Unstring your bow at night. A bow kept strung is like a brave kept angry; it wears out early." } },
    _none = { { id = "tp_none", text = "I do not know, for I know wind and wood and little else. Ask Longhorn." } },
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
        { id = "rock_d", text = "It is the safest home I have ever had, and the smallest. I can walk all the way round it before my tea has gone cold, and I know which board on the bridge creaks, and I would not trade it for all of Mulgore." },
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
    mirage_raceway = { { id = "tp_race", text = "Goblins and gnomes, driving in circles on the salt and catching fire. I sell them rope and torches, and I do not ask what for." } },
    background = { { id = "tp_bg", text = "I was born on this mesa, friend, which not many can say. I have been down the lift perhaps ten times, and that was nine too many." } },
    advice = { { id = "tp_ad", text = "Never lean on the lift rail while it is moving. I sell splints, but I would rather not." } },
    _none = { { id = "tp_none", text = "That one has not come up the lift yet, friend. Ask Cliffwatcher Longhorn." } },
  },
}

---------------------------------------------------------------------------
-- Laer Stepperunner: food and drink vendor at Whitereach Post.
---------------------------------------------------------------------------
P:NPC {
  key = "laer", id = TODO_NPC("Laer Stepperunner"), name = "Laer Stepperunner", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = {}, temper = { "gentle", "curious" }, values = { "hospitality", "wonder" },
  notices = { "hunger", "race", "craft" },
  impression = {
    first = "Laer Stepperunner sells bread and drink at Whitereach Post, on the canyon floor beneath the needles. He feeds everyone at the post, the goblin included, and he asked me more questions than I asked him.",
    third = "{name} met Laer Stepperunner, who sells food and drink at Whitereach Post.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Whitereach, traveller. You have canyon dust to your knees, so sit, and I will bring you water before you say another word." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back down the canyon! Sit where you sat before, for I have kept the bread warm on the chance of it." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you ate at my fire. Tell me where you have been, and whether the bread there was any good." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You are of the tribes, and far from the green of Mulgore, as I am. The stone here is beautiful, but I do miss grass that is soft underhoof." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You carry tools like the goblin Wizlo's. Perhaps you can tell me something I have been wondering about his machine, if you have a moment." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then tell me honestly whether you can taste that I baked this on a flat stone and not in a proper oven." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Laer Stepperunner. I bake the bread and carry the water for Whitereach Post, and for anybody who comes down the Great Lift with an empty pack, which is nearly everybody." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Laer Stepperunner. Motega Firemane keeps the watch here and I keep the fire, and between the two of us Whitereach is as near to a home as this canyon allows." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "I am Laer Stepperunner, and I sell bread and drink. I would trade you a loaf for an honest answer, though, for you look as if you understand machines." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know, friend?" },
        { id = "h_again2", text = "Ask, and take some more water while you do." },
        { id = "h_again3", text = "Yes, traveller?" },
      },
      choices = {
        { text = "Let me see your food and drink.", next = "BUSINESS" },
        { text = "What sort of place is Whitereach Post?", next = "post" },
        { text = "You share your camp with a goblin.", next = "wizlo" },
        { text = "How do you bake bread in a canyon?", next = "bread" },
        { text = "What should I know about the road ahead?", next = "road" },
        { text = "Does Wizlo's machine have feelings? No.", next = "machine", when = { profession = "Engineering" } },
        { text = "You miss the grass of Mulgore.", next = "grass", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, Laer.", next = "END" },
      },
    },
    post = {
      lines = {
        { id = "post_d", text = "It is a few tents and a fire where the road from the Great Lift turns south, and we are here so that Freewind is not surprised. Motega watches the Grimtotem on Darkcloud Pinnacle, and I watch Motega, who forgets to eat." },
      },
      choices = {
        { text = "Do the Grimtotem trouble you here?", next = "post_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_grim = {
      big = true,
      lines = {
        { id = "post_grim_d", text = "They pass on the road and do not look at us, which troubles me more than a harsh word would. They are tauren as I am, and I have set out bread for them more than once, and it is always there in the morning." },
      },
      choices = {
        { text = "Keep setting it out. One of them may take it.", next = "BACK", reply = "That is my hope, and Motega calls it foolish. I notice he has never told me to stop.", fx = { align = { light = 1 } } },
        { text = "They have chosen their path. Save your bread.", next = "BACK", reply = "You may be right, and Motega would say so. It is only bread, though, and I have plenty.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wizlo = {
      lines = {
        { id = "wizlo_d", text = "Wizlo Bearingshiner, yes. He is very loud and very small, and he works harder than anyone I have known, so I bring him supper, because he would not stop to fetch it himself." },
      },
      choices = {
        { text = "What do you make of his machine?", next = "wizlo_machine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wizlo_machine = {
      lines = {
        { id = "wizlo_machine_d", text = "It walks into the same rock each morning and then stands there, and I cannot help feeling sorry for it. I asked Wizlo whether it minds, and he laughed, but he did not answer, and I have been wondering since." },
      },
      choices = {
        { text = "It's brass and springs, Laer. It can't mind.", next = "BACK", reply = "So I suppose. I shall go on turning it around when he is not looking, all the same.", fx = { trait = { skeptical = 1 } } },
        { text = "Turn it away from the rock, to be safe.", next = "BACK", reply = "I do, when he is not looking. I am glad I am not the only one who would.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bread = {
      lines = {
        { id = "bread_d", text = "On a flat stone set over coals, turned once, as my family baked it on the move across the plains. The flour comes down the Great Lift from the Barrens, and half of it is dust by the time it arrives." },
      },
      choices = {
        { text = "And the water?", next = "bread_water" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bread_water = {
      lines = {
        { id = "bread_water_d", text = "From a seep under the canyon wall that I found by following the wasps. It fills one skin in the time it takes to bake a loaf, so I have learned to do the two together." },
      },
      choices = {
        { text = "Following the wasps was clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_d", text = "South and east the canyon runs on beneath the needles to Freewind Post, where there is a lift and an inn. Beyond that it opens onto the Shimmering Flats, where the gnomes and goblins race, and there is no water there at all." },
      },
      choices = {
        { text = "What hunts the canyon floor?", next = "road_hunts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_hunts = {
      lines = {
        { id = "road_hunts_d", text = "The Galak centaur, who hold the crags and ride down on whoever looks alone, and the cougars after dusk. Travel while the sun is on the canyon floor, and keep to the middle of it." },
      },
      choices = {
        { text = "The middle of the road, by daylight.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    machine = {
      lines = {
        { id = "machine_d", text = "You are quite sure? It makes a small sound when it strikes the rock, very like a sigh. But you know these things, and I shall try to believe you." },
      },
      choices = {
        { text = "That sound is a slipping gear.", next = "BACK", reply = "A slipping gear. Then I am glad to know it, and a little sorry.", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grass = {
      lines = {
        { id = "grass_d", text = "Every morning, when I step out and the ground is hard. Then the sun comes over the canyon rim and turns all the needles red, and I think the Earth Mother has simply made this place for looking at and not for lying down in." },
      },
      choices = {
        { text = "She made both, and we are lucky to see them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    grimtotem = { { id = "tp_grim", text = "The Grimtotem keep to Darkcloud Pinnacle and speak to none of us. Motega Firemane can tell you what he has seen, for he sees more than I do." } },
    background = { { id = "tp_bg", text = "I came down the Great Lift with a sack of flour, to feed the watch for a season. The watch has not ended, and so neither have I." } },
    advice = { { id = "tp_ad", text = "Fill every skin you own before you leave this fire. The canyon is long, and it gives nothing away." } },
    _none = { { id = "tp_none", text = "I do not know, friend, though I should like to. If you find out, come back and tell me over some bread." } },
  },
}

---------------------------------------------------------------------------
-- Synge: goblin gunsmith at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "synge", id = TODO_NPC("Synge"), name = "Synge", title = "Gunsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mirage_raceway" }, temper = { "pushy", "cheerful" }, values = { "profit", "firepower" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Synge is a goblin who sells guns at the Mirage Raceway, to race crowds bound for Tanaris and to anyone who has met the scorpids on the Flats. He quoted me three prices before I had finished saying hello.",
    third = "{name} met Synge, the goblin gunsmith at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, hey, step up, friend! Ya look like somebody with a long walk ahead and nothin' loud to take along, and I can fix exactly one of those." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite repeat customer! Tell me she shot straight, because my returns policy is that I don't have one." },
    { id = "g_away", when = { away = 14 }, text = "{away}, pal, and still breathin', which I'm puttin' down to quality merchandise." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, now we're talkin'! You're a professional, so I'll skip the patter and go straight to the top shelf, and the top-shelf prices." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Whoa, whoa, you build your own, don't ya? Fine, I ain't offended, but you're still gonna need shot, and I got shot." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at a gun stall! Listen, pal, I know you're gonna tell me Ironforge makes 'em better, so let's skip that and say you're only browsin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Synge is the name, guns are the game, and I've got the only stall on the Shimmering Flats that sells 'em. Rifles, blunderbusses and all the shot ya can carry, at prices I'm callin' reasonable." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Synge, gunsmith, at your service. There's basilisks out on the salt that'll look at ya funny and scorpids that'll do worse, so whatever you're carryin', pal, I got somethin' with more opinion in it." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "Synge, gunsmith. You're in the trade, so I'll be straight with ya, which costs me nothin': half this stock I put together myself, and the other half I'd rather not say where it came from." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I'm losin' daylight and margin." },
        { id = "h_again2", text = "Keep talkin', I can count shot and listen." },
        { id = "h_again3", text = "Yeah, friend?" },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Why sell guns at a racetrack?", next = "why" },
        { text = "The goblin crew must be good customers.", next = "crew" },
        { text = "What's out on the Flats that needs shooting?", next = "flats" },
        { text = "Do you sell to the gnomes as well?", next = "gnomes" },
        { text = "Which half of your stock did you build?", next = "built", when = { profession = "Engineering" } },
        { text = "What do you recommend for the basilisks?", next = "basilisk", when = { class = "HUNTER" } },
        { text = "Good selling, Synge.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_d", text = "Location, pal! Everybody headed south to Tanaris comes across this salt, and everybody comin' back north tells 'em about the bandits. I'm standin' right where the worryin' starts, and worry is my best salesman." },
      },
      choices = {
        { text = "You make your coin from fear, then.", next = "why_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_fear = {
      big = true,
      lines = {
        { id = "why_fear_d", text = "From caution, friend, which is fear with a receipt. Listen, the Wastewanders are out there whether I open the stall or not, and the fella who bought from me is the one who comes back to complain about the price." },
      },
      choices = {
        { text = "Fair enough. Better armed than sorry.", next = "BACK", reply = "That's my whole pitch in four words, pal. Can I put it on a sign?", fx = { align = { order = -1 } } },
        { text = "Someone should clear the bandits, not sell around them.", next = "BACK", reply = "Sure, and when somebody does, I'll sell 'em the guns to do it. Either way I'm open.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew = {
      lines = {
        { id = "crew_d", text = "Ya'd think so, wouldn't ya? Pozzik's boys spend every copper on fuel and fenders, and the only thing they shoot is their mouths off. My money comes from the spectators and from whoever lost a bet and wants to feel tall again." },
      },
      choices = {
        { text = "Do you bet on the races yourself?", next = "crew_bet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_bet = {
      lines = {
        { id = "crew_bet_d", text = "On goblin engineerin', every heat, on principle and against my better judgment. I'm down about a crate of blunderbusses on the season, and I'm writin' it off as loyalty." },
      },
      choices = {
        { text = "Loyalty's an expensive habit.", next = "BACK", reply = "Tell me about it. It's the only overhead I can't haggle down.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flats = {
      lines = {
        { id = "flats_d", text = "Scorpids the size of a wagon wheel, basilisks that sit so still ya trip on 'em, and vultures waitin' to see which of the other two gets ya. Fizzle's gnomes are payin' for the venom, I hear, so somebody's makin' money off it." },
      },
      choices = {
        { text = "And the salt itself?", next = "flats_salt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flats_salt = {
      lines = {
        { id = "flats_salt_d", text = "Gets in everything, pal: the locks, the barrels, my lunch. I oil the whole stock every night, and I'd bill the desert for it if I could find where to send the invoice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = {
        { id = "gnomes_d", text = "Coin's coin, friend, and a gnome's is the same size as anybody's. They come over, they take one apart on my counter to see how it works, they tell me three things wrong with it, and then they buy it anyway." },
      },
      choices = {
        { text = "Are they right about the three things?", next = "gnomes_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_right = {
      lines = {
        { id = "gnomes_right_d", text = "Two outta three, usually, and I fix those on the next batch and don't say thank you. That's free consultin', and by my last copper I ain't gonna spoil it by admittin' anything." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    built = {
      lines = {
        { id = "built_d", text = "The ones with the brass bands on the barrel, those are mine. The bands ain't decoration, either, they're there because the first batch had what I'd call a ventilation event, and my cousin still can't grow his left eyebrow back." },
      },
      choices = {
        { text = "And these ones hold?", next = "BACK", reply = "Every one I've sold so far, pal, and nobody's come back to say different, which I'm choosin' to read the cheerful way.", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basilisk = {
      lines = {
        { id = "basilisk_d", text = "Somethin' heavy, and from farther off than ya think ya need. Those hides turn light shot like rain off a tin roof, and ya don't want to be standin' close when one decides to look ya in the eye." },
      },
      choices = {
        { text = "Heavy shot, long range. Understood.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mirage_raceway = { { id = "tp_race", text = "Goblins against gnomes, every day, loud as ya like. I got money on the goblins and a stall that sells to whoever wins." } },
    background = { { id = "tp_bg", text = "I came out for one race and saw a crowd with no gun stall anywhere near it. A fella doesn't walk away from a gap in the market like that." } },
    advice = { { id = "tp_ad", text = "Buy more shot than ya need, pal. Nobody ever died of havin' some left over." } },
    _none = { { id = "tp_none", text = "That ain't in my inventory, friend. Try Kravel, he deals in the stuff ya can't put on a shelf." } },
  },
}

---------------------------------------------------------------------------
-- Riznek: goblin drink vendor at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "riznek", id = TODO_NPC("Riznek"), name = "Riznek", title = "Drink Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mirage_raceway" }, temper = { "slick", "amiable" }, values = { "profit", "gossip" },
  notices = { "drink", "race", "travel" },
  impression = {
    first = "Riznek is a goblin who sells drinks at the Mirage Raceway, in the middle of a salt desert with no water in it, and he is very happy with that arrangement. He hears most of what is said in the stands, and remembers it.",
    third = "{name} met Riznek, the goblin drink vendor at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_hi", text = "Thirsty, friend? Sure ya are, you're standin' on salt as far as the eye can see, and I'm the only fella out here with anything wet." },
    { id = "g_back", when = { metBefore = true }, text = "Look who's parched again! Step up, pal, your usual's waitin', whatever it turns out to be." },
    { id = "g_away", when = { away = 14 }, text = "{away} without one of my drinks? Pal, I'm amazed you're still upright." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Whoa, somebody got started without me! No hard feelin's, friend, but hold onto the rail, the track's closer than it looks." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Now there's a customer who understands my line of work. Don't ask me for a proper stout, though, pal, it don't survive the trip." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the big folks, down from Freewind! You'll be wantin' the large size, friend, and I'm happy to say I stock it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Riznek, purveyor of refreshment to the racin' public. Water, milk, juice and somethin' stronger for when your car comes in last, all of it hauled across the desert at a cost ya don't want to hear about." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Riznek, drinks. Your pal Kravel Koalbeard is my steadiest customer and my worst one, on account of he buys by the crate and I never find out who actually drinks it." },
        { id = "h_drunk", when = { drunk = true }, text = "Riznek, drinks, and by the look of ya that's the last thing I oughta sell ya. Lucky for us both, friend, I also carry water." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talkin's thirsty work, I'll point out." },
        { id = "h_again2", text = "Go on, I got ears and a full cooler." },
        { id = "h_again3", text = "Yeah?" },
      },
      choices = {
        { text = "Let me see what you're pouring.", next = "BUSINESS" },
        { text = "How do you get drinks out to a salt flat?", next = "haul" },
        { text = "You must hear a lot from behind that counter.", next = "hear" },
        { text = "Who drinks more, the gnomes or the goblins?", next = "who" },
        { text = "A drink stand in a desert can't lose.", next = "desert" },
        { text = "Kravel buys by the crate, you said.", next = "kravel", when = { race = "Dwarf" } },
        { text = "What would you pour a tauren?", next = "tauren", when = { race = "Tauren" } },
        { text = "Keep it cold, Riznek.", next = "END" },
      },
    },
    haul = {
      lines = {
        { id = "haul_d", text = "By kodo from Freewind and by wagon up from Gadgetzan, and I lose a barrel in five to heat, leaks and drivers with a thirst. That's all in the price, pal, every drop that didn't make it." },
      },
      choices = {
        { text = "And how do you keep it cool?", next = "haul_cool" },
        { text = "Something else.", next = "BACK" },
      },
    },
    haul_cool = {
      lines = {
        { id = "haul_cool_d", text = "A hole in the ground, wet sackin', and an arrangement with the ice cream gnome that I ain't at liberty to discuss. Let's say Brivelthwerp and me found a way to share overhead, and leave it there." },
      },
      choices = {
        { text = "A goblin and a gnome, sharing costs?", next = "BACK", reply = "Don't spread it around, friend. There's a whole racetrack out here built on us not gettin' along.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = {
        { id = "hear_d", text = "Everything, friend. A fella with a cup in his hand forgets the fella who filled it is standin' right there, so I know who's bettin' big, who's bettin' borrowed, and whose car ain't gonna finish before it starts." },
      },
      choices = {
        { text = "And what do you do with all that?", next = "hear_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hear_do = {
      big = true,
      lines = {
        { id = "hear_do_d", text = "Nothin', and that's the honest truth, which I don't hand out often. The day folks figure the drinks fella repeats things, they drink somewhere else, and there ain't a somewhere else, so they'd just stop talkin' and I'd be bored." },
      },
      choices = {
        { text = "A barkeep who keeps quiet is worth trusting.", next = "BACK", reply = "Trust is good for repeat business, pal. I'd frame that if I had a wall.", fx = { align = { honor = 1 } } },
        { text = "You're sitting on a fortune. Sell what you hear.", next = "BACK", reply = "Kravel's told me the same, more than once. I looked at his line of work and decided I like sleepin' nights.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_d", text = "The goblins drink more and the gnomes drink faster, so it comes out even on the ledger. The night before a big heat they both order double, and the mornin' after there's a real slow race." },
      },
      choices = {
        { text = "Does anyone ever help that along?", next = "who_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_help = {
      lines = {
        { id = "who_help_d", text = "Listen, I sell the drinks, pal, I don't ask where they're carried to. If a certain dwarf walks off with a round for the other team's pit crew, that's between him and his conscience, assumin' he's got one on order." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    desert = {
      lines = {
        { id = "desert_d", text = "That's what I figured, friend, and I was mostly right! What I didn't figure was the salt eatin' my barrel hoops, the sun cookin' the milk, and a customer base that pays me in race tickets when their car loses." },
      },
      choices = {
        { text = "Do you take the tickets?", next = "BACK", reply = "Once, pal. I got a drawer fulla losin' goblin tickets, and I keep 'em to remind me what a sure thing looks like.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kravel = {
      lines = {
        { id = "kravel_d", text = "By the crate, cash up front, no questions and no receipts, which is how I know not to ask any. He's a pal of yours, maybe, or maybe ya just share a beard, but I'd count my change twice around him." },
      },
      choices = {
        { text = "He's no friend of mine.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_d", text = "Water, friend, and plenty of it, and I ain't even gonna try the hard sell. I watched a tauren drink a whole keg of juice in this heat once, out of thirst and good manners, and I felt bad takin' the money." },
      },
      choices = {
        { text = "You felt bad, but you took it.", next = "BACK", reply = "I'm a goblin with feelin's, pal, I ain't a charity.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mirage_raceway = { { id = "tp_race", text = "Best customers in the world, race crowds. They're hot, they're excited, and half of 'em just lost money and want to forget it." } },
    background = { { id = "tp_bg", text = "I used to haul water for a caravan, pal, till I noticed the fella sellin' it by the cup was makin' triple." } },
    advice = { { id = "tp_ad", text = "Drink before ya cross the Flats, not halfway over. There ain't a halfway stand, and believe me, I looked into it." } },
    _none = { { id = "tp_none", text = "Ain't heard that one over the counter yet, friend. Buy somethin' and stick around, it'll come up." } },
  },
}

---------------------------------------------------------------------------
-- Brivelthwerp: gnome ice cream vendor at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "brivelthwerp", id = TODO_NPC("Brivelthwerp"), name = "Brivelthwerp", title = "Ice Cream Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mirage_raceway" }, temper = { "earnest", "fretful" }, values = { "quality", "precision" },
  notices = { "race", "craft", "arcane" },
  impression = {
    first = "Brivelthwerp is a gnome who sells strawberry ice cream at the Mirage Raceway, in the hottest place I can think of, and treats keeping it frozen as an engineering problem. He told me the melting point to two decimal places.",
    third = "{name} met Brivelthwerp, the gnome who sells ice cream at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, a customer, wonderful, please decide quickly! Every time I open the lid I lose roughly two percent of my cold, and I've none to spare." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, which my figures suggest means you liked it! Same again, I hope, since it's the only flavour I have." },
    { id = "g_away", when = { away = 14 }, text = "{away}! I've sold four hundred and twelve servings since you were last here, and lost nineteen to the sun, which is a record low." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Then you'll appreciate the insulation on this crate, which is three layers of my own design, and I'd love your opinion on the hinge." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "Oh, a mage, an actual mage! I don't suppose you do frost? I ask everyone in a robe, and I do apologise, but the need is rather pressing." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, I can tell by the burn on your thumb. Please don't ask me for the recipe, because it isn't mine to give, and I'm dreadful at refusing people." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brivelthwerp, ice cream, pleased to meet you! Tigule and Foror's Strawberry, the genuine article, kept at precisely the right temperature in the worst possible place to keep anything cold." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Brivelthwerp, and what a relief to see a gnome who isn't covered in axle grease! I came out to cheer for Fizzle's team, and then I noticed a few hundred overheated spectators and no dessert whatsoever." },
        { id = "h_mage", when = { class = "MAGE" }, text = "Brivelthwerp, ice cream vendor, and you're a mage, so I'm going to be very polite to you. One small frost spell on this crate would save me about an hour of shovelling, should you feel inclined." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? Quickly, the lid's ajar!" },
        { id = "h_again2", text = "Do go on, I'm only checking the temperature." },
        { id = "h_again3", text = "Hm? Oh, yes?" },
      },
      choices = {
        { text = "I'll have some ice cream.", next = "BUSINESS" },
        { text = "How do you keep ice cream frozen out here?", next = "frozen" },
        { text = "Why sell ice cream in a desert?", next = "why" },
        { text = "You only sell the one flavour.", next = "flavour" },
        { text = "Who buys the most?", next = "buys" },
        { text = "I could frost that crate for you.", next = "frost", when = { class = "MAGE" } },
        { text = "Your hinge is letting the cold out.", next = "hinge", when = { any = { { race = "Gnome" }, { profession = "Engineering" } } } },
        { text = "Stay cool, Brivelthwerp.", next = "END" },
      },
    },
    frozen = {
      lines = {
        { id = "frozen_d", text = "With salt, which is the one thing this desert gives away free! Ice packed in salt gets colder than ice alone, you see, by a good many degrees, and I am standing on more salt than anyone could use in a lifetime." },
      },
      choices = {
        { text = "And where does the ice come from?", next = "frozen_ice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frozen_ice = {
      lines = {
        { id = "frozen_ice_d", text = "Ah, well, that is the weak point in the system. There's a mage here, Magus Tirth, who sells chickens of all things, and he'll conjure me a block each morning if I catch him before the first race and after his first complaint." },
      },
      choices = {
        { text = "What does he charge you?", next = "frozen_tirth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frozen_tirth = {
      lines = {
        { id = "frozen_tirth_d", text = "A serving a day and my silence on the subject of how his wagers are going, which is badly, by my arithmetic. I keep a tally of the heats out of habit, and he asked me very firmly to stop showing it to him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_d", text = "Because nobody else had thought of it, and I calculated that demand would rise with every degree! I was right about the demand, and I simply underestimated the degrees, by quite a lot." },
      },
      choices = {
        { text = "Do you regret coming?", next = "why_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_regret = {
      big = true,
      lines = {
        { id = "why_regret_d", text = "Not once! Do you know, a goblin mechanic and one of Fizzle's own pit crew stood right here yesterday, eating out of the same tub because I'd run short of spoons, and neither of them said a single rude word for four whole minutes." },
      },
      choices = {
        { text = "Then you're doing more good here than the race.", next = "BACK", reply = "Oh! I hadn't put it so grandly, but I think I shall, privately. Four minutes is a start, isn't it?", fx = { align = { light = 1 } } },
        { text = "Four minutes. Then they went back to hating each other.", next = "BACK", reply = "Well, yes, they did, there was a spanner thrown by teatime. I'm still counting the four minutes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flavour = {
      lines = {
        { id = "flavour_d", text = "Strawberry, yes, because that's what Tigule and Foror make, and I wouldn't dream of putting their name on anything else. I've had ideas for others, mind you, and a notebook full of them, but an idea won't keep in this heat any better than cream does." },
      },
      choices = {
        { text = "What's in the notebook?", next = "flavour_book" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flavour_book = {
      lines = {
        { id = "flavour_book_d", text = "Forty-one flavours, ranked by feasibility! Number one is plain cream with a pinch of the Flats' own salt, which sounds dreadful and tasted marvellous, the single time I got it to set before it melted." },
      },
      choices = {
        { text = "Salted cream? I'd try it.", next = "BACK", reply = "You would? That's two of us, then, which I'm recording as a doubling of the market.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = {
        { id = "buys_d", text = "The goblins, by volume, though they'd deny it in front of the gnomes. Trackmaster Zherin buys one every day at noon and eats it without a word, and I have never once seen a tauren look so content." },
      },
      choices = {
        { text = "And Fizzle and Pozzik?", next = "buys_bosses" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys_bosses = {
      lines = {
        { id = "buys_bosses_d", text = "Fizzle forgets to eat altogether when there's a car in pieces, so I leave one on his workbench and collect the empty tub. Pozzik sends someone, and insists it's for a visiting investor, every single day." },
      },
      choices = {
        { text = "That's a great many investors.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    frost = {
      narr = "He has the lid off and is standing well back before you have finished the sentence.",
      lines = {
        { id = "frost_d", text = "Oh, would you? Not too hard, please, I only need it down by about ten degrees, and the last volunteer froze the hinges shut and I had to sell lukewarm promises until sundown." },
      },
      choices = {
        { text = "Ten degrees, and no frozen hinges.", next = "BACK", reply = "Perfect, oh, that's perfect! You've a very steady hand, and I shall think of you all afternoon.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hinge = {
      lines = {
        { id = "hinge_d", text = "I knew it, I knew it was the hinge! I measured a loss on that side and blamed the afternoon sun, when it's the gasket not seating. Thank you, that's the most useful thing anyone's said to me since I arrived." },
      },
      choices = {
        { text = "A strip of oiled leather will seal it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mirage_raceway = { { id = "tp_race", text = "I do cheer for the gnomish car, naturally, though quietly. Half my customers are goblins, and the cheering costs me sales at a measurable rate." } },
    background = { { id = "tp_bg", text = "I came to watch a race and saw a market. I'm told that's a very goblin thing to have done, and I've decided not to mind." } },
    advice = { { id = "tp_ad", text = "Eat it quickly! I mean that as a matter of physics and not of manners." } },
    _none = { { id = "tp_none", text = "Oh, I couldn't say, I'm afraid. I really only know about temperatures, and strawberries, in that order." } },
  },
}

---------------------------------------------------------------------------
-- Magus Tirth: human mage selling chickens at the Mirage Raceway. Classic: mage quests Get the Scoop / Rituals of Power.
---------------------------------------------------------------------------
P:NPC {
  key = "tirth", id = TODO_NPC("Magus Tirth"), name = "Magus Tirth",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mirage_raceway" }, temper = { "pompous", "irritable" }, values = { "learning", "pride" },
  notices = { "arcane", "class", "purse" },
  impression = {
    first = "Magus Tirth is a human mage who sells chickens at the Mirage Raceway, and who wishes it understood that he was once the author of a serious work on ritual magic. He has lost a good deal at the races and is certain the next heat will mend it.",
    third = "{name} met Magus Tirth, a mage reduced to selling chickens at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_hi", text = "Yes, yes, I sell chickens, and before you ask, I am also a magus of some standing. The two facts are connected by a run of very poor luck." },
    { id = "g_back", when = { metBefore = true }, text = "You again. If you have come about a chicken, they are there, and if you have come to ask how the races are treating me, kindly do not." },
    { id = "g_away", when = { away = 14 }, text = "{away}, is it? I have been here every day of it, in this heat, in these robes, with these birds." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Ah, a student of the art, and one who has kept at their studies, by the look of that focus. It is a relief to be looked at by somebody who knows what a magus is." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I have written on the dangers of your sort of summoning, at length, and I notice you are all still doing it." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That is a heavy purse to carry about a racetrack. Keep it away from the betting stand, I say, and I say it as a man who knows precisely where the stand is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Magus Tirth. I offer fine Ancona chickens, healthy and well kept, to discerning buyers, and I will thank you not to remark on how a mage came to be offering them." },
        { id = "h_mage", when = { class = "MAGE" }, text = "I am Magus Tirth, and you will have heard the name if your masters taught you properly. I wrote Rituals of Power, which is still the soundest work on the subject, whatever is said of its author now." },
        { id = "h_scoop", tags = { "news" }, when = { questActive = TODO_QUEST("Get the Scoop") }, text = "Tabetha sent you for my book? Then I have an awkward thing to tell you, and I would be obliged if you kept your voice down while I do." },
      },
      again = {
        { id = "h_again", text = "Was there something further?" },
        { id = "h_again2", text = "Go on, if you must. The heat is not improving my patience." },
        { id = "h_again3", text = "Well?" },
      },
      choices = {
        { text = "Show me your chickens.", next = "BUSINESS" },
        { text = "How does a magus come to sell chickens?", next = "how" },
        { text = "Where is your copy of Rituals of Power?", next = "book", when = { any = { { questActive = TODO_QUEST("Get the Scoop") }, { questActive = TODO_QUEST("Rituals of Power") } } } },
        { text = "Tell me about Rituals of Power.", next = "wrote", when = { class = "MAGE" } },
        { text = "You have the look of a man who bets.", next = "bets" },
        { text = "Why Ancona chickens, of all things?", next = "ancona" },
        { text = "What do you make of the gnomes' and goblins' machines?", next = "machines" },
        { text = "Good day, Magus.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "how_d", text = "By degrees, as with most descents. I came to observe these rocket cars out of scholarly interest, I placed one small wager to make the afternoon pass, and I have been making the afternoon pass at some expense ever since." },
      },
      choices = {
        { text = "And the chickens pay your debts?", next = "how_debts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_debts = {
      lines = {
        { id = "how_debts_d", text = "The chickens pay for my supper. The debts are another matter, and I conjure ice for a gnome and water for the pit crews to keep the more impatient of my creditors civil." },
      },
      choices = {
        { text = "That is honest work, at least.", next = "BACK", reply = "It is menial work. I shall allow that it is honest, since very little else about my situation is flattering.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      big = true,
      narr = "He glances toward the betting stand and lowers his voice.",
      lines = {
        { id = "book_d", text = "I no longer have one. I sold my last copy to settle a wager, and the buyer wore the red of the Scarlet Crusade, so I should think it sits in their monastery's library in Tirisfal with the rest of what they have hoarded." },
      },
      choices = {
        { text = "You sold your own book for a bet?", next = "book_shame" },
        { text = "Then I'll fetch it from the Scarlet Monastery.", next = "BACK", reply = "You will find them poor hosts. The library is theirs, and the book is mine, whatever I was paid, so take it with my blessing.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_shame = {
      lines = {
        { id = "book_shame_d", text = "For a certainty, as it was put to me at the time. The goblin car had a new engine and could not lose, and I learned that afternoon how thoroughly a new engine can explode." },
      },
      choices = {
        { text = "A scholar's work should never be staked on a race.", next = "BACK", reply = "No, it should not. You are quite right, and I have told myself so every morning since.", fx = { align = { honor = 1 } } },
        { text = "A book is only paper. The debt was real.", next = "BACK", reply = "That is what I said to myself as I handed it over. It has sounded thinner each day.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrote = {
      lines = {
        { id = "wrote_d", text = "It concerns the preparation of ritual: the circle, the reagents, the order of the words, and why a careless magus is a brief one. I wrote it for apprentices, in the hope they would read it before they tried anything." },
      },
      choices = {
        { text = "Did your own apprentice read it?", next = "wrote_plucky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrote_plucky = {
      lines = {
        { id = "wrote_plucky_d", text = "Johnson? He read the first chapter and thought himself finished. You will find a chicken they call \"Plucky\" wandering the Flats, and should it ever stand up on two legs and speak to you, you may give it my regards and tell it the spell will hold." },
      },
      choices = {
        { text = "You turned your apprentice into a chicken.", next = "BACK", reply = "I decline to discuss the particulars. I shall say only that it was instructive, and that he was warned.", fx = { trait = { stern = 1 } } },
        { text = "I think I'd rather not know.", next = "BACK", reply = "A wise policy, and one I recommend to more people.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bets = {
      lines = {
        { id = "bets_d", text = "I wager, which is a different thing, for I apply method to it. I have charted every heat since I arrived, and the figures show plainly that the goblin car is due." },
      },
      choices = {
        { text = "It was due last time as well, I'd guess.", next = "bets_due" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bets_due = {
      lines = {
        { id = "bets_due_d", text = "It has been due for some weeks, yes, which only makes it more so. The ice cream gnome keeps a tally of his own and waves it at me, and I have had to ask him to stop." },
      },
      choices = {
        { text = "The gnome's tally may be the better one.", next = "BACK", reply = "It may. I do not look at it, on principle.", fx = { trait = { honest = 1 } } },
        { text = "Then put it all on the goblins, Magus.", next = "BACK", reply = "I intend to, the moment I have anything left to put.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ancona = {
      lines = {
        { id = "ancona_d", text = "They are a hardy, handsome bird, and they bear the heat better than I do. I have, besides, some professional experience of chickens, which I did not expect to turn to account." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    machines = {
      lines = {
        { id = "machines_d", text = "They are crude, deafening, and fascinating, and I say so reluctantly. A fire elemental does in a breath what those engines do with a barrel of fuel, but nobody has yet persuaded an elemental to go in a straight line for a prize." },
      },
      choices = {
        { text = "Have you tried?", next = "BACK", reply = "Once, privately, behind the gnomish pits. I replaced the tent, and we do not speak of it.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mirage_raceway = { { id = "tp_race", text = "It is a monument to noise and a sink for coin, and I have not missed a heat since I arrived. Draw what conclusion you like." } },
    scarlet_crusade = { { id = "tp_scar", text = "Zealots, but zealots who pay promptly and collect books. I knew one of them for the length of one transaction, and that was sufficient." } },
    background = { { id = "tp_bg", text = "I am a magus and an author. The chickens are a temporary arrangement, and have been for some while." } },
    advice = { { id = "tp_ad", text = "Never wager anything you would be ashamed to describe losing. I offer that at no charge, having paid for it in full myself." } },
    _none = { { id = "tp_none", text = "That lies outside my field, and my field has narrowed lately to ritual magic and poultry." } },
  },
}
