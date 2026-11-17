-- The Valley of Honor: the battlemaster, the riding instructor, the weapon masters,
-- a warrior trainer, the pet trainer and the merchants of bows and guns.
-- Voices: bibles/<key>.md for each.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Brakgul Deathbringer: sends the Horde to Warsong Gulch.
---------------------------------------------------------------------------
P:NPC {
  key = "brakgul", id = TODO_NPC("Brakgul Deathbringer"), name = "Brakgul Deathbringer", title = "Battlemaster",
  bible = "bibles/brakgul.md", role = "soldier", tier = "quest",
  communities = { "orgrimmar" }, temper = { "gruff", "proud" }, values = { "brave", "loyal" },
  notices = { "pvp", "class" },
  impression = {
    first = "Brakgul Deathbringer sends fighters to Warsong Gulch and talks about the war in Ashenvale as if it were already won. He judges everyone by whether they'll go, and nothing else seems to interest him.",
    third = "{name} met Brakgul Deathbringer, the battlemaster in Orgrimmar who sends the Horde to fight in Warsong Gulch.",
  },

  greetings = {
    { id = "g_hi", text = "The gulch is always open, and the night elves are always waiting in it. Are you going or aren't you?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Either you liked the gulch or you've come to complain about it, and I only listen to one of those." },
    { id = "g_ranked", when = { pvpRank = 6 }, text = "I know that rank, {rank}. You've earned it the hard way, and the Sentinels know your face by now." },
    { id = "g_away", when = { away = 21 }, text = "Gone {away}, and the Outriders lost a stand of timber while you were away. Next time, tell me before you take a holiday." },
  },

  notice = {
    { id = "n_flagged", cat = "pvp", when = { pvpFlagged = true },
      text = "You've already got the scent of a fight on you, I see. Good, because the gulch rewards those who come in hot." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and a tauren one, I'd wager. The night elves will hate you twice over, because they think your kind of magic belongs to them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brakgul Deathbringer, battlemaster of Orgrimmar. The Warsong Outriders are cutting timber in Ashenvale, the Silverwing Sentinels are trying to stop them, and Warsong Gulch is where the two meet and bleed." },
        { id = "h_low", when = { maxLevel = 9 }, text = "I'm Brakgul Deathbringer, the battlemaster, and you're too green for the gulch yet, {class}. Come back when you've seen a few more fights, and I'll have a place for you." },
        { id = "h_vet", when = { honorKills = { min = 100 } }, text = "Brakgul Deathbringer, and I know your work, because the scouts bring me the names of those who come home bloody. The gulch has room for you again whenever you want it." },
      },
      again = {
        { id = "h_again", text = "What else? The Sentinels aren't going to wait for us." },
        { id = "h_again2", text = "Ask, then, but ask quickly." },
      },
      choices = {
        { text = "What happens in Warsong Gulch?", next = "gulch" },
        { text = "Who are the Silverwing Sentinels?", next = "sentinels" },
        { text = "Why is the Horde fighting over trees?", next = "trees" },
        { text = "My people honor the forest. Why should I fight there?", next = "tauren", when = { race = "Tauren" } },
        { text = "I've bled in that gulch more than once.", next = "veteran", when = { honorKills = { min = 50 } } },
        { text = "Send me to the gulch.", next = "BUSINESS" },
        { text = "Not today, Brakgul.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gu_default", text = "Two camps at either end of a narrow valley, and a banner in each one. You steal theirs, you carry it home, and you keep yours from being stolen while you do it, which sounds simple until a night elf comes out of the shadows behind you." } },
      choices = {
        { text = "Who carries the banner?", next = "gulch_carrier" },
        { text = "Something else, Brakgul.", next = "BACK" },
      },
    },
    gulch_carrier = {
      lines = { { id = "gc_default", text = "Whoever can take the most punishment and still run, so usually a warrior or a druid in bear's hide. The rest of you keep the carrier alive, and if you don't, you'll be running back to fetch the banner yourselves." } },
      choices = {
        { text = "Someone must decide who carries it.", next = "gulch_glory" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gulch_glory = {
      big = true,
      lines = { { id = "gg_default", text = "Nobody decides, and that's the trouble. Every young grunt wants to carry it home and have his name shouted in the Valley of Strength, and half of them die chasing it while the other half sit in camp guarding nothing." } },
      choices = {
        { text = "Glory belongs to the band, not the one holding the banner.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever brings it home has earned the shouting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "Night elves with glaives and owls, most of them women, and they're as hard as any grunt I've trained beside. They think every tree in Ashenvale is a cousin, so when the Outriders cut one, the Sentinels come for the woodcutters." } },
      choices = {
        { text = "Do they spare the woodcutters?", next = "sentinels_mercy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels_mercy = {
      big = true,
      lines = { { id = "sm_default", text = "Some of them do, and some of them leave the peons pinned to a stump for the next crew to find. I'll say this much: they fight for their home, and that makes them worth fighting properly." } },
      choices = {
        { text = "An enemy fighting for home deserves a clean death.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Pinned peons? Then they get no mercy from me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trees = {
      big = true,
      lines = { { id = "tr_default", text = "Because Orgrimmar is built of timber as much as stone, and Durotar doesn't grow any worth cutting. The Warchief would rather trade for it than take it, but the night elves don't trade with orcs, so the Outriders take it and the gulch decides who keeps it." } },
      choices = {
        { text = "The city needs wood. That's reason enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We should find another way than more war.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who are the Warsong Outriders?", next = "outriders" },
      },
    },
    outriders = {
      lines = { { id = "ou_default", text = "Wolf riders and woodcutters from the old Warsong clan, the ones who stayed loyal to Grom Hellscream's memory. They work the logging camps in Ashenvale and they fight like their chieftain did, which is to say without stopping." } },
      choices = { { text = "Something else, Brakgul.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    tauren = {
      big = true,
      lines = { { id = "ta_default", text = "I know your people walked with the night elves once, long ago, and I know some of your elders don't like what the Outriders do in that forest. But the Sentinels kill tauren in the gulch the same as orcs, so it seems the forest hasn't chosen you either." } },
      choices = {
        { text = "Then I'll fight, but I'll take only what we need.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they kill tauren, they've chosen their side.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    veteran = {
      lines = { { id = "ve_default", text = "I know you have, because I've seen your name on the lists more times than most. Tell me, then, what's the gulch like now from the inside, and are we winning?" } },
      choices = {
        { text = "We're winning, as long as the carriers keep running.", next = "BACK", fx = { affinity = 2 } },
        { text = "We're losing. Too many glory-hunters, not enough defenders.", next = "BACK", fx = { affinity = 1, trait = { blunt = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fought my share before the camps and more after them, and now I send the young ones out with what I learned. The name came later, and I didn't choose it." } },
    advice = { { id = "tp_ad", text = "In the gulch, look up. The night elves love their rooftops and their high ground, and the grunt who never looks up gets an arrow in the neck." } },
    _none = { { id = "tp_none", text = "If it isn't in Warsong Gulch, it isn't my business. Ask Runthak, he likes talking more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Kildar: the wolf riding instructor.
---------------------------------------------------------------------------
P:NPC {
  key = "kildar", id = TODO_NPC("Kildar"), name = "Kildar", title = "Wolf Riding Instructor",
  bible = "bibles/kildar.md", role = "trainer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "patient", "proud" },
  notices = { "mount", "race" },
  impression = {
    first = "Kildar teaches riders in the Valley of Honor and talks about wolves the way other orcs talk about family. He has no patience for anyone who treats a mount like a tool.",
    third = "{name} met Kildar, who teaches wolf riding in Orgrimmar's Valley of Honor.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the wolves. They know you're new, and they like to see if you'll flinch." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and the wolves remember you. That's either a good thing or a bad one, depending on how you smelled last time." },
    { id = "g_mounted", when = { mounted = true }, text = "Off the beast before you come into my yard, if you please. The wolves don't like strangers riding in on their own territory." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Your seat's too far back, and your mount knows it, even if you don't. Lean in when you ride and you'll both be happier." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren in a riding yard! I've never found a wolf that'll carry one of you, and believe me, I've asked them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kildar, and I teach riding. A wolf will carry you through the Barrens at a run and fight beside you when you get there, but only if you learn to sit on him properly first." },
        { id = "h_young", when = { maxLevel = 39 }, text = "I'm Kildar, and I teach riding, but you're not ready for a wolf yet, {class}, because you'd fall off at the first gallop, so come back when you've got some seasons behind you." },
        { id = "h_orc", when = { race = "Orc" }, text = "Kildar, and you've got the look of an orc whose grandfather rode to war. The wolves can smell it, I swear, so let's see whether you've got his seat as well." },
      },
      again = {
        { id = "h_again", text = "What else do you want to know? The wolves are getting restless." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Why do orcs ride wolves?", next = "wolves" },
        { text = "What does it take to learn riding?", next = "learn" },
        { text = "I'd like a wolf of my own someday.", next = "buy" },
        { text = "Would you teach a Forsaken to ride, Kildar?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm ready to learn.", next = "BUSINESS", when = { minLevel = 40 } },
        { text = "Farewell, Kildar.", next = "END" },
      },
    },
    wolves = {
      lines = { { id = "wo_default", text = "Because we always have, back on Draenor where the Frostwolves raised them from pups. A wolf isn't a horse; he chooses you as much as you choose him, and he'll bite whoever comes for you without being told." } },
      choices = {
        { text = "What happened to the wolves after the war?", next = "wolves_camps" },
        { text = "Something else, Kildar.", next = "BACK" },
      },
    },
    wolves_camps = {
      lines = { { id = "wc_default", text = "The humans killed most of them when they put us in the camps, because they knew what a wolf meant to an orc. The Frostwolves kept a few alive up in Alterac, and nearly every wolf in this yard comes from those few." } },
      choices = {
        { text = "Then every wolf here is a debt to the Frostwolves.", next = "wolves_debt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wolves_debt = {
      big = true,
      lines = { { id = "wd_default", text = "It is, and the Warchief knows it better than anyone, since the Frostwolves took him in when he had nothing. I tell every orc I teach that he's riding on someone else's kindness, and the good ones remember it." } },
      choices = {
        { text = "A debt like that should be repaid with loyalty.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll pay for my wolf in gold. That settles it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "le_default", text = "Seasons on the road first, so that your legs are strong and your nerve is steady, and a great deal of gold, because the training doesn't come cheap. Most grunts save for years, so don't be ashamed if you have to do the same." } },
      choices = {
        { text = "Why does it cost so much?", next = "learn_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn_cost = {
      big = true,
      lines = { { id = "lc_default", text = "Because a wolf eats like three grunts and lives as long as one, and every pup that dies in training is gold gone. I'd rather turn away ten riders than give a wolf to one fool who'll ride him into the ground." } },
      choices = {
        { text = "Good, the wolves deserve careful riders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A wolf is a mount, so sell it to whoever can pay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy = {
      lines = {
        { id = "bu_default", text = "Ogunaro sells them over at the kennels, but only to orcs, and to anyone else the city counts as a true friend. A troll or a tauren will have to earn Orgrimmar's trust first, and that's not a thing gold can buy." },
        { id = "bu_exalted", when = { reputation = { faction = "Orgrimmar", min = "exalted" } }, text = "Ogunaro will sell you one, since the whole city knows your name by now. Not many who aren't orcs get that far, so be proud of it." },
      },
      choices = { { text = "Something else, Kildar.", next = "BACK" } },
    },
    forsaken = {
      big = true,
      lines = { { id = "fo_default", text = "I'd teach you, but the wolves won't have you, because you smell like a grave to them and they want to dig you up. Your people ride their own beasts from Undercity, and between us, I think those horses are welcome to you." } },
      choices = {
        { text = "The wolves are honest. I don't hold it against them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A whip would teach them to carry me.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My father rode with the Horde before the camps, and I learned to ride before I learned to walk properly. That's all the story I need." } },
    _none = { { id = "tp_none", text = "Ask me about wolves and riding, and I'll talk until you beg me to stop. Ask me about anything else, and you'll get a blank stare." } },
  },
}

---------------------------------------------------------------------------
-- Sorek: a warrior trainer who works the yard beside Grezz.
---------------------------------------------------------------------------
P:NPC {
  key = "sorek", id = TODO_NPC("Sorek"), name = "Sorek", title = "Warrior Trainer",
  bible = "bibles/sorek.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "disciplined", "patient" },
  notices = { "class" },
  impression = {
    first = "Sorek trains warriors in the Valley of Honor and is quieter than the others who share his yard. He watches more than he shouts, and he seems to like it that way.",
    third = "{name} met Sorek, one of the warrior trainers in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Find a space in the yard and wait your turn. Grezz shouts enough for both of us." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're standing better than last time I saw you. Someone's been teaching you the hard way, I see." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your grip's tight on that weapon, and that's a habit that will cost you, because a tense arm tires twice as fast as a loose one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Sorek, and I train warriors here. Grezz teaches you to hit hard, and I teach you to keep standing after you've hit, which is the part most grunts forget." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Sorek, and you've come for training, I hope, {class}. Show me your stance first, because I can tell more about a warrior from his feet than from his arms." },
      },
      again = { { id = "h_again", text = "What else? There are recruits waiting." } },
      choices = {
        { text = "How do you and Grezz split the work?", next = "grezz" },
        { text = "What's the hardest thing to teach?", next = "hardest" },
        { text = "Which stance should I favor, Sorek?", next = "stance", when = { class = "WARRIOR" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Farewell, Sorek.", next = "END" },
      },
    },
    grezz = {
      lines = { { id = "gr_default", text = "He takes the loud ones and I take the quiet ones, though somehow they all end up loud by the end. He thinks I'm too gentle, and I think he's going to lose his voice one of these days." } },
      choices = { { text = "Something else, Sorek.", next = "BACK" } },
    },
    hardest = {
      lines = { { id = "ha_default", text = "Patience, every time. A young orc wants to charge everything he sees, and it takes a dozen bruises before he understands that waiting for the right moment wins more fights than rushing." } },
      choices = {
        { text = "It must have been hard for you to learn.", next = "hardest_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest_self = {
      big = true,
      lines = { { id = "hs_default", text = "Harder than most, because I came out of the camps angry at everything. An old Frostwolf warrior made me stand still in the rain until I stopped shaking, and I didn't understand the lesson until years later." } },
      choices = {
        { text = "Stillness is strength. Rage only wastes it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anger is a weapon. I'd keep mine sharp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stance = {
      lines = { { id = "st_default", text = "Whichever one keeps you alive in the fight you're actually in, rather than the one you'd like to be in. Defend when you're guarding someone, strike when the enemy's open, and don't be too proud to change your mind halfway through." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not mine to know. I teach fighting, and I'm still learning how to do that well." } },
  },
}

---------------------------------------------------------------------------
-- Sayoc and Hanashi: the weapon masters.
---------------------------------------------------------------------------
P:NPC {
  key = "sayoc", id = TODO_NPC("Sayoc"), name = "Sayoc", title = "Weapon Master",
  bible = "bibles/sayoc.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical", "diligent" },
  notices = { "gear" },
  impression = {
    first = "Sayoc teaches the use of weapons in the Valley of Honor and seems to think that most people pick the wrong one. Every visit comes with a lecture, whether or not anyone asks for it.",
    third = "{name} met Sayoc, a weapon master in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Let me see what you're carrying, and then let me guess what you should be carrying instead." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another weapon? Good, because there's always another weapon." },
  },
  notice = {
    { id = "n_gear", cat = "gear", when = { durability = { max = 25 } },
      text = "Look at the edge on that, it's been chipped to ribbons. Take it to a smith before you try to swing it again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Sayoc, the weapon master, and I teach anyone how to use a weapon they don't know yet, for a fee. If you've been fighting with only one kind of blade all your life, you've been fighting with one hand tied." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I'm Sayoc, the weapon master, and you'll want daggers, I suppose, because your kind always does. Have you ever thought about a good mace, though?" },
      },
      again = { { id = "h_again", text = "Anything else? I have blades to oil." } },
      choices = {
        { text = "Why learn more than one weapon?", next = "why" },
        { text = "What's the best weapon?", next = "best" },
        { text = "I want to learn a new weapon.", next = "BUSINESS" },
        { text = "Farewell, Sayoc.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because the best axe in the world breaks, and when it does, you pick up whatever's lying on the ground. If you know how to use it, you live, and if you don't, you become a lesson for the next recruit." } },
      choices = {
        { text = "You sound like that's happened to you.", next = "why_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_self = {
      big = true,
      lines = { { id = "ws_default", text = "Once, at Durnholde, when my axe broke on a guard's shield and I finished him with his own sword. I hadn't held a human sword before, and it felt like waving a stick, but it worked." } },
      choices = {
        { text = "Any weapon will do when your life's at stake.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "An orc should master his own weapon first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The one you know best, which is why so many fools die holding the one that looks best. Hanashi will tell you it's the staff, and I'll tell you it's the axe, and we're both a little bit wrong." } },
      choices = { { text = "Something else, Sayoc.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it doesn't have an edge or a weight to it, I don't know about it. Ask someone who does." } },
  },
}

P:NPC {
  key = "hanashi", id = TODO_NPC("Hanashi"), name = "Hanashi", title = "Weapon Master",
  bible = "bibles/hanashi.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "patient", "wise" },
  notices = { "race" },
  impression = {
    first = "Hanashi is a Darkspear weapon master who teaches in the Valley of Honor. Hanashi speaks slowly and treats every weapon as if it had its own temper.",
    third = "{name} met Hanashi, a Darkspear weapon master in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Every weapon got a spirit in it, mon, and some of them be sulking. Come and see." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear! Good, you already know a spear be better than an axe, whatever the orcs say." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "You hold your weapon like a Darkspear, low and loose. Somebody on the islands taught you right." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hanashi, weapon master, and I teach the weapons the orcs forget about. A staff or a thrown blade saved more Darkspear on the islands than any axe ever did." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Hanashi, and you be a tauren, so you'll want to learn the staff or the mace, I think. Your people swing slow but hard, and that be no bad thing." },
      },
      again = { { id = "h_again", text = "What else, mon? The spirits be waiting." } },
      choices = {
        { text = "I've never heard of a weapon with a spirit.", next = "spirits" },
        { text = "What was it like on the islands?", next = "islands" },
        { text = "I want to learn a new weapon.", next = "BUSINESS" },
        { text = "Farewell, Hanashi.", next = "END" },
      },
    },
    spirits = {
      big = true,
      lines = { { id = "sp_default", text = "Everything do, if you listen long enough, though the orcs laugh at me for it. A spear made from a tree that died in a storm will always be restless, so you give it something to do and it stays happy." } },
      choices = {
        { text = "I'll treat my weapons with respect, then.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A blade is iron. It feels nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands = {
      lines = { { id = "is_default", text = "Hard, and then very hard, because the murlocs came and the sea witch came after them. We learned to fight with anything we could hold, and the ones who couldn't learn didn't come to Durotar with us." } },
      choices = {
        { text = "You must miss the Echo Isles.", next = "islands_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands_miss = {
      lines = { { id = "im_default", text = "Every day, mon, but the islands aren't ours right now, so I teach here and wait. Vol'jin says we'll go back one day, and I believe him, because he's never told us anything he couldn't keep." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know nothing about that, mon. Ask me about spears and staves." } },
  },
}

---------------------------------------------------------------------------
-- Xao'tsu: the pet trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "xaotsu", id = TODO_NPC("Xao'tsu"), name = "Xao'tsu", title = "Pet Trainer",
  bible = "bibles/xaotsu.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "kind", "patient" },
  notices = { "pet" },
  impression = {
    first = "Xao'tsu trains hunters' beasts in the Valley of Honor and talks to the animals more than to their owners. The animals seem to prefer it that way, and so does Xao'tsu.",
    third = "{name} met Xao'tsu, the pet trainer in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Bring your beast here, let me see it. Oh, and you as well, I suppose." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Ah, {pet}! You be looking well, and you've been fed properly, I see." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} be favoring a back leg. Let it rest a day before you take it fighting again, mon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Xao'tsu, and I train beasts, not hunters. I teach your pet new tricks and better ways to fight, and the hunters who listen to me lose fewer beasts." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Xao'tsu, pet trainer, and you be a hunter, so you'll want your beast to learn something new. Show me what it knows already, and we'll see." },
      },
      again = { { id = "h_again", text = "Anything else? The beasts be getting hungry." } },
      choices = {
        { text = "How do you train a beast?", next = "train" },
        { text = "What's the worst beast you've trained?", next = "worst" },
        { text = "Teach my beast something new.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Farewell, Xao'tsu.", next = "END" },
      },
    },
    train = {
      big = true,
      lines = { { id = "tr_default", text = "With patience and meat, mostly in that order. A beast that's beaten learns fear, and a beast that's fed learns to trust, and a frightened beast will turn on you in the end." } },
      choices = {
        { text = "Trust is stronger than fear. I treat my beast well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast should fear its master a little.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "wo_default", text = "A crocolisk a young hunter brought up from the Barrens, and it bit everything in the valley, including me twice. The hunter thought it was very brave, and I thought it was very hungry." } },
      choices = {
        { text = "What happened to it?", next = "worst_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst_after = {
      lines = { { id = "wa_default", text = "Once it learned it got fed every day, it calmed down and became the sweetest beast in the valley. The hunter was very disappointed, but the beast was much happier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask your beast, mon. It probably knows more than I do about that." } },
  },
}

---------------------------------------------------------------------------
-- Kaja and Jin'sora: guns and bows.
---------------------------------------------------------------------------
P:NPC {
  key = "kaja", id = TODO_NPC("Kaja"), name = "Kaja", title = "Guns and Ammo Merchant",
  bible = "bibles/kaja.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "practical" },
  notices = { "purse", "class" },
  impression = {
    first = "Kaja sells guns and ammunition out of Kaja's Boomstick Imports in the Valley of Honor, and every sentence is a sales pitch. The prices change depending on how interested you look.",
    third = "{name} met Kaja, the goblin who sells guns and ammunition in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Kaja's Boomstick Imports, pal, where everything goes bang and almost nothing goes bang in the wrong direction." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! Listen, listen, I've got new stock in, and some of it's barely singed." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Whoa, now, that purse is jinglin' like a valued customer's purse. Let me show you the good shelf." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Sweetheart, you're my favorite kind of customer, because you buy ammo by the crate and you never stop shooting." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kaja, owner and proprietor and chief boom officer of Kaja's Boomstick Imports. I've got guns for every budget and ammo by the bag, and I'll even throw in my professional opinion, which normally costs extra." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Kaja, at your service, and you're a hunter, so you need ammo, and lots of it, because a hunter without ammo is just a pet owner with a stick. Let's talk numbers." },
      },
      again = { { id = "h_again", text = "What else, chum? Time is money, and you're spending both of ours." } },
      choices = {
        { text = "Where do your guns come from?", next = "where" },
        { text = "Orcs don't seem to like guns much.", next = "orcs" },
        { text = "I'd bet you sell guns to dwarves too.", next = "dwarves" },
        { text = "Show me the guns.", next = "BUSINESS" },
        { text = "Not today, Kaja.", next = "END" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "Ratchet, Booty Bay, Undermine, and a few places I can't name without paying a fee to the people who'd find out. The good stuff comes by boat, and the cheap stuff comes from my cousin, who's missing two fingers but still swears by his designs." } },
      choices = {
        { text = "Two fingers lost to the guns, then.", next = "where_cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_cousin = {
      lines = { { id = "wc_default", text = "From the testing, which is different, because he tests them so you don't have to, and that's a service worth paying for. Anyway, that model's discontinued now, and the replacement's a much better product." } },
      choices = { { text = "Something else, Kaja.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    orcs = {
      lines = { { id = "or_default", text = "They like axes, and they like hitting things up close, which is very honorable and very bad for my business. But the trolls love a good rifle, the Forsaken love anything that kills from far away, and the hunters buy everything I've got." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      big = true,
      lines = { { id = "dw_default", text = "Officially, no, pal, because this is the Horde's city and I'm a loyal guest in it. Unofficially, a gun doesn't care who's holding it, and the Steamwheedle Cartel doesn't care who's paying, so let's just say business is business." } },
      choices = {
        { text = "Selling to both sides is smart business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A guest of the Horde should choose a side.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Buy low, sell high, and never sell a gun to a customer who looks angry at you. That's my whole philosophy, and it's free." } },
    _none = { { id = "tp_none", text = "I don't know, pal, and if I did, I'd be charging for it. Buy a gun and ask me again." } },
  },
}

P:NPC {
  key = "jinsora", id = TODO_NPC("Jin'sora"), name = "Jin'sora", title = "Bowyer",
  bible = "bibles/jinsora.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "proud", "practical" },
  notices = { "class" },
  impression = {
    first = "Jin'sora sells bows in the Valley of Honor and has a low opinion of the goblin selling guns nearby. Jin'sora seems to believe a good bow will always be better than any noisy machine.",
    third = "{name} met Jin'sora, the Darkspear bowyer of Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "A good bow be quiet, mon. Not like that goblin's noisy sticks across the way." },
    { id = "g_back", when = { metBefore = true }, text = "Back for a better bow, I hope, and not for that goblin's thunder." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You draw with your elbow too high, hunter. Drop it a finger's width and your arrows will stop wandering to the left." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jin'sora, and I sell bows and arrows, the best you'll find in the Valley of Honor. Kaja will tell you a gun be better, but a gun scares off everything in the forest for a mile, and a bow lets you take two shots before anyone knows you're there." },
      },
      again = { { id = "h_again", text = "What else? I've got strings to wax." } },
      choices = {
        { text = "Most hunters I've met seem to favor guns.", next = "guns" },
        { text = "Where does your wood come from?", next = "wood" },
        { text = "I'm a hunter. What bow would you recommend?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Farewell, Jin'sora.", next = "END" },
      },
    },
    guns = {
      big = true,
      lines = { { id = "gu_default", text = "A bow be quiet, a bow don't blow up in your face, and a bow you can fix yourself in the middle of the jungle. A gun breaks, and you need a goblin to fix it, and then you owe that goblin money forever." } },
      choices = {
        { text = "Quiet and simple. A bow is the hunter's way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A gun hits harder. I'll take the noise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "wo_default", text = "Ashenvale, mostly, from what the Warsong bring back. The night elves would kill me for saying so, but their trees make the best bows on Kalimdor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "The strongest one you can pull without shaking, mon, and not the prettiest. A pretty bow you can't draw be just a decoration for your back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know that, mon. Ask me about bows instead." } },
  },
}
