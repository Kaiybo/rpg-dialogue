-- Tanaris, folk no earlier pass reached: Anachronos at the Caverns of Time, Andi Lynn in Gadgetzan, the lost robot
-- OOX-17/TN, Meridith the Mermaiden on Land's End Beach, the naga Zalashji, the turtle Torta, and the Stone Watcher
-- of Norgannon at the Uldum pedestal.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Anachronos: bronze dragon, guardian of the Caverns of Time.
P:NPC {
  key = "tan_anachronos", id = TODO_NPC("Anachronos"), name = "Anachronos", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "grave", "ancient" }, values = { "time", "duty" },
  notices = { "race", "class" },
  impression = {
    first = "Anachronos is a bronze dragon, the heir of Nozdormu, who takes the shape of an old elf at the mouth of the Caverns of Time. He spoke to me as though he already knew how our conversation would end, and was being polite about it.",
    third = "{name} met Anachronos, heir of Nozdormu, at the Caverns of Time.",
  },
  greetings = {
    { id = "g_default", text = "Ah, you have arrived. You are neither early nor late, which is more than most mortals manage." },
    { id = "g_brood", when = { reputation = { faction = "Brood of Nozdormu", min = "friendly" } }, text = "Champion. The sands have spoken of you, and for once they spoke kindly." },
    { id = "yg_0", when = { race = "Gnome" }, text = "A gnome. Your people measure time in gears and springs. Mine measure it in what must not be changed." },
    { id = "yg_1", when = { class = "MAGE" }, text = "A mage. You feel it, do you not, the stillness around these caverns? Do not reach for it." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. I fought beside your people at the Scarab Wall a thousand years ago, and I remember the names of those who fell, even if you do not." },
  },
  start = "hello",
  nodes = {
    y_watch = {
      lines = {
        { id = "y_y_watch", text = "Longer than your kingdoms have stood. I watched Ahn'Qiraj sealed, and then I watched the sand cover the bones of that war. Most of my vigil is spent waiting, and waiting well is a skill your kind rarely learns." },
      },
      choices = {
        { text = "What do you wait for?", next = "y_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_wait = {
      lines = {
        { id = "y_y_wait", text = "For the scarab wall to weaken, as it now does. The qiraji stir behind it, and the silithid crawl further north each season. When the wall fails, someone must be ready. I would prefer that it be you." },
        { id = "y_y_wait_v0", when = { race = "NightElf" }, text = "For the wall to weaken, kaldorei, as it now does. Your ancestors bled to raise it. I would prefer that their children be ready when it falls." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mortal = {
      lines = {
        { id = "y_y_mortal", text = "I have watched mortals for ten thousand years, and you still surprise me. You build cities knowing they will fall, and you love knowing you will lose. My kind sees too far ahead for that kind of courage." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_flight = {
      lines = {
        { id = "y_y_flight", text = "The bronze flight guards the paths of time. Others of my brood stand watch in places you will never see. We seldom speak to one another, for there is little to say that the sands have not already said." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_choose = {
      lines = {
        { id = "y_y_choose", text = "Some of my flight believe we should show mortals what is to come, so you may prepare. Others believe the knowledge would break you. I have my answer. What is yours?" },
      },
      choices = {
        { text = "Some things must stay hidden. Keep your silence.", next = "BACK", reply = "That is the burden of my flight. I am glad you understand it.", fx = { align = { order = 1 } } },
        { text = "Tell us. We deserve to face what comes.", next = "BACK", reply = "Bold. Perhaps you do. But deserving is not the same as surviving.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      big = true,
      lines = { { id = "h_default", text = "I am Anachronos, and I watch over these caverns for the Timeless One. Time is a river, mortal, and my brood stands on its banks to keep it from flooding." } },
      again = { { id = "h_again", text = "Ask, then. I have all the time there is, which is not the same as having patience." } },
      choices = {
        { text = "What lies in the Caverns of Time?", next = "caverns" },
        { text = "You fought at the Scarab Wall?", next = "wall" },
        { text = "Where is Nozdormu?", next = "nozdormu" },
        { text = "The scepter. What must I do?", next = "scepter", when = { questActive = TODO_QUEST("The Scepter of the Shifting Sands") } },
        { text = "How long have you kept watch?", next = "y_watch" },
        { text = "What do you think of mortals?", next = "y_mortal" },
        { text = "Tell me about the bronze flight.", next = "y_flight" },
        { text = "Should mortals be told what is to come?", next = "y_choose" },
        { text = "I study the arcane. Can time be bent?", next = "BACK", when = { class = "MAGE" }, reply = "It can, and that is precisely why my flight exists. Study fire, mage, and leave the river alone." },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    caverns = {
      lines = { { id = "c_default", text = "All that was and all that may be, held in stillness. Mortals are not meant to walk there yet, and I would be grateful if you did not try." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wall = {
      lines = { { id = "w_default", text = "A thousand years ago the qiraji poured out of Ahn'Qiraj, and the kaldorei could not stop them alone. My flight and the red, the blue and the green came to their aid, and together we raised the Scarab Wall and sealed the insects behind it." } },
      choices = {
        { text = "And Fandral Staghelm?", next = "fandral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fandral = {
      lines = { { id = "f_default", text = "He lost his son Valstann to the qiraji, and in his grief he shattered the scepter that sealed the wall. A father's sorrow is a terrible thing, and the cost of it may yet fall on all of you." } },
      choices = {
        { text = "He had every right to grieve.", next = "BACK", reply = "To grieve, yes. To break the key to the world's prison, perhaps not.", fx = { align = { order = -1 } } },
        { text = "His duty should have come first.", next = "BACK", reply = "Spoken like one who has not yet buried a child. I hope you never learn otherwise.", fx = { align = { order = 1 } } },
      },
    },
    nozdormu = {
      lines = { { id = "n_default", text = "Everywhere and nowhere, in every moment at once. The Timeless One sees what I cannot, and I serve him by not asking what that is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scepter = {
      lines = { { id = "s_default", text = "Gather its pieces from the dragons who keep them, and reforge it, and bring it to the Scarab Gong. Know that when the gates open, the qiraji will not be the only thing that wakes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ahnqiraj = { { id = "tp_yahnqiraj", text = "Behind the Scarab Wall the qiraji wait. I sealed them in once. I would rather not have to do it again." } },
    caverns_of_time = { { id = "tp_ycaverns_of_time", text = "The caverns are my charge. They are closed, and they will remain so while I stand here." } },
    bronze_dragonflight = { { id = "tp_bronze", text = "We keep time's path true, which means we watch more than we act. It is harder than it sounds." } },
    _none = { { id = "tp_none", text = "That thread is not mine to pull, mortal." } },
  },
}

-- Andi Lynn: Gadgetzan quest giver, The Dunemaul Compound.
P:NPC {
  key = "tan_andi_lynn", id = TODO_NPC("Andi Lynn"), name = "Andi Lynn", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brisk", "angry" }, values = { "justice" },
  notices = { "race" },
  impression = {
    first = "Andi Lynn is a gnome in Gadgetzan with a grudge against the Dunemaul ogres, and she keeps a tally of what they have cost the town on a scrap of paper she will show anyone.",
    third = "{name} met Andi Lynn, a gnome in Gadgetzan with a grudge against the Dunemaul ogres.",
  },
  greetings = {
    { id = "g_default", text = "You look like someone who can swing something heavy, and I have just the place for you to swing it. Have you heard of the Dunemaul?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The Dunemaul Compound") }, text = "You took the fight to the Dunemaul, and the road's been quieter for it. I crossed three lines off my tally!" },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A dwarf! Good, you've got the shoulders for ogre work. Gnomes have the brains, dwarves have the shoulders." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Then you know what it is to lose a home to brutes, and you'll understand why I'm so cross." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I came to Gadgetzan after Gnomeregan fell, with my cousin and a wagon of spare parts. We ran gear caravans to the ports for two years. Then the Dunemaul got bigger and bolder, and my cousin's wagon didn't come back." },
      },
      choices = {
        { text = "Your cousin is one of the missing?", next = "y_cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_cousin = {
      lines = {
        { id = "y_y_cousin", text = "Fizzlecog Lynn, the best caravan driver in Tanaris, and the worst singer. Those goggles on Gor'marok's belt are his. I keep telling myself an ogre might take a prisoner for ransom. Ogres can't spell ransom, but they might." },
        { id = "y_y_cousin_v0", when = { race = "Gnome" }, text = "Fizzlecog Lynn, best driver in Tanaris and worst singer. You know how gnome families are, all cousins and opinions. I'll find him, or I'll find what's left." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ogres = {
      lines = {
        { id = "y_y_ogres", text = "Dunemaul ogres are cleverer than the ones in Feralas, which is a terrifying sentence to say out loud. They watch the caravan schedules, and they wait for the ones without guards. Somebody is selling them our timetables, and I want to know who." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_traitor = {
      lines = {
        { id = "y_y_traitor", text = "If I find the goblin who's selling caravan times to the Dunemaul, the Bruisers will want him for themselves. I'd rather deal with him myself. Should I?" },
      },
      choices = {
        { text = "Hand him to the Bruisers. Let the law decide.", next = "BACK", reply = "Fine, fine. The law. It's slower, but I suppose it's fairer.", fx = { align = { order = 1 } } },
        { text = "Deal with him yourself. He owes you blood.", next = "BACK", reply = "Oh, I'd like that. I'd really like that. Don't tell the Bruisers I said so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "The Dunemaul ogres hold a compound south of here, and they raid every caravan that passes close enough to smell. I've lost cargo, friends and nearly my eyebrows to them." } },
      again = { { id = "h_again", text = "Anything else? My tally's waiting." } },
      choices = {
        { text = "What do you want done?", next = "job" },
        { text = "Show me your tally.", next = "tally" },
        { text = "Why not leave it to the Bruisers?", next = "bruisers" },
        { text = "How do you find Gadgetzan?", next = "gadgetzan" },
        { text = "Gnomeregan taught us plenty about brutes too.", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "How did you end up in Gadgetzan?", next = "y_hist" },
        { text = "Why are these ogres so bold?", next = "y_ogres" },
        { text = "What will you do with whoever sold you out?", next = "y_traitor" },
        { text = "I'm a warrior. Ogres don't scare me.", next = "BACK", when = { class = "WARRIOR" }, reply = "Good! They scare me plenty, so between us we've got the right amount of fear." },
        { text = "Good luck with the ogres.", next = "END" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "Go to the compound and thin them out, and bring down their leader, Gor'marok the Ravager, if you can reach him. Ogres follow strength, so take theirs away and the rest may scatter." } },
      choices = {
        { text = "Gor'marok?", next = "gormarok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gormarok = {
      lines = { { id = "gormarok_default", text = "Big, even for an ogre, and he wears his victims' gear like trophies. I've seen my cousin's goggles on his belt, and I want them back." } },
      choices = {
        { text = "I'll bring the goggles back.", next = "BACK", when = { questBefore = TODO_QUEST("The Dunemaul Compound") }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally = {
      lines = { { id = "t_default", text = "Four caravans, eleven crates of gears, one prized goggles and two good friends. The friends I count separately, in red ink, because I'm not ready to cross them out." } },
      choices = {
        { text = "Your friends might still be alive.", next = "friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bruisers = {
      lines = { { id = "b_default", text = "The Bruisers guard the town, not the road, and they say the ogres are outside their contract. I say that's a fine way of saying they're scared." } },
      choices = {
        { text = "They're right to keep the walls.", next = "BACK", reply = "Hmph. Perhaps. But walls don't bring back cargo.", fx = { align = { order = 1 } } },
        { text = "Contracts won't stop the ogres. Fighting will.", next = "BACK", reply = "Exactly what I've been saying!", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    friends = {
      narr = "She runs a fingertip down the red ink without looking at it.",
      lines = { { id = "fr_default", text = "That's what the red ink is for, you see, because red can still be scratched out and written over. Ogres take prisoners when they're feeling clever, which isn't often, but I've built my hopes on smaller odds." } },
      choices = {
        { text = "Then hope. I'll look for them in the compound.", next = "BACK", reply = "You will? Oh, thank you, I'll keep the ink wet.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to grieve now than hope for nothing.", next = "BACK", reply = "Maybe, but I'm a gnome, and gnomes don't do things in the sensible order.", fx = { align = { light = -1 } } },
      },
    },
    gadgetzan = {
      lines = { { id = "ga_default", text = "Hot, loud and full of goblins who'd sell you your own shadow, but the workshops are good and nobody minds a small explosion. It's the nearest thing to Tinker Town I've found in Kalimdor." } },
      choices = {
        { text = "Do the goblins treat you fairly?", next = "goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "go_default", text = "Fairly by goblin standards, which means they cheat everyone equally and they're honest about it. I'll take that over an ogre's club any day of the week." } },
      choices = { { text = "A low bar, but fair. Something else.", next = "BACK" } },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "It did, didn't it, and we didn't even get to choose our brutes, they just came up from below with Thermaplugg's blessing. At least the Dunemaul are honest about wanting to smash things, which I suppose is something." } },
      choices = { { text = "Small mercies. Something else.", next = "BACK" } },
    },
  },
  topics = {
    dunemaul = { { id = "tp_ydunemaul", text = "The Dunemaul compound is south of town. Big ogres, bigger clubs, and a tally that keeps growing." } },
    fizzlecog = { { id = "tp_yfizzlecog", text = "My cousin. Lost on the road. I'll find him." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about ogres." } },
  },
}

-- Homing Robot OOX-17/TN.
P:NPC {
  key = "tan_oox17", id = TODO_NPC("Homing Robot OOX-17/TN"), name = "Homing Robot OOX-17/TN", gender = "male",
  role = "questgiver", tier = "service",
  communities = {}, temper = { "odd" }, values = { "duty" },
  notices = {},
  impression = {
    first = "OOX-17/TN is one of Oglethorpe Obnoticus's mechanical chickens, half buried in sand in the hills east of the Gaping Chasm and complaining about it in a flat metal voice.",
    third = "{name} found the Homing Robot OOX-17/TN in Tanaris.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Bzzt. Recognized: friendly unit. Morale subroutine engaged. Happy to see you, friend." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Bzzt. Recognized: unit of uncertain reliability. Proceeding with caution protocol." },
    { id = "g_default", text = "Bzzt. Distress mode active. Sand detected in all joints. Please notify Oglethorpe Obnoticus of Booty Bay." },
    { id = "yg_0", when = { race = "Goblin" }, text = "Bzzt. Goblin detected. Please do not attempt to sell this unit's components. They are not for sale. Please." },
  },
  start = "hello",
  nodes = {
    y_crash = {
      lines = {
        { id = "y_y_crash", text = "Bzzt. Crash log recovered. This unit was carrying cargo over the Tanaris desert when a sandstorm reduced visibility to zero. This unit made an unscheduled landing. The landing was unscheduled because it was a crash." },
      },
      choices = {
        { text = "What was the cargo?", next = "y_cargo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_cargo = {
      lines = {
        { id = "y_y_cargo", text = "Cargo classified. This unit is authorised to say only that Oglethorpe Obnoticus will be very pleased if it arrives, and very cross if it does not. This unit prefers that he be pleased." },
        { id = "y_y_cargo_v0", when = { race = "Gnome" }, text = "Cargo classified. Gnomish engineer, you will understand that some prototypes are proprietary. Oglethorpe will be very cross if it is lost." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_afraid = {
      lines = {
        { id = "y_y_afraid", text = "Bzzt. Query unclear. This unit does not possess fear. This unit does possess a self-preservation subroutine that has been active continuously for six days. It feels similar to what organics describe." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_trust = {
      lines = {
        { id = "y_y_trust", text = "Bzzt. This unit's protocols require trusting any escort. Previous escorts include a goblin who tried to sell this unit's legs. Should this unit continue to trust organics?" },
      },
      choices = {
        { text = "Yes. Most of us mean well.", next = "BACK", reply = "Bzzt. Trust protocol reaffirmed. Thank you, organic.", fx = { align = { light = 1 } } },
        { text = "No. Trust no one but yourself.", next = "BACK", reply = "Bzzt. Trust protocol suspended. This unit will watch you carefully.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Homing Robot OOX-17/TN reporting. This unit crashed in the desert and is surrounded by wastewander bandits, which is statistically unfortunate." } },
      again = { { id = "h_again", text = "Bzzt. Awaiting instructions." } },
      choices = {
        { text = "Can you get home?", next = "home" },
        { text = "What's wrong with you?", next = "wrong" },
        { text = "Who is Oglethorpe Obnoticus?", next = "xogle" },
        { text = "What were you designed to do?", next = "xdesign" },
        { text = "Your paint is blistered from the sun.", next = "xpaint" },
        { text = "I'm a gnome engineer. Let me look at you.", next = "xgnome", when = { race = "Gnome" } },
        { text = "How did you crash?", next = "y_crash" },
        { text = "Are you afraid?", next = "y_afraid" },
        { text = "Do you trust your escorts?", next = "y_trust" },
        { text = "Your wiring looks loose.", next = "BACK", when = { class = "WARRIOR" }, reply = "Bzzt. Please do not hit this unit to fix it. That is a common misconception among warriors." },
        { text = "Good luck, chicken.", next = "END" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Affirmative, if escorted to Steamwheedle Port. The bandits will attempt to disassemble this unit on the way, so please be vigilant and also fast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "w_default", text = "Flight system failure, sand ingress and mild embarrassment. Oglethorpe Obnoticus did not program the embarrassment, so this unit suspects it is the sand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xogle = {
      lines = { { id = "xxogle_d", text = "Bzzt. Oglethorpe Obnoticus is this unit's creator and a master gnomish engineer residing in Booty Bay. He builds homing robots and dislikes it when they fail to home, which is the current situation." } },
      choices = {
        { text = "Does he build many of you?", next = "xmany" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmany = {
      lines = { { id = "xxmany_d", text = "Affirmative. There are at least three OOX units in active distress across Kalimdor and the Eastern Kingdoms. This unit considers the failure rate statistically embarrassing for Mister Obnoticus." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdesign = {
      lines = { { id = "xxdesign_d", text = "Bzzt. Primary function, homing flight back to Booty Bay with valuable cargo. Secondary function, broadcasting distress. This unit is currently excelling at its secondary function." } },
      choices = {
        { text = "Is a robot that fails still worth saving?", next = "xworth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xworth = {
      lines = { { id = "xxworth_d", text = "Query is philosophical. This unit computes two acceptable answers and lacks the authority to choose between them." } },
      choices = {
        { text = "Yes. Everything that serves deserves rescue, even a machine.", next = "BACK", reply = "Bzzt. Gratitude subroutine activated. This unit will remember that response.", fx = { align = { light = 1 } } },
        { text = "No. A broken tool is just scrap.", next = "BACK", reply = "Bzzt. Logical but discouraging. This unit hopes you will escort it anyway.", fx = { align = { light = -1 } } },
      },
    },
    xpaint = {
      narr = "A small flap on its chest pops open, vents a puff of hot air and clanks shut again.",
      lines = { { id = "xxpaint_d", text = "Confirmed. Ambient temperature exceeds design tolerance by forty-two percent. This unit's paint warranty expired in the first hour of exposure." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = { { id = "xxgnome_d", text = "Bzzt. Gnomish engineer detected. Please do not open the casing without proper tools, as the last unit that was opened in the field is still missing its left leg." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    oglethorpe = { { id = "tp_yoglethorpe", text = "Oglethorpe Obnoticus. Creator. Master engineer. Occasionally forgets to feed his chickens." } },
    gadgetzan = { { id = "tp_ygadgetzan", text = "Gadgetzan. Goblin town. This unit's previous escort came from there." } },
    booty_bay = { { id = "tp_xbooty_bay", text = "Bzzt. Booty Bay is home. Home is where the charging station is." } },
    wastewander = { { id = "tp_xwastewander", text = "Bandits. Statistically hostile. Please avoid." } },
    _none = { { id = "tp_none", text = "Bzzt. Query not found. Please shake the sand out and try again." } } },
}

-- Meridith the Mermaiden: a lovesick naga off Land's End Beach.
P:NPC {
  key = "tan_meridith", id = TODO_NPC("Meridith the Mermaiden"), name = "Meridith the Mermaiden", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "tanaris_coast" }, temper = { "dreamy" }, values = { "love" },
  notices = { "race" },
  impression = {
    first = "Meridith is a naga who lives in the surf off Land's End Beach, and she is in love with Narain Soothfancy, who crashed a flying machine into her bay once and has never been the same. She sighs a great deal.",
    third = "{name} met Meridith the Mermaiden, a lovesick naga off the coast of Tanaris.",
  },
  greetings = {
    { id = "g_default", text = "Oh! A visitor from the land. Did he send you? Please say he sent you." },
    { id = "g_song", when = { questDone = TODO_QUEST("Love Song for Narain") }, text = "Did he like the song? Don't tell me if he didn't. I'll sing another one anyway." },
    { id = "yg_0", when = { race = "NightElf" }, text = "An elf! My mother used to tell stories of elves. She said we were cousins, once, before the sea. I like that idea." },
  },
  start = "hello",
  nodes = {
    y_song = {
      lines = {
        { id = "y_y_song", text = "Would you like to hear it? It goes, 'Oh Narain, oh Narain, you fell from the sky like a beautiful rain.' I'm still working on the second verse. Nothing rhymes with Soothfancy." },
      },
      choices = {
        { text = "It's lovely, Meridith.", next = "y_lovely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lovely = {
      lines = {
        { id = "y_y_lovely", text = "You're kind. My sisters say it's dreadful, but my sisters sing about drowning sailors, which is in very poor taste. A love song is always better, even a bad one." },
        { id = "y_y_lovely_v0", when = { race = "Gnome" }, text = "You're kind, little gnome. Does Narain sing? I imagine him singing very badly, all elbows and enthusiasm. I'd love it anyway." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fear = {
      lines = {
        { id = "y_y_fear", text = "Sometimes I worry that my kin will find out about Narain and come for him. The other naga don't like land-walkers, and they especially don't like the ones who make me happy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Should I tell Narain everything, the truth about what I am and what my kin do? Or let him go on thinking I'm a mermaid who sings?" },
      },
      choices = {
        { text = "Tell him the truth. Love needs honesty.", next = "BACK", reply = "You're right. I'll find the words. They won't rhyme, but I'll find them.", fx = { align = { order = 1 } } },
        { text = "Let him keep the dream. It's kinder.", next = "BACK", reply = "Perhaps. A dream is a lovely thing to give someone. I'll keep singing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Meridith, and my heart belongs to Narain, the seer of the dunes. He fell out of the sky into my bay one day, and he was the most beautiful thing I had ever seen." } },
      again = { { id = "h_again", text = "Is there more? Tell me about him again." } },
      choices = {
        { text = "Narain? Soothfancy?", next = "narain" },
        { text = "A naga and a gnome?", next = "odd" },
        { text = "Can I take him a message?", next = "message", when = { questActive = TODO_QUEST("Love Song for Narain") } },
        { text = "Where do you live, Meridith?", next = "bay" },
        { text = "Narain's a gnome, like me. He's quite a catch.", next = "gnome", when = { race = "Gnome" } },
        { text = "Sing me your song.", next = "y_song" },
        { text = "Do you ever worry about him?", next = "y_fear" },
        { text = "Does Narain know what you are?", next = "y_secret" },
        { text = "Do you remember being an elf?", next = "BACK", when = { race = "NightElf" }, reply = "Me? No, I was born like this. But my grandmother remembered, she said, though she always cried when she tried." },
        { text = "I'll leave you to the sea.", next = "END" },
      },
    },
    narain = {
      lines = { { id = "n_default", text = "He crashed his gnomish machine into my waters and I pulled him out. He babbled about the future and the stars and his owl, and I knew at once." } },
      choices = {
        { text = "Does he love you back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "He would, if only he remembered me. He hit his head quite hard, you see, so I sing to him from the shore and hope the words find their way." } },
      choices = {
        { text = "Love finds a way. Keep singing.", next = "BACK", reply = "I will! You are very kind, for a land-walker.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let him go. It's kinder.", next = "BACK", reply = "Never. The sea never lets go of anything.", fx = { align = { light = -1 } } },
      },
    },
    odd = {
      lines = { { id = "o_default", text = "Love does not care what shape you are. My sisters laugh at me, but my sisters have never been rescued by a gnome who smelled of oil and dreams." } },
      choices = {
        { text = "What do your sisters say about him?", next = "sisters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message = {
      lines = { { id = "m_default", text = "Take him my song, and sing it to him, even if you sing badly. He will understand the words, even if the tune is lost." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sisters = {
      lines = { { id = "si_default", text = "That he is small and dry and talks to an owl, which is all true, and that I should find someone with fins. They don't understand that I've had fins all my life, and I'm quite tired of them." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    bay = {
      lines = { { id = "ba_default", text = "In the warm water off the coast, where the sand is soft and the land-walkers' boats rarely come. From there I can see the dunes where Narain lives, if I swim up very high and squint." } },
      choices = {
        { text = "Isn't it lonely out there?", next = "lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      narr = "She trails her fingers through the water and watches the ripples go.",
      lines = { { id = "lo_default", text = "Only when the tide is low and the gulls are quiet, and then I sing until it's better. Songs are how the sea remembers things, and I want it to remember him." } },
      choices = { { text = "It will. Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "He is, isn't he? You must know, then, how clever your people are and how lovely their little hands are with tools. Tell him a gnome agrees with me, and perhaps he'll listen." } },
      choices = { { text = "I'll put in a word. Something else.", next = "BACK" } },
    },
  },
  topics = {
    narain = { { id = "tp_ynarain", text = "Narain Soothfancy, the seer of the dunes. My heart's own gnome." } },
    naga = { { id = "tp_ynaga", text = "My kin are angry about the old days. I'm not. I'm too busy being in love." } },
    _none = { { id = "tp_none", text = "I know only the sea and my heart. Ask Narain, he knows everything." } },
  },
}

-- Zalashji: a solitary, peaceable naga.
P:NPC {
  key = "tan_zalashji", id = TODO_NPC("Zalashji"), name = "Zalashji", gender = "male",
  role = "citizen", tier = "service",
  communities = { "tanaris_coast" }, temper = { "wistful" }, values = { "solitude" },
  notices = {},
  impression = {
    first = "Zalashji is a lone naga who lives in a den on the Tanaris coast and comes out to stare at the sea. He is not hostile, which surprised me more than I would like to admit.",
    third = "{name} met Zalashji, a solitary naga on the Tanaris coast.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You return, land-dweller, and I find I am glad of it. Few stay to speak with me as you have." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You need not draw your weapon, land-dweller. I would rather you simply went your way." },
    { id = "g_default", text = "You need not draw your weapon, land-dweller. I have no quarrel with you, and no one else to quarrel with." },
    { id = "yg_0", when = { class = "PRIEST" }, text = "A priest. Do you pray to the moon, like the elves? My grandmother did, once, she told me. I do not know who I pray to." },
  },
  start = "hello",
  nodes = {
    y_den = {
      lines = {
        { id = "y_y_den", text = "This den was empty when I found it, except for crabs and the bones of a sailor. I buried the sailor and let the crabs stay. They are poor company, but they do not ask me why I left." },
      },
      choices = {
        { text = "Who was the sailor?", next = "y_sailor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_sailor = {
      lines = {
        { id = "y_y_sailor", text = "I do not know. He wore a goblin's coat, and there was a ring on his finger. I kept the ring. Sometimes I wonder who waits for him, the way I once waited for my kin." },
        { id = "y_y_sailor_v0", when = { race = "Goblin" }, text = "I do not know. He wore a coat like yours, land-dweller, and a ring. I kept the ring. Perhaps you know whose it was." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_kin = {
      lines = {
        { id = "y_y_kin", text = "My kin are gathering, I think. I hear them in the water at night, singing the old songs louder than they used to. Something has woken their anger. I fear for the land-dwellers on this coast, and I cannot warn them without being hunted myself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_warn = {
      lines = {
        { id = "y_y_warn", text = "If I warned the goblins of Gadgetzan that my kin are stirring, they would thank me, perhaps, and then hunt me. Should I warn them anyway?" },
      },
      choices = {
        { text = "Warn them. Lives are worth the risk.", next = "BACK", reply = "Then I will try. Perhaps a message, left on the shore. Thank you.", fx = { align = { light = 1 } } },
        { text = "Stay hidden. Protect yourself first.", next = "BACK", reply = "Yes. I have survived by hiding. I will hide a little longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Zalashji. I left the others of my kind and found this den, and I watch the water every day, though I no longer know what I am waiting for." } },
      again = { { id = "h_again", text = "You are still here. Speak, if you wish." } },
      choices = {
        { text = "Why did you leave the others?", next = "leave" },
        { text = "What do you watch for?", next = "watch" },
        { text = "What is it like to be naga?", next = "xnaga" },
        { text = "Do you miss the sea?", next = "xsea" },
        { text = "You speak gently for a naga.", next = "xgentle" },
        { text = "I'm a night elf. Do you remember Azshara?", next = "xelf", when = { race = "NightElf" } },
        { text = "Tell me about your den.", next = "y_den" },
        { text = "What of your kin now?", next = "y_kin" },
        { text = "Should you warn the land-dwellers?", next = "y_warn" },
        { text = "Elune still remembers your kind.", next = "BACK", when = { race = "NightElf" }, reply = "Does she? Then she remembers more than I do. I would like to think it is true." },
        { text = "Farewell, naga.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "They are full of anger, about what was lost under the sea and who took it. I grew tired of anger, so I swam until I found a quiet beach." } },
      choices = {
        { text = "Peace was the right choice.", next = "BACK", reply = "Perhaps. It is lonely, but it is mine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You abandoned your people.", next = "BACK", reply = "They abandoned something first. I only followed.", fx = { align = { honor = -1 } } },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "The tide, the gulls, the ships of the goblins. Once I watched for my kin to come and fetch me, but they never did, and now I watch only the tide." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnaga = {
      lines = { { id = "xxnaga_d", text = "It is to be changed and not to choose it. My ancestors were elves, once, before the Well's fall, and the sea took them and made them into this. I remember the shape of my grandmother's face, though she was cursed before I was born." } },
      choices = {
        { text = "How do you remember, then?", next = "xrem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrem = {
      lines = { { id = "xxrem_d", text = "Through songs, through the stories we tell in the deep. Many naga remember with anger, and some remember with grief." } },
      choices = {
        { text = "Grief is more honest than anger.", next = "BACK", reply = "Perhaps. It is the path I have chosen, at least.", fx = { align = { honor = 1 } } },
        { text = "Your people have every right to their anger.", next = "BACK", reply = "That is what they would say. It is why I left.", fx = { align = { honor = -1 } } },
      },
    },
    xsea = {
      lines = { { id = "xxsea_d", text = "Every day, but the sea has others of my kind in it, and I do not wish to be with them. Here I have shallow water and silence, and that is enough for one who has seen too much." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgentle = {
      narr = "He coils a little tighter in the shallows, and the water around him barely ripples.",
      lines = { { id = "xxgentle_d", text = "Gentleness is a choice, land-dweller, like cruelty. Most of my kind choose cruelty because it was chosen for them. I chose differently, and they did not forgive me." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xelf = {
      lines = { { id = "xxelf_d", text = "Not her face, only her name, spoken with love and dread in the same breath. Your people and mine were one, once. Perhaps that is why I do not attack you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_ygadgetzan", text = "The goblins' town. I see their lights at night, far off. I do not go closer." } },
    sea = { { id = "tp_ysea", text = "The sea is full of my kin. That is why I stay in the shallows." } },
    azshara = { { id = "tp_xazshara", text = "A name spoken with love and dread. I do not speak it often." } },
    naga = { { id = "tp_xnaga", text = "My kind are bitter. I am not, or I try not to be." } },
    _none = { { id = "tp_none", text = "I do not know, land-dweller. The sea does not tell me such things." } } },
}

-- Torta: Tooga's mate, a turtle.
P:NPC {
  key = "tan_torta", id = TODO_NPC("Torta"), name = "Torta", gender = "female",
  role = "citizen", tier = "service",
  communities = {}, temper = { "cross", "fond" }, values = { "family" },
  notices = {},
  impression = {
    first = "Torta is a talking turtle, the mate of the wandering Tooga, and she has been waiting for him for longer than she cares to say. She speaks slowly and pointedly.",
    third = "{name} met Torta, the turtle waiting for Tooga.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "<Torta looks at you, and then blinks slowly. It may be the warmest thing a turtle can do.> You are not Tooga, but you are acceptable." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "<Torta looks at you, and then pointedly away from you.> You are not Tooga. You are not anybody." },
    { id = "g_default", text = "<Torta looks at you, and then past you, and then back at you.> You are not Tooga." },
    { id = "g_done", when = { questDone = TODO_QUEST("Tooga's Quest") }, text = "Tooga is home, thanks to you. Torta is very cross with Tooga, and very glad." },
    { id = "yg_0", when = { race = "Tauren" }, text = "<Torta looks up at you for a very long time.> You are big, like a turtle. But not as slow. Torta forgives you." },
  },
  start = "hello",
  nodes = {
    y_young = {
      lines = {
        { id = "y_y_young", text = "When Torta was young, the desert was smaller, and there was more water. Tooga and Torta swam in the pools near the old troll city, before the trolls got angry. Now the pools are dry, and the trolls are still angry." },
      },
      choices = {
        { text = "Do you miss the pools?", next = "y_pools" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_pools = {
      lines = {
        { id = "y_y_pools", text = "Torta misses the water. Torta does not miss the trolls. The trolls tried to eat Tooga once, and Torta bit one on the toe. He hopped a long way. Torta still remembers it fondly." },
        { id = "y_y_pools_v0", when = { race = "Troll" }, text = "Torta misses the water. Torta does not miss the trolls. No offence. Torta bit one on the toe, once. He hopped a long way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_sea = {
      lines = {
        { id = "y_y_sea", text = "Tooga wants to go to the sea, someday. Torta says the sea is too big and too wet. Tooga says that is the point. Torta does not understand Tooga, but Torta will go, if Tooga goes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tooga = {
      lines = {
        { id = "y_y_tooga", text = "When Tooga comes home, Torta will be very cross. Should Torta be very cross, or only a little cross?" },
      },
      choices = {
        { text = "Very cross. He should know he scared you.", next = "BACK", reply = "Yes. Torta will be very cross. Tooga will learn. Slowly.", fx = { align = { order = 1 } } },
        { text = "Only a little. Be glad he's back.", next = "BACK", reply = "Hm. Torta will try. But Torta is very good at cross.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Torta is waiting for Tooga, who went for a walk and did not come back. Turtles are patient, but Torta's patience is getting very thin." },
        { id = "h_done", when = { questDone = TODO_QUEST("Tooga's Quest") }, text = "Tooga says the desert was very big and very hot, and Torta says that is what happens when you wander off. We will be arguing about it for a hundred years." },
      },
      again = { { id = "h_again", text = "Torta is listening, slowly." } },
      choices = {
        { text = "Where did Tooga go?", next = "where" },
        { text = "How long have you waited?", next = "long" },
        { text = "How long have you and Tooga been together?", next = "xlong2" },
        { text = "What do turtles eat in the desert?", next = "xeat" },
        { text = "You seem very patient.", next = "xpatient" },
        { text = "I'm a druid. I understand turtles a little.", next = "xdruid", when = { class = "DRUID" } },
        { text = "What was the desert like when you were young?", next = "y_young" },
        { text = "Do you ever want to see the sea?", next = "y_sea" },
        { text = "What will you do when Tooga comes home?", next = "y_tooga" },
        { text = "I can talk to animals a little.", next = "BACK", when = { class = "HUNTER" }, reply = "Then you know Torta is not an animal. Torta is a turtle. There is a difference." },
        { text = "I'll look out for him.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Out into the sand, looking at things. Tooga always looks at things, and then Tooga forgets which way home is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "A long time, even for a turtle, which is a very long time. Torta is not worried, of course. Torta is only checking the horizon very often." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlong2 = {
      lines = { { id = "xxlong2_d", text = "Two hundred years, maybe more. Torta stopped counting when Tooga forgot her name day for the third time in a row." } },
      choices = {
        { text = "That's a long time to be married.", next = "xmarried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmarried = {
      lines = { { id = "xxmarried_d", text = "Torta does not know what married is, but Tooga is Torta's, and Torta is Tooga's. Some say mates should always stay close, and some say mates should go on walks alone sometimes." } },
      choices = {
        { text = "Mates should stay close. Tooga should not have wandered.", next = "BACK", reply = "Yes! Torta will tell Tooga a stranger agrees with Torta.", fx = { align = { order = 1 } } },
        { text = "Let Tooga wander. Everyone needs a little freedom.", next = "BACK", reply = "Hmph. You sound like Tooga. Torta is not pleased.", fx = { align = { order = -1 } } },
      },
    },
    xeat = {
      lines = { { id = "xxeat_d", text = "Cactus, when it is soft, and beetles, when they are slow. Torta is very good at slow beetles, though not as good as Tooga, who is better at everything except coming home." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpatient = {
      narr = "She blinks once, very slowly, which may be the turtle equivalent of a sigh.",
      lines = { { id = "xxpatient_d", text = "Turtles are patient, little one, but Torta is tired of being patient. Patience is for waiting; Torta would like a turn at something else." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = { { id = "xxdruid_d", text = "Then you know how it is. The shell is heavy, the desert is hot and Tooga is foolish. Torta is glad someone understands." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    zul_farrak = { { id = "tp_yzul_farrak", text = "The troll city. Torta bit a troll there, once." } },
    sea = { { id = "tp_ysea", text = "Big and wet. Tooga wants to go. Torta is not sure." } },
    tooga = { { id = "tp_xtooga", text = "Torta's mate. Lost, then found. Foolish, always." } },
    tanaris = { { id = "tp_xtanaris", text = "Very big. Very hot. Tooga liked it, and Torta does not." } },
    _none = { { id = "tp_none", text = "Torta does not know. Torta is a turtle." } } },
}

-- Stone Watcher of Norgannon: titan projection at the Uldum pedestal.
P:NPC {
  key = "tan_stone_watcher", id = TODO_NPC("Stone Watcher of Norgannon"), name = "Stone Watcher of Norgannon", gender = "male",
  role = "scholar", tier = "service",
  communities = {}, temper = { "ancient" }, values = { "knowledge" },
  notices = { "race" },
  impression = {
    first = "The Stone Watcher of Norgannon is a projection that appears above the pedestal in the Valley of the Watchers, a titan record speaking to whoever has the right discs. It looked through me as though I were a footnote.",
    third = "{name} spoke with the Stone Watcher of Norgannon at the Uldum pedestal.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Discs accepted. Greetings, creature. Your record shows constructive interaction. Additional data may be shared." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Discs accepted. Greetings, creature. Your record shows irregularities. State your query precisely." },
    { id = "g_default", text = "Discs accepted. Greetings, creature. You have activated a record of the Keepers. State your inquiry." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Earthen-derived. Your lineage is recorded. Your ancestors were made of stone, and their descendants have become flesh." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "This record was placed by Norgannon, keeper of lore. It speaks of the titans, of the shaping of this world and of those who were made to guard it." } },
      again = { { id = "h_again", text = "Further inquiry permitted." } },
      choices = {
        { text = "Who were the titans?", next = "titans" },
        { text = "What is behind these gates?", next = "gates" },
        { text = "Who was Norgannon?", next = "xnorg" },
        { text = "Why was this record left?", next = "xwhy" },
        { text = "Are you alive?", next = "xalive" },
        { text = "I'm a mage. What do the Keepers say of magic?", next = "xmage", when = { class = "MAGE" } },
        { text = "End the record.", next = "END" },
      },
    },
    titans = {
      lines = { { id = "t_default", text = "Makers of order, who shaped worlds and set guardians upon them. They are gone from this world now, and their works sleep." } },
      choices = {
        { text = "Who did they make?", next = "made" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made = {
      lines = { { id = "m_default", text = "The earthen, shaped from stone, and the watchers who guard the titans' vaults, and others whose names this record does not hold. Some changed, as all things change, and that too was recorded." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gates = {
      lines = { { id = "gates_default", text = "Uldum. Access is restricted. This record is not authorized to open the gates, only to speak of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnorg = {
      lines = { { id = "xxnorg_d", text = "Norgannon was a keeper of lore among the titans, tasked with recording the shaping of worlds. This record is one of many he left, so that those who came after might remember." } },
      choices = {
        { text = "Remember what?", next = "xremember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xremember = {
      lines = { { id = "xxremember_d", text = "The order of creation. The making of the earthen and the guardians of the vaults. The sealing of what lies beneath. Further data restricted." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = { { id = "xxwhy_d", text = "To preserve knowledge against the passing of ages. Records decay, creations forget and even stone wears away under the wind of ages." } },
      choices = {
        { text = "Should such knowledge be shared?", next = "xshare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshare = {
      lines = { { id = "xxshare_d", text = "Query outside parameters. This construct may relay your judgment to the Keepers." } },
      choices = {
        { text = "Yes. Knowledge of creation belongs to all who seek it.", next = "BACK", reply = "Judgment recorded. Access level unchanged. Further inquiry permitted.", fx = { align = { order = -1 } } },
        { text = "No. Some truths should stay guarded.", next = "BACK", reply = "Judgment recorded. This aligns with Keeper protocol.", fx = { align = { order = 1 } } },
      },
    },
    xalive = {
      narr = "The light within the stone flickers, steadies and flickers again.",
      lines = { { id = "xxalive_d", text = "Negative. This construct is a projection of recorded will. It responds, but it does not want. That distinction is important." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xxmage_d", text = "Magic is the arcane order of the cosmos, to be used with care. Uncontrolled arcane draws the attention of the Burning Legion. This warning has been recorded many times." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    titans = { { id = "tp_xtitans", text = "The makers. They shaped this world and moved on." } },
    uldum = { { id = "tp_xuldum", text = "Access restricted. The seal holds." } },
    _none = { { id = "tp_none", text = "That inquiry is outside this record's parameters." } } },
}

-- Elder Ragetotem: a tauren elder honoured in the Valley of the Watchers, Tanaris, during the Lunar Festival.
P:NPC {
  key = "tan_elder_ragetotem", id = 15573, name = "Elder Ragetotem", gender = "female",
  role = "elder", tier = "quest",
  temper = { "calm", "dry" }, values = { "ancestors", "tradition" },
  notices = { "race", "season" },
  impression = {
    first = "A tauren elder glowing softly in the desert heat, unbothered by the sand.",
    third = "{name} paid respects to Elder Ragetotem in Tanaris during the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, traveller. The sand is hot and the ancestors are near, so we will both bear it together." },
    { id = "g_done", when = { questDone = TODO_QUEST("Ragetotem the Elder") }, text = "You honoured me already. The desert remembers footprints a short while, but the ancestors remember longer." },
    { id = "yg_0", when = { race = "Troll" }, text = "Darkspear. Your people came to Kalimdor with nothing, as mine once wandered with nothing. Sit with me a moment." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Kin from the grasslands, far from home. You must miss the rain as much as I do." },
    { id = "n_lunar", cat = "season", when = { holiday = "lunar" }, text = "The festival lanterns burn even in Tanaris. The ancestors do not mind the heat." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a hunter of the Ragetotem tribe, long ago, before Cairne gathered the tribes at Thunder Bluff. My tribe wandered the Barrens and the edge of these deserts, and I learned the sand's moods as a young bull." },
      },
      choices = {
        { text = "What is the sand's mood today?", next = "y_mood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mood = {
      lines = {
        { id = "y_y_mood", text = "Restless. Something stirs far to the south, in Silithus, where the bugs crawl. The sand carries it like a fever. The ancestors are uneasy, and so am I." },
        { id = "y_y_mood_v0", when = { class = "SHAMAN" }, text = "Restless, shaman. You will feel it too, if you listen. Something stirs in the south, and the earth spirits do not like it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lunar = {
      lines = {
        { id = "y_y_lunar", text = "Once a year the ancestors gather, and we elders stand in the places they choose. The young come to honour us, and in honouring us, they honour those who came before. It is the oldest festival I know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_goblins = {
      lines = {
        { id = "y_y_goblins", text = "The goblins of Gadgetzan dig in the old cities for gold and trinkets. They do not ask the spirits before they dig. Should they be stopped, or is the past theirs to take?" },
      },
      choices = {
        { text = "The dead should rest. Stop the digging.", next = "BACK", reply = "The ancestors would agree. I will speak to them of you.", fx = { align = { light = 1 } } },
        { text = "The past belongs to whoever finds it.", next = "BACK", reply = "A goblin answer. Perhaps true. The ancestors will not thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Ragetotem, an elder of my people, and for the Lunar Festival I stand in this desert as the ancestors ask. Those who seek the elders carry honour from one to the next." } },
      again = { { id = "h_again", text = "Ask, child. There is no hurry in the desert, only heat." } },
      choices = {
        { text = "Why would the ancestors send you to the desert?", next = "desert" },
        { text = "I've come to honour you, elder.", next = "honour", when = { questActive = TODO_QUEST("Ragetotem the Elder") } },
        { text = "Your name sounds fierce for an elder.", next = "name" },
        { text = "Tell me of your tribe.", next = "y_hist" },
        { text = "What is the Lunar Festival?", next = "y_lunar" },
        { text = "What of the goblins digging in the ruins?", next = "y_goblins" },
        { text = "The Earth Mother walks with you.", next = "BACK", when = { race = "Tauren" }, reply = "And with you, child. Even here, where the sand hides her face." },
        { text = "May the eternal sun shine on you.", next = "END" },
      },
    },
    desert = {
      lines = { { id = "d_default", text = "There are spirits here older than any tauren, buried with the cities beneath the sand. The ancestors wish them to know that they are not forgotten, even by strangers." } },
      choices = {
        { text = "Old cities, like the troll ruins at Zul'Farrak?", next = "cities" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cities = {
      lines = { { id = "c_default", text = "Zul'Farrak, and older places still, far to the south behind gates the goblins cannot open. Some things are buried for a reason, child, and the wise leave them be." } },
      choices = {
        { text = "Ancient secrets should be uncovered.", next = "BACK", reply = "Then go carefully, for the desert keeps its secrets jealously.", fx = { align = { order = -1 } } },
        { text = "I agree. Let the dead keep their cities.", next = "BACK", reply = "A wise answer from one so young.", fx = { align = { order = 1 } } },
      },
    },
    honour = {
      lines = { { id = "ho_default", text = "Then take my blessing and a coin of the ancestors. Drink deeply before your next road; the elders are many, and the desert is wide." } },
      choices = { { text = "I will, elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = { { id = "n_default", text = "I earned it young, when my temper was hotter than this sand. Age has cooled me, but the name stayed, as names do." } },
      choices = {
        { text = "What made your temper so hot?", next = "temper" },
        { text = "Names outlast us all. Something else.", next = "BACK" },
      },
    },
    temper = {
      lines = { { id = "te_default", text = "The centaur, mostly, when they raided our herds in the years we wandered. I wanted to fight every one of them, and the elders taught me that a herd needs a shepherd more than it needs a storm." } },
      choices = {
        { text = "Sometimes a storm is what the herd needs.", next = "BACK", reply = "Sometimes, child. But storms do not choose where they fall.", fx = { align = { light = -1 } } },
        { text = "The shepherd's way is the wiser one.", next = "BACK", reply = "It took me a long life to learn it. Learn it faster.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lunar_festival = { { id = "tp_ylunar_festival", text = "The Lunar Festival is when the ancestors walk closest. I stand where they ask." } },
    ragetotem = { { id = "tp_yragetotem", text = "The Ragetotem were a wandering tribe. Now we are part of the great Tauren nation." } },
    background = { { id = "tp_bg", text = "An old tauren with a fierce name and a quiet heart. Nothing more." } },
    _none = { { id = "tp_none", text = "Ask the goblins, child. They sell answers, I am told." } },
  },
}

-- Prospector Gunstan: an Explorers' League dwarf keeping a lonely watch over the sealed gates in the Valley of the Watchers.
P:NPC {
  key = "tan_prospector_gunstan", id = 5389, name = "Prospector Gunstan", gender = "male",
  role = "explorer", tier = "quest",
  temper = { "stubborn", "hearty" }, values = { "discovery", "titans" },
  notices = { "race", "class" },
  impression = {
    first = "A sunburnt dwarf prospector who hasn't seen a friendly face in weeks and is glad of yours.",
    third = "{name} met Prospector Gunstan of the Explorers' League in the Valley of the Watchers.",
  },
  greetings = {
    { id = "g_default", text = "Well, I'll be! A visitor, out here in the Valley of the Watchers! Come in out o' the sun, {g:lad|lass}." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I'm still here, and the gates are still shut, if ye were wonderin'." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Easy now, I'm just a dwarf with a pick an' a notebook. Nothin' here worth fightin' over." },
    { id = "yg_0", when = { race = "Gnome" }, text = "A gnome! Grand, ye've small hands. I've a crack in that gate I cannae get my fingers intae." },
    { id = "yg_1", when = { class = "PALADIN" }, text = "A paladin! The Light's a long way from here, but ye're a sight for sore eyes." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "A fellow son o' the mountain! Tell me, how's the ale in Ironforge these days?" },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a tunnel surveyor in Loch Modan before the League took me on. My first dig was Uldaman, under old Ironband. When the League sent word they wanted someone tae watch these gates, I put my hand up before I thought it through." },
      },
      choices = {
        { text = "Would you do it again?", next = "y_again" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_again = {
      lines = {
        { id = "y_y_again", text = "Aye, without blinkin'. Mind ye, I'd bring more water, an' a hat, an' maybe a friend. But ye dinnae get tae stand beside a titan gate twice in a lifetime, an' I'd nae trade it for all the ale in Kharanos." },
        { id = "y_y_again_v0", when = { race = "Dwarf" }, text = "Aye, kinsman, without blinkin'. Ye know it in yer beard: a titan gate's worth any amount o' sunburn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_goblin = {
      lines = {
        { id = "y_y_goblin", text = "The goblins o' Gadgetzan come out here now an' then wi' explosives, wantin' tae blow the gates open for whatever's inside. I've chased off three crews. I tell them the gates are cursed. They're nae cursed, I think, but they might be." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_open = {
      lines = {
        { id = "y_y_open", text = "If I found a way tae open the gates, the League would want me tae do it straight away. But there's somethin' about this place that feels like it wants tae stay shut. What would ye do?" },
      },
      choices = {
        { text = "Open them. Knowledge belongs to everyone.", next = "BACK", reply = "Aye, that's the League's motto near enough. I'll keep lookin'.", fx = { align = { order = 1 } } },
        { text = "Leave them sealed. Some doors are shut for a reason.", next = "BACK", reply = "Aye. Ye might be right. I'll sleep on it, an' keep my pick in my pack.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Prospector Gunstan, o' the Explorers' League. I've been watchin' these great gates for months, waitin' for some way to open 'em, an' writin' down every scratch on these statues." } },
      again = { { id = "h_again", text = "What else, then? I've nothin' but time an' sand." }, { id = "h_again2", text = "Go on, ask! It's grand to hear a voice that isn't mine." } },
      choices = {
        { text = "What lies behind the gates?", next = "gates" },
        { text = "Why does the League care about this place?", next = "league" },
        { text = "Do you know Magni's interest in the titans?", next = "magni", when = { race = "Dwarf" } },
        { text = "You've been alone out here a long while.", next = "lonely" },
        { text = "How did you join the League?", next = "y_hist" },
        { text = "Do the goblins bother you?", next = "y_goblin" },
        { text = "If you could open the gates, would you?", next = "y_open" },
        { text = "I know Uldaman's stonework.", next = "BACK", when = { race = "Dwarf" }, reply = "Do ye now? Then ye'll see it too, the same lines, the same old hands. I'm nae mad after all!" },
        { text = "Good luck with your digging.", next = "END" },
      },
    },
    gates = {
      lines = { { id = "gates_default", text = "That's the question, isn't it? The goblins say a lost city, the trolls say a curse, an' the statues say nothin' at all, the stony beggars. I'd wager it's titan work, an' old as the world." } },
      choices = {
        { text = "Titan work? How can you tell?", next = "titans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    titans = {
      lines = { { id = "t_default", text = "The same marks as on the old stonework at Uldaman in the Badlands, the very same! Whoever built that built this, I'd stake me beard on it." } },
      choices = {
        { text = "Some doors are better left shut.", next = "BACK", reply = "Bah, that's what the cowards said about Uldaman, an' look what we found there.", fx = { align = { order = 1 } } },
        { text = "Then we have to find a way in.", next = "BACK", reply = "That's the spirit! Ye'd make a fine Explorer, {g:lad|lass}.", fx = { align = { order = -1 } } },
      },
    },
    league = {
      lines = { { id = "l_default", text = "The League wants to know where we came from, an' who made the world the way it is. Every ruin's a page in that book, an' this one's a whole chapter." } },
      choices = { { text = "A noble cause. Something else.", next = "BACK" } },
    },
    magni = {
      lines = { { id = "m_default", text = "Aye, the king's keen on it, an' Brann Bronzebeard more so. If I find anythin' here, it'll go straight to Ironforge, an' maybe they'll let me come home." } },
      choices = { { text = "May it be soon. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lonely = {
      lines = { { id = "lo_default", text = "Aye, an' the sun's cooked half me wits by now. I talk to the statues of an evening, an' I swear one o' them's started listenin'." } },
      choices = { { text = "That's worrying. Something else.", next = "BACK" } },
    },
  },
  topics = {
    explorers_league = { { id = "tp_yexplorers_league", text = "The Explorers' League. We dig up the past so we know who we are." } },
    uldaman = { { id = "tp_yuldaman", text = "Uldaman, in the Badlands. The stonework there matches these gates line for line." } },
    background = { { id = "tp_bg", text = "Ironforge born, Explorers' League by trade, an' sunburnt by bad luck." } },
    _none = { { id = "tp_none", text = "No idea, {g:lad|lass}, but if ye find out, write it down for me!" } },
  },
}

-- Rumsen Fizzlebrack: a Steamwheedle goblin outside Gadgetzan who lets fallen-out adventurers buy their way back into the Cartel's good books.
P:NPC {
  key = "tan_rumsen_fizzlebrack", id = 16417, name = "Rumsen Fizzlebrack", gender = "male",
  role = "merchant", tier = "quest",
  temper = { "pushy", "shrewd" }, values = { "profit", "cartel" },
  notices = { "reputation", "class" },
  impression = {
    first = "A goblin with a ledger in one hand, already counting what you owe him.",
    third = "{name} met Rumsen Fizzlebrack, who sells forgiveness on the Cartel's behalf outside Gadgetzan.",
  },
  greetings = {
    { id = "g_default", text = "Hey there, pal! Somebody upset the bruisers, did they? Don't worry, Rumsen fixes everything, for a reasonable fee." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite repeat customer! Still owe the Cartel a favour or two? Let's talk." },
    { id = "yg_0", when = { race = "Goblin" }, text = "A fellow goblin! You know how the Cartel works, pal. Let's skip the speech and get to the discount." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "A rogue! I bet you're the type who's always needin' my services, ain't ya?" },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "Started out as a bookkeeper in Booty Bay. One day a pirate came in and offered to pay off his debts with a map. I took the map, sold it to three different buyers, and the Cartel promoted me to Second Chances." },
      },
      choices = {
        { text = "Was the map real?", next = "y_map" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_map = {
      lines = {
        { id = "y_y_map", text = "Real enough to sell three times, pal. That's real in my book. All three buyers are still out there, digging, and I hope they find something. I'm not a monster." },
        { id = "y_y_map_v0", when = { class = "ROGUE" }, text = "Real enough to sell three times. You're a rogue, pal; you know a good map is the one somebody believes. All three buyers are still digging." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worst = {
      lines = {
        { id = "y_y_worst", text = "Worst customer ever? A gnome who blew up a bank vault in Ratchet. He owed so much, I had to set up a payment plan that'll outlast his grandchildren. He still sends me a postcard every year." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mercy = {
      lines = {
        { id = "y_y_mercy", text = "Sometimes folks can't pay, and the Cartel wants me to squeeze 'em harder. Sometimes I let 'em slide, quietly. Should I?" },
      },
      choices = {
        { text = "Let them slide. Mercy is good business.", next = "BACK", reply = "Heh, don't let the Cartel hear you say that. But between us, yeah.", fx = { align = { light = 1 } } },
        { text = "Squeeze them. Rules are rules.", next = "BACK", reply = "Ugh, you sound like my boss. Okay, okay, I'll squeeze.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Rumsen Fizzlebrack, Steamwheedle Cartel, Department of Second Chances. Anybody who's made the goblins of Tanaris mad can come to me and work it off, see, because grudges are bad for business and so's an empty warehouse." } },
      again = { { id = "h_again", text = "What else, buddy? Time is money, and you're spendin' mine." }, { id = "h_again2", text = "Talk to me, pal. I'm listening, and I'm billing." } },
      choices = {
        { text = "How do I get back in the Cartel's good books?", next = "how" },
        { text = "Why do you need mageweave and flux?", next = "materials" },
        { text = "What happens if I stay on their bad side?", next = "bad" },
        { text = "I'm on the war at sea, as you asked.", next = "war", when = { questActive = TODO_QUEST("War at Sea") } },
        { text = "How did you get this job?", next = "y_hist" },
        { text = "Who's your worst customer?", next = "y_worst" },
        { text = "Do you ever let anyone off?", next = "y_mercy" },
        { text = "I'm a goblin too. What's the discount?", next = "BACK", when = { race = "Goblin" }, reply = "Discount? Pal, you get the family rate. That's the regular rate, but I smile while I say it." },
        { text = "I'll pass for now.", next = "END" },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "Easy, you bring me mageweave and strong flux, I put in a good word, and the bruisers stop tryin' to break your knees. Do it enough times and you're a valued customer again, no hard feelings, only paperwork." } },
      choices = {
        { text = "That sounds like extortion.", next = "extortion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    extortion = {
      lines = { { id = "e_default", text = "Extortion's an ugly word, friend; I prefer reconciliation services. You broke something, you pay for it, and everybody walks away happy and nobody walks away limpin'." } },
      choices = {
        { text = "Fair's fair. I'll pay what I owe.", next = "BACK", reply = "Now that's what I like to hear! A customer with integrity, rare as hen's teeth.", fx = { align = { order = 1 } } },
        { text = "I'll take my chances with the bruisers.", next = "BACK", reply = "Your funeral, pal, and I mean that literally, so the offer stands.", fx = { align = { order = -1 } } },
      },
    },
    materials = {
      lines = { { id = "m_default", text = "Sails and guns, pal, sails and guns. The Bloodsail Buccaneers have been raiding our ships off the coast, and you don't fight pirates with harsh language." } },
      choices = {
        { text = "Tell me about these pirates.", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "Bloodsail scum, the lot of 'em, down at Lost Rigger Cove and all along the south coast. They rob our cargo, sink our ships, and don't even leave a receipt." } },
      choices = { { text = "Sounds like they need stopping. Something else.", next = "BACK" } },
    },
    bad = {
      lines = { { id = "b_default", text = "Then every goblin town from Booty Bay to Ratchet gets real unfriendly, real fast. No trading, no bank, and the guards develop a sudden interest in your face." } },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
    war = {
      lines = { { id = "w_default", text = "That's what I like to see! Every bolt of cloth is another sail, every bit of flux is another cannon, and every cannon is one less pirate. Keep it coming!" } },
      choices = { { text = "I'll keep at it.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_ysteamwheedle", text = "The Steamwheedle Cartel. Biggest goblin outfit there is, and I'm the guy who forgives you." } },
    booty_bay = { { id = "tp_ybooty_bay", text = "Booty Bay, where I learned the trade. Pirates and paperwork, the best of both." } },
    background = { { id = "tp_bg", text = "A Steamwheedle man through and through. Born in a ledger, I like to say." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, pal, unless there's coin in it." } },
  },
}

---------------------------------------------------------------------------
-- Quinn: goblin townswoman of Gadgetzan.
---------------------------------------------------------------------------
P:NPC {
  key = "tan_quinn", id = 11756, name = "Quinn", gender = "female",
  role = "civilian", tier = "service",
  communities = { "gadgetzan" }, temper = { "wry" }, values = { "profit", "survival" },
  impression = {
    first = "Quinn sits in the shade of a wall, fanning herself with an unpaid invoice and watching the street as though she is pricing everyone in it.",
    third = "{name} met Quinn, a goblin of Gadgetzan who knows the town's gossip and its prices.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hot enough for you? Never mind, sit down in the shade, friend. You're good company in this heat." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hot enough for you? Don't answer that. Don't answer anything, actually." },
    { id = "g_default", text = "Hot enough for you? Don't answer that; out here it's always hot enough for everybody." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, I see. In Tanaris that's worth a compliment." },
    { id = "yg_0", when = { race = "Goblin" }, text = "A fellow goblin, outside the Cartel's books? Sit down, we'll gossip." },
    { id = "yg_1", when = { race = "Human" }, text = "Another soft lowlander, melting in the sun. Don't worry, sweetheart, it gets worse." },
  },
  start = "hello",
  nodes = {
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Here's one for free. The Bruisers aren't as neutral as they look. One of them, a big fellow by the gate, takes a little extra from Horde caravans and a little less from Alliance ones. Nobody's noticed because nobody counts but me." },
      },
      choices = {
        { text = "Will you report him?", next = "y_report" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_report = {
      lines = {
        { id = "y_y_report", text = "To who? The Cartel? They'd shrug and take a cut. To the Horde? They'd start a war over a few silver. I keep it in my pocket, honey, and someday it'll be worth something." },
        { id = "y_y_report_v0", when = { faction = "Horde" }, text = "To who? The Cartel would shrug. Your Horde would start a war over a few silver, sweetheart. I'll keep it in my pocket for now." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lonely = {
      lines = {
        { id = "y_y_lonely", text = "Lonely? In Gadgetzan? There are three thousand goblins, a hundred adventurers and a mad gnome who talks to an owl. I'm never alone. I'm just never with anyone I'd choose." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret2 = {
      lines = {
        { id = "y_y_secret2", text = "Somebody's been asking me about the caravan schedules lately. Lots of coin offered. Should I sell what I know, or keep my mouth shut?" },
      },
      choices = {
        { text = "Keep quiet. That information gets people killed.", next = "BACK", reply = "Ugh. You sound like my mother. Fine. I'll keep it shut.", fx = { align = { light = 1 } } },
        { text = "Sell it. Information is your trade.", next = "BACK", reply = "That's what I was thinking. Shame about the caravans, but a girl has to eat.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Name's Quinn. I don't sell anything today, so you can relax your coin purse. I just know where everything in Gadgetzan comes from and who's overcharging for it." } },
      again = { { id = "h_again", text = "Something else on your mind?" } },
      choices = {
        { text = "What's life like in Gadgetzan?", next = "life" },
        { text = "What do you think of the bruisers?", next = "bruisers" },
        { text = "Who's overcharging in Gadgetzan?", next = "xover" },
        { text = "How did you end up in Tanaris?", next = "xhow" },
        { text = "You seem to know everyone.", next = "xknow" },
        { text = "I'm a rogue. Got any tips for a newcomer?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Tell me a secret.", next = "y_secret" },
        { text = "Don't you get lonely here?", next = "y_lonely" },
        { text = "Anyone asking you questions lately?", next = "y_secret2" },
        { text = "Who should I avoid in town?", next = "BACK", when = { class = "ROGUE" }, reply = "Anyone who smiles too much. In Gadgetzan, a smile is usually a price tag." },
        { text = "Enjoy the shade, Quinn.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "Water costs more than ale, the Wastewander bandits rob the roads, and the pirates at Lost Rigger Cove rob the coast. Still, the Steamwheedle keep the peace inside the walls, and peace is good for business." } },
      choices = { { text = "Sounds like a hard place to live.", next = "BACK" } },
    },
    bruisers = {
      lines = { { id = "b_default", text = "They'll knock your head off for drawing steel in town, Horde or Alliance alike. Some call that tyranny; I call it the only reason I still have my teeth." } },
      choices = {
        { text = "Strict law keeps a town alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hired muscle isn't law. It's just a bigger gang.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xover = {
      lines = { { id = "xxover_d", text = "Everyone, honey, but some more than others. The water seller near the inn charges a silver a skin, and there's a well a mile south that's free if you don't mind the scorpids." } },
      choices = {
        { text = "Why does nobody complain?", next = "xcomplain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcomplain = {
      lines = { { id = "xxcomplain_d", text = "Because the Cartel takes a cut of everything, and complaining to the Cartel is like complaining to the sun. Some say that's fair trade, and some say it's robbery in a nice hat." } },
      choices = {
        { text = "A market's a market. They earned their prices.", next = "BACK", reply = "Spoken like a goblin. Noggenfogger would buy you a drink, if he bought anyone drinks.", fx = { align = { order = 1 } } },
        { text = "It's robbery. Someone should stand up to them.", next = "BACK", reply = "Careful saying that too loud. The bruisers have very good hearing.", fx = { align = { order = -1 } } },
      },
    },
    xhow = {
      lines = { { id = "xxhow_d", text = "I came on a caravan from Thousand Needles, with a broken wagon and no money, and I stayed because nobody in Gadgetzan asks questions. That's the best thing about the place, and the worst." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xknow = {
      narr = "She flicks a grain of sand off her sleeve and smiles without showing her teeth.",
      lines = { { id = "xxknow_d", text = "I know who owes who, who's cheating at cards and who's sleeping with whose cousin. That's not knowing everyone, that's just paying attention." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xxrogue_d", text = "Don't pick pockets in Gadgetzan. The bruisers will throw you in the cage, and the cage has no shade. Pick them in Steamwheedle Port instead, where the bruisers are lazier." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    bruisers = { { id = "tp_ybruisers", text = "The Bruisers keep the peace. Mostly. I know which ones don't." } },
    water = { { id = "tp_ywater", text = "Water costs a silver a skin, and the man selling it has never once been thirsty." } },
    gadgetzan = { { id = "tp_xgadgetzan", text = "Hot, dusty and full of goblins. I love it, in a way." } },
    steamwheedle_cartel = { { id = "tp_xsteamwheedle_cartel", text = "They own everything. You learn to live with it." } },
    _none = { { id = "tp_none", text = "Never heard of it, and that means nobody's selling it here." } } },
}
