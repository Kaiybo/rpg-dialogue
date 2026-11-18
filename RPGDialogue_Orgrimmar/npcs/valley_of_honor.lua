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
    { id = "g_hi", text = "The gulch is always open, and the night elves are always waiting in it. Will you go and earn your honor, or aren't you going?" },
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
        { id = "h_again2", text = "Ask, then, but ask quickly. Deeds are won in the gulch, not in this valley." },
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
      lines = { { id = "gg_default", text = "Nobody decides, and that's the trouble. Every young grunt wants to carry it home and have his name shouted in the Valley of Strength, and too many die chasing it while the rest sit in camp guarding nothing." } },
      choices = {
        { text = "Glory belongs to the band, not the one holding the banner.", next = "BACK", reply = "Now that's the answer I give them, and they never listen. Bring it home together, and shout together.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever brings it home has earned the shouting.", next = "BACK", reply = "Spoken like every young grunt I've buried. Earn it, then, but don't die chasing it alone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "Night elves with glaives and owls, most of them women, and they're as hard as any grunt I've trained beside. They think every tree in Ashenvale is a cousin, so when the Outriders cut one, the Sentinels come for the woodcutters." } },
      choices = {
        { text = "Do they spare the woodcutters?", next = "sentinels_mercy" },
        { text = "You sound like you respect them.", next = "elves_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels_mercy = {
      big = true,
      lines = { { id = "sm_default", text = "Some of them do, and some of them leave the peons pinned to a stump for the next crew to find. I'll say this much: they fight for their home, and that makes them worth fighting properly." } },
      choices = {
        { text = "An enemy fighting for home deserves a clean death.", next = "BACK", reply = "Aye, a clean one, and quick. They've earned that, even if they don't give the same.", fx = { align = { light = 1 } } },
        { text = "Pinned peons? Then they get no mercy from me.", next = "BACK", reply = "I can't blame you, and I've felt the same. But fight them properly anyway, because they'll remember it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_op = {
      lines = { { id = "eo_default", text = "I respect anything that fights that well, but I've trained grunts who think they're demons with pointed ears and grunts who'd rather trade with them than fight. You've met them in the gulch or you will, so where do you stand on the night elves?" } },
      choices = {
        { text = "They're proud, but they fight for home. I respect that.", next = "eo_respect", fx = { affinity = 1, align = { honor = 1 }, opinion = { night_elves = "respect" } } },
        { text = "They murder woodcutters. They deserve what they get.", next = "eo_hate", fx = { align = { honor = -1 }, opinion = { night_elves = "hate" } } },
        { text = "The forest is theirs. We shouldn't be in Ashenvale.", next = "eo_wrong", fx = { affinity = -1, opinion = { ashenvale = "wrong" } } },
        { text = "My people called them friends once. I mourn that.", next = "eo_tauren", when = { race = "Tauren" }, fx = { opinion = { night_elves = "mixed" } } },
        { text = "Something else, Brakgul.", next = "BACK" },
      },
    },
    eo_respect = {
      lines = { { id = "eor_default", text = "Good, because a grunt who respects his enemy watches her hands, and the ones who don't come home pinned to stumps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eo_hate = {
      lines = { { id = "eoh_default", text = "Then come to the gulch and spend it there. Hate's a fine fuel for a short fight and a poor one for a long war, so don't let it burn out on you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eo_wrong = {
      lines = { { id = "eow_default", text = "Tell that to the carpenters building this city. The Warchief tried to trade, and the elves answered with arrows, so the Outriders cut where they must." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eo_tauren = {
      lines = { { id = "eot_default", text = "Your elders say the same. Perhaps one day the forest will remember it, but today the Sentinels have their glaives out, and they don't ask which tribe you're from." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trees = {
      big = true,
      lines = { { id = "tr_default", text = "Because Orgrimmar is built of timber as much as stone, and Durotar doesn't grow any worth cutting. The Warchief would rather trade for it than take it, but the night elves don't trade with orcs, so the Outriders take it and the gulch decides who keeps it." } },
      choices = {
        { text = "The city needs wood. That's reason enough.", next = "BACK", reply = "It is, for me, and for the Warchief too, though he'd rather trade. Ashenvale has timber to spare.", fx = { align = { order = 1 }, opinion = { ashenvale = "necessary" } } },
        { text = "We should find another way than more war.", next = "BACK", reply = "Find it, then, and I'll be the first to cheer. Until then, the Outriders cut, and we guard them.", fx = { align = { order = -1 }, opinion = { ashenvale = "wrong" } } },
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
        { text = "Then I'll fight, but I'll take only what we need.", next = "BACK", reply = "That's fair, and more than the Outriders ask. Fight beside us, and take what you need.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they kill tauren, they've chosen their side.", next = "BACK", reply = "They have, and your elders will have to see it someday. Welcome to the gulch, tauren.", fx = { align = { light = -1 } } },
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
    _none = { { id = "tp_none", text = "If it isn't in Warsong Gulch, it isn't my business. Ask Runthak; he likes talking more than an orc should." } },
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
    { id = "g_hi", text = "Mind the wolves, {class}. They know you're new, and they like to see if you'll flinch, the way any orc would." },
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
        { text = "A debt like that should be repaid with loyalty.", next = "BACK", reply = "It should, and the good ones repay it every time they ride. The wolves remember who's grateful.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll pay for my wolf in gold. That settles it.", next = "BACK", reply = "Gold buys the wolf, aye, but not his loyalty. Remember that, or he'll throw you in the first river.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "le_default", text = "Seasons on the road first, so that your legs are strong and your nerve is steady, and a heavy purse, because the training doesn't come cheap. Most grunts save for years, so don't be ashamed if you have to do the same." } },
      choices = {
        { text = "Why does it cost so much?", next = "learn_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn_cost = {
      big = true,
      lines = { { id = "lc_default", text = "Because a wolf eats like three grunts and lives as long as one, and every pup that dies in training is gold gone. I'd rather turn away ten riders than give a wolf to one fool who'll ride him into the ground." } },
      choices = {
        { text = "Good, the wolves deserve careful riders.", next = "BACK", reply = "They do, and I'm glad you see it. Ride gently, and he'll carry you anywhere.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A wolf is a mount, so sell it to whoever can pay.", next = "BACK", reply = "Then go buy one from a goblin, and see how long it lasts. My wolves go to riders, not purses.", fx = { align = { order = -1 } } },
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
        { text = "The wolves are honest. I don't hold it against them.", next = "BACK", reply = "Good, then we'll part friends. Your horses will be glad of you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A whip would teach them to carry me.", next = "BACK", reply = "Lay a whip on one of my wolves and you'll be wearing your arm for a hat. Go and ride your horses.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My father rode with the Horde before the camps, and I learned to ride before I learned to walk properly. That's all the story I need." } },
    _none = { { id = "tp_none", text = "Ask me about wolves and riding, and I'll talk until you beg me to stop. Ask me about anything else, and you'll get a blank stare and a grunt." } },
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
    { id = "g_hi", text = "Find a space in the yard and wait your turn, grunt. Grezz shouts enough for both of us." },
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
        { id = "h_default", key = true, text = "I'm Sorek, and I train warriors here. Grezz teaches you to hit hard, and I teach you to keep standing after you've hit, which is the part most grunts forget and the part that brings them home to the Horde." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Sorek, and you've come for training, I hope, {class}. Show me your stance first, because I can tell more about a warrior from his feet than from his arms." },
      },
      again = { { id = "h_again", text = "What else? There are recruits waiting." } },
      choices = {
        { text = "How do you and Grezz split the work?", next = "grezz" },
        { text = "What's the hardest thing to teach?", next = "hardest" },
        { text = "Which stance should I favor, Sorek?", next = "stance", when = { class = "WARRIOR" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Tell me about the Frostwolf who taught you.", next = "frostwolf" },
        { text = "What do you look for when you watch the recruits?", next = "watch" },
        { text = "What makes a warrior of the Horde?", next = "cause" },
        { text = "Tauren fight differently from orcs, I think.", next = "tauren", when = { race = "Tauren" } },
        { text = "Farewell, Sorek.", next = "END" },
      },
    },
    grezz = {
      lines = { { id = "gr_default", text = "He takes the loud ones and I take the quiet ones, though somehow they all end up loud by the end. He thinks I'm too gentle, and I think he's going to lose his voice one of these days." } },
      choices = {
        { text = "Have the two of you ever sparred?", next = "grezz_spar" },
        { text = "Something else, Sorek.", next = "BACK" },
      },
    },
    grezz_spar = {
      lines = { { id = "gs_default", text = "Once a season, in front of the recruits, so they can see both ways of fighting side by side. He knocks me down early, and I keep getting up, and by sundown he's too tired to lift his axe, which is the whole lesson if they're watching." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
        { text = "Stillness is strength. Rage only wastes it.", next = "BACK", reply = "It is, and I wish I'd learned it sooner. Stand still in the rain sometime, and you'll see.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anger is a weapon. I'd keep mine sharp.", next = "BACK", reply = "Keep it, then, but keep it sheathed until you need it. Rage unchecked is how the camps took us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stance = {
      lines = { { id = "st_default", text = "Whichever one keeps you alive in the fight you're actually in, rather than the one you'd like to be in. Defend when you're guarding someone, strike when the enemy's open, and don't be too proud to change your mind halfway through." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    frostwolf = {
      lines = { { id = "fw_default", text = "His name was Grukar, and he'd never seen the inside of a camp, because the Frostwolves were exiled to the mountains of Alterac long before the war ended. He came south with the Warchief, and he looked at us camp orcs the way you'd look at wolves raised in a cage." } },
      choices = {
        { text = "Why did he make you stand in the rain?", next = "frostwolf_rain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frostwolf_rain = {
      lines = { { id = "fr_default", text = "Because I'd struck a recruit who laughed at me, and he said a warrior who can't stand still can't stand at all. I stood there until dark with the water running down my face, and somewhere in the middle of it the anger ran out with the rain." } },
      choices = {
        { text = "Is Grukar still alive?", next = "frostwolf_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frostwolf_home = {
      lines = { { id = "fh_default", fx = { learn = { "alterac" } }, text = "He went back to Alterac, to Drek'Thar and the clan, because he said the mountains needed him more than a city of stone. I hear the Frostwolves are fighting dwarves for their valley now, and I'd wager he's standing very still in the snow, waiting for his moment." } },
      choices = { { text = "Something else, Sorek.", next = "BACK" } },
    },
    watch = {
      lines = {
        { id = "wa_default", text = "Their feet, first, because a warrior who stands badly falls badly, and then their eyes, because the ones who watch the whole yard live longer than the ones who only watch their opponent. The arms come last, since anyone can learn to swing." },
        { id = "wa_warrior", when = { class = "WARRIOR" }, text = "Feet, then eyes, then arms, and yours are in that order of quality too, {class}. Your stance is good, your eyes wander, and your arms do too much of the work." },
      },
      choices = {
        { text = "And what do you see in me?", next = "watch_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_me = {
      lines = {
        { id = "wm_default", text = "Someone who's been in more fights than they'd like, and fewer than they'll have. You'll do well, if you learn to breathe before you strike." },
        { id = "wm_high", when = { minLevel = 30 }, text = "Someone who's survived a great many fights and stopped counting them, which is either wisdom or a bad habit. Take a day's rest now and then, because the Horde needs you whole, not brave." },
      },
      choices = {
        { text = "Thank you, Sorek. I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cause = {
      big = true,
      lines = { { id = "ca_default", text = "That's what every recruit asks me in the end, and they all want me to say strength. I tell them a warrior of the Horde fights so that the orcs behind the walls never see another camp, and the ones who fight for songs and glory don't usually last. What do you fight for?" } },
      choices = {
        { text = "For the Horde. My people come first.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "For myself. Glory and gold are reason enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'm still working that out.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "They do, and it's a good thing to watch, because a tauren warrior doesn't hurry and doesn't stop, like a herd on the move. I've learned more about patience from the tauren who come through this yard than they've ever learned about fighting from me." } },
      choices = {
        { text = "The Earth Mother teaches patience to all of us.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not mine to know. I teach fighting, and I'm still learning how to do that well." } },
    background = { { id = "tp_bg", text = "I came out of the camps angry, and an old Frostwolf taught me to stand still. I've been teaching that lesson ever since." } },
    advice = { { id = "tp_ad", text = "Loosen your grip and breathe before you strike. The axe knows what to do if your arm stops arguing with it." } },
    alterac = { { id = "tp_alterac", next = "frostwolf_home", text = "The Frostwolves' mountains, cold enough to freeze rage solid, which is why their warriors fight so well." } },
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
    { id = "g_hi", text = "Let me see what you're carrying, warrior, and then let me guess what you should be carrying instead." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another weapon? Good, because there's always another weapon." },
    { id = "g_grip", text = "Hold that up for me. No, the other way, the way you'd hold it if somebody were actually trying to kill you." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior, and I can see from here you've been leaning on that weapon like a walking stick. We'll fix that, if you'll listen." },
  },
  notice = {
    { id = "n_gear", cat = "gear", when = { durability = { max = 0.25 } },
      text = "Look at the edge on that, it's been chipped to ribbons. Take it to a smith before you try to swing it again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Sayoc, the weapon master, and I teach anyone how to use a weapon they don't know yet, for a fee. In the camps we fought with whatever the guards dropped, and if you've only ever swung one kind of blade, you've been fighting with one hand tied." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I'm Sayoc, the weapon master, and you'll want daggers, I suppose, because your kind always does. Have you ever thought about a good mace, though?" },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I'm Sayoc, and you're a hunter, so you've spent every hour on the bow and none on the axe at your hip. The day something gets close, you'll wish you'd come to me sooner." },
        { id = "h_young", when = { maxLevel = 15 }, text = "I'm Sayoc, and you're young enough that nobody's broken your weapon for you yet. Learn a second one now, while you've still got time to be bad at it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I have blades to oil." },
        { id = "h_again2", text = "What else? And loosen that grip, you're strangling the poor thing." },
      },
      choices = {
        { text = "Why learn more than one weapon?", next = "why" },
        { text = "What's the best weapon?", next = "best" },
        { text = "What's the worst weapon you've ever seen?", next = "show" },
        { text = "What do you make of Hanashi?", next = "hanashi" },
        { text = "Judge my weapon, then.", next = "judge" },
        { text = "I've mastered the axe. Why learn anything else?", next = "axe_only", when = { class = "WARRIOR" } },
        { text = "Why a mace, for a rogue?", next = "rogue_mace", when = { class = "ROGUE" } },
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
        { text = "Any weapon will do when your life's at stake.", next = "BACK", reply = "It will, and I've lived by that ever since. A broken axe teaches you that quickly.", fx = { align = { honor = -1 } } },
        { text = "An orc should master his own weapon first.", next = "BACK", reply = "Master it, aye, but learn to use the enemy's too. You never know when your axe will break.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The one you know best, and the fools who pick the one that looks best die holding it. Hanashi will tell you it's the staff, and I'll tell you it's the axe, and we're both a little bit wrong." } },
      choices = { { text = "Something else, Sayoc.", next = "BACK" } },
    },
    show = {
      lines = { { id = "sh_default", text = "A sword a merchant tried to sell me, with three rubies in the hilt and an edge you couldn't cut bread with. I'd sooner face a centaur with a fence post than with a weapon somebody made to be looked at." } },
      choices = {
        { text = "What did you do with it?", next = "show_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    show_after = {
      lines = { { id = "sa_default", text = "I bought it for the price of the rubies, pried them out and sold them on, and now the sword holds my door open. It's the only honest work it's ever done." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hanashi = {
      lines = { { id = "ha_default", text = "Hanashi talks to spears, and I'd laugh about it, except that Hanashi's students never drop theirs. We argue about axes and staves every evening by the practice dummies, and Hanashi wins more often than I'd like." } },
      choices = {
        { text = "Do you talk to your weapons, too?", next = "hanashi_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hanashi_secret = {
      lines = { { id = "hs_default", text = "Certainly not, and if anyone tells you otherwise, it's a lie. I oil my axe every night and tell it what it did wrong that day, which is a different thing entirely." } },
      choices = { { text = "Of course it is. Something else.", next = "BACK" } },
    },
    judge = {
      big = true,
      lines = { { id = "ju_default", text = "Before I judge it, tell me why you carry it. Most people never think about the reason, and it shows in the way they swing." } },
      choices = {
        { text = "It's the kind of weapon my father carried.", next = "ju_father", fx = { align = { order = 1 } } },
        { text = "Whatever kills fastest. I don't care for tradition.", next = "ju_fast", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Because it looks fierce, mostly.", next = "ju_looks", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    ju_father = {
      lines = { { id = "jf_default", text = "Then carry it well, and learn something else beside it. Your father would rather you came home than came home holding the same kind of axe he did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ju_fast = {
      lines = { { id = "jk_default", text = "That's the first sensible answer I've had all week. Fast and ugly wins more fights than slow and proper, whatever the grunts tell each other round the fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ju_looks = {
      lines = { { id = "jl_default", text = "You picked it because it looks fierce? Come back when it's saved your life, and then tell me how it looks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    axe_only = {
      lines = { { id = "ao_default", text = "Because one day that axe will stick fast in a shield, and you'll hear my voice saying I told you so. A warrior who knows one weapon is half a warrior, however good the half is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue_mace = {
      lines = { { id = "rm_default", text = "Because a dagger needs an opening, and a mace makes one. Any rogue in the Cleft could knock a man senseless with a good mace, if they'd stop admiring their knives long enough to learn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it doesn't have an edge or a weight to it, I don't know about it, and I don't much trust it either. Ask some grunt who does." } },
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
    { id = "g_back", when = { metBefore = true }, text = "You come back, and you brought that weapon with you again. It looks a little happier this time." },
    { id = "g_orc", when = { race = "Orc" }, text = "An orc come to ask the troll about weapons, eh? Don't worry, I won't tell Sayoc." },
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
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Hanashi, and you be a shaman, so you already hear the spirits in the stone and the wind. The spirit in your mace be quieter than those, but it be there if you listen." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The spirits be waiting." },
        { id = "h_again2", text = "Go on, I got time. A staff teach you patience, if it teach you nothing else." },
      },
      choices = {
        { text = "I've never heard of a weapon with a spirit.", next = "spirits" },
        { text = "What was it like on the islands?", next = "islands" },
        { text = "Do you name your weapons?", next = "names" },
        { text = "What does Sayoc really think of you?", next = "sayoc" },
        { text = "What's so good about thrown weapons?", next = "thrown" },
        { text = "Orcs don't talk to their axes.", next = "orc_axe", when = { race = "Orc" } },
        { text = "The spirits I know live in earth and storm, not iron.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I miss the Echo Isles too.", next = "troll_isles", when = { race = "Troll" } },
        { text = "I want to learn a new weapon.", next = "BUSINESS" },
        { text = "Farewell, Hanashi.", next = "END" },
      },
    },
    spirits = {
      big = true,
      lines = { { id = "sp_default", text = "Everything do, if you listen long enough, though the orcs laugh at me for it. A spear made from a tree that died in a storm will always be restless, so you give it something to do and it stays happy." } },
      choices = {
        { text = "I'll treat my weapons with respect, then.", next = "BACK", reply = "Good, mon, and your weapon will be happy with you. A happy weapon fights better.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A blade is iron. It feels nothing.", next = "BACK", reply = "Iron feels, mon, it just don't complain much. Listen closer, and you'll hear it.", fx = { align = { light = -1 } } },
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
    names = {
      lines = { { id = "na_default", text = "All of dem, mon, and dey answer better for it. This staff be called Old Patience, and that spear be Little Thunder, because it never stop complaining. What do you call yours?" } },
      choices = {
        { text = "It has a name, but I keep it to myself.", next = "na_secret", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "I'd name it now, if you'd help me.", next = "na_help", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I'd never name a lump of iron.", next = "na_never", fx = { trait = { skeptical = 1 } } },
      },
    },
    na_secret = {
      lines = { { id = "ns_default", text = "Good, that be the old way. A name you tell everybody be just a word, but a name you keep be a promise between you and the weapon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    na_help = {
      lines = { { id = "nh_default", text = "No, no, the weapon tell you its name, not me. Carry it a while, fight with it, and one day you'll call it something without thinking, and that be the name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    na_never = {
      lines = { { id = "nn_default", text = "That be what Sayoc says too, and then he goes and talks to his axe when he thinks nobody be watching. Give it time, mon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sayoc = {
      lines = { { id = "sa_default", text = "Sayoc thinks I'm a soft old troll who talks to sticks, and he tells me so every evening by the practice dummies. But I seen him whisper to that axe of his when he oils it, so I know better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thrown = {
      lines = { { id = "th_default", text = "A thrown blade be an honest weapon, because once it leave your hand, it go where you sent it and not where you wished. The orcs think a weapon you let go of be a weapon you lose, and that be why so few of them learn to throw." } },
      choices = {
        { text = "How do you learn to throw well?", next = "thrown_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thrown_more = {
      lines = { { id = "tm_default", text = "Throw a thousand times at the same knot in the same post, and say a word to the blade before every one. The orcs understand the first part, and the second part be why I hit the knot and they hit the post." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_axe = {
      big = true,
      lines = { { id = "oa_default", text = "No, they shout at them, which be much the same thing, only louder. Your axe don't mind the shouting, but it would like a kind word now and then." } },
      choices = {
        { text = "Maybe I'll try a kind word, then.", next = "BACK", reply = "Try it, mon, and you'll see the difference. Your axe be happier already.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My axe gets blood, not words.", next = "BACK", reply = "Blood keeps it sharp, mon, but a kind word keeps it loyal. Try both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Iron come out of the earth, mon, so you know that spirit better than you think. Ask your earth totem, and it'll tell you the mace be its cousin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll_isles = {
      lines = { { id = "ti_default", text = "Then you remember the smell of the sea in the morning, before the sea witch came. We carry it with us, and Sen'jin Village sits close enough to the water that the old spirits still find us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know nothing about that, mon, and my spears don't neither. Ask me about spears and staves." } },
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
    { id = "g_back", when = { metBefore = true }, text = "You came back, and so did your beast, which be the more important part. Let me have a look." },
    { id = "g_croc", when = { pet = { family = "Crocolisk" } }, text = "A crocolisk, and it already be looking at my ankles. Keep it fed, mon, because I still got the marks from the last one." },
    { id = "g_nopet", when = { class = "HUNTER", ["not"] = { pet = { type = "Beast" } } }, text = "A hunter with no beast at your heel? Either you left it with the stable master or you lost it, and I hope for your sake it be the first." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} be favoring a back leg. Let it rest a day before you take it fighting again, mon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Xao'tsu, and I train beasts, not hunters, mon. The loa put a spirit in every animal, and I teach your pet new tricks and better ways to fight, so the hunters who listen to me lose fewer beasts." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Xao'tsu, pet trainer, and you be a hunter, so you'll want your beast to learn something new. Show me what it knows already, and we'll see." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Xao'tsu, and you be a tauren, so your people already know a beast be a person with four legs. Most orcs need a few seasons in this valley to learn that." },
      },
      again = {
        { id = "h_again", text = "Anything else? The beasts be getting hungry." },
        { id = "h_again2", text = "Something else? Your beast be bored, I can tell, so be quick about it." },
      },
      choices = {
        { text = "How do you train a beast?", next = "train" },
        { text = "What's the worst beast you've trained?", next = "worst" },
        { text = "How do you know when a beast is unhappy?", next = "happy" },
        { text = "What do you think of Kaja's guns?", next = "kaja" },
        { text = "Why do you prefer beasts to people?", next = "prefer" },
        { text = "Is this crocolisk anything like yours was?", next = "croc", when = { pet = { family = "Crocolisk" } } },
        { text = "My boar charges at everything. Is that normal?", next = "boar", when = { pet = { family = "Boar" } } },
        { text = "Teach my beast something new.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Farewell, Xao'tsu.", next = "END" },
      },
    },
    train = {
      big = true,
      lines = { { id = "tr_default", text = "With patience and meat, mostly in that order, mon. A beast that be beaten learns fear, and a beast that be fed learns to trust, and a frightened beast will turn on you in the end." } },
      choices = {
        { text = "Trust is stronger than fear. I treat my beast well.", next = "BACK", reply = "That be the way, mon, and your beast will stand by you forever. Patience and meat.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast should fear its master a little.", next = "BACK", reply = "A little fear, maybe, but fear turns, mon. Feed it more, and fear it less.", fx = { align = { light = -1 } } },
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
    happy = {
      lines = { { id = "ha_default", text = "It tells you, if you watch. A happy beast fights close and comes when it's called, and a hungry one that's ignored long enough will walk off into the Barrens one night and never come back." } },
      choices = {
        { text = "Does that happen often?", next = "happy_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happy_more = {
      lines = { { id = "hm_default", text = "More often than hunters will admit, mon. They come to me wanting a new beast trained, and I ask what happened to the last one, and they look down at their boots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaja = {
      lines = { { id = "ka_default", text = "Every time that goblin tests a new gun, every beast in the valley jumps out of its fur, and Kildar's wolves howl for an hour after. Jin'sora the bowyer complains about the noise for the sake of the bows, but I complain for the beasts, and mine be the better reason." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prefer = {
      lines = { { id = "pr_default", text = "Because a beast never lies to me about being hungry. But you asked me one, so I'll ask you one: what do you feed your beast, mon?" } },
      choices = {
        { text = "Whatever it likes best, even if it costs me.", next = "fd_best", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "Whatever's cheapest. It eats or it goes hungry.", next = "fd_cheap", fx = { affinity = -1, trait = { greedy = 1 } } },
        { text = "I don't have a beast yet. I'd like one.", next = "fd_none", fx = { trait = { curious = 1 } } },
      },
    },
    fd_best = {
      lines = { { id = "fb_default", text = "Good, that be the right answer, and your beast knows it even if your purse don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fd_cheap = {
      lines = { { id = "fc_default", text = "Then don't be surprised when it looks at you the way you look at it. A beast keeps accounts too, it just keeps them quietly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fd_none = {
      lines = { { id = "fn_default", text = "Then go out to the Barrens and look for one that looks back at you. The right beast always does, and the wrong one only looks at your lunch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    croc = {
      lines = { { id = "cr_default", text = "Very like, and look, it already be eyeing my ankle the same way. Feed it before you bring it down to the valley, and we'll both keep our toes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    boar = {
      lines = { { id = "bo_default", text = "For a boar, that be good manners. Teach it when to stop, not when to start, because no boar ever needed help starting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask your beast, mon. It probably knows more than I do about that, and it won't be lyin' to you." } },
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
      choices = {
        { text = "Do you like it here, among the Horde?", next = "goblins_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins_op = {
      lines = { { id = "go_default", text = "Like it? Pal, the Horde pays in gold and doesn't haggle, which is my favorite kind of customer. But I hear what the grunts mutter when I walk by, so go on, honest opinion, free of charge: what do you think of us goblins?" } },
      choices = {
        { text = "You make the best machines in Kalimdor. I respect that.", next = "go_respect", fx = { affinity = 2, opinion = { goblins = "respect" } } },
        { text = "You'd sell the Horde's guns to the Alliance tomorrow.", next = "go_distrust", fx = { affinity = -1, opinion = { goblins = "distrust" } } },
        { text = "Useful, as long as the coin flows our way.", next = "go_useful", fx = { opinion = { goblins = "useful" } } },
        { text = "You keep my quiver full, Kaja. I like goblins fine.", next = "go_fond", when = { class = "HUNTER" }, fx = { affinity = 2, opinion = { goblins = "fond" } } },
        { text = "Just browsing, Kaja.", next = "BACK" },
      },
    },
    go_respect = {
      lines = { { id = "gor_default", text = "Whoa, a compliment, and from a customer! Sparks and sprockets, I'm gonna write that down and hang it behind the counter where the grunts can read it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go_distrust = {
      lines = { { id = "god_default", text = "Tomorrow? Pal, please, the Alliance pays slow and haggles hard, so it'd be next week at the earliest. I'm kidding, I'm kidding, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go_useful = {
      lines = { { id = "gou_default", text = "Useful! Now that's a word I can put on a sign, and it flows both ways, friend, because your gold is very useful to me too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go_fond = {
      lines = { { id = "gof_default", text = "You hear that, everybody? A loyal customer! Next crate of shot's got your name on it, at full price, because I've got principles." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      big = true,
      lines = { { id = "dw_default", text = "Officially, no, pal, because this is the Horde's city and I'm a loyal guest in it. Unofficially, a gun doesn't care who's holding it, and the Steamwheedle Cartel doesn't care who's paying, so let's just say business is business." } },
      choices = {
        { text = "Selling to both sides is smart business.", next = "BACK", reply = "That's what I keep sayin', pal, and nobody believes me. Business is business.", fx = { align = { honor = -1 } } },
        { text = "A guest of the Horde should choose a side.", next = "BACK", reply = "I did choose, pal, I chose the side that pays. Don't tell the Warchief.", fx = { align = { honor = 1 } } },
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
    { id = "g_flinch", text = "Did you hear that bang just now? That be the third one this morning, and every bird in the valley flown off to the Barrens because of it." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear, good! You'll know a proper bow when you hold one, not like these orcs who think louder be better." },
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
        { id = "h_engineer", when = { profession = "Engineering" }, text = "Jin'sora, and I can smell the black powder on you from here, so you be one of the gun-makers. I'll sell to you anyway, because I be a patient troll, but don't touch the strings with those hands." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I got strings to wax." },
        { id = "h_again2", text = "Ask quick, before that goblin fires off another one and I forget what I was saying." },
      },
      choices = {
        { text = "Most hunters I've met seem to favor guns.", next = "guns" },
        { text = "Where does your wood come from?", next = "wood" },
        { text = "What makes a good bowstring?", next = "strings" },
        { text = "Do you and Kaja really hate each other?", next = "kaja" },
        { text = "Have you ever fired a gun yourself?", next = "fired" },
        { text = "I'm a hunter. What bow would you recommend?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I make guns, you know. They're not so bad.", next = "engineer", when = { profession = "Engineering" } },
        { text = "I'm a warrior. Why would I want a bow?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Farewell, Jin'sora.", next = "END" },
      },
    },
    guns = {
      big = true,
      lines = { { id = "gu_default", text = "A bow be quiet, a bow don't blow up in your face, and a bow you can fix yourself in the middle of the jungle. A gun breaks, and you need a goblin to fix it, and then you owe that goblin money forever." } },
      choices = {
        { text = "Quiet and simple. A bow is the hunter's way.", next = "BACK", reply = "That be the hunter's way, mon, and the jungle's way too. A bow never betray you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A gun hits harder. I'll take the noise.", next = "BACK", reply = "Then you'll be owin' a goblin forever, mon. Enjoy the noise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "wo_default", text = "Ashenvale, mostly, from what the Warsong bring back. The night elves would kill me for saying so, but their trees make the best bows on Kalimdor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strings = {
      lines = { { id = "st_default", text = "Sinew, twisted tight and waxed every morning before the sun touches it, and no shortcuts. A dry string sings flat and a wet one stretches, and either way your arrow lands somewhere you didn't ask it to." } },
      choices = {
        { text = "Every single morning?", next = "strings_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strings_more = {
      lines = { { id = "sm_default", text = "Every single morning, mon, since I was small on the islands, and I've never once missed. The one day I miss will be the day a centaur comes over the hill, so I don't plan to find out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaja = {
      lines = { { id = "ka_default", text = "Hate be a strong word, mon. We trade insults across the path every morning, Kaja about my sticks and me about that goblin's thunder, and the grunts stop to listen like it be a show." } },
      choices = {
        { text = "So you'd miss Kaja if the stall closed?", next = "kaja_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaja_miss = {
      lines = { { id = "km_default", text = "I would never say that out loud, and you won't either, if you want to buy from me again. Who else would I argue with all day long?" } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    fired = {
      lines = { { id = "fi_default", text = "Once, to see what all the noise was about, and I couldn't hear out of my left ear for two days. Now you tell me true, mon: have you ever fired one of those things?" } },
      choices = {
        { text = "I have, and I liked it.", next = "fi_liked", fx = { affinity = -1, trait = { honest = 1 } } },
        { text = "Never. I trust a bowstring over powder.", next = "fi_never", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Once, and I nearly lost my eyebrows.", next = "fi_brows", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    fi_liked = {
      lines = { { id = "fl_default", text = "Well, at least you be honest about it, mon, not like dem hunters who buy from Kaja in the morning and sneak to me at night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fi_never = {
      lines = { { id = "fn_default", text = "Good, and keep it that way. Your ears will thank you when you be old and can still hear a raptor in the grass." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fi_brows = {
      lines = { { id = "fb_default", text = "Ha! Then you've learned the lesson cheaper than most. Kaja's cousins lose their eyebrows every season, and Kaja calls it the cost of doing business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "The strongest one you can pull without shaking, mon, and not the prettiest. A pretty bow you can't draw be just a decoration for your back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      big = true,
      lines = { { id = "en_default", text = "Not so bad, says the one who builds them, while the rest of the valley picks the soot out of its ears. Tell me, gun-maker, what do you think a weapon should be?" } },
      choices = {
        { text = "Loud and frightening. Fear wins half the fight.", next = "BACK", reply = "Fear wins half, mon, but a misfire loses the other half. I'll keep my bow, thank you.", fx = { align = { order = -1 } } },
        { text = "Quiet and reliable. You've a point there.", next = "BACK", reply = "Ha! You hear that, valley? The gun-maker agree with Jin'sora. Quiet and reliable, mon.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Because sometimes the thing you want to hit be on the other side of a river, and shouting at it don't work. Shoot it once, mon, and it come running to you, which a warrior like anyway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know that, mon, and I can't hear myself think over that goblin's banging. Ask me about bows instead." } },
  },
}
