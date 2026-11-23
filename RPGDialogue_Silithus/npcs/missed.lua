-- Silithus folk an earlier pass missed: Arcanist Nozzlespring at the Ironforge Brigade's camp, Shadow Priestess
-- Shai at the Orgrimmar Legion's, and the Cenarion scouts Azenel (Hive'Zora) and Landion (Hive'Regal), who
-- report from inside the hives. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Arcanist Nozzlespring: Ironforge Brigade outpost outside Hive'Zora; takes the Brigade's explosives.
P:NPC {
  key = "arcanist_nozzlespring", id = TODO_NPC("Arcanist Nozzlespring"), name = "Arcanist Nozzlespring", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "eager", "precise" }, values = { "curious", "craft" },
  notices = { "craft" },
  impression = {
    first = "Arcanist Nozzlespring is the Ironforge Brigade's gnome at the Hive'Zora camp, and he is in charge of everything that explodes. He described three ways to collapse a silithid tunnel before I had finished saying hello, and was plainly sorry there were only three.",
    third = "{name} met Arcanist Nozzlespring, who handles explosives for the Ironforge Brigade outside Hive'Zora.",
  },
  greetings = {
    { id = "g_default", text = "Oh, splendid, a new arrival! Please step around the crates and not over them, since about forty percent of what's in this camp is explosive and I've rather lost track of which forty." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Ironforge Brigade Needs Explosives!") }, text = "Is that my powder? Do say it's my powder, because I've a tunnel plotted out to the inch and nothing whatever to put in it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and with the correct number of limbs, which in this desert I count as a successful outing." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Tell me quickly, do you favour a slow fuse or a clockwork trigger for confined blasting? Captain Blackanvil says it doesn't matter, and it matters enormously." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here in the sand! We must compare notes on grit in the gearwork, because I've lost two calibrators to it already and I'm on my last spare." },
  },
  start = "hello",
  nodes = {
    gt_arcane = {
      lines = { { id = "gt_arcane_l", text = "I tried that first, naturally! The trouble is that the silithid tunnels drink up stray magic like sand drinks water, so a blast that would level a tower here barely scorches the walls. Powder doesn't care what the hive thinks of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_gnomer = {
      lines = { { id = "gt_gnomer_l", text = "By way of Ironforge, like the rest of us who got out. I'd rather not dwell on it, if you don't mind, because I left a perfectly good workshop down there with the radiation and the troggs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Arcanist Nozzlespring, attached to the Ironforge Brigade for what the Captain calls demolitions and I call applied arcanodynamics. The silithid dig faster than we can kill them, so my task is to bring their tunnels down on top of them, which is far more efficient per bug." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Arcanist Nozzlespring, Ironforge Brigade, and I'd be obliged if you kept to your own side of the hive. The Circle says we share an enemy out here, and I'm prepared to believe it from a sensible distance." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? I can talk and measure powder, as long as I don't do it near a candle." },
        { id = "h_again2", text = "Go on, I'm listening with at least one ear." },
      },
      choices = {
        { text = "How do you collapse a hive tunnel?", next = "collapse" },
        { text = "What does the Brigade need from me?", next = "need" },
        { text = "What do you make of the silithid?", next = "silithid" },
        { text = "How do you get on with the dwarves?", next = "dwarves" },
        { text = "As a mage, I wonder whether arcane blasts would serve better.", next = "gt_arcane", when = { class = "MAGE" } },
        { text = "Did you come here from Gnomeregan?", next = "gt_gnomer", when = { race = "Gnome" } },
        { text = "Mind the candles, Arcanist.", next = "END" },
      },
    },
    collapse = {
      lines = { { id = "c_default", text = "The walls are a sort of resin over packed sand, you see, and they're wonderfully strong against digging and no good at all against a shock from inside. So one places a charge at a junction, retires briskly, and lets the weight of the dune do the remaining ninety percent of the work." } },
      choices = {
        { text = "And who places the charge?", next = "places" },
        { text = "Another question.", next = "BACK" },
      },
    },
    places = {
      lines = { { id = "p_default", text = "Ah, well, that is the unresolved part of the design. I've proposed a clockwork carrier, and the Captain has proposed whichever soldier annoyed him most recently, and so far his method has been cheaper." } },
      choices = {
        { text = "Has the clockwork carrier been tried?", next = "carrier" },
        { text = "Another question.", next = "BACK" },
      },
    },
    carrier = {
      lines = { { id = "ca_default", text = "Once, and it performed flawlessly until it met a slope, at which point it came back. I'd rather not go into the particulars, except to say that we moved the camp twenty yards afterwards and the prototype is filed under data." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    need = {
      lines = { { id = "n_default", text = "Powder, and a great deal of it, in the dense sort that doesn't spoil in the heat. The Captain signs the field duty papers and Janela counts everything else, but anything that goes bang comes to me, and I am always short." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    silithid = {
      lines = { { id = "s_default", text = "As a problem they're fascinating, and as neighbours they're appalling. They build without tools and breed without pause, and every one of them behaves as though something else were doing its thinking, which I find the most worrying part." } },
      choices = {
        { text = "What is doing their thinking?", next = "thinking" },
        { text = "Another question.", next = "BACK" },
      },
    },
    thinking = {
      lines = { { id = "t_default", text = "The druids at Cenarion Hold say the Qiraji, behind that great wall in the south, and that the hives are only their kennels. I haven't the data to confirm it, but I've noticed the druids stop smiling when they say it." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "Admirably, on the whole. They think I'm fussy and I think they're approximate, but a dwarf will carry a keg of powder a mile through sand without one complaint, provided there's another sort of keg at the end of it." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Gnomeregan trained, Ironforge housed, and Silithus posted. I go where the interesting problems are, and where the Brigade sends me." } },
    silithid = { { id = "tp_sil", text = "Burrowing insects in hives of resin and sand. I am working on bringing the hives down, one junction at a time." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside my field, and my field is fairly specifically things that explode." } },
  },
}

-- Cenarion Scout Azenel: reporting from inside Hive'Zora.
P:NPC {
  key = "cenarion_scout_azenel", id = TODO_NPC("Cenarion Scout Azenel"), name = "Cenarion Scout Azenel", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "silithus_wilds" }, temper = { "brisk", "watchful" }, values = { "dutiful", "brave" },
  notices = { "stealth" },
  impression = {
    first = "Cenarion Scout Azenel crouches inside Hive'Zora itself, where the walls hum and the air tastes of resin. She gave her report in a whisper and never took her eyes off the tunnel behind me.",
    third = "{name} met Cenarion Scout Azenel, a night elf scouting inside Hive'Zora for the Cenarion Circle.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down, {class}. The walls carry sound in here, and everything in this hive is listening." },
    { id = "g_report", when = { questActive = TODO_QUEST("Hive'Zora Scout Report") }, text = "The Hold sent you for my report? Good. Take it quickly, because I cannot stay in one tunnel for long." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still alive. Speak softly, and be quick." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = { "ROGUE", "DRUID" } },
      text = "You move quietly, which is the only reason we are both still breathing. Stay to the walls as I do, for the drones feel a footstep through the floor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Scout Azenel, of the Cenarion Circle. Commander Mar'alith wants to know what Hive'Zora is breeding, and somebody had to come inside to count, so here I am among the eggs." } },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Ask, but softly." },
      },
      choices = {
        { text = "What have you seen in here?", next = "seen" },
        { text = "How do you stay hidden?", next = "hidden" },
        { text = "You should get out while you can.", next = "out" },
        { text = "Elune guard you, scout.", next = "END" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "More brood chambers than there were a moon ago, and tunnels pushing north toward the Brigade's camp. The wasps are swarming thicker too, and the workers have begun dragging in crystal I have never seen them carry before." } },
      choices = {
        { text = "What do they want with crystal?", next = "crystal" },
        { text = "Another thing.", next = "BACK" },
      },
    },
    crystal = {
      lines = { { id = "c_default", text = "I do not know, and that is the part of my report I like least. The Twilight's Hammer raise the same crystals at their camps, and I do not believe the cultists and the hive came to it separately." } },
      choices = { { text = "Another thing.", next = "BACK" } },
    },
    hidden = {
      lines = { { id = "h_default2", text = "I rub the resin from their walls on my cloak, so that I smell of the hive, and I do not move while a patrol passes. It has served for six days, though I would not wager on a seventh." } },
      choices = { { text = "Another thing.", next = "BACK" } },
    },
    out = {
      lines = { { id = "o_default", text = "When my count is finished, and no sooner. The Hold is deciding where to spend lives it cannot spare, and a wrong number from me would cost more of them than my staying will." } },
      choices = { { text = "Then finish it and live. Another thing.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A scout of the Circle. I have been inside this hive for six days, and I have counted every one of them." } },
    _none = { { id = "tp_none", text = "Not here, and not now. Ask at Cenarion Hold." } },
  },
}

-- Cenarion Scout Landion: reporting from inside Hive'Regal.
P:NPC {
  key = "cenarion_scout_landion", id = TODO_NPC("Cenarion Scout Landion"), name = "Cenarion Scout Landion", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "silithus_wilds" }, temper = { "brisk", "dry" }, values = { "dutiful", "careful" },
  notices = { "stealth" },
  impression = {
    first = "Cenarion Scout Landion hides in a wide chamber deep inside Hive'Regal, fading in and out of the shadows as the patrols pass. He was less surprised to be found than annoyed, since it meant his hiding place was worse than he had thought.",
    third = "{name} met Cenarion Scout Landion, a night elf scouting inside Hive'Regal for the Cenarion Circle.",
  },
  greetings = {
    { id = "g_default", text = "You found me, {class}, which means I chose this corner badly. Stand against the wall, and tell me your business in a whisper." },
    { id = "g_report", when = { questActive = TODO_QUEST("Hive'Regal Scout Report") }, text = "You have come from the Hold for my report. Take it and go by the way you came, for the other tunnels are worse." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. One of us must be very brave or very lost, and I know which I am." },
  },
  notice = {
    { id = "n_nelf", cat = "stealth", when = { race = "NightElf" },
      text = "Shadowmeld when the patrol comes round, as I do, and hold it until the floor stops trembling. They hunt by movement, and they are slow to notice what keeps still." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Scout Landion, of the Cenarion Circle. Hive'Regal is the largest of the three hives and the nearest to the Scarab Wall, and the Commander wished to know why, so I was sent to stand in the dark and find out." } },
      again = {
        { id = "h_again", text = "Something else? Quietly." },
        { id = "h_again2", text = "Ask, between patrols." },
      },
      choices = {
        { text = "What makes Hive'Regal different?", next = "different" },
        { text = "Which way out is safest?", next = "way" },
        { text = "You sound as if you dislike this duty.", next = "duty" },
        { text = "Stay hidden, scout.", next = "END" },
      },
    },
    different = {
      lines = { { id = "d_default", text = "The others are nests, whereas this one is a barracks. The silithid here are larger and drilled like soldiers, and they do not forage, because something else is seeing that they are fed." } },
      choices = {
        { text = "What feeds them?", next = "feeds" },
        { text = "Another question.", next = "BACK" },
      },
    },
    feeds = {
      lines = { { id = "f_default", text = "I have seen shapes in the deepest chamber that walk upright and are obeyed, and I did not go nearer to learn more. I shall tell the Commander that the Qiraji have overseers in this hive, and I expect him to like it as little as I do." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    way = {
      lines = { { id = "w_default", text = "The south-western mouth, where you most likely entered, and keep to the main passage. The round side caves are brood chambers, and anything that wanders into one of those is treated as food." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    duty = {
      lines = { { id = "du_default", text = "I am a ranger of the forest, and I am standing in a hole full of insects under a desert. I do it because the Circle asked and because it matters, but I shall not pretend to you that I enjoy the smell." } },
      choices = { { text = "Fair enough. Another question.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A scout of the Circle, and a forest ranger before that. I miss trees more than I can tell you." } },
    _none = { { id = "tp_none", text = "This is not the place for it. Ask me at the Hold, if I ever see it again." } },
  },
}
