-- Eastern Plaguelands: Light's Hope folk a roster scan found with no conversation yet: an Argent sentry,
-- Field Marshal Chambers, the druid Rayne of the Cenarion Circle and Craftsman Wilhelm of the Brotherhood
-- of the Light. Voice: bibles/lightshope_dawn.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC = P.TODO_NPC

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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a dwarf smith o' the Brotherhood o' the Light, an' I've forged against the Scourge for years." } },
    _none = { { id = "tp_none", text = "Cannae help ye, {g:lad|lass}. Ask the Dawn's folk." } },
  },
}
