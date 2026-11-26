-- Durotar folk with no conversation yet: Yelnagi Blackarm of Razor Hill, a Sen'jin Watcher on the
-- village palisade, and a Steamwheedle Bruiser keeping the Cartel's peace on the road.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Yelnagi Blackarm: an old Razor Hill hand who minds the town's stores and gossip.
P:NPC {
  key = "dur_yelnagi_blackarm", id = TODO_NPC("Yelnagi Blackarm"), name = "Yelnagi Blackarm", gender = "male",
  role = "townsfolk", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff", "steady" }, values = { "practical", "loyal" },
  notices = { "race", "level" },
  impression = {
    first = "Yelnagi Blackarm leans on a barrel outside the Razor Hill inn with one arm black to the elbow from years of tar and forge soot. He watches the road as if he expects it to owe him money.",
    third = "{name} met Yelnagi Blackarm, an old orc who keeps an eye on Razor Hill's stores.",
  },
  greetings = {
    { id = "g_default", text = "Another face on the road from the Valley of Trials. Stay out of the way of the wagons and we will get along fine, {class}." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. Razor Hill has seen plenty who could not say the same." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "Darkspear, eh? Your people at Sen'jin trade us fish for iron, and it is the best bargain this town ever made." },
    { id = "n_low", cat = "level", when = { maxLevel = 10 }, text = "You still have the dust of the Valley on your boots. Do not go picking fights at Tiragarde Keep yet, young one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Yelnagi, and I count what comes into Razor Hill and what goes out of it again. Most of it goes to Orgrimmar, and most of what comes back is complaints." } },
      again = {
        { id = "h_again", text = "What else? Make it quick, the wagon from the city is due." },
        { id = "h_again2", text = "Speak up, {class}. My ears are not what they were before the camps." },
      },
      choices = {
        { text = "What does Razor Hill need most?", next = "need" },
        { text = "Your arm is black as a smith's anvil.", next = "arm" },
        { text = "Who causes trouble around here?", next = "trouble" },
        { text = "How long have you counted for Razor Hill?", next = "ylong" },
        { text = "What's the hardest thing to get here?", next = "yhard" },
        { text = "Do you trust the goblin traders?", next = "ygob" },
        { text = "What about the humans at Tiragarde Keep?", next = "ytiragarde" },
        { text = "Why count everything so carefully?", next = "ycamp" },
        { text = "Farewell, Yelnagi.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Timber, mostly, and there is none of it in this red dirt. Every plank in this town came down from Ashenvale or over the sea, and the night elves are not glad to see either road used." } },
      choices = {
        { text = "Then take the wood. Ashenvale has plenty.", next = "BACK", reply = "Spoken like a Warsong grunt. Plenty of them have said that, and plenty of them are buried under it.", fx = { align = { honor = -1 } } },
        { text = "Better to trade fairly than start another war.", next = "BACK", reply = "Thrall would agree with you, and so do I most days. The elves do not seem to, though.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arm = {
      lines = { { id = "a_default", text = "Tar from the internment camp at Durnholde, where the humans had me caulking their barges for nine years. It never washed off, so now I call it a badge." } },
      choices = {
        { text = "Do you hate the humans for it?", next = "hate" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    hate = {
      lines = { { id = "ht_default", text = "I hated them for a long time, and it did nothing but keep me awake. The Warchief taught us to save our anger for the battle and our strength for the building, and I am too old now to argue with him." } },
      choices = { { text = "Wise words. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trouble = {
      lines = { { id = "t_default", text = "The Burning Blade cultists in the Skull Rock caves, and the humans at Tiragarde Keep along the coast. Gar'Thok in the bunker will give you work against both if you have the stomach for it." } },
      choices = { { text = "I'll speak to Gar'Thok. Something else.", next = "BACK" } },
    },
    ylong = {
      lines = {
        { id = "yylong_d", text = "Since the first wall went up, when Gar'Thok was still shouting at the timber crews. I counted every log, every nail and every scorpion we found in the boots. It was a lot of scorpions." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhard = {
      lines = {
        { id = "yyhard_d", text = "Iron, and good wood, and sometimes patience. Orgrimmar takes the best of everything, and Razor Hill gets what's left. I keep the lists, and the lists are always short." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygob = {
      lines = {
        { id = "yygob_d", text = "I trust them to cheat me, and so I am never surprised. The ones from Ratchet are honest goblins, which means they cheat you honestly. The Venture Company cheats you and burns your forest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytiragarde = {
      lines = {
        { id = "yytiragarde_d", text = "The humans at Tiragarde Keep sit on the coast and send raiding parties up the road. Some grunts want to burn them out. Others say Thrall wants peace, and we should leave them be." },
      },
      choices = {
        { text = "Burn them out. They're on our land.", next = "BACK", reply = "Gar'Thok would agree. Thrall might not.", fx = { align = { order = -1 } } },
        { text = "Thrall wants peace. Follow the Warchief.", next = "BACK", reply = "Yes. The Warchief knows more than any grunt.", fx = { align = { order = 1 } } },
      },
    },
    ycamp = {
      lines = {
        { id = "yycamp_v0", when = { race = "Orc" }, text = "You were in the camps too? Then you know why I count everything. In the camps, the humans counted us. Now I count for us." },
        { id = "yycamp_d", text = "You were in the camps too? Then you know why I count everything. In the camps, the humans counted us. Now I count for us, and nobody counts me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gar_thok = { { id = "ytp_gar_thok", text = "Gar'Thok runs Razor Hill. He shouts a lot, but he listens, too." } },
    orgrimmar = { { id = "ytp_orgrimmar", text = "Orgrimmar takes our best and sends back orders. That is how capitals work." } },
    background = { { id = "tp_bg", text = "I was nine years behind human walls and three years building this town. I like the building better." } },
    _none = { { id = "tp_none", text = "I count crates, {class}. Ask somebody who has time to wonder about things." } },
  },
}

-- Sen'jin Watcher: a Darkspear guard on the palisade of Sen'jin Village.
P:NPC {
  key = "dur_senjin_watcher", id = TODO_NPC("Sen'jin Watcher"), name = "Sen'jin Watcher",
  role = "guard", tier = "service",
  communities = { "senjin" }, temper = { "watchful", "easy" }, values = { "loyal" },
  notices = { "race" },
  impression = {
    first = "A Darkspear watcher leans on a spear at the edge of Sen'jin Village, eyes on the water and the Echo Isles beyond it. He grins easily, but the grin never quite reaches the islands.",
    third = "{name} spoke with one of the Sen'jin Watchers who guard the Darkspear village.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Sen'jin, mon. Keep your weapons sheathed in de village and you be fine." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "Ah, one of de tribe come home. De loa be watchin' you, cousin, so do us proud out dere." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be watchin' de water, {class}, because de Echo Isles still belong to Zalazane and his mad witch doctors. One day we take dem back, but today we just watch." } },
      again = { { id = "h_again", text = "Somethin' else, mon? I still got eyes on de islands." } },
      choices = {
        { text = "Who is Zalazane?", next = "zalazane" },
        { text = "Why did your people leave the isles?", next = "left" },
        { text = "What's life like in Sen'jin?", next = "xlife" },
        { text = "Do you ever go near the Isles?", next = "xnear" },
        { text = "Darkspear to Darkspear: will we take the Isles back?", next = "xback", when = { race = "Troll" } },
        { text = "Who taught you to watch the water?", next = "ytaught" },
        { text = "What do you see at night?", next = "ynight" },
        { text = "What do you think of the orcs?", next = "yorcs" },
        { text = "Keep watching, then.", next = "END" },
      },
    },
    zalazane = {
      lines = { { id = "z_default", text = "He was one of our own witch doctors before he went bad, and now he puts his hex on our people and makes dem his slaves. Master Gadrin in de village can tell you more, if you want to help." } },
      choices = {
        { text = "He should be killed before he spreads further.", next = "BACK", reply = "Dat be de plan, mon, as soon as we got de spears for it.", fx = { align = { order = 1 } } },
        { text = "Maybe his thralls can still be saved.", next = "BACK", reply = "Some can, maybe, but dat be a job for de witch doctors and not for me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "Zalazane's madness drove us off, and Thrall gave us dis shore when we had nowhere else. Vol'jin say we owe de Warchief, and de Darkspear always pay what dey owe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlife = {
      lines = {
        { id = "x_xlife", text = "Quiet, mon, too quiet for a troll who likes de drums. We fish, we hunt, we keep de young ones from de water, and every night we watch de islands burn with Zalazane's fires." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnear = {
      narr = "His grin fades, and he looks out toward the islands.",
      lines = {
        { id = "x_xnear", text = "Once, on a dare when I be young, and I see me own cousin walkin' de shore with dead eyes. Zalazane's magic take him, and I don't go back since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xback = {
      lines = {
        { id = "x_xback", text = "Vol'jin say yes, an' I say yes, but some say de Isles be cursed now and we should make a new home here. I don't know, mon, I just watch." },
      },
      choices = {
        { text = "The Isles are your home. Take them back.", next = "BACK", reply = "Dat be de old blood talkin'. I like it.", fx = { align = { honor = 1 } } },
        { text = "Sen'jin is home now. Build here.", next = "BACK", reply = "Maybe, mon. Maybe dat be wisdom.", fx = { align = { honor = -1 } } },
      },
    },
    ytaught = {
      lines = {
        { id = "yytaught_d", text = "My grandmother, who watched for murlocs and pirates on de Isles before Zalazane came. She say de water always tell you what be comin', if you be patient enough to listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ynight = {
      lines = {
        { id = "yynight_d", text = "Fires on de Isles, and drums, and sometimes screams. Zalazane's thralls dance till dey fall down. I try not to look too long, because some of dem used to be my cousins." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yorcs = {
      lines = {
        { id = "yyorcs_v0", when = { race = "Orc" }, text = "Your Warchief gave us dis land when we had nothin', brudda. Orcs be loud and eat too much, but you keep your word. A troll ask nothin' better." },
        { id = "yyorcs_d", text = "Thrall gave us dis land when we had nothin' but boats and blood. De orcs be loud and dey eat too much, but dey keep dey word. A troll can ask for nothin' better from a friend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raptors = { { id = "ytp_raptors", text = "De raptors on de Isles be fast, mon. We used to race dem as children." } },
    echo_isles = { { id = "ytp_echo_isles", text = "De Echo Isles be home. De sand be white and de water be warm, and Zalazane don't deserve dem." } },
    vol_jin = { { id = "ytp_vol_jin", text = "Vol'jin be our chief now. He clever, and he patient, and he hate Zalazane more dan anyone." } },
    murlocs = { { id = "ytp_murlocs", text = "De murlocs be everywhere on dis coast. Dey be noisy, but dey don't be smart." } },
    sen_jin = { { id = "tp_xsen_jin", text = "Sen'jin Village be named for our old chief. He died so we could live." } },
    echo_isles = { { id = "tp_xecho_isles", text = "De Echo Isles be our home, and Zalazane stole dem." } },
    _none = { { id = "tp_none", text = "I don't know nothin' about dat, mon. I just watch de water." } },
  },
}

-- Steamwheedle Bruiser: Cartel muscle keeping goblin trade safe along the coast.
P:NPC {
  key = "dur_steamwheedle_bruiser", id = TODO_NPC("Steamwheedle Bruiser"), name = "Steamwheedle Bruiser",
  role = "guard", tier = "service",
  communities = { "razor_hill" }, temper = { "brusque", "wry" }, values = { "practical" },
  impression = {
    first = "The Steamwheedle Bruiser is a goblin built like a barrel, with a club on his belt and a Cartel badge polished brighter than anything else he owns.",
    third = "{name} spoke with a Steamwheedle Bruiser, one of the Cartel's hired guards.",
  },
  greetings = {
    { id = "g_default", text = "Easy there, pal. Whatever you're thinkin' about startin', the Cartel already billed somebody to finish it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the peace for the Steamwheedle Cartel, friend, which means nobody breaks nothin' that belongs to a paying customer. Horde, Alliance, it's all the same coin to me." } },
      again = { { id = "h_again", text = "Still here? Talkin' to me don't cost you nothin', so go on." } },
      choices = {
        { text = "You'd guard an Alliance merchant too?", next = "neutral" },
        { text = "What happens if someone breaks the peace?", next = "peace" },
        { text = "How did you become a bruiser?", next = "xhow" },
        { text = "What's the strangest fight you've broken up?", next = "xfight" },
        { text = "Goblin to goblin: what's the pay like?", next = "xpay", when = { race = "Goblin" } },
        { text = "Ever been hurt on the job?", next = "yhurt" },
        { text = "Do you have any family?", next = "yfam" },
        { text = "Is it dangerous, being neutral?", next = "ydanger" },
        { text = "I'll be going.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "Sure I would, and I'd charge him the same rate as you. The Cartel don't take sides, because sides are bad for business and business is the only side worth bein' on." } },
      choices = {
        { text = "Neutral gold still funds our enemies.", next = "BACK", reply = "And your gold funds theirs too, pal, so I guess we're all even.", fx = { align = { honor = 1 } } },
        { text = "Smart. War is better as a customer than a cause.", next = "BACK", reply = "Now you're talkin' like a goblin. I might even like you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "Then me and the boys bust some heads, and the bill for the busting goes to whoever started it. It's a real tidy system, and I recommend nobody test it." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    xhow = {
      lines = {
        { id = "x_xhow", text = "I was a dockhand in Ratchet, and I punched a pirate who tried to skip out on a debt. The Cartel liked my form, and they gave me a badge and a club and a pension plan." },
      },
      choices = {
        { text = "A pension plan?", next = "xpension" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpension = {
      lines = {
        { id = "x_xpension", text = "In theory, pal, if I live to retire, which in this job is about a coin flip. The paperwork's lovely, though." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfight = {
      lines = {
        { id = "x_xfight", text = "A tauren and an orc arguin' over whose turn it was at the water barrel. I stepped in, got knocked flat, and when I woke up, they'd made up and were buyin' me a drink." },
      },
      choices = {
        { text = "Should you even get involved?", next = "xinvolve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xinvolve = {
      lines = {
        { id = "x_xinvolve", text = "Some of the boys say we should only break up fights that hurt the merchandise. I say a peaceful market sells more, so I break up all of 'em." },
      },
      choices = {
        { text = "Keep the peace everywhere. Good for everyone.", next = "BACK", reply = "Now that's a fella who understands business.", fx = { align = { order = 1 } } },
        { text = "Only protect what you're paid to.", next = "BACK", reply = "Sure, sure, and save the knuckles for overtime.", fx = { align = { order = -1 } } },
      },
    },
    xpay = {
      narr = "He rubs his knuckles, which are scarred like old leather.",
      lines = {
        { id = "x_xpay", text = "Steady, chum, and the Cartel pays on time, which is more than I can say for most. Plus hazard bonus, which in Durotar is every day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhurt = {
      lines = {
        { id = "yyhurt_d", text = "A tauren sat on me once. Not on purpose, he was drunk, but I still can't feel my left ear. I put him out in the cold, and he paid for the damage, so we're square." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfam = {
      lines = {
        { id = "yyfam_v0", when = { race = "Goblin" }, text = "A wife in Ratchet and three kids who think I'm a war hero, cousin. You'd do the same. A goblin's got to have a little glory." },
        { id = "yyfam_d", text = "A wife in Ratchet and three kids who think I'm a war hero. I let 'em think it. A goblin's got to have a little glory, or what's the point of all this muscle?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydanger = {
      lines = {
        { id = "yydanger_d", text = "The Alliance and Horde shake hands at the bar, then knife each other in the alley. I'm in between, and they both hate me for it. Best job in the world, if you ask me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "ytp_booty_bay", text = "Booty Bay's where they train us. If you can keep the peace there, you can keep it anywhere." } },
    cartel_rules = { { id = "ytp_cartel_rules", text = "Cartel rules are simple. Don't break nothin', don't kill nobody, and pay your tab." } },
    ratchet = { { id = "ytp_ratchet", text = "Ratchet's the Cartel's port in the Barrens. I keep the peace there, and here, and anywhere they pay me." } },
    bruisers = { { id = "ytp_bruisers", text = "Bruisers keep the Cartel neutral, with clubs if we have to." } },
    steamwheedle = { { id = "tp_xsteamwheedle", text = "The Steamwheedle Cartel keeps trade flowing. I keep it from flowing into fistfights." } },
    _none = { { id = "tp_none", text = "I don't get paid to know that, friend. I get paid to stand here and look scary." } },
  },
}

-- Deathguard Elite: a Forsaken elite guard at the ruins of Lordaeron in Tirisfal Glades (Classic 1.12 spawns are in Tirisfal only; the file sits in the Durotar pack).
P:NPC {
  key = "dur_deathguard_elite", id = 7980, name = "Deathguard Elite", gender = "male",
  role = "guard", tier = "quest",
  temper = { "cold", "dry" }, values = { "duty", "loyal" },
  notices = { "race", "kit" },
  impression = {
    first = "He stands too still for a living guard, and he knows it unsettles people.",
    third = "{name} spoke with a Deathguard Elite, one of the Forsaken guards at the ruins of Lordaeron.",
  },
  greetings = {
    { id = "g_default", text = "Keep walking, or state your business. The Dark Lady's gate is no place to loiter, so I would prefer you were brief." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I remember faces, living one, and yours has not rotted yet." },
    { id = "g_undead", when = { race = "Scourge" }, text = "Ah, one of our own, and still in one piece. The Dark Lady's blessing upon you, cousin." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "Your kind still watch me as if I might bite. I have told them I only bite the Scarlet Crusade, but they never laugh." },
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.5 } }, text = "You are bleeding, living one. It is a habit we Forsaken gave up, and I cannot say I miss it." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "His armour is clean, but the hand on his halberd shows bone at the knuckles.",
      lines = { { id = "h_default", text = "I am of the Deathguard's elite, and I keep the ruins of Lordaeron so that nothing reaches the Undercity unseen. The orcs are allies, but an ally is not the same as a friend." } },
      again = {
        { id = "h_again", text = "Something more? I have nowhere to be, and all the time in the world." },
        { id = "h_again2", text = "Speak. Standing still is the one thing I am never tired of." },
      },
      choices = {
        { text = "What are you guarding against?", next = "why" },
        { text = "Do you miss the living city that stood here?", next = "heat" },
        { text = "How do the orcs treat your people?", next = "orcs" },
        { text = "Any word from Brill for one of our own?", next = "home", when = { race = "Scourge" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The Scourge, the Scarlet Crusade, and spies from Stormwind who would love a look at our sewers. The Dark Lady does not trust easily, and she trusts the living least of all." } },
      choices = {
        { text = "Does she trust Thrall?", next = "thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "She trusts that Thrall needs us, and that we need the Horde's axes against the Scourge and the Crusade. That is a sturdier thing than trust, I think, because it does not depend on anyone's good nature." } },
      choices = {
        { text = "The Horde is stronger with the Forsaken in it.", next = "BACK", reply = "Then say so to the grunts at the gate, living one, because they have not yet worked it out.", fx = { align = { order = 1 } } },
        { text = "A bargain like that breaks the day it stops paying.", next = "BACK", reply = "Very likely, and every Forsaken in the Undercity knows it. That is why I keep my halberd sharp.", fx = { align = { order = -1 } } },
      },
    },
    heat = {
      lines = { { id = "he_default", text = "I stood guard on these walls when Terenas still held court above us, and I watched the prince come home. Missing it does no good, so I keep the gate instead." } },
      choices = { { text = "Then keep it well. Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Correctly, which is more than I expected. They look at us the way a soldier looks at a sword someone else forged, wondering whether it will turn in the hand, but they keep their bargain and our rations come." } },
      choices = {
        { text = "Rations? The dead eat?", next = "rations" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rations = {
      lines = { { id = "r_default", text = "Not as you do, and not anything I would describe to you on an empty stomach. The quartermasters below have stopped asking what I want with the scraps, which is a kindness of a sort." } },
      choices = { { text = "I'll not ask either. Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Brill holds, and the Apothecaries are busy in their cellars at something they will not explain to a guard. The Scarlet zealots still burn our dead in the fields north of the town, so the Deathguard there will be glad of any blade you send them." } },
      choices = { { text = "I'll go back and help, when I can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a soldier of Lordaeron once, and then I was nothing, and now I serve the Dark Lady. I have found the last arrangement suits me best." } },
    _none = { { id = "tp_none", text = "I am a guard, living one, not a librarian. Ask someone who still has a pulse to waste on curiosity." } },
  },
}

-- Elder Runetotem: a tauren elder honoured at Razor Hill during the Lunar Festival.
P:NPC {
  key = "dur_elder_runetotem", id = 15572, name = "Elder Runetotem", gender = "female",
  role = "elder", tier = "quest",
  temper = { "calm", "gentle" }, values = { "ancestors", "tradition" },
  notices = { "race", "season" },
  impression = {
    first = "An old tauren wrapped in the glow of the Lunar Festival, patient as a hill.",
    third = "{name} paid respects to Elder Runetotem at Razor Hill during the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, child of the Earth Mother. The new year turns, and the ancestors are near enough to hear us speak." },
    { id = "g_done", when = { questDone = TODO_QUEST("Runetotem the Elder") }, text = "You honoured me already, and the ancestors remember it. Sit a while, if your road allows." },
    { id = "g_ally", when = { faction = "Alliance" }, text = "A stranger from the north, standing in an orc town. The festival makes brave travellers of us all, it seems." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "One of the herd, far from Mulgore. I am glad to see the young still walk the paths of the elders." },
    { id = "n_lunar", cat = "season", when = { holiday = "lunar" }, text = "The lanterns in Moonglade are lit, and every elder in the land stands where the ancestors bid us. You honour us by seeking us out." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "Pale light gathers about her horns, and she waits a long moment before speaking.",
      lines = { { id = "h_default", text = "I am Runetotem, an elder of my tribe, and while the Lunar Festival lasts I stand here as the ancestors ask. Those who come to me carry the year's honour from one elder to the next." } },
      again = {
        { id = "h_again", text = "Ask what you will. The moon is in no hurry, and neither am I." },
        { id = "h_again2", text = "Speak, young one. An elder's ears are the last thing to grow old." },
      },
      choices = {
        { text = "What is the Lunar Festival, to the tauren?", next = "festival" },
        { text = "Why stand here, among the orcs of Razor Hill?", next = "here" },
        { text = "I've come to honour you, elder.", next = "honour", when = { questActive = TODO_QUEST("Runetotem the Elder") } },
        { text = "Tell me of the Runetotem tribe.", next = "tribe", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, elder.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year, when the old moon gives way to the new. We remember Elune's Omen, who drove the dark from the world long ago, and we honour the elders who carry the memory of those who walked before us." } },
      choices = {
        { text = "And the ancestors themselves?", next = "ancestors" },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    ancestors = {
      lines = { { id = "a_default", text = "They are in the wind over the plains and in the stones beneath our hooves, and on these nights they draw close enough to touch. An elder listens for them so that the young need not walk alone." } },
      choices = {
        { text = "The dead should rest. Let them be.", next = "BACK", reply = "They do rest, young one, and they choose to come anyway. We do not call them; we only make room.", fx = { align = { order = -1 } } },
        { text = "A people that forgets its ancestors is lost.", next = "BACK", reply = "So the elders of my youth told me, and so I tell you. Carry it gently.", fx = { align = { order = 1 } } },
      },
    },
    here = {
      lines = { { id = "he_default", text = "The ancestors do not ask where a tauren is comfortable, only where the honour should be found. The orcs here gave us land and friendship when the centaur pressed us hard, and an elder among them repays a little of that debt." } },
      choices = {
        { text = "The orcs and tauren are true allies, then.", next = "allies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    allies = {
      lines = { { id = "al_default", text = "Thrall and Cairne swore it, and both are bulls who keep their word. The orcs are loud and quick to the axe, but they bled for Mulgore when no one else would, and the herd does not forget." } },
      choices = { { text = "Then the herd is wise. Something else.", next = "BACK" } },
    },
    honour = {
      narr = "She lays a broad hand on your shoulder, and the touch is warm as summer earth.",
      lines = { { id = "ho_default", text = "Then take my blessing, and with it a coin of the ancestors, as the elders give to all who seek them. Go on to the next of us, for there are many elders standing across Kalimdor and the Eastern Kingdoms tonight." } },
      choices = { { text = "I will seek them all, elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    tribe = {
      lines = { { id = "t_default", text = "The Runetotem keep the old ways of the shaman and the druid, and Hamuul of our tribe leads the druids in Thunder Bluff. We read the land as other folk read scrolls, slowly, and with great care." } },
      choices = { { text = "I will visit Hamuul in Thunder Bluff. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am old, and of the Runetotem, and I have seen many moons turn. That is all a tauren elder needs to be." } },
    _none = { { id = "tp_none", text = "That is a question for younger legs than mine to chase, child. The Earth Mother keeps some answers to herself." } },
  },
}

-- Holgar Stormaxe: an orc officer at the road below Orgrimmar's gate, who sees new recruits up the hill.
P:NPC {
  key = "dur_holgar_stormaxe", id = 4311, name = "Holgar Stormaxe", gender = "male",
  role = "officer", tier = "quest",
  temper = { "gruff", "proud" }, values = { "honor", "horde" },
  notices = { "race", "class" },
  impression = {
    first = "A scarred orc officer who sizes up every newcomer like a fresh recruit.",
    third = "{name} met Holgar Stormaxe, who watches the road beneath Orgrimmar's gates.",
  },
  greetings = {
    { id = "g_default", text = "Halt and stand straight, {class}. Everyone who climbs to Orgrimmar passes me first, and I like to see their faces." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and you still have all your limbs. That is more than I wagered." },
    { id = "g_ally", when = { faction = "Alliance" }, text = "You have strayed a very long way, human-friend. Turn around before the grunts on the wall see you." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" }, text = "A warrior, good. The Horde can always use another axe that knows which end to swing." },
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "Darkspear. Your people fought well beside us at the landing, and I have not forgotten it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Holgar Stormaxe, and I see to the recruits who come up this road to join the Warchief's Horde. Some of them become warriors, some go home, and a few end up feeding the vultures." } },
      again = {
        { id = "h_again", text = "Speak, then. The road is quiet for now." },
        { id = "h_again2", text = "More questions? A good soldier asks them before the battle, not after." },
      },
      choices = {
        { text = "What makes a good recruit, to your eye?", next = "recruits" },
        { text = "Were you in the internment camps?", next = "camps", when = { race = "Orc" } },
        { text = "Is Orgrimmar under threat out here?", next = "threats" },
        { text = "You look like you've fought in many wars.", next = "wars" },
        { text = "Lok'tar, Holgar.", next = "END" },
      },
    },
    recruits = {
      lines = { { id = "r_default", text = "One who listens before he swings and doesn't run when the blood comes. Strength can be taught on the training ground, but a coward's heart cannot be beaten out of him." } },
      choices = {
        { text = "And the ones who fail?", next = "fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail = {
      lines = { { id = "f_default", text = "They are sent home with no shame, if they tried. The Horde needs farmers and fishers and peons as much as it needs blades, and an orc who knows his place serves better than a fool who doesn't." } },
      choices = {
        { text = "Every orc should be given the chance to fight.", next = "BACK", reply = "Every orc is. Not every orc is given the chance to fight twice.", fx = { align = { order = -1 } } },
        { text = "Discipline is what keeps the Horde alive.", next = "BACK", reply = "Spoken like a sergeant. You may yet be worth the trouble.", fx = { align = { order = 1 } } },
      },
    },
    camps = {
      narr = "His jaw tightens, and one thumb runs along the haft of his axe.",
      lines = { { id = "c_default", text = "Three winters behind human walls, and I watched good warriors forget how to stand. When Thrall broke the camps open I swore no orc would ever kneel like that again, and that is why I train the young ones hard." } },
      choices = { { text = "Never again. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    threats = {
      lines = { { id = "t_default", text = "The Burning Blade skulk in the caves and the canyons, the Kul Tiras men sit behind their wall to the south, and the centaur raid anything that strays from the road. None of them will take Orgrimmar, but all of them can take a careless grunt." } },
      choices = {
        { text = "The humans at Tiragarde Keep worry you?", next = "kultiras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kultiras = {
      lines = { { id = "k_default", text = "Proudmoore's men came for us at Theramore and died for it, and the ones left sit in that keep like rats in a barrel. They are no danger to the city, but they are a danger to every young orc who thinks he can take them alone." } },
      choices = { { text = "I'll take friends with me, then. Something else.", next = "BACK" } },
    },
    wars = {
      lines = { { id = "w_default", text = "Two of them on the far side of the sea, and the one we had to fight to be free. I carry the scars of all three, and I would trade every one of them for the young to have none." } },
      choices = { { text = "That is a worthy thing to want. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A warrior of the old Horde, a prisoner of the camps, and now a soldier of the new. I prefer the last of those." } },
    _none = { { id = "tp_none", text = "I keep the road, not the archives. Ask in the city if it matters so much." } },
  },
}

-- Blood Guard Hini'wana: the Darkspear officer in Orgrimmar's Hall of Legends who outfits the Horde's veterans.
P:NPC {
  key = "dur_hiniwana", id = 12789, name = "Blood Guard Hini'wana", gender = "male",
  role = "quartermaster", tier = "service",
  temper = { "sly", "proud" }, values = { "honor", "horde" },
  notices = { "race", "rank" },
  impression = {
    first = "A Darkspear blood guard who looks over your armour before he looks at your face.",
    third = "{name} spoke with Blood Guard Hini'wana in the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "Ya come to de Hall of Legends, mon, so ya must think ya got a legend in you. Let's see if de battlefield agrees." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and wit' a few more scars, I see. Good, dat's how it be done." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "A Darkspear walkin' tall in Orgrimmar. Vol'jin would like to see dat, cousin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Hini'wana, blood guard of de Horde, and I give de finest arms to dose who earn dem fightin' de Alliance. No gold buys what I keep, only honour won in de field." } },
      again = { { id = "h_again", text = "Somethin' else on ya mind, mon?" }, { id = "h_again2", text = "Talk quick, de warriors be lining up behind ya." } },
      choices = {
        { text = "How does one earn your notice?", next = "earn" },
        { text = "A troll guarding orc treasures seems odd.", next = "troll" },
        { text = "How long have you served the Horde?", next = "xlong" },
        { text = "What do you think of the Alliance?", next = "xalli" },
        { text = "What does honour mean to you?", next = "xhonour" },
        { text = "Darkspear to Darkspear: how fare the islands?", next = "xisles", when = { race = "Troll" } },
        { text = "Farewell, blood guard.", next = "END" },
      },
    },
    earn = {
      lines = { { id = "e_default", text = "Ya fight in Warsong Gulch, in Alterac Valley, wherever de Alliance stand against us, and ya climb de ranks one bloody step at a time. De Warchief's officers keep count, and dey don't forget a name." } },
      choices = {
        { text = "Fighting the Alliance is a duty I relish.", next = "BACK", reply = "Hah! Dat's de spirit, but keep ya head, mon, because de dead don't climb no ranks.", fx = { align = { order = 1 } } },
        { text = "I'd rather fight the Scourge than humans.", next = "BACK", reply = "Dere be plenty of both, so ya can have ya pick. Still, de ranks only count one kind.", fx = { align = { order = -1 } } },
      },
    },
    troll = {
      lines = { { id = "t_default", text = "Dat's de point, mon. Thrall put a Darkspear here so every orc who walks in remembers we bled beside dem, and every troll remembers dere be a place for us in de Horde." } },
      choices = {
        { text = "Your people owe Thrall a great deal.", next = "debt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt = {
      lines = { { id = "d_default", text = "Sen'jin died so we could be free of de murlocs and de sea witch, and Thrall carried us across de sea. We pay dat debt wit' spears, and we be payin' it a long time yet." } },
      choices = { { text = "Then you pay it well. Something else.", next = "BACK" } },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Since de day Thrall's ships pulled us out of de sea and away from de murlocs and de humans. I fight for him ever since, an' I give de arms to dose who fight de way I did." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalli = {
      lines = {
        { id = "x_xalli", text = "Dey be strong and stubborn, and dey hate us for being green. Some say de Horde should make peace with dem, and some say we should crush dem before dey crush us." },
      },
      choices = {
        { text = "The Alliance must be broken.", next = "BACK", reply = "Dat be de fighter in you talkin'. Earn it on de field.", fx = { align = { order = 1 } } },
        { text = "Peace would save many lives.", next = "BACK", reply = "Maybe, mon. But peace don't earn medals.", fx = { align = { order = -1 } } },
      },
    },
    xisles = {
      narr = "He touches the tusks on his necklace, one by one.",
      lines = {
        { id = "x_xisles", text = "Zalazane still hold dem, and de witch doctors still dance with dere mad spirits. But Vol'jin say de Darkspear will go home one day, and I believe him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhonour = {
      lines = {
        { id = "x_xhonour", text = "Honour be what you earn when you fight hard an' fight fair, mon. Some fight only for de gold, and I see it in dere eyes, and dey get nothin' from me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    vol_jin = { { id = "tp_xvol_jin", text = "Vol'jin be our leader and Thrall's friend. De Darkspear follow him to de end." } },
    honour = { { id = "tp_xhonour", text = "Honour be won in de field, mon, not bought at de counter." } },
    background = { { id = "tp_bg", text = "A Darkspear of de Echo Isles who learned to fight in de Horde's wars, and lived long enough to wear dis rank." } },
    _none = { { id = "tp_none", text = "Dat ain't my business, mon. Mine be steel and honour." } },
  },
}

-- Scout Manslayer: an orc scout who patrols the streets and roads of Orgrimmar.
P:NPC {
  key = "dur_scout_manslayer", id = 14376, name = "Scout Manslayer", gender = "female",
  role = "scout", tier = "service",
  temper = { "blunt", "watchful" }, values = { "duty", "strength" },
  notices = { "race", "travel" },
  impression = {
    first = "A wiry orc scout whose eyes never stop moving.",
    third = "{name} spoke with Scout Manslayer, who patrols Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Keep moving, {class}, or tell me why you're standing in my road. I have ground to cover before dark." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You walk too loudly, but at least now I know the sound of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "They call me Manslayer, and I earned the name in the wars. Now I walk the city and the roads around it and report what I see to the Warchief's officers." } },
      again = { { id = "h_again", text = "What else? Be quick about it." }, { id = "h_again2", text = "Ask, then. I can listen and walk at the same time." } },
      choices = {
        { text = "How did you earn that name?", next = "name" },
        { text = "What do you watch for?", next = "watch" },
        { text = "Do you trust everyone in Orgrimmar?", next = "xtrust" },
        { text = "What's your strangest report?", next = "xodd" },
        { text = "I'm a rogue. Need help?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll not keep you.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "In the Second War, in the forests of Lordaeron, I scouted ahead of the Horde and left fewer human patrols than I found. I am not proud of all of it, but I am not ashamed either." } },
      choices = {
        { text = "War is war. You did what you must.", next = "BACK", reply = "That is what I tell myself on the long nights. Mostly I believe it.", fx = { align = { order = 1 } } },
        { text = "Some of those deeds still need answering for.", next = "BACK", reply = "Perhaps. When the ancestors ask, I will answer them, not you.", fx = { align = { order = -1 } } },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Cultists of the Burning Blade slipping in among honest folk, thieves in the Drag, and spies from the north who think a hood makes them an orc. The city is safe because people like me assume it isn't." } },
      choices = {
        { text = "The Burning Blade, inside Orgrimmar?", next = "blade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "They hide in the Cleft of Shadow, in the caves below Ragefire, wherever the old demon worship still smoulders. We cut them out, and they grow back like weeds, so we keep cutting." } },
      choices = { { text = "I'll keep my eyes open. Something else.", next = "BACK" } },
    },
    xtrust = {
      lines = {
        { id = "x_xtrust", text = "I trust no one I have not watched for a month, and even then I keep one eye open. The Burning Blade has cultists in our streets, and some of them wear Horde colours." },
      },
      choices = {
        { text = "How do you find them?", next = "xfind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfind = {
      lines = {
        { id = "x_xfind", text = "A cultist always slips, sooner or later, in how he speaks of the demons, or where he goes at night. Some officers want me to arrest anyone suspicious, and others want proof first." },
      },
      choices = {
        { text = "Arrest them all. Better safe than burned.", next = "BACK", reply = "That is how I would do it, if they let me.", fx = { align = { order = 1 } } },
        { text = "Proof first. Innocent orcs deserve better.", next = "BACK", reply = "So the Warchief says. I will find you your proof.", fx = { align = { order = -1 } } },
      },
    },
    xodd = {
      narr = "The corner of his mouth twitches toward a smile.",
      lines = {
        { id = "x_xodd", text = "A goblin selling fake Warchief portraits in the Drag, signed by a hand that was clearly his own. I let him go, because the portraits were quite good." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "x_xrogue", text = "Perhaps, someday, if you prove you can keep your mouth shut and your eyes open. For now, watch the Cleft of Shadow, and tell me who comes and goes." },
      },
      choices = {
        { text = "I'll watch.", next = "BACK", reply = "Good. Report only to me." },
      },
    },
  },
  topics = {
    burning_blade = { { id = "tp_xburning_blade", text = "The Burning Blade worships demons. They hide in the Cleft and in the hills." } },
    orgrimmar = { { id = "tp_xorgrimmar", text = "Orgrimmar is strong walls and many secrets. I watch both." } },
    background = { { id = "tp_bg", text = "Scout of the old Horde, scout of the new one. The work never changed, only the colours." } },
    _none = { { id = "tp_none", text = "I don't know, and I'm not paid to guess. Ask a grunt." } },
  },
}

-- Honored Ancestor: a ghostly hero who appears outside Orgrimmar to be remembered.
P:NPC {
  key = "dur_honored_ancestor", id = 15115, name = "Honored Ancestor", gender = "male",
  role = "spirit", tier = "service",
  temper = { "solemn", "kind" }, values = { "ancestors", "honor" },
  notices = { "race" },
  impression = {
    first = "A pale, shimmering figure of a fallen hero, who looks on you with quiet pride.",
    third = "{name} stood before an Honored Ancestor outside Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "The living still remember us. That is the only feast the dead truly need." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The festival moon has risen, and I am called back to remember and be remembered. Stand with me, child of the Horde." },
    { id = "g_back", when = { metBefore = true }, text = "You return to stand with us again, child of the Horde. It warms what little of me remains." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "The figure flickers like a flame in wind, but its eyes hold steady on yours.",
      lines = { { id = "h_default", text = "I was a warrior once, as you are, and I fell so that others could stand where you stand now. While the harvest is gathered and the fallen remembered, we are allowed to look upon the land again." } },
      again = { { id = "h_again", text = "Ask, while I am here to answer." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What do the dead want of us?", next = "want" },
        { text = "How did you fall?", next = "xfall" },
        { text = "Do you have kin still living?", next = "xkin" },
        { text = "I am an orc. Did you fight in the old wars?", next = "xorc", when = { race = "Orc" } },
        { text = "What is it like, beyond?", next = "ybeyond" },
        { text = "Do the dead watch the Horde?", next = "ywatch" },
        { text = "Do troll ancestors walk with you?", next = "ytroll", when = { race = "Troll" } },
        { text = "Rest well, ancestor.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "A name is a small thing to the dead, and mine has blown away on the wind of Durotar. Remember instead that I fought, and that I did not run, and that will honour me well enough." } },
      choices = { { text = "I will remember. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    want = {
      lines = { { id = "w_default", text = "Only that you live well and do not waste what we paid for. Do not seek glory for its own sake, and do not forget the ones who stood beside you." } },
      choices = {
        { text = "I'll win glory enough to honour you.", next = "BACK", reply = "Then win it for the Horde, not for yourself, and I will be content.", fx = { align = { order = -1 } } },
        { text = "I'll serve the Horde as you did.", next = "BACK", reply = "That is all any of us asked. Go well.", fx = { align = { order = 1 } } },
      },
    },
    xfall = {
      narr = "The figure's outline flickers, like a torch in wind.",
      lines = {
        { id = "x_xfall", text = "In the shadow of Blackrock, holding a pass so the wounded could flee. I do not regret it, for every one of them lived, and some of their grandchildren walk Durotar today." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xkin = {
      lines = {
        { id = "x_xkin", text = "A daughter, grown old now, who lives near Razor Hill. She lights a candle for me each year, and I come and stand beside her, though she cannot see me." },
      },
      choices = {
        { text = "Should she know you're there?", next = "xknow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xknow = {
      lines = {
        { id = "x_xknow", text = "Some say the dead should speak to the living, and some say we must let them live without us. I have chosen silence, but I wonder if I chose rightly." },
      },
      choices = {
        { text = "Let her know. Love should be spoken.", next = "BACK", reply = "Perhaps I will try, this year, when the candle burns.", fx = { align = { light = 1 } } },
        { text = "Silence is kinder. Let her live.", next = "BACK", reply = "That is what I tell myself. Thank you.", fx = { align = { light = -1 } } },
      },
    },
    xorc = {
      lines = {
        { id = "x_xorc", text = "In the Second War, before the camps, when we still wore the demons' fire in our blood. I am not proud of all I did, but I am proud of how I died." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ybeyond = {
      lines = {
        { id = "yybeyond_d", text = "Quiet, like the plains before a storm, and full of voices you once knew. I cannot tell you more, for the living are not meant to know. But it is not cold, and it is not lonely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ywatch = {
      lines = {
        { id = "yywatch_v0", when = { class = "SHAMAN" }, text = "You hear us more clearly than most, shaman. When the Horde fights with honour, we are proud. When it strikes the helpless, we turn our faces away." },
        { id = "yywatch_d", text = "We watch, and we remember. When the Horde fights with honour, we are proud. When it forgets, we grieve. Every warrior who strikes a helpless foe makes the ancestors turn their faces away." },
      },
      choices = {
        { text = "Then I will fight with honour, always.", next = "BACK", reply = "Good. We will be watching, and we will be proud.", fx = { align = { honor = 1 } } },
        { text = "Victory matters more than how it's won.", next = "BACK", reply = "So thought Gul'dan's warlocks. Remember where that path led us.", fx = { align = { honor = -1 } } },
      },
    },
    ytroll = {
      lines = {
        { id = "yytroll_d", text = "The Darkspear have their own ancestors, and their loa, and I do not claim to understand them. But a fallen warrior is a fallen warrior. Your dead and mine stand side by side tonight." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thrall = { { id = "ytp_thrall", text = "Thrall is young, but he carries the old ways well. Tell him the dead are proud of him." } },
    draenor = { { id = "ytp_draenor", text = "I was born under a red sky in Draenor. I died under a blue one in Kalimdor. Both were home." } },
    harvest_festival = { { id = "tp_xharvest_festival", text = "The Harvest Festival is when we honour the fallen. It is our time to walk among you." } },
    background = { { id = "tp_bg", text = "I am one of the fallen. That is all the living need know." } },
    _none = { { id = "tp_none", text = "The dead do not keep up with such things, child." } },
  },
}

---------------------------------------------------------------------------
-- Lazy Peon: dozing peons of the Valley of Trials ("Lazy Peons", Foreman Thazz'ril).
---------------------------------------------------------------------------
P:NPC {
  key = "dur_lazy_peon", id = 10556, name = "Lazy Peon", gender = "male",
  role = "peon", tier = "service",
  communities = { "valley_of_trials" }, temper = { "sleepy" }, values = { "rest" },
  impression = {
    first = "A peon lies curled against a pile of half-chopped logs, snoring loudly, his axe abandoned in the dust beside him.",
    third = "{name} woke a lazy peon in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Zzz... huh? What? I'm awake! I was just... resting my eyes. Work work." },
    { id = "g_q", when = { questActive = TODO_QUEST("Lazy Peons") }, text = "Ow! All right, all right, no need for that. Thazz'ril sent you, didn't he? I'm going, I'm going." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The foreman wants this whole pile chopped by sundown, and the sun is very hot, and the shade is very nice. You see my problem." } },
      again = { { id = "h_again", text = "Something else? I could listen lying down." } },
      choices = {
        { text = "Get back to work, peon.", next = "work" },
        { text = "You've earned a short rest.", next = "rest" },
        { text = "What would you rather be doing?", next = "xrather" },
        { text = "Who is your foreman?", next = "xforeman" },
        { text = "Do you remember the camps?", next = "xcamps" },
        { text = "What's the worst job you've had?", next = "yworst" },
        { text = "Do you have any friends?", next = "yfriends" },
        { text = "A troll would never work this hard either.", next = "ytroll", when = { race = "Troll" } },
        { text = "What do you dream about?", next = "ydream" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Yes, yes. Me not that kind of orc... I mean, I am exactly that kind of orc. Work, work. Look, I am picking up the axe." } },
      choices = {
        { text = "The Horde is built by those who work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Nobody should be driven like a slave again.", next = "BACK", fx = { align = { honor = -1, light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rest = {
      lines = { { id = "r_default", text = "You are the kindest grunt in all of Durotar. If the foreman asks, you never saw me. Zzz." } },
      choices = { { text = "Sleep well, then.", next = "END" } },
    },
    xrather = {
      lines = {
        { id = "x_xrather", text = "Sleeping, then eating, then sleeping again, which is the best way to spend any day. Maybe fishing, if the fish come to me and I do not have to stand up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xforeman = {
      lines = {
        { id = "x_xforeman", text = "Foreman Thazz'ril, who shouts so loud even the trees jump. He says peons must chop or be chopped, and I believe him, which is why I sleep where he cannot see." },
      },
      choices = {
        { text = "He'll find you eventually.", next = "xfind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfind = {
      narr = "He opens one eye, then closes it again, very slowly.",
      lines = {
        { id = "x_xfind", text = "He always does, and then I chop very fast for one hour. A good peon knows when to work and when to look like working." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcamps = {
      lines = {
        { id = "x_xcamps", text = "Yes, and in the camps nobody sleeps in the shade, because the guards have whips. Here, the worst you get is a shout, so maybe I sleep a little because I can." },
      },
      choices = {
        { text = "Sleep, then. You've earned that freedom.", next = "BACK", reply = "See? You understand. Zug zug.", fx = { align = { order = -1 } } },
        { text = "Freedom means working for the Horde willingly.", next = "BACK", reply = "Willingly. Yes. Tomorrow, I will be very willing.", fx = { align = { order = 1 } } },
      },
    },
    yworst = {
      lines = {
        { id = "yyworst_d", text = "Mucking out the wolf kennels at Razor Hill. The wolves do not like peons, and they show it, from both ends. After that, logs are very restful." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfriends = {
      lines = {
        { id = "yyfriends_d", text = "Lots! Every peon in the Valley of Trials. We nap in turns, so the foreman never catches all of us at once. It is called teamwork, and we are very good at it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytroll = {
      lines = {
        { id = "yytroll_v0", when = { race = "Troll" }, text = "Ha! You understand, mon. Your people sleep in the sun like lizards and nobody shouts. Maybe I go to Sen'jin and learn to be a troll." },
        { id = "yytroll_d", text = "Ha! A troll understands. Your people sleep in the sun like lizards, and nobody shouts at you. Maybe I will go to Sen'jin and learn to be a troll." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydream = {
      lines = {
        { id = "yydream_d", text = "I dreamed I was a grunt, with a big axe, and everyone bowed to me. Then I dreamed the foreman was a peon, and I was the foreman. That was a good dream. I did not want to wake up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    foreman_whip = { { id = "ytp_foreman_whip", text = "The foreman has a whip, but he only cracks it at the air. I think he is lazy too, secretly." } },
    valley_of_trials = { { id = "ytp_valley_of_trials", text = "The Valley of Trials is where young orcs learn to fight. Peons learn to hide." } },
    logs = { { id = "ytp_logs", text = "Logs are heavy, and there are always more of them. It is very unfair." } },
    foreman = { { id = "tp_xforeman", text = "Thazz'ril is always angry. Me always tired. We balance." } },
    _none = { { id = "tp_none", text = "Me just a peon. Ask the foreman." } },
  },
}
