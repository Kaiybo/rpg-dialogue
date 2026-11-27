-- Eastern Plaguelands: Light's Hope folk a roster scan found with no conversation yet: an Argent sentry,
-- Field Marshal Chambers, the druid Rayne of the Cenarion Circle and Craftsman Wilhelm of the Brotherhood
-- of the Light. Voice: bibles/lightshope_dawn.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Argent Sentry: a guard of Light's Hope Chapel.
P:NPC {
  key = "epl_argent_sentry", id = TODO_NPC("Argent Sentry"), name = "Argent Sentry",
  bible = "bibles/lightshope_dawn.md", role = "guard", tier = "service",
  communities = { "light_hope" }, temper = { "steady", "grim" }, values = { "duty", "faith" },
  notices = { "race" },
  impression = {
    first = "An Argent Dawn sentry at Light's Hope Chapel, silver tabard grey with ash, watching the dead lands as if they might stand up at any moment.",
    third = "{name} spoke with one of the Argent Dawn's sentries at Light's Hope Chapel.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and the Dawn is glad of it. Pass freely, friend; the dead won't take Light's Hope while folk like you stand here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll let you pass, for the Dawn's sake, but I'll be watching you as closely as I watch the dead." },
    { id = "g_default", text = "Light's Hope stands open to all who fight the Scourge, traveller. Come in, and keep your blade ready." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive and still fighting, I see. The Dawn needs more like you." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. You're welcome here as long as you fight the Lich King, but don't expect warmth from everyone inside." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep watch over Light's Hope Chapel, where the Scourge can't tread, though they test it every night. Stratholme lies to the north and the Plaguewood to the west, and both are full of things that never sleep." } },
      again = { { id = "h_again", text = "What else? I'm on watch." } },
      choices = {
        { text = "The Dawn's watch rules keep Light's Hope alive. I'll respect them.", next = "BACK", reply = "Good. One sleeping sentry, and the dead would be inside the walls by morning.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Rules won't stop the Scourge. I fight however I like.", next = "BACK", reply = "Then fight outside the walls, friend, and leave the gate to those who'll keep it.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What comes at night?", next = "xnight2" },
        { text = "How did you come to the Dawn?", next = "xjoin" },
        { text = "I'm Forsaken. Can I stand on this ground?", next = "xdead", when = { race = "Scourge" } },
        { text = "Why can't the Scourge tread here?", next = "ground" },
        { text = "Horde and Alliance both stand here?", next = "both" },
        { text = "What comes at night?", next = "night" },
        { text = "Light keep you.", next = "END" },
      },
    },
    ground = {
      lines = { { id = "g2_default", text = "This chapel was hallowed by the blood and the faith of those who fell defending it, and the Light lingers here still. The dead can come to the edge, but no further, and we thank the Light for it every night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    both = {
      lines = { { id = "b_default", text = "They do, under the Dawn's banner, and I'll not pretend it's always easy. But the Scourge doesn't care what flag you fly, and neither, in the end, does the Argent Dawn." } },
      choices = {
        { text = "Good. The Scourge is the only enemy that matters.", next = "BACK", reply = "Aye, and I wish more folk back home understood that.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Old allegiances still matter. Trust carefully.", next = "BACK", reply = "Careful trust is still trust. That's more than most give.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = { { id = "n_default", text = "Ghouls, mostly, and the plaguehounds from Corin's Crossing, and once a death knight on a pale horse, who sat at the edge of the light and watched us until dawn. I'd rather face the ghouls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnight2 = {
      lines = {
        { id = "xn1", text = "Ghouls, mostly, sniffing at the edge of the hallowed ground like dogs at a butcher's door. Now and then a gargoyle off the Stratholme spires, and once, last month, a knight in black on a dead horse who sat and watched us until dawn." },
      },
      choices = {
        { text = "A death knight?", next = "xknight" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xknight = {
      lines = {
        { id = "xk1", text = "That's what the field marshal called it, and he went pale saying it. Whatever it was, it didn't cross the line, and it left before the sun came up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xjoin = {
      lines = {
        { id = "xj1", text = "I was a mason in Corin's Crossing, and when the dead came I ran with my tools and nothing else. The Dawn gave me a sword and a reason, and I've kept both. The Crossing is Scourge now, all of it. I can see the smoke from the watchtower on a clear day." },
      },
      choices = {
        { text = "You should take the Crossing back.", next = "BACK", reply = "One day. Not with the numbers we have now.", fx = { align = { order = -1 } } },
        { text = "Hold the chapel. That matters more than revenge.", next = "BACK", reply = "Aye, it does, though it's hard to remember some nights.", fx = { align = { order = 1 } } },
      },
    },
    xdead = {
      lines = {
        { id = "xd1", text = "You can, though the Light here may sting, and some of the brothers will stare. The Dawn takes anyone who fights the Scourge, and the chapel doesn't turn away a Forsaken who means no harm." },
      },
      choices = {
        { text = "I'll bear the sting.", next = "BACK" },
      },
    },
  },
  topics = {
    stratholme = { { id = "xtp_st", text = "A city of the dead. Its gates are open, and nobody walks in by choice." } },
    corins_crossing = { { id = "xtp_cc", text = "My home. The Scourge hold it now." } },
    background = { { id = "tp_bg", text = "I'm a sentry of the Argent Dawn, and Light's Hope is my post." } },
    _none = { { id = "tp_none", text = "Couldn't say, traveller. Ask Lord Tyrosus." } },
  },
}

-- Field Marshal Chambers: an Argent Dawn commander at Light's Hope Chapel.
P:NPC {
  key = "epl_field_marshal_chambers", id = TODO_NPC("Field Marshal Chambers"), name = "Field Marshal Chambers", title = "The Argent Dawn", gender = "male",
  bible = "bibles/lightshope_dawn.md", role = "soldier", tier = "service",
  communities = { "light_hope" }, temper = { "stern", "decisive" }, values = { "duty", "order" },
  notices = { "class" },
  impression = {
    first = "Field Marshal Chambers commands for the Argent Dawn at Light's Hope, a grey-haired soldier who studies maps of the Plaguelands as though he could will the dead off them.",
    third = "{name} met Field Marshal Chambers of the Argent Dawn at Light's Hope Chapel.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again. The reports speak well of you, and the Dawn needs every capable blade. Come, look at the map with me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I've read the reports, and I'm not impressed, so keep this brief and keep out of my soldiers' way." },
    { id = "g_default", text = "You've come to fight, I hope, because the Dawn has no use for sightseers. Speak your piece." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, the reports say you've been busy, and busy is what we need." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A {class}. I need front-line fighters more than I need anything else, so I'm glad to see you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Field Marshal Chambers, and I coordinate the Argent Dawn's forces here in the east, which is a grand way of saying I send good people out to die against the Scourge. The Scourge has more soldiers than we ever will, so every one of ours must count." } },
      again = { { id = "h_again", text = "What else? Be quick." } },
      choices = {
        { text = "A commander owes his soldiers the truth, however grim.", next = "BACK", reply = "He does, and I've given it to them every morning since Darrowshire fell.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Lie to the troops. Hope wins more battles than truth.", next = "BACK", reply = "False hope gets soldiers killed. I'll give them truth and let them find their own courage.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How do you choose who to send out?", next = "xchoose" },
        { text = "Who stands with the Dawn here?", next = "xallies" },
        { text = "I'm a paladin of the Silver Hand.", next = "xpal", when = { class = "PALADIN" } },
        { text = "How goes the war against the Scourge?", next = "war" },
        { text = "What's the Dawn's greatest threat?", next = "threat" },
        { text = "Sending people to die must weigh on you.", next = "weight" },
        { text = "I'll get to work.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "We hold Light's Hope and a few other footholds, and the Scourge holds everything else. It's not a war we're winning, but it's a war we're not losing, and in the Plaguelands that's a victory." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = { { id = "t_default", text = "Stratholme, where the Scourge has its strongest grip, and the Scarlet Crusade at Tyr's Hand, who'd as soon kill us as the dead. Fighting a war on two fronts with half an army is no way to win." } },
      choices = {
        { text = "Then deal with the Scarlets first. Clear your flank.", next = "BACK", reply = "Spoken like a tactician. The Dawn's council disagrees, but I've thought it myself.", fx = { align = { light = -1 } } },
        { text = "The Scarlets are misguided, not enemies. Try to reason with them.", next = "BACK", reply = "Reason with zealots? I admire your faith. I don't share it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weight = {
      lines = { { id = "wt_default", text = "It does, every day, and I'd be a poor commander if it didn't. But the alternative is letting the Scourge spread south, and I won't have that on my conscience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xchoose = {
      lines = {
        { id = "xc1", text = "The ones who come back, I send again, and the ones who don't, I write letters for. There's no wisdom in it, only a list of names and a map of where the dead are thickest." },
      },
      choices = {
        { text = "That's a heavy thing to carry.", next = "xheavy" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xheavy = {
      lines = {
        { id = "xh1", text = "Heavy enough. Highlord Mograine carried heavier and died for it, and Lord Maxwell Tyrosus asks the same of me now. I don't complain where the soldiers can hear." },
      },
      choices = {
        { text = "Ask for volunteers. Don't send anyone who won't go.", next = "BACK", reply = "Noble, and I'd have no army by spring. Still, I wish it were so.", fx = { align = { order = -1 } } },
        { text = "Orders are orders. Send them, and grieve later.", next = "BACK", reply = "That's the job, and you've the stomach for command, it seems.", fx = { align = { order = 1 } } },
      },
    },
    xallies = {
      lines = {
        { id = "xa1", text = "The Brotherhood of the Light forges our arms, the Cenarion Circle sends druids to heal the land, and even the Forsaken send scouts who'd rather fight the Scourge than the living. Strange company, and I'm glad of every one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpal = {
      lines = {
        { id = "xp1", text = "Then you know what the Order lost at Stratholme, and after. What's left of the Silver Hand is scattered, but a good many of them wear the Dawn's colours now, and we'd welcome you among them." },
      },
      choices = {
        { text = "I'll think on it.", next = "BACK" },
      },
    },
  },
  topics = {
    tyrosus = { { id = "xtp_ty", text = "Lord Maxwell Tyrosus commands the Dawn here. A hard man, and a fair one." } },
    naxxramas = { { id = "xtp_nx", text = "A shadow over Stratholme that we dare not name too loudly." } },
    background = { { id = "tp_bg", text = "I'm a soldier of the Argent Dawn, and I've fought the Scourge since the first plague." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask the quartermaster." } },
  },
}

-- Rayne: night elf druid of the Cenarion Circle at Light's Hope.
P:NPC {
  key = "epl_rayne", id = TODO_NPC("Rayne"), name = "Rayne", title = "Cenarion Circle", gender = "female",
  bible = "bibles/lightshope_dawn.md", role = "vendor", tier = "service",
  communities = { "light_hope" }, temper = { "calm", "grave" }, values = { "nature", "balance" },
  notices = { "class", "race" },
  impression = {
    first = "Rayne is a night elf druid of the Cenarion Circle, sent to Light's Hope to help those fighting the Scourge. She looks out over the dead land with an expression of quiet grief.",
    third = "{name} met Rayne, a druid of the Cenarion Circle at Light's Hope Chapel.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Elune-adore, you have come back to us. The land feels a little lighter when you walk it, friend." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. The Circle bids me welcome all who fight the blight, and so I will, though my heart is not in it." },
    { id = "g_default", text = "Ishnu-alah, traveller. You stand at the edge of a wound in the world, and I am here to see that it does not spread." },
    { id = "g_back", when = { metBefore = true }, text = "Elune-adore, you have returned. The land still weeps, but your strength helps it heal." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, sister or brother of the Circle! Then you feel it too, the land screaming beneath the plague." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the Kaldorei, so far from the forests of home. The Circle needs every one of us here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Rayne of the Cenarion Circle, and I have come to aid the Argent Dawn against the Scourge. The plague is a poison not just to the living but to the land itself, and the Circle cannot stand by while it spreads." } },
      again = { { id = "h_again", text = "What else would you ask, traveller?" } },
      choices = {
        { text = "We should heal this land honestly, however long it takes.", next = "BACK", reply = "Patience is the oldest of the druid's tools. The land will thank you, though not soon.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell the Circle the land is healing, even if it isn't.", next = "BACK", reply = "Comforting lies let a wound fester unseen. I will tell them the truth, however hard.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How do druids heal a land like this?", next = "xhow" },
        { text = "Do the humans welcome you here?", next = "xhumans" },
        { text = "I'm a druid as well.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Ishnu-alah. Elune guide you here.", next = "xelf", when = { race = "NightElf" } },
        { text = "Can the land here be healed?", next = "heal" },
        { text = "What does the Circle care about human lands?", next = "why" },
        { text = "What lies in the sky over Plaguewood?", next = "naxx" },
        { text = "Elune guide you.", next = "END" },
      },
    },
    heal = {
      lines = { { id = "h2_default", text = "In time, with patience, and with the Scourge driven out, the roots will remember how to grow. But the plague sinks deep, and healing this land will take longer than any of you short-lived races will see." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "The land does not belong to humans or elves or anyone else, and a wound anywhere is a wound everywhere. The plague would not stop at the borders of Lordaeron, and the Circle knows that." } },
      choices = {
        { text = "Wise. The land must come before any kingdom.", next = "BACK", reply = "You understand. That is rare among the young races.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Kingdoms protect the land. They must come first.", next = "BACK", reply = "Kingdoms rise and fall, traveller. The land endures.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naxx = {
      lines = { { id = "n_default", text = "Naxxramas, the Scourge's floating citadel, which hangs over the Plaguewood like a black storm cloud. The Lich King's servants plot there, and the Dawn is gathering strength to strike at it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhow = {
      lines = {
        { id = "xh1", text = "Slowly, and seed by seed. We draw the plague out of the soil where we can and plant what will take root in what's left, and most of it dies, and we plant again." },
      },
      choices = {
        { text = "Is it worth it?", next = "xworth" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xworth = {
      lines = {
        { id = "xw1", text = "The Circle asks that question every season. Some say the Plaguelands should be left to burn clean and grow again in a thousand years, and some say we must tend it now." },
      },
      choices = {
        { text = "Burn it all and let it start anew.", next = "BACK", reply = "Fire is a teacher too, but a cruel one.", fx = { align = { light = -1 } } },
        { text = "Tend it now. The land deserves our care.", next = "BACK", reply = "I am glad. That is my own belief.", fx = { align = { light = 1 } } },
      },
    },
    xhumans = {
      lines = {
        { id = "xhu1", text = "The Argent Dawn welcomes anyone who fights the Scourge, though some of the humans stare at my ears. They are a young people and much has been taken from them; I forgive them the staring." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xd1", text = "Then you feel it too, the land crying beneath your feet. Walk lightly here, and if you take any form, take one that does not touch the ground for long." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
    xelf = {
      lines = {
        { id = "xe1", text = "Elune-adore, sister of the forest. It is strange to see our people so far from Teldrassil, and good. The Kaldorei have hidden too long behind our trees." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cenarion = { { id = "xtp_ce", text = "The Cenarion Circle. We guard the balance, even here." } },
    plague = { { id = "xtp_pl", text = "A poison in the roots. It will take many lifetimes to draw out." } },
    background = { { id = "tp_bg", text = "I am a druid of the Cenarion Circle, sent to help the Argent Dawn against the plague." } },
    _none = { { id = "tp_none", text = "The Dream holds no answer to that, traveller." } },
  },
}

-- Craftsman Wilhelm: master smith of the Brotherhood of the Light at Light's Hope.
P:NPC {
  key = "epl_craftsman_wilhelm", id = TODO_NPC("Craftsman Wilhelm"), name = "Craftsman Wilhelm", title = "Brotherhood of the Light", gender = "male",
  bible = "bibles/lightshope_dawn.md", role = "blacksmith", tier = "service",
  communities = { "light_hope" }, temper = { "gruff", "devout" }, values = { "craft", "faith" },
  notices = { "class", "craft" },
  impression = {
    first = "Craftsman Wilhelm is a dwarf smith of the Brotherhood of the Light, hammering away at Light's Hope, and he blesses each piece of armor he forges as though it were a prayer.",
    third = "{name} met Craftsman Wilhelm, the Brotherhood of the Light's smith at Light's Hope Chapel.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, there's my best customer, back an' breathin'! Come see what I've just tempered, {g:lad|lass}; I blessed it with ye in mind." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. I'll forge for ye, since the Light bids me, but I'll not be blessin' it any harder than I must." },
    { id = "g_default", text = "Welcome, {g:lad|lass}, tae the finest forge in the Plaguelands! Every piece I make is blessed by the Light an' tempered against the Scourge." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still breathin'! My armor must be doin' its job." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Come, feel the heat o' this forge, an' tell me if ye've ever felt one burn this clean." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, by the Light! Armor for a paladin is the best work a smith can do, for it's the Light's own work." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Wilhelm, smith o' the Brotherhood o' the Light, an' I forge armor for those brave enough tae face the Scourge. Bring me the right materials from the dead lands, an' I'll make ye armor no ghoul can tear." } },
      again = { { id = "h_again", text = "What else, {g:lad|lass}? The forge is hot." } },
      choices = {
        { text = "What materials do you need?", next = "xmat" },
        { text = "Where's your forge from?", next = "xforge" },
        { text = "I'm a dwarf. Where are ye from, then?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "What is the Brotherhood of the Light?", next = "brotherhood" },
        { text = "What makes your armor special?", next = "armor" },
        { text = "Does blessing armor really help?", next = "bless" },
        { text = "Show me your work.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "We're a fellowship o' the faithful who fight the Scourge wi' hammer an' prayer, an' we stand alongside the Argent Dawn here at Light's Hope. The Dawn feeds us an' we arm them, an' it's a fair trade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    armor = {
      lines = { { id = "a_default", text = "The Light, mostly, an' the frozen runes the Scourge's own constructs carry, which hold the cold o' death in them. Turned against the Scourge, that cold protects ye like nothin' else." } },
      choices = {
        { text = "Using the Scourge's own power is dangerous.", next = "BACK", reply = "Aye, it is, an' I pray over every piece. But the Light purifies.", fx = { align = { light = 1 } } },
        { text = "Use every weapon you can. The Scourge would.", next = "BACK", reply = "That's the thinkin' that keeps us alive out here, {g:lad|lass}.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bless = {
      lines = { { id = "bl_default", text = "Ask the lads who came back from Stratholme wearin' my mail, an' they'll tell ye. Faith an' steel together are stronger than either alone, an' I've seen it with my own eyes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmat = {
      lines = {
        { id = "xm1", text = "Bones o' the dead, gizzards from the plague beasts, an' the like, all things the Scourge carries in plenty. Ye bring 'em, an' I'll make somethin' that turns them against their makers." },
      },
      choices = {
        { text = "Isn't that grim work?", next = "xgrim" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xgrim = {
      lines = {
        { id = "xg1", text = "Grim? Aye, it's grim. But a ghoul's bones are just bones once the Light's burned through 'em, an' I'd sooner use the Scourge against itself than let a good bit o' material rot." },
      },
      choices = {
        { text = "Use whatever works. The Scourge deserves no mercy.", next = "BACK", reply = "That's the spirit! Bring me more.", fx = { align = { light = -1 } } },
        { text = "Using the dead like that troubles me.", next = "BACK", reply = "It troubled me too, once. Then I saw Darrowshire.", fx = { align = { light = 1 } } },
      },
    },
    xforge = {
      lines = {
        { id = "xf1", text = "Built it wi' my own hands from the stones o' a fallen church. The priests blessed every brick, an' the fire's never gone out once since I lit it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd1", text = "Ironforge born, an' left for the Plaguelands when the Brotherhood called. Me father thought I'd gone mad, an' maybe I had, but there's nae better work for a smith than arming folk against the dead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    brotherhood = { { id = "xtp_bh", text = "The Brotherhood o' the Light. Hammer an' prayer, as I said." } },
    scourge = { { id = "xtp_sc", text = "Good for bones, bad for business. Mostly bad." } },
    background = { { id = "tp_bg", text = "I'm a dwarf smith o' the Brotherhood o' the Light, an' I've forged against the Scourge for years." } },
    _none = { { id = "tp_none", text = "Cannae help ye, {g:lad|lass}. Ask the Dawn's folk." } },
  },
}

-- Archmage Angela Dosantos: the Brotherhood of the Light's archmage at Light's Hope, who studies Naxxramas.
P:NPC {
  key = "epl_dosantos", id = 16116, name = "Archmage Angela Dosantos", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "argent_dawn" }, temper = { "precise", "grave" }, values = { "knowledge", "duty" },
  notices = { "class" },
  impression = {
    first = "A mage of the Brotherhood of the Light, she watches the sky over the Plaguewood as if it owed her answers.",
    third = "{name} met Archmage Angela Dosantos of the Brotherhood of the Light, who studies the floating citadel of Naxxramas.",
  },
  greetings = {
    { id = "g_default", text = "You have the look of someone who has fought the Scourge and lived. Good, because I need people who know what it costs." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The citadel has not moved since you left, and I find that more troubling than if it had." },
    { id = "g_citadel", when = { questDone = TODO_QUEST("The Dread Citadel - Naxxramas") }, text = "You have been inside the citadel. Tell me nothing in passing; sit, and tell me all of it." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A fellow student of the arcane. Then you will understand when I say the wards on that necropolis are not Scourge work alone." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "In Dalaran, alongside many who later joined the Cult of the Damned. I knew Kel'Thuzad by sight. He was charming, and brilliant, and I thought nothing of it. I've thought of little else since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfear = {
      lines = { { id = "yfear_x", text = "That it will move. A necropolis that floats can go anywhere. If it ever drifts toward Stormwind or Orgrimmar, there will be no army fast enough to meet it." } },
      choices = {
        { text = "Should we strike now, while it's here?", next = "ystrike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystrike = {
      lines = { { id = "ystrike_x", text = "Highlord Fordring wants to wait until the Dawn is stronger. Others want to assault it at once. I'm torn. Should we strike before we're ready, or wait and risk it moving?" } },
      choices = {
        { text = "Strike now. Waiting gives the Scourge time.", next = "BACK", reply = "Bold. I'd like to agree. I'll carry your view to the council.", fx = { align = { order = -1 } } },
        { text = "Wait. Fordring knows what he's doing.", next = "BACK", reply = "Aye, he usually does. Patience, then.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Angela Dosantos, archmage of the Brotherhood of the Light. Kel'Thuzad has raised Naxxramas above the Plaguewood, and I mean to learn how to break its doors." },
        { id = "yh_mage", when = { class = "MAGE" }, text = "A mage. Good. Then you'll understand why I watch that citadel day and night. There is more power in Naxxramas than in all of Dalaran's libraries." },
      },
      again = { { id = "h_again", text = "What else would you ask? Be brief; my notes will not write themselves." } },
      choices = {
        { text = "What is Naxxramas?", next = "naxx" },
        { text = "Who are the Brotherhood of the Light?", next = "brotherhood" },
        { text = "How does one get inside the citadel?", next = "attune" },
        { text = "Is there anything a mage could learn from it?", next = "frostfire", when = { class = "MAGE" } },
        { text = "Where did you study, Archmage?", next = "ylife" },
        { text = "What do you fear most about the citadel?", next = "yfear" },
        { text = "Good day, Archmage.", next = "END" },
      },
    },
    naxx = {
      lines = { { id = "n_default", text = "A necropolis of the Nerubians, taken by the Lich King and flown here across the sea. Kel'Thuzad rules it now, and every plague that has fallen on these lands was brewed within its walls." } },
      choices = {
        { text = "Kel'Thuzad was a man of Dalaran once.", next = "kelthuzad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelthuzad = {
      narr = "Her mouth tightens, and for a moment she looks away toward the north.",
      lines = { { id = "k_default", text = "He sat on the Council of Six, and some of my own teachers called him brilliant. That is the lesson of him: brilliance without conscience ends in a cult of the dead and a city in ashes." } },
      choices = {
        { text = "Knowledge must answer to the Light.", next = "BACK", reply = "It must answer to something, at least. I prefer the Light to the alternative.", fx = { align = { order = 1 } } },
        { text = "His mistake was getting caught, not studying.", next = "BACK", reply = "Say that inside the chapel, and the paladins will not be as patient as I am.", fx = { align = { order = -1 } } },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Those of the Argent Dawn who decided that waiting at Light's Hope was not enough. Commander Dawnbringer leads us, and we answer for the war against the citadel itself." } },
      choices = { { text = "Then I'll speak to the commander too. Something else.", next = "BACK" } },
    },
    attune = {
      lines = { { id = "a_default", text = "Not by walking. The Argent Dawn must trust you deeply before I will open the way, and you must bring proof of what you have done against the Scourge. That is my task for you, should you want it." } },
      choices = {
        { text = "Why must the Dawn trust me first?", next = "trust" },
        { text = "Tell me what you need.", next = "task" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Because whatever goes into that place and comes back changed, comes back here, to the only safe ground in the Plaguelands. I will not hand the key to someone who might be the next Kel'Thuzad." } },
      choices = {
        { text = "That's wise. Caution has kept this chapel standing.", next = "BACK", reply = "It has, and so has the blood of a good many people braver than I am.", fx = { align = { order = 1 } } },
        { text = "Fear wastes time the living don't have.", next = "BACK", reply = "Perhaps. But a mistake here would waste far more than time.", fx = { align = { order = -1 } } },
      },
    },
    task = {
      lines = { { id = "ta_default", text = "Earn the Dawn's high regard, and bring me the coin they ask. Then I will grant you passage through the citadel's wards, and pray you are strong enough for what is beyond them." } },
      choices = { { text = "I'll come back when I'm ready.", next = "BACK" } },
    },
    frostfire = {
      lines = { { id = "f_default", text = "The citadel's guardians wear garments woven with frost and flame together, and the Brotherhood has learned to remake them. Bring me what the necropolis yields and I will show you the equation that binds the two." } },
      choices = { { text = "Fire and frost in one weave? I'll bring them.", next = "BACK" } },
    },
  },
  topics = {
    naxxramas = { { id = "ytp_naxx", text = "Naxxramas floats over the Plaguewood like a black moon. I can't stop looking at it." } },
    kelthuzad = { { id = "ytp_kt", text = "Kel'Thuzad was a man once, and a clever one. I'd like to know where he went wrong." } },
    background = { { id = "tp_bg", text = "I trained in Dalaran before the plague came, and I have spent every year since learning how it was made." } },
    _none = { { id = "tp_none", text = "That is outside my study. Ask the commander, or one of the Dawn's quartermasters." } },
  },
}

-- Commander Eligor Dawnbringer: paladin leader of the Brotherhood of the Light at Light's Hope.
P:NPC {
  key = "epl_eligor", id = 16115, name = "Commander Eligor Dawnbringer", gender = "male",
  role = "questgiver", tier = "major",
  communities = { "argent_dawn" }, temper = { "steady", "stern" }, values = { "duty", "faith" },
  notices = { "class" },
  impression = {
    first = "A paladin of the old wars, Eligor carries himself like a man who has buried too many friends to waste words.",
    third = "{name} met Commander Eligor Dawnbringer, leader of the Brotherhood of the Light at Light's Hope Chapel.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you. If you have come to fight the citadel, stand straight; if you have come to look at it, stand aside." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. The Brotherhood remembers those who keep coming back." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A brother of the Light. Mograine would have been glad to see one more of us standing here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Eligor Dawnbringer, and I command the Brotherhood of the Light. We are the Argent Dawn's spear against Naxxramas, and we are always short of spears." } },
      again = { { id = "h_again", text = "Speak, then. The Scourge does not rest, and neither do I." } },
      choices = {
        { text = "How can I help against the citadel?", next = "echoes" },
        { text = "You fought in the Third War?", next = "war" },
        { text = "What of the Scarlet Crusade?", next = "scarlet" },
        { text = "Is there armor for a paladin of the Brotherhood?", next = "redemption", when = { class = "PALADIN" } },
        { text = "This chapel has held when everything around it fell.", next = "chapel" },
        { text = "My family came from Lordaeron, Commander.", next = "lordaeron", when = { race = "Human" } },
        { text = "Farewell, Commander.", next = "END" },
      },
    },
    echoes = {
      lines = { { id = "e_default", text = "The Scourge are stronger than they have been since Lordaeron fell, and they strike far from these lands now. Go out and cut them down wherever they gather, and bring me proof. Every one you kill is a raid that never comes." } },
      choices = {
        { text = "Why are they stronger now?", next = "stronger" },
        { text = "I'll go hunting.", next = "BACK" },
      },
    },
    stronger = {
      lines = { { id = "s_default", text = "Because Kel'Thuzad has his citadel back, and with it the full strength of his necromancy. Scourge activity has grown tenfold, and there are reports from as far away as Kalimdor." } },
      choices = {
        { text = "Then we strike the citadel itself, and soon.", next = "BACK", reply = "Soon, but not blindly. We will lose the best we have if we rush.", fx = { align = { light = -1 } } },
        { text = "First we protect the villages he threatens.", next = "BACK", reply = "Aye. A soldier who forgets the people he guards is only a man with a sword.", fx = { align = { light = 1 } } },
      },
    },
    war = {
      narr = "He touches the hilt of his hammer without seeming to notice.",
      lines = { { id = "w_default", text = "I fought beside Alexandros Mograine, the Ashbringer, when this land still had living towns in it. He is gone now, and the men who rode with him are scattered or worse." } },
      choices = {
        { text = "What happened to Mograine?", next = "mograine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mograine = {
      lines = { { id = "m_default", text = "Betrayed by his own son, and his blade turned to darkness. I will not tell the rest at a campfire. Some stories should be told once, in daylight, and then left alone." } },
      choices = { { text = "I understand. Something else.", next = "BACK" } },
    },
    scarlet = {
      lines = { { id = "sc_default", text = "They are zealots, but they hate the Scourge as much as we do, and I have spoken with them here under truce. Whether they will stand with us when the citadel comes down, I cannot promise." } },
      choices = {
        { text = "We need every sword, even theirs.", next = "BACK", reply = "That is my thinking, and I pray I am right.", fx = { align = { order = 1 } } },
        { text = "They murder the innocent. I won't fight beside them.", next = "BACK", reply = "Nor would I trust them with my back. But I will talk, while talking serves.", fx = { align = { order = -1 } } },
      },
    },
    chapel = {
      lines = { { id = "ch_default", text = "It has, and not by luck. Light's Hope stands on hallowed ground, where the Scourge's power falters. The Argent Dawn kept the faith here when there was little else left to keep." } },
      choices = {
        { text = "Who commands the Dawn here, besides you?", next = "dawn" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "da_default", text = "The Argent Dawn answers to its own council, and Mograine's old soldiers are few. Here at the chapel the quartermasters and Archmage Dosantos keep the work moving while I keep the soldiers standing." } },
      choices = {
        { text = "What does Dosantos study?", next = "dosantos" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dosantos = {
      lines = { { id = "do_default", text = "Naxxramas itself: its wards, its quarters and the masters within them. She tells me what we will face, and I decide how many of my people I am willing to send to face it." } },
      choices = { { text = "A hard thing to decide. Something else.", next = "BACK" } },
    },
    lordaeron = {
      narr = "For a moment his stern face softens.",
      lines = { { id = "lo_default", text = "Then you know what was taken from us. Every town between here and the Thondroril was full of good people once, and the Scourge wears their faces now. Fight for them, and you fight for your own blood." } },
      choices = {
        { text = "I will see it reclaimed one day.", next = "BACK", reply = "Hold to that. Hope is a weapon too, though it is a heavy one.", fx = { align = { light = 1 } } },
        { text = "I'll see it burned clean first.", next = "BACK", reply = "Fire may come to that, but remember there were homes in those ruins.", fx = { align = { light = -1 } } },
      },
    },
    redemption = {
      lines = { { id = "r_default", text = "There is. The Brotherhood forges the Redemption armor from what the necropolis yields, and it is meant for those who carry the Light into the dark. Bring the pieces, and the smiths will do the rest." } },
      choices = { { text = "I'll earn it, Commander.", next = "BACK" } },
    },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you stand where you are needed, and you do not ask how many of you there are. The Brotherhood respects that above all things." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You have brought me proof from the field more times than I can count, and you never once asked for a reward. That is how a soldier of the Light behaves." },
      { id = "rg_paladin", when = { class = "PALADIN" }, text = "You are a brother of the Light, and you carry it as Mograine did, steadily and without fear. I am glad to have you in this chapel." },
      { id = "rg_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "The Light is strong in you, and it shows in how you fight and how you speak. The Brotherhood could use a hundred more like you." },
      { id = "rg_al_dark", when = { alignment = { axis = "light", max = -30 } }, text = "There is a shadow on you, and I will not pretend I do not see it. Still, you fight the Scourge, and the Brotherhood takes any blade that does." },
    },
    confide = {
      { id = "cf_1", text = "I was at Mograine's side when this land still had living towns in it. I have never told the young ones how many of his men I buried myself." },
      { id = "cf_2", text = "I do not sleep well near Naxxramas, though I tell the Brotherhood I sleep like a stone. A commander must look rested, even when he is not." },
    },
    trust = {
      { id = "tr_1", text = "Trust Archmage Dosantos about the citadel, because she has studied it longer than anyone here. Trust the quartermasters with your tokens and your name." },
      { id = "tr_2", text = "Trust any soldier who has stood a watch beside the Brotherhood. We are few, and we know each other by the scars we share." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the citadel's shadow, and never linger beneath it. The necromancers inside see further than you would think." },
      { id = "wo_2", text = "Watch for the Scourge raiding far from these lands, in towns that thought themselves safe. They strike where they are least expected now." },
    },
    worries = {
      { id = "wy_1", text = "That we will rush the citadel before we are ready, and lose the best we have at its gate. I hold the Brotherhood back, and some of them hate me for it." },
      { id = "wy_2", text = "The face that my scouts swear they saw among Kel'Thuzad's death knights. I pray they are wrong, and I fear they are not." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see Naxxramas fall from the sky and the Brotherhood standing in its ruins. Mograine would have wanted to see that." },
      { id = "hp_2", text = "I hope to see this land green again, with towns and fields and people in them. That is what the Light is for, in the end." },
    },
    favor = {
      { id = "fv_1", text = "Go out and cut down the Scourge wherever they gather, and bring me proof. Every one you kill is a raid that never comes." },
      { id = "fv_2", text = "Speak to Dosantos before you go into the citadel, and listen to what she tells you. I would rather not bury you." },
    },
    friendship = {
      { id = "fr_1", text = "I count you a friend, and I do not say that to many. You have stood with the Brotherhood, and that makes you one of us." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "After everything you have done for this chapel? You are a brother of the Light in all but oath, and the Brotherhood knows it." },
      { id = "fr_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "We share the same Light, you and I, and you carry it as a soldier should. I would stand beside you at the citadel's gate." },
    },
    never_told = {
      { id = "nt_1", text = "When Mograine fell, I was not there, because I had been ordered elsewhere and I obeyed. I have wondered every day since whether I could have stopped it." },
      { id = "nt_2", text = "I knew the man my scouts saw among the death knights. He was my squire once, and I taught him to hold a hammer." },
    },
    background = { { id = "tp_bg", text = "A paladin of Lordaeron, a veteran of the Third War, and now the Dawn's commander at the citadel's door." } },
    _none = { { id = "tp_none", text = "I could not say. Ask Archmage Dosantos; she knows more than I do of most things." } },
    grievance = {
      { id = "gv_1", text = "You have not stood where the Brotherhood stands, and you speak as though you had. That is my grievance." },
      { id = "gv_val", when = { grudge = "values" }, text = "I have buried brothers who fought for less than you ask in payment. You will forgive me if I find you hard to like." },
      { id = "gv_wr", when = { grudge = { worst = "wronged" } }, text = "You addressed a commander of the Light like a hireling. I have not forgotten it, and the men who heard you have not either." },
    },
    amends = {
      { id = "am_1", text = "Go out and cut the Scourge down, and bring me proof. Deeds are the only coin the Brotherhood accepts." },
      { id = "am_wr", when = { grudge = "wronged" }, text = "Speak to me as a soldier speaks to his commander. Do that, and we can begin again." },
    },
    spite = {
      { id = "sp_1", text = "I think you would break before the citadel's gate, and I will not send the Brotherhood after you when you do." },
      { id = "sp_val", when = { grudge = { worst = "values" } }, text = "I think Mograine would have turned you away at the door. I am kinder than he was, and I am considering it." },
    },
  },
  alignment = { light = 1 },
  confides = {
    { id = "cnf_1", text = "Each quarter of Naxxramas has its own master, and Dosantos believes they must fall in a particular order for the inner hall to open." },
    { id = "cnf_2", text = "The Brotherhood keeps a reserve of holy water in the chapel crypt, enough to consecrate a small field, for when the citadel comes down." },
    { id = "cnf_3", text = "The Scourge raids have reached as far as Kalimdor, and the Dawn's riders there report to this chapel by griffon and wyvern both." },
  },
  blurts = {
    { id = "bl_1", text = "Kel'Thuzad keeps four death knights in his inner hall, and our scouts swear one of them bears a face I knew. I do not speak of it, and you will not either." },
    { id = "bl_2", text = "The necropolis has four quarters, and each has its own master. Archmage Dosantos has studied them longer than anyone here; ask her before you go in blind." },
  },
}

-- Elder Windrun: a night elf ancestor honored at the Lunar Festival, near Crown Guard Tower.
P:NPC {
  key = "epl_windrun", id = 15592, name = "Elder Windrun", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "lunar_elders" }, temper = { "serene", "sorrowful" }, values = { "memory", "faith" },
  notices = { "race" },
  impression = {
    first = "An elder spirit of the night elves, standing in the blighted grass as if it were still green.",
    third = "{name} honored Elder Windrun, a night elf ancestor who keeps his vigil near Crown Guard Tower.",
  },
  greetings = {
    { id = "g_default", text = "Peace, traveler. Even here, among the dead and the blight, the moon remembers us." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come again. You have walked through the Plaguelands to honor an elder, and that is not a small thing." },
    { id = "g_honored", when = { questDone = TODO_QUEST("Windrun the Elder") }, text = "You honored me once already. Go well, and remember the old ones when the year turns again." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A child of the Kaldorei, so far from the great trees. Elune's light is thin here, but it is not gone." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A sentinel of the old kingdom, long before the Sundering. I guarded the roads near the Well of Eternity, and I watched the Highborne grow proud. I left before the end. Not all my sisters did." } },
      choices = {
        { text = "Do you regret leaving?", next = "yregret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yregret = {
      lines = { { id = "yregret_x", text = "I regret that I did not stay and fight. But I lived, and those who stayed died. Is it better to die for your people, or live to remember them?" } },
      choices = {
        { text = "Live. Memory keeps a people alive.", next = "BACK", reply = "That is the druids' teaching. I have come to believe it.", fx = { align = { honor = -1 } } },
        { text = "Die. Honor demands we stand with our people.", next = "BACK", reply = "Then I have failed honor. But I remember them. That is something.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yland = {
      lines = { { id = "yland_x", text = "Forests, endless forests. Before the humans came, before the trolls built their temples, there was only green and the songs of the wild. The blight is a wound. Wounds heal, if someone tends them." } },
      choices = {
        { text = "What does the coin of ancestry mean?", next = "ycoin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfear = {
      lines = { { id = "yfear_x", text = "I am an elder spirit, child. The Scourge cannot touch me. But I fear for the living who walk these roads, and for the druids who would try to heal this land. The dead do not forgive the living for living." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ycoin = {
      lines = { { id = "ycoin_x", text = "The coin of ancestry carries a little of the elders with it. Keep it close in the dark places, and when you feel alone, remember that the old ones walked before you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Windrun, an elder of my people. At the turning of the year we come back among the living, and those who seek us out are honored in turn." },
        { id = "yh_nelf", when = { race = "NightElf" }, text = "Child of the Kaldorei. Even here, in the blight, you shine like the moon on still water. Sit with me, if you will." },
      },
      again = { { id = "h_again", text = "Ask what you will. The night is long." } },
      choices = {
        { text = "Why stand here, of all places?", next = "here" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "Does Elune still watch the Kaldorei?", next = "elune", when = { race = "NightElf" } },
        { text = "Who were you in life?", next = "ylife" },
        { text = "What do you remember of this land?", next = "yland" },
        { text = "Do you fear the Scourge?", next = "yfear" },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    here = {
      lines = { { id = "he_default", text = "Because the living who come here need hope more than any. An elder in a garden reminds no one of anything; an elder in the blight reminds them the world was not always like this." } },
      choices = {
        { text = "This land is lost. Better to burn it clean.", next = "BACK", reply = "Fire is quick, and the healing after it is slow. I have seen both.", fx = { align = { light = -1 } } },
        { text = "Then it can be healed, one day.", next = "BACK", reply = "One day. The elders measure in long days.", fx = { align = { light = 1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "The new year, and the night the Moonglade calls the elders home. Those who honor us receive a coin of ancestry, and with it, a small part of our blessing." } },
      choices = {
        { text = "What happens in the Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "mo_default", text = "Lanterns, music and the lifting of the moon over the lake. The druids keep the festival there, and Omen's old grief is remembered too, though few speak of it lightly." } },
      choices = { { text = "Then I'll see it for myself. Something else.", next = "BACK" } },
    },
    honor = {
      narr = "He bows his head, and the air around him cools like a summer evening.",
      lines = { { id = "ho_default", text = "Then I accept, gladly. Take this coin, and carry my blessing with you through the dark lands." } },
      choices = { { text = "Thank you, Elder Windrun.", next = "BACK" } },
    },
    elune = {
      lines = { { id = "el_default", text = "She watches, though her light falls slant in these lands. Pray to her under open sky when you can, and she will know you even here." } },
      choices = { { text = "I will, Elder.", next = "BACK" } },
    },
  },
  topics = {
    moonglade = { { id = "ytp_mg", text = "The Moonglade calls us home each year. It is the most beautiful place in all the world." } },
    kaldorei = { { id = "ytp_kal", text = "The Kaldorei endure. We always have." } },
    background = { { id = "tp_bg", text = "I walked these lands long before humans named them. Now I return once a year, at the festival." } },
    _none = { { id = "tp_none", text = "The dead do not know everything, child. Ask the living." } },
  },
}

-- Emissary Gormok: Horde emissary at Light's Hope who wants the Plaguelands towers taken for the Horde.
P:NPC {
  key = "epl_gormok", id = 17072, name = "Emissary Gormok", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "horde" }, temper = { "blunt", "practical" }, values = { "strength", "honor" },
  notices = { "faction" },
  impression = {
    first = "An orc emissary standing at Light's Hope with the patience of a man waiting for a fight.",
    third = "{name} met Emissary Gormok, who speaks for the Horde's war over the Plaguelands towers.",
  },
  greetings = {
    { id = "g_default", text = "Lok'tar. The Horde needs strong arms out on the towers, not standing around a chapel." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "The truce of this chapel holds, human-friend. Out on the towers, it does not." },
  },
  notice = {
    { id = "n_orc", cat = "faction", when = { race = "Orc" },
      text = "Another son of the Horde. Good. These towers will not take themselves." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "I fought in the internment camps' breakout with Thrall, when the humans kept us penned like pigs. Then at Hyjal, against the Legion. Now I stand at a human chapel and talk. Thrall says this is also war. I believe him, mostly." } },
      choices = {
        { text = "You were at Hyjal?", next = "yhyjal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhyjal = {
      lines = { { id = "yhyjal_x", text = "I was. Humans, elves and orcs, side by side, against the demons. I fought beside a human knight there. He saved my life. I do not know his name. Should I tell my warriors to remember that, or forget it?" } },
      choices = {
        { text = "Remember it. Enemies can become allies.", next = "BACK", reply = "Aye. That is Thrall's way, too. I will tell them.", fx = { align = { honor = 1 } } },
        { text = "Forget it. The Alliance is the enemy now.", next = "BACK", reply = "Hm. Harder words. I will think on them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydawn = {
      lines = { { id = "ydawn_x", text = "They fight the Scourge and ask nothing about which banner you serve. That is honor. I give them respect, and I keep the Horde's business outside their walls, as they ask." } },
      choices = {
        { text = "Which tower is hardest to take?", next = "ytowers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yforsaken = {
      lines = { { id = "yforsaken_x", text = "The Forsaken fight the Scourge harder than anyone. That much I trust. Their apothecaries, I trust less. I watch them as I watch the ghouls, with my axe close." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ytowers = {
      lines = { { id = "ytowers_x", text = "Northpass is the hardest, close to the Plaguewood. Crown Guard is the easiest, but the Alliance love it. Eastwall watches the road to Stratholme. Take them in any order, but take them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Gormok, emissary of the Warchief. The Horde means to hold the old towers of these lands, and I am here to see that it does." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren. Good. Your people hold ground like mountains. Take the towers, and hold them the same way." },
      },
      again = { { id = "h_again", text = "More questions? Ask them fast." } },
      choices = {
        { text = "Which towers?", next = "towers" },
        { text = "Why does the Horde want them?", next = "why" },
        { text = "What would you have me do?", next = "task", when = { faction = "Horde" } },
        { text = "And the Alliance wants them too?", next = "rivals" },
        { text = "Where did you fight before this?", next = "ylife" },
        { text = "What do you think of the Argent Dawn?", next = "ydawn" },
        { text = "Do you trust the Forsaken?", next = "yforsaken" },
        { text = "I'll go.", next = "END" },
      },
    },
    towers = {
      lines = { { id = "t_default", text = "Crown Guard, Eastwall, Northpass and the Plaguewood tower. Old human keeps, mostly empty except for ghouls and crows. Whoever holds them holds the roads." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "The Scourge march down those roads, and the dead are not going to stop because the humans lost their kingdom. If the Horde holds the towers, the Horde decides who passes." } },
      choices = {
        { text = "The towers are for fighting the Scourge, not each other.", next = "BACK", reply = "Tell that to the dwarves. They had banners up before we did.", fx = { align = { honor = 1 } } },
        { text = "Then the Horde should take them all.", next = "BACK", reply = "Good. That is the right answer.", fx = { align = { honor = -1 } } },
      },
    },
    task = {
      lines = { { id = "ta_default", text = "Go to the towers and raise the Horde's banner over them. When we hold them, our defenses are stronger, and the Scourge dies faster for it." } },
      choices = {
        { text = "And if the Alliance holds them already?", next = "rivals" },
        { text = "It will be done.", next = "BACK" },
      },
    },
    rivals = {
      lines = { { id = "r_default", text = "Emissary Whitebeard stands over there, smiling into his beard, with the same orders I have. We drink at the same fire inside these walls, and outside them we do our duty." } },
      choices = {
        { text = "An honorable rivalry, then.", next = "rivals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals2 = {
      lines = { { id = "r2_default", text = "Honorable enough. He has never lied to me, and I have never cut his throat while he slept. In these lands, that is nearly friendship." } },
      choices = { { text = "Ha. Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "ytp_thrall", text = "Thrall freed us from the camps. I would follow him anywhere, even here." } },
    hyjal = { { id = "ytp_hyjal", text = "I fought at Hyjal. The Legion burned, and so did many of us. I remember." } },
    background = { { id = "tp_bg", text = "I fought in the Warchief's wars and now I fight with words, mostly. I do not like it as much." } },
    _none = { { id = "tp_none", text = "I don't know. Ask the Argent Dawn; they know everything here." } },
  },
}

-- Emissary Whitebeard: Alliance (dwarven) emissary at Light's Hope, rival of Gormok for the towers.
P:NPC {
  key = "epl_whitebeard", id = 17069, name = "Emissary Whitebeard", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "alliance" }, temper = { "jovial", "shrewd" }, values = { "duty", "loyalty" },
  notices = { "faction" },
  impression = {
    first = "A dwarf emissary with a beard white as Dun Morogh snow and a grin that doesn't reach his eyes.",
    third = "{name} met Emissary Whitebeard, who speaks for the Alliance's claim on the Plaguelands towers.",
  },
  greetings = {
    { id = "g_default", text = "Well met! The Alliance needs good folk on the towers, and ye look good enough to me." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Hmph. Chapel's under truce, so I'll be civil. Don't ask me about the towers, though." },
  },
  notice = {
    { id = "n_dwarf", cat = "faction", when = { race = "Dwarf" },
      text = "A dwarf! Good to hear a proper accent among all these Lordaeron vowels." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "The Alliance army in the Second War, as a quartermaster under Lord Lothar. I've counted barrels and argued with orcs for longer than most humans have been alive. Here I'm doin' the same, only with towers." } },
      choices = {
        { text = "You fought the orcs, then. Now you parley.", next = "yparley" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yparley = {
      lines = { { id = "yparley_x", text = "Aye. Strange times. Gormok's a decent sort, for an orc. But the High Council wants Alliance banners on every tower. Should we share them with the Horde to fight the Scourge, or keep them for ourselves?" } },
      choices = {
        { text = "Share them. The Scourge is the real enemy.", next = "BACK", reply = "Hm. Ye sound like the Argent Dawn. I'll mention it, quietly.", fx = { align = { honor = 1 } } },
        { text = "Keep them. The Alliance bled for this land.", next = "BACK", reply = "Aye! That's the spirit. The High Council will be pleased.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytowers = {
      lines = { { id = "ytowers_x", text = "Garrison them properly, with dwarven stone and good gunners. The humans built them for show. I'd build them for war, and the ghouls would learn to stay away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ydrink = {
      lines = { { id = "ydrink_x", text = "Every night, by the chapel fire. He drinks grog and I drink stout, and we argue about the towers. We've never once agreed, and we've never once come to blows. That's diplomacy." } },
      choices = {
        { text = "How did your beard go so white?", next = "ybeard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybeard = {
      lines = { { id = "ybeard_x", text = "Went white overnight, the day I saw Stratholme burning from the road. Me ma always said a fright would whiten a beard. I didnae believe her till then." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Whitebeard, emissary for the Alliance. Me orders are simple: get our banners up on the old towers before the Horde does." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "A son of Khaz Modan! Good. Ye'll know what a tower's worth, then. Stone holds, and so do dwarves." },
      },
      again = { { id = "h_again", text = "Aye? What else, then?" } },
      choices = {
        { text = "Why do the towers matter?", next = "why" },
        { text = "What can I do?", next = "task", when = { faction = "Alliance" } },
        { text = "What do you think of Gormok?", next = "gormok" },
        { text = "Where did you serve before?", next = "ylife" },
        { text = "What would you do with the towers?", next = "ytowers" },
        { text = "Do you ever drink with Gormok?", next = "ydrink" },
        { text = "Goodbye, Emissary.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Hold the towers and ye hold the roads, and with the roads, the way to the Scourge. Outposts there mean our soldiers can strike out and come back alive." } },
      choices = {
        { text = "Do the outposts serve the Alliance, or everyone?", next = "serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    serve = {
      lines = { { id = "s_default", text = "The Alliance first, and everyone after, if I'm being honest. A tower full of dwarves kills Scourge whoever's watching." } },
      choices = {
        { text = "Alliance first is right. We built this land.", next = "BACK", reply = "Ha! That's the spirit, and the king'd agree with ye.", fx = { align = { honor = -1 } } },
        { text = "The dead don't care whose banner flies.", next = "BACK", reply = "No, they don't, and maybe that's the wiser view.", fx = { align = { honor = 1 } } },
      },
    },
    task = {
      lines = { { id = "t_default", text = "Take the towers. Crown Guard, Eastwall, Northpass and Plaguewood. Raise our banners and hold them long enough to set up proper outposts." } },
      choices = { { text = "Consider them taken.", next = "BACK" } },
    },
    gormok = {
      narr = "He glances across the chapel grounds and lifts his mug an inch.",
      lines = { { id = "g2_default", text = "A decent sort for an orc. Honest, at least, which is more than I can say for half the nobles of Stormwind. I'll still take every tower off him I can." } },
      choices = {
        { text = "Can the Horde and Alliance share this fight?", next = "share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    share = {
      lines = { { id = "sh_default", text = "Inside the chapel we already do, lad. Outside, it's politics, and politics is above me pay." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    gormok = { { id = "ytp_gormok", text = "Gormok's an orc I'd trust with my back, if not my towers." } },
    high_council = { { id = "ytp_hc", text = "The High Council in Ironforge wants every tower flying our flag. I'm doin' my best." } },
    background = { { id = "tp_bg", text = "Ironforge born, Second War veteran, and now a talker instead of a fighter. Me knees prefer it." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask one o' the Dawn's lot." } },
  },
}

-- Master Craftsman Omarion: a Brotherhood craftsman held captive inside Naxxramas.
P:NPC {
  key = "epl_omarion", id = 16365, name = "Master Craftsman Omarion", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "argent_dawn" }, temper = { "weary", "dutiful" }, values = { "craft", "duty" },
  notices = { "class" },
  impression = {
    first = "A wounded craftsman in a Scourge cage, still talking about leather and steel as if that kept him alive.",
    third = "{name} found Master Craftsman Omarion caged inside Naxxramas, near death but still teaching.",
  },
  greetings = {
    { id = "g_default", text = "You're real? You're not one of them? Light be praised, then listen quickly, for I've not much time." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I'm still here, if a bit less of me." },
  },
  notice = {
    { id = "n_hurt", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Save your prayers for someone who can still walk out of here. I want you to listen instead." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "The Brotherhood's best craftsman, if I may say it without pride. I made the armor of half the knights at Light's Hope, and all of their buckles. I could tell a knight's rank by the wear on his greaves." } },
      choices = {
        { text = "How were you taken?", next = "ytaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = { { id = "yfamily_x", text = "A daughter in Stormwind, apprenticed to a tailor. She thinks I'm on a long errand for the Brotherhood. If you see her, tell her the errand ran long. Don't tell her where." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yrefuse = {
      lines = { { id = "yrefuse_x", text = "Because what I'd make would kill thousands. My life is one life. Some would say a craftsman should make what he must and live to fight again. What would you say?" } },
      choices = {
        { text = "You're right. No life is worth that.", next = "BACK", reply = "Thank you. I needed to hear someone say it. Take the handbook.", fx = { align = { light = 1 } } },
        { text = "Make the armor, then sabotage it. Live.", next = "BACK", reply = "Clever. Too clever for them, perhaps. They'd know. They always know.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytaken = {
      lines = { { id = "ytaken_x", text = "I was taken on the road from Light's Hope to Tyr's Hand, scouting for iron. The ghouls came out of the ground. I woke here, in the cold. Every night, the cold is worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Omarion, master craftsman of the Brotherhood of the Light. They took me to make armor for the dead, and I refused. I'm dying for it, but I'm not done yet." },
        { id = "yh_smith", when = { profession = "Blacksmithing" }, text = "A smith! Your hands, show me your hands. Yes. Burn scars in the right places. You'll understand what I've written. Listen closely." },
      },
      again = { { id = "h_again", text = "Ask. Every breath is borrowed." } },
      choices = {
        { text = "Can I free you?", next = "free" },
        { text = "What do you want me to know?", next = "teach" },
        { text = "What did they want you to make?", next = "make" },
        { text = "Can you teach a leatherworker?", next = "craftsmen", when = { profession = "Leatherworking" } },
        { text = "Who were you, before the cage?", next = "ylife" },
        { text = "Do you have family?", next = "yfamily" },
        { text = "Why refuse them? You'll die.", next = "yrefuse" },
        { text = "Rest easy, craftsman.", next = "END" },
      },
    },
    free = {
      lines = { { id = "f_default", text = "No. The poison's in my blood, and the cage is the least of it. Don't waste the strength trying." } },
      choices = {
        { text = "I won't leave you to die here.", next = "BACK", reply = "Kind, and foolish. Fight the master of this place instead; that is how you help me.", fx = { align = { light = 1 } } },
        { text = "Then your knowledge is what matters now.", next = "BACK", reply = "Hard, but right. Let's not waste it.", fx = { align = { light = -1 } } },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Everything I learned in this place: how to work the frozen runes and the cold leathers they use, how to set them into armor that resists the cold of the dead. I've written it down for you, and craftsmen can learn it." } },
      choices = {
        { text = "Where have you written it?", next = "handbook" },
        { text = "Something else.", next = "BACK" },
      },
    },
    handbook = {
      narr = "He presses a stained book through the bars with shaking hands.",
      lines = { { id = "hb_default", text = "Here, my handbook. Take it to any craftsman you trust and they'll learn from it what they can. Promise me it won't burn with me." } },
      choices = { { text = "I promise.", next = "BACK" } },
    },
    make = {
      lines = { { id = "m_default", text = "Armor for their death knights, the ones who'll ride out when this citadel's master wills it. I'd sooner die than forge a single plate for them." } },
      choices = {
        { text = "Death knights? What are they?", next = "dk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dk = {
      lines = { { id = "dk_default", text = "Fallen warriors raised to serve, with all their old skill and none of their mercy. There's one teaching them now, in the halls past this cage. Pray you never fight them in the open." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    craftsmen = {
      lines = { { id = "c_default", text = "Leather, mail, cloth, plate, I worked them all. Bring my handbook to anyone with the skill, and they'll find a pattern in it for what you wear." } },
      choices = { { text = "Thank you, Omarion.", next = "BACK" } },
    },
  },
  topics = {
    brotherhood = { { id = "ytp_bro", text = "The Brotherhood of the Light makes armor for those who fight the dead. I was their best. I hope I still am." } },
    light_hope = { { id = "ytp_lh", text = "Light's Hope Chapel. I'd give anything to see it again." } },
    background = { { id = "tp_bg", text = "A craftsman of the Brotherhood, and a prisoner of Naxxramas. That's the whole of it now." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to guess." } },
  },
}

-- Packmaster Stonebruiser: Brotherhood of the Light dwarf who takes craftsman's writs at Light's Hope.
P:NPC {
  key = "epl_stonebruiser", id = 16283, name = "Packmaster Stonebruiser", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "argent_dawn" }, temper = { "gruff", "busy" }, values = { "craft", "practical" },
  notices = { "race" },
  impression = {
    first = "A thick-armed dwarf surrounded by crates, counting everything twice.",
    third = "{name} met Packmaster Stonebruiser, who supplies the Brotherhood of the Light at Light's Hope.",
  },
  greetings = {
    { id = "g_default", text = "Mind the crates! If ye've a writ, hand it over. If ye haven't, find one." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I hope ye brought something heavy." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ah, a proper dwarf. Ye'll know how to stack a crate so it doesnae fall on someone." },
  },
  start = "hello",
  nodes = {
    yhome = {
      lines = { { id = "yhome_x", text = "Ironforge, the Commons. My clan's been carters and packmasters for six generations. I came north with the Brotherhood because nobody else could keep their crates straight, and I've kept them straight since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ysupply = {
      lines = { { id = "ysupply_x", text = "Thorium and runecloth, every day, every week. And bandages. The healers go through bandages like a gnome goes through gears. If ye've any to spare, bring them to me." } },
      choices = {
        { text = "What will you do after the war?", next = "ychickens" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycheat = {
      lines = { { id = "ycheat_x", text = "Oh, aye, a few. A human brought me a writ for twenty bolts, and half were linen dyed to look like runecloth. I caught him. Should I report him to the Dawn, or let him off with a warnin'?" } },
      choices = {
        { text = "Report him. Cheats endanger the soldiers.", next = "BACK", reply = "Aye. That's my view. I'll send the bolts to the captain with a note.", fx = { align = { honor = 1 } } },
        { text = "Warn him. He'll do better, out of shame.", next = "BACK", reply = "Hmph. Soft, but maybe right. I'll make him count every bolt twice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychickens = {
      lines = { { id = "ychickens_x", text = "Go home and count something peaceful, like kegs. My cousin keeps a tavern in Thelsamar. I've promised him I'll tally his cellar when the dead stop walkin'. He's been waitin' a good while." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Stonebruiser, packmaster for the Brotherhood. Every blade, potion and bandage this chapel uses against the citadel comes through my hands." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "A fellow dwarf! Good, good, ye'll know how to count a crate properly. The humans here count like they're scared of numbers." },
      },
      again = { { id = "h_again", text = "What is it now?" } },
      choices = {
        { text = "What's a craftsman's writ?", next = "writ" },
        { text = "What does the Brotherhood need most?", next = "need" },
        { text = "Is the Brotherhood winning?", next = "winning" },
        { text = "I've a writ to turn in.", next = "turnin", when = { questDone = TODO_QUEST("Craftsman's Writ - Dense Weightstone") } },
        { text = "Where are you from?", next = "yhome" },
        { text = "What's the most important supply?", next = "ysupply" },
        { text = "Does anyone ever cheat the writs?", next = "ycheat" },
        { text = "I'll leave ye to it.", next = "END" },
      },
    },
    writ = {
      lines = { { id = "w_default", text = "A contract from the Dawn. The writ says what we need, ye make it or find it, and I pay ye in the Dawn's thanks and a wee bit more. Weightstones, potions, battle chickens, whatever the war asks." } },
      choices = {
        { text = "Battle chickens?", next = "chicken" },
        { text = "I'll take a writ.", next = "offer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chicken = {
      lines = { { id = "c_default", text = "Gnomish ones, mechanical. Don't laugh. The ghouls don't know what to make of them, and a confused ghoul is a dead ghoul." } },
      choices = { { text = "I'm not laughing. Something else.", next = "BACK" } },
    },
    offer = {
      lines = { { id = "o_default", text = "Good. Here's one for dense weightstones; every sword in this chapel needs sharpening twice a day." } },
      choices = { { text = "I'll be back with them.", next = "BACK" } },
    },
    need = {
      lines = { { id = "n_default", text = "Everything, all at once, and yesterday. But mostly people who'll do the boring work without complaint, because wars are won with supplies." } },
      choices = {
        { text = "Glory's earned on the field, not in a storeroom.", next = "BACK", reply = "Then go get yer glory, and come back when ye need yer armor mended.", fx = { align = { order = -1 } } },
        { text = "A well-stocked army wins. I'll help.", next = "BACK", reply = "That's the talk I like to hear.", fx = { align = { order = 1 } } },
      },
    },
    winning = {
      lines = { { id = "wi_default", text = "We're holding, which out here is the same as winning. Ask me again when that thing's fallen out of the sky." } },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
    turnin = {
      lines = { { id = "t_default", text = "Aye, I remember yer last batch; good work it was. Hand it over and I'll mark it in the book." } },
      choices = { { text = "Here you go.", next = "BACK" } },
    },
  },
  topics = {
    ironforge = { { id = "ytp_if", text = "Ironforge's crates are the straightest in the world. I learned there." } },
    runecloth = { { id = "ytp_rc", text = "Runecloth, aye. Bring me every bolt ye can." } },
    background = { { id = "tp_bg", text = "Ironforge quartermaster for thirty years, and now this. I've counted worse." } },
    _none = { { id = "tp_none", text = "Not my department. Ask Dawnbringer." } },
  },
}

-- Argent Medic: dwarven healers of the Argent Dawn who cure ghoul rot and maggot slime.
P:NPC {
  key = "epl_argent_medic", id = 16284, name = "Argent Medic", gender = "male",
  role = "priest", tier = "service",
  communities = { "argent_dawn" }, temper = { "brisk", "kind" }, values = { "mercy", "duty" },
  notices = { "kit" },
  impression = {
    first = "A dwarf in Argent tabard with sleeves rolled up and a bag of bandages.",
    third = "{name} met an Argent Medic who treats the plagues of these lands.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's ye, an' still in one piece! Sit down anyway, an' let me look ye over just tae be sure." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. I'll patch ye up, since that's my oath, but I'll not be gentle about it." },
    { id = "g_default", text = "Anything rotting on ye? Ghoul rot, maggot slime? Speak up, I've seen it all." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.5 } },
      text = "By the Light, sit down before ye fall down." },
  },
  start = "hello",
  nodes = {
    yhome = {
      lines = { { id = "yhome_x", text = "Thelsamar, by Loch Modan. My da was a herbalist and my ma was a surgeon in the Second War. I took my oath to the Dawn because I couldnae stand the thought of folk dyin' of rot when I could stop it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylose = {
      lines = { { id = "ylose_x", text = "Aye, more than I'd like. The plague gets into the blood, and some folk turn before I can do a thing. The hardest is when they beg me to finish it before they rise. Should a healer do that, d'ye think?" } },
      choices = {
        { text = "The Light works through your bandages as much as any prayer.", next = "BACK", reply = "Aye, so it does. I say a prayer wi' every knot, an' not one's gone untied.", fx = { align = { light = 1 } } }, -- dp_stance
        { text = "Prayers do nothing out here. Only your needle saves anyone.", next = "BACK", reply = "Then ye've not seen what I've seen, but I'll nae argue wi' a patient.", fx = { align = { light = -1 } } }, -- dp_stance
        { text = "Yes. Mercy sometimes means a quick end.", next = "BACK", reply = "Aye. I've done it, twice. I'll nae say more about it.", fx = { align = { light = -1 } } },
        { text = "No. A healer heals, whatever the cost.", next = "BACK", reply = "Spoken like the Light's own. I'll keep tryin', then, to the last breath.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycure = {
      lines = { { id = "ycure_x", text = "Maggot slime's best treated with a poultice of Light-blessed moss and a good stiff drink, the drink bein' for me. And ghoul rot answers to silver salts, which cost the Dawn a fortune. Some days I think the gold's worth more than the healin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm a medic of the Argent Dawn. If the Dawn trusts ye, I'll cure what the Scourge has put in yer blood." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "A fellow dwarf! Sit down, laddie, let me look at ye. Ye've a bit of ghoul on yer boot, but otherwise ye're as fit as a Dun Morogh ram." },
      },
      again = { { id = "h_again", text = "Anything else ailing ye?" } },
      choices = {
        { text = "What's the worst case you've treated?", next = "xworst" },
        { text = "How did you learn to heal?", next = "xlearn" },
        { text = "I'm Forsaken. Can you treat me?", next = "xdead", when = { race = "Scourge" } },
        { text = "What sicknesses do you see?", next = "sick" },
        { text = "Why does it depend on the Dawn's trust?", next = "trust" },
        { text = "Where are you from?", next = "yhome" },
        { text = "Do you ever lose patients?", next = "ylose" },
        { text = "What's the oddest cure you know?", next = "ycure" },
        { text = "I'm well, thanks.", next = "END" },
      },
    },
    sick = {
      lines = { { id = "s_default", text = "Ghoul rot from their bites, maggot slime from the plague beasts. Neither kills fast, but both kill sure, if they're left." } },
      choices = {
        { text = "How do you cure it?", next = "cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure = {
      lines = { { id = "c_default", text = "Holy water, a strong stomach, and prayer. The Light does most of it; I just keep the patient from thrashing." } },
      choices = { { text = "Thank you for your work.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "t_default", text = "The cures are scarce, and they go to those who've fought beside us. Harsh, but there's only so much to go round." } },
      choices = {
        { text = "Healing should go to anyone who needs it.", next = "BACK", reply = "In a better world, aye. This one's not.", fx = { align = { light = 1 } } },
        { text = "Fair. Those who fight should come first.", next = "BACK", reply = "That's how the Dawn sees it.", fx = { align = { light = -1 } } },
      },
    },
    xworst = {
      lines = {
        { id = "xw1", text = "A lad brought in from the Plaguewood with maggot slime in both eyes. We saved one eye, and he went back out with it, and I've not seen him since." },
      },
      choices = {
        { text = "Do you ever lose hope?", next = "xhope" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xhope = {
      lines = {
        { id = "xh1", text = "Every morning, and I find it again by noon. Ye can't heal folk if ye believe they're all doomed, so I don't believe it, even when the evidence says otherwise." },
      },
      choices = {
        { text = "Hope is all we have here.", next = "BACK", reply = "Aye, that an' bandages.", fx = { align = { light = 1 } } },
        { text = "Hope won't save anyone. Skill will.", next = "BACK", reply = "True enough. Good thing I've got some of both.", fx = { align = { light = -1 } } },
      },
    },
    xlearn = {
      lines = {
        { id = "xl1", text = "At the knee of a priestess in Andorhal, before it fell. She taught me prayer an' poultices both, an' said the Light works best through steady hands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdead = {
      lines = {
        { id = "xd1", text = "Treat ye? I'm not certain what I'd treat. Ye've no blood for the rot to get in, but if something's crawlin' in yer ribs, I'll fish it out, friend." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
      },
    },
  },
  topics = {
    loch_modan = { { id = "ytp_loch", text = "Loch Modan's the bonniest place in the world. I'll see it again, once the dead stop walkin'." } },
    argent_dawn = { { id = "ytp_ad", text = "The Dawn heals any who fight the dead. Even the dead themselves, if they ask nicely." } },
    plaguewood = { { id = "xtp_pw", text = "Never go in there without a medic nearby." } },
    andorhal = { { id = "xtp_an", text = "Where I learned my trade. It's Scourge now." } },
    _none = { { id = "tp_none", text = "Ask someone else. I'm busy keeping people alive." } },
  },
}

-- Injured Argent Dawn Infantry: wounded soldiers resting at Light's Hope.
P:NPC {
  key = "epl_injured_infantry", id = 16229, name = "Injured Argent Dawn Infantry", gender = "male",
  role = "soldier", tier = "service",
  communities = { "argent_dawn" }, temper = { "tired", "stoic" }, values = { "duty" },
  notices = { "kit" },
  impression = {
    first = "A soldier lying on a cot, bandaged and grey-faced.",
    third = "{name} spoke with a wounded Argent Dawn soldier at Light's Hope.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you again! Good, I've been lying here too long, and a friendly face makes the bandages itch less." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'm resting, friend, and I'd rather not have company while I do it." },
    { id = "g_default", text = "Don't mind me. Just resting a bit before I go back out there." },
  },
  start = "hello",
  nodes = {
    ycomrades = {
      lines = { { id = "ycomrades_x", text = "A squad from Southshore, mostly, and a Forsaken scout named Gerard who knew the Plaguewood paths. The Southshore lads didn't like him. He saved three of them when the abomination came. They like him a bit more now." } },
      choices = {
        { text = "Gerard kept his word to that squad. That makes him one of us.", next = "BACK", reply = "That's what I told the Southshore lads, and they'll believe it, given time.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Gerard's still Forsaken. Thank him, then never trust him again.", next = "BACK", reply = "Maybe, but he carried me out of the Plaguewood, and I'll not speak against him.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Where is Gerard now?", next = "ygerard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygerard = {
      lines = { { id = "ygerard_x", text = "He went back out alone, once we were carried in. The captain says Forsaken shouldn't scout for the Dawn without an escort. Should we trust them on their own, or keep watch on them?" } },
      choices = {
        { text = "Trust them. He earned it with blood.", next = "BACK", reply = "Aye. That's what I told the captain. He didn't like it.", fx = { align = { order = -1 } } },
        { text = "Keep watch. The rules keep everyone safe.", next = "BACK", reply = "Hm. Fair. Gerard would probably agree, the strange fellow.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ythink = {
      lines = { { id = "ythink_x", text = "My wife's kitchen, in Southshore. The smell of fish stew. I promised I'd be back by harvest. I'll make it, if the bandages hold and the Dawn lets me go." } },
      choices = {
        { text = "Where did you take the wound?", next = "ycot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycot = {
      lines = { { id = "ycot_x", text = "The cot's hard, but it's better than the ground at Corin's Crossing. That's where I took the wound. A ghoul came up out of a cellar. Never trust a cellar in these lands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Got hit by an abomination near the Plaguewood. Medics say I'll live, but I'm not sure I believe them." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "A dwarf. One of the medics, are ye? No? Pity. I could use some of that dwarven stout they keep for themselves." },
      },
      again = { { id = "h_again", text = "Still here. What is it?" } },
      choices = {
        { text = "Where are you from?", next = "xfrom" },
        { text = "Will you go back out?", next = "xback" },
        { text = "I'm a priest. Let me help.", next = "xheal", when = { class = "PRIEST" } },
        { text = "What happened out there?", next = "story" },
        { text = "Can I get you anything?", next = "help" },
        { text = "Who did you fight beside?", next = "ycomrades" },
        { text = "What do you think about when you rest?", next = "ythink" },
        { text = "Rest well.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Ambush. A patrol of us, and then that thing came out of the trees, all stitches and hooks. Three of us didn't come back." } },
      choices = {
        { text = "I'll avenge them.", next = "avenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    avenge = {
      lines = { { id = "a_default", text = "Do that. But don't go alone, whatever you think of yourself." } },
      choices = {
        { text = "The Scourge must pay for every soldier lost.", next = "BACK", reply = "They will, sooner or later.", fx = { align = { light = -1 } } },
        { text = "I'll do it for the living, not for vengeance.", next = "BACK", reply = "That's a better reason, maybe.", fx = { align = { light = 1 } } },
      },
    },
    help = {
      lines = { { id = "h2_default", text = "Water, maybe. And a word with my sergeant that I'll be back on my feet soon. He'll worry otherwise." } },
      choices = { { text = "I'll tell him.", next = "BACK" } },
    },
    xfrom = {
      lines = {
        { id = "xf1", text = "Hearthglen, before the Scarlets made it their fortress. My brother's still there in red, burning anyone he thinks has a fever, and he'd burn me for wearing the Dawn's colours." },
      },
      choices = {
        { text = "Do you ever speak to him?", next = "xbrother" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xbrother = {
      lines = {
        { id = "xb1", text = "Not in three years. Last I heard he was a captain. I'd like to think he'd stop short of killing me, but I've seen what the Crusade does to people." },
      },
      choices = {
        { text = "The Crusade has gone mad. He's lost to you.", next = "BACK", reply = "Maybe. But I'll keep hoping, Light help me.", fx = { align = { light = -1 } } },
        { text = "Maybe he'll come back to the Light one day.", next = "BACK", reply = "That's what I pray for, every night.", fx = { align = { light = 1 } } },
      },
    },
    xback = {
      lines = {
        { id = "xba1", text = "Soon as I can stand, aye. The Dawn needs every sword, and I'd rather die out there than lie here listening to the others groan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xheal = {
      lines = {
        { id = "xh1", text = "Bless you. The ribs on the left, mostly, and anything you can spare for the shoulder. I'll pray for you next time I'm out in the Plaguewood." },
      },
      choices = {
        { text = "Hold still.", next = "BACK" },
      },
    },
  },
  topics = {
    southshore = { { id = "ytp_ss", text = "Southshore has the best fish stew in Lordaeron. I'll be eating it by harvest." } },
    corins_crossing = { { id = "ytp_cc", text = "Corin's Crossing is a ghoul nest. Avoid the cellars." } },
    scarlet = { { id = "xtp_sc", text = "My brother's one of them. I don't know whether to hate them or pity them." } },
    plaguewood = { { id = "xtp_pw", text = "Where I got this. Don't go there alone." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Ask one of the officers." } },
  },
}

---------------------------------------------------------------------------
-- Darrowshire Spirit: the freed ghosts of Darrowshire's townsfolk, released when
-- the ghouls that fed on them are slain (Hidden Enemies of Darrowshire / Sacred Ground).
---------------------------------------------------------------------------
P:NPC {
  key = "epl_darrowshire_spirit", id = 11064, name = "Darrowshire Spirit",
  role = "citizen", tier = "service",
  temper = { "lost", "grateful" }, values = { "home", "rest" },
  impression = {
    first = "A faint, pale figure rises from the ground where the ghoul fell, blinking as if waking from a long and terrible dream.",
    third = "{name} spoke with a freed spirit of Darrowshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back to see me again! I can feel the light more clearly when you're here, stranger." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'm grateful, truly, but I'd rather face the light alone, if you don't mind." },
    { id = "g_default", text = "I'm free. Oh, Light, I'm free of it. Thank you, stranger, thank you." },
    { id = "g_back", when = { metBefore = true }, text = "Another of us loosed from those things. Bless you for every one." },
  },
  start = "hello",
  nodes = {
    ystable = {
      lines = { { id = "ystable_x", text = "Six stalls and a loft full of hay. I had a grey mare called Bess who'd bite anyone but me. I hope she ran. I hope she's eating someone's turnips in Hillsbrad and biting all the stable boys." } },
      choices = {
        { text = "Tell me more of your sister.", next = "yjoanna" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yblame = {
      lines = { { id = "yblame_x", text = "Blame? We all do, a bit. Some blame Redpath, some blame the Light, some blame King Terenas for letting the Cult grow. Should we forgive them all, now that it's over, or remember?" } },
      choices = {
        { text = "Forgive. You're free now. Let it go.", next = "BACK", reply = "Aye. I'd like that. It feels lighter, saying it.", fx = { align = { light = 1 } } },
        { text = "Remember. Those who failed you shouldn't be forgotten.", next = "BACK", reply = "Perhaps. Someone should remember. Only, not me, I think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypain = {
      lines = { { id = "ypain_x", text = "Not any more. There was, all those years, a cold ache like a winter that never lifted. Now it's only a gentle tug, like someone calling me home for supper. I think I'll answer it soon." } },
      choices = {
        { text = "What about Davil Lightfire?", next = "ydavil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydavil = {
      lines = { { id = "ydavil_x", text = "Davil fought in the square till the end, and he never fell back. I've heard some adventurer's been gathering his old libram and his helm, to lay him to rest. If anyone deserves it, he does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yjoanna = {
      lines = { { id = "yjoanna_x", text = "Joanna had red hair and a temper. If she made it south, she'll have married a smith and bossed him into the ground. Tell her I said that, if you find her. She'll know it's me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I lived in Darrowshire, before the Scourge came. When I died, those creatures kept a piece of me, and I couldn't leave. Now I think I can go home, wherever home is now." },
        { id = "yh_human", when = { race = "Human" }, text = "A human. You look like folk from the south road. Did you come from Southshore, or Hillsbrad? Have you seen anyone from Darrowshire there?" },
      },
      again = { { id = "h_again", text = "I can feel myself fading. Ask quickly, if you've something to ask." } },
      choices = {
        { text = "What was Darrowshire like before?", next = "xbefore" },
        { text = "Do you remember your name?", next = "xname" },
        { text = "Is there anyone you want me to find?", next = "xfind" },
        { text = "What happened at Darrowshire?", next = "battle" },
        { text = "Where will you go now?", next = "go" },
        { text = "What was the stable like?", next = "ystable" },
        { text = "Do you blame anyone for what happened?", next = "yblame" },
        { text = "Is there pain, now?", next = "ypain" },
        { text = "Rest easy, friend.", next = "END" },
      },
    },
    battle = {
      lines = { { id = "ba_default", text = "The dead came out of the north, and we fought them in the square. Davil Lightfire led the defenders, and Captain Redpath stood beside him, until he didn't. I remember the bell ringing and ringing, and then I remember nothing." } },
      choices = {
        { text = "Redpath turned on you?", next = "redpath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    redpath = {
      lines = { { id = "re_default", text = "He fell, and he rose wrong. That's all I know. I hope someone gives him the peace you've given me, even after what he became." } },
      choices = {
        { text = "Even a traitor deserves peace in the end.", next = "BACK", reply = "Aye. He wasn't a traitor while he lived, and that's what I'll remember.", fx = { align = { light = 1 } } },
        { text = "The risen deserve only the blade.", next = "BACK", reply = "Perhaps. You've seen more of them than I have, lately.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    go = {
      lines = { { id = "go_default", text = "To my family, I hope, if they wait for me somewhere. If not, then just somewhere quiet, where nothing hungry can find me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbefore = {
      lines = {
        { id = "xb1", text = "A little town with a well in the square and a bell in the chapel and the best apple pies in the east. On festival days the children ran up and down the green with ribbons." },
      },
      choices = {
        { text = "It sounds peaceful.", next = "BACK", reply = "It was. That's what I'll remember now, not the end of it." },
      },
    },
    xname = {
      lines = {
        { id = "xn1", text = "I think it was Will, or Willem, and I kept the stables by the north road. It's slipping, like everything else, now that I'm free to go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfind = {
      lines = {
        { id = "xf1", text = "My sister Joanna, if she got out. She was meant to be on the carts to the south. If she lives, tell her I thought of her at the end." },
      },
      choices = {
        { text = "I'll look for her.", next = "BACK", reply = "Thank you. That's more than I'd dared hope.", fx = { align = { honor = 1 } } },
        { text = "She's likely dead too. Don't hope.", next = "BACK", reply = "Maybe. But let me hope a little longer, stranger.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    darrowshire = { { id = "ytp_darrow", text = "Darrowshire was a good place. Apple pies, and a bell, and Bess the mare. That's what I'll remember." } },
    joanna = { { id = "ytp_jo", text = "My sister Joanna. Red hair and a temper. I hope she's alive." } },
    redpath = { { id = "xtp_rp", text = "Captain Redpath. He was brave, once." } },
    davil = { { id = "xtp_dv", text = "Davil Lightfire led us. He fought like ten men." } },
  },
}

---------------------------------------------------------------------------
-- Darrowshire Poltergeist: a restless ghost that follows a haunted adventurer.
---------------------------------------------------------------------------
P:NPC {
  key = "epl_darrowshire_poltergeist", id = 11296, name = "Darrowshire Poltergeist",
  role = "citizen", tier = "service",
  temper = { "restless", "insistent" }, values = { "justice", "memory" },
  impression = {
    first = "A cold, flickering shade hovers at your shoulder, muttering about a battle no one else remembers.",
    third = "{name} was haunted for a time by a poltergeist of Darrowshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! At last, someone who listens to me, because no one else ever does." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll mutter at you whether you like it or not, so you may as well stand still for it." },
    { id = "g_default", text = "You can see me. Good. Then you'll listen, because no one else will." },
    { id = "g_back", when = { metBefore = true }, text = "Still here, and so am I. You won't be rid of me that easily." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A cooper. I made barrels for the cider press on the hill. My wife died the winter before, and it was only me and Ellie. I made her a little barrel to keep her doll in. I wonder if she still has it." } },
      choices = {
        { text = "Where did the carts go?", next = "ycart" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yangry = {
      lines = { { id = "yangry_x", text = "Because the ghouls still feed on us! On our bones! Every night I watch them. Every night I can't stop them. Do you know what that's like, to be a ghost who can't even throw a stone?" } },
      choices = {
        { text = "What would you have me do?", next = "ywant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywant = {
      lines = { { id = "ywant_x", text = "Kill them, all of them, and leave nothing standing in Darrowshire. Or don't, and let the town rest as it is, ruins and all. I hardly know any more. Which would you do?" } },
      choices = {
        { text = "Burn it all clean. Leave nothing for the Scourge.", next = "BACK", reply = "Yes. Burn it. Burn every rotting beam, if it frees us.", fx = { align = { order = -1 } } },
        { text = "Kill the ghouls, but leave the town. It's still yours.", next = "BACK", reply = "Still mine? Aye. Perhaps it is. Perhaps someone will rebuild.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yredpath = {
      lines = { { id = "yredpath_x", text = "The captain? He stood with us in the square. Then he fell, and he rose, and he led them through the gate. I saw his face. It was still his face. That's the worst of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ycart = {
      lines = { { id = "ycart_x", text = "The carts went south, to Corin's Crossing, and maybe further. I heard the driver was a fat man named Bram, who swore he'd go to Hillsbrad. If Ellie's anywhere, she's with him. Find him, if you can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I died at Darrowshire, and I've not been allowed to stop dying since. I follow whoever disturbs me, and today that's you. Don't take it personally." },
        { id = "yh_paladin", when = { class = "PALADIN" }, text = "A paladin. Where were you, when the bell rang? Where was the Light then? No. Don't answer. You'll only make me angrier." },
      },
      again = { { id = "h_again", text = "Do you mean to help me, or just keep walking? I'll come either way." } },
      choices = {
        { text = "What was your daughter's name?", next = "xdaughter" },
        { text = "What happened to Darrowshire?", next = "xtown" },
        { text = "Why can I see you?", next = "xsee" },
        { text = "How do I lay you to rest?", next = "rest" },
        { text = "How did you die?", next = "death" },
        { text = "Who were you, before?", next = "ylife" },
        { text = "Why are you angry?", next = "yangry" },
        { text = "Do you remember Joseph Redpath?", next = "yredpath" },
        { text = "Leave me be, spirit.", next = "END" },
      },
    },
    rest = {
      lines = { { id = "re_default", text = "Kill the things that still feed on Darrowshire. Every ghoul you put down lets one of us go. I don't know if it will be me, but it might be." } },
      choices = {
        { text = "I'll avenge Darrowshire, then.", next = "BACK", reply = "Good. Swing hard. They deserve it.", fx = { align = { honor = 1 } } },
        { text = "I'm not here to settle a ghost's grudges.", next = "BACK", reply = "Then I'll keep haunting you until you are.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    death = {
      lines = { { id = "de_default", text = "A ghoul took my leg, and then the rest of me. I remember thinking of my little girl, and that she'd got out on the cart. I hope she got out on the cart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdaughter = {
      lines = {
        { id = "xd1", text = "Little Ellie, with hair like straw and a doll she'd never put down. I put her on a cart and told her I'd be right behind, and then I wasn't." },
      },
      choices = {
        { text = "Maybe she survived.", next = "xsurv" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xsurv = {
      lines = {
        { id = "xs1", text = "Maybe. Some of the carts got away, they say, to Corin's Crossing or further. If you find her, don't tell her what became of me; tell her I was brave." },
      },
      choices = {
        { text = "I'll tell her the truth. She deserves it.", next = "BACK", reply = "Then tell it gently, please.", fx = { align = { honor = 1 } } },
        { text = "I'll tell her you were brave. That's enough.", next = "BACK", reply = "Thank you. Let her keep that.", fx = { align = { honor = -1 } } },
      },
    },
    xtown = {
      lines = {
        { id = "xt1", text = "The dead came out of the north and the defenders fell, and then the defenders rose against us. I remember the bell ringing, and then I don't remember anything at all." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsee = {
      lines = {
        { id = "xse1", text = "I don't know. Perhaps you've seen enough death to have an eye for it. Most can't, and most walk right through me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darrowshire = { { id = "ytp_darrow", text = "Darrowshire. My home. The dead won't leave it, and neither will I." } },
    corins_crossing = { { id = "ytp_corin", text = "The carts went to Corin's Crossing. That's all I know. That's all I'll ever know." } },
    ellie = { { id = "xtp_pa", text = "My little girl. She got out on the cart. She must have." } },
    ghouls = { { id = "xtp_gh", text = "They still feed here. Kill them, and some of us go free." } },
  },
}
