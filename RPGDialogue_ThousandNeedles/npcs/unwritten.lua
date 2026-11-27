-- Thousand Needles folk the roster scan found unwritten: Moktar Krin's war party at Ironstone Camp
-- (Bor'zehn, Nag'zehn, Tarkreu Shadowstalker), Grish Longrunner at the Great Lift, Prate Cloudseer
-- in the Weathered Nook, and the Mirage Raceway crowd: Rizzle Brassbolts, Drag Master Miglen, Race
-- Master Kronkrider, the ogre announcers Fobeed and Zuzubee, both pit crews, Quentin the soil-minded
-- night elf, and "Plucky" Johnson, who is currently a chicken.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bor'zehn: orc of Moktar Krin's war party at Ironstone Camp.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_borzehn", id = TODO_NPC("Bor'zehn"), name = "Bor'zehn", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "honor" },
  impression = {
    first = "A broad orc sits by the cookfire at Ironstone Camp, oiling an axe that has clearly seen a great deal of use. The kodo behind him snorts at you on his behalf.",
    third = "{name} met Bor'zehn, a warrior of Moktar Krin's war party at Ironstone Camp.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Lok'tar, friend. Sit, and touch the kodo if you like. He likes you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Lok'tar. Sit if you want. Don't touch the kodo, and don't touch me." },
    { id = "g_default", text = "Lok'tar. Sit if you want, but don't touch the kodo." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The kodo remembers you, and he is not impressed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bor'zehn, of Moktar Krin's war party. We hunt the beasts of the Needles for Orgrimmar, and we have found more of them than we came for." } },
      again = { { id = "h_again", text = "What else? Speak, but hand me that log first. The fire needs feeding, and so does Grumbak." } },
      choices = {
        { text = "What does Moktar Krin hunt?", next = "hunt" },
        { text = "Who is Nag'zehn to you?", next = "nag" },
        { text = "How long has the war party been out here?", next = "xlong" },
        { text = "What is Moktar Krin like?", next = "xmoktar" },
        { text = "Where did you fight before this?", next = "xwar", when = { race = "Orc" } },
        { text = "What troubles you about the Grimtotem?", next = "ygrim" },
        { text = "Tell me about your kodo.", next = "ykodo" },
        { text = "What will you do when the hunt ends?", next = "w7_end" },
        { text = "Good hunting.", next = "END" },
      },
    },
    w7_end = {
      lines = {
        { id = "w7_end_l1", text = "Take the meat home to Orgrimmar, drink with my brother at the Broken Tusk, and argue about who killed the biggest cat. Then Moktar will find a new reason to send us out, and we will go, because sitting in the city makes an orc soft." },
      },
      choices = {
        { text = "Is the city really so bad?", next = "w7_end2" },
        { text = "Some would envy a quiet life.", next = "w7_end3" },
        { text = "Something else, Bor'zehn.", next = "BACK" },
      },
    },
    w7_end2 = {
      lines = {
        { id = "w7_end2_l1", text = "The city is good, but it is walls, and I spent too long behind walls in the camps. Out here the sky is open and the beasts are honest, and I sleep better on the ground than I ever did in a bed." },
        { id = "w7_end2_l2", when = { race = "Orc" }, text = "You know it as well as I do, brother. Walls are walls, even when we built them ourselves. The camps taught me to hate a roof, and the Needles have no roof at all." },
      },
      choices = {
        { text = "I understand that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_end3 = {
      lines = {
        { id = "w7_end3_l1", text = "Then let them have it, and I will bring them meat. Every orc chooses how to spend the freedom the Warchief gave us, and I chose this." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "Wind serpents, the great cats, and anything with a hide worth carrying home. Moktar says a warrior who has fought the Needles can fight anything, and he is usually right." } },
      choices = {
        { text = "Hunting for sport is a waste.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good hunt keeps the blade sharp.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    nag = {
      lines = { { id = "n_default", text = "My brother, though he will tell you he is the older and the wiser. He is neither, but he snores less, so I keep him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Three moons, and the kodo are tired of carrying meat home to Orgrimmar. We came for the beasts of the mesas, and we stayed because the Needles kept offering more." },
      },
      choices = {
        { text = "Is the hunting good?", next = "xgood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgood = {
      lines = {
        { id = "x_xgood", text = "Too good, which worries me. When a land is this full of hungry things, something is driving them out of their own places, and the Grimtotem are stirring on the high mesas." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmoktar = {
      lines = {
        { id = "x_xmoktar", text = "A hunter first and an orc second, and he will tell you so himself. He speaks less than any warrior I have known, and every word he does speak is worth hearing." },
      },
      choices = {
        { text = "Is he a good leader?", next = "xleader" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleader = {
      lines = {
        { id = "x_xleader", text = "He brings his hunters home, and that is the only measure I care for. Some say he hunts for glory and not for need, and they say it out of his hearing." },
      },
      choices = {
        { text = "A hunt for glory is an honourable thing.", next = "BACK", reply = "Moktar would agree, and so do I, most days.", fx = { align = { honor = 1 } } },
        { text = "Hunt for need. Glory wastes the herds.", next = "BACK", reply = "Spoken like a tauren. Perhaps you are right.", fx = { align = { honor = -1 } } },
      },
    },
    xwar = {
      narr = "He sets down the axe and turns the oiled rag over in his fingers.",
      lines = {
        { id = "x_xwar", text = "The Second War, at the walls of Lordaeron, before the camps took us. My brother and I were cubs swinging axes too big for us, and the humans laughed until they didn't." },
      },
      choices = {
        { text = "And after?", next = "xafter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xafter = {
      lines = {
        { id = "x_xafter", text = "After, the camps, and the grey years, and then the Warchief. Now I hunt for the Horde instead of killing for the demons, and I sleep better for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygrim = {
      narr = "He glances up toward the high mesas, where smoke rises thin against the sky.",
      lines = {
        { id = "ygr_default", text = "They are tauren, and they are Horde in name, but they look at us like a wolf looks at a lamb. They want the Needles for themselves. If they come down from the high places, the war party will fight them, and Thunder Bluff will not thank us." },
        { id = "ygr_tauren", when = { race = "Tauren" }, text = "They are your people, tauren, but they look at us as wolves look at lambs. If they come down from the mesas, we will fight. I would rather your Cairne dealt with them before my axe has to." },
      },
      choices = {
        { text = "Strike first, before they come down.", next = "BACK", reply = "Moktar would like that. Cairne would not.", fx = { align = { order = -1 } } },
        { text = "Leave it to Thunder Bluff. It's their matter.", next = "BACK", reply = "Wise words. An orc does not meddle in tauren blood.", fx = { align = { order = 1 } } },
      },
    },
    ykodo = {
      lines = { { id = "yko_default", text = "His name is Grumbak, and he has carried meat for the war party for six seasons. He bites strangers and he bites my brother, so he has good judgment. When he dies, I will eat him, because that is respect." } },
      choices = { { text = "That's one kind of respect. Something else.", next = "BACK" } },
    },
  },
  topics = {
    grimtotem = { { id = "yt_grim", text = "The Grimtotem watch us from Darkcloud Pinnacle. They are not friends, whatever banner they claim." } },
    nagzehn = { { id = "yt_nag", text = "Nag'zehn is my brother. He thinks he leads. I let him think it." } },
    _none = { { id = "yt_none", text = "I hunt. I do not know that. Ask Moktar, if he feels like talking, which he will not." } },
    moktar_krin = { { id = "tp_xmoktar_krin", text = "Moktar leads the war party. When he points, we hunt." } },
    ironstone_camp = { { id = "tp_xironstone_camp", text = "Ironstone Camp is ours for the season. The cookfire never goes out." } },
  },
}

---------------------------------------------------------------------------
-- Nag'zehn: Bor'zehn's brother in the same war party.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_nagzehn", id = TODO_NPC("Nag'zehn"), name = "Nag'zehn", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "wry" }, values = { "loyalty" },
  impression = {
    first = "A lean orc leans against a rock at Ironstone Camp, watching the mesas with a hunter's patience. He nods at you without taking his eyes off the cliffs.",
    third = "{name} met Nag'zehn, a hunter of Moktar Krin's war party.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, friend. The cliffs have ears, but I trust yours more. Sit quiet with me." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Quiet, stranger. The cliffs have ears, and so do I. I'm listening to you closely." },
    { id = "g_default", text = "Quiet, stranger. The cliffs have ears, and some of them have wings." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Still in one piece, I see." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Nag'zehn. My brother Bor'zehn guards the fire, Tarkreu guards the shadows, and I watch the sky. Between us, nothing reaches Moktar unseen." } },
      again = { { id = "h_again", text = "Anything else? Low, stranger, low. Sound climbs these cliffs faster than any orc." } },
      choices = {
        { text = "What comes from the sky?", next = "sky" },
        { text = "Who else hunts the Needles?", next = "others" },
        { text = "Is your brother older or younger?", next = "xbrother" },
        { text = "What do you think of the tauren here?", next = "xtauren" },
        { text = "A hunter's advice for a fellow hunter?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "What do you see at night from the cliffs?", next = "ynight" },
        { text = "How do you tell a harpy from a serpent at a distance?", next = "w7_tell" },
        { text = "I'll keep quiet.", next = "END" },
      },
    },
    w7_tell = {
      lines = {
        { id = "w7_tell_l1", text = "By the wings, first. A serpent's wings beat slow and wide and it glides on the heat, and a harpy flaps fast and drops like a stone, screeching before it hits. If you hear it before you see it, it is a harpy." },
      },
      choices = {
        { text = "And if you see it before you hear it?", next = "w7_tell2" },
        { text = "I'd just shoot whatever comes.", next = "w7_tell3" },
        { text = "Something else, Nag'zehn.", next = "BACK" },
      },
    },
    w7_tell2 = {
      lines = {
        { id = "w7_tell2_l1", text = "Then it is a serpent, and you have a moment, no more, before it breathes. Get behind rock or behind your kodo, and if Grumbak bites you for it, take the bite; it is kinder than the wind." },
        { id = "w7_tell2_l2", when = { class = "HUNTER" }, text = "Then it is a serpent, and your pet should go low before you do. A wolf will try to jump at it, and the breath will throw him off the ledge, so call him back the moment you see wings." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", reply = "Good. Remembering is the difference between hunters and meat." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_tell3 = {
      lines = {
        { id = "w7_tell3_l1", text = "Then you would waste arrows on vultures and miss the serpent behind them. The sky rewards patience, and punishes everyone else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sky = {
      lines = { { id = "s_default", text = "Wind serpents, mostly, and the harpies of the high ledges. A serpent's breath can knock a kodo flat, so you learn to look up before you look ahead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "The Grimtotem, who say the mesas are theirs, and the centaur, who say everything is theirs. We give them both a wide path, unless they make that impossible." } },
      choices = {
        { text = "Then let them come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A wide path is wise.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    xbrother = {
      lines = {
        { id = "x_xbrother", text = "Older, by a winter, and he never lets me forget it. He takes the axe and the fire, and I take the bow and the high rocks, because neither of us could bear to stand where the other stands." },
      },
      choices = {
        { text = "Do you get along?", next = "xalong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalong = {
      narr = "His eyes leave the cliffs for a moment, toward the fire, then return.",
      lines = {
        { id = "x_xalong", text = "Like two wolves in one den, which is to say with growling and loyalty. When the camps took our father, Bor'zehn kept me alive, and I have not forgotten." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "x_xtauren", text = "The Freewind braves are good allies and patient hunters, though they talk to the beasts before they kill them. The Grimtotem are another story, proud and cold, and they watch our camp like we are trespassers." },
      },
      choices = {
        { text = "Are you trespassers?", next = "xtresp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtresp = {
      lines = {
        { id = "x_xtresp", text = "Perhaps, in their eyes. Moktar says the Horde hunts where it wills, and the Grimtotem say this land was theirs before any orc crossed the sea." },
      },
      choices = {
        { text = "The Horde shares this land now. We hunt here.", next = "BACK", reply = "That is Moktar's answer, and he has the bigger axe.", fx = { align = { order = 1 } } },
        { text = "It's their land. We should ask leave.", next = "BACK", reply = "Ask the Grimtotem? They would answer with spears, I think.", fx = { align = { order = -1 } } },
      },
    },
    xhunt = {
      lines = {
        { id = "x_xhunt", text = "Watch the vultures, not the ground, for they find the wounded before you do. And never climb after a wounded cat, because it will be waiting at the top." },
      },
      choices = {
        { text = "Good advice.", next = "BACK", reply = "Hard won, too. Ask Tarkreu about his scar." },
      },
    },
    ynight = {
      narr = "He nods toward a dark ledge far across the canyon.",
      lines = {
        { id = "yni_default", text = "Fires on the Grimtotem mesa, more each night, and drums I do not like. Something is stirring up there. I told Moktar, and Moktar said keep watching, which is what Moktar says about everything. I have stopped sleeping well." },
        { id = "yni_tauren", when = { race = "Tauren" }, text = "Fires on the Grimtotem mesa, more each night, and drums. You are tauren, so tell me, cousin, are those war drums? Moktar says keep watching. I have stopped sleeping well." },
      },
      choices = { { text = "I'll look into it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    harpies = { { id = "yt_harp", text = "Harpies nest on the high ledges and scream at dawn. My arrows quiet a few each morning." } },
    moktar = { { id = "yt_moktar", text = "Moktar Krin leads us. He speaks little, and when he points, we go." } },
    wind_serpents = { { id = "yt_serp", text = "Wind serpents nest on the high ledges. Their breath crackles like a storm, so do not stand under one." } },
    tarkreu = { { id = "yt_tark", text = "Tarkreu walks in shadows and talks to no one. I trust him with my back, and not with my supper." } },
    _none = { { id = "yt_none", text = "I watch the sky, not the gossip. Ask my brother. He listens to everything and remembers half." } },
    bor_zehn = { { id = "tp_xbor_zehn", text = "My brother. He guards the fire and complains about the cold." } },
    grimtotem = { { id = "tp_xgrimtotem", text = "The Grimtotem watch us from the high mesas. I watch them back." } },
  },
}

---------------------------------------------------------------------------
-- Tarkreu Shadowstalker: the war party's scout.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_tarkreu_shadowstalker", id = TODO_NPC("Tarkreu Shadowstalker"), name = "Tarkreu Shadowstalker", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "You almost walk past the orc crouched in the rocks at the camp's edge. He was watching you long before you noticed him.",
    third = "{name} met Tarkreu Shadowstalker, the scout of Moktar Krin's war party.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You walk softly now, friend. The mesa barely heard you. That's well done." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You walk loudly. The mesa heard you, and it doesn't care for you, nor do I." },
    { id = "g_default", text = "You walk loudly. Everything on this mesa heard you coming." },
    { id = "g_back", when = { metBefore = true }, text = "Quieter this time. A little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tarkreu. I scout for Moktar, so I go first and come back last. The Needles hide many things, and I am paid to find them before they find us." },
        { id = "h_rogue", when = { class = { "ROGUE", "HUNTER" } }, text = "You walk like one who knows the shadows. Good, then you can stand still and listen with me." },
      },
      again = { { id = "h_again", text = "Speak softly." } },
      choices = {
        { text = "What have you found out here?", next = "found" },
        { text = "How do you move so quietly?", next = "quiet" },
        { text = "How did you get that scar?", next = "xscar" },
        { text = "What have you seen of the Grimtotem?", next = "xgrim" },
        { text = "I walk in shadows too.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Where did you learn the shadows?", next = "ylearn" },
        { text = "What did the dwarves wake at the Rustmaul dig?", next = "dig" },
        { text = "Do you scout as far as the Shimmering Flats?", next = "flats" },
        { text = "I'll go.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "dig_d", text = "Insects, the size of a wolf and harder than a shield, coming up out of the ground where the dwarves dug too deep. Moktar drove the dwarves out, and now we watch the hole they left, and I think the dwarves were the lesser trouble." } },
      choices = {
        { text = "How do you track something that burrows?", next = "dig_track" },
        { text = "Then the dwarves did us no favours.", next = "BACK", reply = "They never do. But this time they did themselves none either." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_track = {
      lines = { { id = "dig_track_d", text = "By the sand, not the beast. Where the ground has fallen in a little overnight, something has moved beneath it, and where the sand is warm at dawn, something is waiting there. A hunter would learn it in a week, if he lived that long." } },
      choices = {
        { text = "I'll watch the sand, then.", next = "BACK", reply = "Watch it from a distance. That is the rest of the lesson." },
        { text = "Useful. Something else.", next = "BACK", when = { class = "HUNTER" } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    flats = {
      lines = { { id = "flats_d", text = "Sometimes, when Moktar wants to know who is buying what. The goblins and gnomes race their machines across the salt, and they are so loud and so busy that I could walk through their camp at noon and nobody would look up." } },
      choices = {
        { text = "Have you ever done it?", next = "flats_walk" },
        { text = "They seem harmless enough.", next = "flats_harm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flats_walk = {
      lines = { { id = "flats_walk_d", text = "Once, to see if it could be done. I took nothing, and I learned that the goblin team pays the gnome team's mechanic to lose, and the gnome mechanic pays him back to win, and that neither of them has yet noticed." } },
      choices = {
        { text = "That's worth more than anything you could steal.", next = "BACK", reply = "Moktar laughed for an hour. It is the only time Nag'zehn was out-laughed." },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    flats_harm = {
      lines = { { id = "flats_harm_d", text = "Harmless to us, perhaps, but their machines blow up, and anything that blows up is not harmless. I keep a long way back when they light the engines, and I advise you to do the same." } },
      choices = {
        { text = "Good advice. Something else.", next = "BACK" },
        { text = "I'll stand well clear.", next = "BACK" },
      },
    },
    found = {
      lines = { { id = "f_default", text = "Grimtotem moving between the mesas, more of them than there should be. They watch Freewind Post the way a wolf watches a fold of sheep." } },
      choices = { { text = "Does Freewind know?", next = "BACK", reply = "They know. Whether they believe it is another matter." } },
    },
    quiet = {
      lines = { { id = "q_default", text = "Soft boots, and patience. Most people are loud because they are in a hurry, and the Needles punish hurry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xscar = {
      lines = {
        { id = "x_xscar", text = "A cougar on the high rocks, three seasons ago, who did not like me in her den. I won, but she taught me to look up before I climb, and Nag'zehn has never stopped laughing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgrim = {
      lines = {
        { id = "x_xgrim", text = "More than I wish to. They gather at Darkcloud Pinnacle and watch the roads, and some of them have spoken of the Horde with a hatred I did not expect from tauren." },
      },
      choices = {
        { text = "Should Moktar warn Thunder Bluff?", next = "xwarn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarn = {
      lines = {
        { id = "x_xwarn", text = "I told him so, and he said it is not our business, that tauren quarrels belong to tauren. I am not certain he is right, and I am not certain he is wrong." },
      },
      choices = {
        { text = "Warn Cairne. The Horde must know.", next = "BACK", reply = "Then perhaps I will send word myself, quietly.", fx = { align = { order = 1 } } },
        { text = "Moktar leads. Respect his choice.", next = "BACK", reply = "That is the soldier's answer. I have given it often.", fx = { align = { order = -1 } } },
      },
    },
    xrogue = {
      narr = "He shifts, and for a moment you lose sight of him against the rocks.",
      lines = {
        { id = "x_xrogue", text = "Then you know the first lesson is patience, and the second is to leave nothing behind. A hunter tracks, but a shadow is not tracked, and that is the whole of the art." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", reply = "Do. And step lightly near the camp, or Bor'zehn will throw his axe." },
      },
    },
    ylearn = {
      lines = {
        { id = "yle_default", text = "In the internment camps, as a cub. You learned to move without being seen, or the guards found you, and the guards were not kind. When the Warchief freed us, I kept the skill and lost the fear. Mostly." },
        { id = "yle_orc", when = { race = "Orc" }, text = "In the camps, as a cub. You know of them, brother, or your parents did. Move unseen or be found, and the guards were not kind. The Warchief freed us. I kept the skill and lost most of the fear." },
      },
      choices = { { text = "A hard school. Something else.", next = "BACK" } },
    },
  },
  topics = {
    galak = { { id = "yt_galak", text = "The Galak centaur ride loud and track badly. I have walked through their camp twice, and they never knew." } },
    camps = { { id = "yt_camps", text = "The camps taught me silence. Thrall taught me what to do with it." } },
    cougars = { { id = "yt_cougar", text = "The cougars of the Needles hunt from above. Look up before you climb, or you will look up from the ground." } },
    nagzehn = { { id = "yt_nag", text = "Nag'zehn laughs at my scar every night. I let him. Laughter is rare out here." } },
    _none = { { id = "yt_none", text = "I know paths and shadows, not that. Ask someone louder." } },
    darkcloud_pinnacle = { { id = "tp_xdarkcloud_pinnacle", text = "Darkcloud Pinnacle is Grimtotem ground. Go there and you will not come back quietly." } },
    moktar_krin = { { id = "tp_xmoktar_krin", text = "Moktar trusts me to see what he cannot. I have not failed him yet." } },
  },
}

---------------------------------------------------------------------------
-- Grish Longrunner: tauren at the Great Lift between the Barrens and the Needles.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_grish_longrunner", id = TODO_NPC("Grish Longrunner"), name = "Grish Longrunner", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "thunder_bluff", "freewind" }, temper = { "weary" }, values = { "duty", "tribe" },
  notices = { "race", "level" },
  impression = {
    first = "A tall tauren in runner's leathers stands at the top of the Great Lift, his hooves caked in Barrens dust. He looks like he has run a long way and expects to run further.",
    third = "{name} met Grish Longrunner, a tauren runner at the Great Lift.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, traveller. The lift is safe, but the road below it is not." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has there been word from below?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Grish Longrunner. I carry messages between Thunder Bluff and Freewind Post, and between them the Great Lift is the only easy road. The quilboar and the centaur have noticed that too." },
        { id = "h_q", when = { questActive = TODO_QUEST("Calling in the Reserves") }, text = "You carry the call for reserves? Then Freewind's need is greater than I feared. Go quickly." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, friend, my legs are cooling and the next message will not carry itself." },
        { id = "h_again2", text = "Speak, while I catch my breath." },
      },
      choices = {
        { text = "What troubles the road?", next = "road" },
        { text = "Tell me about the Great Lift.", next = "lift" },
        { text = "What does Freewind Post need?", next = "freewind" },
        { text = "Do the runners still honour the old paths?", next = "paths", when = { race = "Tauren" } },
        { text = "Has the road ever nearly taken you?", next = "ynear" },
        { text = "Who waits for you at home?", next = "yhome" },
        { text = "What message do you dread carrying?", next = "w7_dread" },
        { text = "Safe running.", next = "END" },
      },
    },
    w7_dread = {
      lines = {
        { id = "w7_dread_l1", text = "The ones wrapped in black cord, which mean a brave has fallen and the family must be told. I carry them to Thunder Bluff, and I always run slower with those, though I know I should not." },
      },
      choices = {
        { text = "Why slower?", next = "w7_dread2" },
        { text = "It's not your fault what the message says.", next = "w7_dread3" },
        { text = "Something else, Grish.", next = "BACK" },
      },
    },
    w7_dread2 = {
      lines = {
        { id = "w7_dread2_l1", text = "Because as long as I am running, the family still has their son, and when I arrive, they do not. It is a foolish thing, and the elders would scold me for it, but I give them one more hour if I can." },
        { id = "w7_dread2_l2", when = { race = "Tauren" }, text = "You understand, I think. Our people say the spirit walks on until the family knows, and I would let it walk a little longer, under the open sky, before I hand them the cord." },
      },
      choices = {
        { text = "That is a kindness.", next = "BACK", reply = "A small one. It is all a runner has to give." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_dread3 = {
      lines = {
        { id = "w7_dread3_l1", text = "No, it is not, but they look at me as though it is, and I cannot blame them. A runner's face is the first face of grief." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Centaur of the Galak clan, and quilboar out of the Barrens thorns. They know a runner carries news, and news is worth killing for." } },
      choices = {
        { text = "Why not send an escort?", next = "escort" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escort = {
      lines = { { id = "e_default", text = "An escort is slow, and slow news is worse than none. A runner runs alone, and trusts the Earth Mother to keep the ground under his hooves." } },
      choices = {
        { text = "Speed matters more than safety.", next = "escort_end", fx = { align = { order = -1 } } },
        { text = "Foolish. One runner is easy prey.", next = "escort_end", fx = { align = { order = 1 } } },
      },
    },
    escort_end = {
      lines = { { id = "ee_default", text = "Perhaps. But I have run this road for many seasons, and I am still here to argue about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lift = {
      lines = { { id = "l_default", text = "The tauren built it to join the Barrens to the Needles below, ropes and wood and a great deal of patience. Without it, Freewind would be a week's climb from any friend." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    freewind = {
      lines = { { id = "f_default", text = "Warriors and more warriors. The Grimtotem grow bold in the Needles, and Cliffwatcher Longhorn has fewer braves than he has cliffs to watch." } },
      choices = { { text = "I'll help if I can.", next = "BACK", fx = { affinity = 1 } } },
    },
    paths = {
      lines = { { id = "p_default", text = "We do, those of us who remember them. My grandfather ran from Mulgore to the sea on paths no orc has ever seen, and I hope to show them to my own children." } },
      choices = { { text = "May they run them well.", next = "BACK", fx = { affinity = 1 } } },
    },
    ynear = {
      narr = "He touches a long, pale scar along his flank without seeming to notice.",
      lines = {
        { id = "yne_default", text = "Once, below the lift, when three Galak riders came out of a dry gully. I ran until my hooves bled, and I carried the message the whole way, and the Cliffwatcher read it and said only, you are late. I laughed until I wept." },
        { id = "yne_orc", when = { race = "Orc" }, text = "Once, when three Galak riders came out of a gully. An orc grunt on the Barrens road saw them and charged, alone, so I could run. I never learned his name. I honour your people for him." },
      },
      choices = { { text = "You earned that laugh. Something else.", next = "BACK" } },
    },
    yhome = {
      lines = { { id = "yho_default", text = "A mate on the Bluff, and two calves who want to run messages too. I would rather they became weavers, who sit by fires and live long. But a runner runs, and I cannot tell them not to follow. Should I?" } },
      choices = {
        { text = "Let them run. It is their path.", next = "BACK", reply = "Yes. The wind does not ask permission, and neither will they.", fx = { align = { order = -1 } } },
        { text = "Guide them to safer work. That's a father's duty.", next = "BACK", reply = "My mate says the same. Perhaps I will listen, this once.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    cliffwatcher = { { id = "yt_cliff", text = "Cliffwatcher Longhorn sees farther than any tauren alive, and still asks why I am late." } },
    great_lift = { { id = "yt_lift", text = "The Great Lift joins the Barrens to the Needles. Its ropes are checked every dawn, and I thank the Earth Mother every crossing." } },
    galak = { { id = "yt_galak", text = "The Galak centaur roam the canyons below. They are fast, but a tauren runner knows the ground better." } },
    thunder_bluff = { { id = "yt_tb", text = "Thunder Bluff stands high on its mesas, and from its edge you can see half of Mulgore. I carry its word to Freewind." } },
    _none = { { id = "yt_none", text = "I carry messages, traveller, not answers. Ask at Freewind, where the elders keep both." } },
  },
}

---------------------------------------------------------------------------
-- Prate Cloudseer: tauren shaman in the Weathered Nook, who gives the Call of Air.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_prate_cloudseer", id = TODO_NPC("Prate Cloudseer"), name = "Prate Cloudseer", gender = "female",
  role = "trainer", tier = "quest",
  communities = { "freewind" }, temper = { "serene" }, values = { "balance", "spirit" },
  notices = { "class" },
  impression = {
    first = "On a high, windswept ledge called the Weathered Nook, an old tauren shaman sits facing the gusts with her eyes closed. Her braids fly, but she does not move.",
    third = "{name} met Prate Cloudseer, the shaman who keeps the Call of Air in the Weathered Nook.",
  },
  greetings = {
    { id = "g_default", text = "The wind told me someone was climbing. It did not tell me who. Sit, and let me look at you." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the high place. The wind is pleased, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Prate Cloudseer. I sit where the air is strongest, so that young shaman may learn to hear it. Air is the hardest element to hold, for it never stays." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Xanis sent you, or Kranal, or Islen. You have earned the earth, the fire and the water, and now you must earn the wind." },
        { id = "h_q", when = { questActive = TODO_QUEST("Call of Air") }, text = "You have heard the call, then. Listen closer, for the wind will tell you what it wants." },
      },
      again = {
        { id = "h_again", text = "Ask. The wind is not in a hurry, though it always seems so." },
        { id = "h_again2", text = "What more would you know, child? The clouds over the needles are slow today, so I have time to read them and you both." },
      },
      choices = {
        { text = "Why is air the hardest element?", next = "air" },
        { text = "Why live up here alone?", next = "alone" },
        { text = "What are the Needles like from up here?", next = "view" },
        { text = "I'm ready for the Call of Air.", next = "call", when = { class = "SHAMAN" } },
        { text = "How did you become a shaman?", next = "ybecame" },
        { text = "What does the wind tell you of the Grimtotem?", next = "ygrim" },
        { text = "What do the goblin races look like from up here?", next = "races" },
        { text = "Freewind Post must be glad of your watch.", next = "fwind" },
        { text = "My grandmother said the wind carries the ancestors' voices.", next = "grandmother", when = { race = "Tauren" } },
        { text = "I'll leave you to the wind.", next = "END" },
      },
    },
    races = {
      lines = { { id = "races_d", text = "Like a line of beetles in a dust storm, child, and nearly as quick. The wind brings me the sound of their engines from the Shimmering Flats long before I see them, and once it brought me the sound of one exploding, and after that a great deal of goblin language." } },
      choices = {
        { text = "Does the noise trouble the air spirits?", next = "races_spirits" },
        { text = "The goblins would race through a hurricane.", next = "BACK", reply = "They would, and the hurricane would come away with some of their coin." },
        { text = "Something else.", next = "BACK" },
      },
    },
    races_spirits = {
      lines = { { id = "races_spirits_d", text = "The air does not mind noise, for it makes the loudest of all. What it minds is smoke, and those engines leave a black trail across the salt that the wind must carry away, which it does, but slowly and with complaint." } },
      choices = {
        { text = "Then the wind has more patience than I do.", next = "BACK", reply = "The wind has more patience than anyone. That is why it is so hard to learn." },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    fwind = {
      lines = { { id = "fwind_d", text = "Glad enough to send me bread, and glad enough to leave me be. Cliffwatcher Longhorn sends a brave up the paths now and then to ask what the wind has said of the Grimtotem, and I tell him, though he does not always like it." } },
      choices = {
        { text = "Does he listen to you?", next = "fwind_listen" },
        { text = "The young shaman must climb a long way to find you.", next = "fwind_climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fwind_listen = {
      lines = { { id = "fwind_listen_d", text = "He listens the way the young listen to the old, which is to say politely and then as he pleases. I do not mind it, for he keeps the post well, and a leader who obeyed every wind would never stand still long enough to lead." } },
      choices = {
        { text = "Wise of you not to mind.", next = "BACK" },
        { text = "Another question.", next = "BACK" },
      },
    },
    fwind_climb = {
      lines = { { id = "fwind_climb_d", text = "They do, and that is the first lesson, though they think it is only a path. A shaman who will not climb for the air will not hold it either, so I have never once moved my seat down the mountain to save their legs." } },
      choices = {
        { text = "I made the climb, and I'm still standing.", next = "BACK", reply = "You are, and breathing hard. The wind noticed both." },
        { text = "Something else.", next = "BACK" },
      },
    },
    grandmother = {
      lines = { { id = "grandmother_d", text = "She was right, child, and she was wise to tell you. Listen on a still evening at the edge of a mesa and you will hear them, not in words but in the way the grass bends toward home." } },
      choices = {
        { text = "I'll listen for her, then.", next = "BACK", reply = "Do. She will be glad to be heard by someone who remembers her." },
        { text = "Something else.", next = "BACK" },
      },
    },
    air = {
      lines = { { id = "a_default", text = "Earth waits for you, fire demands you, water carries you, but air simply leaves. To hold it, you must be willing to let it go." } },
      choices = {
        { text = "That sounds like a riddle.", next = "riddle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riddle = {
      lines = { { id = "r_default", text = "Every true thing sounds like a riddle to those who have not yet felt it. When the wind fills your totem, you will laugh at how simple it was." } },
      choices = {
        { text = "The spirits must be obeyed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits must be free.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "I am not alone. The wind speaks more than most tauren, and it never asks me to settle a quarrel. Freewind is close enough for bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    view = {
      lines = { { id = "v_default", text = "From here I see the Grimtotem moving among the mesas, and the dust of the goblin races far to the east. The land is restless, and the air carries it all to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    call = {
      lines = { { id = "c_default", text = "Then hold your totem high and let the wind find it. Do not grip it, child, for the wind does not stay where it is held." } },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 1 } } },
    },
    ybecame = {
      lines = {
        { id = "ybc_default", text = "As a calf I climbed the tallest rock in Mulgore during a storm, because I wanted to see where the thunder lived. My mother found me there at dawn, soaked and laughing, and the elders said the wind had chosen me. I think I chose it, and it was too polite to refuse." },
        { id = "ybc_shaman", when = { class = "SHAMAN" }, text = "As a calf I climbed the tallest rock in Mulgore in a storm to see where the thunder lived. You have felt that pull too, I think, or you would not be here. The wind chooses, but we must climb." },
      },
      choices = { { text = "A fine beginning. Something else.", next = "BACK" } },
    },
    ygrim = {
      narr = "She tilts her head, as though listening to something only she can hear.",
      lines = { { id = "ygm_default", text = "It carries anger, and the smell of old blood magic. The Grimtotem say the Earth Mother gave the mesas to them alone. The braves wish to drive them out. The elders wish to wait. What would you do, child?" } },
      choices = {
        { text = "Drive them out before the anger spills over.", next = "BACK", reply = "The braves would cheer you. The wind is less certain.", fx = { align = { light = -1 } } },
        { text = "Wait, and seek peace with them.", next = "BACK", reply = "Patience. Yes. The wind rewards those who wait.", fx = { align = { light = 1 } } },
      },
    },
  },
  topics = {
    totems = { { id = "yt_totem", text = "A totem is a promise between a shaman and the elements. The air keeps its promises lightly, so you must keep yours firmly." } },
    air = { { id = "yt_air", text = "The air holds every voice that has ever spoken. Listen long enough, and you will hear your own." } },
    freewind = { { id = "yt_free", text = "Freewind Post is close enough for bread and far enough for silence. It suits me." } },
    grimtotem = { { id = "yt_grim", text = "The Grimtotem have forgotten that the Earth Mother loves all her children. The wind has not forgotten." } },
    _none = { { id = "yt_none", text = "The wind has not spoken of that. Perhaps it will, if you ask it yourself." } },
  },
}

---------------------------------------------------------------------------
-- Rizzle Brassbolts: gnome of the Brassbolts racing crew at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_rizzle_brassbolts", id = TODO_NPC("Rizzle Brassbolts"), name = "Rizzle Brassbolts", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "excitable" }, values = { "craft" },
  impression = {
    first = "A gnome with goggles pushed up on his forehead and grease up to the elbows bounces around the gnomish pit, adjusting bolts that don't seem to need it.",
    third = "{name} met Rizzle Brassbolts, one of the gnome brothers who crew the Mirage Raceway's gnomish team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, hello, friend! You can borrow the wrench, I trust you! Mind the oil, though." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Oh. Hello. Mind the oil, and the wrench is mine. Don't touch it." },
    { id = "g_default", text = "Oh! Hello! Mind the oil, it's slippery, and the wrench, it's mine." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you come to see the car? Everyone comes to see the car." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rizzle Brassbolts, engineer extraordinaire, and brother to Fizzle and Wizzle. We build the fastest car on the flats, and we'll prove it as soon as the goblins stop cheating." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A fellow gnome! Now you can see the finest engineering south of Ironforge, and a little north of it too." },
      },
      again = { { id = "h_again", text = "What else? Talk fast, I can tighten a bolt every three words and I'm at bolt nineteen!" } },
      choices = {
        { text = "How do the goblins cheat?", next = "cheat" },
        { text = "What makes your car fast?", next = "car" },
        { text = "Tell me about your brothers.", next = "xbros" },
        { text = "What was Gnomeregan like?", next = "xgnomer" },
        { text = "Fellow gnome! Can I help the team?", next = "xhelp", when = { race = "Gnome" } },
        { text = "What would you build, with unlimited funds?", next = "ydream" },
        { text = "What about Zamek? He seems to get around.", next = "w7_zamek" },
        { text = "Good luck in the race.", next = "END" },
      },
    },
    w7_zamek = {
      lines = {
        { id = "w7_zamek_l1", text = "Zamek! Don't say that name too loudly near the hut, he's probably listening. He's a goblin with no team and too many friends, and the last time he came by our garage, I spent an hour chasing what I thought was a fire and was actually a smoke bomb." },
      },
      choices = {
        { text = "Why would he do that?", next = "w7_zamek2" },
        { text = "Sounds like he got you good.", next = "w7_zamek3" },
        { text = "Something else, Rizzle.", next = "BACK" },
      },
    },
    w7_zamek2 = {
      lines = {
        { id = "w7_zamek2_l1", text = "Because someone paid him to, and I'd bet my best wrench it was Pozzik! While I was outside, somebody went through my blueprints, and now the goblin car has a new fuel injector that looks suspiciously like one I drew last month." },
        { id = "w7_zamek2_l2", when = { profession = "Engineering" }, text = "Because Pozzik paid him, obviously, and you'll understand how it hurts: my fuel injector diagram, the one with the double-swirl intake, turned up on the goblin car a week later, painted red, with the swirl backwards. Backwards!" },
      },
      choices = {
        { text = "That's terrible.", next = "BACK", reply = "It is! And it still runs, which is worse!" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_zamek3 = {
      lines = {
        { id = "w7_zamek3_l1", text = "He did, and I'll admit it was a very well-built smoke bomb. I've kept the casing to study, purely for defensive purposes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "They copy everything, and then they paint it red! Pozzik swears he thought of it first, but I have the blueprints with my own drawings on them." } },
      choices = {
        { text = "Maybe they just think alike.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Copying is cheating, plain and simple.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    car = {
      lines = { { id = "ca_default", text = "Rockets, mostly, and a very careful amount of not blowing up. Fizzle handles the design, Wizzle handles the parts, and I handle the parts that fall off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbros = {
      lines = {
        { id = "x_xbros", text = "Fizzle handles propulsion, Wizzle handles steering and I handle everything that catches fire, which is everything. We've built nine cars together, and seven of them still exist in some form." },
      },
      choices = {
        { text = "What happened to the other two?", next = "xtwo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtwo = {
      lines = {
        { id = "x_xtwo", text = "One is a crater on the north end of the flats, and the other was eaten by a very large turtle. I've written a paper on the turtle, and nobody believes it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnomer = {
      narr = "He stops adjusting the bolt, and his goggles slide down over his eyes.",
      lines = {
        { id = "x_xgnomer", text = "Glorious, bright and humming, with lifts that ran on steam and dreams and a little leaky something we shouldn't have used. When Thermaplugg let the trogg in, we left with only what we could carry." },
      },
      choices = {
        { text = "Was it the High Tinker's fault?", next = "xfault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfault = {
      lines = {
        { id = "x_xfault", text = "Some say Mekkatorque trusted Thermaplugg too long, and some say nobody could have known. I'm an engineer, and I say every failure has a cause, though I'd rather fix the next one." },
      },
      choices = {
        { text = "Leaders must answer for their failures.", next = "BACK", reply = "Hmph. You're not wrong, but don't say it in Tinker Town.", fx = { align = { order = -1 } } },
        { text = "Mekkatorque did his best. Stand by him.", next = "BACK", reply = "Yes! Exactly. He'll lead us home, you'll see.", fx = { align = { order = 1 } } },
      },
    },
    xhelp = {
      lines = {
        { id = "x_xhelp", text = "Absolutely, and the fastest help is spare parts, because the goblins keep buying up all the good sprockets in Ratchet. Bring us anything shiny with teeth, and we'll find a use for it." },
      },
      choices = {
        { text = "I'll keep an eye out.", next = "BACK", reply = "Splendid! Percentage odds of victory just rose two points.", fx = { affinity = 1 } },
      },
    },
    ydream = {
      lines = {
        { id = "ydr_default", text = "A car that flies! Well, a car that leaves the ground on purpose and comes back down on purpose, which is technically different from what ours already do. I've the blueprints in my boot, eighty-one pages, and Fizzle says the chance of success is four percent. Four percent is not zero!" },
        { id = "ydr_eng", when = { profession = "Engineering" }, text = "A flying car, on purpose! You're an engineer, you'll appreciate this: eighty-one pages of blueprints, and Fizzle puts it at four percent. But four percent is a number, and numbers can be improved!" },
      },
      choices = { { text = "Four percent is a start. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    pozzik = { { id = "yt_pozzik", text = "Pozzik paints his car red and calls it new. I've measured it. It's my car, plus paint." } },
    turtle = { { id = "yt_turtle", text = "The turtle ate a whole car! My paper on it is very thorough, and nobody has read it." } },
    goblins = { { id = "yt_gob", text = "Goblins build with hope and hammers. Gnomes build with math and hope. The hope is the part that explodes." } },
    _none = { { id = "yt_none", text = "No idea! But if you give me a minute and some parts, I'll build something that does." } },
    fizzle = { { id = "tp_xfizzle", text = "Fizzle is my brother, and the reason our car goes forward." } },
    gnomeregan = { { id = "tp_xgnomeregan", text = "We'll take Gnomeregan back one day, and I'll drive the first car through the gates." } },
  },
}

---------------------------------------------------------------------------
-- Drag Master Miglen: gnome drag master at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_drag_master_miglen", id = TODO_NPC("Drag Master Miglen"), name = "Drag Master Miglen", gender = "male",
  role = "questgiver", tier = "service",
  communities = { "mirage_raceway" }, temper = { "officious" }, values = { "order" },
  impression = {
    first = "A gnome with a clipboard and a stopwatch on a chain stands at the gnomish end of the track, scowling at the goblin pit as though it owes him money.",
    third = "{name} met Drag Master Miglen, who times the gnomish team's runs at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, you. You may stay trackside, friend. Just keep clear when the run comes through." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Off the track, please. Now. The next run is due shortly, and I'd rather you not be on it." },
    { id = "g_default", text = "Off the track, please! The next run is due in three minutes and forty seconds." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Do you have business, or are you blocking my sight line?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Drag Master Miglen. I time the runs, I keep the records, and I make sure the goblins' numbers are as fake as I think they are." } },
      again = { { id = "h_again", text = "Quickly now, the clock is running, and I've already lost four seconds to your hesitation." } },
      choices = {
        { text = "Are the goblins' times fake?", next = "fake" },
        { text = "What's a drag master?", next = "drag" },
        { text = "How did you become drag master?", next = "xhow" },
        { text = "Have the gnomes ever won?", next = "xwon" },
        { text = "I'm a gnome. Are we winning?", next = "xgnome", when = { race = "Gnome" } },
        { text = "What happened to you in Gnomeregan?", next = "ygnomer" },
        { text = "What's the fastest run you ever timed?", next = "w7_fast" },
        { text = "I'll clear the track.", next = "END" },
      },
    },
    w7_fast = {
      lines = {
        { id = "w7_fast_l1", text = "Eleven point four three seconds over the quarter mile, gnomish team, two seasons ago, with a tailwind I've since accounted for. The goblins claim they did ten point nine the next week, but their timing was done by a goblin with a sundial." },
      },
      choices = {
        { text = "A sundial? Really?", next = "w7_fast2" },
        { text = "Maybe they really were faster.", next = "w7_fast3" },
        { text = "Something else, Miglen.", next = "BACK" },
      },
    },
    w7_fast2 = {
      lines = {
        { id = "w7_fast2_l1", text = "An enormously confident goblin with a sundial and a very loud voice, which Kronkrider accepted because there were spectators who'd bet on it. I've kept a formal objection on file ever since, in triplicate." },
        { id = "w7_fast2_l2", when = { race = "Gnome" }, text = "A sundial, my friend, and you'll appreciate the horror. A sundial has an error margin of minutes, and they claimed a result to a tenth of a second. I filed an objection in triplicate and copied it to Tinker Town for posterity." },
      },
      choices = {
        { text = "I'd file it too.", next = "BACK", reply = "Thank you! At last, someone with standards." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_fast3 = {
      lines = {
        { id = "w7_fast3_l1", text = "Possibly, but unverifiably, and unverifiable is the same as untrue, as far as the records are concerned. The record stays with us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fake = {
      lines = { { id = "f_default", text = "I can't prove it, which is the most suspicious part. Nobody's car is that fast without a fuel mix they're not telling anyone about." } },
      choices = { { text = "I could look into it.", next = "BACK", reply = "Discreetly, I hope. Very discreetly." } },
    },
    drag = {
      lines = { { id = "d_default", text = "The one who sets the line, starts the run and keeps the score, so the most important gnome on the flats. Without me, it's just two cars going very fast in no particular direction." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhow = {
      lines = {
        { id = "x_xhow", text = "I invented the timing device myself, a clockwork chronometer accurate to one hundredth of a second, and the race master needed somebody who could read it. The goblins tried to buy one, and I said no, twice, loudly." },
      },
      choices = {
        { text = "Why not sell it to them?", next = "xsell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsell = {
      lines = {
        { id = "x_xsell", text = "Because they would immediately take it apart and make it run fast, which is the opposite of what a chronometer is for. A timepiece must be honest, or it is only a very expensive noise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwon = {
      lines = {
        { id = "x_xwon", text = "Seventeen times out of forty-one, by my reckoning, and the goblins say nine, by theirs. The disagreement is mostly about whether exploding before the finish line counts as finishing." },
      },
      choices = {
        { text = "Does it?", next = "xcount" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcount = {
      lines = {
        { id = "x_xcount", text = "Physically, a portion of the car does cross the line, so I say yes. Kronkrider says rules are rules and a car must be in one piece, and we have argued about it for two seasons." },
      },
      choices = {
        { text = "Rules are rules. One piece, or no finish.", next = "BACK", reply = "Hmph. You sound like Kronkrider, and he wears a sash.", fx = { align = { order = 1 } } },
        { text = "If it crosses the line, it counts.", next = "BACK", reply = "Exactly! I shall cite you in my next report.", fx = { align = { order = -1 } } },
      },
    },
    xgnome = {
      narr = "He clicks the stopwatch, frowns, and clicks it again.",
      lines = {
        { id = "x_xgnome", text = "On paper, absolutely, and in practice, nearly, which is the gnomish way. If you have any spare sprockets, Rizzle would love them, and if you have spare money, the goblins would love that more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygnomer = {
      narr = "He pockets the stopwatch for once, and his fingers keep moving against the fabric.",
      lines = {
        { id = "ygn_default", text = "I was a timekeeper for the great lift schedules, two hundred and six lifts to the second. When the alarms sounded I stayed to keep the evacuation lifts on time, and I did, every one of them, until there was nobody left to lift. Then I took the last one up myself." },
        { id = "ygn_gnome", when = { race = "Gnome" }, text = "Lift scheduler, two hundred and six lifts to the second. You rode one up, I'd wager, in the evacuation. If it was on time, that was me. I stayed until nobody was left, then took the last one." },
      },
      choices = { { text = "That was brave of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    shimmering_flats = { { id = "yt_flats", text = "The flats are perfectly level for eleven miles, which makes them the only honest surface in Kalimdor." } },
    rizzle = { { id = "yt_rizzle", text = "Rizzle Brassbolts builds our car. His tolerances are optimistic, and his optimism is intolerable." } },
    kronkrider = { { id = "yt_kronk", text = "Race Master Kronkrider wears a sash and interprets rules. I wear a stopwatch and measure them." } },
    goblins = { { id = "yt_gob", text = "The goblin team's times are suspiciously round. Nothing in nature is suspiciously round, except goblins." } },
    _none = { { id = "yt_none", text = "That is outside my measurement, I'm afraid. Come back with something I can time." } },
    mirage_raceway = { { id = "tp_xmirage_raceway", text = "The Mirage Raceway is the finest test track in Kalimdor, salt flat and miles long." } },
    gnomeregan = { { id = "tp_xgnomeregan", text = "We lost Gnomeregan, but we still have speed. That is something." } },
  },
}

---------------------------------------------------------------------------
-- Race Master Kronkrider: neutral official of the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_race_master_kronkrider", id = TODO_NPC("Race Master Kronkrider"), name = "Race Master Kronkrider", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "loud" }, values = { "fairness" },
  impression = {
    first = "A stocky race official in a checkered sash stands on a platform between the two pits, a flag in one hand and a megaphone in the other.",
    third = "{name} met Race Master Kronkrider, who officiates the races at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Step right up, friend! The best seat at the Mirage Raceway is yours!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Step right up. Pay for your seat. The cheap ones are over there, for you." },
    { id = "g_default", text = "Step right up! The Mirage Raceway welcomes you to the fastest show on the flats!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more speed? I knew you had the fever!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Race Master Kronkrider, keeper of the rules and waver of the flag. The gnomes and goblins race, and I make sure neither blows up the other on purpose." } },
      again = { { id = "h_again", text = "What else, friend? Talk fast, the flag's getting heavy and the crowd's getting restless." } },
      choices = {
        { text = "Who usually wins?", next = "wins" },
        { text = "Are there any rules at all?", next = "rules" },
        { text = "How did you get this job?", next = "xhow" },
        { text = "What's the worst crash you've seen?", next = "xcrash" },
        { text = "Who pays you?", next = "xpay" },
        { text = "Does anyone ever get badly hurt?", next = "yhurt" },
        { text = "How do you settle a disputed finish?", next = "w7_dispute" },
        { text = "Enjoy the race.", next = "END" },
      },
    },
    w7_dispute = {
      lines = {
        { id = "w7_dispute_l1", text = "Loudly, friend, and in public, so everybody hears it at once and nobody can claim I said something else in private. I stand on the barrel by the finish line, I wave the flag twice for the winner, and then I duck." },
      },
      choices = {
        { text = "Why duck?", next = "w7_dispute2" },
        { text = "You should use Miglen's timer.", next = "w7_dispute3" },
        { text = "Something else, Kronkrider.", next = "BACK" },
      },
    },
    w7_dispute2 = {
      lines = {
        { id = "w7_dispute2_l1", text = "Because the losing side throws things, pal, usually wrenches, sometimes sandwiches, and once a whole rocket nozzle. I've got a helmet under the barrel for close calls, and I've needed it four times this season." },
        { id = "w7_dispute2_l2", when = { class = "WARRIOR" }, text = "Because the losing side throws things, and you'd be amazed how hard a gnome can throw a wrench. You look like someone who could stand beside me on finish day and make 'em think twice." },
      },
      choices = {
        { text = "Sounds like a dangerous job.", next = "BACK", reply = "Every job on the flats is, friend. Mine just comes with a flag." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_dispute3 = {
      lines = {
        { id = "w7_dispute3_l1", text = "And have the goblins call me a gnome-lover? No, pal, a fair race needs a judge both sides hate equally, and I work very hard at it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "Whoever crashes last, mostly. The gnomes win on paper, the goblins win on wagers, and I win because both sides pay my wages." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rules = {
      lines = { { id = "r_default", text = "Three of them: stay on the track, finish the race, and no explosions before the line. They break all three most days, but I keep reading them aloud." } },
      choices = {
        { text = "Rules are what make it a sport.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules just slow the cars down.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhow = {
      lines = {
        { id = "x_xhow", text = "Both sides wanted a referee, and neither would trust a goblin or a gnome, so they found a fellow who had crashed more cars than either of them. I retired from driving with all my limbs, which made me the expert." },
      },
      choices = {
        { text = "You were a driver?", next = "xdriver" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdriver = {
      narr = "He rubs a long pale scar along his forearm without seeming to notice.",
      lines = {
        { id = "x_xdriver", text = "For four seasons, until my last car folded in half on the north turn with me inside it. I walked away, and the car did not, and I took that as a sign." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcrash = {
      lines = {
        { id = "x_xcrash", text = "The goblin rocket sled that went straight up instead of forward, three seasons back. It came down in the gnome pit, and both crews spent a week arguing about whose fault it was." },
      },
      choices = {
        { text = "Whose was it?", next = "xfault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfault = {
      lines = {
        { id = "x_xfault", text = "I ruled it a draw, and both sides called me a cheat, which is how I know I ruled it fairly. A referee everyone hates equally is doing his job." },
      },
      choices = {
        { text = "Fair rulings matter, even when nobody thanks you.", next = "BACK", reply = "Thank you, though I notice you're not on either crew.", fx = { align = { order = 1 } } },
        { text = "A draw is cowardice. Pick a winner.", next = "BACK", reply = "Says the person who doesn't have to eat lunch with both crews.", fx = { align = { order = -1 } } },
      },
    },
    xpay = {
      lines = {
        { id = "x_xpay", text = "The Steamwheedle Cartel, through the Gadgetzan bookies, who want the races honest enough that people keep betting. Honest enough is a very particular amount of honest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhurt = {
      narr = "He lowers the flag and looks out over the salt for a long moment.",
      lines = {
        { id = "yhu_default", text = "Two seasons back a goblin driver named Tixxie went into the north turn too hot and didn't come out. Both crews stopped work for a day, and the gnomes built her a little brass marker by the turn. Nobody talks about it, but everybody slows down there." },
        { id = "yhu_goblin", when = { race = "Goblin" }, text = "Two seasons back a driver of yours, Tixxie, went into the north turn too hot. Both crews stopped for a day, and the gnomes built her a brass marker. Everybody slows there now, even Pozzik." },
      },
      choices = {
        { text = "Should you ban the north turn?", next = "yban" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yban = {
      lines = { { id = "yba_default", text = "The bookies say a race without danger draws no crowd, and no crowd means no raceway. Tixxie's crew say ban it, and I'm the one who has to decide. Well, what would you do?" } },
      choices = {
        { text = "Ban it. No crowd is worth a life.", next = "BACK", reply = "I'd like to. The bookies will scream, but I'd like to.", fx = { align = { light = 1 } } },
        { text = "Keep it. The drivers know the risk.", next = "BACK", reply = "That's what Tixxie would've said, sure enough.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    tixxie = { { id = "yt_tixxie", text = "Tixxie's marker stands by the north turn. Drivers tap it for luck on the way past." } },
    rules = { { id = "yt_rules", text = "Three rules: stay on the track, finish the race, no explosions before the line. I read them aloud every morning, to an empty pit." } },
    steamwheedle = { { id = "yt_steam", text = "The Steamwheedle Cartel keeps the raceway going through the Gadgetzan bookies. They like their sport honest, more or less." } },
    _none = { { id = "yt_none", text = "Not in the rulebook, friend, and if it isn't in the rulebook, I don't rule on it." } },
    mirage_raceway = { { id = "tp_xmirage_raceway", text = "The Mirage Raceway. Miles of flat salt and two crews who'd rather explode than lose." } },
    pozzik = { { id = "tp_xpozzik", text = "Pozzik drives for the goblins. Brave, fast and never once read the rules." } },
  },
}

---------------------------------------------------------------------------
-- Fobeed: ogre race announcer.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_fobeed", id = TODO_NPC("Fobeed"), name = "Fobeed", title = "Race Announcer", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "loud" }, values = { "fun" },
  impression = {
    first = "A huge ogre in a too-small vest stands beside the track, a battered goblin megaphone looking like a toy in his fist.",
    third = "{name} met Fobeed, an ogre who announces the races at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Fobeed say hello, friend! Fobeed say it loud and happy, because Fobeed like you!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Fobeed say hello. Fobeed say it quiet, because Fobeed not sure about you." },
    { id = "g_default", text = "Fobeed say hello! Fobeed say it loud, because Fobeed always say it loud!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Fobeed is announcer! Fobeed shout who is winning and who is on fire. Goblins pay Fobeed in meat, and Fobeed very happy." } },
      again = { { id = "h_again", text = "You want more Fobeed talk? Fobeed have so much talk, Fobeed save it up all night for when friend come!" } },
      choices = {
        { text = "How did an ogre get this job?", next = "job" },
        { text = "Do you know Zuzubee?", next = "zuzu" },
        { text = "What was life like before the race?", next = "xbefore" },
        { text = "What is your favourite meat?", next = "xmeat" },
        { text = "Do you like the goblins?", next = "xgob" },
        { text = "What happens when a car crashes?", next = "ycrash" },
        { text = "Can you say something quietly, Fobeed?", next = "yquiet" },
        { text = "How does Fobeed get so loud?", next = "w7_loud" },
        { text = "Enjoy the race, Fobeed.", next = "END" },
      },
    },
    w7_loud = {
      lines = {
        { id = "w7_loud_l1", text = "Fobeed practise every morning! Fobeed go to big rock and shout at sun until sun come up. Goblins say sun come up anyway, but Fobeed not take chances." },
      },
      choices = {
        { text = "Does it work?", next = "w7_loud2" },
        { text = "Fobeed scares the vultures, I bet.", next = "w7_loud3" },
        { text = "Something else, Fobeed.", next = "BACK" },
      },
    },
    w7_loud2 = {
      lines = {
        { id = "w7_loud2_l1", text = "Sun come up every day, so yes! Fobeed never miss one morning, and sun never miss one either. Zuzubee say this is not how sun work, but Zuzubee not shout at sun, so what Zuzubee know?" },
      },
      choices = {
        { text = "Keep shouting, Fobeed.", next = "BACK", reply = "Fobeed always shout! Thank you, friend!" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_loud3 = {
      lines = {
        { id = "w7_loud3_l1", text = "Vultures afraid of Fobeed, yes! Fobeed shout once, and all vultures fly away to Tanaris. Goblins say this good for business, because vultures eat crowd's lunch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "Goblin say they need someone loud. Fobeed is loudest! Fobeed even louder than the cars when they go boom." } },
      choices = { { text = "I believe you.", next = "BACK" } },
    },
    zuzu = {
      lines = { { id = "z_default", text = "Zuzubee is other announcer. Zuzubee shout for gnomes, Fobeed shout for goblins, and nobody can hear the race at all. Is very good." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbefore = {
      lines = {
        { id = "x_xbefore", text = "Fobeed live in Dustwallow with ogre clan, and Fobeed get hit on head a lot. Here Fobeed shout instead, and nobody hit Fobeed at all, so Fobeed think this much better." },
      },
      choices = {
        { text = "Do you miss your clan?", next = "xclan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xclan = {
      lines = {
        { id = "x_xclan", text = "Little bit. Clan have mud and fights and big pot of stew, but clan never give Fobeed megaphone. Fobeed think megaphone better than stew, most days." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmeat = {
      lines = {
        { id = "x_xmeat", text = "Fobeed like plainstrider leg best, with crunchy outside, and goblins give Fobeed one after every race. Sometimes goblins give Fobeed things that are not meat, and Fobeed eat them anyway." },
      },
      choices = {
        { text = "That seems unwise.", next = "xunwise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xunwise = {
      lines = {
        { id = "x_xunwise", text = "Fobeed stomach very strong. Fobeed once eat a whole gnome hat by accident, and Zuzubee still angry about it, because Zuzubee say it was Zuzubee's hat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgob = {
      lines = {
        { id = "x_xgob", text = "Goblins talk fast and pay Fobeed, so Fobeed like goblins. Zuzubee say gnomes better, and Fobeed and Zuzubee shout about it every race." },
      },
      choices = {
        { text = "Goblins are better. Shout louder, Fobeed!", next = "BACK", reply = "FOBEED SHOUT LOUDER! Fobeed like you very much.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "You should cheer for everyone fairly.", next = "BACK", reply = "Hmm. Fobeed think about that. Fobeed still like goblins most.", fx = { align = { order = 1 } } },
      },
    },
    ycrash = {
      lines = {
        { id = "ycr_default", text = "Fobeed shout BOOM very loud, so everyone know! Then pit crew run out, and Fobeed count how many crew come back. Usually all of them. Once one gnome stay on fire for long time, and Fobeed sad, but gnome okay now, and gnome have no hair." },
        { id = "ycr_gnome", when = { race = "Gnome" }, text = "Fobeed shout BOOM so everyone know! Then little gnomes like you run out with buckets. Once one gnome stay on fire for long time, and Fobeed sad, but gnome okay now, just no hair." },
      },
      choices = {
        { text = "Should the race be made safer?", next = "ysafe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysafe = {
      lines = { { id = "ysa_default", text = "Kronkrider say race should have more rules so less boom. Goblins say boom is what crowd come to see. Fobeed like boom, but Fobeed not like gnome on fire. What you think, small friend?" } },
      choices = {
        { text = "Less boom. Nobody should burn for a show.", next = "BACK", reply = "Fobeed tell Kronkrider. Kronkrider say Fobeed finally make sense.", fx = { align = { light = 1 } } },
        { text = "More boom! The crowd wants it.", next = "BACK", reply = "MORE BOOM! Fobeed shout that next race.", fx = { align = { light = -1 } } },
      },
    },
    yquiet = {
      lines = {
        { id = "yq_default", text = "Fobeed try. Fobeed... no. Fobeed cannot. Quiet hurt Fobeed's head, like putting big foot in little boot. Zuzubee say Fobeed whisper once in sleep, but Zuzubee lie a lot." },
        { id = "yq_rogue", when = { class = "ROGUE" }, text = "You very quiet, sneaky friend. Fobeed try to be quiet like you. Fobeed... no, cannot. Quiet hurt Fobeed's head, like big foot in little boot." },
      },
      choices = { { text = "Never change, Fobeed. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    kronkrider = { { id = "yt_kronk", text = "Kronkrider wear sash and frown. Fobeed think sash very pretty. Fobeed not say so." } },
    goblins = { { id = "yt_gob", text = "Goblins pay Fobeed meat. Goblins talk very fast, and Fobeed nod a lot." } },
    dustwallow = { { id = "yt_dust", text = "Dustwallow is wet and smell like mud. Fobeed clan still there. Fobeed not go back." } },
    _none = { { id = "yt_none", text = "Fobeed not know! Fobeed shout it anyway? No? Okay." } },
    zuzubee = { { id = "tp_xzuzubee", text = "Zuzubee shout for gnomes. Zuzubee is Fobeed's friend, and Fobeed's enemy, but mostly friend." } },
  },
}

---------------------------------------------------------------------------
-- Zuzubee: the other ogre race announcer.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_zuzubee", id = TODO_NPC("Zuzubee"), name = "Zuzubee", title = "Race Announcer", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "cheerful" }, values = { "fun" },
  impression = {
    first = "An ogre with a gnomish megaphone strapped to his head grins from the gnome side of the track. Someone has painted 'GO GNOMES' across his belly.",
    third = "{name} met Zuzubee, an ogre who announces for the gnomes at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Zuzubee welcome friend! Zuzubee so happy! Gnomes go fast, and you here to watch!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Zuzubee welcome you. Zuzubee watch you. Gnomes go fast. You go somewhere else, maybe." },
    { id = "g_default", text = "Zuzubee welcome you! Gnomes go fast today! Maybe! Zuzubee hope so!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Zuzubee shout for gnomes. Gnomes give Zuzubee shiny hat that makes voice big. Zuzubee likes shiny hat very much." } },
      again = { { id = "h_again", text = "More talk? Good, good, Zuzubee likes talk almost as much as Zuzubee likes shiny hat!" } },
      choices = {
        { text = "Why cheer for the gnomes?", next = "why" },
        { text = "Does the hat ever explode?", next = "hat" },
        { text = "Where did you come from?", next = "xfrom" },
        { text = "Who is better, you or Fobeed?", next = "xfob" },
        { text = "Do the gnomes treat you well?", next = "xtreat" },
        { text = "Do you ever miss Feralas?", next = "ymiss" },
        { text = "What's the best race you ever saw?", next = "ybest" },
        { text = "What do you do when there's no race?", next = "w7_rest" },
        { text = "Go gnomes.", next = "END" },
      },
    },
    w7_rest = {
      lines = {
        { id = "w7_rest_l1", text = "Zuzubee polish hat! Then Zuzubee help gnomes carry big heavy parts, because gnomes very small and parts very big. Gnomes say Zuzubee best lifting machine, and Zuzubee very proud." },
      },
      choices = {
        { text = "That's helpful of you.", next = "w7_rest2" },
        { text = "They're just using you.", next = "w7_rest3" },
        { text = "Something else, Zuzubee.", next = "BACK" },
      },
    },
    w7_rest2 = {
      lines = {
        { id = "w7_rest2_l1", text = "Zuzubee like being help! In Feralas, nobody say thank you. Here, little gnomes say thank you every time, and one gnome even write song about Zuzubee, with only a few rude words." },
        { id = "w7_rest2_l2", when = { race = "Gnome" }, text = "You gnome! You know, then! Gnomes say thank you every time, and gnome named Tobble write song about Zuzubee. Song is very nice, and Zuzubee hum it while carrying engines." },
      },
      choices = {
        { text = "I'd like to hear it.", next = "BACK", reply = "Zuzubee sing it later, after race, very loud!" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_rest3 = {
      lines = {
        { id = "w7_rest3_l1", text = "Maybe. But they use Zuzubee nicely, with thank you and food. Big ogres in Feralas use Zuzubee badly. Zuzubee know difference." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Fobeed take goblin side first, so Zuzubee take gnome side. Gnomes are small and polite, and they say thank you when Zuzubee not step on them." } },
      choices = { { text = "That's a good reason.", next = "BACK" } },
    },
    hat = {
      lines = { { id = "h2_default", text = "Only one time! Zuzubee eyebrows come back, mostly. Gnomes fixed hat, and now it only smoke a little." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfrom = {
      lines = {
        { id = "x_xfrom", text = "Zuzubee come from big hill in Feralas, with many ogres and much yelling. Zuzubee leave because Zuzubee too small, and here Zuzubee is biggest, so Zuzubee happy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfob = {
      lines = {
        { id = "x_xfob", text = "Zuzubee louder, because Zuzubee hat is shiny and Fobeed only has cone. Fobeed say Fobeed louder, and we shout to find out, and then everybody cover ears." },
      },
      choices = {
        { text = "You're louder, Zuzubee. Gnomes forever!", next = "BACK", reply = "GO GNOMES! Zuzubee knew it! You very good friend.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Fobeed is louder. Goblins win.", next = "BACK", reply = "No! Zuzubee sad now. Zuzubee shout at you later.", fx = { align = { order = -1 } } },
      },
    },
    xtreat = {
      lines = {
        { id = "x_xtreat", text = "Gnomes give Zuzubee hat and food and pats on knee, because gnomes cannot reach head. Gnomes very small but very nice, and Zuzubee protect gnomes from everything." },
      },
      choices = {
        { text = "Even the goblins?", next = "xgobs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgobs = {
      narr = "He grins enormously, and the megaphone on his head squeals.",
      lines = {
        { id = "x_xgobs", text = "Goblins okay, goblins just loud. Zuzubee only sit on goblin once, and that was accident, mostly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      narr = "He takes off the shiny hat and turns it over in huge, careful hands.",
      lines = {
        { id = "ymi_default", text = "Zuzubee miss big trees and rain, a little. But in Feralas, big ogres push Zuzubee and say small one, go away. Here, gnomes say Zuzubee, please help, and Zuzubee help. Zuzubee think being needed is better than trees." },
        { id = "ymi_nelf", when = { race = "NightElf" }, text = "You come from big tree lands too! Zuzubee miss rain, a little. But in Feralas big ogres push Zuzubee away. Here gnomes say Zuzubee, please help. Being needed is better than trees." },
      },
      choices = { { text = "Being needed is good. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ybest = {
      lines = {
        { id = "ybs_default", text = "Gnome car and goblin car cross line same time, exactly! Zuzubee shout GNOMES and Fobeed shout GOBLINS, and Kronkrider say draw, and everybody angry and happy at once. Zuzubee hug Fobeed. Fobeed hug back, very hard, and Zuzubee ribs still sore." },
        { id = "ybs_gnome", when = { race = "Gnome" }, text = "Gnome car and goblin car cross line same time! Zuzubee shout GNOMES so loud, small friend, your cousins fall over. Kronkrider say draw. Zuzubee hug Fobeed, and ribs still sore." },
      },
      choices = { { text = "That sounds wonderful. Something else.", next = "BACK" } },
    },
  },
  topics = {
    pozzik = { { id = "yt_pozzik", text = "Pozzik drive goblin car very fast and very on fire. Zuzubee cheer when Pozzik lose, but quietly." } },
    kronkrider = { { id = "yt_kronk", text = "Kronkrider wave flag and read rules. Nobody listen, but Zuzubee clap for him anyway." } },
    hat = { { id = "yt_hat", text = "Shiny hat make Zuzubee voice big as mountain. It smoke a little, but gnomes say that normal." } },
    feralas = { { id = "yt_feralas", text = "Feralas has big trees, much rain and many ogres. Zuzubee not go back." } },
    _none = { { id = "yt_none", text = "Zuzubee not know! Zuzubee ask gnomes. Gnomes know everything, except how to be tall." } },
    fobeed = { { id = "tp_xfobeed", text = "Fobeed shout for goblins. Fobeed wrong, but Fobeed is Zuzubee friend." } },
    gnomes = { { id = "tp_xgnomes", text = "Gnomes are tiny and clever. Zuzubee likes them very much." } },
  },
}

---------------------------------------------------------------------------
-- Gnome Pit Crewman: generic gnomish mechanic at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_gnome_pit_crewman", id = TODO_NPC("Gnome Pit Crewman"), name = "Gnome Pit Crewman",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "busy" }, values = { "craft" },
  impression = {
    first = "A gnome in grease-stained overalls scurries between tool racks, muttering measurements to himself.",
    third = "{name} met one of the gnomish pit crew at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you! Can't stop, but I can talk to you, friend! Hand me that, would you?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Can't stop, can't talk, and I don't want to. Move along, please." },
    { id = "g_default", text = "Can't stop, can't talk, well, I can talk, but I can't stop!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Pit crew, gnomish team. We fix the car between runs, which means we fix the car all the time, because it breaks all the time." } },
      again = { { id = "h_again", text = "Something else? Quickly, please, I've a gasket in one hand and a very short temper in the other." } },
      choices = {
        { text = "What breaks most?", next = "breaks" },
        { text = "What do you think of the goblin crew?", next = "goblins" },
        { text = "How did you join the crew?", next = "xjoin" },
        { text = "Do you miss Gnomeregan?", next = "xgnomer" },
        { text = "I'm an engineer. Need a hand?", next = "xeng", when = { profession = "Engineering" } },
        { text = "What was your worst run?", next = "xworst" },
        { text = "Is the race worth the danger?", next = "yworth" },
        { text = "What's your name, anyway?", next = "yname" },
        { text = "What tool would you never part with?", next = "w7_tool" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    w7_tool = {
      lines = {
        { id = "w7_tool_l1", text = "This adjustable spanner, which I rescued from Gnomeregan on the day we evacuated. I had to choose between it and my second-best hat, and I've never once regretted the hat." },
      },
      choices = {
        { text = "What happened to the rest of your things?", next = "w7_tool2" },
        { text = "It's just a spanner.", next = "w7_tool3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_tool2 = {
      lines = {
        { id = "w7_tool2_l1", text = "Still down there, I expect, under the radiation and the troggs. My workbench, my notebooks, a half-finished clockwork owl. Some nights I dream I go back for the owl, and it's still ticking." },
        { id = "w7_tool2_l2", when = { race = "Gnome" }, text = "Still down there, like yours, I'd wager. You'll know the feeling: you think about the one thing you left on the bench, every day. Mine was a half-finished clockwork owl. I hope it's still ticking." },
      },
      choices = {
        { text = "Maybe one day you'll get it back.", next = "BACK", reply = "Maybe. High Tinker Mekkatorque says we will. I'd like that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_tool3 = {
      lines = {
        { id = "w7_tool3_l1", text = "It's never just a spanner! This one adjusts in thirty-two increments and has a calibrated grip, and it's the only thing I own that's older than the raceway." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    breaks = {
      lines = { { id = "b_default", text = "The rocket housing, the steering, and our nerves, in that order. The salt on the flats gets into everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "goblins_default", text = "Sloppy work, very loud, surprisingly fast. I'd never admit it, so you never heard me say that last part." } },
      choices = { { text = "Heard nothing.", next = "BACK" } },
    },
    xjoin = {
      lines = {
        { id = "x_xjoin", text = "Rizzle found me in Tinker Town after the evacuation, sorting bolts by size in a borrowed bucket, and he said anyone who sorts bolts for fun belongs on a pit crew. I have been sorting bolts here ever since, at much higher speeds." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnomer = {
      narr = "He stops sorting, holds a bolt up to the light, and sets it down very gently.",
      lines = {
        { id = "x_xgnomer", text = "Every single day, and especially when the engine hums a certain way, because it sounds a little like the great lifts did. We'll take the city back one day, the High Tinker says, and I believe him on the good days." },
      },
      choices = {
        { text = "Will you go back when it's retaken?", next = "xback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xback = {
      lines = {
        { id = "x_xback", text = "I think so, though the racing has spoiled me a little for indoor engineering. Some of the crew say we should stay out here and build something new." },
      },
      choices = {
        { text = "Gnomeregan is your home. Go back to it.", next = "BACK", reply = "Yes, yes, you're right, of course you're right. Probably right.", fx = { align = { order = 1 } } },
        { text = "Build something new. The future's out here.", next = "BACK", reply = "That's what Rizzle says, and he's usually wrong, but not always.", fx = { align = { order = -1 } } },
      },
    },
    xeng = {
      lines = {
        { id = "x_xeng", text = "Always, but only if you don't touch the fuel line, because nobody touches the fuel line except Rizzle. The last gnome who touched it is the reason we have a new gnome." },
      },
      choices = {
        { text = "Noted.", next = "BACK", reply = "Good. Hand me that spanner, please, the seven-sixteenths." },
      },
    },
    xworst = {
      lines = {
        { id = "x_xworst", text = "Our worst run lasted four seconds and set the salt on fire, which none of us knew salt could do. We wrote it up as a valuable discovery about salt." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yworth = {
      lines = {
        { id = "ywo_default", text = "Every crash teaches us something we can use back home, Rizzle says, fuel mixes and heat shielding and why you never put the steering behind the rocket. I like to think we're practising for the day we rebuild Gnomeregan, only faster." },
        { id = "ywo_dwarf", when = { race = "Dwarf" }, text = "Every crash teaches us something for home, heat shielding and fuel mixes. Your Ironforge smiths sell us the plating, and they always ask if we've blown up yet, which I think is their idea of a joke." },
      },
      choices = { { text = "Faster's always better. Something else.", next = "BACK" } },
    },
    yname = {
      narr = "He wipes his hand on his overalls and offers it, then thinks better of the grease.",
      lines = {
        { id = "yn_default", text = "Fizzlecog, Tobble Fizzlecog, third bolt-sorter, first class! Nobody asks, because the sign just says pit crewman, and I've been meaning to paint my name on it but there's always a gasket that needs me more." },
        { id = "yn_gnome", when = { race = "Gnome" }, text = "Fizzlecog, third bolt-sorter, first class! You're the first gnome in weeks to ask. Were you in Tinker Town after the fall? Maybe we queued for soup together, everyone did." },
      },
      choices = { { text = "Good to meet you, Fizzlecog. Something else.", next = "BACK" } },
    },
  },
  topics = {
    mekkatorque = { { id = "yt_mekka", text = "The High Tinker sent a letter to the raceway once, wishing us luck. Rizzle had it framed, then it caught fire." } },
    salt = { { id = "yt_salt", text = "Salt on the Shimmering Flats gets into every bearing. We clean them twice a run and still find grit." } },
    goblins = { { id = "yt_gob", text = "The goblin pit crew uses twice the fuel and half the safety checks. I'd never say so where they could hear." } },
    _none = { { id = "yt_none", text = "No idea, sorry, I've got a gasket in each hand." } },
    rizzle = { { id = "tp_xrizzle", text = "Rizzle Brassbolts is our chief engineer and the loudest optimist I know." } },
    tinker_town = { { id = "tp_xtinker_town", text = "Tinker Town is where most of us went after the fall. It's crowded, but it's ours." } },
  },
}

---------------------------------------------------------------------------
-- Goblin Pit Crewman: generic goblin mechanic at the Mirage Raceway.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_goblin_pit_crewman", id = TODO_NPC("Goblin Pit Crewman"), name = "Goblin Pit Crewman", gender = "male",
  role = "citizen", tier = "service",
  communities = { "mirage_raceway" }, temper = { "brash" }, values = { "profit" },
  impression = {
    first = "A goblin mechanic lounges against a fuel barrel in the goblin pit, a wrench in one hand and a sandwich in the other.",
    third = "{name} met one of the goblin pit crew at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey, pal! No tip needed from you, you're good people. Stick around." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hey, you're in the pit. That'll cost you a tip and a sandwich. Two sandwiches." },
    { id = "g_default", text = "Hey, pal, you're in the pit. That'll cost you a tip, or a sandwich." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Pit crew for Pozzik. We make the car go, and when it stops going, we make it go again, usually with a hammer." } },
      again = { { id = "h_again", text = "What else, pal? Talk fast, my sandwich is gettin' warm and so's the fuel tank, and only one of 'em's gonna explode." } },
      choices = {
        { text = "What's in the fuel?", next = "fuel" },
        { text = "What about the gnome crew?", next = "gnomes" },
        { text = "Does Pozzik pay well?", next = "xpay" },
        { text = "Have you ever lost a race?", next = "xlost" },
        { text = "Goblin to goblin: is the race rigged?", next = "xrig", when = { race = "Goblin" } },
        { text = "What did you do before the raceway?", next = "ybefore" },
        { text = "What's in the sandwich, anyway?", next = "w7_sand" },
        { text = "Enjoy your sandwich.", next = "END" },
      },
    },
    w7_sand = {
      lines = {
        { id = "w7_sand_l1", text = "Salted plainstrider, a slice of somethin' Riznek swears is cheese, and a pickle I bought off a dwarf in Gadgetzan. It's the best thing on the whole salt flat, and I eat one every heat for luck." },
      },
      choices = {
        { text = "Does it bring luck?", next = "w7_sand2" },
        { text = "Sounds disgusting.", next = "w7_sand3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_sand2 = {
      lines = {
        { id = "w7_sand2_l1", text = "Every heat I eat one, the car comes back in one piece or close enough, pal. The one heat I skipped it, we lost a fender, a wheel and Grizzik's left eyebrow, and I ain't takin' that chance again." },
      },
      choices = {
        { text = "I'm not laughing.", next = "BACK", reply = "Good. A fella's luck ain't a joke, pal." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_sand3 = {
      lines = {
        { id = "w7_sand3_l1", text = "Disgusting? Pal, this is fine dining out here. You should see what Pozzik eats, he dips his bread in engine grease and says it adds flavour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fuel = {
      lines = { { id = "f_default", text = "Trade secret, pal. Let's just say it's flammable, and you shouldn't smoke near it, and definitely don't drink it, which Grizz learned the hard way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "gnomes_default", text = "They measure everything twice and still lose. We measure nothing, and sometimes we win. That's the goblin way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpay = {
      lines = {
        { id = "x_xpay", text = "Pozzik pays in coin, in sandwiches and in promises, and two out of three ain't bad, pal. The promise is a share of the winnings, which I'll see right after the salt flats grow grass." },
      },
      choices = {
        { text = "Why stay, then?", next = "xstay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = {
        { id = "x_xstay", text = "Because where else can a fella blow up a car every afternoon and get paid for it? Back in Ratchet they'd fine me, and here they cheer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlost = {
      lines = {
        { id = "x_xlost", text = "Lost? We never lose, friend, we just finish behind the gnomes for strategic reasons, which are confidential. Also the gnomes cheat, everybody knows that." },
      },
      choices = {
        { text = "Do they actually cheat?", next = "xcheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcheat = {
      lines = {
        { id = "x_xcheat", text = "Sure they do, they use math, and that ain't natural. Us, we just put more rockets on, and the honest rocket wins, or explodes, which also counts as entertainment." },
      },
      choices = {
        { text = "Math isn't cheating. Learn some.", next = "BACK", reply = "Learn math? What am I, a gnome? Ha!", fx = { align = { order = 1 } } },
        { text = "More rockets. That's the goblin way.", next = "BACK", reply = "Now you're talkin', friend! Rockets fix everything.", fx = { align = { order = -1 } } },
      },
    },
    xrig = {
      narr = "He takes a bite of the sandwich and taps his nose with the wrench.",
      lines = {
        { id = "x_xrig", text = "Rigged is a strong word, chum, I'd say managed, and the bookies in Gadgetzan manage it very carefully. Bet on the car that blows up second and you'll do fine." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", reply = "You didn't hear it from me, and I'll bill you if you did." },
      },
    },
    ybefore = {
      narr = "He tucks the sandwich into his overalls pocket, which seems to be where he keeps everything.",
      lines = {
        { id = "ybe_default", text = "Unloaded crates on the Ratchet docks for the Steamwheedle, pal, eighty-hour weeks and a boss who docked us for breathin' on his cargo. Then Pozzik comes by and says, kid, how'd you like to get paid to set things on fire, and I say, where do I sign." },
        { id = "ybe_horde", when = { faction = "Horde" }, text = "Unloaded crates in Ratchet, pal, for a Steamwheedle boss who docked us for breathin'. You Horde types came through all the time. Then Pozzik offered me fire money, and I signed before he finished the sentence." },
      },
      choices = {
        { text = "Do you ever think of going back?", next = "yback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yback = {
      lines = { { id = "yba_default", text = "My ma says a dock job's steady and a pit job's a funeral waitin' to happen. She ain't wrong, but steady don't pay bonuses for surviving. Should a guy take the safe paycheck or the big risk, friend?" } },
      choices = {
        { text = "Take the big risk. That's where profit is.", next = "BACK", reply = "Atta pal! You talk like a trade prince.", fx = { align = { honor = -1 } } },
        { text = "Listen to your ma. Steady work is honest.", next = "BACK", reply = "Aw, don't say that. Now I gotta write her.", fx = { align = { honor = 1 } } },
      },
    },
  },
  topics = {
    gnomes = { { id = "yt_gnomes", text = "The gnome crew measure twice, cut once, and lose anyway. I respect it, a little, on account." } },
    mirage_raceway = { { id = "yt_mirage", text = "Mirage Raceway: the only track in Kalimdor where the crowd pays extra to sit farther back." } },
    ratchet = { { id = "yt_ratchet", text = "Ratchet's a fine port if you like fish, fog and fines. I liked one of the three." } },
    fuel = { { id = "yt_fuel", text = "Our fuel is proprietary, flammable, and very slightly alive. Don't ask follow-ups." } },
    _none = { { id = "yt_none", text = "Dunno, pal, and I don't get paid to guess. Well, I don't get paid much at all." } },
    pozzik = { { id = "tp_xpozzik", text = "Pozzik's the boss and the driver. He's got more burn scars than eyebrows." } },
    gadgetzan = { { id = "tp_xgadgetzan", text = "The Gadgetzan bookies take bets on every race. They always win." } },
  },
}

---------------------------------------------------------------------------
-- Quentin: night elf at the Mirage Raceway, studying the salt flats' soil.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_quentin", id = TODO_NPC("Quentin"), name = "Quentin", gender = "male",
  role = "scholar", tier = "service",
  communities = { "darnassus" }, temper = { "patient" }, values = { "nature" },
  impression = {
    first = "A night elf kneels at the edge of the Shimmering Flats, rubbing salt between his fingers while the race roars behind him. He hasn't looked at the track once.",
    third = "{name} met Quentin, a night elf studying the soil of the Shimmering Flats.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ishnu-alah, friend. I'm not here for the races, but I'm glad to see you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. I'm not here for the races, nor for idle talk with you." },
    { id = "g_default", text = "Ishnu-alah. Forgive me, I am not here for the races." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The salt hasn't changed since we spoke." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Quentin. I came to see whether these flats could ever bear life again. Once, I believe, there was water here, and where there was water, there can be soil." },
        { id = "h_ne", when = { race = "NightElf" }, text = "A kinsman, so far from home! You will understand, then, why I cannot look at a dead land and simply walk past it." },
      },
      again = { { id = "h_again", text = "What else? Speak, but softly. I am listening to the salt crack in the heat, and it tells me things." } },
      choices = {
        { text = "Can anything grow here?", next = "grow" },
        { text = "What do you make of the races?", next = "races" },
        { text = "Who sent you here?", next = "xwho" },
        { text = "Do you miss the forests?", next = "xmiss" },
        { text = "A druid could help you here.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do the racers harm the flats?", next = "xraces2" },
        { text = "Have you found any sign of life?", next = "ysign" },
        { text = "What have you learned from the salt?", next = "w7_salt" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    w7_salt = {
      lines = {
        { id = "w7_salt_l1", text = "That it is not all one thing. Beneath the white crust there are layers, like the rings of a tree, and in some of them I find the shells of creatures that lived in the sea that once filled this basin. They were small and many, and they are all gone." },
      },
      choices = {
        { text = "Could the sea ever return?", next = "w7_salt2" },
        { text = "Shells won't bring anything back.", next = "w7_salt3" },
        { text = "Something else, Quentin.", next = "BACK" },
      },
    },
    w7_salt2 = {
      lines = {
        { id = "w7_salt2_l1", text = "Not in our lifetimes, and I say that as one of my people, who live a long time. But water still moves beneath the flats, and I believe a time will come when it rises again, and I want to have the seeds ready." },
        { id = "w7_salt2_l2", when = { class = "DRUID" }, text = "You know the Dream better than I, so you may know the answer better too. I believe water still moves beneath us, and that one day it will rise. When it does, I mean to have the seeds waiting." },
      },
      choices = {
        { text = "I hope you're right.", next = "BACK", reply = "Elune willing. The Circle will remember who waited." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_salt3 = {
      lines = {
        { id = "w7_salt3_l1", text = "No, but they tell me what lived, and what lived once can live again. That is all my work is, really: reading what was, so I can guess what will be." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "grow_default", text = "Not yet, and perhaps not for an age. But the earth remembers, and with the right seeds and the right patience, the flats may bloom again." } },
      choices = {
        { text = "Nature heals itself in time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Nature needs a guiding hand.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    races = {
      lines = { { id = "r_default", text = "Loud, wasteful and strangely joyful. I disapprove, but I have caught myself cheering more than once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwho = {
      lines = {
        { id = "x_xwho", text = "No one sent me, though I am a student of the Cenarion Circle and I report to them now and then. I came because a place this broken asks a question, and I wanted to hear it." },
      },
      choices = {
        { text = "What question?", next = "xquestion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xquestion = {
      narr = "He lets the salt run out between his fingers, slowly, and watches it fall.",
      lines = {
        { id = "x_xquestion", text = "Whether a land can heal from what was done to it ten thousand years ago, when the Well's sundering tore the continent apart. If the flats can bloom again, then so might much else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "x_xmiss", text = "I miss them as a man misses a long night's sleep. But Ashenvale is full of druids, and the flats have only me, and the salt does not argue." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xraces2 = {
      lines = {
        { id = "x_xraces2", text = "The goblins and gnomes poison the salt with their fuels, and I have asked them to stop. They laugh, and I do not think they mean harm, but harm does not need meaning." },
      },
      choices = {
        { text = "They must stop. The land comes first.", next = "BACK", reply = "I agree, though it will take more than a druid's asking.", fx = { align = { light = 1 } } },
        { text = "They're only racing. The salt is already dead.", next = "BACK", reply = "Nothing is ever truly dead, friend, though I see why you think so.", fx = { align = { light = -1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "x_xdruid", text = "Then you understand that the land speaks slowly and you must listen longer. If you have a season to spare, the salt has things to teach us both." },
      },
      choices = {
        { text = "Perhaps I will.", next = "BACK", reply = "Elune light your way, then.", fx = { affinity = 1 } },
      },
    },
    ysign = {
      narr = "He opens his palm to show a tiny, grey-green sprout, cupped in a pinch of damp earth.",
      lines = {
        { id = "ysg_default", text = "This. One seedling, from a pod I found beneath the salt near the old shore cliffs. It has lived eleven days. If it lives to twelve, I shall write to the Circle, and they shall think me mad, and I shall be the happiest mad elf in Kalimdor." },
        { id = "ysg_druid", when = { class = "DRUID" }, text = "This seedling, from a pod beneath the salt near the old cliffs. Eleven days alive. You can feel it, can't you, druid, how fiercely it wants to grow? Twelve days, and I write to the Circle." },
      },
      choices = { { text = "May it grow. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    druids = { { id = "yt_druid", text = "The druids of the Circle tend the wild. I tend this one stubborn sprout, which is a start." } },
    goblins = { { id = "yt_gob", text = "The goblins have offered to buy my seedling, twice. I do not think they know what it is, only that I want it." } },
    salt = { { id = "yt_salt", text = "Under the salt there is clay, and under the clay there are seeds. The earth forgets slowly." } },
    _none = { { id = "yt_none", text = "I do not know, friend. My study is slower than most questions." } },
    shimmering_flats = { { id = "tp_xshimmering_flats", text = "The Shimmering Flats were a sea, once, I am almost certain. The salt remembers." } },
    cenarion_circle = { { id = "tp_xcenarion_circle", text = "The Circle tends the wild. I am only one of its slower students." } },
  },
}
-- Elder Morningdew: an ancestor spirit honoured during the Lunar Festival. She appears in Thousand Needles, among the salt and the strange goblin racing.
P:NPC {
  key = "tn_elder_morningdew", id = 15604, name = "Elder Morningdew", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A night elf spirit, looking out over the salt flats with mild disapproval.",
    third = "{name} paid respects to Elder Morningdew, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, traveller. You find me in an odd place this year, among the dust and the engines." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The moon has turned the year again, and Elune's light reaches even this old seabed tonight. I am glad you came so far through the dust to find me." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the salt flats are no quieter. Still, I am glad of the company." },
    { id = "g_done", when = { questDone = TODO_QUEST("Morningdew the Elder") }, text = "You have paid your respects, and my coin travels with you now. Ishnu-alah." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "NightElf" }, text = "One of my own people, so far from the forests. The festival draws us all far afield, it seems." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She wrinkles her nose as a goblin engine roars somewhere out on the flats.",
      lines = { { id = "h_default", text = "I am Elder Morningdew, and I was a priestess of Elune when this desert was green and the sea had not yet left it. My spirit is honoured at the Lunar Festival, and this year it has brought me here, to the edge of the Shimmering Flats." } },
      again = { { id = "h_again", text = "Ask what you wish, traveller. The goblins make enough noise for both of us." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "Elune keep you, Elder. My family also served the Goddess.", next = "kin", when = { race = "NightElf" } },
        { text = "What did this land look like, back then?", next = "yland" },
        { text = "Do the goblins disturb your rest?", next = "ygoblins" },
        { text = "Do you remember the sea that was here?", next = "w7_sea" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    w7_sea = {
      lines = {
        { id = "w7_sea_l1", text = "I remember its sound more than its look. The waves came in slow and long over the shallows where the needles stand now, and at night they glowed faintly, as if the moon had dropped some of her light into them." },
      },
      choices = {
        { text = "What happened to it?", next = "w7_sea2" },
        { text = "It's hard to picture, with all this salt.", next = "w7_sea3" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    w7_sea2 = {
      lines = {
        { id = "w7_sea2_l1", text = "The Sundering, and the long ages after it. The waters drew back and left the salt behind, and what was a shore became a desert. I was already with the ancestors by then, and I watched it happen as one watches a slow tide." },
        { id = "w7_sea2_l2", when = { race = "NightElf" }, text = "The Sundering broke the land, {g:brother|sister}, and the seas shifted for ages after. You will have heard the priestesses speak of it; I watched it from among the ancestors, and I grieved, as you would." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", reply = "Do not be. Grief is only love that has outlived its object." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_sea3 = {
      lines = {
        { id = "w7_sea3_l1", text = "It is, and yet if you stand very still at night and listen past the goblins, the wind in the needles makes the same sound the waves once did. The land has not forgotten." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I served the Moon Goddess in the old kingdom, before the Sundering broke the world and drew the waters away. I remember this land as a shore, and I remember the morning dew on the grass that gave my family its name." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "Memory holds me, and the moonlight. My people live a very long time, and so we remember a very long time, and the festival lets the remembered speak back once a year." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Then you have a patient heart, and Elune favours patience. The young races often lack it.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "Perhaps, though the living build their way on what the dead left them. Even these goblins race on an old seabed.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year beneath the moon, when the elders of every people are honoured. In Moonglade the druids keep the great celebration, and Elune lets the old spirits linger near their descendants for a while." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is sacred to the druids, and Elune's light gathers there when the year turns. Most of the elders go there in the end, but some of us like to wander first." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Then I accept your respect, and I give you the coin of my line as the custom asks. Remember that this dust was once a shore, and that I saw it." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then we are sisters in the moonlight, whatever our years. Keep faith with her, and she will keep faith with you." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    yland = {
      lines = {
        { id = "yla_default", text = "There were reeds as tall as a Sentinel, and white herons, and the water was warm in the shallows. Children waded out to catch shrimp at dawn. I waded too, when the temple let me, and the dew lay so heavy on the grass that your hem was wet to the knee." },
        { id = "yla_tauren", when = { race = "Tauren" }, text = "Reeds as tall as a Sentinel, white herons and warm shallows. Your people have tales of a time before the great mesas, I think, and the Earth Mother remembers it too. I waded there as a girl." },
      },
      choices = { { text = "It sounds beautiful. Something else.", next = "BACK" } },
    },
    ygoblins = {
      narr = "An engine backfires on the flats, and she closes her eyes until the echo dies.",
      lines = { { id = "ygo_default", text = "They race over the old seabed and never once wonder what lay beneath it. Some of my people would have them driven off, for the sake of what was. Others say the land belongs to the living now. What say you?" } },
      choices = {
        { text = "Let them race. The land is theirs now.", next = "BACK", reply = "Perhaps. The herons are long gone, and they do not mind the noise.", fx = { align = { order = -1 } } },
        { text = "Some places deserve to be kept sacred.", next = "BACK", reply = "Then remember this place as I do, and it will be.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    elune = { { id = "yt_elune", text = "Elune's light falls on the salt as it once fell on the water. She does not mind the change as much as I do." } },
    lunar_festival = { { id = "yt_lunar", text = "Once a year the elders are honoured, and once a year I remember this shore aloud." } },
    shimmering_flats = { { id = "yt_flats", text = "The Shimmering Flats were the bottom of a sea when I was young. The salt still tastes of it." } },
    _none = { { id = "tp_none", text = "That is beyond my memory, traveller, which is a long way to go." } },
  },
}

-- Freewind Brave: the tauren guards who keep the lifts and the ramp up to Freewind Post.
P:NPC {
  key = "tn_freewind_brave", id = 9525, name = "Freewind Brave", gender = "male",
  role = "guard", tier = "service",
  communities = { "freewind" }, temper = { "steady", "watchful" }, values = { "duty", "tribe" },
  notices = { "race", "travel" },
  impression = {
    first = "He leans on his spear and watches the canyon floor below.",
    third = "{name} spoke with a Freewind Brave guarding the lifts of Freewind Post.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Peace, friend. The lift is sound and the post is above, and you're welcome at both." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Peace, {class}. The lift is sound. Use it, and keep the peace on the post above." },
    { id = "g_default", text = "Peace, {class}. The lift is sound, and the post is above, if you have business there." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "Keep your weapons sheathed, stranger. Freewind Post does not welcome trouble, and I am the one who stops it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Earth Mother's blessing, {g:brother|sister}. It is good to see horns up here among the needles." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard the ramp and the lifts of Freewind Post, so that nothing climbs up here that we did not invite. The Grimtotem and the centaur would both like to try." },
                { id = "h_alli", when = { faction = "Alliance" }, text = "I guard the lifts of Freewind Post for the Horde and for Thunder Bluff. Say what you need and be on your way." } },
      again = { { id = "h_again", text = "Something more? My eyes stay on the canyon while we talk." } },
      choices = {
        { text = "Who troubles the post?", next = "threats" },
        { text = "How do the lifts work?", next = "lifts" },
        { text = "How did you come to guard Freewind?", next = "xhow" },
        { text = "What lies below in the canyons?", next = "xbelow" },
        { text = "What do you think of the Raceway?", next = "xrace" },
        { text = "What's the hardest part of guarding the lifts?", next = "w7_lift" },
        { text = "Farewell, brave.", next = "END" },
      },
    },
    w7_lift = {
      lines = {
        { id = "w7_lift_l1", text = "The nights, {class}. In the dark, every creak of the rope sounds like an enemy climbing, and every gust sounds like a harpy diving, and I must stand still and listen and decide which is which." },
      },
      choices = {
        { text = "How do you tell?", next = "w7_lift2" },
        { text = "I'd trust my eyes, not my ears.", next = "w7_lift3" },
        { text = "Something else, brave.", next = "BACK" },
      },
    },
    w7_lift2 = {
      lines = {
        { id = "w7_lift2_l1", text = "The rope creaks in a rhythm when the counterweight shifts, and a climber breaks that rhythm. My father taught me to hum along with it, so when the hum goes wrong, I know before I see anything." },
        { id = "w7_lift2_l2", when = { race = "Tauren" }, text = "You will know the old herding hum, the low one. My father taught me to hum it with the rope, and when the rhythm breaks, a climber is there. Learn it, and you will never be surprised on a lift." },
      },
      choices = {
        { text = "Clever.", next = "BACK", reply = "Not clever. Patient. The Earth Mother rewards patience." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_lift3 = {
      lines = {
        { id = "w7_lift3_l1", text = "Then you would see nothing until it was beside you. The canyon at night is black as a kodo's eye, and eyes are no use in it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "t_default", text = "The Galak centaur raid from the west, and the Grimtotem keep camps among the needles and hate any tauren who follows Cairne. Below us the Venture Company goblins dig where they like, and nobody asked the land first." } },
      choices = {
        { text = "The Grimtotem are tauren too. Can't they be reasoned with?", next = "grimtotem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grimtotem = {
      lines = { { id = "g_default2", text = "Magatha Grimtotem's people want the tauren apart from the Horde, and they treat other races as enemies. Cairne has offered them peace more times than I can count, and they answer with spears." } },
      choices = {
        { text = "Then they should be driven from the needles.", next = "BACK", reply = "Many here agree with you, {class}. Bring their spears down, and the post will remember it.", fx = { align = { honor = 1 } } },
        { text = "Cairne is right. Keep offering peace.", next = "BACK", reply = "The High Chieftain's patience is greater than mine, and perhaps that is why he leads. I will keep my spear ready all the same.", fx = { align = { honor = -1 } } },
      },
    },
    lifts = {
      lines = { { id = "l_default", text = "Ropes, counterweights and a good deal of trust, {class}. The platforms rise and fall between the mesas, and the brave at the bottom watches the brave at the top." } },
      choices = { { text = "I'll trust them, then. Something else.", next = "BACK" } },
    },
    xhow = {
      lines = {
        { id = "x_xhow", text = "My father guarded these lifts before me, and his father climbed these mesas when there were no lifts at all. Freewind is in my blood, as the wind is in the grass." },
      },
      choices = {
        { text = "Will your children guard it too?", next = "xkids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xkids = {
      lines = {
        { id = "x_xkids", text = "If the Earth Mother grants me children, they may choose for themselves, as I chose. A brave who stands here only because he was told to will not stand long when the centaur come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbelow = {
      lines = {
        { id = "x_xbelow", text = "The Galak centaur roam the canyon floors, and they raid any tauren foolish enough to walk alone. Further down there are the old Highperch roosts, where the wyverns nest and the hunters climb." },
      },
      choices = {
        { text = "Should the Galak be driven out?", next = "xgalak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgalak = {
      lines = {
        { id = "x_xgalak", text = "Some of the elders say we must drive them from the Needles entirely, and others say we must only hold the mesas and let the canyons be. I have not decided which is wiser." },
      },
      choices = {
        { text = "Drive them out. The Needles belong to the tauren.", next = "BACK", reply = "Many braves would cheer you for that. I am not sure I would.", fx = { align = { light = -1 } } },
        { text = "Hold the mesas. Endless war helps no one.", next = "BACK", reply = "That is the elders' patience speaking. Perhaps it is mine too.", fx = { align = { light = 1 } } },
      },
    },
    xrace = {
      narr = "He almost smiles, then looks back at the canyon.",
      lines = {
        { id = "x_xrace", text = "Loud and strange and full of smoke, and the goblins pay well for water and fresh meat. The young braves sneak down to watch, and I pretend not to notice." },
      },
      choices = {
        { text = "Do you watch too?", next = "BACK", reply = "Once or twice. The gnome car caught fire very beautifully." },
      },
    },
  },
  topics = {
    freewind_post = { { id = "tp_xfreewind_post", text = "Freewind Post sits on the highest mesas, where only the wind and the tauren live." } },
    galak = { { id = "tp_xgalak", text = "The Galak are cunning and quick. Never chase one into a narrow canyon." } },
    _none = { { id = "tp_none", text = "I keep the lifts, {class}, not the gossip. Ask at the inn above." } },
  },
}

---------------------------------------------------------------------------
-- "Plucky" Johnson: Magus Tirth's apprentice, hiding at the Mirage Raceway as a chicken.
---------------------------------------------------------------------------
P:NPC {
  key = "tn_plucky_johnson", id = 6626, name = "\"Plucky\" Johnson", gender = "male",
  role = "vendor", tier = "quest",
  communities = { "raceway" }, temper = { "nervous" }, values = { "survival", "freedom" },
  impression = {
    first = "A chicken pecks at the salt by the Raceway stands. When you look at it, it looks back, which chickens do not usually do, and then it clucks in a way that sounds almost like a sigh.",
    third = "{name} met \"Plucky\" Johnson, a human apprentice who turned himself into a chicken to hide from his master.",
  },
  greetings = {
    { id = "g_default", text = "Bawk. Bawk-bawk? ...Oh, all right, you've seen through it. Please keep your voice down." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again. You haven't told the Magus where I am, have you? Bawk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Johnson's the name, though the racing crowd calls me Plucky, which I suppose I've earned. I was apprenticed to Magus Tirth, and I am hiding from him, and a chicken is the last place he would look." },
        { id = "h_q", when = { questActive = TODO_QUEST("Get the Scoop") }, text = "You're asking about the Magus's business? Bawk. Then you'd better hear the whole sorry tale from me first." },
      },
      again = { { id = "h_again", text = "Anything else? Whisper it, please, and cluck now and then so the goblins think we're discussing grain. Bawk." } },
      choices = {
        { text = "Why hide from your own master?", next = "tirth" },
        { text = "Can you turn yourself back?", next = "back" },
        { text = "The racing crowd seems fond of you.", next = "raceway" },
        { text = "I know that polymorph. I could undo it for you.", next = "mage", when = { class = "MAGE" } },
        { text = "What's it like being a chicken?", next = "xlife" },
        { text = "Do you have any friends here?", next = "xfriends" },
        { text = "I'm a mage. Could I break the spell?", next = "xmage", when = { class = "MAGE" } },
        { text = "What will you do if Tirth finds you?", next = "w7_found" },
        { text = "Don't worry. Your secret is safe.", next = "END" },
      },
    },
    w7_found = {
      lines = {
        { id = "w7_found_l1", text = "Run, bawk, as fast as these legs allow, which is surprisingly fast. And then, if he catches me, I suppose I'll apologise properly for the chair and offer to scrub his laboratory for a year." },
      },
      choices = {
        { text = "He might forgive you.", next = "w7_found2" },
        { text = "You should face him now.", next = "w7_found3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_found2 = {
      lines = {
        { id = "w7_found2_l1", text = "He might, he's not a cruel man, only a very frustrated one. But every day I wait, I imagine his face getting redder, and the apology getting longer, and the year of scrubbing becoming two. Bawk." },
        { id = "w7_found2_l2", when = { class = "MAGE" }, text = "He might; you'd know better than I how a magus's temper runs. Do you think a written apology, with diagrams of how I'd fix the chair, would help? He likes diagrams. Bawk." },
      },
      choices = {
        { text = "It's worth a try.", next = "BACK", reply = "Then I'll start drafting. With my beak. Bawk." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_found3 = {
      lines = {
        { id = "w7_found3_l1", text = "Now? Bawk, I'm a chicken, I'd have to un-chicken first, and that takes nerve, which I haven't got, which is how I became a chicken in the first place." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tirth = {
      lines = { { id = "t_default", text = "The Magus is a brilliant man with a short temper and a long list of chores. I broke one of his things, then another, and by the third I decided that an apprentice who runs away keeps more of his feathers." } },
      choices = {
        { text = "You owe him an apology and an honest day's work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No one should serve a master they fear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What exactly did you break?", next = "broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    broke = {
      lines = { { id = "br_default", text = "A crystal focus, a very old mirror, and then, bawk, the leg of his favourite chair, which he took worst of all. He shouted a word I didn't know, and I decided I didn't want to learn it up close." } },
      choices = { { text = "A wise decision. Something else.", next = "BACK" } },
    },
    raceway = {
      lines = { { id = "ra_default", text = "Fond enough to share their crumbs, bawk. The goblins think I'm lucky, so they rub my head before every race, and the gnomes keep trying to measure me for some reason. It beats lugging reagents up a tower." } },
      choices = { { text = "Something else, Plucky.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Please don't! Bawk! I mean, thank you, truly, but I did it to myself on purpose, and if I'm a man again the Magus will find me by supper. Let me be a chicken a while longer." } },
      choices = { { text = "As you wish. Something else.", next = "BACK" } },
    },
    back = {
      lines = { { id = "b_default", text = "In theory, yes. In practice, I've grown rather good at being a chicken, and the goblins here feed me for free. Bawk. I may stay a little longer." } },
      choices = { { text = "Mind the gnome racers' wheels.", next = "BACK" } },
    },
    xlife = {
      lines = {
        { id = "x_xlife", text = "Surprisingly restful, apart from the constant urge to scratch at the ground and the strong dislike of foxes. I have learned a great deal about grain, which I never wanted to know." },
      },
      choices = {
        { text = "Do you want to be human again?", next = "xhuman" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "x_xhuman", text = "Of course I do, and also not really, because a human apprentice has duties and debts and a very angry master. A chicken has only chickens, and the racing crowd feeds me crumbs." },
      },
      choices = {
        { text = "Face your master. Running away is cowardice.", next = "BACK", reply = "Easy for someone who isn't feathered to say. But you're right, curse it.", fx = { align = { honor = 1 } } },
        { text = "Stay a chicken if it makes you happy.", next = "BACK", reply = "Do you mean that? You're the first one who hasn't laughed.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    xfriends = {
      narr = "The chicken fluffs its feathers and looks away with surprising dignity.",
      lines = {
        { id = "x_xfriends", text = "The pit crews think I'm good luck, so they save me crusts, and the ogres try to pat me, which is terrifying. I talk to the other chickens, but their conversation is very limited." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "x_xmage", text = "Please don't, I beg you, the last apprentice who tried turned himself into a sheep for an afternoon. If I'm to be fixed, it should be by the Magus himself, and only after I've apologised." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", reply = "Thank you, truly. You've a gentle hand with polymorph, I can tell." },
      },
    },
  },
  topics = {
    magus_tirth = { { id = "tp_xmagus_tirth", text = "Magus Tirth was my master. He's brilliant, and terrifying, and probably looking for me." } },
    mirage_raceway = { { id = "tp_xmirage_raceway", text = "The Raceway is the safest place for a chicken to hide. Nobody looks twice." } },
    _none = { { id = "tp_none", text = "Bawk. I'm a chicken; I don't know much. Ask the goblins." } },
  },
}
