-- Rog'mar: the Horde's great hall in the Riverglades, at war with the Twilight's Hammer in Krol'dok.
-- Voice: bibles/riverglades.md ("Horde side (1.10.0)")
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rg_kromrosh", id = TODO_NPC("Krom'rosh"), name = "Krom'rosh",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "major",
  communities = { "rogmar" }, temper = { "proud", "steady" }, values = { "brave", "stern", "loyal" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "Krom'rosh counts the dead he has sent into Krol'dok, and he means to stop counting by ending the place. He talks about the Twilight's Hammer the way a smith talks about rust.",
    third = "{name} met Krom'rosh at Rog'mar, an orc who is sending the Horde's best into Krol'dok Stronghold and wants its master dead.",
  },

  greetings = {
    { id = "g_default", text = "Speak quickly. Krol'dok does not rest, so neither does the Horde." },
    { id = "g_back", when = { metBefore = true }, text = "You came back from the glades on your own feet, which is more than most can say this season." },
    { id = "g_hero", when = { townStanding = { town = "rogmar", min = 55 } }, text = "Make way for this one; Rog'mar owes them blood and remembers it." },
    { id = "g_distrust", when = { townStanding = { town = "rogmar", max = -20 } }, text = "You again. Say what you want, and say it from over there." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, and Krol'dok did not rest while you were away, so neither did we." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You are stronger than when you first came to Rog'mar, and I can use that strength at Krol'dok, where the ogres will feel the difference before you do." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you made someone in Rog'mar back down, and I would rather you saved that for the Twilight's Hammer, because they are the ones who have earned fear." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Rog'mar speaks well of you at more than one fire, and Rog'mar does not speak well of many." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. Some orcs came to these glades with the Hammer twenty years ago and never left its shadow, so it is good to see one who stands in the right camp." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor is in pieces. Take it to Kreza before you go anywhere near the caves, or the ogres will finish what the cultists started." },
  },

  react = {
    { id = "r_ghostwolf", on = "form", when = { form = "ghostwolf" }, text = "Walk on two legs in my hall, shaman. The wolf can wait outside with the others." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Krom'rosh. Rog'mar sent its best into Krol'dok, and the caves sent back very few of them, so I am done sending scouts and ready to send killers. Their blood is owed, and I mean to collect it." },
        { id = "h_mugg_before", when = { questBefore = TODO_QUEST("Eye of Mugg") },
          text = "The cultists have a foothold in those caves far deeper than we feared, and they are feeding our allies to their altars. I want someone who can walk in and walk back out." },
        { id = "h_mugg_active", when = { questActive = TODO_QUEST("Eye of Mugg") },
          text = "You know your task. Their leader sits somewhere in the dark at Krol'dok, and I want proof in my hand that he sits there no longer." },
        { id = "h_mugg_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Eye of Mugg"), days = 3 } },
          text = "I have hung Mugg's eye where every cultist scout will see it from the ridge. Let them carry that sight back to whoever is left in those caves." },
        { id = "h_hero", when = { townStanding = { town = "rogmar", min = 55 } },
          text = "The grunts say your name at the fires, and I let them. A name is worth more to them than another sack of meal." },
        { id = "h_young", when = { band = { "Greenhorn", "Blooded" } },
          text = "You are young for the Riverglades. The ogres at Krol'dok won't care, and the cultists will be pleased, so learn quickly." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Thunder Bluff sends one of its own this far east? Good, because the Hammer poisons the land as well as the people, and I'm told your kind takes that badly." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Another Darkspear. Tan'jani will want to talk spears with you, so let him, then come to me for real work." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "The Forsaken, here. The Hammer worships death and darkness too, so you'll forgive the grunts if they watch you closely until you have killed a few cultists in front of them." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Good, because Krol'dok is full of ogres who think they are hard to kill, and I want someone who will prove them wrong." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Neza Bloodsnout will want to measure you, so stand still for it, because I trust Neza's measure more than my own." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came up quiet. The humans' best kill was done that way, twenty years ago, so I don't laugh at knives in the dark." },
        { id = "h_hpriest", when = { class = "PRIEST" }, text = "A priest. The cultists pray too, and their prayers bleed, so show me what yours can do." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The cultists hold a human tower in Sunnyglade and do things with it at night, and I would like it burned by someone who understands what burns." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Warlock. The Horde has made use of your kind before, and paid for it, so keep that demon on a short chain in my hall." },
        { id = "h_shamcl", when = { class = "SHAMAN" }, text = "A shaman. The spirits along this river are angry, and I would know whether they are angry at the Hammer or at us." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. The glades round Sunnyglade are sick with the Hammer's work, and I'm told your kind feels that like a wound." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Twilight", min = 40 } },
          text = "The scouts on the ridge say the Twilight camps are thinning, and the bodies have your marks on them. Keep at it, and Krol'dok will have to come out to us." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and then sharpen something, warrior." },
        { id = "h_again2", text = "Go on. Deeds matter more to me than words, so keep them few." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. The cultists chant at night, so I don't sleep much anyway." },
      },
      choices = {
        { text = "What waits in Krol'dok?", next = "kroldok" },
        { text = "Why is the Horde in the Riverglades?", next = "why" },
        { text = "What about the humans at Farholde?", next = "farholde" },
        { text = "There must be others worth seeing in Rog'mar.", next = "rogmar" },
        { text = "Mugg is dead. What now?", next = "after_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") } },
        { text = "Some of those orcs in the caves were Horde once.", next = "xorc", when = { race = "Orc" } },
        { text = "Krol'dok has ogres who think they can't die.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Who killed the old Horde's leaders at Farholde?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You don't seem to trust a warlock in your hall.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Are the spirits angry at us too?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "The Hammer seems to be poisoning the land.", next = "xland", when = { any = { { class = "DRUID" }, { race = "Tauren" } } } },
        { text = "Put me to work, Krom'rosh.", next = "BUSINESS", fx = { affinity = 1, standing = { rogmar = 1 } } },
        { text = "Lok'tar.", next = "END" },
      },
    },

    kroldok = {
      big = true,
      lines = {
        { id = "kd_default", text = "Caves along the northwest mountains, full of ogres and the cultists who own them. Of the few of ours who got inside, most are dead, and the rest came back talking about altars.",
          fx = { learn = { "krol_dok", "twilights_hammer" } } },
      },
      choices = {
        { text = "Someone must lead them.", next = "kd_mugg" },
        { text = "What happens on those altars?", next = "kd_altars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kd_mugg = {
      lines = {
        { id = "km_default", text = "An ogre called Mugg, an overlord, who sits at the bottom of it all. Kill the ogre at the bottom and the rest of the heap starts arguing, which is how ogres were always beaten." },
        { id = "km_done", when = { questDone = TODO_QUEST("Eye of Mugg") },
          text = "Mugg is dead, by your hand, and the heap is arguing already. The scouts hear them shouting at each other through the rock." },
      },
      choices = {
        { text = "And the cultists who aren't ogres?", next = "kd_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kd_cult = {
      lines = {
        { id = "kc_default", text = "Robed fools, mostly, and a Dark Iron dwarf who works a forge for them out in the hills. Half the plate on those ogres may be his work, so if you see him, put him down." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kd_altars = {
      big = true,
      lines = {
        { id = "ka_default", text = "They take our allies alive, and they don't bring them back. I won't tell you what the scouts found, because you'll see it yourself soon enough, and then you'll understand why I want every one of them dead." },
      },
      choices = {
        { text = "Then they all die. No prisoners.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Free the captives first. Vengeance can wait an hour.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because the Twilight's Hammer is here, and wherever it grows, it grows toward us sooner or later. Better we meet it in these glades than at the gates of Orgrimmar." },
      },
      choices = {
        { text = "The Hammer came here after the Second War?", next = "why_old" },
        { text = "The ogres of Bolder'ok fight for us?", next = "bolderok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_old = {
      lines = {
        { id = "wo_default", text = "Ogres and orcs of the old Horde, running from some ruin in the south sea after Gul'dan fell. They found an ogre mound here and dug in, and the Hammer has been rotting these glades ever since." },
      },
      choices = {
        { text = "They say Cho'gall came with them.", next = "why_chogall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_chogall = {
      big = true,
      lines = {
        { id = "wc_default", text = "They say a great many things in the dark. If the two-headed one were alive and here, I think the caves would be louder, but I keep my axe sharp in case I'm wrong." },
      },
      choices = {
        { text = "Rumors are for peons. Fight what you can see.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather chase a rumor than be caught by one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    farholde = {
      big = true,
      lines = {
        { id = "fa_default", text = "The Brotherhood of the Horse, on their island. The old Horde burned Sunnyglade and laid siege to them, and they remember it every time they see a green face, which I understand, but I have no time for their grudge while the Hammer grows.",
          fx = { learn = { "brotherhood_horse", "siege_of_farholde" } } },
        { id = "fa_alliance", when = { faction = "Alliance" },
          text = "You're one of theirs, or near enough. Then tell the Knight Commander this: we kill the same cultists, and I don't need his thanks, only his riders out of my way." },
      },
      choices = {
        { text = "The old Horde did burn their homes.", next = "fa_guilt" },
        { text = "We could fight the Hammer together.", next = "fa_together" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fa_guilt = {
      big = true,
      lines = {
        { id = "fg_default", text = "It did, with demon blood in its veins and warlocks at its ear. The Warchief broke those chains, and we do not answer for what the old Horde did in them, but I won't call it nothing either." },
      },
      choices = {
        { text = "They have a right to their anger.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "That was their war. This one is ours.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fa_together = {
      lines = {
        { id = "ft_default", text = "Together? Their sentries would put an arrow in you before you got the word out. We fight the same enemy from opposite banks of the river, and for now that will have to do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    bolderok = {
      lines = {
        { id = "bo_default", text = "They do. The Bolder'ok ogres turned on the Hammer's prophets and were thrown out for it, so now they stand with us, and an ogre with a grudge is a fine thing to have on your side." },
      },
      choices = {
        { text = "I'm not sure ogres can be trusted.", next = "bo_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bo_trust = {
      big = true,
      lines = {
        { id = "bt_default", text = "They hate the cult more than they love their dinner, and with ogres that's saying something. The Hammer drags them up to its altars when it can catch them, which is why I want Krol'dok finished." },
      },
      choices = {
        { text = "A shared enemy makes a good ally.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Trust is earned in battle, not in grudges.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogmar = {
      lines = {
        { id = "rm_default", text = "Kreza keeps the forge hot, and Neza Bloodsnout hunts the glades and judges anyone who walks in. The troll Tan'jani teaches the young ones to throw spears, mostly at humans." },
      },
      choices = {
        { text = "Who should I see first?", next = "rm_first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rm_first = {
      lines = {
        { id = "rf_default", text = "Neza, because if Neza thinks little of you, nobody here will think more. After that, Kreza, because your armor is a disgrace." },
        { id = "rf_kit", when = { durability = { min = 0.6 } },
          text = "Neza, because if Neza thinks little of you, nobody here will think more. Your armor at least has the right number of pieces, which is more than most." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    after_mugg = {
      big = true,
      lines = {
        { id = "am_default", text = "Now the caves fight among themselves, and we take the hills one by one while they do. The Hammer will send another to sit in Mugg's place, but it will take them a long time to find one who frightens the ogres as much." },
      },
      choices = {
        { text = "Then we strike again before they find one.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Hold the hills and make them come to us.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "They were, if any of them still live down there. They came east with the Hammer after the Second War and stayed in its shadow while the Warchief freed the rest of us, so they chose their masters, and I will treat them as I treat their masters." },
      },
      choices = {
        { text = "Any who lay down their arms should be brought home.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They chose the Hammer. Let them die with it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      big = true,
      lines = {
        { id = "xw_default", text = "They think a lot of things, being ogres, and most of them are wrong. Go in with a shield and a good healer, and don't let the big ones pin you against the rock." },
      },
      choices = {
        { text = "I'll go in first and come out last.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll let the ogres tire themselves out first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xr_default", text = "A human woman, the story goes, who walked into the old Horde's camp at night and killed every chieftain in it. The siege broke the next morning, and nobody has seen her since, so I'd like to know where she learned it." },
      },
      choices = {
        { text = "A blade in the night ends wars fastest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Killing chieftains in their sleep isn't a warrior's way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "I trust you as far as I can throw that demon of yours. The Horde drank from that cup once and lost its soul in it, so be useful and be careful, and I will judge you by the first and watch you for the second." },
      },
      choices = {
        { text = "The demon serves me. Never the other way around.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Power is power. I'll use what works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "That is what I am asking you. The old Horde burned this land, and the Hammer has been poisoning it since, and I don't know whether the spirits can tell us apart." },
      },
      choices = {
        { text = "Then we'll show them, by healing what we can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits will know us by the cultists we kill.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xland = {
      lines = {
        { id = "xd_default", text = "Sunnyglade's fields are black and the water near the Shroud smells of their rituals. Whatever the cultists pour on the ground, nothing grows there after." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the caves, the cult and the glades between us and them. Ask about those, and don't waste my time on the rest." } },
    background = { { id = "tp_bg", text = "I fought in the Warchief's wars and buried enough friends for two lifetimes. Now I bury cultists instead, which I prefer." } },
    advice = { { id = "tp_ad", text = "Never fight an ogre in a narrow place, and never trust anyone in a dark robe; the old Horde learned that one from Gul'dan's warlocks, and paid for it in blood." } },
    krol_dok = { { id = "tp_kd", text = "A nest of ogres and cultists in the northwest caves, and the reason Rog'mar exists. When it falls, I will sleep." } },
    twilights_hammer = { { id = "tp_th", text = "Madmen who worship the end of the world and want to hurry it along. They take prisoners for their altars, and I take no prisoners at all." } },
    brotherhood_horse = { { id = "tp_bh", text = "Stubborn humans on an island, and brave enough, I'll give them that. They kill cultists too, so I let them be." } },
    siege_of_farholde = { { id = "tp_sf", text = "The old Horde's war, not ours. They say a human assassin killed the chieftains in one night, and the warband ran without them." } },
    sunnyglade = { { id = "tp_sg", text = "Ruins full of cultists, with a human tower still standing in the middle. Someone in Krol'dok wants that tower, and I want to know why." } },
    _none = { { id = "tp_none", text = "That's no concern of mine. Ask Neza, who listens to everything." } },
  },
}

P:NPC {
  key = "rg_neza", id = TODO_NPC("Neza Bloodsnout"), name = "Neza Bloodsnout",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "rogmar" }, temper = { "sharp", "steady" }, values = { "stern" },
  notices = { "class", "pet" },

  impression = {
    first = "Neza Bloodsnout looked me over as if weighing a carcass for market, and then told me I would do. I am still not sure whether that was praise.",
    third = "{name} met Neza Bloodsnout, a hunter at Rog'mar who measures every newcomer and is rarely wrong.",
  },

  greetings = {
    { id = "g_default", text = "Stand still a moment, so I can see what you are." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, so I estimated you correctly." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast stands well. I'll judge you by how it eats and sleeps, because a pet always tells the truth about its master." },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "That's {pet}, is it? A good name, and a better animal, from the look of its feet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Neza Bloodsnout, and I hunt the glades for Rog'mar. Arrows feed us, poisons defend us, and I decide which one you're good for." },
        { id = "h_feathers", when = { questActive = TODO_QUEST("Feathers for Fletching") },
          text = "Feathers first, because an arrow that flies crooked is just a stick with ideas. Bring me good ones." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Poison Tips") },
          text = "The vipers by the pools to the south, remember, and don't get bitten collecting it, because I won't come and carry you home." },
        { id = "h_poison_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Poison Tips"), days = 3 } },
          text = "That venom would drop a kodo in minutes and a human much faster. I'm pleased with you, which doesn't happen often, so enjoy it." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, so you've hunted kodo on the plains. Then you'll know that a beast this size wants patience more than arrows." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Another troll. If Tan'jani sent you to prove spears are better than arrows, you can tell him I said no." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, and you'll have your own poisons, no doubt. Show me yours sometime and I'll show you mine, and we'll see whose kill quicker." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll want to stand in front and hit things, and I'll want to stand behind you and shoot them, so we'll get along." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Keep your imp away from my traps; the last one sprang three of them and laughed the whole time." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. If you go about on four legs out there, wear something bright, or I'll mistake you for supper." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while the light's good." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "What do you hunt out here?", next = "hunt" },
        { text = "Arrows seem to do the job well enough without poison.", next = "poison" },
        { text = "What did you estimate about me?", next = "measure" },
        { text = "You don't seem to think much of Tan'jani's spears.", next = "tanjani" },
        { text = "How does my beast measure up?", next = "xpet", when = { class = "HUNTER" } },
        { text = "My poisons kill faster than yours.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Good hunting.", next = "END" },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "Boar, mostly, for the pot, and coyotes when they come too close to the camp. The crocolisks in the river are better left alone unless you want a pair of boots and have a spare leg to pay for them." },
      },
      choices = {
        { text = "And the gnolls?", next = "hunt_gnolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt_gnolls = {
      lines = {
        { id = "hg_default", text = "Gnolls aren't game, they're vermin with spears, and they steal from every camp in the glades, ours, the humans' and the goblins' alike. I don't eat them, but I don't let them live either." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    poison = {
      big = true,
      lines = {
        { id = "po_default", text = "Poison ruins the meat, so I never use it on anything I mean to eat. On something I only need dead, like a cultist or an ogre twice my size, I don't care what it does to the taste." },
      },
      choices = {
        { text = "Poison is a coward's weapon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dead is dead. The method doesn't matter.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Where do you get it?", next = "poison_where" },
      },
    },
    poison_where = {
      lines = {
        { id = "pw_default", text = "You brew it, if you're patient, or you take it from the snake, if you're brave. The vipers by the southern pools have the strongest I've found, and I send the brave ones to fetch it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    measure = {
      lines = {
        { id = "me_default", text = "That you'd go where you were told and come back, which is rarer than you'd think. Krom'rosh trusts my measure, so I take it seriously, and so should you." },
        { id = "me_done", when = { questDone = TODO_QUEST("Poison Tips") },
          text = "That you'd fetch venom from a live snake and come back without a bite, and you did. I'm seldom wrong, but it's always nice to be right." },
      },
      choices = {
        { text = "And if you'd measured me wrong?", next = "measure_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    measure_wrong = {
      lines = {
        { id = "mw_default", text = "Then the vipers would have told me so, and I'd have sent someone else. The glades are honest that way, which is more than I can say for most people." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tanjani = {
      big = true,
      lines = {
        { id = "tj_default", text = "A spear is fine if you can get close, and Tan'jani always gets close, which is why he has so many scars. I'd rather drop a thing from a hundred paces and walk over to it afterward." },
      },
      choices = {
        { text = "Getting close takes more nerve.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Distance is sense. Only fools bleed for nothing.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpet = {
      lines = {
        { id = "xp_default", text = "Its coat is clean and it watches your hands, not mine, so you feed it well and it trusts you. That's half of hunting, and the other half is aim, which I'll judge later." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xr_default", text = "Perhaps, on a man, but mine will stop a kodo's heart, and yours were brewed for alleys. Bring me something from the glades that kills quicker, and I'll owe you an apology." },
      },
      choices = {
        { text = "Then I'll prove it on a cultist.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair. A hunter knows the wild better.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've hunted since I could hold a bow, and I've never once gone hungry, which is all the history I need." } },
    advice = { { id = "tp_ad", text = "Learn which way the wind blows before you learn anything else. Most beasts will smell you long before they see you." } },
    krol_dok = { { id = "tp_kd", text = "I don't hunt in caves. Krom'rosh sends others for that, and fewer of them come back than I'd like." } },
    _none = { { id = "tp_none", text = "I don't track that. Ask Krom'rosh, or ask the wind." } },
  },
}

P:NPC {
  key = "rg_tanjani", id = TODO_NPC("Tan'jani"), name = "Tan'jani",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "rogmar" }, temper = { "sly" }, values = { "witty" },
  notices = { "class", "race" },

  impression = {
    first = "Tan'jani is a troll headhunter who laughs at nearly everything, spears especially. He sent me to steal timber from the human loggers as if it were the most natural thing in the world.",
    third = "{name} met Tan'jani, a cheerful troll headhunter at Rog'mar who makes his spears from the humans' own woodpiles.",
  },

  greetings = {
    { id = "g_default", text = "'Ey, {g:boss-mon|boss-lady}, ya come to see ol' Tan'jani?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ya still got all ya fingers, I see." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Ahh, a Darkspear! Now dat's a face from home, mon, and I bet ya throw a spear like ya mean it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Bow and arrow, eh? Neza been at ya already, I see, but don't ya worry, I'll show ya de better way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tan'jani, headhunter. Orcs be good at hittin' humans with axes, but when ya want to stick 'em before dey see ya comin', dat's when ya call on me." },
        { id = "h_fletch", when = { questActive = TODO_QUEST("Fetch 'n' Fletch") },
          text = "Ya got dat wood yet? De human camp to de west, mon, and take a knife to sharpen 'em with." },
        { id = "h_fletch_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Fetch 'n' Fletch"), days = 3 } },
          text = "Dese spears be nice and sharp, mon. Dey gonna stick good, and de humans gonna wonder where all dey firewood went." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, come to learn from de troll? Heh, Krom'rosh never come to learn nothin', so ya already smarter dan him." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Big one! Ya don't need a spear, mon, ya need a door to fit through." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "A dead one walkin'. I seen de headhunters' juju make worse den you, so don't ya worry, Tan'jani don't scare easy." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Sneaky! Ya walk like a headhunter already, mon, so all ya need is a spear." },
        { id = "h_shamcl", when = { class = "SHAMAN" }, text = "A shaman, eh? Ask de spirits to make my spears fly straight, and I give ya de first one." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Ya could set my spears on fire, mon, and den I really be stickin' 'em good." },
      },
      again = {
        { id = "h_again", text = "What else ya want to know, mon?" },
        { id = "h_again2", text = "Ask away, ask away." },
      },
      choices = {
        { text = "What's a headhunter?", next = "headhunter" },
        { text = "Why steal the humans' wood?", next = "wood" },
        { text = "Neza says spears are for fools.", next = "neza" },
        { text = "What comes after the spears?", next = "after", when = { questDone = TODO_QUEST("Fetch 'n' Fletch") } },
        { text = "You must miss the Echo Isles.", next = "xhome", when = { race = "Troll" } },
        { text = "Those loggers aren't soldiers, Tan'jani.", next = "xloggers", when = { faction = "Alliance" } },
        { text = "Later, Tan'jani.", next = "END" },
      },
    },
    headhunter = {
      lines = {
        { id = "hh_default", text = "Dat's a troll who throws spears for a livin', mon, and hits what he throws at. Back home we hunt in de jungle, and here we hunt in de glades, and de only difference is de glades got more cultists." },
      },
      choices = {
        { text = "Who taught you?", next = "hh_taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hh_taught = {
      lines = {
        { id = "ht_default", text = "My uncle, who threw better dan anybody on de islands and was proud of it, so proud he made me practice till my arm fall off. I see it in ya eyes too, mon; ya wanna learn to stick 'em." },
      },
      choices = {
        { text = "Teach me, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      big = true,
      lines = {
        { id = "wo_default", text = "'Cause it be good wood, mon, already cut and stacked nice by de humans, and it make fine spears. Dey cut it to build walls against us, so I take it to make spears against dem, and dat seem fair to Tan'jani." },
      },
      choices = {
        { text = "Take what the enemy leaves out. Their loss.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Stealing from woodcutters is beneath a warrior.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The humans must notice.", next = "wood_notice" },
      },
    },
    wood_notice = {
      lines = {
        { id = "wn_default", text = "Dey notice, mon! Dey sing loud while dey work, so I know where dey are, and dey post a lookout who falls asleep after lunch. It be de easiest hunt in de glades." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neza = {
      big = true,
      lines = {
        { id = "ne_default", text = "Heh, Neza say dat 'cause Neza never hit nothin' up close. Arrows be fine for rabbits, but when ya want a thing to know who killed it, ya look it in de eye and stick it." },
      },
      choices = {
        { text = "Up close is the warrior's way.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Neza's right. Kill from far and stay alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Now ya got spears, so now ya learn to stick 'em, mon. Come back when ya ready, and bring dat look in ya eyes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhome = {
      lines = {
        { id = "xh_default", text = "Every day, mon. De Echo Isles got sea and sun and good fish, and dis place got river and fog and cultists, but de Warchief say go east, so Tan'jani go east." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xloggers = {
      big = true,
      lines = {
        { id = "xl_default", text = "No, mon, dey just choppin' wood, and I just takin' it. Nobody get stuck who don't come runnin' at me with an axe, and ya can tell dem dat from Tan'jani." },
      },
      choices = {
        { text = "Leave them be, or I'll stop you myself.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Take the wood, then. Just leave the loggers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear, born on de islands, throwin' spears since before I could walk proper. Dat's all ya need to know, mon." } },
    advice = { { id = "tp_ad", text = "Aim for de middle, mon. De head be a fine target, but de middle be bigger." } },
    brotherhood_horse = { { id = "tp_bh", text = "Humans on horses! A horse be a big target, mon, so dey not as scary as dey think." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, mon. Ask Krom'rosh, he like answerin' questions." } },
  },
}

P:NPC {
  key = "rg_kreza", id = TODO_NPC("Kreza Darkthorn"), name = "Kreza Darkthorn",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "rogmar" }, temper = { "steady" }, values = { "stern" },
  notices = { "kit", "class" },

  impression = {
    first = "Kreza Darkthorn keeps Rog'mar's forge burning and seems to find a puzzle more interesting than any person. A worn key mould from Krol'dok got a warmer welcome at that forge than I did.",
    third = "{name} met Kreza Darkthorn, who keeps the forge at Rog'mar and can make a key from almost anything.",
  },

  greetings = {
    { id = "g_default", text = "Mind the sparks. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. The fire's still hot, so talk." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at that armor. Whatever hit you didn't like you much, so put it on the bench and let me see what's left." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, so you'll be back here every week with dented plate. I'll start heating the iron now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kreza Darkthorn. I keep this forge burning for Rog'mar, so if it's bent, broken or needs a better edge, it comes to me." },
        { id = "h_mould", when = { questActive = TODO_QUEST("Krol'dok Moulding") },
          text = "What's that you've got? A mould for a key, and from the stronghold, by the look of it, so it must be important to somebody." },
        { id = "h_key", when = { questActive = TODO_QUEST("Key Ingredients") },
          text = "Thick leather and iron bars, remember, and as many as I asked for. I'll keep the coals hot until you're back." },
        { id = "h_key_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Key Ingredients"), days = 3 } },
          text = "The key held its shape, and that mould was worse than it looked. Mind you don't lose it in some ogre's cookpot." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. Your people work hide better than anyone, so if you've thick leather to spare, I won't say no." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc who looks after an axe, I hope. I've seen grunts here who'd hand me a blade more rust than steel." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. If you're thinking of warming my forge with a spell, don't; I've had a mage melt a good anvil before." },
        { id = "h_shamcl", when = { class = "SHAMAN" }, text = "A shaman. Fire is the forge's spirit, they say, so ask it to burn even today, and I'll thank you." },
      },
      again = {
        { id = "h_again", text = "What else? The iron's cooling while we talk." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "What can you make from that mould?", next = "mould" },
        { text = "Somebody's making armor for those ogres.", next = "forgemaster" },
        { text = "Working a forge out here can't be easy.", next = "forge" },
        { text = "Will this key really open Krol'dok?", next = "key_after", when = { questDone = TODO_QUEST("Key Ingredients") } },
        { text = "I've worked a forge myself.", next = "xsmith", when = { profession = { name = "Blacksmithing", min = 1 } } },
        { text = "Fire keeps us warm.", next = "END" },
      },
    },
    mould = {
      lines = {
        { id = "mo_default", text = "A key, if the mould holds, though it's crude and worn and was never made with care. Ogres pour metal the way they do everything, which is all at once and too much of it." },
      },
      choices = {
        { text = "What do you need for it?", next = "mould_need" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mould_need = {
      lines = {
        { id = "mn_default", text = "Thick leather for the binding and a good deal of iron, since I'd rather make it twice too strong than snap it in the lock. Bring it to me, and I'll have the coals ready." },
      },
      choices = {
        { text = "We could just break the door.", next = "mould_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mould_break = {
      big = true,
      lines = {
        { id = "mb_default", text = "You could try, and the whole stronghold would hear you knocking. A key lets you in quiet, and quiet is how you come back out again." },
      },
      choices = {
        { text = "Quiet is smart. We'll use the key.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Let them hear us coming. Fear is a weapon too.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgemaster = {
      lines = {
        { id = "fm_default", text = "A Dark Iron dwarf works a forge for the cultists out in the hills, and I've seen his work on dead ogres. It's good, I'll grant him that, and I'd like to see him melted down with it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } } },
    },
    forge = {
      lines = {
        { id = "fo_default", text = "Iron comes in by cart when it comes, so I make do with what the grunts drag back from the field. Half of what's on that rack used to belong to the Hammer, and it fights better for us than it ever did for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    key_after = {
      lines = {
        { id = "ka_default", text = "It'll open the lock the mould was made for, and nothing else. Where that lock is in those caves, you'll have to find out yourself." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsmith = {
      big = true,
      lines = {
        { id = "xs_default", text = "Then you know iron doesn't lie. Make it in a hurry and it breaks in a hurry, and that's true of a lot more than iron." },
      },
      choices = {
        { text = "Good work takes time. No shortcuts.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "In war, fast and good enough wins.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've kept forges burning for the Horde since before Orgrimmar had walls. This one's smaller, and wetter, but it'll do." } },
    advice = { { id = "tp_ad", text = "Oil your blade after every fight in the glades. The damp here eats steel faster than ogres do." } },
    krol_dok = { { id = "tp_kd", text = "Ogre work, all of it, crude but heavy. If you're going in, take a shield, because nothing they make is subtle." } },
    _none = { { id = "tp_none", text = "If I can't hammer it, I don't know it. Ask somebody else." } },
  },
}
