-- Silithus, folk no earlier pass reached: the silithyst quartermasters (Enkles, Apothecary Quinard), Sergeant Carnes,
-- the three Colossus Researchers, Cenarion Hold's Warden Haro, Keyl Swiftclaw and J.D. Shadesong, and the soldiers
-- of the war camps and the war at the gates (Ironforge Brigade Footman, Orgrimmar Legion Axe Thrower, Stormwind
-- Archmage, Stormwind Cavalryman, Tauren Primalist).
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Chief Expeditionary Requisitioner Enkles: Ironforge Brigade silithyst quartermaster.
P:NPC {
  key = "sil_enkles", id = TODO_NPC("Chief Expeditionary Requisitioner Enkles"), name = "Chief Expeditionary Requisitioner Enkles", gender = "male",
  role = "vendor", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "fussy", "eager" }, values = { "order" },
  notices = { "race" },
  impression = {
    first = "Enkles is the Ironforge Brigade's gnome quartermaster outside Hive'Zora, and he insists on every word of his title. He trades the Brigade's stores for silithyst brought back from the desert, and keeps a ledger thicker than he is.",
    third = "{name} met Chief Expeditionary Requisitioner Enkles of the Ironforge Brigade.",
  },
  greetings = {
    { id = "g_default", text = "Chief Expeditionary Requisitioner Enkles, at your service! That's the full title, and yes, I had to fill in a form to get it." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're with the other lot! I'm not authorized to trade with you, but I'm authorized to be polite, so: good day." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome in Silithus! There are three of us now, by my count, and I keep a very accurate count." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I requisition supplies for the Brigade and reward those who bring silithyst back to our camp. Silithyst is the glowing dust from the geysers, and every pinch keeps the Brigade fighting." } },
      again = { { id = "h_again", text = "Anything else? I've four forms in triplicate waiting." } },
      choices = {
        { text = "What does silithyst do?", next = "silithyst" },
        { text = "How do I bring it back?", next = "how" },
        { text = "What do you offer in return?", next = "offer" },
        { text = "I've brought silithyst in before.", next = "offer", when = { questDone = TODO_QUEST("Dust to Dust") } },
        { text = "Three gnomes? Who are the other two?", next = "count", when = { race = "Gnome" } },
        { text = "Farewell, Enkles.", next = "END" },
      },
    },
    silithyst = {
      lines = { { id = "s_default", text = "It's a crystal dust that bubbles up from the geysers, and it does wonders for our troops' spirits and strength. Exactly why is above my clearance, but the results are in the ledger." } },
      choices = {
        { text = "Does the Cenarion Circle mind you taking it?", next = "circle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "Pick it up at a geyser and carry it back here, to the Brigade's camp. The Horde will try to take it off you on the way, so carry it quickly and carry it carefully." } },
      choices = {
        { text = "And if the Horde gets in my way?", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Then the Brigade's soldiers would appreciate your help, and I would appreciate the paperwork afterwards. Neither side owns the desert, but we both want the dust." } },
      choices = {
        { text = "Then the Alliance should take it.", next = "BACK", reply = "Excellent attitude! I'll note it.", fx = { align = { honor = -1 } } },
        { text = "I'll fight fair, not ambush stragglers.", next = "BACK", reply = "Commendable. Also noted.", fx = { align = { honor = 1 } } },
      },
    },
    offer = {
      lines = { { id = "o_default", text = "Supplies, recipes and the Brigade's gratitude, the last of which costs us nothing and the first two of which cost me a great deal of paperwork." } },
      choices = {
        { text = "How much paperwork, exactly?", next = "forms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "The druids at Cenarion Hold tolerate us, which I've entered in the ledger as a qualified yes. They're far more worried about the Twilight's Hammer cultists out in the dunes than about a few soldiers scooping up dust." } },
      choices = {
        { text = "Who are the Twilight's Hammer?", next = "twilight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twilight = {
      narr = "He lowers his clipboard and glances toward the southern dunes.",
      lines = { { id = "tw_default", text = "Robed fanatics who camp among the rocks and chant at things in the sand, and the druids won't say what they're chanting to. I've requested a full report three times, and three times I've been told I'm happier not knowing." } },
      choices = { { text = "The druids may be right. Something else.", next = "BACK" } },
    },
    forms = {
      lines = { { id = "fo_default", text = "Form twelve for the receipt, form twelve-B for the reward, and form nine in triplicate if the silithyst arrived slightly scorched. I designed most of them myself, and I'm prouder of them than I probably should be." } },
      choices = { { text = "A gnome after my own heart. Something else.", next = "BACK" } },
    },
    count = {
      lines = { { id = "cu_default", text = "A tinker at Cenarion Hold who won't tell me his name and a fellow I'm fairly sure is a gnome under all that sand. Now you, which makes three, and I've updated the census accordingly." } },
      choices = { { text = "Glad to be counted. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That's not in my inventory, I'm afraid. Try another department." } } },
}

-- Apothecary Quinard: Orgrimmar Legion silithyst quartermaster.
P:NPC {
  key = "sil_quinard", id = TODO_NPC("Apothecary Quinard"), name = "Apothecary Quinard", gender = "male",
  role = "vendor", tier = "quest",
  communities = { "orgrimmar_legion" }, temper = { "cold", "dry" }, values = { "knowledge" },
  notices = { "race" },
  impression = {
    first = "Apothecary Quinard is a Forsaken of the Royal Apothecary Society who keeps the Orgrimmar Legion's stores near Hive'Regal. He is interested in silithyst, and in very little else that breathes.",
    third = "{name} met Apothecary Quinard of the Orgrimmar Legion.",
  },
  greetings = {
    { id = "g_default", text = "You're alive and you're Horde, so you'll do. Bring me silithyst, and the Legion will make it worth your while." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Alliance. You're standing very close to a great many orcs, and I wouldn't count on them being as patient as I am." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of us. You'll understand that the desert does very little for the complexion, and less for the joints." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The Society sent me to study silithyst, and the Legion pays me to keep its stores while I do. A sensible arrangement, until someone tramples my samples." } },
      again = { { id = "h_again", text = "Yes? I'm in the middle of something that may well explode." } },
      choices = {
        { text = "What do you study it for?", next = "study" },
        { text = "How do I bring you silithyst?", next = "how" },
        { text = "What do you offer?", next = "offer" },
        { text = "Your samples are safe with me, apothecary.", next = "study", when = { race = "Scourge" } },
        { text = "The desert must suit the dead better than the living.", next = "desert" },
        { text = "Silithyst. A warlock could find uses for that.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Farewell, apothecary.", next = "END" },
      },
    },
    study = {
      lines = { { id = "st_default", text = "Its effects on the living, mostly, which are remarkable. I'll leave you to wonder what the Society hopes to learn, and you'll be wrong whatever you guess." } },
      choices = {
        { text = "That sounds like plague talk.", next = "plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "p_default", text = "It sounds like science, which the living always confuse with something sinister. Our work is for the Dark Lady and the Horde, and that's all you need to know." } },
      choices = {
        { text = "The Society's work is necessary.", next = "BACK", reply = "Finally, a sensible one.", fx = { align = { light = -1 } } },
        { text = "I'll be watching your work.", next = "BACK", reply = "Watch all you like. You'll understand none of it.", fx = { align = { light = 1 } } },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "Take it from the geysers and carry it here to the Legion's camp. The Alliance will try to steal it, as is their custom, so be quick." } },
      choices = {
        { text = "And if I meet Alliance carriers?", next = "carriers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    offer = {
      lines = { { id = "o_default", text = "Supplies and recipes from the Legion's stores. The orcs call it gratitude, but I call it a fair price." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    carriers = {
      lines = { { id = "ca_default", text = "Then their silithyst becomes our silithyst, which is the only chemistry the orcs here truly understand. How you go about it is your affair, but do try not to bleed on the samples." } },
      choices = {
        { text = "I'll ambush them. Dust is dust.", next = "BACK", reply = "Efficient. I approve of efficiency.", fx = { align = { honor = -1 } } },
        { text = "I'll meet them face to face, fairly.", next = "BACK", reply = "How very orcish of you. Do try to survive it.", fx = { align = { honor = 1 } } },
      },
    },
    desert = {
      lines = { { id = "de_default", text = "It does, in a way, because the heat can't make me sweat and the scorpids find me unappetising. The sand, however, gets into every joint I have left, and I have fewer than I'd like." } },
      choices = {
        { text = "What else lives out here?", next = "hive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hive = {
      lines = { { id = "hi_default", text = "Insects the size of kodo in hives that hum all night, and cultists who chant at the sand as though it might answer. I would dearly love a specimen of either, preferably one that has stopped moving." } },
      choices = { { text = "I'll keep an eye out. Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "wa_default", text = "It could, and that is precisely why the Society would prefer to learn its uses before your sort does. No offence intended, warlock, though I suspect you're accustomed to taking it." } },
      choices = { { text = "None taken. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't concern myself with that. Ask an orc; they enjoy talking." } } },
}

-- Sergeant Carnes: Ironforge Brigade sergeant, once collecting iron bars for the war effort.
P:NPC {
  key = "sil_carnes", id = TODO_NPC("Sergeant Carnes"), name = "Sergeant Carnes", gender = "male",
  role = "soldier", tier = "service",
  communities = { "ironforge_brigade" }, temper = { "gruff" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "Sergeant Carnes is a human in the Ironforge Brigade, a man who started the war effort counting iron bars and ended it counting the dead. He has the voice of a drill sergeant and the eyes of a tired one.",
    third = "{name} met Sergeant Carnes of the Ironforge Brigade.",
  },
  greetings = {
    { id = "g_default", text = "At ease, unless you're here to work. The Brigade's always short of hands." },
    { id = "g_bars", when = { questDone = TODO_QUEST("The Alliance Needs Iron Bars!") }, text = "You're one of the ones who brought iron bars back in Ironforge! They're out here now as blades and bolts, if you were wondering." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I collected iron for the war effort back in Ironforge, and when it was done they sent me out here with the bars. It turns out the bug war needs sergeants more than ledgers." } },
      again = { { id = "h_again", text = "Anything else, soldier?" } },
      choices = {
        { text = "How's the fighting at Hive'Zora?", next = "zora" },
        { text = "A human in the Ironforge Brigade?", next = "human" },
        { text = "Carry on, sergeant.", next = "END" },
      },
    },
    zora = {
      lines = { { id = "z_default", text = "Bad, but steady. The silithid come out of the ground like water from a cracked pipe, and we plug the holes as fast as we can." } },
      choices = {
        { text = "We'll push them back.", next = "BACK", reply = "That's the spirit, soldier.", fx = { align = { order = 1 } } },
        { text = "This war can't be won by holding.", next = "BACK", reply = "Maybe not, but it can be lost by not holding.", fx = { align = { order = -1 } } },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "The dwarves took anyone who could hold a shield, and they don't much care about height. I've learned to drink like one, which they say counts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my department. Ask the Requisitioner, he's got a form for everything." } } },
}

-- Colossus researchers: three scholars studying the great colossi of Silithus.
P:NPC {
  key = "sil_researcher_sophia", id = TODO_NPC("Colossus Researcher Sophia"), name = "Colossus Researcher Sophia", gender = "female",
  role = "scholar", tier = "service",
  communities = { "silithus_wilds" }, temper = { "earnest" }, values = { "knowledge" },
  notices = {},
  impression = {
    first = "Colossus Researcher Sophia is a human scholar camped near the Colossus of Zora, measuring the giant stone remains with ropes, rods and an alarming amount of hope.",
    third = "{name} met Colossus Researcher Sophia near the Colossus of Zora.",
  },
  greetings = {
    { id = "g_default", text = "Careful! You're standing on my baseline. Thank you. Now, how can I help?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I study the Colossus of Zora, the great stone figure over there. Nobody knows who built the colossi or why, and the silithid don't like us asking." } },
      again = { { id = "h_again", text = "Anything else? My measurements won't take themselves." } },
      choices = {
        { text = "What have you learned?", next = "learned" },
        { text = "Who else studies the colossi?", next = "others" },
        { text = "Good luck.", next = "END" },
      },
    },
    learned = {
      lines = { { id = "l_default", text = "They're older than the hives, much older, and they're hollow in places. Something was kept inside them once, and I'd very much like to know what." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "Nestor watches the Colossus of Ashi and Eazel the one at Regal. We compare notes when we can, which isn't often, because walking across Silithus is a good way to get eaten." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I'd love to. Write it down if you find out." } } },
}

P:NPC {
  key = "sil_researcher_nestor", id = TODO_NPC("Colossus Researcher Nestor"), name = "Colossus Researcher Nestor", gender = "male",
  role = "scholar", tier = "service",
  communities = { "silithus_wilds" }, temper = { "eager" }, values = { "knowledge" },
  notices = { "race" },
  impression = {
    first = "Colossus Researcher Nestor is a gnome who has set up a camp of instruments beside the Colossus of Ashi, and he talks to the colossus nearly as much as to anyone else.",
    third = "{name} met Colossus Researcher Nestor near the Colossus of Ashi.",
  },
  greetings = {
    { id = "g_default", text = "Hello, hello! Mind the calipers. They're calibrated to a hair, and I've only got one hair left to calibrate them to." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Perfect, you'll appreciate my gauges. Most visitors just ask whether they explode." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I study the Colossus of Ashi, the north one, with gauges and resonators and a great deal of patience. The stone hums at night, and I'm nearly certain it's not my imagination." } },
      again = { { id = "h_again", text = "What else? My resonator's warming up." } },
      choices = {
        { text = "The stone hums?", next = "hum" },
        { text = "Is it dangerous out here?", next = "danger" },
        { text = "Carry on.", next = "END" },
      },
    },
    hum = {
      lines = { { id = "h2_default", text = "At about forty-one cycles a second, when the moon is up. Sophia thinks it's the wind, Eazel thinks it's the silithid, and I think they're both wrong, but politely." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Extremely, ninety percent of the time. The other ten percent is merely very dangerous, so I work in that ten percent and hide in the other ninety." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No data on that! Bring me some and I'll take a look." } } },
}

P:NPC {
  key = "sil_researcher_eazel", id = TODO_NPC("Colossus Researcher Eazel"), name = "Colossus Researcher Eazel", gender = "male",
  role = "scholar", tier = "service",
  communities = { "silithus_wilds" }, temper = { "gruff" }, values = { "knowledge" },
  notices = { "race" },
  impression = {
    first = "Colossus Researcher Eazel is a Dark Iron dwarf, of all things, studying the Colossus of Regal far from Blackrock. He does not explain how he came to be here, and I did not quite dare to ask.",
    third = "{name} met Colossus Researcher Eazel near the Colossus of Regal.",
  },
  greetings = {
    { id = "g_default", text = "Aye, I'm a Dark Iron, and no, I'm not here to set anything on fire. Say what ye want and let me get back to my rock." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Bronzebeard, are ye? Don't look at me like that. I left the mountain, same as you lot left yours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I study the Colossus of Regal, the southern one. Stone's stone, whoever shaped it, and a dwarf knows stone better than anyone." } },
      again = { { id = "h_again", text = "More? Fine, but make it quick." } },
      choices = {
        { text = "A Dark Iron, out here?", next = "darkiron" },
        { text = "What have you found?", next = "found" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    darkiron = {
      lines = { { id = "di_default", text = "I didn't fancy kneeling to a fire lord, so I walked away from the Mountain while I still had a beard to walk with. The colossi don't care who my grandfather was, and I like that about them." } },
      choices = {
        { text = "Then you chose well.", next = "BACK", reply = "Aye, I think so, most days.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your clan should answer for its crimes.", next = "BACK", reply = "Maybe so, but not through me.", fx = { align = { order = 1 } } },
      },
    },
    found = {
      lines = { { id = "f_default", text = "Seams in the stone, very fine, like it was built and not carved. Whoever made this knew the earth like a smith knows iron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Don't know, don't care. It isnae stone." } } },
}

-- Warden Haro: tauren weaponsmith at Cenarion Hold who forges blades from Ahn'Qiraj relics.
P:NPC {
  key = "sil_warden_haro", id = TODO_NPC("Warden Haro"), name = "Warden Haro", gender = "male",
  role = "blacksmith", tier = "service",
  communities = { "cenarion_hold" }, temper = { "grave" }, values = { "craft", "duty" },
  notices = { "class" },
  impression = {
    first = "Warden Haro is a tauren of the Cenarion Circle at Cenarion Hold who forges weapons from the relics brought out of the ruins of Ahn'Qiraj. He handles qiraji stone the way a herder handles a snake.",
    third = "{name} met Warden Haro, a tauren weaponsmith at Cenarion Hold.",
  },
  greetings = {
    { id = "g_default", text = "May the Earth Mother guard your steps in this desert. If you have taken something from the ruins, I can make it into a weapon." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like one who stands in front. I will make you something worth standing behind." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Warden Haro. The qiraji leave their treasures in the ruins, and I make those treasures into weapons that can be turned against them." } },
      again = { { id = "h_again", text = "Ask what you would, young one." } },
      choices = {
        { text = "Is it safe to use qiraji things?", next = "safe" },
        { text = "What do you need from me?", next = "need" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Nothing made by the qiraji is safe, but what I forge is cleansed and bound with the Circle's blessing. A weapon is only as dark as the hand that holds it." } },
      choices = {
        { text = "Turn their weapons on them. Good.", next = "BACK", reply = "Yes, there is justice in that.", fx = { align = { light = -1 } } },
        { text = "Some things should be destroyed, not used.", next = "BACK", reply = "Perhaps. But the hive will not wait while we decide.", fx = { align = { light = 1 } } },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Relics from the ruins, scarabs and idols, and the favour of the Circle. Bring them, and I will forge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I cannot say, young one. I know the forge, not the gossip." } } },
}

-- Keyl Swiftclaw: night elf cloak-crafter at Cenarion Hold.
P:NPC {
  key = "sil_keyl_swiftclaw", id = TODO_NPC("Keyl Swiftclaw"), name = "Keyl Swiftclaw", gender = "male",
  role = "vendor", tier = "service",
  communities = { "cenarion_hold" }, temper = { "calm" }, values = { "craft" },
  notices = { "class" },
  impression = {
    first = "Keyl Swiftclaw is a night elf of the Cenarion Circle who makes cloaks from the treasures of the qiraji ruins. He is patient with his needle and less patient with talk.",
    third = "{name} met Keyl Swiftclaw, a cloak-maker at Cenarion Hold.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If the ruins have given you something, I can turn it into a cloak to keep the sand and the insects off you." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. You will have the best of my work, if you bring me what I need." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I make cloaks from qiraji relics and silks, blessed by the Circle. The insects weave stronger cloth than any loom I know of, and it seems a waste not to use it." } },
      again = { { id = "h_again", text = "Speak, then." } },
      choices = {
        { text = "Qiraji silk?", next = "silk" },
        { text = "Do you work with Warden Haro?", next = "haro" },
        { text = "Elune keep you.", next = "END" },
      },
    },
    silk = {
      lines = { { id = "si_default", text = "From the ruins, along with drapes and banners left by the qiraji lords. It takes days to wash the smell from it, but it holds like iron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    haro = {
      lines = { { id = "ha_default", text = "He forges, I sew, and we argue about which is harder. He is a fine smith, though his tea is terrible." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I do not know, traveller. Ask the Commander." } } },
}

-- J.D. Shadesong: a wandering human minstrel at Cenarion Hold.
P:NPC {
  key = "sil_jd_shadesong", id = TODO_NPC("J.D. Shadesong"), name = "J.D. Shadesong", gender = "male",
  role = "citizen", tier = "service",
  communities = { "cenarion_hold" }, temper = { "brooding" }, values = { "music" },
  notices = {},
  impression = {
    first = "J.D. Shadesong is a human who turned up at Cenarion Hold with no obvious business and a dark look about him. He says he is listening to the desert, and seems to mean it.",
    third = "{name} met J.D. Shadesong at Cenarion Hold.",
  },
  greetings = {
    { id = "g_default", text = "Quiet a moment. Do you hear it? The sand has a sound to it, low, like a drum under the floor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I write songs, the dark sort, and Silithus has more darkness in it than I'll ever get through. I came out to listen to the hives, and I haven't been able to stop." } },
      again = { { id = "h_again", text = "Something else? I was in the middle of a verse." } },
      choices = {
        { text = "What do the hives sound like?", next = "hives" },
        { text = "This is a strange place for a singer.", next = "strange" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    hives = {
      lines = { { id = "hi_default", text = "Like a thousand voices whispering the same word, too low to make out. I've tried to put it into a song, but every time I play it, the Sentinels ask me to stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "st_default", text = "Strange places make the best songs. Nobody writes a ballad about a nice afternoon in Goldshire." } },
      choices = {
        { text = "Darkness makes good music. I agree.", next = "BACK", reply = "Finally, someone who understands.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Write something hopeful for once.", next = "BACK", reply = "Maybe one day, if I ever find hope out here.", fx = { align = { light = 1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know. I only listen." } } },
}

-- Ironforge Brigade Footman.
P:NPC {
  key = "sil_ironforge_footman", id = TODO_NPC("Ironforge Brigade Footman"), name = "Ironforge Brigade Footman", gender = "male",
  role = "soldier", tier = "service",
  communities = { "ironforge_brigade" }, temper = { "gruff" }, values = { "duty" },
  notices = {},
  impression = {
    first = "The Ironforge Brigade's footmen hold the camp outside Hive'Zora, dwarves in sandy plate who have plainly stopped trying to get the grit out of their beards.",
    third = "{name} spoke with an Ironforge Brigade Footman in Silithus.",
  },
  greetings = {
    { id = "g_default", text = "Ho there. If ye're Alliance, ye're welcome, and if ye're carryin' silithyst, ye're doubly welcome." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard the Brigade's camp and the silithyst that comes into it. The bugs come up from below and the Horde come from the west, and I'm not sure which I'd rather see." } },
      again = { { id = "h_again", text = "Aye? What else?" } },
      choices = {
        { text = "How do you stand the heat?", next = "heat" },
        { text = "Who commands here?", next = "who" },
        { text = "Hold fast.", next = "END" },
      },
    },
    heat = {
      lines = { { id = "he_default", text = "Badly, and with a lot of ale. A dwarf's built for the cold and the deep, so this is about as far from home as it gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Captain Blackanvil, and his lieutenant Janela Stouthammer when he's busy. Ye'll find them both near the tents, shouting at someone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Couldnae say. Ask the captain." } } },
}

-- Orgrimmar Legion Axe Thrower.
P:NPC {
  key = "sil_orgrimmar_axe_thrower", id = TODO_NPC("Orgrimmar Legion Axe Thrower"), name = "Orgrimmar Legion Axe Thrower", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar_legion" }, temper = { "cheerful" }, values = { "strength" },
  notices = {},
  impression = {
    first = "The Orgrimmar Legion's axe throwers are Darkspear trolls camped near Hive'Regal, and this one was spinning an axe on one finger the whole time we talked.",
    third = "{name} spoke with an Orgrimmar Legion Axe Thrower in Silithus.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon. Stand still, I be practicin' and I don't want to practise on you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I throw axes for de Legion, at bugs, mostly. De bugs be big and slow and dey make a good target, so dis be de best job I ever had." } },
      again = { { id = "h_again", text = "What else, mon?" } },
      choices = {
        { text = "How many have you hit?", next = "count" },
        { text = "Why are trolls here?", next = "why" },
        { text = "Good aim to you.", next = "END" },
      },
    },
    count = {
      lines = { { id = "c_default", text = "I stop countin' at a hundred, because counting be bad luck. De loa don't like a show-off, ya know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "De Darkspear owe Thrall, and Thrall asked. Besides, de silithid be worse than any jungle beast, and a troll likes a challenge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, mon. I just throw de axes." } } },
}

-- Stormwind Archmage: at the gates during the war.
P:NPC {
  key = "sil_stormwind_archmage", id = TODO_NPC("Stormwind Archmage"), name = "Stormwind Archmage", gender = "male",
  role = "soldier", tier = "service",
  communities = {}, temper = { "proud" }, values = { "duty", "knowledge" },
  notices = { "class" },
  impression = {
    first = "The Stormwind Archmages came to Silithus with the armies of the Alliance for the war against Ahn'Qiraj. This one wore robes the colour of the desert and an expression the colour of thunder.",
    third = "{name} spoke with a Stormwind Archmage in Silithus.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear, please. The air here is full of the qiraji's magic, and I'd prefer not to set it alight by mistake." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A fellow mage. Good. Keep your fire close and your wards closer; their priests unravel spells like thread." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am here at the king's order, to break the qiraji lines with fire and frost. The insects do not fear steel the way they fear flame." } },
      again = { { id = "h_again", text = "Yes? Be quick." } },
      choices = {
        { text = "How goes the war?", next = "war" },
        { text = "Do the qiraji use magic?", next = "magic" },
        { text = "Light be with you.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "We hold the ground before the gates, but every hour they bring more out. If the gates stay open long enough, we'll have to go in after them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magic = {
      lines = { { id = "m_default", text = "Strange and old, unlike anything taught in Dalaran. It bends rather than burns, and I have no wish to learn it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not now, I'm busy keeping us alive." } } },
}

-- Stormwind Cavalryman.
P:NPC {
  key = "sil_stormwind_cavalryman", id = TODO_NPC("Stormwind Cavalryman"), name = "Stormwind Cavalryman", gender = "male",
  role = "soldier", tier = "service",
  communities = {}, temper = { "gruff" }, values = { "duty" },
  notices = {},
  impression = {
    first = "The Stormwind Cavalrymen rode across the desert to the gates of Ahn'Qiraj. This one was trying to calm a horse that clearly hated sand as much as he did.",
    third = "{name} spoke with a Stormwind Cavalryman in Silithus.",
  },
  greetings = {
    { id = "g_default", text = "Easy, girl, easy. Sorry, friend, the horses don't care for the hum in the ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We ride the flanks and run down anything that slips past the line. Horses are fast on sand, if you keep their hooves out of the holes." } },
      again = { { id = "h_again", text = "Anything else? She needs water." } },
      choices = {
        { text = "The horses don't like it here?", next = "horses" },
        { text = "Where are you from?", next = "home" },
        { text = "Ride well.", next = "END" },
      },
    },
    horses = {
      lines = { { id = "h2_default", text = "No, and neither do I. They can feel the hives under the sand, and so can I, if I'm honest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Elwynn, near Goldshire, and I'd give a month's pay to be there now. But the king asked, so here we ride." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, friend. Ask the officers." } } },
}

-- Tauren Primalist.
P:NPC {
  key = "sil_tauren_primalist", id = TODO_NPC("Tauren Primalist"), name = "Tauren Primalist", gender = "male",
  role = "soldier", tier = "service",
  communities = {}, temper = { "calm" }, values = { "nature" },
  notices = { "race" },
  impression = {
    first = "The Tauren Primalists came from the tribes of Mulgore to fight at the gates of Ahn'Qiraj, druids and shamans who called the earth's power against the insects.",
    third = "{name} spoke with a Tauren Primalist in Silithus.",
  },
  greetings = {
    { id = "g_default", text = "May the Earth Mother guard you, young one. Here, she is very far away, but we call to her still." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd. Stand beside me, and we will remind this land what it means to be alive." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I call on the land's strength, and turn it against those who would poison it. This desert is sick to its roots, and the hives are the sickness." } },
      again = { { id = "h_again", text = "Speak, young one." } },
      choices = {
        { text = "Can the land heal?", next = "heal" },
        { text = "Why did the tribes come?", next = "why" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "All things heal, given time and care. But first the sickness must be cut out, and that is why we are here." } },
      choices = {
        { text = "Then cut it out, root and all.", next = "BACK", reply = "Yes. Without mercy, for there is none in them.", fx = { align = { light = -1 } } },
        { text = "Healing matters more than killing.", next = "BACK", reply = "You speak like an elder. Both must be done.", fx = { align = { light = 1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Cairne asked, and the Circle asked, and the land itself cried out. When all three speak, a tauren listens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I cannot say, young one. Ask the winds." } } },
}

-- Elder Bladesing: a night elf ancestor honored at the Lunar Festival, at Cenarion Hold.
P:NPC {
  key = "sil_elder_bladesing", id = 15599, name = "Elder Bladesing", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "lunar_elders" }, temper = { "fierce", "warm" }, values = { "memory", "vigilance" },
  notices = { "race" },
  impression = {
    first = "An elder spirit of the night elves, standing in the hot wind of Cenarion Hold as if guarding it still.",
    third = "{name} honored Elder Bladesing, a night elf ancestor who keeps vigil at Cenarion Hold.",
  },
  greetings = {
    { id = "g_default", text = "Well met, traveler. The sand is restless, but an elder does not flinch at sand." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come! You crossed the desert to honor an elder, and I am pleased." },
    { id = "g_honored", when = { questDone = TODO_QUEST("Bladesing the Elder") }, text = "You have honored me already. Go, and keep your blade sharp in this land." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A daughter or son of the Sentinels' people. I stood where you stand, once, ten thousand years ago." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Bladesing, an elder of the Kaldorei. In life I fought on these sands; at the festival, I return to remember it." } },
      again = { { id = "h_again", text = "Ask, child. The desert wind has plenty of time." } },
      choices = {
        { text = "You fought here? Against whom?", next = "war" },
        { text = "What does the festival mean to you?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "Were you a Sentinel, Elder?", next = "sentinel", when = { race = "NightElf" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    war = {
      narr = "She looks south, toward the walls of Ahn'Qiraj shimmering in the heat.",
      lines = { { id = "w_default", text = "The qiraji and their swarms, in the War of the Shifting Sands. We sealed them behind a great wall and thought it would last forever. Nothing does." } },
      choices = {
        { text = "Then they must be destroyed this time.", next = "BACK", reply = "Yes. Do not stop halfway as we did.", fx = { align = { mercy = -1 } } },
        { text = "Sealing them saved many lives back then.", next = "BACK", reply = "It did, and cost many. Both are true.", fx = { align = { mercy = 1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "The year's turning, and the only time the living remember to look for us. I give a coin of ancestry to those who do, and a little luck with it." } },
      choices = {
        { text = "Who else should I seek out?", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Elders stand all over the world, in deserts, in snow and in the old cities. Find as many as you can, and then go to the Moonglade, where the festival is kept." } },
      choices = { { text = "I'll find them. Something else.", next = "BACK" } },
    },
    honor = {
      lines = { { id = "h2_default", text = "I accept your honor, and gladly. Take this coin, and remember that even in the desert, the ancestors walk with you.", fx = { offer = TODO_QUEST("Bladesing the Elder") } } },
      choices = { { text = "Thank you, Elder Bladesing.", next = "BACK" } },
    },
    sentinel = {
      lines = { { id = "s_default", text = "Long before the Sentinels had that name. We were simply the ones who watched the night, and we watch it still." } },
      choices = { { text = "I'll keep watch too.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I do not know, little one. Ask the Circle." } },
  },
}

-- Senior Sergeant Kai'jin: jungle troll who gathers the Horde's war supplies for Ahn'Qiraj. In Classic 1.9-1.12 she stands in Orgrimmar's Valley of Strength during the War Effort (the file sits in the Silithus pack).
P:NPC {
  key = "sil_kaijin", id = 15704, name = "Senior Sergeant Kai'jin", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "horde_war_effort" }, temper = { "brisk", "proud" }, values = { "duty", "strength" },
  notices = { "faction" },
  impression = {
    first = "A tall troll sergeant with a list as long as her arm and the patience of a coiled snake.",
    third = "{name} met Senior Sergeant Kai'jin, who gathers supplies for the Horde's war against Ahn'Qiraj.",
  },
  greetings = {
    { id = "g_default", text = "Ya come to help the Horde, mon? Good. There be plenty of work." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Alliance. Go find your own sergeant; dis one be busy." },
  },
  notice = {
    { id = "n_troll", cat = "faction", when = { race = "Troll" },
      text = "A Darkspear! Da loa be smilin' on us both today." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Kai'jin, senior sergeant of da Horde's war effort. Da gates of Ahn'Qiraj need an army, and armies need supplies." } },
      again = { { id = "h_again", text = "What else, mon? Quick now." } },
      choices = {
        { text = "What does the Horde need?", next = "need" },
        { text = "Why fight the qiraji at all?", next = "why" },
        { text = "Who is Warlord Gorchuk?", next = "gorchuk" },
        { text = "I want to help the Horde.", next = "task", when = { faction = "Horde" } },
        { text = "Farewell, Sergeant.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Food, bandages, herbs, hides and metal. Everything a soldier eats, wears or bleeds on. Da Alliance gathering too, and we not be lettin' dem do it faster." } },
      choices = {
        { text = "A race against the Alliance?", next = "race" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race = {
      lines = { { id = "r_default", text = "Ya, and a friendly one, for once. We both want da bugs dead. But I'd rather da Horde be first through da gates." } },
      choices = {
        { text = "Glory for the Horde, then!", next = "BACK", reply = "Dat be da spirit!", fx = { align = { honor = -1 } } },
        { text = "Victory matters more than who's first.", next = "BACK", reply = "Wise words. Still, I be wantin' us first.", fx = { align = { honor = 1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Dey be swarmin' under da desert, and da Cenarion Circle say dey'll spill out over all of Kalimdor if nobody stops dem. Kalimdor be our home now." } },
      choices = { { text = "Then we stop them. Something else.", next = "BACK" } },
    },
    gorchuk = {
      lines = { { id = "g_default", text = "Da warlord who leads da war effort here in Orgrimmar. A hard orc and a fair one, and he remember every name dat bring supplies." } },
      choices = { { text = "I'll speak to him. Something else.", next = "BACK" } },
    },
    task = {
      lines = { { id = "t_default", text = "Den gather what I ask and bring it here to Orgrimmar. Every crate be one more soldier fed when da gates open.", fx = { offer = TODO_QUEST("The Horde Needs Your Help!") } } },
      choices = { { text = "I'll bring what you need.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, mon. Ask da warlord." } },
  },
}

-- Warlord Gorchuk: orc warlord who leads the Horde's war effort against Ahn'Qiraj. In Classic 1.9-1.12 he stands in Orgrimmar during the War Effort (the file sits in the Silithus pack).
P:NPC {
  key = "sil_gorchuk", id = 15700, name = "Warlord Gorchuk", gender = "male",
  role = "soldier", tier = "service",
  communities = { "horde_war_effort" }, temper = { "grim", "proud" }, values = { "strength", "honor" },
  notices = { "faction" },
  impression = {
    first = "A scarred orc warlord surrounded by war-effort crates, who talks of Ahn'Qiraj as if he means to tear its walls down by hand.",
    third = "{name} met Warlord Gorchuk, who leads the Horde's war effort against Ahn'Qiraj.",
  },
  greetings = {
    { id = "g_default", text = "Lok'tar ogar. Have you come to fight, or only to look?" },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Alliance. The bugs are a common enemy, so I'll not draw on you. Don't push me." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Horde Needs Your Help!") }, text = "Kai'jin sent you, and you answered. The Horde remembers those who carried its crates." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Gorchuk, warlord of the Horde's war effort. Every crate, every blade and every warrior that leaves Orgrimmar for Silithus goes through me." } },
      again = { { id = "h_again", text = "Speak, then." } },
      choices = {
        { text = "How goes the war?", next = "war" },
        { text = "Will the gates open?", next = "gates" },
        { text = "I'll go.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "The Horde has gathered more than anyone thought we could. Everyone gave something, and now we are ready to give blood too." } },
      choices = {
        { text = "The Horde will be first through the gates.", next = "BACK", reply = "That is what I want to hear.", fx = { align = { honor = -1 } } },
        { text = "I'd fight alongside the Alliance if needed.", next = "BACK", reply = "Hmph. Perhaps it will come to that.", fx = { align = { honor = 1 } } },
      },
    },
    gates = {
      lines = { { id = "g_default", text = "They will, when someone strikes the gong with the scepter. Then the bugs come out, and we kill them. Simple." } },
      choices = {
        { text = "What scepter?", next = "scepter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scepter = {
      lines = { { id = "s_default", text = "The Scepter of the Shifting Sands. The bronze dragons know more of it than I do. Ask them, then bring it back and ring that gong." } },
      choices = { { text = "I'll find out.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask Kai'jin. She knows the lists." } },
  },
}

-- Cenarion Scout Jalia: night elf scout reporting from inside Hive'Ashi.
P:NPC {
  key = "sil_scout_jalia", id = 15611, name = "Cenarion Scout Jalia", gender = "female",
  role = "soldier", tier = "service",
  communities = { "cenarion_circle" }, temper = { "tense", "brave" }, values = { "duty", "vigilance" },
  notices = { "kit" },
  impression = {
    first = "A night elf scout crouched low in the hive, her eyes on the tunnels.",
    third = "{name} found Cenarion Scout Jalia inside Hive'Ashi, watching the silithid.",
  },
  greetings = {
    { id = "g_default", text = "Quietly! The silithid hear more than you'd think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jalia, scout of the Cenarion Circle. I've been watching Hive'Ashi for days, and I've seen things Cenarion Hold needs to know." } },
      again = { { id = "h_again", text = "Yes? Keep your voice down." } },
      choices = {
        { text = "What have you seen?", next = "seen" },
        { text = "Should I take your report back?", next = "report" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "More of them than ever, and bigger. They're breeding, and something deeper in the hive is driving them." } },
      choices = {
        { text = "Then we should burn the hive.", next = "BACK", reply = "If only we could. The Circle wants it watched first.", fx = { align = { mercy = -1 } } },
        { text = "Patience. Learn first, strike later.", next = "BACK", reply = "That's the Circle's wisdom, and mine too.", fx = { align = { mercy = 1 } } },
      },
    },
    report = {
      lines = { { id = "r_default", text = "Please. Tell Cenarion Hold what I've found, and say I'm still alive. That last part matters to me." } },
      choices = { { text = "I'll tell them both.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know. Ask at Cenarion Hold." } },
  },
}

-- Ironforge Brigade Rifleman: dwarven riflemen of the Alliance army at the Ahn'Qiraj front.
P:NPC {
  key = "sil_ironforge_rifleman", id = 15441, name = "Ironforge Brigade Rifleman", gender = "male",
  role = "soldier", tier = "service",
  communities = { "ironforge_brigade" }, temper = { "cheerful", "steady" }, values = { "duty", "loyalty" },
  notices = { "faction" },
  impression = {
    first = "A dwarf rifleman cleaning his gun and humming a drinking song.",
    third = "{name} spoke with a rifleman of the Ironforge Brigade.",
  },
  greetings = {
    { id = "g_default", text = "Ho there! Stay behind me when the bugs come. I've good aim, but a short temper." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? Common enemy today. Just don't stand in me sights." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rifleman of the Ironforge Brigade, at yer service. We're here to shoot bugs, and there's no shortage of bugs." } },
      again = { { id = "h_again", text = "Aye? What is it?" } },
      choices = {
        { text = "How are the silithid to fight?", next = "fight" },
        { text = "Do you miss Ironforge?", next = "home" },
        { text = "Good hunting.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Hard shells, and they come in swarms. Ye aim for the joints and pray ye've enough powder. The big ones, ye just run." } },
      choices = {
        { text = "A good soldier holds the line.", next = "BACK", reply = "Aye, and a live one fights tomorrow.", fx = { align = { order = 1 } } },
        { text = "Running's wisdom when you're outnumbered.", next = "BACK", reply = "Now ye're talkin' sense.", fx = { align = { order = -1 } } },
      },
    },
    home = {
      lines = { { id = "h2_default", text = "Every day. Proper ale, proper stone, and snow instead of sand. When this is done I'm going straight to the Stonefire Tavern." } },
      choices = { { text = "I'll buy you a round. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask the sergeant, lad." } },
  },
}
