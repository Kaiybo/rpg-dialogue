-- The two faction camps in the desert: the Ironforge Brigade outside Hive'Zora (Marshal Bluewall, Captain Blackanvil,
-- Janela Stouthammer) and the Orgrimmar Legion near Hive'Regal (General Kirika).
-- Voice: bibles/war_camps.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Marshal Bluewall
---------------------------------------------------------------------------
P:NPC {
  key = "bluewall", id = TODO_NPC("Marshal Bluewall"), name = "Marshal Bluewall",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "gruff", "brisk" }, values = { "duty", "loyal" },
  notices = { "pvp" },

  impression = {
    first = "The Horde's head start is a debt he means to collect.",
    third = "{name} met Marshal Bluewall, the dwarf marshal running the Alliance's silithyst effort in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "Another recruit! Good, the Alliance needs every able body, and the desert's been eating them." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more sand? Good {g:lad|lass}, there's always more silithyst out there." },
    { id = "g_scour", when = { questActive = TODO_QUEST("Scouring the Desert") }, text = "Find the silithyst, carry it to the extractor, and don't let a Horde scout take it off you on the way." },
  },

  notice = {
    { id = "n_pvp", cat = "pvp", when = { honorKills = { min = 100 } },
      text = "You've the look of someone who's fought the Horde and won more often than not. Good, because out there they'll want your silithyst more than they want your life." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marshal Bluewall, Ironforge Brigade. The Horde started gathering silithyst out here well before we did, and they get steady reinforcements from the north, so every crystal we bring in counts double." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Scouring the Desert"), days = 1 } },
          text = "Thank the Light you made it back! If we'd only started this sooner our need wouldn't be so desperate, but every crystal you bring in is one the Horde doesn't get." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You've a nerve walking into a Brigade camp wearing those colors. Say your piece and be off, before one of my riflemen decides you're a target." },
      },
      again = {
        { id = "h_again", text = "What else? The extractor doesn't fill itself." },
        { id = "h_again2", text = "Speak up. The wind's loud out here." },
      },
      choices = {
        { text = "What is silithyst?", next = "silithyst" },
        { text = "How did the Horde get ahead?", next = "late" },
        { text = "What happens to the silithyst we gather?", next = "extractor" },
        { text = "Who serves under you here?", next = "camp" },
        { text = "Ironforge should have sent more soldiers sooner.", next = "late", when = { race = "Dwarf" } },
        { text = "How do you keep morale up out here?", next = "morale" },
        { text = "What do you think of the Cenarion Circle's rules?", next = "circle" },
        { text = "Back to the desert, then.", next = "END" },
      },
    },
    silithyst = {
      lines = { { id = "si_default", text = "Crystals that grow in the sand where the old magic runs close to the surface. Nobody's quite sure what it all does yet, but the Horde wants it badly, and that tells me we want it too." } },
      choices = {
        { text = "That's your whole reason?", next = "silithyst_reason" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithyst_reason = {
      big = true,
      lines = { { id = "sr_default", text = "It's reason enough in a war, recruit. Whatever the Horde gathers, they'll use against us, and if it turns out the crystals are worthless, then we've wasted some sweat and they've wasted a good deal more." } },
      choices = {
        { text = "Then we gather it all. Deny them everything.", next = "BACK", reply = "Aye, that's the spirit, recruit, every crystal in our sacks is one they'll never carry home, so get out there and fill yours.", fx = { align = { order = 1 } } },
        { text = "Fighting over crystals nobody understands is folly.", next = "BACK", reply = "Folly or not, the Horde's out there gathering, and I'll not be the dwarf who sat on his hands while they stripped the dunes bare.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    late = {
      lines = { { id = "la_default", text = "We paid them no mind, that's how. We thought the desert wasn't worth a big garrison, and while we thought it, they were digging. By the time the reports reached Ironforge, they'd had a season's start on us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    extractor = {
      lines = { { id = "ex_default", text = "It goes into the extractor here at the camp, and then north, where cleverer heads than mine can argue about it. I'm not paid to be clever, only to make sure there's more of it in our pile than in theirs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "ca_default", text = "Captain Blackanvil keeps the field duty soldiers in line, and Janela Stouthammer keeps them armed, and she's the one you want to please if you ever need a new blade. The rest are riflemen and footmen, and they're all short on water and patience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    morale = {
      lines = { { id = "mr_default", text = "With ale when we have it and shouting when we don't. A dwarf in the desert is a miserable creature, recruit, and the only cure I know is to give him something to do and someone to beat. The silithyst gives him the first, and the Horde gives him the second." } },
      choices = {
        { text = "Does the ale ever arrive?", next = "morale2" },
        { text = "Shouting seems to come easily to you.", next = "morale2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morale2 = {
      lines = { { id = "mr2_default", text = "Once a month, by way of Gadgetzan, at goblin prices, and it's warm as bathwater by the time it gets here. The lads drink it anyway and sing about Ironforge, and for an evening they forget the bugs. That's worth every copper the goblins charge." } },
      choices = {
        { text = "I'm a dwarf. I'll bring a barrel next time.", next = "morale3", when = { race = "Dwarf" } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    morale3 = {
      lines = { { id = "mr3_default", text = "Then you'll be the most popular dwarf in Silithus, and I'll see you promoted on the spot. Make it Thunderbrew, if you can. The lads have opinions about the Southshore stuff." } },
      choices = { { text = "Thunderbrew it is. Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "cr_default", text = "The druids want the Hold kept neutral, and they want the hives watched, and they want both of us to stop fighting over crystals long enough to look at the wall. I'll keep the peace inside their walls. Outside, the desert belongs to whoever carries the most." } },
      choices = {
        { text = "Do you think they're right about the wall?", next = "circle2" },
        { text = "The Circle's asking for a lot.", next = "circle2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle2 = {
      lines = { { id = "cr2_default", text = "I think they know more than they're telling, and that's never comforted a soldier. Commander Mar'alith walks the walls of the Hold every night, staring south, and a man doesn't do that unless he's expecting company." } },
      choices = { { text = "Unwelcome company. Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Silithyst, the Horde's camps, and how far behind we are." } },
    silithid_hives = { { id = "tp_hives", text = "Hive'Zora's right on our doorstep. We don't sleep much." } },
    _none = { { id = "tp_none", text = "Not my concern, recruit. Silithyst is my concern." } },
  },
}

---------------------------------------------------------------------------
-- Captain Blackanvil
---------------------------------------------------------------------------
P:NPC {
  key = "blackanvil", id = TODO_NPC("Captain Blackanvil"), name = "Captain Blackanvil", title = "Ironforge Brigade Captain",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "gruff", "jovial" }, values = { "duty", "brave" },
  notices = { "dwarf" , "class" },

  impression = {
    first = "He likes to make newcomers sweat before he signs their papers.",
    third = "{name} met Captain Blackanvil, the dwarf captain of the Ironforge Brigade in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "Another of Kaldon's strays! Come on, then, let's see if you're good for anything." },
    { id = "g_duty", when = { questActive = TODO_QUEST("Field Duty") }, text = "You'll want your papers signed, aye? Do some proper work at the hive first, and then we'll talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Kaldon must like you, or he's run out of better ones." },
  },

  notice = {
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf! Thank the Titans, someone who'll understand me when I swear. Where's your clan from, then?" },
    { id = "n_b1", cat = "class", when = { class = "WARRIOR" },
      text = "Now that's an arm that's swung something heavier than a quill. I could use a dozen like ye on the north picket." },
    { id = "n_b2", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Rifleman Torrig swears the big ones have a soft spot behind the head, so shoot there and tell me if he's lying." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Blackanvil of the Ironforge Brigade, and this is my camp, with the biggest bug nest in Silithus right over that hill. Windcaller Kaldon sends me his fresh recruits for field duty, and I send most of them back to him with sunburn and stories." },
        { id = "h_papers", when = { questActive = TODO_QUEST("Field Duty") },
          text = "Aye, I suppose that little skirmish will pass as field duty nowadays. Take these papers back to Cenarion Hold, and I'm sure they'll have a cushy job ready for you, though don't hold your breath." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're in the wrong camp, friend. The Orgrimmar Legion's down south by Hive'Regal, and Kaldon keeps us apart for good reason." },
      },
      again = { { id = "h_again", text = "Anything else? I've a camp full of thirsty soldiers to shout at." },
        { id = "h_again_b1", text = "What now? Speak up, the hive drowns out half of what anyone says." },
        { id = "h_again_b2", text = "Go on, then. The bugs aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "What does field duty actually involve?", next = "duty" },
        { text = "Why is the Ironforge Brigade here?", next = "why" },
        { text = "What's Hive'Zora like up close?", next = "hive" },
        { text = "What do you think of the Circle?", next = "circle" },
        { text = "Which clan are you from, Captain?", next = "clan", when = { race = "Dwarf" } },
        { text = "Your soldiers look worn thin, Captain.", next = "lads" },
        { text = "There's no ale anywhere in this camp.", next = "ale" },
        { text = "Where do you want me on the line?", next = "line", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" } },
        { text = "I'll get to work.", next = "END" },
      },
    },
    duty = {
      lines = { { id = "du_default", text = "Kill bugs. Carry crates. Patch up the lads who got bit. Do enough of that and I'll sign your papers, and then you go back to Kaldon and he gives you briefings, and then you come back here and do the same thing with more paperwork." } },
      choices = {
        { text = "That sounds like most wars.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because King Magni has an eye on Kalimdor, and because somebody had to stand between the hives and the Circle's druids, who are brave enough but can't hold a shield wall to save their lives. Half our supplies sank on the way over, mind, so we're making do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hive = {
      lines = { { id = "hi_default", text = "Loud. Like a forge full of beetles, all day and all night, and every so often the ground shakes and something big comes out to see who's knocking. We knock anyway, because if we stop, the hive starts knocking on us." } },
      choices = {
        { text = "What comes out?", next = "hive_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hive_what = {
      big = true,
      lines = { { id = "hw_default", text = "Drones, soldiers, things with too many legs and no names yet. I lost two good footmen last week to something I never saw clearly. The druids want us to leave the hives alone until they understand them, and I'd like to understand them from the far side of a cannon." } },
      choices = {
        { text = "Burn the hive out before it grows.", next = "BACK", reply = "By my beard, I'd like nothing better, and if the druids ever turn their backs for a day, I'll have the torches lit before supper.", fx = { align = { order = -1 } } },
        { text = "Hold the line and wait for the Circle's word.", next = "BACK", reply = "Aye, that's the sensible answer, and I'll hold it, though it galls me tae sit still while those things breed under our boots.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "Odd folk, all leaves and patience, but they're the reason anyone's alive in this desert at all. Kaldon's a good sort, for a night elf, and he's the only one who ever sends me enough water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clan = {
      lines = { { id = "cl_default", text = "Blackanvils of the eastern Dun Morogh hills, smiths and soldiers both, though I was always better at the soldiering. My old da still thinks I'm stationed somewhere with snow, and I've not had the heart to tell him otherwise." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    lads = {
      lines = {
        { id = "b_lads_default", text = "Aye, they are, and I'll not hear a word against them for it. They marched from Ironforge to the far end of the world, lost half their kit on the way, and they've held this ridge every night since." },
      },
      choices = {
        { text = "How do you keep their spirits up?", next = "lads_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lads_spirits = {
      lines = {
        { id = "b_lads_spirits_default", text = "I shout at them, mostly, and I let them shout back when they've earned it. Janela sees they're fed and armed, and between her ledger and my lungs the Brigade's still standing." },
      },
      choices = {
        { text = "She sounds worth her weight in thorium.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale = {
      lines = {
        { id = "b_ale_default", text = "Don't remind me! The last barrels went into the sea off Tanaris with the rest of the supplies, and the Circle's druids drink water and some sort of tea made of leaves." },
      },
      choices = {
        { text = "That's a hard campaign for a dwarf.", next = "ale_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale_hard = {
      lines = {
        { id = "b_ale_hard_default", text = "Hardest I've ever fought, and I've fought troggs in the dark with a broken lantern. I've promised the lads a full keg apiece when we're home, and I'll be paying that debt out of my own pocket till I'm grey." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    line = {
      lines = {
        { id = "b_line_default", text = "North picket, where the ground drops toward Hive'Zora and the drones come up at dusk. Stand with the footmen, keep your shield high, and don't chase anything back into the tunnels, however slow it looks." },
      },
      choices = {
        { text = "Why not chase them?", next = "line_chase" },
        { text = "Something else.", next = "BACK" },
      },
    },
    line_chase = {
      lines = {
        { id = "b_line_chase_default", text = "Because the slow one's bait, {g:lad|lass}, and its friends are waiting just inside the dark. I learned that the way every captain learns it, and I'd rather ye didn't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Field duty, the Brigade, and the beetles over the hill." } },
    magni = { { id = "tp_b_magni", text = "The King sent us himself, and he'd have come along if the Senate had let him. I write him the truth, even when the truth is ugly." } },
    cenarion_circle = { { id = "tp_b_cenarion_circle", text = "Odd folk, but they knew these bugs were coming before anyone else did. I've learned to listen when a druid looks worried." } },
    silithid = { { id = "tp_b_silithid", text = "Nasty, clever, and there's always more of them. Hit the big ones behind the head, and don't stand downwind of the ones that spit." } },
    _none = { { id = "tp_none", text = "Ask Kaldon. He's the clever one." } },
  },
}

---------------------------------------------------------------------------
-- Janela Stouthammer
---------------------------------------------------------------------------
P:NPC {
  key = "janela", id = TODO_NPC("Janela Stouthammer"), name = "Janela Stouthammer",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "brisk", "warm" }, values = { "practical", "duty" },
  notices = { "smith", "paladin" , "class" },

  impression = {
    first = "She is tired of hearing about dull swords.",
    third = "{name} met Janela Stouthammer, the dwarf lieutenant who keeps the Ironforge Brigade supplied in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "If you've brought weapons, you're my new favorite. If you've brought complaints, join the queue." },
    { id = "g_arms", when = { questDone = TODO_QUEST("Arms for the Field") }, text = "My lads haven't said a word about dull blades since your broadswords came in. It's been lovely." },
  },

  notice = {
    { id = "n_smith", cat = "smith", when = { profession = "Blacksmithing" },
      text = "A smith! Please tell me you can make a Moonsteel Broadsword, because half my soldiers are fighting with butter knives." },
    { id = "n_pala", cat = "paladin", when = { class = "PALADIN" },
      text = "Light be with you, sibling. It's good to see another of the Silver Hand out here, even one with sand in their boots." },
    { id = "n_b1", cat = "class", when = { class = "WARRIOR" },
      text = "That blade's been properly looked after. Would you mind showing my lads how it's done, because they treat theirs like shovels." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Janela Stouthammer, Captain Blackanvil's lieutenant. Many of our supplies were lost on the way here, so I spend my days begging the Circle for weapons and armor kits, and my nights listening to soldiers complain about what they've got." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Arms for the Field"), days = 3 } },
          text = "Oh, excellent! Two Moonsteel Broadswords, and properly balanced, too. I won't have to hear complaints about dull blades for at least a week, and I could kiss you for that." },
        { id = "h_kits", when = { questActive = TODO_QUEST("Armor Kits for the Field") },
          text = "Armor kits! You've no idea how many dents a silithid can put in a breastplate. Bring them as soon as you can." },
      },
      again = { { id = "h_again", text = "What else? I've a ledger with too many minus signs in it." },
        { id = "h_again_b1", text = "Anything else? Talk while I count, I'm used to it." },
        { id = "h_again_b2", text = "Go on. The ledger won't balance any quicker for my staring at it." },
      },
      choices = {
        { text = "How did you lose your supplies?", next = "lost" },
        { text = "What does the Brigade need most?", next = "need" },
        { text = "You're of the Silver Hand?", next = "hand" },
        { text = "What's Captain Blackanvil like?", next = "captain" },
        { text = "I serve the Light too. How do you keep faith out here?", next = "hand", when = { class = "PALADIN" } },
        { text = "Your ledger has more red ink than black.", next = "ledger" },
        { text = "Who do you bargain with at the Hold?", next = "bargain" },
        { text = "What would you have a crafter make first?", next = "crafter", when = { profession = { "Blacksmithing", "Leatherworking" } } },
        { text = "I'll leave you to your ledger.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "lo_default", text = "Half of it went down with a ship off the Tanaris coast, and the other half was 'borrowed' by goblins in Gadgetzan who swore blind they'd never seen it. I've stopped asking which half hurts more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    need = {
      lines = { { id = "ne_default", text = "Blades, armor kits, bandages and water, in that order, except on hot days, when it's water first. The Circle sends what it can, and adventurers like you make up the rest, and I write every bit of it down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hand = {
      big = true,
      lines = { { id = "ha_default", text = "I am, though I've not held a proper vigil in months. Out here the Light feels very far away, and some days I think the Silver Hand's place is in the Plaguelands, not guarding beetles in a desert." },
      },
      choices = {
        { text = "The Light is wherever you stand to protect others.", next = "hand_end", fx = { align = { light = 1 } } },
        { text = "Faith won't stop a silithid. Steel will. Focus on steel.", next = "hand_end", fx = { align = { light = -1 } } },
        { text = "Why did you come here, then?", next = "hand_end" },
      },
    },
    hand_end = {
      lines = { { id = "he_default", text = "Because Ironforge asked, and because if these hives spill out, there'll be no Plaguelands left to save. I keep telling myself that, and most days I believe it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    captain = {
      lines = { { id = "cp_default", text = "Loud, brave, and kinder than he wants anyone to know. He calls every fight a skirmish so the young ones don't panic, and then he sits up all night writing letters to the families of the ones who don't come back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ledger = {
      lines = {
        { id = "b_ledger_default", text = "It does, and the red is all sand. Sand in the scabbards, sand in the mail links, sand in the water barrels, and every grain of it wears something down that I then have to replace." },
      },
      choices = {
        { text = "What wears out fastest?", next = "ledger_wear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_wear = {
      lines = {
        { id = "b_ledger_wear_default", text = "Boot leather and sword edges, and after those, tempers. I can requisition the first two, and for the third I have Captain Blackanvil, who is louder than any quarrel." },
      },
      choices = {
        { text = "The Brigade's in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain = {
      lines = {
        { id = "b_bargain_default", text = "Windcaller Kaldon, for anything the Circle can spare, and he's fair about it. For the rest I go cap in hand to Vargus the smith and Zannok the leatherworker, who are kind, and overworked, and tired of the sight of me." },
      },
      choices = {
        { text = "And the goblins?", next = "bargain_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain_goblins = {
      lines = {
        { id = "b_bargain_goblins_default", text = "I've spoken to the Ficklespragg brothers exactly once, and I checked my purse and my rings afterwards. They'd sell me my own lost crates if they could find a way to stencil over the Brigade's mark." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crafter = {
      lines = {
        { id = "b_crafter_default", text = "Armor kits before anything, because a silithid's claw goes through a worn strap as though it weren't there. After that, sharpening stones, and I'll take every one you can carry." },
      },
      choices = {
        { text = "I'll see what I can make.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, the Brigade's needs, and the captain's bad handwriting." } },
    silver_hand = { { id = "tp_sh", text = "I'm a sister of the Hand, though I've not seen Lordaeron in years." } },
    magni = { { id = "tp_b_magni", text = "Ironforge sent us out with the King's blessing and half a supply train. I've made do with the blessing." } },
    holy_light = { { id = "tp_b_holy_light", text = "I say my prayers over the wounded every night, sand or no sand. I can't be certain the Light hears them out here, but the lads do, and that's reason enough." } },
    silithid_hives = { { id = "tp_b_silithid_hives", text = "Hive'Zora's the one over our hill, and it never sleeps. I've stopped counting what comes out of it, because the sum's bad for morale." } },
    _none = { { id = "tp_none", text = "Not in my ledger, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- General Kirika
---------------------------------------------------------------------------
P:NPC {
  key = "kirika", id = TODO_NPC("General Kirika"), name = "General Kirika",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "orgrimmar_legion" }, temper = { "blunt", "fierce" }, values = { "duty", "ambitious" },
  notices = { "pvp", "orc" },

  impression = {
    first = "The desert is her race against the dwarves, and she'll win it.",
    third = "{name} met General Kirika, the orc general running the Horde's silithyst effort in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "You're here. Good. There's no time to waste making small talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The dwarves haven't stopped, so neither do we." },
    { id = "g_scour", when = { questActive = TODO_QUEST("Scouring the Desert") }, text = "The silithyst won't walk to the extractor. Get out there, and kill any dwarf who tries to take it from you." },
  },

  notice = {
    { id = "n_pvp", cat = "pvp", when = { honorKills = { min = 100 } },
      text = "You've blooded yourself against the Alliance, I can see it. Good, because out there it's you or a dwarf, and I want it to be the dwarf." },
    { id = "n_orc", cat = "orc", when = { race = "Orc" },
      text = "An orc, and you've kept your edge. Too many of ours have gone soft in Orgrimmar's streets." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "General Kirika, Orgrimmar Legion. For a long while the only dangers we faced here were the beasts and the heat, but now the Alliance has caught on to what we found in this desert, and it's a race between us. I need every set of hands, and I hope I have yours." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Scouring the Desert"), days = 1 } },
          text = "You've done well. Every crystal goes to our stockpile, and every bit is our gain and the Alliance's loss." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You're Alliance, in my camp. Speak quickly, and then go, before my grunts remember they're bored." },
        { id = "h_dd_field", when = { faction = "Horde", questDone = TODO_QUEST("Field Duty") }, text = "Windcaller Kaldon tells me you've done your field duty and signed his papers, so the Circle counts you as one of the Hold's now. Good, but don't forget whose banner you served under first." },
      },
      again = {
        { id = "h_again", text = "More questions? Fine, but make them short." },
        { id = "h_again2", text = "What else? Speak while you walk." },
      },
      choices = {
        { text = "Why does the Horde want silithyst?", next = "why" },
        { text = "What do you think of the dwarves?", next = "dwarves" },
        { text = "Do you answer to the Circle here?", next = "circle" },
        { text = "How did you become a general?", next = "rank" },
        { text = "For the Horde. I'll get to it.", next = "END", when = { faction = "Horde" } },
        { text = "What about the cult in the north of the desert?", next = "cult" },
        { text = "What happens to the Legion if the Alliance wins the race?", next = "race" },
        { text = "I'm going.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "We tapped this desert's crystals before anyone else thought to look, and the Warchief means to know what they're worth. Whatever they are, they're ours by right of finding, and I won't have the Alliance stealing them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      big = true,
      lines = { { id = "dw_default", text = "Stubborn, well-armed and too many of them, because they get fresh soldiers off every ship. I respect a stubborn enemy. I'd still rather bury one, and some of my grunts say we should hit their camp now, before Kaldon's precious peace gets any older." } },
      choices = {
        { text = "Strike their camp. Take the crystals by force.", next = "dwarves_end", fx = { align = { order = -1 } } },
        { text = "Win the race fairly. Gather faster than they do.", next = "dwarves_end", fx = { align = { order = 1 } } },
        { text = "What will you do?", next = "dwarves_end" },
      },
    },
    dwarves_end = {
      lines = { { id = "de_default", text = "I'll follow the Warchief's orders and the Circle's terms, for now. But I keep my grunts' axes sharp, and the dwarves know it, and that's a kind of peace too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "ci_default", text = "The Circle gives the orders at Cenarion Hold, and Krug Skullsplit takes them, and I take the desert. The druids keep us apart from the dwarves, and I don't mind, because it saves my grunts from being hanged for murder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rank = {
      lines = { { id = "ra_default", text = "By being alive when better orcs weren't, and by learning from each of their deaths. That's how anyone makes general in the Horde, whatever the songs say." } },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", text = "Twilight's Hammer, robed fools who want the world to end and think the desert will help them do it. They camp in the north and the west, and they kill anyone who wanders close. I'd burn them out if I had the grunts, but the silithyst comes first." } },
      choices = {
        { text = "The Circle seems more worried about them than you are.", next = "cult2" },
        { text = "Fools with blades can still kill.", next = "cult2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      lines = { { id = "cu2_default", text = "The Circle worries about everything, which is its job. The cult worries me when it comes close enough to touch, and so far my grunts have kept it at a spear's length. If they ever march on the Hold, the Legion will be there, whatever the druids think of us." } },
      choices = {
        { text = "Krug Skullsplit at the Hold. Does he answer to you?", next = "cult3" },
        { text = "Good to know. Something else.", next = "BACK" },
      },
    },
    cult3 = {
      lines = { { id = "cu3_default", text = "Krug answers to the Circle while he stands in the Hold, and to the Legion when he walks out of it, and he knows the difference better than I do. He keeps the druids happy so that I don't have to. Every general should have one Krug." } },
      choices = { { text = "Every general should. Something else.", next = "BACK" } },
    },
    race = {
      lines = { { id = "rc_default", text = "Then I go back to Orgrimmar and explain to the Warchief why a camp of dwarves beat the Legion at its own game. I'd sooner die in the sand. So we won't lose, because I won't let us." } },
      choices = {
        { text = "That's a lot of weight on one general.", next = "race2" },
        { text = "Determination doesn't carry crystals.", next = "race2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race2 = {
      lines = { { id = "rc2_default", text = "No, but it puts the crystals in the grunts' hands and keeps them walking when the heat says stop. That's what a general is for. The weight's mine, and I carry it, and the grunts carry the rest." } },
      choices = {
        { text = "I'm Horde. I'll carry my share.", next = "BACK", reply = "Then stop talking to me and carry it. Lok'tar.", when = { faction = "Horde" } },
        { text = "Something else, General.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Silithyst, the Legion, and the dwarves' weak points." } },
    silithid_hives = { { id = "tp_hives", text = "Hive'Regal is ours to watch. It hasn't come out in force yet." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Back to work." } },
  },
}
