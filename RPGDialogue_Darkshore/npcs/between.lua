-- Darkshore between the towns (0.38.0): Bashal'Aran, the Grove of the Ancients, Remtravel's dig, and two druids in trouble in the wilds. Voice: bibles/auberdine.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "asterion", id = TODO_NPC("Asterion"), name = "Asterion", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "bashal_aran" }, temper = { "weary" }, values = { "dutiful", "wise" },
  impression = {
    first = "Asterion keeps a lonely watch over the ruins of Bashal'Aran, where satyrs pick through what his people left behind. He talks about the old city as if he can still hear it.",
    third = "{name} met Asterion, the druid who watches over the ruins of Bashal'Aran.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly here, traveller, for Bashal'Aran was a city once, and the satyrs have not left it in peace." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the ruins, which few people choose to do. Sit a while, if the satyrs allow it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You can, by breaking every satyr you find among the stones and taking back whatever they have dug up. They are cowards in the open and vicious in the dark, so fight them where the moon can see them." } },
      choices = {
        { text = "I'll drive them out and leave the stones in peace.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever they dug up is mine. Spoils of war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In the cellars of the old houses and among the fallen pillars on the eastern side, where they think I cannot see. Follow the hoof marks in the soft ground at dusk, because that is when they come out to dig." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will smell them before you see them, so let it lead. Satyrs hate beasts that hunt them, which is the best reason I know to bring one." },
      },
      choices = {
        { text = "I'll root them out of the cellars, face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pick them off from the pillars as they dig.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Too much, and not nearly enough to tempt a mortal like you, I hope. The Highborne who lived here poured their arcane into every stone, and the Deth'ryll satyrs are what comes of that hunger in the end." },
      },
      choices = {
        { text = "Then I'll help you see it sealed away.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge shouldn't be left to satyrs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What was the city like?", next = "city" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Deal with them by the blade, or deal with them by bargain? I have watched the satyrs whisper to every traveler who comes too close, and I would not trust one of your trade not to listen." },
      },
      choices = {
        { text = "I'll kill them, and listen to nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "There's knowledge in their whispers, if you're careful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do the satyrs want?", next = "satyrs" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Old sorrow, and old magic that the Deth'ryll want badly, which tells you it is not the kind of magic anyone should have. Pray over these stones, if you would, in whatever name you pray." } },
      choices = {
        { text = "I'll pray over the stones. Your people deserve peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stones don't need prayer. The satyrs need killing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Destroyed, if you ask me, for the Deth'ryll will not leave while there is anything left to dig up. But you serve your own vows, and I would not ask you to break them for me." } },
      choices = {
        { text = "They'll be driven out, and the ruins left in peace.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll be destroyed, every one of them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Asterion, and I watch over what is left of Bashal'Aran. The Deth'ryll satyrs crawl through these stones looking for old magic, and I mean to see that they find none of it." },
        { id = "h_cond", when = { race = "NightElf" }, text = "You're one of the Kaldorei, so you'll feel it too, I think, the old sorrow in these stones. Our people built this place before the sea took so much of the shore." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Deth'ryll satyrs would scatter if enough of your kind came to Bashal'Aran, and I would be glad to see it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The satyrs of Bashal'Aran leave tracks like goats and a stink like the Legion, and you will know them when you find them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Then perhaps you can feel what lingers in Bashal'Aran, for I have felt it every night since the satyrs came." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, here at Bashal'Aran. I did not think to see one of your order among our ruins, but I will not refuse the help." },
      },
      again = {
        { id = "h_again1", text = "What else would you know about the ruins?" },
        { id = "h_again2", text = "Ask, then, while the satyrs are quiet." },
      },
      choices = {
        { text = "What do the satyrs want here?", next = "satyrs" },
        { text = "What was Bashal'Aran?", next = "city" },
        { text = "Do you send word to Auberdine?", next = "neighbors" },
        { text = "You're a druid, as I am. How do you bear it here?", next = "druid", when = { class = "DRUID" } },
        { text = "What magic is left in Bashal'Aran?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can I help you drive the satyrs from Bashal'Aran?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the satyrs hide in the ruins, Asterion?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Satyrs are demon-touched. I can deal with their kind.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What lingers in these ruins, Asterion?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the satyrs be driven out, or destroyed?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    satyrs = {
      lines = {
        { id = "satyrs_default", text = "They want whatever magic the Highborne left behind, for they were Highborne once themselves, before the Legion twisted them. I've asked travellers to take the horns from the Deth'ryll and bring me the old relics they steal." },
      },
      choices = {
        { text = "Why do they keep coming back?", next = "satyrs2" },
      },
    },
    satyrs2 = {
      lines = {
        { id = "satyrs2_default", text = "Because it calls to them, and I think it always will, the way a drunkard hears a tavern door. Some say we should forgive them their shape, and some say we should finish what the war began." },
      },
      choices = {
        { text = "Whatever they were, they chose this. Drive them out.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "They were our people once. Pity them, at least.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Let them dig. Dead cities are no one's business.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    city = {
      lines = {
        { id = "city_default", text = "A city of the Kaldorei, from the days before the Sundering, and later a quiet place where my people kept their histories. Now it is broken stones and old moonlight, and I am all that's left to mind it." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    neighbors = {
      lines = {
        { id = "neighbors_default", text = "When I can, yes, though Auberdine has troubles enough with the bears and the furbolgs. Tharnariun and I were students together once, and he still sends me a bottle of something on the boat days." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "druid_default", text = "By listening to the trees instead of the stones, mostly. The ruins grieve, but the forest around them is still young and stubborn, and a druid can lean on that when the nights are long." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a druid who stayed where others left, and I watch the old city because someone should." } },
    _none = { { id = "tp_none", text = "I've no answer for that, I'm afraid; the ruins keep their own counsel and so do I." } },
  },
}

P:NPC {
  key = "remtravel", id = TODO_NPC("Prospector Remtravel"), name = "Prospector Remtravel", title = "Explorers' League",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "remtravel_dig" }, temper = { "scatterbrained" }, values = { "curious", "proud" },
  impression = {
    first = "Prospector Remtravel is a dwarf of the Explorers' League who loses his notes, his tools and occasionally himself. He is cheerful about all of it.",
    third = "{name} met Prospector Remtravel, an absent-minded dwarf digging in southern Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Mind the trench, lad, I've only just dug it and I'd hate to lose another one in there." },
    { id = "g_back", when = { metBefore = true }, text = "I know your face, I'm nearly sure of it, which puts you ahead of half my notes!" },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than a pint o' Thunderbrew, {g:lad|lass}, for they come up from the shore every time I find somethin' worth keepin'. Stand at the trench while I dig, an' I'll put your name in my report tae the League, spelled right an' all." } },
      choices = {
        { text = "I'll stand guard. The League's work matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll guard you for a share of the finds.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Great things, {g:lad|lass}, wi' teeth like spades an' bones as thick as my arm, an' not one o' them left alive tae hunt. A hunter's eye could tell me how they moved from the bones alone, an' that'd be worth a chapter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' your {pet} is sniffin' at my trench, which is grand, because if there's a bone down there it'll find it before I do. Just don't let it bury the thing again." },
      },
      choices = {
        { text = "Let the old beasts rest. Some ground should stay undug.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dig them all up. The past belongs to the living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Anyone could, but who'd want old elven pots an' half a fossil? The elves, that's who, an' they're no' happy wi' a dwarf diggin' up their ancestors as it is." },
      },
      choices = {
        { text = "I'll keep an eye on it for you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pots sell, Prospector. Mind your back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What are you digging for?", next = "dig" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Wards! So that's what gives me a nasty jolt every time I lift a stone. If ye can tell me which ones are safe tae shift, I'll stop losin' diggers tae their nerves." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Wards! A gnome would know, an' that'll be what gives me a nasty jolt every time I lift a stone. Tell me which ones are safe tae shift, an' I'll stop losin' diggers tae their nerves." },
      },
      choices = {
        { text = "I'll mark the dangerous ones carefully.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's break one and see what happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is the dig dangerous?", next = "danger" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, it's nothing, probably, though it's gone a colour I don't much like. Mind you, the murlocs on the beach bite harder than anything in the ruins, so I'll keep digging and hope for the best." } },
      choices = {
        { text = "Hold still. I'll tend it now, before it worsens.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you say it's nothing, I'll take your word.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Leave them? Never, friend, for the League's job is to learn what's buried before somebody worse finds it first. I'll be respectful, mind, and the elves have had ten thousand years to complain." } },
      choices = {
        { text = "The past should be studied with care and respect.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dig what you like. The dead won't miss it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Remtravel's the name, prospector for the Explorers' League, and these old elven ruins are the finest dig I've had in years. If only I could remember where I left the bloody fossil." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf, out here! Tell me you're from Ironforge and you've brought a proper pickaxe, because the elves don't make a tool worth swinging." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Grand, because the murlocs keep chasin' me off my own dig, an' I've had enough o' runnin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll have a good eye, then, an' I've lost a fossil the size o' my head somewhere about here." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Grand, grand, because I've a nasty feeling I've been bitten by something, and I can't remember what." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now that's a proper sight for an old prospector, and you'll forgive me if I ask you to watch my back while I dig." },
      },
      again = {
        { id = "h_again1", text = "Now, where was I? Ah, yes, you were asking something." },
        { id = "h_again2", text = "Carry on, carry on, I'm listening with at least one ear, which is more than Gorbold gets." },
      },
      choices = {
        { text = "What are you digging for?", next = "dig" },
        { text = "What does the Explorers' League want with Darkshore?", next = "league" },
        { text = "Isn't it dangerous out here alone?", next = "danger" },
        { text = "I'm from Ironforge, and I brought a pick.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Your dig's wide open. Anyone could walk off with your finds.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Elven ruins like these are full of old wards.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you want the murlocs kept off your dig, Prospector?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What beasts once walked this shore, Prospector?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you want me to look at that bite, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shouldn't you leave these elven ruins alone, Prospector?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good luck with the digging.", next = "END" },
      },
    },
    dig = {
      lines = {
        { id = "dig_default", text = "Bones, lad, old ones, from beasts that walked this shore before the elves ever did. Gorbold back in Auberdine thinks I've gone soft in the head, but the League pays for curiosity, not common sense." },
      },
      choices = {
        { text = "Did you find anything?", next = "dig2" },
      },
    },
    dig2 = {
      lines = {
        { id = "dig2_default", text = "I found a fossil the size of my head and then the murlocs chased me off and I can't think where I put it down. The elves say these ruins are holy and I ought to leave them be, but bones belong in a museum, don't they?" },
      },
      choices = {
        { text = "Knowledge belongs to everyone. Dig away.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "If the elves call it holy, ask their leave first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    league = {
      lines = {
        { id = "league_default", text = "The whole history of the world, lad, and Darkshore has more of it lying about than most. Brann Bronzebeard himself would give his beard to see this coast, though don't tell him I said so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_default", text = "Dangerous? Oh, terribly, what with the murlocs and the Blackwood furbolgs and the gnolls of the hills. But I've a stout hat and a good sense of direction, which is more than most of my colleagues can say, mind." },
      },
      choices = {
        { text = "If you say so.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dwarf_default", text = "Bless your beard! Then you'll know the Hall of Explorers smells of old paper and older ale, and you'll forgive a fellow for missing it out here among all these trees." },
      },
      choices = {
        { text = "I do miss it. What else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Explorers' League, thirty years in the field, and only lost twice, whatever Gorbold tells you." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, lad. I can barely tell you where I left my lunch." } },
  },
}

P:NPC {
  key = "onu", id = TODO_NPC("Onu"), name = "Onu", title = "Ancient of Lore",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "grove_of_ancients" }, temper = { "slow" }, values = { "wise", "protective" },
  impression = {
    first = "Onu is an Ancient of Lore at the Grove of the Ancients, old as the forest and slow to speak. Each word he says seems to have been weighed for a season first.",
    third = "{name} met Onu, the Ancient of Lore who guards the Grove of the Ancients in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Young one, you walk quickly, as all your kind do. Stand a while and let the grove see you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the grove remembers your footsteps. That is no small thing, for it forgets most visitors." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There is something there that was not there a season ago, and it gathers others to it in the dark. When it is ready it will come north, and the grove will need roots that hold and blades that do not break." } },
      choices = {
        { text = "I'll wait, and hold when it comes north.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go to the Glaive and strike first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The healthy ones do, and they come to sleep in our shade as they always have. The sick ones no longer know us, and that is a grief I have not felt since the trees here were saplings." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is healthy and unafraid of me, which is good to see. Bring it to the grove whenever you pass, and let it rest among the roots." },
      },
      choices = {
        { text = "I'll seek a cure for them, not a quick death.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A quick death is the only mercy left them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "It has stood in that earth longer than your kingdom has had a name, and the land around it remembers violence. Your kind is curious about such things, I know, but the Glaive is not for curious hands." },
      },
      choices = {
        { text = "I'll leave it be, Ancient.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something that old should be understood.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What stirs at the Glaive?", next = "glaive" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "You could, and I think whatever stirs there would welcome you, which is why I do not want you near it. The Twilight cultists gather at the Glaive, and they would find one of your kind very useful." },
      },
      choices = {
        { text = "Then I'll go and burn them out.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Perhaps they'd tell me something worth knowing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who keeps the grove with you?", next = "grove" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A sickness that walks up from the south, from the Master's Glaive, where something waits that I cannot name. The trees feel it in their roots, and so do I, and I would have you pray against it before it reaches us." } },
      choices = {
        { text = "I'll pray for the grove and its roots.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees can't be healed by prayer, Onu.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Patience, which is hard for the young, and strength, which comes easier. Strike at what threatens the grove, but do not strike in haste, for a hasty blow in this forest often falls on the wrong thing." } },
      choices = {
        { text = "I'll be patient, and strike only when I'm sure.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting lets evil grow. I'll strike first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Onu, and I have kept this grove since the trees here were saplings. Something stirs at the Master's Glaive to the south, where the old blade fell, and I do not like the shape of it." },
        { id = "h_cond", when = { class = "DRUID" }, text = "Ah, a druid walks in my grove, and I hear the Cenarion Circle in the way you step. Malfurion's children are always welcome among the Ancients." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The trees of this grove have watched many like you pass, and fewer return." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The beasts of Darkshore have grown sick, and the grove feels it in its roots." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest stands in the grove. The Light, or Elune, it matters little to the trees, so long as what you carry is gentle." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your kind are young, as the forest counts years, but your vows are old enough to be worth something." },
      },
      again = {
        { id = "h_again1", text = "Speak, young one, I am listening." },
        { id = "h_again2", text = "The grove waits. What else do you wish to know?" },
      },
      choices = {
        { text = "What is the Master's Glaive?", next = "glaive" },
        { text = "Who are the other Ancients here?", next = "grove" },
        { text = "How old are you, Onu?", next = "time" },
        { text = "The Circle sends its respects, Ancient.", next = "druidq", when = { class = "DRUID" } },
        { text = "The Master's Glaive must have been forged with great power.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there a fight waiting at the Master's Glaive, Onu?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the beasts of the grove still trust the Ancients?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Whatever stirs at the Glaive, I could find out.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What troubles the grove, Ancient One?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you ask of a paladin, Ancient One?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I will leave you in peace.", next = "END" },
      },
    },
    glaive = {
      lines = {
        { id = "glaive_default", text = "A great blade that fell from the sky in the war against the Legion, and it lies in the earth still, far to the south of here. Now men in dark robes gather around it, the Twilight's Hammer, and they whisper to things that should stay sleeping." },
      },
      choices = {
        { text = "What would you have done about them?", next = "glaive2" },
      },
    },
    glaive2 = {
      lines = {
        { id = "glaive2_default", text = "I am too old and too rooted to walk there, so I ask the young ones to go for me. Some would scatter the cult and let them run, and some would end them before the whispering spreads." },
      },
      choices = {
        { text = "Scatter them. They're people, however lost.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "End them, before whatever they call answers.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    grove = {
      lines = {
        { id = "grove_default", text = "Old friends, who sleep more than they speak, as I will someday. We remember the forest as it was before the Sundering, and we keep that memory so the young trees have something to grow toward." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    time = {
      lines = {
        { id = "time_default", text = "Older than the shore you walked to reach me, little one. I remember when this coast was a hill above a city, before the sea came in and took it." },
      },
      choices = {
        { text = "That's older than I can picture.", next = "BACK" },
      },
    },
    druidq = {
      lines = {
        { id = "druidq_default", text = "Then carry mine back to Moonglade, and tell Remulos that Onu still stands. A message from an Ancient is slow, but it arrives." },
      },
      choices = {
        { text = "I will. May I ask something else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am an Ancient of Lore, and the memory of this forest lives in my roots." } },
    _none = { { id = "tp_none", text = "That is a question for younger minds than mine, little one, and for quicker ones." } },
  },
}

P:NPC {
  key = "volcor", id = TODO_NPC("Volcor"), name = "Volcor", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "hunted" }, values = { "brave", "protective" },
  impression = {
    first = "Volcor is a night elf hiding from the furbolgs of the Blackwood, who have gone mad and turned on everyone. He is hurt and short of patience, but not of courage.",
    third = "{name} met Volcor, a night elf trapped by the maddened Blackwood furbolgs in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Quiet, friend, please! The Blackwood are just outside, and they'll hear us if we talk above a whisper." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and you weren't followed, I hope. Good, then we can speak." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many to count when they're all howling, but they come in twos and threes along the path, if we're quick. Stay in front of me and don't stop to finish the stragglers, because the road is what matters." } },
      choices = {
        { text = "I'll stay in front and keep you safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll finish every one. No stragglers behind us.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "On the high ground, mostly, with their scouts on the trails that lead toward the road. If we keep low and move between their patrols we might slip past, and your bow can deal with the rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will hear them before we do, so keep it close and watch its ears. I'd trust a beast's warning over my own right now." },
      },
      choices = {
        { text = "We go quietly and spare what we can.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "We go fast, and anything in our way dies.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Quickly, then, because the Blackwood patrol this ground and they won't wait for a priest to finish. Mend what you can and I'll manage the rest, as I have been." } },
      choices = {
        { text = "I won't leave you hurt. Hold still.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We've no time. Walk on it until we're clear.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone in front of me and nothing behind, and that is all I ask. The furbolgs were friends once, so I take no pleasure in it, but I will not die in this cave for their sake." } },
      choices = {
        { text = "I'll guard you all the way, whatever comes.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep up, and I'll do what I can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "My name is Volcor, and I was taken by the Blackwood furbolgs when they turned on us. I need to reach the road and get word to Auberdine, but I can't fight my way past them alone." },
        { id = "h_cond", when = { class = "ROGUE" }, text = "You move like someone who knows how to go unseen, which may be just what I need. There's more than one way out of this den." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Thank Elune, because I can't fight my way past the Blackwood alone, and you look as though you could." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know the paths through the Blackwood better than I do now, since mine ended in a cage." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Then you can look at this leg once we're out of here, because I've been walking on it longer than I should." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'll be glad of that hammer between me and the furbolgs, though I hope you can keep pace with a limping elf." },
      },
      again = {
        { id = "h_again1", text = "Speak quickly, they patrol often." },
        { id = "h_again2", text = "What else? Keep your voice low." },
      },
      choices = {
        { text = "How do we get you out?", next = "escape" },
        { text = "Why did the Blackwood turn on you?", next = "furbolg" },
        { text = "Who's waiting for you in Auberdine?", next = "others" },
        { text = "I can get us both out unseen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Let me see to your wounds before we move, Volcor.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll see you safe to the road, Volcor. What do you need?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll come back for you.", next = "END" },
        { text = "How many furbolgs stand between us and the road?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the Blackwood furbolgs keep their watch?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
      },
    },
    escape = {
      lines = {
        { id = "escape_default", text = "We can fight our way through the camp, or we can slip around it while they sleep, and either way I need you at my side. I'd sooner do it by force, but I'll trust your judgement." },
      },
      choices = {
        { text = "Why would you rather fight?", next = "escape2" },
      },
    },
    escape2 = {
      lines = {
        { id = "escape2_default", text = "Because they killed two of my friends in front of me, and some part of me wants them to pay. The other part knows they're sick, not wicked, and that something has been poisoning their minds." },
      },
      choices = {
        { text = "We go quietly. Revenge can wait.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "They've earned a fight. We go through them.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    furbolg = {
      lines = {
        { id = "furbolg_default", text = "They were friendly once, and traded with us for years, but this season they grew wild and red-eyed. They've been drinking or eating something foul, and I'd wager the satyrs had a hand in it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Sentinels I've served beside, and a sister who'll box my ears for getting caught. Tell Thundris Windweaver what's happening up here, whatever becomes of me." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rogue_default", text = "Then you'll lead and I'll follow, and Elune keep us both out of their noses. I've never been gladder to meet someone who sneaks for a living." },
      },
      choices = {
        { text = "Before that, something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a scout of Auberdine, or I was, before the Blackwood took me." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to wonder about it just now." } },
  },
}

P:NPC {
  key = "kerlonian", id = TODO_NPC("Kerlonian Evershade"), name = "Kerlonian Evershade", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "drowsy" }, values = { "kind", "foolish" },
  impression = {
    first = "Kerlonian Evershade is a druid who fell into the Emerald Dream and keeps falling back into it. He is sweet-natured and embarrassed by it, when he is awake.",
    third = "{name} met Kerlonian Evershade, a druid in Darkshore who cannot stay awake.",
  },

  greetings = {
    { id = "g_default", text = "Hm? Oh, forgive me, I must have dozed off again, which happens rather a lot lately." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and I'm awake to see you, which is a fine change for both of us." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That's about the size of it, I'm afraid, and the furbolgs on the road have worked out that I'm an easy meal while I'm dreaming. Wake me with the horn if you can and keep them off me if you can't, and I'll see Liladris again." } },
      choices = {
        { text = "I'll guard you. You'll see Liladris again.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll guard you, but I won't carry you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of them sniff at me and wander off, which is kind of them, and some of them don't, which is why I'm glad of company. In the Dream they're all much friendlier, but I can't stay there, because Liladris is waiting." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks as if it would wake me before anything nasty arrived. I'd be very grateful, and so would Liladris." },
      },
      choices = {
        { text = "My companion and I will keep watch over you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sleep on the road and you take your chances.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "That is a kind thought, and a strange one, though I don't think you could carry me far. Keep watch for the furbolgs while I walk, and if I nod off, a horn blown in my ear works better than a gentle shake." },
      },
      choices = {
        { text = "I'll get you home safely, Kerlonian.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll watch the road, and help myself to what furbolgs drop.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who is Liladris?", next = "liladris" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Perhaps, but I am a druid, and the Dream is not something to fight with a spell. It calls to all of us who walked it, and I would rather wake slowly than be torn from it." },
      },
      choices = {
        { text = "Then we'll do it your way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Torn is better than lost forever.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why can't you stay awake?", next = "sleep" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I couldn't say, which is the worry, really, because it always slips away before I wake. Liladris would tell me to stop fretting, but I'd sleep easier with your blessing, if you'll forgive the jest." } },
      choices = {
        { text = "Then you'll have my blessing, and I'll watch over you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dreams are dreams. Wake up and walk, Kerlonian.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd trust anyone who'd walk me there, truly, and I'd trust a paladin more than most. Only mind the cubs in the woods, for I'd rather you didn't fight them while I'm snoring." } },
      choices = {
        { text = "I'll get you home to Liladris, I swear it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take you part way. Then you're on your own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Kerlonian, and I'm meant to be on my way home to Auberdine and my love, Liladris. The trouble is that I keep falling asleep on the road, and the Dream doesn't want to let me go." },
        { id = "h_cond", when = { class = "DRUID" }, text = "Another druid! You'll understand, then, how sweet the Dream is, and how easy it is to stay there longer than you should." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, good, because I'm going to fall asleep again any moment, and I'd rather somebody with a sword was nearby when I do." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Your companion would make a fine watchman while I nap, and I nap a great deal, I'm afraid." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest? Oh, good, perhaps you can tell me if something in the Dream is following me, because I feel it watching sometimes." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll keep me safe on the road, I'm sure, but you may have to carry me, and I do apologise in advance." },
      },
      again = {
        { id = "h_again1", text = "Ask, quickly, before I nod off." },
        { id = "h_again2", text = "Yes? I'm listening, truly I am." },
      },
      choices = {
        { text = "Why do you keep falling asleep?", next = "sleep" },
        { text = "Who is Liladris?", next = "liladris" },
        { text = "Is the road to Auberdine safe?", next = "road" },
        { text = "I've felt the Dream's pull, too.", next = "druidk", when = { class = "DRUID" } },
        { text = "I could carry you home without waking you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Couldn't a spell keep you awake?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "So I just stand guard while you sleep, Kerlonian?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the beasts on the road bother you while you sleep?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is something in the Dream troubling you, Kerlonian?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will you trust me to get you home, Kerlonian?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Stay awake, Kerlonian.", next = "END" },
      },
    },
    sleep = {
      lines = {
        { id = "sleep_default", text = "I walked the Emerald Dream too long, and too deeply, and now some part of me wants to go back every moment. The Horn of Awakening can rouse me, if you'll stay with me and blow it when I drift." },
      },
      choices = {
        { text = "Is the Dream so wonderful?", next = "sleep2" },
      },
    },
    sleep2 = {
      lines = {
        { id = "sleep2_default", text = "It's the forest as it was meant to be, green and whole and quiet. Some of my order think we should spend more time there, and some think we've spent too much already." },
      },
      choices = {
        { text = "The waking world needs you more. Come home.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "If the Dream is that beautiful, I'd stay too.", next = "BACK", fx = { align = { order = -1 }, trait = { dreamer = 1 } } },
      },
    },
    liladris = {
      lines = {
        { id = "liladris_default", text = "Liladris Moonriver, who waits for me in Auberdine and who is going to be very cross. I promised her I'd be back before the moon was full, and I've lost track of how many moons it's been." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_default", text = "Not for a man who sleeps in the middle of it, no. There are bears gone mad and Blackwood furbolgs about, so do keep an eye out while I'm dreaming." },
      },
      choices = {
        { text = "I'll watch the road.", next = "BACK" },
      },
    },
    druidk = {
      lines = {
        { id = "druidk_default", text = "Then you know it's no sin to love it, only to forget the people waiting for you. Promise me you'll remember that, when it's your turn." },
      },
      choices = {
        { text = "I promise. What else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a druid of the Cenarion Circle, and very nearly a bridegroom, if I can stay awake." } },
    _none = { { id = "tp_none", text = "I'm not sure, and I think I may have dreamed the answer once and forgotten it." } },
  },
}
