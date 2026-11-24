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
    hello = {
      lines = { { id = "h_default", text = "I am Angela Dosantos, archmage of the Brotherhood of the Light. Kel'Thuzad has raised Naxxramas above the Plaguewood, and I mean to learn how to break its doors." } },
      again = { { id = "h_again", text = "What else would you ask? Be brief; my notes will not write themselves." } },
      choices = {
        { text = "What is Naxxramas?", next = "naxx" },
        { text = "Who are the Brotherhood of the Light?", next = "brotherhood" },
        { text = "How does one get inside the citadel?", next = "attune" },
        { text = "Is there anything a mage could learn from it?", next = "frostfire", when = { class = "MAGE" } },
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
      lines = { { id = "ta_default", text = "Earn the Dawn's high regard, and bring me the coin they ask. Then I will grant you passage through the citadel's wards, and pray you are strong enough for what is beyond them.", fx = { offer = TODO_QUEST("The Dread Citadel - Naxxramas") } } },
      choices = { { text = "I'll come back when I'm ready.", next = "BACK" } },
    },
    frostfire = {
      lines = { { id = "f_default", text = "The citadel's guardians wear garments woven with frost and flame together, and the Brotherhood has learned to remake them. Bring me what the necropolis yields and I will show you the equation that binds the two.", fx = { offer = TODO_QUEST("The Elemental Equation") } } },
      choices = { { text = "Fire and frost in one weave? I'll bring them.", next = "BACK" } },
    },
  },
  topics = {
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
        { text = "Farewell, Commander.", next = "END" },
      },
    },
    echoes = {
      lines = { { id = "e_default", text = "The Scourge are stronger than they have been since Lordaeron fell, and they strike far from these lands now. Go out and cut them down wherever they gather, and bring me proof. Every one you kill is a raid that never comes.", fx = { offer = TODO_QUEST("Echoes of War") } } },
      choices = {
        { text = "Why are they stronger now?", next = "stronger" },
        { text = "I'll go hunting.", next = "BACK" },
      },
    },
    stronger = {
      lines = { { id = "s_default", text = "Because Kel'Thuzad has his citadel back, and with it the full strength of his necromancy. Scourge activity has grown tenfold, and there are reports from as far away as Kalimdor." } },
      choices = {
        { text = "Then we strike the citadel itself, and soon.", next = "BACK", reply = "Soon, but not blindly. We will lose the best we have if we rush.", fx = { align = { mercy = -1 } } },
        { text = "First we protect the villages he threatens.", next = "BACK", reply = "Aye. A soldier who forgets the people he guards is only a man with a sword.", fx = { align = { mercy = 1 } } },
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
    redemption = {
      lines = { { id = "r_default", text = "There is. The Brotherhood forges the Redemption armor from what the necropolis yields, and it is meant for those who carry the Light into the dark. Bring the pieces, and the smiths will do the rest." } },
      choices = { { text = "I'll earn it, Commander.", next = "BACK" } },
    },
  },
  topics = {
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
    hello = {
      lines = { { id = "h_default", text = "I am Windrun, an elder of my people. At the turning of the year we come back among the living, and those who seek us out are honored in turn." } },
      again = { { id = "h_again", text = "Ask what you will. The night is long." } },
      choices = {
        { text = "Why stand here, of all places?", next = "here" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "Does Elune still watch the Kaldorei?", next = "elune", when = { race = "NightElf" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    here = {
      lines = { { id = "he_default", text = "Because the living who come here need hope more than any. An elder in a garden reminds no one of anything; an elder in the blight reminds them the world was not always like this." } },
      choices = {
        { text = "This land is lost. Better to burn it clean.", next = "BACK", reply = "Fire is quick, and the healing after it is slow. I have seen both.", fx = { align = { mercy = -1 } } },
        { text = "Then it can be healed, one day.", next = "BACK", reply = "One day. The elders measure in long days.", fx = { align = { mercy = 1 } } },
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
      lines = { { id = "ho_default", text = "Then I accept, gladly. Take this coin, and carry my blessing with you through the dark lands.", fx = { offer = TODO_QUEST("Windrun the Elder") } } },
      choices = { { text = "Thank you, Elder Windrun.", next = "BACK" } },
    },
    elune = {
      lines = { { id = "el_default", text = "She watches, though her light falls slant in these lands. Pray to her under open sky when you can, and she will know you even here." } },
      choices = { { text = "I will, Elder.", next = "BACK" } },
    },
  },
  topics = {
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
    hello = {
      lines = { { id = "h_default", text = "I am Gormok, emissary of the Warchief. The Horde means to hold the old towers of these lands, and I am here to see that it does." } },
      again = { { id = "h_again", text = "More questions? Ask them fast." } },
      choices = {
        { text = "Which towers?", next = "towers" },
        { text = "Why does the Horde want them?", next = "why" },
        { text = "What would you have me do?", next = "task", when = { faction = "Horde" } },
        { text = "And the Alliance wants them too?", next = "rivals" },
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
      lines = { { id = "ta_default", text = "Go to the towers and raise the Horde's banner over them. When we hold them, our defenses are stronger, and the Scourge dies faster for it.", fx = { offer = TODO_QUEST("Bolstering Our Defenses") } } },
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
    hello = {
      lines = { { id = "h_default", text = "Whitebeard, emissary for the Alliance. Me orders are simple: get our banners up on the old towers before the Horde does." } },
      again = { { id = "h_again", text = "Aye? What else, then?" } },
      choices = {
        { text = "Why do the towers matter?", next = "why" },
        { text = "What can I do?", next = "task", when = { faction = "Alliance" } },
        { text = "What do you think of Gormok?", next = "gormok" },
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
      lines = { { id = "t_default", text = "Take the towers. Crown Guard, Eastwall, Northpass and Plaguewood. Raise our banners and hold them long enough to set up proper outposts.", fx = { offer = TODO_QUEST("Establishing New Outposts") } } },
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
    hello = {
      lines = { { id = "h_default", text = "Omarion, master craftsman of the Brotherhood of the Light. They took me to make armor for the dead, and I refused. I'm dying for it, but I'm not done yet." } },
      again = { { id = "h_again", text = "Ask. Every breath is borrowed." } },
      choices = {
        { text = "Can I free you?", next = "free" },
        { text = "What do you want me to know?", next = "teach" },
        { text = "What did they want you to make?", next = "make" },
        { text = "Can you teach a leatherworker?", next = "craftsmen", when = { profession = "Leatherworking" } },
        { text = "Rest easy, craftsman.", next = "END" },
      },
    },
    free = {
      lines = { { id = "f_default", text = "No. The poison's in my blood, and the cage is the least of it. Don't waste the strength trying." } },
      choices = {
        { text = "I won't leave you to die here.", next = "BACK", reply = "Kind, and foolish. Fight the master of this place instead; that is how you help me.", fx = { align = { mercy = 1 } } },
        { text = "Then your knowledge is what matters now.", next = "BACK", reply = "Hard, but right. Let's not waste it.", fx = { align = { mercy = -1 } } },
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
    hello = {
      lines = { { id = "h_default", text = "Stonebruiser, packmaster for the Brotherhood. Every blade, potion and bandage this chapel uses against the citadel comes through my hands." } },
      again = { { id = "h_again", text = "What is it now?" } },
      choices = {
        { text = "What's a craftsman's writ?", next = "writ" },
        { text = "What does the Brotherhood need most?", next = "need" },
        { text = "Is the Brotherhood winning?", next = "winning" },
        { text = "I've a writ to turn in.", next = "turnin", when = { questDone = TODO_QUEST("Craftsman's Writ - Dense Weightstone") } },
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
      lines = { { id = "o_default", text = "Good. Here's one for dense weightstones; every sword in this chapel needs sharpening twice a day.", fx = { offer = TODO_QUEST("Craftsman's Writ - Dense Weightstone") } } },
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
    { id = "g_default", text = "Anything rotting on ye? Ghoul rot, maggot slime? Speak up, I've seen it all." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.5 } },
      text = "By the Light, sit down before ye fall down." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm a medic of the Argent Dawn. If the Dawn trusts ye, I'll cure what the Scourge has put in yer blood." } },
      again = { { id = "h_again", text = "Anything else ailing ye?" } },
      choices = {
        { text = "What sicknesses do you see?", next = "sick" },
        { text = "Why does it depend on the Dawn's trust?", next = "trust" },
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
        { text = "Healing should go to anyone who needs it.", next = "BACK", reply = "In a better world, aye. This one's not.", fx = { align = { mercy = 1 } } },
        { text = "Fair. Those who fight should come first.", next = "BACK", reply = "That's how the Dawn sees it.", fx = { align = { mercy = -1 } } },
      },
    },
  },
  topics = {
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
    { id = "g_default", text = "Don't mind me. Just resting a bit before I go back out there." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Got hit by an abomination near the Plaguewood. Medics say I'll live, but I'm not sure I believe them." } },
      again = { { id = "h_again", text = "Still here. What is it?" } },
      choices = {
        { text = "What happened out there?", next = "story" },
        { text = "Can I get you anything?", next = "help" },
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
        { text = "The Scourge must pay for every soldier lost.", next = "BACK", reply = "They will, sooner or later.", fx = { align = { mercy = -1 } } },
        { text = "I'll do it for the living, not for vengeance.", next = "BACK", reply = "That's a better reason, maybe.", fx = { align = { mercy = 1 } } },
      },
    },
    help = {
      lines = { { id = "h2_default", text = "Water, maybe. And a word with my sergeant that I'll be back on my feet soon. He'll worry otherwise." } },
      choices = { { text = "I'll tell him.", next = "BACK" } },
    },
  },
  topics = {
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
    { id = "g_default", text = "I'm free. Oh, Light, I'm free of it. Thank you, stranger, thank you." },
    { id = "g_back", when = { metBefore = true }, text = "Another of us loosed from those things. Bless you for every one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I lived in Darrowshire, before the Scourge came. When I died, those creatures kept a piece of me, and I couldn't leave. Now I think I can go home, wherever home is now." },
      },
      again = { { id = "h_again", text = "I can feel myself fading. Ask quickly, if you've something to ask." } },
      choices = {
        { text = "What happened at Darrowshire?", next = "battle" },
        { text = "Where will you go now?", next = "go" },
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
    { id = "g_default", text = "You can see me. Good. Then you'll listen, because no one else will." },
    { id = "g_back", when = { metBefore = true }, text = "Still here, and so am I. You won't be rid of me that easily." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I died at Darrowshire, and I've not been allowed to stop dying since. I follow whoever disturbs me, and today that's you. Don't take it personally." },
      },
      again = { { id = "h_again", text = "Do you mean to help me, or just keep walking? I'll come either way." } },
      choices = {
        { text = "How do I lay you to rest?", next = "rest" },
        { text = "How did you die?", next = "death" },
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
  },
}
