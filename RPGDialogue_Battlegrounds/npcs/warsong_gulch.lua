-- Inside Warsong Gulch: the defenders of Silverwing Hold and the Warsong Lumber Mill. Vanilla had no named
-- NPCs inside the gulch beyond the spirit guides (left to the World pools), so these are role-style,
-- name-matched NPCs. The capital emissaries live in RPGDialogue_World/emissaries/warsong_gulch.lua.
local P = RPGDialogueAPI:Pack("rpgd.battlegrounds")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Silverwing Sentinel: a night elf warrior of the Silverwing Sentinels holding the Hold.
P:NPC {
  key = "bg_wsg_sentinel", id = TODO_NPC("Silverwing Sentinel"), name = "Silverwing Sentinel",
  role = "guard", tier = "quest", gender = "female",
  communities = { "silverwing", "kaldorei" }, temper = { "stern", "proud" }, values = { "dutiful", "loyal", "honorable" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "She watches the treeline toward the mill as if counting every axe in it.",
    third = "{name} spoke with a Silverwing Sentinel at the walls of Silverwing Hold in Warsong Gulch.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. You stand within Silverwing Hold, so keep your blade ready and your voice low." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the Hold. Good, for the orcs have not tired of this gulch, and neither may we." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You should not be inside these walls, and if you have come for our banner, you will leave without it." },
    { id = "g_honored", when = { reputation = { faction = "Silverwing Sentinels", min = "honored" } }, text = "Elune-adore, the Sentinels know your face well now. Stand with us, friend of Silverwing." },
  },

  notice = {
    { id = "n_hunter", cat = "soldier", when = { class = "HUNTER", faction = "Alliance" },
      text = "A hunter. The gulch is narrow and the orcs run straight, which suits a good bow and a patient eye." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Silverwing Sentinels", min = "exalted" } },
      text = "Your name is spoken at Silverwing Grove as one of our own, and that is an honour few outsiders have ever held." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "She does not turn from the wall, but her hand settles on the glaive at her side.",
      lines = {
        { id = "h_default", key = true,
          text = "The Warsong clan cuts the forest beyond this gulch, and the Silverwing Sentinels stand here so that it ends here. Ask what you must, {class}, but do it quickly." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Sister of the forest, or brother, it matters little here. You know what an axe sounds like in Ashenvale, and you know why we will not yield this Hold." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf of Ironforge in our Hold. Your people cut stone, not living trees, so I will trust your axe more than most." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You speak, at least, rather than burn. Say what you came to say, and then go back down the gulch to your mill." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The orcs will not wait on our talk." },
        { id = "h_again2", text = "Speak, then, while the gulch is quiet." },
      },
      choices = {
        { text = { normal = "Why do the Sentinels fight over this gulch?", polite = "If I may ask, why do the Sentinels hold this gulch?", blunt = "Why fight over this gulch?" }, next = "why" },
        { text = { normal = "Tell me about the banner in your keep.", polite = "Would you tell me about the banner you guard?", blunt = "What's with the banner?" }, next = "flag" },
        { text = "These walls look older than the war itself.", next = "hold" },
        { text = "Who commands the Silverwing Sentinels?", next = "command" },
        { text = "I walk the forest as you do, Sentinel.", next = "kin", when = { race = "NightElf" } },
        { text = "Elune keep you, Sentinel.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Beyond this gulch is Ashenvale, and the Warsong orcs have been felling it since they first came to these lands. The Lumber Mill at the far end feeds their camps, and every log that leaves it is an ancient tree that will never grow again." },
      },
      choices = {
        { text = "Their warchief's father killed Cenarius, I've heard.", next = "why_grom" },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    why_grom = {
      big = true,
      lines = {
        { id = "wg_default", text = "Grom Hellscream slew the demigod Cenarius in this very forest, and his clan has cut it ever since as if the deed were a right. The Horde says Hellscream later died to free them of the demon's blood, but the forest does not forget what his axe did." },
        { id = "wg_horde", when = { faction = "Horde" }, text = "Your Hellscream killed Cenarius in these woods, orc-friend, and you call him a hero for it. Perhaps he freed your people at the end, but that does not regrow a single tree." },
      },
      choices = {
        { text = "Then drive them from Ashenvale entirely. No mercy for the Warsong.", next = "BACK", reply = "You speak as the Sentinels feel, though Tyrande would remind us both that rage has cost our people dearly before.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Hold the forest, but there may be peace someday.", next = "BACK", reply = "Perhaps, in ten thousand years, and I have seen stranger things than that. Until then, I hold the Hold.", fx = { align = { light = 1 } } },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },

    flag = {
      lines = {
        { id = "fl_default", text = "Our banner rests deep in the Hold, in the room above the tunnel, and theirs rests in the Lumber Mill. Whoever carries the other's banner home three times has won the day, though the forest is never truly won by banners." },
      },
      choices = {
        { text = "The orcs keep trying to carry it out, then.", next = "flag_runners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flag_runners = {
      lines = {
        { id = "fr_default", text = "They come through the tunnel, across the ramps and over the roof, and some of them are fast as a nightsaber. Watch the carrier, {class}, and never let them reach the open field with it, for out there they can run all the way to the mill." },
        { id = "fr_rogue", when = { class = "ROGUE" }, text = "You would know the tricks they use, shadow-walker, and I would rather you used them on the orcs who come for our banner than on anyone else." },
      },
      choices = {
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },

    hold = {
      lines = {
        { id = "ho_default", text = "Silverwing Hold was raised by our people long before the orcs came through the Dark Portal, and its stones remember the Kaldorei who shaped them. We hold it now because it stands between the mill and the heart of the forest." },
      },
      choices = {
        { text = "And the orcs built their mill right across the gulch.", next = "hold_mill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold_mill = {
      lines = {
        { id = "hm_default", text = "They built it with timber from the forest it threatens, which is the orc way of things, and they guard it as fiercely as we guard this place. I will give them that much, for the Warsong do not run from a fight." },
      },
      choices = {
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },

    command = {
      lines = {
        { id = "co_default", text = "Our officers answer to Silverwing Grove in Ashenvale, and the Grove answers to Tyrande Whisperwind, High Priestess of Elune. Illiyana Moonblaze keeps the Grove's stores, if you have earned anything from the Sentinels." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    kin = {
      lines = {
        { id = "ki_default", text = "Then you have heard the forest cry out when the axes bite, as I have, and you know this is no game of banners for us. Fight here as you would fight for Darnassus, for it is the same war." },
      },
      choices = {
        { text = "I will, and Elune guide my blade.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this gulch, the Hold and every path the orcs take to reach it. Ask." } },
    background = { { id = "tp_bg", text = "I am a Sentinel of Silverwing, sent from Ashenvale to hold this gulch, and I have fought orcs since they first set axe to our forest." } },
    advice = { { id = "tp_ad", text = "Guard the healers, watch the tunnel, and never let a carrier out of your sight." } },
    ashenvale = { { id = "tp_ash", text = "Ashenvale is the oldest forest in Kalimdor, and the orcs want it only for its wood. That is reason enough to fight." } },
    _none = { { id = "tp_none", text = "That is not my concern while the orcs are at the gate." } },
  },
}

-- Warsong Outrider: an orc of the Warsong Outriders defending the Lumber Mill.
P:NPC {
  key = "bg_wsg_outrider", id = TODO_NPC("Warsong Outrider"), name = "Warsong Outrider",
  role = "guard", tier = "quest", gender = "male",
  communities = { "warsong", "orc" }, temper = { "fierce", "proud" }, values = { "brave", "loyal", "honorable" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "He looks at every newcomer as if weighing how many trees they could carry.",
    third = "{name} spoke with a Warsong Outrider at the Warsong Lumber Mill in Warsong Gulch.",
  },

  greetings = {
    { id = "g_default", text = "You stand in the Lumber Mill, {class}, so pick up an axe or pick up a blade, and do it fast." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good, for the elves have not stopped shooting at my peons." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "An Alliance dog in the mill. Speak, then, before my axe decides for me." },
    { id = "g_honored", when = { reputation = { faction = "Warsong Outriders", min = "honored" } }, text = "The Outriders know your name, and that means something here. Lok'tar, {class}." },
  },

  notice = {
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR", faction = "Horde" },
      text = "A warrior. Hellscream would have liked the look of you, and he did not like the look of many." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Warsong Outriders", min = "exalted" } },
      text = "Exalted among the Outriders. The whole clan drinks to you at Mor'shan, and I will drink with them." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "He leans on a woodsman's axe that has clearly cut more than wood.",
      lines = {
        { id = "h_default", key = true,
          text = "This is the Warsong Lumber Mill, and the Outriders hold it for the Horde. The elves want us gone from their forest, but Orgrimmar needs timber, and the Warsong do not leave a fight." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Another orc, good. Some clans forgot how to fight once they left the camps, but the Warsong never did, and you look like you never did either." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. Your people talk to the land, so I will not ask you to love what we do here, only to stand with us when the elves come." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are a long way from the Hold, little Alliance. Say your piece, and I may let you walk back to it." },
      },
      again = {
        { id = "h_again", text = "What else? The elves won't wait for us to finish talking." },
        { id = "h_again2", text = "Speak, {class}, and then fight." },
      },
      choices = {
        { text = { normal = "Why does the Horde cut this forest?", polite = "If you'd allow it, why does the Horde cut this forest?", blunt = "Why cut the forest?" }, next = "why" },
        { text = { normal = "Tell me about the banner in the mill.", polite = "Would you tell me about the mill's banner?", blunt = "What about the banner?" }, next = "flag" },
        { text = "You fight like Hellscream's own clan.", next = "grom" },
        { text = "Who leads the Outriders?", next = "command" },
        { text = "The Earth Mother weeps for these trees, orc.", next = "tauren", when = { race = "Tauren" } },
        { text = "Lok'tar ogar, Outrider.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Orgrimmar was built from wood, and Durotar has none worth cutting, so we come to Ashenvale where the trees are thick. The elves call it murder, but a people with no walls and no roofs does not survive." },
      },
      choices = {
        { text = "The night elves say these trees are sacred.", next = "why_sacred" },
        { text = "Something else, Outrider.", next = "BACK" },
      },
    },
    why_sacred = {
      big = true,
      lines = {
        { id = "ws_default", text = "Everything is sacred to the elves, it seems, and they shoot anyone who forgets it. Thrall tells us to cut only what we need, and I obey the Warchief, but the elves would kill us for one stick of firewood." },
        { id = "ws_alliance", when = { faction = "Alliance" }, text = "Your elf friends say so, aye, and then they put arrows in peons who only came to cut fuel for their families. Tell me which of us is the savage, then." },
      },
      choices = {
        { text = "The Horde takes what it needs. The elves can bleed for it.", next = "BACK", reply = "Ha! That is the Warsong spirit, though the Warchief would tell you to save your fury for those who come with swords.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Cut what we need and fight them fairly. That is enough.", next = "BACK", reply = "That is Thrall's way, and it is the right way, even if the elves never see it.", fx = { align = { honor = 1 } } },
        { text = "Something else, Outrider.", next = "BACK" },
      },
    },

    flag = {
      lines = {
        { id = "fl_default", text = "The Warsong banner hangs in the mill, high in the room above the tunnel. If the elves carry it to their Hold three times, the day is theirs, so we do not let them carry it once." },
      },
      choices = {
        { text = "Their runners must be fast to get it out.", next = "flag_runners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flag_runners = {
      lines = {
        { id = "fr_default", text = "Their druids run like cats and their rogues hide in shadows, so watch the ramps and the tunnel both. If one gets onto the open field, chase them with everything you have and do not stop until they fall." },
        { id = "fr_shaman", when = { class = "SHAMAN" }, text = "Your earth totems slow the runners, shaman, and slow runners die. Plant them in the tunnel and you will see." },
      },
      choices = {
        { text = "Something else, Outrider.", next = "BACK" },
      },
    },

    grom = {
      lines = {
        { id = "gr_default", text = "We are Hellscream's clan, and we carry his name with pride. He drank the demon's blood first, and he was the one who killed the demon Mannoroth to free us all from it, so the Warsong owe him everything." },
      },
      choices = {
        { text = "He also killed Cenarius, the elves' demigod.", next = "grom_cenarius" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom_cenarius = {
      lines = {
        { id = "gc_default", text = "He did, and that is why the elves hate us more than any other clan. Cenarius fell while Hellscream still had the demon in him, and he paid for every wrong he ever did when he killed Mannoroth." },
      },
      choices = {
        { text = "Something else, Outrider.", next = "BACK" },
      },
    },

    command = {
      lines = {
        { id = "co_default", text = "The Outriders answer to Mor'shan Base Camp in the Barrens, where Captain Shatterskull keeps the camp and Kelm Hargunth keeps the supplies. If you have earned the clan's trust, Kelm will see you properly equipped." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    tauren = {
      lines = {
        { id = "ta_default", text = "Maybe she does, and I will not argue with the Earth Mother. But your people have their wood and walls in Mulgore, and mine had nothing but the camps, so we take what we must." },
      },
      choices = {
        { text = "Then take only what you must, as Thrall says.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the mill, the gulch and every trick the elves have tried here. Ask." } },
    background = { { id = "tp_bg", text = "I am of the Warsong clan, and I was cutting wood in Ashenvale before this gulch had a name." } },
    advice = { { id = "tp_ad", text = "Kill their healers first, then their carrier, then whoever is left." } },
    ashenvale = { { id = "tp_ash", text = "Good wood and too many elves. The wood is worth the trouble." } },
    _none = { { id = "tp_none", text = "That is not a mill matter, so I do not care about it." } },
  },
}

-- Silverwing Warden: a flag-room guard deep in Silverwing Hold (role name; may not be a real spawn).
P:NPC {
  key = "bg_wsg_warden", id = TODO_NPC("Silverwing Warden"), name = "Silverwing Warden",
  role = "guard", tier = "service", gender = "female",
  communities = { "silverwing", "kaldorei" }, temper = { "stern", "quiet" }, values = { "dutiful", "loyal" },

  impression = {
    first = "She stands before the banner as still as a carved statue.",
    third = "{name} spoke with a Silverwing Warden guarding the banner room of Silverwing Hold.",
  },

  greetings = {
    { id = "g_default", text = "This room holds the banner of Silverwing, {class}. Stand guard or move along, but do not linger idly." },
    { id = "yg_0", when = { race = "NightElf" }, text = "Ishnu-alah, sister or brother. Stand with me, and Elune will guard our banner." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a Sentinel in Ashenvale for four centuries before the Warsong came. I watched them cut the first tree, and I swore that day I would stop them. Shandris chose me to guard this banner, and I have not left it since." },
      },
      choices = {
        { text = "Four centuries is a long time.", next = "y_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_long = {
      lines = {
        { id = "y_y_long", text = "For a kaldorei, it is a season. For an orc, it is a dozen lifetimes. I sometimes think that is why we cannot understand each other. They are always in a hurry, and we are always waiting." },
        { id = "y_y_long_v0", when = { race = "Orc" }, text = "For you, orc, it is a dozen lifetimes. For me, a season. Perhaps that is why we cannot understand each other." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_peace = {
      lines = {
        { id = "y_y_peace", text = "Some Sentinels say we should seek terms with the Horde, so the forest can heal. Others say there can be no peace while a single axe swings. What do you think?" },
      },
      choices = {
        { text = "Seek terms. The forest needs peace.", next = "BACK", reply = "Perhaps. But I have never seen an orc lay down his axe.", fx = { align = { order = 1 } } },
        { text = "No peace while they cut the trees.", next = "BACK", reply = "Yes. That is what Shandris says, and I agree.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The banner is my charge, and I have not left this room since the fighting began. If the orcs reach it, they will have passed me first." },
      },
      again = {
        { id = "h_again", text = "Anything else? My eyes stay on the doors." },
        { id = "xh_again2", text = "You remain. Speak, then, but keep one eye on the doorway." },
      },
      choices = {
        { text = "How do the orcs usually come?", next = "routes" },
        { text = "You must grow weary standing here.", next = "weary" },
        { text = "Who commands the Silverwing Sentinels?", next = "xlead" },
        { text = "Why do the orcs cut these woods?", next = "xorcs" },
        { text = "What happens if the banner is taken?", next = "xtaken" },
        { text = "Elune keep you, sister.", next = "xelf", when = { race = "NightElf" } },
        { text = "How long have you been a Sentinel?", next = "y_hist" },
        { text = "Should we seek peace with the Horde?", next = "y_peace" },
        { text = "Elune guide us, Warden.", next = "BACK", when = { race = "NightElf" }, reply = "And you. The banner is our pride; we will not let it go." },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    routes = {
      lines = {
        { id = "ro_default", text = "Through the tunnel from the field, or down from the roof by the ramps, and the clever ones come both ways at once. Watch both doors, and call out when you see a carrier." },
      },
      choices = {
        { text = "Then the roof needs more archers.", next = "routes_roof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_roof = {
      lines = {
        { id = "rr_default", text = "It does, and the archers would agree with you, but most warriors prefer the field. Bring a friend with a bow and stand up there with them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    weary = {
      lines = {
        { id = "we_default", text = "My people have kept watch for centuries, and a few hours in a stone room is nothing beside that. Elune watches with me, and that is company enough." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlead = {
      lines = { { id = "xle_default", text = "The Silverwing answer to the Sentinels, and the Sentinels answer to Tyrande Whisperwind. Her priestesses guide us, and her arrows have never missed an orc that deserved one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorcs = {
      narr = "She does not turn her head, but her grip on her glaive tightens.",
      lines = { { id = "xor_default", text = "For timber, they say, and to remind us that the forest is theirs for the taking. They killed Cenarius, and the Warsong under Hellscream were the ones who did it, so you will forgive me if I do not listen to their reasons." } },
      choices = {
        { text = "Then fight them until not one remains.", next = "BACK", reply = "That is the Sentinel's way. Elune watches, and so do I.", fx = { align = { honor = -1 } } },
        { text = "Even orcs can change. Thrall seeks peace.", next = "BACK", reply = "Perhaps, but the Warsong do not, and they are the ones at our door.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtaken = {
      lines = { { id = "xta_default", text = "Then I chase it, and every warden on the field with me, until it is ours again. A banner is not a piece of cloth, outsider, it is a promise to the forest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xelf = {
      lines = { { id = "xel_default", text = "And you, sister. Stand with me a while if you can, and let the orcs see two of us waiting for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    shandris = { { id = "tp_yshandris", text = "Shandris Feathermoon leads the Sentinels. She chose me for this post, and I will not fail her." } },
    ashenvale = { { id = "xtp_ash", text = "Our forest, and our charge. The orcs take it a tree at a time, and we take it back an arrow at a time." } },
    warsong = { { id = "xtp_war", text = "The clan that killed Cenarius. We have not forgotten, and we will not forget." } },
   
    advice = { { id = "tp_ad", text = "Never leave the banner room empty, not even for a moment." } },
    _none = { { id = "tp_none", text = "I keep the banner, and nothing else concerns me." } },
  },
}

-- Warsong Mill Guard: a flag-room guard in the Lumber Mill (role name; may not be a real spawn).
P:NPC {
  key = "bg_wsg_millguard", id = TODO_NPC("Warsong Mill Guard"), name = "Warsong Mill Guard",
  role = "guard", tier = "service", gender = "male",
  communities = { "warsong", "orc" }, temper = { "gruff" }, values = { "loyal", "brave" },

  impression = {
    first = "He grips his axe tighter whenever someone passes the banner.",
    third = "{name} spoke with a Warsong guard watching the banner room of the Lumber Mill.",
  },

  greetings = {
    { id = "g_default", text = "The banner stays here, {class}. If you are not here to guard it, you are in my way." },
    { id = "yg_0", when = { race = "Tauren" }, text = "Tauren. Stand by the door; the elves will see your size and think twice." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a lumberjack for the Warsong before I was a guard. I cut the trees the elves call holy, and I thought nothing of it. Now the elves come for our banner, and I think of the trees more than I used to." },
      },
      choices = {
        { text = "Do you regret cutting them?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = {
        { id = "y_y_regret", text = "Regret is a strong word. The Horde needs wood, and Ashenvale has it. But when I see the elves' faces, I wonder whether we could have taken less, and asked first." },
        { id = "y_y_regret_v0", when = { race = "NightElf" }, text = "You are an elf. I will not apologise for the Warsong, but I have wondered whether we could have taken less, and asked first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_forest = {
      lines = {
        { id = "y_y_forest", text = "Some warriors want to cut the whole forest to the ground, so the elves have nothing left to fight for. Others say take what we need and no more. What do you say?" },
      },
      choices = {
        { text = "Take only what we need.", next = "BACK", reply = "That is wise. Grom might not agree, but Thrall would.", fx = { align = { light = 1 } } },
        { text = "Cut it all. Let them weep.", next = "BACK", reply = "Hm. That is the old Warsong way. I am not sure I still believe in it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I guard the Warsong banner, and the elves have taken it past me only when they came in numbers. When they come again, stand beside me and they will not take it at all." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your eyes on the doors while you ask." },
        { id = "xh_again2", text = "You are back. Good, there is always room by the banner for another axe." },
      },
      choices = {
        { text = "How do the elves get in?", next = "routes" },
        { text = "You've seen many fights here, I'd guess.", next = "fights" },
        { text = "Who leads the Warsong Outriders?", next = "xlead" },
        { text = "Why fight the elves over this gulch?", next = "xwhy" },
        { text = "What do you think of the Silverwing?", next = "xsilver" },
        { text = "I'm an orc. The Warsong is my clan.", next = "xorc", when = { race = "Orc" } },
        { text = "Were you always a guard?", next = "y_hist" },
        { text = "How much of the forest should we take?", next = "y_forest" },
        { text = "Lok'tar. I'll guard the banner.", next = "BACK", when = { race = "Orc" }, reply = "Good. The banner is Grom's legacy. Do not let it fall." },
        { text = "I'll stand with you. Lok'tar.", next = "END" },
      },
    },
    routes = {
      lines = {
        { id = "ro_default", text = "Their druids slip in as cats, and their rogues come out of nowhere, so look for the shimmer in the air. Most of them come up through the tunnel and run straight for the ramp." },
      },
      choices = {
        { text = "Then we hold the ramp.", next = "routes_ramp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_ramp = {
      lines = {
        { id = "rr_default", text = "Hold the ramp and they have to fight their way out, which is what we want. An elf who has to fight is an elf who is not running." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fights = {
      lines = {
        { id = "fi_default", text = "More than I can count, and I have the scars to show for most of them. Every one of them was worth it, because the banner is still here." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlead = {
      lines = { { id = "xle_default", text = "Grom's own clan rides under the Warsong banner still, though Grom himself died killing the demon Mannoroth. We honour him by holding what he took, and this gulch is part of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhy = {
      narr = "He spits on the sawdust floor and leans on the haft of his axe.",
      lines = { { id = "xwh_default", text = "The Horde needs timber, and the forests of Ashenvale have it. The elves say every tree is sacred, and we say a Horde without lumber freezes, so here we are." } },
      choices = {
        { text = "The elves have the right of it. Some trees are sacred.", next = "BACK", reply = "Then you are standing in the wrong mill, {class}.", fx = { align = { order = -1 } } },
        { text = "The Horde must survive. Cut what we need.", next = "BACK", reply = "Lok'tar! That is how a warrior speaks.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsilver = {
      lines = { { id = "xsi_default", text = "They fight like ghosts, quiet and quick, and I respect it, though I would not say so in their hearing. They protect their trees the way we protect our banner." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorc = {
      lines = { { id = "xor_default", text = "Then you know Grom's war cry, and you know it means something here. Stand by the banner and roar it when the elves come, and they will remember the Warsong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    lumber = { { id = "tp_ylumber", text = "The mill is where we cut the trees. The elves hate it more than anything." } },
    grom = { { id = "xtp_grom", text = "Grom Hellscream freed us from the blood with his own death. Every Warsong fights in his name." } },
    silverwing = { { id = "xtp_silver", text = "The elves' sentinels. Fast, quiet and stubborn, like the trees they guard." } },
   
    advice = { { id = "tp_ad", text = "Keep someone in this room, always, or the elves will walk in and walk out laughing." } },
    _none = { { id = "tp_none", text = "Ask somebody who cares. I guard the banner." } },
  },
}
